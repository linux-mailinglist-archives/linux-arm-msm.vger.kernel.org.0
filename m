Return-Path: <linux-arm-msm+bounces-93770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id g/tUDFWknGkYJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:02:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D21C17BF8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A220302CD28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4821F36A02B;
	Mon, 23 Feb 2026 19:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkzn/thA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsirKypp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C129C36A015
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873361; cv=none; b=ACB4hCOTqT12cM5GhYYMMhjVsq0lvvmDzmB6zSqIeygbmCoyBPr8e0mWu3L5SOVqaGmD0UaXUOUAu0Yqh/XXbCFiemL6bvSROdan69WHix9DhdOZHHCbgILaUz6cBzlqyHcr1k7t28FDDYoOy55ZF6gtu4kysYK5JNW7eRCLZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873361; c=relaxed/simple;
	bh=QBZdeVVJP9MTk/GMFDCSuysII+qqcjoZ+1OFr322ngo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIuYlTXssnY/ehjcPyLf2fsBI4CrVzthtZLC2IEclrft5Nk/inCxLGLVPHiM4Kn+OnHSuMTaPaum/7krRiKfTsK1Us67ZZZPvBe5VUio85uAZj7ucBwlIJW31qheJZv842MutY3m77BnGPjMRLEj7VNeKPW3YUZQ1J467S4nsts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkzn/thA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsirKypp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGvRiC3478625
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PikIoqYsca28nHuFHtjaOXv/
	/rGl2xSBdgos1MFdmRY=; b=jkzn/thA/MNF6egUSq/ywBWSRCoad0HGed4Nu9wj
	gDg+tPqSRjfGFy40pa31lKZZkTOW0tHome1YEcW7n5dcEQt48X+u8CsOrGkPj178
	+jCi14SMv2H22U2/gPsqeiAUXRFxc/PaVGH+Sf1lIi3hujLsQOhNO6pGT4xvJtwA
	zV391GC9dNE/s4ds+grPP71u7qYWKWj9YTzEa/U9F4FNRZaXGF8CGJCY1BbWE0QR
	DMufFEBIAdWd4tLAYS4G5UvU1wsXj/XBqqym5IrOQtjMqAIPnmV6SBVgfDLYy4x1
	k6YarXyIpBBAGxqCHFg+ZIsjZzTzthZUzG6wXhPs1GLIjg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9rdcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:02:39 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679c978c609so8894095eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873358; x=1772478158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PikIoqYsca28nHuFHtjaOXv//rGl2xSBdgos1MFdmRY=;
        b=jsirKypp8rcALt7FikVMf9CII5xsrmEkNTlZxecHYCvu1Q9wwlUMvGS/c/ujf655VN
         AqmmbmD9AgrkEaM3V07IPKnq3KND/EAjKVy3VaF+YUMr6X2KYt8JzwQqX6fvoQc+bo1c
         E1hJS+6OwRAkoiQXd9lhc0pruhyRxm/bBaInLZ8HjXIOan8jxjxT2ZTzAdX/daVQO+KS
         E2m7xeDUQcQWCdsMGKQYnpKrBRMaoyq8w2xpqCqobSgp8ND3IpPR+ewhqUq5E3iwfskV
         7+BZtk6Z6eI60DTxGQxkt1Bnv+3QrtlRmx8EAaRIWBLBh5jkaYsUQ843JV6C9jKddwIN
         BSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873358; x=1772478158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PikIoqYsca28nHuFHtjaOXv//rGl2xSBdgos1MFdmRY=;
        b=T9urk4DWQ1t/hiSuBpttmb7eZfmu8EqAMf1vECJTPIB1wAIRh9uek7v0n+2hU/cmNP
         rjPIET3zwcfZIB163cMMbB9VbbcvyBIguJtF2ekvcEcbsEu+Q64lfqeOgHiXYoZfRCJr
         Mapdw1tDBSDQE7dIMIPoiq9ls0q8my/m0VT/0hS4PD1pzrkbvJ5P6WQ5UAm5Ij6i7jU7
         RHawuT4JhOzQx7mDHBu4x2qhtHCjUAe8KeFwWXi2xVXyWo0zorxtSFKtCOqcCLuxB9GK
         CSt8nvHJZlJoSUX+19fOdYxc7nZSgFw84giYt9yFqoupueLfNX68PPw7Vj7q4sf6VWjp
         +itg==
X-Forwarded-Encrypted: i=1; AJvYcCWERuGQK1x1Id5n6javLUhdD/pTNeqwCz71JB1TL83UYEBFJUATR5q0oo5+lIPmifLd7drozIYIG5rgvxoR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+fTYMXJBuvDvTEsRI5U6Mq2W9d9YhptQ3SYt8y2vABy7sV3p
	QDP4OB8oGUoXU8ABalu/zvr0MblvK8Ys2r/xjxliAvyvorsuJwc3miyE+2OxuilNkvfnAEFBGB/
	Kkp/kxVxzk8tbRUBysUPhglbnyyJhS3ikXDw53JlILbDYbs9GnYzpgPu5taR9IDvkEIFM
