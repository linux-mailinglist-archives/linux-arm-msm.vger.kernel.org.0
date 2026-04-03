Return-Path: <linux-arm-msm+bounces-101740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APz3OEI30GmP4wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:55:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F23398936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38C163037C34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 21:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AC5364EB5;
	Fri,  3 Apr 2026 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbGcCPnA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA80ytiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD693264EA
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253278; cv=none; b=hIv9c/GM4iTfQyfOHBSI1ikOuhX6ggc3fM/227Ejys5iBbFqtX7EfnVWXPQ6U5o9VYiJzaxJD92Cgwudx6d3S3dZmslCYmimJoGdgm/TMKaZF+7Nxr5M21Z+cfOulecATE9aDd/y82MDbxgA/cW5Tji1eTUoRgwJdodKk4oBumE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253278; c=relaxed/simple;
	bh=4PyYqCMRHxxU5QTdFQ2bY9UFxws/ljt2W4NAhD0wt/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyWTqYapllHfU2bypQSg+bMzT2xHOLeAE+VEODZGIRrmAm4+c0q4OIjpFbVEE7Tyv3QGjKtkBdGARPdNPb8EppcRe1do7XsC9qGZvY8aBqJXfUx49yRuupNcHJ/njluYKPKPDLAo5OXsc7f/RiFXPDL+bTWPSl6KIIIarlJDQK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbGcCPnA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA80ytiR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Fuxr2258452
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 21:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y9zedheblneIseqLyTu54++r
	jDJmuqlr324tiZu2S8c=; b=SbGcCPnAGCPNv/biaWHt9nHjaT5RCB4GXbpDrmi3
	EvWmYPFqdRIwO8pLUp3d6blQxLEiTkCn8520ia4PhWa+W7cQXLWjKqQWmFdXAINY
	J/VJeuwvru95PT2hgz2i1znNjyQetlACoMbXNkl9jYLXEV5hDQiHK+pXhAxplK/J
	NXfMKFOzP/leBf2NYPOrzoiKWv+v0d5AFyGOr+kLoMffEn1iVgT3yLgp0sLeBtng
	2fZXJi+eNlKRmOOnxuo6PAsGcreci7PhauKJcUMgy89+GDlMIWrGFT0BUUnE+kZU
	WNip0hAzGLj9+8rZibY22ENbLSA4nCyP8qyGFtZwK8JJ1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn20vad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 21:54:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so64857061cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775253274; x=1775858074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9zedheblneIseqLyTu54++rjDJmuqlr324tiZu2S8c=;
        b=PA80ytiR2JAM4Gs408LRoN/NVYo4lX0iVGdWchgt2w+OafD/UwF2VgtjEeyrLJ9/fn
         s/ghR2i/sA6LFf6rRBSEU/ia6xt9pe7TMi3tDFo7R8R8nZgi8pqgHDSAMWVribqhZdKw
         ZfmHCg4uFGOMdRFr02kakeGjgks792hiEvIeqLrBgVB9oyONnIMqJqW9W7mMdShd8XEP
         j4KZIAMlP61xKHSQ3h1vz3us6aNKUS1A98vK30ALqtVImgJaPzGo52tuG2zwPtJH0ZSP
         kNfaPtu+MLpftDZUkpUpH4CTCoKdnxx63YQ5v8j+0kUs7nyivuIqVn2opiC1BZPBUZ8I
         Ovhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253274; x=1775858074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9zedheblneIseqLyTu54++rjDJmuqlr324tiZu2S8c=;
        b=poo2oz8y+nbZYmmZFhXD2VIhj9s/p5Bkw/o+6x6WO884xzvIKqw2XOHRwZNsX6LKoP
         KUUhBQb8GhUD54tlgaI6/BGQ1I0nIMVcy1VQ/+J5mT54Eqqj8fWCxkQjsJCkasbwyNst
         sdkmhi/8A+QrWeqnnAik+un3kIrQjjv6NtBxVXtwVmBBhg5pk/zwQIcr1GOTRmGPgwUN
         rWOmejuJ6+yYYxnDhSfvfSTbe7phtMaC3BnCD2tjuYKv8Xl2c5jACrH36+p1FDxa6oUg
         6dNgypJakoiq2285BN6cJ/ek9UL6CB1zlHN+wFPra4rGBHotFLqQzrA6TFRxB95Izdse
         AtuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwu/Nb1LwFgsI7DRr5vA0hNbm61YKphnOyNvI8EO2Le47goL801/NF0J+QoGsN905zBQDUPYVrmuezYtxd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4OWLJs1e9N4enzYtMwt9P0UzYyQSFCtseJdct9M1xznlkKvq
	shx2sRLxTiIrarT5edeqvG5s/+RaaprQnjzyW/qneDs0ATLtoMP+hpo3oXiRNBM+2MOhruIkoUm
	XkK++0oTSfRTZse1TTZfuWzw+ycl95m6vHU5qJftVKF4GPXbJOFdyK3KDOOvUUP/SmrNq
