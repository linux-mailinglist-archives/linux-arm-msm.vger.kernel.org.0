Return-Path: <linux-arm-msm+bounces-111077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m6fPC/S1IGof7AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:17:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08E63BD18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:17:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AKO0kRCc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NLgiLP0W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111077-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111077-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B34793057E2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 23:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C0840C5B0;
	Wed,  3 Jun 2026 23:12:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904372D1931
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 23:12:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528369; cv=none; b=Xu4cOgcPDkWakc2ugW7gXPcUveNIcCfMkYQE6AOlW7uTRr740JOgz83K/rwT++IQw2cToPHgEf9SeEQiSuAUgIbt7nD7GeWppPN+Uz+CnB4xszf6sNHuUWHyXao+XcabboMzKBkGTOOiYBAjGRim8WY7UVScEcHuqOGM+XYzs3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528369; c=relaxed/simple;
	bh=ik6qRM1b+GSOzYVmRNftG+yVTmBox6vYkCB/RLM8Lso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbgPPL6vkiVRT5o5XT9rdl/dcJ/VaxUO4JofkgJJrQ5zhga4S0TwgT/V3maLgPvbL+dF8tV3MhcvE76vZ1JEA+S/wlOgUHxGQip/cICFJ/oYGmNW6G3wfQy+1XPRPJxbKViqtwpMSptMkGl4Siy/HoqNzFjYpSbnB0rv1DQDlRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKO0kRCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLgiLP0W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653I6rDL1994316
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 23:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m/Ok5eZP2WT5DjxR3Pgcz9Pv
	ezqkWw2q1gsOHrEJ7Lw=; b=AKO0kRCc4FDL0Exl+w9EmkRmbCgOCv8JV7dF5sf4
	Xzk6TaJzPOo2cmh6tnW6DzwFGBFmYwhKOZ1i2RbCBHE3PmpCueZa2uBNjAdt1M/M
	uUsP17oebLptspUQmUra8ebiwLAr3hLP0ixLkCk8WQD7c0t9DZ5Q66KduzYXG04/
	zSLCshI8fbZVbNFTjuXbBN32KGDnDMGk5D6NZkwJ+tE+pkasYogjvtHeRNQmzJMv
	SXJi0xul8oDXT5Lvdu2Sm3mmo3oWZXWoSZW1XkYefTtY4OFWNMoj109gmU9SHehb
	uhdY+JZpifSrRvdm+leYkLjqNHWy8La89tMIaZLGmyRbZg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8ps183-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:12:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c67361f5easo1661161137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528366; x=1781133166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/Ok5eZP2WT5DjxR3Pgcz9PvezqkWw2q1gsOHrEJ7Lw=;
        b=NLgiLP0WyDX+MbJbDcYB7talpPrCRiVqMe8aqClf5f8x5e2OvNcgAGskgDDLDPtf8h
         /0IIyYFarQNUmdgUNtvN8ha4cvVdwW7AZ2w3HOl8HMHNELCwRR9V8biJYwqgNMPOIpqs
         fXGg8DCzLITqH0lTxIXXqFmyn6AzZP+KuMV0A66I/ZpUnJpxEBFg+LJ4KSoXc9tAk2xi
         MZyF6g7x8cmbT7tqd19uyJd2i+4F9djLQj4A6g1F0U/l6uoo6SkYdqw3bBMyxh8eikmz
         3vD8DNy1IAZ+r9E97kOW1Vd1mzPTKPEIFznhOYXPhuflVWrc8MzERhQHg38Ttbu61OMe
         5zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528366; x=1781133166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Ok5eZP2WT5DjxR3Pgcz9PvezqkWw2q1gsOHrEJ7Lw=;
        b=UgoX0HlTnEWhALxqp1VhnUvmKbb2ejmNwVYRl7Qd4DcA0a8HU08DGMAhvR0PS58Hkg
         +2Al2171KWAD2H/MqiPnmT/RjJAuMOEzXJ+ndLk5umPXrbjbxM1uFfbE3sJqYdUix2Zb
         1SkVTG3hi6QvdZaS4490P/jEX60BTbyfa7CKsCjaneiMkMtPA7G2WjEaGWa8XgEAvrxN
         2s2m91Kg+f7YQpT2qjeGNAxT+mpaEeriZELUYlM9Kcf5m6Ez4+q7VTae+xdgs0IhbryQ
         nU/cmC9XJIVDGcGZFIrYIIa4A081kTxwYOV3aLpQH+2r8V9S37cuSBxczJ6nEbtCapa2
         MH1A==
