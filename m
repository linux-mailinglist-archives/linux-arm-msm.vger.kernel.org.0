Return-Path: <linux-arm-msm+bounces-93559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLSDGrBKm2nxxgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 19:28:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89806170101
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 19:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C63D4300FEDD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 18:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DB0357737;
	Sun, 22 Feb 2026 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LB1R9IIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IH4/4sSb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3172749DC
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 18:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771784872; cv=none; b=mwup9aDtutO6cPmfUz3zEq43IlIlyqBtUtZwcyVtivIGXmXqUvxzTlE6HDzHYpAHYa057NfKdlyhPY1tx7cUa1YCkWr/xFR9qA4Vlm3+9uO53uVRqyjHhiRfXjAYhQD0Ugwe1jjP7abOogowPUD3foB/50wB350iG1GZoCzu3Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771784872; c=relaxed/simple;
	bh=NNftpgPzP2E091ERRnqtZVn2vkVT8VI+2oF4t5ZwIzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgMVekseCbZtUNLNyaIJhVmX9mEoWR3azwo+Pj57fgxluqfi0pmJko/EZC/zGbAM9eRNgJu62veyHR7xZKxIVOexAJkM4zC4o0CK2kx8q5MEuaawtU0TwzSOFkJJllZjMQqBb72nbhHvpy7GEyGPQSUQ1YUesQaHID8Vycy9hQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LB1R9IIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IH4/4sSb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MHv3jN625871
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 18:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jb3hjyUD3tMoU+zITBgMwrrD
	pLFVqnNuzDJ2O+O/fa8=; b=LB1R9IIp85OmlCVZVMGJvWixz3Xank5EHKADgZ5L
	Ds5h+4Dng75mVAolfGuSTgYnWmQPGsR+1nCRFEvI+PPA6ztCNGfzJsmzjAmF7hzU
	/z8NZZwBsrrBVAnEsyr97RF49NChphEYUru+1pFOlgoyhqQa1I6lS6GMvHN09o44
	ElFHAm3NRrHN+nEokhWknzpZ8+4rcJAl0N3M8tHq0kZRmQ7+osxrf2sRSDUjLlUZ
	6Oy6ETzaCGT5BEL1o7C/ZeeRGoNhClk7VwCQIK+rNm+7qJgPQ38hOeDGlggZYISW
	wzMmoIirv5Mk5bEdcKDb8SVA38YoLp8JrVawQ71v7zt+6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603jj8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 18:27:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ad1b81aso5471557285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 10:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771784863; x=1772389663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jb3hjyUD3tMoU+zITBgMwrrDpLFVqnNuzDJ2O+O/fa8=;
        b=IH4/4sSbyG53DIzryr0Jorm5ror05fE+kEokyBjfjfccrLN11+5Vyxpl6VEruMpx29
         1ch2NXJiPDLE0GrgZ275su9UYFXcDdAiypqnUWrF5NmZ/nWyc1mlmX8iRwRGpd96tCJR
         ipIFKyzJIKB/X5L7Q9Pwc/1IhtvQJlS2zBCssY2jCmsicBnHqhsfBLSpOY8Xv7FtarDv
         pJ50FgEsGpNE3gVJDzBde6LqZOwooGK0C1QPnWyfinp9y1DMsifLE58h+mTMyweXs2ey
         rMsr5yCG/IZnmRuShPvU2C+0kiiRciH3ES1L1RDEwnrmBFibNiBzzr4k0tXf66sbbo4O
         hQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771784863; x=1772389663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jb3hjyUD3tMoU+zITBgMwrrDpLFVqnNuzDJ2O+O/fa8=;
        b=AdTzQkdIXSBehrI4PGN4vkmTzMZGfqLwawlJ/F9ebccCt/nAUV+GelN3gNl3YfBU6Q
         vKEZ/IMLpD/Z0ZBcOK3OD7NURetB92UBxxeF1EqMXm+z3NEcNpmnIjMdEpDDzjln5Ixk
         HN2FBOS3HRYWTjWyUIZEacSl+TMjkVgP5GsFGioV9pGOG2ceRrpWIlaJqzho4dq2Dva0
         wU7iD5ZrvYoHSSh9xbrpMMvtOtVz0THs2BybNJMJyqiCdpjWlDB2l+e8irYzlT1JlS1o
         Dy+cJmZDasL9YCnF/ENMEtRaiKFqe/KwgzhSa3uyiJqGNhQ+f6Ya5bB+j9QWQZPzpkBM
         AgZg==
