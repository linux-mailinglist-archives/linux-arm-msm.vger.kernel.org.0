Return-Path: <linux-arm-msm+bounces-107394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLwiKIyzBGowNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:23:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C2537F21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAED931D3098
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C564CA26A;
	Wed, 13 May 2026 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKhBglmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKNVRZET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D34406271
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691106; cv=none; b=lrI3uDeH3k263OHwCR6HqsEcUB5gxToIM+XsR5Q7g6VefIXJCLTEMyP95VsPewtdwu6G2IRjbbSCa22fv/Qbo5IHnrYcCajO9fKkrODhFmOno234p9Fwbd6jHNpzShYMGM9BQnweDcyF/T6UR1uFb98ojGRrUx2jOFkPmI/Rnjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691106; c=relaxed/simple;
	bh=uquoSwa7ZwAvpTOAIW92nV9OPtPJezsv1BSkxTCjGQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVFyzVtqVtWuYWTDu/cA/YJpnOnvqrdXdDBKpkDj5Xcz4a71tuCNfsP2gZbBYl1MeNZ34YVtNdZgXxeGgrHuC3BQ/WddGDu00L9WVncYgeLJRkG/VpOCC4BJmIBi3NasNURIQC8WO4j9CGPCB15PM49Q9Xzqi3+Sgwm5ygFhAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKhBglmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKNVRZET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEm1wR2887818
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kvW9MFUmG8rvh5PNkmsY1wyy
	sIDeA/uWWz+EQKpqk6g=; b=OKhBglmbyQEX6oq9vBhZaGVssws+8Oa4lvLJQKfB
	4FEJkO4YRuPf1HRAdUShy1fygbwX1pfjz83GjEUwa93LLuDPghfBuLMvFuTG2SLD
	+65p0KgExqbkudiKV2L3KmrxwRmWK6rQVhZrlmOeYqa2bWAX+GcJA5dtB8wV3MiC
	GnZ3NhJtQRhAf+nKH6KnRWLrfB406qwwwvtg0i/brx3tQ7mz47ZA+FOIjO7TZx4I
	4kb1qi66BpS1Ytc8S25d0HiTqTyte/pKRc0O9kDA6FXxAa/VYyTTRoUVFDq585jX
	2c4sPuGmX84QWsN5ESl9w2jikrBUf0wOO+0tNGV5gplOaQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghx3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 16:51:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-634ce585b41so2068731137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691102; x=1779295902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvW9MFUmG8rvh5PNkmsY1wyysIDeA/uWWz+EQKpqk6g=;
        b=cKNVRZETc42m7gaWzcrpWTJw2qaMhQITATap973a8X5aw7m+fx3qEjzERGXAhDtf4g
         PlkwDLpjQ5NnYQ1wrrfj2vkPdmfBa4Io5uS74aZidvqSp3XqhOPjW7VFX4/Bagh10U9b
         kW6JuODI8OxwGdt+EpwR0oRyTu+O252sNMBxT09qZhJnQhWku7m29sR1BFP0QvgRrFI/
         FnlZajzmjReNJdotNJX6FLuz3SZ5xQpqtBIchxYSy6xVuywNwZd6jzUKspiJrK3rAaYj
         Zw/JOYhH3x1GhyCU+sAY5RahnJodLIvqTReWQZPuK1vqFA5x3NDqefBB3tdyM0Lw2ugM
         R82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691102; x=1779295902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvW9MFUmG8rvh5PNkmsY1wyysIDeA/uWWz+EQKpqk6g=;
        b=kfpWsygTRhSCpLmv5PTkqzn52KYTD8ZR2f0U2bg/TavVpjSWFrNrnykheqGTmhb0bl
         uPNLiNBjpRtpzSolB6lj239T+uxe3v2/ONE93SS9WF6kOuDus//cqsr+feBTgZWQQHjy
         0+56u1HqiKqradJYIUYrp8lTfKQE4nQxGFdCEptB/GwWvu/a4xPB1xfIW6uRkv71NxgO
         BGA4MHYlPoWoXn1DPNV0inT0K44P8Ug3beNQJmm456ajQZ05vn/LohgX1J7eb6ZynS2L
         oVuTvwAqeey+I0sENPg4jOKDmlcEdqEY0HrGCHrniZ8Vm14B6YDSaBhvitHgzOY2CQda
         i8nQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2wDj/6D6+YElonvw4qEL98gvelNGgxl4u/heKkL3DE/NNDnQ0dyo+QdTZ3bth0DcSsE15Yslci8C9XhlO@vger.kernel.org
