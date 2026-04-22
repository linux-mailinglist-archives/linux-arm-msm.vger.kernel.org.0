Return-Path: <linux-arm-msm+bounces-104064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMkqABei6GnAOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:25:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF1444A90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A83D30210CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2E33CCFAA;
	Wed, 22 Apr 2026 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeELpqfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HljYoScM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CD3CCFC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853215; cv=none; b=GsUmI9ebFadNsC1e2OKq9BuBHvPZmFuAEpgtnjLthKdXt1rEWiP79WNistNu+w3cEKpzrHnxjxxFajiXfFQCCLbt376BX1QMtId2dO9DM9JGUQ2qm//f5PQFBoDBfFzSqLfwJSe2HhcnxVJALI6ekkjLVqD+vJ+iO2af8iIpXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853215; c=relaxed/simple;
	bh=hUDQ7M64JdHNrsmtirK0r1KpJORyq1HH8TrD5tkkBwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUyXk02u/KVIfsJ7YeCekTdhuqd2lj3D6Od1f1DS/8NOtyAEfMgH+yXGrPxULCQluRCrqwt2s4Hu3f8vsGEKRjBAJXuXt8zzXw5AN3oYCuDU311q1r+VFne/mTPZUbD3TDuLcHAf21OtCcGB+D8lwXh5zD6KEmDZo9CtwDOjCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeELpqfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HljYoScM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96EFR664048
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c1y5m2Brcj2JBYATctoKjn7e
	m42uhTmPGI6ylxN1t+E=; b=BeELpqfh+hY3QqVwDAjCGhUoHA4c/ObNXmPvXs6X
	qeKLOY9rby9/LuVNGmryN4SUE6bR9x1l52zCH3XU40EvTp6Y2zrvwruC9edXGP9k
	/+3NqG9HTdFHhAfx19Al56hbfgHaoqWybaSObh3Ry06GpffgE/Uyz3PWiRhES38A
	O5eAlGVRmsoQJSxi+U22F2eEOhIfSILLE24lRF/l0gjH9jAbTC/jWZxvOJk4rwyO
	3Tg/gEKcJG6IRd22X0ai++jHHyZjNmUaIHOnZb6tR+Cb5USRc0AckN3+Ingsgpwx
	uLMUniGHj2Z3PfSuzWVMvBP3tmqZMLdV/kjlICLWZOr6Zw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgr9x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:20:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so44316061cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853208; x=1777458008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1y5m2Brcj2JBYATctoKjn7em42uhTmPGI6ylxN1t+E=;
        b=HljYoScM4fO870wIojOjOSENSyVA9iqzvO9KwIfHzNslTHPyizWsvVLMxiAx5KW6Nm
         69Qw/3wjp1smQaV/b3k0wyGBDeJ/ngJwmcijtfn/JqSjaWIXx9nGGQjx2Rt15i712oMu
         LDLFzlZSXUNLysApQGmBazn9DScTXjZSuJOVfx4Vpl98zI5vH4sUiD1cAV6CJmYB7hZG
         IQoTpPlAQLgHmJ+HDvbjecnmLUvLSXO7eHGbBznLUYjRHBZ0k+7J2D/rvyNYXaT5bomB
         5o1cX9AzJysWFCaaT4E13pOUjr9eB6PXZyDfR7D97PsjSZK/p08m3yh6LWylcng730Hp
         HG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853208; x=1777458008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1y5m2Brcj2JBYATctoKjn7em42uhTmPGI6ylxN1t+E=;
        b=RkRh8tvLyLOiB/0ksuS94rh7gmnXhSk1TFvxVCYIlFeIhUqH6aBNYl8Gate1enS0e/
         CXFogsRm41tCo6TsQwDSW31IAmv3VC26T2BAfEnjfLKgkjRfoDnQG7rbVrpN773Nve84
         cH71hCJfrApMON0ESymk9G97VLRhkvhefqiFSsakJl29NdqeCIcDvs8KLrM3fBMLqjQD
         HCW+B9MRT5WZE/FseUQCUYvS2SWUvg5eAVqA2GO6kMT8bi2iAS9q2dVtQOUfzHvn45d4
         Wd9Hf2CNgvvbR694LQn1RIR9AmM8ebeUqr41gwjVFKJG4LyuTFMe3U/G/mj3ftL8U1kf
         06Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+YNytzXQ+bUBHcnO+QctueKYJLibNzgSA3X7VHsV/Dm7Dz/WQLtnZUFqGvtcy4xp+ma44BOjqSBoZHnP8P@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8NBJoJ1DetcjdCNROJsTwkFkqbiJim8UqGDYSjF2VxJwLXlmK
	i77k1/8yP/4noOxW3NKjxXGxp4rzIFQ8jL+FQHCOc0TFTi4qAwx4FT0guHWbeRzjCSerG3XaCre
	V8AjvEExfSfjRcy1ER/IWhKyIB5GB1dkwPkxkRl3eXE2JlURDXakaiY6cyEZujb1GZAvA
