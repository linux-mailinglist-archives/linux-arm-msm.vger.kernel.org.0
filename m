Return-Path: <linux-arm-msm+bounces-101992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO/VI9oF1Gk9pwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:13:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA533A686E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 21:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80A863004F60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 19:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0DA396595;
	Mon,  6 Apr 2026 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgs6yQR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYgpE0Cl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDF390219
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502807; cv=none; b=YGaHXuI7cKYWmwC2kWHYN3JxdsNSR5diwx6WNKxkhETunvG62Hp4T6g72s7d5WnJ3cJRy6GTRqm+B2jQ8kzhpBDlWlmakFzRQ6hov+53cTG6ue3Qu6FONPQ8deHsCOU+Pop853NTjmP1E8Na0V0XbD4I3YkjWsPl9hwmBfTaYug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502807; c=relaxed/simple;
	bh=BhRk4eacNQ7wngLpxy25m0q3g+rOFYDtHTTJQHw1Eek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCUk4uNs6trin0YKjMDx8SBeTM+Fdi4QmwPNFgJm6OE/sfhOt4yyTJ1benxKi9lp8oBq4vWzPbgFyw6BYomdGwp9Ojneh4NooX3hbl8mtR4+cGC7fG5d/Pw3175yOzivlA1xkVukJApz5mEuea/nE37nwmkSFtKzWH0EKKkNQmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgs6yQR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYgpE0Cl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636IgKQN3057016
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 19:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3rbYezlhiDGhlUghm6BR3Wu3
	+c2Zz6olfkM8PY799C4=; b=lgs6yQR0ZITvaCfJjuhEl6Z/+st2HD9tWGiF31mU
	yxXCDdNBHO+SgNC0WxIGawitmPeZpSU27H/Zso2OshHv6/O6e0LVMwJBvtgK8Xni
	2NDN86Q1DuUlc253KmaMyzki8XsZyY9t+KyJc3OtToL7jUksgi7oz2/MkS1fg2FU
	Kt1litaMBRPIs2tlhGkSQdkbwESNC3oL2FtjtuoDV4lTvPXyIc85aPAyeXXB9/LV
	sakqDCMGZgtT/m5oCc1368J/ldtePPPtMTC7hxNkhoVURt6lLa9/NcY4jwvriVvF
	AwX1jupBJLcsk2gDZDv6DCsQMpfdOTDBLp1khKHNXdB/fQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dce5js2wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:13:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so45293391cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775502805; x=1776107605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3rbYezlhiDGhlUghm6BR3Wu3+c2Zz6olfkM8PY799C4=;
        b=DYgpE0Clw8Gmequ1ddJfpk7hURP0LuELXWe1NmyzYwbAZbGpJMao54GoU63Y471vgB
         PzcOzwsU6G4+AK0NkIJO0tcrjKk9nT/MwvMdOrPgr5ALdGbLZnE8Cis5Ghm4meXgHAdR
         cxzhbhwwz9yOtyVeomr4FB6m9gDKC2I92YsrOyGazRakhKlHnLH1PguTzpz7Oa6aygyW
         VlcMv7+kPdGwhMfazQ+bRq6d/6LadyQb4Omkj2iEAcVBIVpmUkg9pSoBloVshIJkVmtP
         p8+tcAbEN+Y6bDPunGiISqhpMqzLtXmCmq47gRalHP2evOkeX74kztIeGzHnxjkr3pgB
         rAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502805; x=1776107605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rbYezlhiDGhlUghm6BR3Wu3+c2Zz6olfkM8PY799C4=;
        b=Z/PMKhQNKD1c4H4LeoLvKsF4tRoraD3T2znqu1NMnZ2RirwMHcpFeDX3fHhUpYN/HJ
         CmLgGeXEJLm7W4BOEGopMUqr7TJYax0+g5k8GxlPIUZI1tjyW4wr4Ono308izvYd6fFZ
         eZbKbKmTmrg48H5TxS7C3Rx7fxLp0w0eJ5vsEYhyEiLY0GsknBWe2qMA15H4qN5TZNGC
         YK0vQZW1g9J5T6CrrTwlNZazvLnl0HtuAeJYmU0TdU/CfXgavbNHZ+4xS1eR/JoHtfgd
         teCEqszX2IP057rPiF7QH3ZBpnEtGZyRqpWllBirGscSe78BfEixbf/qqIq/VKxWD3Zc
         urBw==
X-Forwarded-Encrypted: i=1; AJvYcCVCgqunLMw71p8MpjjeEzWYstA7R+swdl7nEJ7wSoDkYy1aks2+5oc4fGBxOOI4U4Tu39N24L3tgc5CBbgE@vger.kernel.org
X-Gm-Message-State: AOJu0YwbwgmJUNp+/zSrSIiYJnQejXhHKkf4YNWCnFsB4NapSVpPzrqZ
	549uS/lCEBLyKJOHz+nU80hj9d5mWuW7b1w4nfmWYttBDH6vbe3uYVTQibKHdnXrAjKyq3yB+rm
	ycCBr9Z/blxaTf4rA78SOiAK1GmwK2yR0wxwxr6k0Hdhvb1bFk5rR2ClpdURT10Ki7VSO
X-Gm-Gg: AeBDiesqWpxicWNJG3YX/qXu6hx9ABHNO9WppicMOGWmHCIfDsRx+ZQrWq224prEnYg
	BnXmuz4npUJCta9D4aOVLD+5AIIXD4MQ3Y1uASwEu/jR4VgDj1F8LmRGNXm5PSzFjMxjJQN1wpr
	prZIfV2biXaxpHQlie9KcOtty2s8Z/p1SagkvBCxVkQJlE3aWb/lcNdt9UkTw1HRno8uHYnq9Qv
	+y+fE/Yn3cQp6kec3OYVqW5iNZtKjxeShoCOysaFmikq15PjsCZkK8cv4SuGG1FRF2w44MInOGd
	z7rKh1gAwYsFG40FKj0XHLxK0K9HzZ5t7QSmZ7FWl7/znT1BhnLtZXlBaFG0zJY/hGcnQ8NdwdX
	O1j62LUFht2MTvO8yCiLLXY8c3JgpIPElElTemO5S3gZhXNj8PDy+bX95R8cg04de07ZQG+HKk3
	Wk13HfxWdWKFmVDhJ3Bg6iHINLWNmyUBSOR1M=
X-Received: by 2002:ac8:5909:0:b0:50b:8676:3cb7 with SMTP id d75a77b69052e-50d4fa360e7mr209813101cf.1.1775502804732;
        Mon, 06 Apr 2026 12:13:24 -0700 (PDT)
X-Received: by 2002:ac8:5909:0:b0:50b:8676:3cb7 with SMTP id d75a77b69052e-50d4fa360e7mr209812651cf.1.1775502804289;
        Mon, 06 Apr 2026 12:13:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccdefcsm3538304e87.68.2026.04.06.12.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:13:21 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:13:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
Message-ID: <ggkj63sjoeqedsahze423723qs6tvcgmlnxqn2usqipve2yktp@45aas5zypfzr>
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R9AO2NRX c=1 sm=1 tr=0 ts=69d405d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=iZwa8WBptBBy-baP3AMA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 78pxZ56HtCyTOD8R9f4AzQgpqra13Zgs
X-Proofpoint-GUID: 78pxZ56HtCyTOD8R9f4AzQgpqra13Zgs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE4NyBTYWx0ZWRfX+Wh/bllECRiV
 tN9NJ0ZhOMdTiuAi0As2jzWM8qw9k6y6avez1gq04Mh15NO4yhCL5VFUJPVsFekQwNTZVYPeAMm
 JTsUPBavMaWjFwaU00QCniYAtKjavboyks/VsvZY05ty7a3RUjo7/ajQGi/M+t33QG2zrfqtYGf
 OELSIjMw6RnefUh1LxqwXJyvzhcCNRsSAgQj3ejOwAwJWtgqKD3wToJh+p/ZO5ZHdSqyl9zIlGU
 5kOknoNbCTvfINhEl4WVnzztRtVqAZMp3/oBCU4pl4i6qg6rsbURQesABuIPCdDIO6rrRuTnGGI
 9ATPeQ/RaZr49+6jauDWwXAtHh/z5jY9LVuLU7OJsWzwWiVgpnzsVvlKiUqCohF9y7LuoX1kAjJ
 UgjcbJiBjt+naFNa7ri393PBMWxMoac38MRQfrNXoIh03Dr6LGkOUBXF07ChoDOvjhdwfHk4VYG
 3pmxFOtQU1a0zRivNdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060187
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101992-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,7c8000:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.13.187.160:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEA533A686E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 10:00:36PM +0530, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver.
> 
> As bindings allow to specify 2 clocks, add iface clock now.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index dda4697a61b7..5e6b659e8719 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>  			compatible = "qcom,sc7280-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
>  			reg = <0x0 0x007c8000 0x0 0x18000>;
> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core", "iface";

Inside the schema the clocks have maxItems:1. Please update the schema:
Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml

>  		};
>  
>  		gpi_dma0: dma-controller@900000 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

