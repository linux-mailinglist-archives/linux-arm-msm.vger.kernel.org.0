Return-Path: <linux-arm-msm+bounces-111511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PYtRAOIXJGoX3AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:51:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A264D87B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:51:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WnXrRivV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q3wAXqFL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111511-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111511-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 526B5300F5D3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36333AEB2D;
	Sat,  6 Jun 2026 12:45:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981DD23183F
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:45:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749914; cv=none; b=sOcpt0+h2+rS9fixi1ppw/hy2mXvB448pwBRUiaqTGuMNJKEcwjykoas8U1KDcWRS430hq6E0GtgvupyP4rSEogT/lqX2H5Fm7dCl5bYxQO0dIm+/321YjvrahD6xEB/fiPPmpk1Lj7Bc5pA4/5m3UtJF8D9/M5Afh4LR2DzW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749914; c=relaxed/simple;
	bh=K68tMINi2G3OI0ChZxfuj1urjtUiH+lzOo+T78XmCMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXKYNRFBEMO2QNdjmCJUgTRBLw/0T8pUiNSoC3uDtudZZ6UlQ20wOfDhR9APUxNFk9EMzOKx7GnA+OaK2YS/9scQ8rVJ4NsG0gqjtR/RVTNUwTR3F/4HAOMs1OGoAvhKWYnT1buGd0IdsbZH5XCyAvpm4sEoK5DrE919Q3yocQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnXrRivV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3wAXqFL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGNIF1301672
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k0Zfj0JL9fJm1GBJRF2u8tqA
	CoUoyKzIe8SPekuri94=; b=WnXrRivVOHXfEHyccUS+Zke59A9InMTU5cBoEXqy
	hCK/wfinQmCz8oMHkjHo0PZorfiLoAqk4UCPq2wSbbkIij3afQ8lPXhHuVk6JPLK
	Duu+HK6RamVSIhhoi3RJwVd+0VMif6kSdW7tBTocq/LngXbc6wrZCIMhG+HK3ioe
	GJv/ylBUQOS81ykQuVM/4aPYWw5gpaiFRDSErZ1bb0dL4I1JXsuCjKj0PtDgIfyB
	dofNIvqN495qyWbxWjrXG6BBemvOwq2qBAIqj9H803uUAuboR8Hs0sW0N/YutNr4
	HTrxzROIivJLHOGC/qs1h7jV0Mh/xyu9JEZZteRq0g2lgQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx68y1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:45:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6ce6f8465a9so3502479137.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780749912; x=1781354712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k0Zfj0JL9fJm1GBJRF2u8tqACoUoyKzIe8SPekuri94=;
        b=Q3wAXqFLDAPaOO63rcJCRRDCLw2eGji4zmjLj/JMcJ9XUA1Ldv+pksnZhwST7guZmj
         c3RMJis3UjZYLcSYhTAZAGrpsQSyPEQ7mLG05GusAHfbq1xQi92Yc3XctQ3Q7E2Zw8d3
         PBYjmAQKTEn4p1oPjNq2aRYoJxCOHOLySfoPwmv5ve3XoNpTXditzFbjHUD1KfA1typz
         sI9pMApOWFIWMaa388GDM8GbQdDmSfGwqnDELLiT3JGxeyJizgpWobWVo/G2nqoGBYN9
         iVvNTRpSDLitUi8BnQ2ELO8E6Zx/CSncCmvJi6Ll1aJOpoDHR+zGNV8/BU8wRR8pdu06
         838A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749912; x=1781354712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0Zfj0JL9fJm1GBJRF2u8tqACoUoyKzIe8SPekuri94=;
        b=XC5dm5AD+whmfuThH4mmjCY+zHdbpHwheMy8/ruiJsnau2Nkm7bbTR57FOdawzBkel
         TloiATR9cgi+BEEl7V8UQjrIPCwEWcSwIy4QZKRPnzrTM50cqiQD+pkdvEnpVNKCUE6a
         b355zlNXwsmhHMviifvREW8L+REfJ4g8C9LfT2CvoCJEIA34G5TRciUVxxhRf24csUxD
         wxmd4rk6sWG3Ur5mp9OVgnbFMGGsufNTdv6+DJkCKSQbMNiZyGk3DvhbdBZL9pCn8oX8
         Byn5/CWc3TkdElBY9yiYbK7dQXSONqe410Zp77jtF+niTSE1Oreip64SCuoo++2GMMjb
         XnpA==
X-Forwarded-Encrypted: i=1; AFNElJ9YrBp3d3pbPUV2Ube1k74HBcov/37mkbGScagLPgG12HsSrBjgoo3nb7nO/dACHx+RJ9526pInvxul7ZLD@vger.kernel.org
X-Gm-Message-State: AOJu0YyR52G+tTu81FAn1cDufCg1Bl0YKdAsYhNwfgt91jc42Q6W1RB7
	KxSmw5xUn8rm/ZKTBwlaX40ZB8iCXUF35vZPftlHKLcNfX7tsTHVVsQ6XCYv6s1FRzaLlypSv/u
	youpwUlrIKUbCEVhCe5g72tLuWBbwEfo2wlUtxcdZksLUwW2A3NUwZp+qv4AJ4/L8nYyX
