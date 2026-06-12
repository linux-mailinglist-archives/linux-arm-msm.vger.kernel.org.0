Return-Path: <linux-arm-msm+bounces-112831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pDf/GxBWK2rF7AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:42:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4E675FA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:42:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VCmmIV4B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YVS8qxZA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112831-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112831-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A35543300AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F6226E6F2;
	Fri, 12 Jun 2026 00:38:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2A0277818
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:38:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224689; cv=none; b=kIE0+bwpxJGc9Pn7CAmN+UtTvK2zoihSjqeecYyKMUmkYKupOfUzTbEVirktV3XYA12y43EOjlIL4tzQegf2VGT91S6auE/zoYnNbx5YQXolrKO84AFheBWLaFEZYBL+zWOAsREhIsLxKJ2YGuvmEDtphf/1OdtesIO4ZzRxeOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224689; c=relaxed/simple;
	bh=SJBiY+R3NXDIgUlBkgFdlQY+VmNVDIT/j3xZbSG4C9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okXoanZFgIX4/h9vpBiFW1DzdjjUZjLyLYFstYgKKa9naBbe8H2tBr9xvWbqlqalWAPaAEeqjWztvJjugMcokKoBHv79QlMRR/S83p0k8SkGNdxpkddefDgssyLjkMy53A97sh9qJopuwvFk8ei5WC4M05yOcfLJWbgRI8dAlGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCmmIV4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVS8qxZA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSuKa1824310
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nQPjr36R0KS8hFdJ7HPSGHpY
	gXxnFZo7pMmgrnwmFuo=; b=VCmmIV4BLF8HY/vWbNEV6J+0AVqn10FwRTWIo+mm
	HPSKgfgWVz3+hJ2eTEUYbB31bDPe78d+vftTYa61YEBW01t6Dd0fGYLeH0tLov6A
	8CaumGG/UMGQ2vnm6Xq+UGE0j4MGab2UH5WauEkbsi7kuyp/48n55G/ux+2Xw8gs
	jvb5p3M3MmYdMBwzmj3rLxCEgpXVA69Uu2oqaaJ7HmXUh7Cgzid7NWQu4Y4dAPdt
	m6xj7tSNfjJKVw2I3PalXlG2EMWfAfMu3LCETcYTZC5Y37ni+dfO7wuMDAmWs/+o
	yUw2ogUHEUDr4gjdwMW+yvYkWNv/WW3FCXHyp6VYDanO9g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1659knr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:37:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-307fd7138b1so777688eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781224675; x=1781829475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nQPjr36R0KS8hFdJ7HPSGHpYgXxnFZo7pMmgrnwmFuo=;
        b=YVS8qxZA/R+NnvsK5YznnPx+FZcvraaYb+t3UKlL55rnRsoonvNlVww0u/20f82HOF
         zcooXczzPWPeWAIp27BPcsffFEkYLezG5C5gfSJ+aDVbj0/aGWHDwfvSUVI3H2iRdAp/
         x1TUp6zJCAhcBFuJEUVVCiNKQWK19mo7nip9bXXXz2Q1nRCMyyknZg8w8SeHa6XhlFvA
         kCKhEwPCki6z1RdtY02XUukk77y+ddXgZ0BhOHnA/AMcFozk5EcQ27YW4sV9TRWzRXwb
         27fyk69Z6nf00nbIiZz/2BPf9ChtMPIAU+nKsTCNgl2/sAFG/S0SRzz3b3k/pPfBnrjO
         g9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224675; x=1781829475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQPjr36R0KS8hFdJ7HPSGHpYgXxnFZo7pMmgrnwmFuo=;
        b=gppExCyY/EFrc4bgkTb4gCvIs+Ua2rIWyufY6ZioCWE0Sn1gYekLzyrN+bWfHSJB25
         UVnWFIQpUKW8dV9b/GeklFgh2znRiB00cAPSCo7xrOnXIKwozS3ffmNL2L6o+9znGFF6
         pWfr1IHJRna0jyTvh+f5SuRDy6bzgG9UYe1peZ3uEo0fi1T1sjWA6/Lqw3Kg3/wqK1fY
         EYbg6TMnr7pdJIr9jJHW6ycFY0TgHFIXfCmsq2sB9qi0t5+3zrVsbrDx72xaabcKjk0a
         p5cZTDzhNlid6jsaffoLKs3hFpburIlCCLn8aGmw1g9l2kAdE3ltx+wB664oOVrFiXZI
         swYw==
X-Forwarded-Encrypted: i=1; AFNElJ8sSQUAjVaWvslZqCGqoRKHg4Ju3yi7IJK/Gov1HYImogLsKnwpUiHbOCLeRB5dYzbFDwTjVc+rtPNGvBGf@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZP14EGqnS2YMAdkoDZibVJeDojaH7JpNIV94z0lE8k/6hpHU
	XZpOje26BkMoz5RLkwH4HBlYheTTcWHgeNmYaNSjLvvqNodbsx7Tkpwn419BniGrvW0tIaSVoSf
	1524ivIjJFhKoD/Ak6RrfckC5PyEEqeCgW/7aFwvfLrkLtjf29ajbwh5AkAJAV48laMOV