X-Gm-Gg: ATEYQzx7BM9biVXqQ1Fmm1rY5XOgbYEGo9JFzdhJFpFeuCiNwA01euxKHudRDHEti8p
	mUDIaXUZ5aUM/9rI8fyeA6iaz/Dp7/NZ7XB+WZBHuUoVwsfhc7Qzx4C9JK0A8boXPy5HDMIVJFq
	qWjRHHIGJo9Y0ofl05Jt29pNbBWLeYSsbrKqVTQrdR5YyahCnCYD4eDp2sBNWX08lv9kKRm5yO9
	XwIcyB+ht5l+HKHDSMte4vd25Ww7diaBVpqUzwR7WA6zjijFK7tk+tQHrzJr7ybqosJDbctJjJE
	iiG18nWBPJLF/uhwOosCT7zxCKNGy/9Oy/k4ezD4eQk6GNRcijn+zDbIqepO2EsJRxtkAf7sAuM
	I1HhG9rxwpbvCNs6JXLQv50sFtkSoFkR2oYnI25Jkur7wEmDPhHGXDLU5C9JkLeRMoAl0NyS8S7
	mAm/LkoP2Jlx9+MLFgcEf26H/HxpMNP0DnTkI=
X-Received: by 2002:a05:622a:790d:b0:509:20de:4ad1 with SMTP id d75a77b69052e-50d62614c30mr58338061cf.10.1775253274035;
        Fri, 03 Apr 2026 14:54:34 -0700 (PDT)
X-Received: by 2002:a05:622a:790d:b0:509:20de:4ad1 with SMTP id d75a77b69052e-50d62614c30mr58337691cf.10.1775253273514;
        Fri, 03 Apr 2026 14:54:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ca32ccsm1714618e87.37.2026.04.03.14.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:54:31 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logging in pm8xxx_read_raw
Message-ID: <35urrjc3koye5zhlxatdsr7t2djuml5ueyhhazcucow3q3g5f2@pomnrrcwu7qr>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-2-29b50bf821e6@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NiBTYWx0ZWRfX6GB0IQrAA1wM
 yTOmovB+p3h2HpPUNYH7Aba0+LN7zUrcewKXUecA/pLTjTRVrc5XXHnoSZsrzbAgEy0a7A9wdD+
 tNLlEip/HcmXgwgLYtaq34bwwCDgSN+peftsdLUXL/7AOYrreRGCcG6/OuGZsKFU06Im+fmxjfo
 3xb+KH6Hwpw5OP6DUxGWAz1XXqtOrAyI/kbht1JEgrSmbIb2AudzApgkJEV53X0TRnMz1mCPjN+
 5EUmwGVD4VFvH+SeKd178QZnMbovo6MYjtnKW0y+AAfeJjFJF4oDHhiQ/5hSO3tdXjp7F6HQwwP
 f7KTe7LOvQgEEZu+1iXFADbnnJ5XMKkGEhtUWLUqtIaLqO+HA9TRrJjYW/Mo6cHeupXSXwtcCoO
 y+6AJLbgscFpal8i/wqlfJs0/dHTeKGc0JliIK45fDQk0R4WkWH+RJTasMkadl3ABrn5kX+DpuC
 k2HJdEGoZvLrigp4eWg==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69d0371a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wxLWbCv9AAAA:8 a=5IoCURV5UOmB3lB6u-QA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: fXUWjXvzGzN4IE84u_ArjPA_Zo3SnCUS
X-Proofpoint-ORIG-GUID: fXUWjXvzGzN4IE84u_ArjPA_Zo3SnCUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030196
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101740-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,smankusors.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76F23398936
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 09:23:18AM +0000, Antony Kurniawan Soemardi wrote:
> Remove dev_err() for missing channels and rely on -EINVAL to report
> failures, reducing unnecessary log noise.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Does it also prevent users from spamming the dmesg?

> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry

