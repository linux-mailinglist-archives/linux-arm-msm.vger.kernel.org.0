Return-Path: <linux-arm-msm+bounces-95475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNIdAxfIqGnhxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:02:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C2020950A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4514302C919
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7C642A82;
	Thu,  5 Mar 2026 00:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7wSwRQP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLzC7gix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9D226ACC
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668944; cv=none; b=qgZ3CfPfC5+1n3GdmCUcA6u5fI6anYIS3/OmOPRgd0ByQL2iZZihKOzX2chc7uiS5aszu73V5Q2+begl1SUET5c9KoaUvySFt9PRAqdjhlgZQJBK3S1kLQbl1PgExLB/kWu1QmKe2IhPW+eAfM/pRvNjzkunV835ylthaAn685M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668944; c=relaxed/simple;
	bh=cEd5aXnGj2lRzZDuAISbTKkYykiqsfVwLx1pETH3MjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C78KhuQrAPDA0FcKf++LEElQd/CG1RvYWhowZfHVqjP49LPKb4CsMs6SP1Yil31U/GpImQPXs8Z+lABP0doLW104wmNi3bXdDtYFzrC5QypuqcUpWWo/b0biTpnRTyhABL6rhG+7adjsCVj5TpLwZjPFNghJIQ0CIlRa40GCoFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7wSwRQP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLzC7gix; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HYvnN1455844
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 00:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=udBFEipzOpdtZ5UiZIiKV/jq
	6S2C6jk+6aYuSwMf3n8=; b=C7wSwRQPMQu7rAgIcnxLRbAepD+I5qzSTVx5x2wf
	RBx4ThITdCwkTre4V//9Mld7obuIbwLaoYZwuUPbh+pa+LzTO9dHw3Xe5Cg1wZbw
	vApIES98+gnSYhQb5rQFJXBrcEH7DMedGThsRlSCckc2H5gdeE0u43k+MsGAjktK
	0ZQx0W2pI/Hmg/eb72SeUZEglVOE/GUv6CzUqBZv2qfJFg0kXYEBGwrRzkydvPFY
	KGf675bhrBnsZLsGKNTEhCD5/qZCSiMgep0h8QdntUR9Vo3tHfexpIokWFC6YY5y
	46OkhylQqQxdqPQaTEch62D+nxQDOFVZxwoAxgjwKCVvLw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj182gwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:02:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948df60cec6so10374588241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668941; x=1773273741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=udBFEipzOpdtZ5UiZIiKV/jq6S2C6jk+6aYuSwMf3n8=;
        b=YLzC7gixBr+iZOhCCFMaF7dGVcbTPCi0jkGvhkMhsKNvbttBoD/FZhgPfpj3hawARk
         tSSdIbpwVkesu1ABJ4d3eaiW5xtCtVgUMaxrwnB2/2vXf51FeXX5mzT6YBQvGZgka+Oe
         El/eCXM1QxgkUbRPTw5oyMNDQeFg2TmR9qoVYToClD759erKwJrTRorX56NHSjV+cKu1
         lCche945wcJsqocbP8oHlB+EzXkdJdT53yxh3qIn9wLeVTqlNJ7LSHbyGHfw0A9Do5ZX
         Q8SeefC0qMcRoTzDo641s3juFK0lPzlTUbKHYAWs+Ur3grnyysxbReaFbz8+FTA1z0FJ
         Em8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668941; x=1773273741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udBFEipzOpdtZ5UiZIiKV/jq6S2C6jk+6aYuSwMf3n8=;
        b=cDgUIPO5ktDKOnc05vmsK5MACLXLMSp66m2UPsmrW6PTepZZNELShG2IZYndiXxGaM
         24mVtv+peM1AJoBtedp4YzirjBck2kXIkMre43uPbttUQtrJUIp8C+n2tTLhlJbC/o5W
         OMO++YBluHEqUfctCYF7MaQSd2pcEXBO4ddOPkrfjVGmoHeOxFeOHL6xKoRZhdFCrk+k
         zP06ICXM8NfVXTujTdu64XUgowjm003kJ5Fn+TpruCkA8dbzG6KFa3EwfmyU5II+Khsg
         pH+sgOzGI3mmX+W8TIkxLtSBsXtR+IjTgNY2wKItM0RRECTUpgFlLf3w5v38aLBq+7Zh
         Lchg==
X-Forwarded-Encrypted: i=1; AJvYcCVeiMk/Ok8bYF8PBSSayRYbre3QhyV9oR2zr8WLDxPC+gBH/uJ62rKbgEixtE1WCnPm8zVYhUgY7JLKG9yY@vger.kernel.org
X-Gm-Message-State: AOJu0YxSwckfqUs7V9dFQdWxyuo/sRWZyFT2q/0DYxwGivffhwtQES1N
	xX3+6E9q4TciE5IVy6lNqx////OJAKeAnbD+F+9FFRRkITTT+9YLOo77XJd2Jp34UNLICLHT0YQ
	tf51gEcDSU89wJ4zSPKRNNVSKDgi+67Ml4PCz9XG3Zp2RukYhVeONH4uyY7oylF5a4pShtrPi1C
	e0
