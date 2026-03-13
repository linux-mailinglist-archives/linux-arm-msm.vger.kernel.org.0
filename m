Return-Path: <linux-arm-msm+bounces-97530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JArBJMdtGlLhQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:22:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2404284D8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F5D030048DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF05739DBFE;
	Fri, 13 Mar 2026 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOxDzwyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Peg29NDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300B39D6F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411342; cv=none; b=n/UbO/tcgCKADUAnOITC3BaiSKAK6t870qdtpdEv4d/KSCw2RlNiiNRsMLsKRfz52bBnFCVdS+0vPBz/1giCPYGMfsy1JkLOg71AqUW/mXB2xxT+HzOGtirvLoY32AriIMLwX/necJm34QyQ2zyA8+UAjDW/vVFdTJnSBtp/qVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411342; c=relaxed/simple;
	bh=9XhndkuLvjS5P1uYMx7l56ekYyRoZSj6SUTC1fmeWRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTEEk6jpsbdj7JHH0t07HwqYFedgdcm3sVA/S4hK43uvz/rYTZV9eYWLIyxi6CflW/nI0b9U9+lcRuEa8I1IA52Wvedfuqd1oNIiW9+m06kMmdg4wU/HMmdsyeDwNcJopHo/3yC2jKpt9dXh+ZUqsVYQiMGuiUq1Cu6W+U9TSog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOxDzwyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Peg29NDe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCmGE93229784
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qVWfcwQLPzdkuQHRe62O2ZN1
	F10aek070vayUdegjiI=; b=eOxDzwyq2ncT5nw7WsTGEvjJ2R0chYcE1BLsmQij
	RyYYNZCAVMbunPUx5P9HIe49dLMYgVXq1AyA+AKGgen3ht+h0I+10XcODh7PTm8B
	DFE9cvbxiGQEs8fWJc/pQipH4nL9SqBUOH4WbLev4L3dxevTFWYdLeQggb3yOVrb
	jU5WD3QG8rIHiaXEsN86v9GoyHj4tqN9IJJePXq0h5E7UpmDnPfjawZuqdevJqph
	EFWo6YvUNSuUJrALBt9NNhHyLVsCZ+tvSk4jZWCuCm6rBXLzi0zhdKIff55Sivnd
	q2DL3+eWocxWMaYtx8M84NdJmgzzQvmmZeROKLdkg0tq5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7jg57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:15:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd76ff19d5so1234196085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411339; x=1774016139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qVWfcwQLPzdkuQHRe62O2ZN1F10aek070vayUdegjiI=;
        b=Peg29NDe/hPbVSXp7x5gE402wbt6m2Q4qs29RP8SO8jBmXBD0fPh7GR/rQwSRG6DRu
         4DOZZp8izMDW9Z4Cylm4b2jPa08eeWsvFxcgsH4KZzIa2Pbyxsau8NR+7G9oBx0DM2RU
         GVwQgJUwpmZvXsctZOKq3pt1uPpH6xpenncJJnCb2+hNZ1wFrPPRxmB/eeQSYBsC6jnA
         R9JWrHH3Yn8TrJVQgJwomrIYm8EmbpXvtBfQr7Du/84ud/7zIjC1fu3lSV7PffY35qqS
         ycGbUpQ3RDUUTE/wKmRGsOumnQuIVuan2Sj1YHoHE0Gk3Qv74/BqBoCWAahjATWUihD6
         8C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411339; x=1774016139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVWfcwQLPzdkuQHRe62O2ZN1F10aek070vayUdegjiI=;
        b=jxblACMF2ThWBtilrbi2f8CAoWC1WhXmbNcOAWx2j0mBja0etx8lh0FbNWnhTMoH1u
         nC3TcYbNMNWKPy3fY06sgBSUepzK1624jIG5/Q9lNAS2HiTHSUtwtN98hLjBaJAUj0RY
         otQjEWqlnphOre6hNmTRVROIMi8b8XtVQW3mKpz7EhGc24bPoZbHLaLwj0ik+Mvb+Q1+
         qFSkwBzA8pFntOCi3fBXsq9xoQ1LR0N2ozDDf2dFRBxCfzjOABrYvLazzxLtr34TCOo/
         9P9J893Xvz6CUvO7ikNTw1cPHUtEGxRT/rNFsx+EHKPiQnHF5irfxkx9oKhPabOac2cW
         FwjA==
X-Forwarded-Encrypted: i=1; AJvYcCXPI2wGf1WWSX/beK7Is0yA2tNt0UxYZuP4Tvn2dPVpJ2HhYoXdPDqg22kqmybgQiQdhXKK+mH3OWYOhCOw@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWfOnTPeHhNZD4tgbf/hsaTu+3WVCRAr1B9j/o5W0A7LGfXtL
	EuNzMpNkMPBCxEuwrWswBwtfOUttl4IGfYBrXD+qSOq3StHr6F74o8PAdqcuGRhmQlk3s0vc7+I
	1pA8Jz079jRYeuFeeuDNk/hi0gYIbK5k2rd+gqaq+UgLQ64FRpDyzQMIqYxb7bwKK0L6T