X-Gm-Gg: AZuq6aLj8ffrqZRaVuD4ZuULht398M92ZHhYr51ac4OwsnRD9Ao60Y7peblq67/ReX/
	LcOmmKrr/qVzdi/utiXXd4WhabyqG29ztdI7Z2nmJ4arrV/8rnsn+MpzGDX0bLC28ExE4Nimb0b
	HFTAI/u1RYbBxxMXBSgvJKc9pAf0JoBuZis0R2wxxbxW/fgQrV9QytxCVd/+e1CrnE4RCixkUJz
	wtvHYFCjOTnoPNWrqo0TKzTFMa/p6FZANikx7M95YkQXseSZSJBRX33BWP01bFFqiLX8+sH+8UB
	TmsEXg+PX9XmuMQ9HZRP4Nx4r4EAPyTt8oMe7vkqdgSZ7UiDEJG8Vo0SE2m4iA3Z0bPt/sW2ZTI
	7rf4E5pzB4H4Db5q550v0dPgwSrbrGAF1Hwm/2ucLV49R7P7Xge4n0EwE8W/QKXa0XjXJ8Hc1hX
	1MCDqPxkSHtCZvyd28eVXzvKfIB3uOWuu/QOw=
X-Received: by 2002:a05:6820:2019:b0:672:e67a:96cf with SMTP id 006d021491bc7-679c4684cbcmr4730027eaf.16.1771873358089;
        Mon, 23 Feb 2026 11:02:38 -0800 (PST)
X-Received: by 2002:a05:6820:2019:b0:672:e67a:96cf with SMTP id 006d021491bc7-679c4684cbcmr4729999eaf.16.1771873357615;
        Mon, 23 Feb 2026 11:02:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b930sm1765940e87.5.2026.02.23.11.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:02:35 -0800 (PST)
Date: Mon, 23 Feb 2026 21:02:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: monaco-evk: Add Interface Plus
 Mezzanine
Message-ID: <sf4jvwou4wtlxamwgkwb5c7adujz6dwoqwws2aq4z7jjvblbvm@fb5kqkt23ktm>
References: <20260222173545.3627478-1-umang.chheda@oss.qualcomm.com>
 <20260222173545.3627478-2-umang.chheda@oss.qualcomm.com>
 <a7777e5d-f9be-43c5-9f3f-4d84e16f6e89@kernel.org>
 <jncbztn4xohzns734i4o2hsherdshjgxqtiglh7zf2oz7nkujs@an24wf3txymy>
 <87e3de23-cee9-4789-87ca-e85826af7760@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e3de23-cee9-4789-87ca-e85826af7760@kernel.org>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699ca44f cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SHZK8wCcDJlr8EbK8bwA:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NCBTYWx0ZWRfX+NlkoEHcVXsp
 l/vv1BvzNJeniKUobbBsuQTJGQiE/lz20smKz7dRbYrz7/OWsGpQ6dXlgjku34Y60RU2boCTBei
 5ETVDX+o70789LJXx7tVnwojYcEtc84F9Hq+yg5HWUQD44PIBXgII3pwr+CrDMFkN/iYioZ1dKf
 gp6wcmK6lxIgxiQAB0bhAajvL5plOAHbSSAm5Ov9eWWqAkXQwCPHbUF6Cydh6EqbzUaz0H8Q9b7
 WuJ7EbkYLuhh47O5pbPlcm6ElBsYNDjk9HlajSHRTq+QpkRL6ywqcivga1f1Tno5XjdprUAo6Jx
 +igup7v+NLEgN1jZHhuLyooJXksykw7a9e2dPS82aQV/EIahvJNEzyW7rPdH7roQLhanmARKJ39
 x7ZdGLhYGWmaGfXVrHviNcew2kDdQW73LderJNdZA0X1oMkzjazJgs0oqQftNV5RZw3OXGrCfcI
 MaV6RBkao1vliEH2w1g==
