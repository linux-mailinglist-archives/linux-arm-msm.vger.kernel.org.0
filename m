Return-Path: <linux-arm-msm+bounces-108292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPAVE5SIC2p1IwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 23:45:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E66695740D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 23:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C96B3015718
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF3139A060;
	Mon, 18 May 2026 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jM/gvOjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Js0zXAuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A4039A040
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 21:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140753; cv=none; b=p/ld6NVheo3pLBlX5ARW2Ac4OxsBlzwEX0/Z8g/hYNcI4RwPQ2EBbce+cTl4TGYruErRs3THuIb7U/LQ8KXUv90p8btZkaECrtMxRw+wgFAqRxXc14+RWwuKbsql9mipMNodA8AMYGFNAVtwPSHTkr87UXO7LGEQDzzkdlKDm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140753; c=relaxed/simple;
	bh=92tE+ZJDxeX5Vcwq5hmmYKZPdmAPn8I7BHosGfRrNZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TylW+zpgjDn+d96Wf/qKYtg2sIpP7rwf7BzjLnf6od+121I0aKEsnW75eEklJtly2O5ZlI1frbno5W0jr7VTSXFcfaub/Yopq/6Cm79pgEM/D+zHrgQDV2BMW4cWzDsLqjsaRiiojp5YCG5z2PQl5Q1U5wius9tipDnZNgqhE5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jM/gvOjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Js0zXAuU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IId5ao1250890
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 21:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aeeMHJuYduPDLfPtUte93/Zl
	OUIn79ssUXS0hhRxo2g=; b=jM/gvOjA5TJVp2GLYsr0nL1nm74/h5XpfJzWayfK
	kN6bdou2bOZLdw+tUkwyhkIrxKEBI3pSlPMAApAIxtuSAfLec324vMwS/beBaFGG
	wiaSDKVs6E1GSnl+wsqqdcZxnsI26YoNBm4Z+EebyqBOJD7xVpogd3bbDDWGRroG
	ObbIz2nf5cvMX6n8kp/r/4fr5Yse1uRLlf7OEgpzg5vBNV/QtKKkvLJF0vxT94yf
	JIxFdJGNLj4zTlEvrEgM8YGtXPrTanI6K1hy3CZAobE0XZMYWbhJSes8lbPWnREM
	3l4I2IQmEgL/Q8K94cxoPjrVyXuL+KBdGVhVbeE0SANtYA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0j6xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 21:45:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5163ade1583so60407501cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779140750; x=1779745550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aeeMHJuYduPDLfPtUte93/ZlOUIn79ssUXS0hhRxo2g=;
        b=Js0zXAuUj6JoRY5U525ge0KtgBDO4RcFKicHDafdCkN99V8ZD/KB/60wbKPFsoOmkX
         3/N8VtUENRAn2jCtQg6jDfhHuMTat/dt8jSM4cEdOoDE8V9uHzNWvL5vHBg/1VBMPH9D
         XdO6xq7WrnKVlFX9fqu4dF6LWSX0E9yDAAb2l+nFL2u8TdBgxDWpfT8rLyslj3Zxj/Ib
         f+T4i+9kL5+63pRZp1fd8nb8r8LQ/5wldNP0FfN+ZfDxZpYRVzqbcnlYgBeea9AP+ZwA
         jFfgfMNxSPi0So24WPqL5ySWltNLmQh2nDJVBc02kFjxxZ5QMjss3dZ4+KOuk+/HUo7W
         k5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140750; x=1779745550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeeMHJuYduPDLfPtUte93/ZlOUIn79ssUXS0hhRxo2g=;
        b=fCC+76O18OegJZwaYNfQR9U8XZIbpAzb47XLHvPJ+3B56XGpnmdNBSbF8Gyq0t5T+W
         C6TpgNOh4yZxP6H2vo1B4R3xBQsYp4PfNhSLHTJM+zpEVo6iLihxDR2i7NH1WExYaCgV
         a5s5hvl0RYmJ7fImLDtJovUlNGX7eTGRU74IGbmhOKAlYTpC57WxlIIsfLNgPAbu08Dc
         Y6X/UY4UHVIuCjC6gEIwhXpwvAs3sLO9M5b02Rm0BniVRgl1njWMYxpIkcW0imGhdKee
         7KgZ/IuXdYS5+rM2hRfan7LzFpNWCOp39QpR3QjRbt4pqnksJcZUfHn9QkxuEzseKqkA
         hUBA==
X-Gm-Message-State: AOJu0Yw+NgQpX4JCcxOa3ujg+TNALxjOBEfDRY4qTlerfmjKwyoQ51bI
	IMf/65TzdAfZVCWZmiCt321Tdj6k/Wv1R1TzqZSJKCRqxTVBs06oqd2mEdmkSwLRLEUmNkbH1DW
	60/mtS2B2fpJlVsrIvU2a3Wpfw+CwunoBKDiIL+lPBFOyfV8/NSDOoRSqtOJB8lbIGM5I