X-Gm-Gg: Acq92OF5+fJWz5Ome88I/0V8UgTGlnny7Yz6LMKpe2WNX7goSqTiipFyg1yqbDiK8Eq
	S4os2C41VdpCp4q2h1C/29jCWPd8g//rIGCsmqQVmVJfE/uwCeylwpkD1Dhgp9IUzqVZBB5KPvW
	E+XymE5PFXYxaPvwSmOQ5WFV+3yMxSTKATfG7hd5qRRWBnWpuzTGkjcQxjgl+DNrQWGEnkXpBi4
	8l3ZJZvltWJzljSgo2Kn4rcubwN9A8KXugLtvbv2wDiz3A+LUiTLvIU0zzAGpR+2Imvls4vUs3q
	YhyRmSQ6TRMncIrfpl96JwfpfHu9xeBWNhVRdqgToI5hlgOK4hNH0JleQ04PbCSZ2Cp9tVkOHTR
	zxkqbGaAv+jRPFjDQdU+GKQx63Q7ZNOAbWy2YMEmBjxMtine5db8cFhOSyFPIVcpGFhT0a/RC0l
	m8Zg==
X-Received: by 2002:a05:7300:3202:b0:304:630d:e4ec with SMTP id 5a478bee46e88-308200c90a3mr404663eec.28.1781224674616;
        Thu, 11 Jun 2026 17:37:54 -0700 (PDT)
X-Received: by 2002:a05:7300:3202:b0:304:630d:e4ec with SMTP id 5a478bee46e88-308200c90a3mr404643eec.28.1781224674095;
        Thu, 11 Jun 2026 17:37:54 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48e412sm1125354eec.4.2026.06.11.17.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:37:53 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:37:51 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] phy: qcom: qmp-pcie: Add QMP PCIe PHY support
 for Hawi
Message-ID: <aitU35BP+hnMlOx0@hu-mattleun-lv.qualcomm.com>
References: <20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com>
 <20260604-hawi-phy-pcie-v2-10-be908d3560db@oss.qualcomm.com>
 <h6fbnsqg3gcobkc6chzehy2ew5hczidzqulr3xh6d6u5kazjhd@ygsd26b3neyo>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <h6fbnsqg3gcobkc6chzehy2ew5hczidzqulr3xh6d6u5kazjhd@ygsd26b3neyo>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX/InGO7N1eKEA
 ggWABw2EM9untr2ChJi9z0DJrn+R19t6rSUbmCjMO+cAVaVDWMKCvxKOv4G5P8F543eB6GI8fDc
 jD+EpAqE2bOenE2sqdh2nEagItE0n5g4Ph1lV9+UkPkmGJbgLD/ul/E1bRzO0upiMTc+gngvY9p
 S3Ze/mW/aYrJ+TaUv04DQEk5UyqpXCre77HpX9ia3W+DPfIevVa6n1HAHjr/fcRGyTLAy7d9qcd
 rS8gLZIL8xz0kUl7za8GgRagMDMso0NGQLxkbWOWwcX7h30XymQMjuB8IlsnsiFV4URt4X2uxGS
 DewhnVpd2iGB6E1h8rraSoA15UlTfCuuCDWjBkTlsQtwsxuLdDhVJZMjNX1TwfC3Jmuo/BIxdft
 izAKL/3sCiDfJ9+4eC9qndckeBod5Ki3HYyGYqUbJuxSEvneRm8UejRG1uzYIgHKpf4T23H5hqW
 gwXvTuo8I6a4XfYuhAQ==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b54e3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3XJrFejPlp7lr11Lrn8A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: SNhT9YBLQ80mkaa8OSkNeYWW4BRp91qe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMyBTYWx0ZWRfX97bftBpx6TEI
 XN57uu9jn0XjJ1H5VXv9CzNN7NdUlJuFwlRHekJ/Xl3RE+yQzoTMCHtEhFdXLuAFsLtfo/Z6sJ1
 dmwZujIAt8/wKTn7PRVTDIQxBG4w1gc=
X-Proofpoint-GUID: SNhT9YBLQ80mkaa8OSkNeYWW4BRp91qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120003
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112831-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDB4E675FA2

On Mon, Jun 08, 2026 at 12:29:54AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 01:33:04AM +0000, Matthew Leung wrote:
> > Add the QMP PCIe PHY support for the Gen3 x2 and Gen4 x1 PHY found on
> > the Hawi platform.
> > 
> > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 380 +++++++++++++++++++++++++++++++
> >  1 file changed, 380 insertions(+)
> > 
> >  	u16 rx2;
> >  	u16 txz;
> >  	u16 rxz;
> > +	u16 txrx;
> 
> Can we do what we did for QHP and reuse tx instead of introducing a
> separate txrx offset and data pointer, etc.

I see what you're saying. Yes, that method should work here as well. I
will update in the next version.

> 
> >  	u16 txrxz;
> >  	u16 ln_shrd;
> >  };
> 
> -- 
> With best wishes
> Dmitry