X-Gm-Message-State: AOJu0YzXCdf//JRs+JXeIz3GM1ULp2Pq3jDi7HMV7klZvd7a6PrDjMbY
	AQzf+bsUm1PIlMX/RcwDsGS5xUV32g95uxBAnpTym0/zfNubIfGb7Jns6d8GqctK0VnQ8BSgzmV
	j7tfLJw8Eh0LcpBpy/ft08GukY6p8fsa+hL1Z27NEsqUfbGwocZHBCT5Ly8qZxKURyrwD
X-Gm-Gg: Acq92OECAmZRuQ2CU4eXEFEwpLsl1eMJdVVfwYZyRYEkWKABh+lCEsusZlwD2qO10ST
	jSeX3AhgBIr8s2qoWezv0Apk1pQWphXFuX1Lo9u5SR+s4iLIQhgIr3JVbjD3gbkKn6I5OrhGWl5
	oDKHSnbUAqborp5UxrFhyrc3+JODlAgEwf8wnUSajEE6OS8zDLZhrAoCkI5SqmlTfTvn2ryMkj4
	3dFFJ0RgGtXuo6T/OLwLmS6nqjbp7wQYjrX9eDxilnlmNSFnfzpWXThu7qv+mrCUIKKkfz0wq4S
	FicRoJi55sSAW2dGB0EIeti/IWTd/LtBQ3pKaFVHyg5BbWf3mP7vuEOq4tKGR9NthUcQqIuEbec
	w/2z/3fBghCAjxWiwt4l/WUxIrmGAii3BEfunHVHhh50fdaH9syxopD3jrVwgXDDML6VHv+QSeg
	3a9bWoklbATnjAFjN/Kinoh6DnObnpL2B6uSY=
X-Received: by 2002:a05:6102:358e:b0:631:7781:fe89 with SMTP id ada2fe7eead31-637728ca842mr2437817137.7.1778691102147;
        Wed, 13 May 2026 09:51:42 -0700 (PDT)
X-Received: by 2002:a05:6102:358e:b0:631:7781:fe89 with SMTP id ada2fe7eead31-637728ca842mr2437801137.7.1778691101711;
        Wed, 13 May 2026 09:51:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955dfbfsm4156067e87.46.2026.05.13.09.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:51:40 -0700 (PDT)
Date: Wed, 13 May 2026 19:51:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Message-ID: <ergnufuk7qx7b3xsccdifdhlwfoxka5k4y6s72zpqvcfmv4uxm@brakkpiqkqhy>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-GUID: F_7JFuCLWeMNd9hwg2HKTgwr3bG2seSx
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04ac1f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=54KNg95dvv-uSQ5X8vIA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: F_7JFuCLWeMNd9hwg2HKTgwr3bG2seSx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MCBTYWx0ZWRfX1nDBvDGynAC5
 JlGFerIt6F0N+xqOU+N5ZiB2uDGpRiq6GapyZMDqSI0xeZMiPUhaKbGDsJWTOkRPJbzKKAd5o+E
 oqgKqEAocLqYe2UZjLOZJgcRDk1AFK0QbTNTONFZV/eu/oMa6gi7ybcOmV3JaEofthvnyCM9vk6
 dJlR4IxvcB091meTAfALs0pLAdSCJlbY7JJt9EDIA9svfXXStUfgxMLZpBG5RY905nZygEnWF3C
 ozWq6ZR1wrWImM8Mof423IXIkZm8iqNnUb2ltQS7+GJX0H/y+E8454Z8J0JB8Zf3JsUW+Jg0li0
 8oLMjP8s9UqX8zUyqn0m+4qr4zAxQhCWtcRVkE8hyI3ixMvPfYpU8C9kEO3htFfFjZinufUilxv
 cEGlEDYb8MFnt3Mw0HhbN7eMse8mdI/7A+1Gfk9i3F8+O/j7mTcRog2Rggp7Q0mPv0Xl2c1qQz9
 F/jvahwify0+Bg4+mWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130170
X-Rspamd-Queue-Id: F21C2537F21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107394-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch,poorly.run,lists.infradead.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3da0000:email,3d90000:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:53:17AM +0530, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index bab654bbd6d0..26a4de9c8d45 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2597,6 +2597,47 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,kaanapali-smmu-500", "qcom,adreno-smmu",
> +					"qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x3da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +
> +			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
> +			clock-names = "hlos";
> +
> +			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,

Please align on '<' symbol

> +				<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,

-- 
With best wishes
Dmitry