X-Forwarded-Encrypted: i=1; AFNElJ/iMC+/xyz/bpqo0LMGlfe/kyIDzck5oNnY3wqL8pGpOxhVX8jge5Xghs9hYflAACG8eqGn5TsDIvQyObmo@vger.kernel.org
X-Gm-Message-State: AOJu0YxarNkFAvqpA6I0W7kFJLx8GOEZZdDZ+K8I2rxIqmSPKhYD70OY
	ZyezQsN6L5l4bGf1SxDgq3LDDcbvXJS1v0QYUHG9x4WnVOkQcJZO2x2BZjfRHVouzze+bTeGYf0
	j0Uz+RFv/Ax8HmYfvZD2T4s8hkrEH9WgcTe6GQALBR9dzyjaVc8zuhuB7El2WO0x4lZGP
X-Gm-Gg: Acq92OGFxyT3Sj1oro5RFTnFHHW1m/Wuf+fA6JDKrY+zF2U9uVqS4xJLbM2nFtqlGKf
	k92r4O9i0QfNtRh9AT0MKb0OvV1ggajAv9ivEnugoCeSEJpE4AabZph0mycZyCRIC9w5ZPLThOj
	EOXnFIu2e+rFt1NbzKmEWdaAVIkHESJ8EXAA91MKzVPs0B222ZEvV7myh7QuKEPc0pMgwxaBRPB
	m2rYIIynQrG18NbWPOlE4k0lMv0vEWvCNhXZI4GoJvIiZTqm1jKRgpwMaxy5kVEBhuebGbLn6KZ
	fyWDXnnPrS+0jO4Vng3mAMG7UoJ0gmh4QgGKzG0HW1Y4THCcxNZur3vqTBGrXt/2ffra1RiuacI
	lfGQrWslCYtE+CIenzesAkpDlOnO80vrRAnone91Nrd4jVNKW9HlxGIR1NdCSKHnfxychlQc5uY
	x3DZD/cDFnGZMmSGNGTTFcZ+vg/nB0mvNONiXV9LMbFOgq4Q==
X-Received: by 2002:a67:fd88:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-6f552a06f87mr522642137.20.1780528366044;
        Wed, 03 Jun 2026 16:12:46 -0700 (PDT)
X-Received: by 2002:a67:fd88:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-6f552a06f87mr522622137.20.1780528365620;
        Wed, 03 Jun 2026 16:12:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm870868e87.30.2026.06.03.16.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:12:44 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:12:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] soc: qcom: ubwc: Add Shikra UBWC config
Message-ID: <2idag2lmgvmsqjixrjr4y32jfaa673h7jrei6pjjn7gm7ybppj@n5zycvdpmw24>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MVAH2NaIrF7TEiqBMq2cD9F_eLuCVAzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfXyaIPok14jWqZ
 CPZ1rQ/JgMviMZqm0lKdOeOHBcEk2AyHn4uibsMKTDLuOhUz6cNCU2f9Ilf4l+L2N1guaprOvhS
 4QdD5Y96mNKliM+e4V7xtgI0H7sRyyGtnpl36Zjw1Ocb4VrRfTkzDpDuosNtTKU89HjKqAxq4Tf
 BPoEXaRXeeNwrYMtQ3e1Qpl5QyiRoYcEaOlRJoRECtpxfOqKl2KCucZ0jbW70vLP4UaQmC3OXTV
 dHKNwWUFBEdytj7YT75KCQ+lM+PxTosMiU7kXHU6uUDDgZ4PnDMI/BTFjecJIEDOpojZOILruno
 2VGUr+KdrfU49Vmqw2q0lQUbbQ/6udYtEnd5mDObmyfo+YIVLSm0ztgyVUBcx4UsfZzmoXLRlCY
 FUSIvOlDRuPtsG9EtfxIm5pbvAL/UbE3fRo3MvwK+4860kia7HNHloPmAvsiHSNVOIxdtSvY39r
 O/K1l7rsdGxVRKMxe4A==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a20b4ee cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Y4AeZ4K9FrMMlEv3RhwA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: MVAH2NaIrF7TEiqBMq2cD9F_eLuCVAzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111077-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,n5zycvdpmw24:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A08E63BD18

On Wed, Jun 03, 2026 at 08:29:29PM +0530, Nabige Aala wrote:
> Add UBWC configuration for the Shikra platform. Shikra has no UBWC
> support and no highest_bank_bit setting, so use no_ubwc_data.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 3fe47d8f0f63..01dca97e2671 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
>  	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
>  	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
> +	{ .compatible = "qcom,shikra", .data = &no_ubwc_data, },

qcm2290_data

>  	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
>  	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
>  	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