X-Gm-Gg: ATEYQzx2b2+98Woc5EToAD5flnUDn3skrSH6ex/ItEebJu4TZFQ8Y9cpmDBJbub63T8
	47d9X9daisTk6NiUnL9Vr5VdSRTE9kGqC9nHc5hYj7Tuysp2bYZSCLd0NjDlKgBS09hMGMgYVfn
	L8yNLdlD9jeF4svrj4QlL0FLKwdlBbfoMlZYuzVxk1EvgDEOl5touhFigLb0wW8esJhHJBWOCNQ
	sdj5q9iXPuygfuSI5MvPnMdOG9qyUgLQsmDjtuqfFyNTABPIBzcr9yxkVoJ8JnONePuSTpAo7DI
	CL/UouwAn12VJigUe1SWUC0xZkHoa3kftfW/cbdEX61Z8+xhU+eyJ7oMZdNjBGpx9GRZIy6Ne11
	ZaBdqE7cMoOsbAA6ZJ2k9hw9Kz++JOdHBbOuOj+nUmA==
X-Received: by 2002:a05:620a:46a3:b0:8cd:8cb1:5350 with SMTP id af79cd13be357-8cdb57a164cmr482564685a.0.1773411338237;
        Fri, 13 Mar 2026 07:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:46a3:b0:8cd:8cb1:5350 with SMTP id af79cd13be357-8cdb57a164cmr482543285a.0.1773411336757;
        Fri, 13 Mar 2026 07:15:36 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:8f8:da5c:5e73:9fc0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556424322sm22312355e9.8.2026.03.13.07.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:15:35 -0700 (PDT)
Date: Fri, 13 Mar 2026 15:15:33 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH v2 4/8] thermal: qcom: add qmi-cooling driver
Message-ID: <abQcBXjiqmk2apx_@mai.linaro.org>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-5-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127155722.2797783-5-gaurav.kohli@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TE9v-znMas0BSqsBIXb43lbbTu5u8mwp
X-Proofpoint-GUID: TE9v-znMas0BSqsBIXb43lbbTu5u8mwp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMyBTYWx0ZWRfX7Fx+ccgi8n0u
 x9fIInbP3cr5tNiZE3Ybc6ssgfwMxGBKs552jAMV08QzrBDFNw0PhF8RXBSL456tOZqobkVpCOt
 Y5UcyzIepKJfvVQWu4E2TLHGEodjm7B+1sPBsOvRupKX7AUbzAllJQJWyRjsf9m3DcQawpMeJUD
 /PzAkiwknT3HtOAoxO2gCMlrhdsKyHMn4yTmznM53b95/ZaWYIqsRBDi494CWFGBSuNp57r4+41
 z4vAcwj/HoeWX2dfVDeYQB1W/cS6nOco0KB+m/e3nEKlmDYCjZNVEZCQfCaOmm85gwOfABeUNcq
 hnnpQdkj1y752bjQjJJ9thSJc8VA9PM0DbTrjzmS7Je/fUMueycCUcu1mn8wcpDO3VwKx9Sj6bz
 dnSZwkrNrs5kfwRgQZNj2YrC5tS1B0lHJoMRQpVsM3LaRYpNp73jKUR7zJqZbcWHC+A+YHMc/d4
 2sjLLqejnhCjmDImsgw==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b41c0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4WCg4NXfey1xpy5Vn3YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97530-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2404284D8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 27, 2026 at 09:27:18PM +0530, Gaurav Kohli wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The Thermal Mitigation Device (TMD) service exposes various platform
> specific thermal mitigations available on remote subsystems (ie the
> modem and cdsp). The service is exposed via the QMI messaging
> interface, usually over the QRTR transport.
> 
> Qualcomm QMI-based TMD cooling devices are used to mitigate thermal
> conditions across multiple remote subsystems. These devices operate
> based on junction temperature sensors (TSENS) associated with thermal
> zones for each subsystem.
> 
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig       |  13 +
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/qmi-cooling.c | 510 +++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/qmi-cooling.h | 429 +++++++++++++++++++++++++++
>  4 files changed, 953 insertions(+)
>  create mode 100644 drivers/soc/qcom/qmi-cooling.c
>  create mode 100644 drivers/soc/qcom/qmi-cooling.h
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 2caadbbcf830..905a24b42fe6 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -124,6 +124,19 @@ config QCOM_PMIC_GLINK
>  	  Say yes here to support USB-C and battery status on modern Qualcomm
>  	  platforms.
>  
> +config QCOM_QMI_COOLING
> +	tristate "Qualcomm QMI cooling drivers"
> +	depends on QCOM_RPROC_COMMON
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	select QCOM_QMI_HELPERS
> +	help
> +	   This enables the remote subsystem cooling devices. These cooling
> +	   devices will be used by Qualcomm chipset to place various remote
> +	   subsystem mitigations like remote processor passive mitigation,
> +	   remote subsystem voltage restriction at low temperatures etc.
> +	   The QMI cooling device will interface with remote subsystem
0> +	   using Qualcomm remoteproc interface.
> +
>  config QCOM_QMI_HELPERS
>  	tristate
>  	depends on NET
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index b7f1d2a57367..b6728f54944b 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
>  obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
>  obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
>  CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
> +obj-$(CONFIG_QCOM_QMI_COOLING) += qmi-cooling.o
>  obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>  qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>  obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
> diff --git a/drivers/soc/qcom/qmi-cooling.c b/drivers/soc/qcom/qmi-cooling.c
> new file mode 100644
> index 000000000000..463baa47c8b6
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi-cooling.c
> @@ -0,0 +1,510 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2017, The Linux Foundation