X-Proofpoint-ORIG-GUID: B6uCEjmDUDQonLRIO10KcB6X1TI3Zb-b
X-Proofpoint-GUID: B6uCEjmDUDQonLRIO10KcB6X1TI3Zb-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93770-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D21C17BF8A
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:36:56PM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2026 16:12, Bjorn Andersson wrote:
> > On Mon, Feb 23, 2026 at 02:12:05PM +0100, Krzysztof Kozlowski wrote:
> >> On 22/02/2026 18:35, Umang Chheda wrote:
> >>> The Interface Plus [IFP] Mezzanine is an hardware expansion add-on
> >>> board designed to be stacked on top of Monaco EVK.
> >>>
> >>> It has following peripherals :
> >>>
> >>> - 4x Type A USB ports in host mode.
> >>> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
> >>>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
> >>>    - 2nd DSP connects M.2 B-key connector for connecting cellular
> >>>      modems.
> >>>    - 3rd DSP with support for Dual Ethernet ports.
> >>> - EEPROM.
> >>> - LVDS Display.
> >>> - 2*mini DP.
> >>>
> >>> Add support for following peripherals :
> >>> - TC9563 PCIe Switch.
> >>> - EEPROM.
> >>>
> >>> Written with inputs from :
> >>>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
> >>>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> >>>
> >>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
> >>>  .../dts/qcom/monaco-evk-ifp-mezzanine.dtso    | 184 ++++++++++++++++++
> >>>  2 files changed, 188 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >>> index f80b5d9cf1e8..9d298e7e8a90 100644
> >>> --- a/arch/arm64/boot/dts/qcom/Makefile
> >>> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >>> @@ -45,6 +45,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> >>> +
> >>> +monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
> >>> +
> >>> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> >>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> >>> new file mode 100644
> >>> index 000000000000..f0572647200c
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> >>> @@ -0,0 +1,184 @@
> >>> +// SPDX-License-Identifier: BSD-3-Clause
> >>> +/*
> >>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +/plugin/;
> >>> +
> >>> +#include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +&{/} {
> >>> +	model = "Qualcomm Technologies, Inc. Monaco-EVK IFP Mezzanine";
> >>> +
> >>> +	vreg_0p9: regulator-vreg-0p9 {
> >>
> >> Please use name for all fixed regulators which matches current format
> >> recommendation: 'regulator-[0-9]v[0-9]'
> >>
> >> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> >>
> >> Duplicating regulator name (regulator-reg(ulator)) is pointless.
> >>
> > 
> > "pointless" is a strong word IMO.
> 
> Pointless meaning it has no point, because the "vreg" is just redundant.
> It gives no new information.
> 
> 
> > 
> > The recommendation that has been communicated is to based label, name
> > and regulator-name of the schematics, but prefix the node name with
> > regulator- to achieve sensible sort order.
> > 
> > 
> > In fact naming these regulator-0v9, regulator-1v8, and regulator-3v3
> > make the name useless. We further have plenty of designs where there are
> > multiple regulator-1v8 and regulator-3v3.
> 
> The regulator-name is to match schematics. Node name should follow DT
> spec expectations to show the purpose of the node.
> 
> > 
> > I guess the preferred name, per the binding, is to not have multiple
> > 3.3V regulators in your design?
> 
> I don't see what you are proving here. The "vreg" middle name addon is
> not differentiating multiple 3.3V regulators. It changes nothing in the
> problem of this duplication.
> 
> > 
> >>> +		compatible = "regulator-fixed";
> >>> +		regulator-name = "VREG_0P9";
> >>> +
> >>> +		regulator-min-microvolt = <900000>;
> >>> +		regulator-max-microvolt = <900000>;
> >>> +		regulator-always-on;
> >>> +		regulator-boot-on;
> >>> +
> >>> +		vin-supply = <&vreg_3p3>;
> >>> +	};
> >>> +
> >>> +	vreg_1p8: regulator-vreg-1p8 {
> >>> +		compatible = "regulator-fixed";
> >>> +		regulator-name = "VREG_1P8";
> >>> +
> >>> +		regulator-min-microvolt = <1800000>;
> >>> +		regulator-max-microvolt = <1800000>;
> >>> +		regulator-always-on;
> >>> +		regulator-boot-on;
> >>> +
> >>> +		vin-supply = <&vreg_4p2>;
> >>> +	};
> >>> +
> >>> +	vreg_3p3: regulator-vreg-3p3 {
> >>> +		compatible = "regulator-fixed";
> >>> +		regulator-name = "VREG_3P3";
> >>> +
> >>> +		regulator-min-microvolt = <3300000>;
> >>> +		regulator-max-microvolt = <3300000>;
> >>> +		regulator-always-on;
> >>> +		regulator-boot-on;
> >>> +
> >>> +		vin-supply = <&vreg_4p2>;
> >>> +	};
> >>> +
> >>> +	vreg_4p2: regulator-vreg-4p2 {
> >>
> >> Unused node (other dummies don't really count).
> >>
> > 
> > I'm pretty sure this is a direct result of previous review feedback
> > requiring these to be added. I do agree that they don't add any value
> > in a system were we don't control the entire power grid anyways.
> 
> Maybe, I guess, but I am pretty certain none of DT maintainers ever
> asked for such nodes.
> 
> > 
> > 
> > So I presume what you're saying is that we should at most declare one
> > level of non-controlled fixed regulators?
> 
> In general, non-controller fixed regulators should not be there at all,
> except when they serve certain purpose, like fulfill the binding
> requirement. It's their only point.
> 
> And a chain of:
> 
> A -> B -> C -> device
> 
> is completely redundant if all A+B+C are non-controlled.

I think that came from me. I don't consider that to be completely
redundant. It helps in reviews and in some understanding of the board
logic. I'm not asking to implement all the intermediate regulators, but
to implement the meaningful relationship between end-user regulators.


> 
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

