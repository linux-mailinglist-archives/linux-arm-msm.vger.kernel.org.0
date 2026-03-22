Return-Path: <linux-arm-msm+bounces-99065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNXjNpI3wGnxEwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 19:40:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5C2EA562
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 19:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A554B30010D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 18:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A280236B076;
	Sun, 22 Mar 2026 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtHs88tH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PseATBtK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6054B36403D
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774204814; cv=none; b=RxH/cG2gIzOFwzabs7va78/VBYLqOBxjJtzh33zuj2R4b4Nd+gxIox+SpIJPzp3fBKNvixzRfh4jhqTrbAnKDI2df5ezoEsgVsL5cMelp+JZ/B4M0bSG83eokUxYh+/+nJ4fP1J/4ezSSILrLYOn6i3sJ4GA2wL8FhA/M6wofFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774204814; c=relaxed/simple;
	bh=h5HtI4g89HHUABB364A0BS005oJU8lHafRA4E1R4ppg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Odjp1A0lcera/y/nbMQCSNkM0NATCB+LXWFuclGulJ2Pv5K3ZARLfVZwQdwcNP8CxQEC76ir1B+EVRk0RTi1xUbCKwebf5vPhRJsMtMMYxjlxc7u9qqpnKRaN/3mHLojWAXIROxvJYSs4dqI1ClRZjMsrBSEok1kdR0npXXpGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtHs88tH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PseATBtK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7jJ1Y1684319
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6WnTGWvbfme9vkK+WWLMjVHb
	sxN7MWU3P3klxEyldoM=; b=GtHs88tHqh/eyJ8qk0MX3LkpYaDPpqNSkuCV0Asj
	Zzeo6sIS/1X6Y1OAEBlQlDTf7WZ8iOB1fFTDZLF1SQnXefFYeC3+39qCcWm1Mgbv
	QtGnuU81rWt0TUjozHfC78j8w5Hd6qfHmXUctpzbroxzLGZAWajNwX/rEsJ1+5s0
	iSj/x2UtLuu5zd2Ll3Pov2qSdyorbv8qaXlEsEqIKskgjO/KOqbRS8xi1gQtY5lz
	/+RZZdjdBTcyhIhXYw1+BepFcEN034ycCs5isqLnrHDyqlso3umcD9711lrTWnE1
	uqIAz+3iwAgqjatNtyF5FzI+NtT3xEHnQpchbof/x6+QJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8gsb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:40:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so264505361cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 11:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774204812; x=1774809612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6WnTGWvbfme9vkK+WWLMjVHbsxN7MWU3P3klxEyldoM=;
        b=PseATBtK+UAWUr/zguI7WHi9o70le9VANvSQZoI6MshxzPcTBsW9yhCTbz8Ve86M53
         I1aFk7gnlC3FHIBnR1pcW9h5QMRwBsvDY+mox5QkPsY8ydhv3hUgFN/YgZOqfjx7k0Hu
         /QcZoQnFN0jWmXhIx1p2mvyGm2QykOWdezbQS7R5gw/6DXfeIwbzR5L1baU10fzvNlJg
         sRDChvv912uqce6M06GkNZJp/Xf+zHA2ntOeFkpJZ/rTRZejGxEPJrAHKy0vyD0qQeJF
         HTwJHjQzJn0TdeqsIJwX11upb1E0TxrXug4gPWGRVzW+6hnkGGHPLVTHFmAzhmrLOUrV
         q/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774204812; x=1774809612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WnTGWvbfme9vkK+WWLMjVHbsxN7MWU3P3klxEyldoM=;
        b=OoT6K8inaomhQfatSTSCb4bY1xkxOsLOCmbWHGke16dQpX81RgacgbF4YtJq1NL1H/
         xZotn1yF9peI/JT9nYyNe8edaXIcL4la1SqGzsqTamPzLBwsNtPmwGsAozm5Rc7BbKm/
         NkDw8mBqrTpijscleF2xyjQHvFKAeT6Gz204uhQ3pL3DfwY+uQVYAYg3JVzt4dgv8TBW
         tcPtJg6rAZ07vmghJtJDTZ3v2AaElo6owHAGfRBRSk5ZDHl+I4AAK/OalkEjGNSNNSzm
         jUl55QXcjLmhnr/REYSHW9D7Ct1+geEmRyv5yLiYvu2nR7nbzcaPNCbzUikcddrpS41k
         91Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWcLBk8J41l7Hnw71EzK1m/UZGpYI6/H412tJ+xJlqkiAT+75oL/P3iV3+9JOFHv9aw2a+4RIMvSUH/SZF8@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+/lYxSTV/MRhj1i9l76iwVyKr0UuCdMju/PuMAKaCGG3nrLp
	dC2hqM4RYC9DtLxV1uz2ZPHRETp99ku3pnvju1wnjiK0FXauArRQfavXJsUf0dyOOS26gR/AXVA
	6Ew5X8zxdq12HXVi4r72afK5pdBQvCP1gqNSdIrZLsTnOHVXVHKviK2zda4vfVOTfovSo