X-Gm-Gg: AeBDieuOksvd4k945g3UxTgiexifiT1IAd8XShUJr4Noo/rZqqy12YSgIU23YtOWRf+
	dtt3BoXRd6UbdzD2opooVrKtobc9hL29d00d4zut/Ciy3sq8nPUBtKsEIq/FvCO4ao94ZlbUzJR
	50rCPQMDht2xaq2tpLKiDHjyKNBBhskTlijKeVgYK+vkBxshFki6ic3N//FSh6RGVshRB8q8Tvr
	NFWO3VjafYS2/NR8cTBQyooU3ihQvOkIvzojyitoAueBWRkIiitGpLH5YtgdaCZUIg73xazXRPc
	cAo8DcQ+DTxDiA/U2uifAJ+DIUwS0CtyEdtNWA0+Pwqn1rS5mv13pXbbU4bjI9xw0EArMtwAZxt
	zYExulcxZRvZLuNYqogy5qPjiR1thTnJIj02arEcMqZl5k0U=
X-Received: by 2002:a05:622a:199e:b0:50f:b13e:b738 with SMTP id d75a77b69052e-50fb13eba6bmr113580681cf.29.1776853207703;
        Wed, 22 Apr 2026 03:20:07 -0700 (PDT)
X-Received: by 2002:a05:622a:199e:b0:50f:b13e:b738 with SMTP id d75a77b69052e-50fb13eba6bmr113580311cf.29.1776853207172;
        Wed, 22 Apr 2026 03:20:07 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55743c06sm38431795e9.2.2026.04.22.03.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:20:06 -0700 (PDT)
Date: Wed, 22 Apr 2026 13:20:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Message-ID: <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
 <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Q9aRR4bGWmSENNeLRvceI-uD8XcC1pqM
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8a0d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YbIFc_aPW5namLIE7VMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Q9aRR4bGWmSENNeLRvceI-uD8XcC1pqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5OCBTYWx0ZWRfXxTj+/dfA7pOM
 zPsOdL1Ahk7qxc0kzLUc+juOVbjf9XHRwNpYcX9JlWq8rnyoG+4xOmEj6NECa9YFq9lOzOZYBRw
 dMIwbgvFWUJgeZehnSPv4jzl/npVKhpJ3QsJSvHsIjXndFROeXjL7vSuyXVoG3H33wVtw3/wSy1
 Et/vc1KquPThILkmMPRNzjKxnQYjOZBGk9t7le0u6og797D11CRlYk0WFcVVg3fZ4zUUjOedsJH
 Df7W5uXCOo750wqO9HB77KWlShlreTpvBgmYjaHP0CU3JlhZsg4zlNCznpbKAZCWcBubvLe5p5F
 gNBbCV06spOmlEqjVSB3jiunDZX42+qCnp/4FN3Fvad+aAq4dZfo53lAfWEsoSCVXI/SeGpOAfj
 T+eeFuQkKEkVo122Ym+vUnIACfQF+qjKYVQcYR/+UodIIC63FafAwZc4O5dowfLu8QrHzvDkhZy
 KSA90LR/OO8ne2D49Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220098
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104064-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[a600000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DBF1444A90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-22 12:09:31, Konrad Dybcio wrote:
> On 4/22/26 11:41 AM, Abel Vesa wrote:
> > On 26-03-31 15:37:08, Konrad Dybcio wrote:
> >> On 3/31/26 12:37 PM, Abel Vesa wrote:
> >>> Describe the ADSP remoteproc node along with its dependencies, including
> >>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> >>>
> >>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> >>> combo PHY and an SNPS eUSB2 PHY. Describe them.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		usb_hsphy: phy@88e3000 {
> >>> +			compatible = "qcom,eliza-snps-eusb2-phy",
> >>> +				     "qcom,sm8550-snps-eusb2-phy";
> >>> +			reg = <0x0 0x088e3000 0x0 0x154>;
> >>> +			#phy-cells = <0>;
> >>> +
> >>> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> >>
> >> This is TCSR_USB2_CLKREF_EN
> > 
> > Good point. Will fix.
> > 
> >>
> >>
> >>> +		usb: usb@a600000 {
> >>> +			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
> >>
> >> Does the device suspend and resume successfully?
> > 
> > Well, tested with pm_test devices and it does suspend and resume
> > successfully, but there is this:
> > 
> > [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> > 
> > But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
> > all platforms that have them.
> 
> Well it's not fatal, but ideally this wouldn't be there. Maybe you're missing
> some DWC quirk in the list, although it seems pretty long already. Perhaps
> Wesley would know more.

+ Wesley