X-Gm-Gg: ATEYQzwMgDjpLRqWM4Jt9G6AT6HOu4uJ6x8IhV4XcCvUdWz1ssLLrEVdN7NrMeWexkA
	p0lJz8+nfM8CMnrEc3ftRNoinftlyCt/AnDkFbZxNjDtElOK4R3oxezfg48kfGZUtPYux+q1dfr
	+mENxyhth6Q/lwOBty3pjnE1v9MPTvGz95Uwu27Cm4Oi+59/hc3yCPHRKRkah9LNJmOOVPwJxX2
	oA3OsmDB+LVZhtFEERReC73VukDRFvhQ4RJjiOMRTtgWD7vF8hNGE1+jLmACQh1R5eLMxEZffuY
	afNzhNJu2uEtyd55UKGPUanre6ZG27oIIofHbNuw+DvkoScMZiH+fC100X6nt/kYrKBTm5fIGMA
	AZ9rD2i5kTR8WxpsVeFtiboQOMSndmnd6C800UD0g7nxSpOuTHnuKNIH1GEzwPbJTKvCjHlAbNP
	kWbCtNcPtHzsB2ZftbuLrMHLDYCvgCZX3izqo=
X-Received: by 2002:a05:6122:8b10:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56ae74d4d6amr1811512e0c.4.1772668941559;
        Wed, 04 Mar 2026 16:02:21 -0800 (PST)
X-Received: by 2002:a05:6122:8b10:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56ae74d4d6amr1811475e0c.4.1772668941102;
        Wed, 04 Mar 2026 16:02:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a131b11e8fsm85095e87.54.2026.03.04.16.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:02:20 -0800 (PST)
Date: Thu, 5 Mar 2026 02:02:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <u4abdgzrlfijwymnoneb6xa34l3y6fpenlbidvej5cgfz2dzkd@dk37ihalaast>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <20260304-glymur_gen5x8_phy-v1-5-849e9a72e125@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-glymur_gen5x8_phy-v1-5-849e9a72e125@oss.qualcomm.com>
X-Proofpoint-GUID: hz0vAAaJvHJgvjZbxrtz_cH9H-9mM3yf
X-Proofpoint-ORIG-GUID: hz0vAAaJvHJgvjZbxrtz_cH9H-9mM3yf
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a8c80e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BvQctOsZpKswBag4uPYA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX74TBDTz2ra+B
 G8/JDhjkTXMb8T5r0Y4jMMveHJbs6d2VerK5mU5O6mefa1gAcrDkTeI8P0VII4Mh/3R8JKsMDVZ
 qf13Buz4t4ZLoqex0WfaDJkEhJH/AtiL7EaxsOXVCThMng8FQN7CV1PcrI5MEH55WpWz+nfPq/l
 2B307vE2Njk0+SSFXUMVa0Jhan2phIjeg4VmhVrOTuIiKBsO5oFupl9F8dtlgAuPN0WBTaItaDf
 hbml+TxggNso51d+Ug6kdbq1PQIWH2eR8l9s2EMtpRbd98IHKsU3F5OM+cWIzn+3ovlledvvz8+
 K+voHsMToTjSX163JV6Ogy86ZiqP62EPAKj6WC0kS9Jpd7FdZ0+56dZ9DoobY0PcUTcvFKiOOG5
 Bk/+AKmINZTYnHOhvMCkl5oA6mcfRTJpHB1aZH0+1BXcfWLviFI3wqoEnEAS+4id8xb18WMTe1S
 SilB3rgfmHihH88brbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
X-Rspamd-Queue-Id: A8C2020950A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95475-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f00000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:21:59AM -0800, Qiang Yu wrote:
> Describe PCIe3a controller and PHY. Also add required system resources
> like regulators, clocks, interrupts and registers configuration for PCIe3a.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 314 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 1 deletion(-)
> 
> +		pcie3a_phy: phy@f00000 {
> +			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
> +			reg = <0 0x00f00000 0 0x10000>;
> +
> +			clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
> +				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
> +				 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
> +				 <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE_3A_PIPE_CLK>,
> +				 <&gcc GCC_PCIE_PHY_3B_AUX_CLK>;
> +			clock-names = "aux",
> +					"cfg_ahb",
> +					"ref",
> +					"rchng",

Please align on "

> +					"pipe",
> +					"phy_b_aux";
> +
> +			resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
> +				 <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
> +				 <&gcc GCC_PCIE_3B_PHY_BCR>,
> +				 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
> +			reset-names = "phy",
> +				      "phy_nocsr",
> +				      "phy_b",
> +				      "phy_b_nocsr";

Should we be supplying _b components by default? What about the
platforms which might use separate 3a and 3b?

> +
> +			assigned-clocks = <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>;
> +
> +			power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
> +					<&gcc GCC_PCIE_3B_PHY_GDSC>;
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "pcie3a_pipe_clk";
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>  		pcie4: pci@1bf0000 {
>  			device_type = "pci";
>  			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