Why this copyright ? The file is from scratch

> + * Copyright (c) 2025, Linaro Limited

Missing copyright: Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

> + * QMI Thermal Mitigation Device (TMD) client driver.
> + * This driver provides an in-kernel client to handle hot and cold thermal
> + * mitigations for remote subsystems (modem and DSPs) running the TMD service.
> + * It doesn't implement any handling of reports from remote subsystems.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/net.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc/qcom_rproc.h>
> +#include <linux/remoteproc_cooling.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/qmi.h>
> +#include <linux/thermal.h>
> +
> +#include "qmi-cooling.h"
> +
> +#define CDSP_INSTANCE_ID	0x43
> +#define CDSP1_INSTANCE_ID	0x44
> +
> +#define QMI_TMD_RESP_TIMEOUT msecs_to_jiffies(100)

Seems to me a really long duration for a timeout when doing
mitigation. Would it make sense to reduce it ?

> +/**
> + * struct qmi_tmd_client - TMD client state
> + * @dev:	Device associated with this client
> + * @name:	Friendly name for the remote TMD service
> + * @handle:	QMI connection handle
> + * @mutex:	Lock to synchronise QMI communication
> + * @id:		The QMI TMD service instance ID
> + * @cdev_list:	The list of cooling devices (controls) enabled for this instance
> + * @svc_arrive_work: Work item for initialising the client when the TMD service
> + *		     starts.
> + * @connection_active: Whether or not we're connected to the QMI TMD service
> + */
> +struct qmi_tmd_client {
> +	struct device *dev;
> +	const char *name;
> +	struct qmi_handle handle;
> +	struct mutex mutex;

Can you explain why this lock is needed? What race condition is it fixing?

> +	u32 id;

So 'dev', 'id' and 'name' are only there to print an error message, right?

IMO, we can get rid of them.

> +	struct list_head cdev_list;
> +	struct work_struct svc_arrive_work;
> +	bool connection_active;

IMO this boolean is not needed.

 - connection_active is checked in the function 'set_cur_state'.

If the function is called is because the cooling device is
registered. The only place where it is set to false again is when the
cleanup is called. But if the cooling devices are unregistered before,
there is no reason why 'set_cur_state' to be called in the next steps
of the cleanup.

What remain unclear is in case of a peer reset, if del/new is called
before reset. But in such case, the request through QMI will result in
a error which should be handled in this driver.

> +};
> +
> +/**
> + * struct qmi_tmd - A TMD cooling device
> + * @np:		OF node associated with this control

Why needed ?

> + * @type:	The control type (exposed via sysfs)

Duplicate with the cooling device name

> + * @qmi_name:	The common name of this control shared by the remote subsystem
> + * @rproc_cdev:	Remote processor cooling device handle
> + * @cur_state:	The current cooling/warming/mitigation state
> + * @max_state:	The maximum state
> + * @client:	The TMD client instance this control is associated with
> + */
> +struct qmi_tmd {
> +	struct device_node *np;
> +	const char *type;
> +	char qmi_name[QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1];

const char * and use devm_kstrdup() instead

> +	struct list_head node;
> +	struct remoteproc_cdev *rproc_cdev;
> +	unsigned int cur_state;
> +	unsigned int max_state;

max_state can be removed (see comment below in the get_max_state() ops)

> +	struct qmi_tmd_client *client;
> +};

This structure can be simplified (refer to comments below in the code)

> +/**
> + * struct qmi_instance_id - QMI instance match data
> + * @id:		The QMI instance ID
> + * @name:	Friendly name for this instance
> + */
> +struct qmi_instance_data {
> +	u32 id;
> +	const char *name;
> +};

If I'm not wrong, this structure is only used to pass information to
print debug information ?