X-Forwarded-Encrypted: i=1; AJvYcCW1Maw7TJTRN18s88f1JLNk2mIQfaKczmUU07+XC4ivEYssgkX5Bq0lLrBRMjWaTqSYF3Bpzs3eKLcg8KOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxFVmPKuh+E3dG271DqMNpBOXgWecvRXq3dWlv0/p3igSneom0a
	9Q69u7DQ+KiRuGjYTqRobmqYWZ/GzCDQlOvKrDv1CpDE1ZTjtIxkVH47kecboYwf0zyMGBHsZD+
	4C1ms95b0TKsXZ/BCG2TXG9cLSX49DIdXqBhEJ6fQadIPjQw4tqI3xRYRcdqF7mReHM9w
X-Gm-Gg: AZuq6aIX2FZ72UH20GWdaE1n5XEGHWB0xDJMjlkR8LaF5oK3jnVvIdnaLKyWnx4P+dQ
	EGHQJNGVKUsBXPo0jEas0Ks4WiF5pUKOoahUuw0pGmmzm0gwx5hTXV+gHKzRqzvTJQ+tCvT6Msa
	d/sv/58fk2qYvu8cJ9xqAVJwLVAbS6BpkOewMZ11e5oCodAk6BrdxaqsmcjvjxRnEhxBfJp5qA1
	czGJz6w87/ZE6uMwECWoTTzzISpGO9bOi01aHZPn+W/DBMy/q6hP3BlCMfMOQ8DAnZUgboWw/Jd
	w0KLhcB/HoF0pUGKu1x8KqEwxwuj5rYT+ULtrsH53s73pXxNsjqbk/TciluBbNynWxB6gqkjfsZ
	u7J8a94F/PmRm/acaIpVTzfjzkXESy/CePQ53A5P4U/xyCFR9RVwYbzIXD6D0LF2x6VDVWUaFAc
	eddrO6G4QtQRi2Gadg4YSENCCSTXie5YUL64M=
X-Received: by 2002:a05:620a:199d:b0:8cb:4cb0:8d4e with SMTP id af79cd13be357-8cb8ca9dd5emr740399785a.77.1771784863476;
        Sun, 22 Feb 2026 10:27:43 -0800 (PST)
X-Received: by 2002:a05:620a:199d:b0:8cb:4cb0:8d4e with SMTP id af79cd13be357-8cb8ca9dd5emr740395985a.77.1771784862856;
        Sun, 22 Feb 2026 10:27:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4760csm1103670e87.77.2026.02.22.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 10:27:40 -0800 (PST)
Date: Sun, 22 Feb 2026 20:27:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
Message-ID: <at7j3kbdixd7aveiol37pwgudl2hcogtdrvdgcvgbbm3t5irfc@4nvv5ptoezyk>
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699b4aa0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=DUeAZ88jvR8M5Yoo4rEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDE3OCBTYWx0ZWRfX0uh/m2VDSpT0
 QR3oymqWPIDXOln2vHF8zD+4hmocu94zUqZIDMBTI/XY0VLy19cHTmaFGaMf81TeYTpAogBQgvr
 Jwf+Zp8BK8EV1DZnTk/m1atFV7+3X7RABWc14idP0XqGuOo0XweTwLHGFFaNXAQ9ezYDGMmWF2m
 xJmagLptnIr5K3akiCUIVDRAb0PMwG0LL8b40ycYtSg0/lUR+3wUU/lqItn5TyuM8/YA0oP7vQT
 iafNVsEqPAbRRz1Kp1R0AemVH4C3j6wNXK5qdGdtx1G+LpM1TMyh7x7X8ap7TnC09VbVQdAcV2/
 mBXqP6o3jCnVy7s16DBk30AXHcP/Pic37oqhR6jaCgEorEHrQeRXK96zEiZlavAcL1hF7aIDZm5
 KyisPtIhsMVmxvJRjUvAm1j0sl74mLonCWppQbnZtJTN/pu1wFa6HqpknxYuBD2HAKdRjXd0jcx
 ZCao9RKVE4IDj14iYGg==
X-Proofpoint-ORIG-GUID: GD94XYDEV0f3bNk21HDPDFfDqZuRmhCa
X-Proofpoint-GUID: GD94XYDEV0f3bNk21HDPDFfDqZuRmhCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_04,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602220178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93559-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.3:email,0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89806170101
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 11:05:45PM +0530, Umang Chheda wrote:
> The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
> board designed to be stacked on top of Monaco EVK.
> 
> It has following peripherals :
> 
> - 4x Type A USB ports in host mode.
> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.