X-Gm-Gg: Acq92OEtFP0vy73zJk6W08sloDKzTI+2Bspg/arV1M+anb1ZrfxwZcTanfLa0QXwUTQ
	eA233IaOvcwQjcN5JsQikUPOVWYM0MMwRo5hjrf9iGknTRSvZ8Y2g/OlGDIhMuHLcxqzljbtZtW
	9EYFq0VVam+OnZEjZanKqgNBRJCykHOAhlFX2x1yPlNK47zM0VswgbIuq1wst3TB1qB05RlVqFe
	Ha+XApFNkuKwd2mIiGJFLbw6y87qi3Dnswo2Hiz1ianiMgYli2F7vjdgDkpqQuwI6BzGYLpVZWE
	W9DtQYFQkXcQbOgLV+ZIIE/1HG4jIb3f5JnlDHLDG74DmJk5fcr0VQVB2mytMU8czncQ2dMhbqz
	e21DPOxPGNiL9HJp/Zrw52lzqhr6SFDreZcXK2PXP9Ickv4E42hH+C6gRmFSvGTDf4JuLdjCYsH
	E3jMAAztcvIDrQZcEZYCrcFZnDAGf4W2vRics=
X-Received: by 2002:a05:622a:1806:b0:50d:a8f5:1c0f with SMTP id d75a77b69052e-5165a068660mr230250791cf.24.1779140750145;
        Mon, 18 May 2026 14:45:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1806:b0:50d:a8f5:1c0f with SMTP id d75a77b69052e-5165a068660mr230250381cf.24.1779140749628;
        Mon, 18 May 2026 14:45:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm3586258e87.84.2026.05.18.14.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:45:48 -0700 (PDT)
Date: Tue, 19 May 2026 00:45:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
Message-ID: <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
References: <cover.1779127507.git.taygoth@gmail.com>
 <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDIxNiBTYWx0ZWRfX0sQLmLzpzQZa
 rgkmCa3lN6fotyAPRGvHin+9Eg/K8gIF+7BTbQPghIFqQgBGnQ/dFryYanp7VyrWeV041uM3uXz
 wkHsk3Fo9ouaiF/jnJJUAORgCIRa0NMk4d8g2b8H9Dzd8fx7MIyaQrLr0KK+1vJ+hABwQpDKI8i
 s1pGXd+6a33EsnY62KZ1YqNNE8aUlCKSCfnX5sbItm/2ZDcgjfnpVCojhB8myt0GkU1uCdHknbI
 GkI7XVR9lloFNx/7Ju/Yxib6aJnuf9UCWc2R+sOEEXkiJ1pL35SHHlA8bJMPr7+AUuuXn6bTSJn
 tyM/Le2tPnChYX+BnGwmsN/rk+vZBcGsC1+iSEZOAZSep32Q4FXUX07vaty4o7N93+eRQznk6kK
 7kZJghhWWE1l4WA7tBvlsdTp2Jg5EcNWN5+Q/ytt4XchUxjk2yArpEjtxT19ZVF8Fk+9ypsukkD
 kwCrG16vLC16EQUjG7g==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0b888f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=3UPe3UmtX21fba2st3IA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: w4dyrlGMfoxhUUezZ55fvhSlKwS-l6_y
X-Proofpoint-ORIG-GUID: w4dyrlGMfoxhUUezZ55fvhSlKwS-l6_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180216
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108292-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E66695740D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:22:48AM +0500, taygoth wrote:
> The Qualcomm PMI8998 PMIC integrates a USB Type-C detection block in
> its SMB2 charger USBIN region at offset 0x1300. The block performs CC
> sensing, debounce and Rp/Rd resolution in silicon and reports role
> changes through a single consolidated "type-c-change" interrupt.
> 
> This driver reads TYPE_C_STATUS_4 on probe and on every interrupt,
> decodes the hardware-detected role (host / device / none) and pushes
> it to a usb_role_switch consumer (typically dwc3) so the controller
> can flip between peripheral and host on cable orientation change. An
> optional VBUS supply regulator is toggled on USB_ROLE_HOST transitions
> so bus-powered downstream peripherals can be powered.

This is an interesting implementation, but...

> 
> No software TCPM state machine is used because the hardware handles
> the Type-C protocol natively, and the PMI8998 interrupt topology does
> not expose the granular per-event signals the TCPM code path expects.
> Power Delivery is not implemented in this driver; the PMI8998 PDPHY
> block at offset 0x1700 (register-identical to PM8150B) can be wired
> up by a separate driver later if PD negotiation is required.

I think TCPM / PD-PHY is (more or less) a sensible requirement. Without
it you can't negotiate higher power modes or AltModes support (which
means no DP).

Also, this (read-only) implementation doesn't leave space for the active
events, like role negotiation.

Anyway, could you please be more specific, which events or which
controls do you need?

> 
> This enables USB host mode on the OnePlus 6 (enchilada), OnePlus 6T
> (fajita), Xiaomi Poco F1 (beryllium), SHIFT 6mq (axolotl) and other
> SDM845-based phones that use the PMI8998 as their second PMIC.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>

Please correct your Git configuration to use your full name in the From
metadata and in the SoB.

> ---
>  drivers/usb/typec/Kconfig              |  17 ++
>  drivers/usb/typec/Makefile             |   1 +
>  drivers/usb/typec/qcom_pmi8998_typec.c | 213 +++++++++++++++++++++++++
>  3 files changed, 231 insertions(+)
>  create mode 100644 drivers/usb/typec/qcom_pmi8998_typec.c
> 
> 

-- 
With best wishes
Dmitry