X-Gm-Gg: ATEYQzznA/twjg2Y5scDmjNQlejOB2/qnpIB3MphphWIvcmbarVyvdYs76430wEI3zQ
	0EqhhrfkxS6g+adcNSV19H7Ae5uJUYwFqoxf1TkuBt0ejEG9X7E6D1KHOpT76ceMf+jZCsvdMDH
	rYPF7knTkgzeVwP0CriX7befcu7vZ1EWow4Y8xUEMzrDkWMQ00P/c40xH2MuGAVRkc7Eut9A7li
	lAIM9nGIAztI+iFH6jgo+eEIoQBoyVL/dEmlRD00bSC3PNcZc+VTuExrokIb97jYYDL3m3v6dPQ
	Or7U4MPFi0iBSVjBHBJyn0CbQdFLd+shGK7DzMXw5eboBTtkhqpl3+w8eZZLsUFWVhk6R2Lhg0S
	Iluw/VgqNEflOSsm+ki7ODuukfALCk4/ZsrNzk7X4BxThr4zRcsZIDdr41yiltFJWqEErz0RCWe
	xefao4zDIkjPjLvfvfAZhsd4Q75QBNOSW4O9Y=
X-Received: by 2002:a05:622a:1922:b0:501:1795:9d52 with SMTP id d75a77b69052e-50b3753dd41mr150905691cf.33.1774204811714;
        Sun, 22 Mar 2026 11:40:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1922:b0:501:1795:9d52 with SMTP id d75a77b69052e-50b3753dd41mr150905361cf.33.1774204811278;
        Sun, 22 Mar 2026 11:40:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28520731esm1892470e87.45.2026.03.22.11.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 11:40:10 -0700 (PDT)
Date: Sun, 22 Mar 2026 20:40:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
        abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
        kirill@korins.ky
Subject: Re: [PATCH v6 1/3] firmware: qcom: scm: Allow QSEECOM on Samsung
 Galaxy Book4 Edge
Message-ID: <ab5mwfn5rdcdufbx7z2ddrydtexckcla2trc2jlxuqhwhmsxpw@dxbjoksougkv>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-2-mstoretv@cern.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322160317.424797-2-mstoretv@cern.ch>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE2MiBTYWx0ZWRfXwVLiUuFlrqVa
 aKe/qZTaXrWaB8xyI16EKHN+pFKhP6EwCd0Tw43MJZKaABNEqp1ONzI4G5DKmhLs8X596qTgrE5
 fwR2NnTPkndRXCBNVAMMto0xJfawlWnk1H6+oSJYptvZae+lIq48gxkgLx3nQAYvZQDPjuMpmXv
 ihugwto9IoPjewsLoRwZ8AbsH6cYdXfDa4YA1XDJqoklXVa17Q5UH2+7shgDrDgpfmOAY1eY/DI
 ZW70qaVpzgUUPQp7PN0wocqhw9kmsfVaZVAbPjaGhfCOqVg2o88SsCdICFe973Hw0jVrw/zXK/h
 JhZnPbibxWFEzYuZjWfRDzj7OU8XlEKEMvdfnY1AValfoAApIq/W9zlvwXl7o6puMHlXi5SOL78
 pnK88XbeEYF5bxmZ6czEqmtr8v88l88nSj3mQOHykzabOm+D/TyPGD4DGB62fFNacl8JvnWko7j
 yA+JBF9gL9cENW+fogw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0378c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=GXGFvHOBr2iSkcKxInMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: oJYXD11N4nWXjXqZF-cwim4emoqIZDod
X-Proofpoint-GUID: oJYXD11N4nWXjXqZF-cwim4emoqIZDod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220162
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99065-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 72F5C2EA562
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 05:03:10PM +0100, Maxim Storetvedt wrote:
> Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)

Missing commit message.

Also, please don't send next iterations as a reply to the previous
series. Always start a new thread.

> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 5c4375a7f..5d3de476c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2318,6 +2318,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "qcom,x1e80100-crd" },
>  	{ .compatible = "qcom,x1e80100-qcp" },
>  	{ .compatible = "qcom,x1p42100-crd" },
> +	{ .compatible = "samsung,galaxy-book4-edge"},
>  	{ }
>  };
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