> +
> +/* Notify the remote subsystem of the requested cooling state */
> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd)
> +{
> +	struct tmd_set_mitigation_level_resp_msg_v01 tmd_resp = { 0 };
> +	struct tmd_set_mitigation_level_req_msg_v01 req = { 0 };

Please shortened these structure name. It is unreadable. May be you
can do something like:

struct tmd_set_level_msg {
       int level;
       union {
       	     struct qmi_response_type_v01 resp;
	     char mitigation_dev_id[...];
       };
}

I know the other QMI services are implemented in the same way but it
may be worth to simplify the message format instead of wrapping that
into structures again and again.

> +	struct qmi_tmd_client *client;
> +	struct qmi_txn txn;
> +	int ret = 0;
> +
> +	client = tmd->client;
> +
> +	guard(mutex)(&client->mutex);
> +
> +	/*
> +	 * This function is called by qmi_set_cur_state() which does not know if
> +	 * the QMI service is actually online. If it isn't then we noop here.
> +	 * The state is cached in tmd->cur_state and will be broadcast via
> +	 * qmi_tmd_init_control() when the service comes up.
> +	 */
> +	if (!client->connection_active)
> +		return 0;
> +
> +	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->qmi_name,
> +		QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1);
> +	req.mitigation_level = tmd->cur_state;
> +
> +	ret = qmi_txn_init(&client->handle, &txn,
> +			   tmd_set_mitigation_level_resp_msg_v01_ei, &tmd_resp);
> +	if (ret < 0) {
> +		dev_err(client->dev, "qmi set state %d txn init failed for %s ret %d\n",
> +			tmd->cur_state, tmd->type, ret);
> +		return ret;
> +	}
> +
> +	ret = qmi_send_request(&client->handle, NULL, &txn,
> +			       QMI_TMD_SET_MITIGATION_LEVEL_REQ_V01,
> +			       TMD_SET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN,
> +			       tmd_set_mitigation_level_req_msg_v01_ei, &req);
> +	if (ret < 0) {
> +		dev_err(client->dev, "qmi set state %d txn send failed for %s ret %d\n",
> +			tmd->cur_state, tmd->type, ret);
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
> +	if (ret < 0) {
> +		dev_err(client->dev, "qmi set state %d txn wait failed for %s ret %d\n",
> +			tmd->cur_state, tmd->type, ret);
> +		return ret;
> +	}
> +
> +	if (tmd_resp.resp.result != QMI_RESULT_SUCCESS_V01) {
> +		ret = -tmd_resp.resp.result;

Is this result an errno error or a QMI error?

> +		dev_err(client->dev, "qmi set state %d NOT success for %s ret %d\n",
> +			tmd->cur_state, tmd->type, ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(client->dev, "Requested state %d/%d for %s\n", tmd->cur_state,
> +		tmd->max_state, tmd->type);
> +
> +	return 0;
> +}
> +
> +static int qmi_get_max_level(void *devdata, unsigned long *level)
> +{
> +	struct qmi_tmd *tmd = devdata;
> +
> +	if (!tmd)
> +		return -EINVAL;
> +
> +	*level = tmd->max_state;
> +
> +	return 0;
> +}

The get_max_state() is called in two places. When registering the
cooling device and when updating the cooling device. The first one is
called one time and the second one is called when there is an event
like switching the battery mode (ACPI only). Each of them updates the
cdev->max_state field. Otherwise the get_max_state() is not used but
cdev->max_state.

The code above should call the QMI to get the max
level. tmd->max_state could be then removed.

I agree there are other cooling devices doing that but I don't think
it is correct.

> +static int qmi_get_cur_level(void *devdata, unsigned long *level)
> +{
> +	struct qmi_tmd *tmd = devdata;
> +
> +	if (!tmd)
> +		return -EINVAL;
> +

We should assume the core is doing the right thing. So if we
registered the cooling device with the private data, then it should
return it back. If not, then it is a fatal bug crashing the system
which should have been spotted when doing some testing.

> +	*level = tmd->cur_state;
> +
> +	return 0;
> +}
> +
> +static int qmi_set_cur_level(void *devdata, unsigned long level)
> +{
> +	struct qmi_tmd *tmd = devdata;
> +
> +	if (!tmd)
> +		return -EINVAL;

idem

> +	if (level > tmd->max_state)
> +		return -EINVAL;

It is already handled in the core code.

> +	if (tmd->cur_state == level)
> +		return 0;
>
> +	tmd->cur_state = level;
> +
> +	return qmi_tmd_send_state_request(tmd);

The command should succeed before updating 'cur_state'. So first the
call to qmi_tmd_send_state_request() and if it is ok, then set the
current state. So it means you can pass the state as parameter to
qmi_set_cur_level() which in this case not rely on the caller to set
the tmd->cur_state before calling the function.

> +}
> +
> +static const struct remoteproc_cooling_ops qmi_rproc_ops = {
> +	.get_max_level = qmi_get_max_level,
> +	.get_cur_level = qmi_get_cur_level,
> +	.set_cur_level = qmi_set_cur_level,
> +};

As commented before, the remoteproc cooling device does not really
provide a benefit, so those ops can be converted into cooling device
ops.

[ ... ]

> +/*
> + * Init a single TMD control by registering a cooling device for it, or
> + * synchronising state with the remote subsystem if recovering from a service
> + * restart. This is called when the TMD service starts up.
> + */
> +static int qmi_tmd_init_control(struct qmi_tmd_client *client, const char *label,
> +				u8 max_state)
> +{
> +	struct qmi_tmd *tmd = NULL;
> +
> +	list_for_each_entry(tmd, &client->cdev_list, node)
> +		if (!strncasecmp(tmd->qmi_name, label,
> +				 QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1))
> +			goto found;
> +
> +	dev_dbg(client->dev,
> +		"TMD '%s' available in firmware but not specified in DT\n",
> +		label);
> +	return 0;
> +
> +found:
> +	tmd->max_state = max_state;
> +	/*
> +	 * If the cooling device already exists then the QMI service went away and
> +	 * came back. So just make sure the current cooling device state is
> +	 * reflected on the remote side and then return.
> +	 */
> +	if (tmd->rproc_cdev)
> +		return qmi_tmd_send_state_request(tmd);
> +
> +	return qmi_register_cooling_device(tmd);
> +}
> +
> +/*
> + * When the QMI service starts up on a remote subsystem this function will fetch
> + * the list of TMDs on the subsystem, match it to the TMDs specified in devicetree
> + * and call qmi_tmd_init_control() for each
> + */
> +static void qmi_tmd_svc_arrive(struct work_struct *work)
> +{
> +	struct qmi_tmd_client *client =
> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
> +
> +	struct tmd_get_mitigation_device_list_req_msg_v01 req = { 0 };
> +	struct tmd_get_mitigation_device_list_resp_msg_v01 *resp __free(kfree) = NULL;
> +	int ret = 0, i;
> +	struct qmi_txn txn;
> +
> +	/* resp struct is 1.1kB, allocate it on the heap. */
> +	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
> +	if (!resp)
> +		return;
> +
> +	/* Get a list of TMDs supported by the remoteproc */
> +	scoped_guard(mutex, &client->mutex) {
> +		ret = qmi_txn_init(&client->handle, &txn,
> +				   tmd_get_mitigation_device_list_resp_msg_v01_ei, resp);
> +		if (ret < 0) {
> +			dev_err(client->dev,
> +				"Transaction init error for instance_id: %#x ret %d\n",
> +				client->id, ret);
> +			return;
> +		}
> +
> +		ret = qmi_send_request(&client->handle, NULL, &txn,
> +				       QMI_TMD_GET_MITIGATION_DEVICE_LIST_REQ_V01,
> +				TMD_GET_MITIGATION_DEVICE_LIST_REQ_MSG_V01_MAX_MSG_LEN,
> +				tmd_get_mitigation_device_list_req_msg_v01_ei, &req);
> +		if (ret < 0) {
> +			qmi_txn_cancel(&txn);
> +			return;
> +		}
> +
> +		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
> +		if (ret < 0) {
> +			dev_err(client->dev, "Transaction wait error for client %#x ret:%d\n",
> +				client->id, ret);
> +			return;
> +		}
> +		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
> +			ret = resp->resp.result;
> +			dev_err(client->dev, "Failed to get device list for client %#x ret:%d\n",
> +				client->id, ret);
> +			return;
> +		}
> +
> +		client->connection_active = true;
> +	}
> +
> +	for (i = 0; i < resp->mitigation_device_list_len; i++) {
> +		struct tmd_mitigation_dev_list_type_v01 *device =
> +			&resp->mitigation_device_list[i];
> +
> +		ret = qmi_tmd_init_control(client,
> +					   device->mitigation_dev_id.mitigation_dev_id,
> +					   device->max_mitigation_level);
> +		if (ret)
> +			break;
> +	}
> +}
> +
> +static void thermal_qmi_net_reset(struct qmi_handle *qmi)
> +{
> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
> +	struct qmi_tmd *tmd = NULL;
> +
> +	list_for_each_entry(tmd, &client->cdev_list, node) {
> +		qmi_tmd_send_state_request(tmd);
> +	}
> +}
> +
> +static void thermal_qmi_del_server(struct qmi_handle *qmi, struct qmi_service *service)
> +{
> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
> +
> +	scoped_guard(mutex, &client->mutex)
> +		client->connection_active = false;
> +}
> +
> +static int thermal_qmi_new_server(struct qmi_handle *qmi, struct qmi_service *service)
> +{
> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
> +	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
> +
> +	scoped_guard(mutex, &client->mutex)
> +		kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq, sizeof(sq), 0);
> +
> +	queue_work(system_highpri_wq, &client->svc_arrive_work);
> +
> +	return 0;
> +}
> +
> +static const struct qmi_ops thermal_qmi_event_ops = {
> +	.new_server = thermal_qmi_new_server,
> +	.del_server = thermal_qmi_del_server,
> +	.net_reset = thermal_qmi_net_reset,
> +};
> +
> +static void qmi_tmd_cleanup(struct qmi_tmd_client *client)
> +{
> +	struct qmi_tmd *tmd, *c_next;
> +
> +	guard(mutex)(&client->mutex);
> +
> +	client->connection_active = false;
> +
> +	qmi_handle_release(&client->handle);
> +	cancel_work(&client->svc_arrive_work);
> +	list_for_each_entry_safe(tmd, c_next, &client->cdev_list, node) {
> +		if (tmd->rproc_cdev)
> +			remoteproc_cooling_unregister(tmd->rproc_cdev);
> +
> +		list_del(&tmd->node);
> +	}
> +}
> +
> +/* Parse the controls and allocate a qmi_tmd for each of them */
> +static int qmi_tmd_alloc_cdevs(struct qmi_tmd_client *client)
> +{
> +	struct device *dev = client->dev;
> +	struct device_node *node = dev->of_node;
> +	struct device_node *subnode;
> +	struct qmi_tmd *tmd;
> +	int ret;
> +
> +	for_each_available_child_of_node_scoped(node, subnode) {
> +		const char *name;

Ok, I think there are already a lot of comments about the code. I'll
skip the DTpart review in this patch and jump to the DT bindings.

> +		tmd = devm_kzalloc(dev, sizeof(*tmd), GFP_KERNEL);
> +		if (!tmd)
> +			return dev_err_probe(client->dev, -ENOMEM,
> +					     "Couldn't allocate tmd\n");

Usually we do not return an error message when an allocation fails
because the mem mngt code does already that. So I would replace it
with a simple return -ENOMEM

> +
> +		tmd->type = devm_kasprintf(client->dev, GFP_KERNEL, "%s",
> +					   subnode->name);

			devm_kstrdup()

> +		if (!tmd->type)
> +			return dev_err_probe(dev, -ENOMEM,
> +					     "Couldn't allocate cooling device name\n");
> +
> +		if (of_property_read_string(subnode, "label", &name))
> +			return dev_err_probe(client->dev, -EINVAL,
> +					     "Failed to parse dev name for %s\n",
> +					     subnode->name);
> +
> +		ret = strscpy(tmd->qmi_name, name,
> +			      QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1);

  			devm_kstrdup()

> +		if (ret == -E2BIG)
> +			return dev_err_probe(dev, -EINVAL, "TMD label %s is too long\n",
> +					     name);
> +
> +		tmd->client = client;
> +		tmd->np = subnode;

Why is it needed? I don't see it used anywhere

> +		tmd->cur_state = 0;
> +		list_add(&tmd->node, &client->cdev_list);
> +	}
> +
> +	if (list_empty(&client->cdev_list))
> +		return dev_err_probe(client->dev, -EINVAL,
> +				     "No cooling devices specified for client %s (%#x)\n",
> +				     client->name, client->id);
> +
> +	return 0;
> +}
> +
> +static int qmi_tmd_client_probe(struct platform_device *pdev)
> +{
> +	const struct qmi_instance_data *match;
> +	struct qmi_tmd_client *client;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	client = devm_kzalloc(dev, sizeof(*client), GFP_KERNEL);
> +	if (!client)
> +		return -ENOMEM;
> +
> +	client->dev = dev;
> +
> +	match = of_device_get_match_data(dev);
> +	if (!match)
> +		return dev_err_probe(dev, -EINVAL, "No match data\n");
> +
> +	client->id = match->id;
> +	client->name = match->name;
> +
> +	mutex_init(&client->mutex);
> +	INIT_LIST_HEAD(&client->cdev_list);
> +	INIT_WORK(&client->svc_arrive_work, qmi_tmd_svc_arrive);
> +
> +	ret = qmi_tmd_alloc_cdevs(client);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, client);
> +
> +	ret = qmi_handle_init(&client->handle,
> +			      TMD_GET_MITIGATION_DEVICE_LIST_RESP_MSG_V01_MAX_MSG_LEN,
> +			      &thermal_qmi_event_ops, NULL);
> +	if (ret < 0)
> +		return dev_err_probe(client->dev, ret, "QMI handle init failed for client %#x\n",
> +			      client->id);
> +
> +	ret = qmi_add_lookup(&client->handle, TMD_SERVICE_ID_V01, TMD_SERVICE_VERS_V01,
> +			     client->id);
> +	if (ret < 0) {
> +		qmi_handle_release(&client->handle);
> +		return dev_err_probe(client->dev, ret, "QMI register failed for client 0x%x\n",
> +			      client->id);
> +	}
> +
> +	return 0;
> +}
> +
> +static void qmi_tmd_client_remove(struct platform_device *pdev)
> +{
> +	struct qmi_tmd_client *client = platform_get_drvdata(pdev);
> +
> +	qmi_tmd_cleanup(client);
> +}
> +
> +static const struct qmi_instance_data qmi_cdsp = {
> +	.id = CDSP_INSTANCE_ID,
> +	.name = "cdsp",
> +};
> +
> +static const struct qmi_instance_data qmi_cdsp1 = {
> +	.id = CDSP1_INSTANCE_ID,
> +	.name = "cdsp1",
> +};
> +
> +static const struct of_device_id qmi_tmd_device_table[] = {
> +	{
> +		.compatible = "qcom,qmi-cooling-cdsp",
> +		.data = &qmi_cdsp,
> +	},
> +	{
> +		.compatible = "qcom,qmi-cooling-cdsp1",
> +		.data = &qmi_cdsp1,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qmi_tmd_device_table);
> +
> +static struct platform_driver qmi_tmd_device_driver = {
> +	.probe = qmi_tmd_client_probe,
> +	.remove = qmi_tmd_client_remove,
> +	.driver = {
> +		.name = "qcom-qmi-cooling",
> +		.of_match_table = qmi_tmd_device_table,
> +	},
> +};
> +
> +module_platform_driver(qmi_tmd_device_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Qualcomm QMI Thermal Mitigation Device driver");
> diff --git a/drivers/soc/qcom/qmi-cooling.h b/drivers/soc/qcom/qmi-cooling.h
> new file mode 100644
> index 000000000000..e33f4c5979e5
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi-cooling.h
> @@ -0,0 +1,429 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2017, The Linux Foundation
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef __QCOM_COOLING_H__
> +#define __QCOM_COOLING_H__

I'm not sure we want to export all these macros, structure. It could
be contained into a .c file.

> +#include <linux/soc/qcom/qmi.h>
> +
> +#define TMD_SERVICE_ID_V01 0x18

IMO, this definition should go inside qmi.h

See https://lore.kernel.org/all/20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com/

> +#define TMD_SERVICE_VERS_V01 0x01
> +
> +#define QMI_TMD_GET_MITIGATION_DEVICE_LIST_RESP_V01 0x0020
> +#define QMI_TMD_GET_MITIGATION_LEVEL_REQ_V01 0x0022
> +#define QMI_TMD_GET_SUPPORTED_MSGS_REQ_V01 0x001E
> +#define QMI_TMD_SET_MITIGATION_LEVEL_REQ_V01 0x0021
> +#define QMI_TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_V01 0x0023
> +#define QMI_TMD_GET_SUPPORTED_MSGS_RESP_V01 0x001E
> +#define QMI_TMD_SET_MITIGATION_LEVEL_RESP_V01 0x0021
> +#define QMI_TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_V01 0x0024
> +#define QMI_TMD_MITIGATION_LEVEL_REPORT_IND_V01 0x0025
> +#define QMI_TMD_GET_MITIGATION_LEVEL_RESP_V01 0x0022
> +#define QMI_TMD_GET_SUPPORTED_FIELDS_REQ_V01 0x001F
> +#define QMI_TMD_GET_MITIGATION_DEVICE_LIST_REQ_V01 0x0020
> +#define QMI_TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_V01 0x0023
> +#define QMI_TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_V01 0x0024
> +#define QMI_TMD_GET_SUPPORTED_FIELDS_RESP_V01 0x001F
> +
> +#define QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 32
> +#define QMI_TMD_MITIGATION_DEV_LIST_MAX_V01 32

Having self explainatory names for the macros is good but somehow
these should be shortened because they are too long and do not help
for the readability when they are used.

Perhaps, add a documentation in the code with the corresponding
structure vs their name.

[ ... ]

> +struct tmd_get_mitigation_device_list_req_msg_v01 {
> +	char placeholder;
> +};
> +
> +#define TMD_GET_MITIGATION_DEVICE_LIST_REQ_MSG_V01_MAX_MSG_LEN 0.

Where are these macro used ? And why are they needed ?

> +const struct qmi_elem_info tmd_get_mitigation_device_list_req_msg_v01_ei[] = {
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_get_mitigation_device_list_resp_msg_v01 {
> +	struct qmi_response_type_v01 resp;
> +	u8 mitigation_device_list_valid;
> +	u32 mitigation_device_list_len;
> +	struct tmd_mitigation_dev_list_type_v01
> +		mitigation_device_list[QMI_TMD_MITIGATION_DEV_LIST_MAX_V01];
> +};
> +
> +#define TMD_GET_MITIGATION_DEVICE_LIST_RESP_MSG_V01_MAX_MSG_LEN 1099
> +static const struct qmi_elem_info tmd_get_mitigation_device_list_resp_msg_v01_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct qmi_response_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
> +				   resp),
> +		.ei_array = qmi_response_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_OPT_FLAG,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
> +				   mitigation_device_list_valid),
> +	},
> +	{
> +		.data_type = QMI_DATA_LEN,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
> +				   mitigation_device_list_len),
> +	},
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = QMI_TMD_MITIGATION_DEV_LIST_MAX_V01,
> +		.elem_size = sizeof(struct tmd_mitigation_dev_list_type_v01),
> +		.array_type = VAR_LEN_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
> +				   mitigation_device_list),
> +		.ei_array = tmd_mitigation_dev_list_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_set_mitigation_level_req_msg_v01 {
> +	struct tmd_mitigation_dev_id_type_v01 mitigation_dev_id;
> +	u8 mitigation_level;
> +};
> +
> +#define TMD_SET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 40
> +static const struct qmi_elem_info tmd_set_mitigation_level_req_msg_v01_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x01,
> +		.offset = offsetof(struct tmd_set_mitigation_level_req_msg_v01,
> +				   mitigation_dev_id),
> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_UNSIGNED_1_BYTE,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_set_mitigation_level_req_msg_v01,
> +				   mitigation_level),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_set_mitigation_level_resp_msg_v01 {
> +	struct qmi_response_type_v01 resp;
> +};
> +
> +#define TMD_SET_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
> +static const struct qmi_elem_info tmd_set_mitigation_level_resp_msg_v01_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct qmi_response_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_set_mitigation_level_resp_msg_v01, resp),
> +		.ei_array = qmi_response_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_get_mitigation_level_req_msg_v01 {
> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
> +};
> +
> +#define TMD_GET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
> +
> +static const struct qmi_elem_info tmd_get_mitigation_level_req_msg_v01_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x01,
> +		.offset = offsetof(struct tmd_get_mitigation_level_req_msg_v01,
> +				   mitigation_device),
> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_get_mitigation_level_resp_msg_v01 {
> +	struct qmi_response_type_v01 resp;
> +	u8 current_mitigation_level_valid;
> +	u8 current_mitigation_level;
> +	u8 requested_mitigation_level_valid;
> +	u8 requested_mitigation_level;
> +};
> +
> +#define TMD_GET_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 15
> +static const struct qmi_elem_info tmd_get_mitigation_level_resp_msg_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct qmi_response_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01, resp),
> +		.ei_array = qmi_response_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_OPT_FLAG,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
> +				   current_mitigation_level_valid),
> +	},
> +	{
> +		.data_type = QMI_UNSIGNED_1_BYTE,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
> +				   current_mitigation_level),
> +	},
> +	{
> +		.data_type = QMI_OPT_FLAG,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x11,
> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
> +				   requested_mitigation_level_valid),
> +	},
> +	{
> +		.data_type = QMI_UNSIGNED_1_BYTE,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x11,
> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
> +				   requested_mitigation_level),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_register_notification_mitigation_level_req_msg_v01 {
> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
> +};
> +
> +#define TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
> +static const struct qmi_elem_info
> +	tmd_register_notification_mitigation_level_req_msg_v01_ei[] = {
> +		{
> +			.data_type = QMI_STRUCT,
> +			.elem_len = 1,
> +			.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
> +			.array_type = NO_ARRAY,
> +			.tlv_type = 0x01,
> +			.offset = offsetof(
> +				struct tmd_register_notification_mitigation_level_req_msg_v01,
> +				mitigation_device),
> +			.ei_array = tmd_mitigation_dev_id_type_v01_ei,
> +		},
> +		{
> +			.data_type = QMI_EOTI,
> +			.array_type = NO_ARRAY,
> +			.tlv_type = QMI_COMMON_TLV_TYPE,
> +		},
> +	};
> +
> +struct tmd_register_notification_mitigation_level_resp_msg_v01 {
> +	struct qmi_response_type_v01 resp;
> +};
> +
> +#define TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
> +static const struct qmi_elem_info
> +	tmd_register_notification_mitigation_level_resp_msg_v01_ei[] = {
> +		{
> +			.data_type = QMI_STRUCT,
> +			.elem_len = 1,
> +			.elem_size = sizeof(struct qmi_response_type_v01),
> +			.array_type = NO_ARRAY,
> +			.tlv_type = 0x02,
> +			.offset = offsetof(
> +				struct tmd_register_notification_mitigation_level_resp_msg_v01,
> +				resp),
> +			.ei_array = qmi_response_type_v01_ei,
> +		},
> +		{
> +			.data_type = QMI_EOTI,
> +			.array_type = NO_ARRAY,
> +			.tlv_type = QMI_COMMON_TLV_TYPE,
> +		},
> +	};
> +
> +struct tmd_deregister_notification_mitigation_level_req_msg_v01 {
> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
> +};
> +
> +#define TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
> +static const struct qmi_elem_info
> +	tmd_deregister_notification_mitigation_level_req_msg_v01_ei[] = {
> +		{
> +			.data_type = QMI_STRUCT,
> +			.elem_len = 1,
> +			.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
> +			.array_type = NO_ARRAY,
> +			.tlv_type = 0x01,
> +			.offset = offsetof(
> +				struct tmd_deregister_notification_mitigation_level_req_msg_v01,
> +				mitigation_device),
> +			.ei_array = tmd_mitigation_dev_id_type_v01_ei,
> +		},
> +		{
> +			.data_type = QMI_EOTI,
> +			.array_type = NO_ARRAY,
> +			.tlv_type = QMI_COMMON_TLV_TYPE,
> +		},
> +	};
> +
> +struct tmd_deregister_notification_mitigation_level_resp_msg_v01 {
> +	struct qmi_response_type_v01 resp;
> +};
> +
> +#define TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
> +static const struct qmi_elem_info
> +	tmd_deregister_notification_mitigation_level_resp_msg_v01_ei[] = {
> +		{
> +			.data_type = QMI_STRUCT,
> +			.elem_len = 1,
> +			.elem_size = sizeof(struct qmi_response_type_v01),
> +			.array_type = NO_ARRAY,
> +			.tlv_type = 0x02,
> +			.offset = offsetof(
> +				struct tmd_deregister_notification_mitigation_level_resp_msg_v01,
> +				resp),
> +			.ei_array = qmi_response_type_v01_ei,
> +		},
> +		{
> +			.data_type = QMI_EOTI,
> +			.array_type = NO_ARRAY,
> +			.tlv_type = QMI_COMMON_TLV_TYPE,
> +		},
> +	};
> +
> +struct tmd_mitigation_level_report_ind_msg_v01 {
> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
> +	u8 current_mitigation_level;
> +};
> +
> +#define TMD_MITIGATION_LEVEL_REPORT_IND_MSG_V01_MAX_MSG_LEN 40
> +static const struct qmi_elem_info tmd_mitigation_level_report_ind_msg_v01_ei[] = {

Where is used this variable ?

> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x01,
> +		.offset = offsetof(struct tmd_mitigation_level_report_ind_msg_v01,
> +				   mitigation_device),
> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_UNSIGNED_1_BYTE,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_mitigation_level_report_ind_msg_v01,
> +				   current_mitigation_level),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +#endif /* __QMI_COOLING_INTERNAL_H__ */
> -- 
> 2.34.1
> 

-- 