X-Gm-Gg: Acq92OF/0OcyMxzM7nqDtsE8pVJLmRMmGcxRfBEFEttKHh+Psf5x3mFMqLR5sCmdWcw
	RLZKd2GAjb71m0OhrpxHrPmU1xu7yAuL8Svo514RLJxwUy3HL334eXNDPEhgR1rZfxSomTr24Cx
	KSAKs8E0GPn99mQECs949pwJjAv48EGnXDhOWV9f8lCBILPpK8rmkQiJxIS0PYX+ljRQekHd6bt
	YOR6YcEwQGw2WSBN2mLMjjf9Hxo5WoT0dTlAB3NxBhKw9CTnYZDB/JSjLWCcQrqfGs7iYWZLgbL
	0MkKYyCeSHp0VZB4hLyrupwKolH2vXMHpOhlmi7+AGfa2LaiCgV6QTBfkBo12lu3FAyV4hPuIJl
	tHcZVwZ9fJnp+PlXlojZK5KXVb3TrmPEeayM6f/Bvuu+FIJm7yTFXFlxTdBqZxiJa8iZHFRF528
	2WNqOwLqm08cMWApHFt72EpXR9j8Zn1q//xv4+YwyBncJdDA==
X-Received: by 2002:a05:6102:390d:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-6fefc010ba0mr4361669137.2.1780749911823;
        Sat, 06 Jun 2026 05:45:11 -0700 (PDT)
X-Received: by 2002:a05:6102:390d:b0:62f:3e1d:a55a with SMTP id ada2fe7eead31-6fefc010ba0mr4361660137.2.1780749911306;
        Sat, 06 Jun 2026 05:45:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm31249471fa.0.2026.06.06.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:45:10 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:45:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
Message-ID: <j2l7ijr56b33uru53wiyhjkd66pxusxopr4c7xmztlqfnztha3@xp6ciwnngcv2>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a241658 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ApsqoLzXgo-ls-ZfnbwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNyBTYWx0ZWRfX9T+UnxC2TV+K
 XBCMnsD+vfFm8dZaW2u4Hqw99hve5RFBxi4vZzScDA29MaHAeK5xjUs3LzN3X7fcSm1ALln0Lp5
 pa1BkqtDL7qS7gxlKpe34ahu/jitEinANYcW/Fjuw90Fr1WjfVfxqNVzf83V/xUDVFONbIoVVJ2
 +92H3yVJ7oa5tOLTDj2+0azxZAT1qdf+vAetXCkMEWiY2MarFpfmCC4X3AmfOP7OidPufkm4Wzz
 TK0EPLZZjrF3E1tOTCYwwqZ+0JDnZ6zXga1dkit4ZoWF1Zv26p+5q/5FK6GEfXJyV8100ImZM1p
 4XBl0HYI1gvTX3D6sNHgiXzGZcNP+jWOBZC/ZvCDdSRGAxw4eXMwh6tfobtnMtFmqlsd9PKUjBH
 x5lWnHv0lqOAQrfEyc+5srWym2755fzS9hoGqb9LFGqPCbKITZ8HoKSXdTQKqDCJ+mIAUpVTFnm
 tDP7KuzqyL+6hXztZqA==
X-Proofpoint-GUID: 3TfJ7gkRI-SAOHuDlQAqIb4CDBQBPGOR
X-Proofpoint-ORIG-GUID: 3TfJ7gkRI-SAOHuDlQAqIb4CDBQBPGOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111511-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,xp6ciwnngcv2:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:yepuri.siddu@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E0A264D87B

On Mon, Jun 01, 2026 at 06:25:12PM +0530, Komal Bajaj wrote:
> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> EVK boards using the WCN3988 combo chip.
> 
> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> board-specific regulator supplies across CQM, CQS and IQS Shikra
> EVK boards.
> 
> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
> with register space, interrupts, IOMMU configuration and reserved
> memory. The node is kept disabled by default and enabled per-board
> with the appropriate PMIC supply connections and calibration variant
> selection.
> 
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>  5 files changed, 223 insertions(+)
> 
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
> +	qcom,calibration-variant = "Shikra_EVK";
> +	firmware-name = "cq2390";

firmware-name = "shikra";

> +
> +	status = "okay";
> +};
> +

[...]

> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
> +	qcom,calibration-variant = "Shikra_EVK";

I hope this means that calibration files are common across the boards.

> +	firmware-name = "cq2390";

firmware-name = "shikra";

> +
> +	status = "okay";
> +};


[...]

> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
> +	qcom,calibration-variant = "Shikra_EVK";
> +	firmware-name = "cq2390";

firmware-name = "shikra";
> +
> +	status = "okay";
> +};

-- 
With best wishes
Dmitry