Nit: routed to? Is that M.2 only suitable for WLANs? What is "WLAN
endpoints"?

>    - 2nd DSP connects M.2 B-key connector for connecting cellular
>      modems.
>    - 3rd DSP with support for Dual Ethernet ports.
> - EEPROM.
> - LVDS Display.
> - 2*mini DP.
> 
> Add support for following peripherals :
> - TC9563 PCIe Switch.
> - EEPROM.

If there is an onboard USB hub, please describe it here. Also, what is
the story of mini DP ports? If they are to be enabled later, please
mention, why.

> 
> Written with inputs from :
>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 184 ++++++++++++++++++
>  2 files changed, 188 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..9d298e7e8a90 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -45,6 +45,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> +
> +monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> new file mode 100644
> index 000000000000..f0572647200c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	model = "Qualcomm Technologies, Inc. Monaco-EVK IFP Mezzanine";
> +
> +	vreg_0p9: regulator-vreg-0p9 {

Are all these regulators a part of the mezzanine?

> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_0P9";
> +
> +		regulator-min-microvolt = <900000>;
> +		regulator-max-microvolt = <900000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vreg_3p3>;
> +	};
> +
> +	vreg_1p8: regulator-vreg-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vreg_4p2>;
> +	};
> +
> +	vreg_3p3: regulator-vreg-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_3P3";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vreg_4p2>;
> +	};
> +
> +	vreg_4p2: regulator-vreg-4p2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_4P2";
> +
> +		regulator-min-microvolt = <4200000>;
> +		regulator-max-microvolt = <4200000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vreg_sys_pwr>;
> +	};
> +
> +	vreg_sys_pwr: regulator-vreg-sys-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_SYS_PWR";
> +
> +		regulator-min-microvolt = <24000000>;
> +		regulator-max-microvolt = <24000000>;
> +		regulator-always-on;
> +		regulator-boot-on;

... supplied from what?

> +	};
> +};
> +
> +&i2c15 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	eeprom1: eeprom@52 {
> +		compatible = "giantec,gt24c256c", "atmel,24c256";
> +		reg = <0x52>;
> +		pagesize = <64>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
> +};
> +
> +&pcie0 {
> +	iommu-map = <0x0   &pcie_smmu 0x0 0x1>,
> +		    <0x100 &pcie_smmu 0x1 0x1>,
> +		    <0x208 &pcie_smmu 0x2 0x1>,
> +		    <0x210 &pcie_smmu 0x3 0x1>,
> +		    <0x218 &pcie_smmu 0x4 0x1>,
> +		    <0x300 &pcie_smmu 0x5 0x1>,
> +		    <0x400 &pcie_smmu 0x6 0x1>,
> +		    <0x500 &pcie_smmu 0x7 0x1>,
> +		    <0x501 &pcie_smmu 0x8 0x1>;
> +};
> +
> +&pcieport0 {
> +	#address-cells = <3>;
> +	#size-cells = <2>;
> +
> +	pcie@0,0 {
> +		compatible = "pci1179,0623";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +
> +		device_type = "pci";
> +		ranges;
> +		bus-range = <0x2 0xff>;
> +
> +		vddc-supply = <&vreg_0p9>;
> +		vdd18-supply = <&vreg_1p8>;
> +		vdd09-supply = <&vreg_0p9>;
> +		vddio1-supply = <&vreg_1p8>;
> +		vddio2-supply = <&vreg_1p8>;
> +		vddio18-supply = <&vreg_1p8>;
> +
> +		i2c-parent = <&i2c15 0x77>;
> +
> +		resx-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&tc9563_resx_n>;
> +		pinctrl-names = "default";
> +
> +		pcie@1,0 {
> +			reg = <0x20800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			device_type = "pci";
> +			ranges;
> +			bus-range = <0x3 0xff>;
> +		};
> +
> +		pcie@2,0 {
> +			reg = <0x21000 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			device_type = "pci";
> +			ranges;
> +			bus-range = <0x4 0xff>;
> +		};
> +
> +		pcie@3,0 {
> +			reg = <0x21800 0x0 0x0 0x0 0x0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			device_type = "pci";
> +			ranges;
> +			bus-range = <0x5 0xff>;
> +
> +			pci@0,0 {
> +				reg = <0x50000 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +
> +			pci@0,1 {
> +				reg = <0x50100 0x0 0x0 0x0 0x0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				ranges;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	tc9563_resx_n: tc9563-resx-state {
> +		pins = "gpio124";
> +		function = "gpio";
> +		bias-disable;
> +		output-high;
> +	};
> +};
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry

