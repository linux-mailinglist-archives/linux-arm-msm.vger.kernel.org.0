Return-Path: <linux-arm-msm+bounces-118719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wR+XAG29VGqiqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:26:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B11749C98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:26:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jSCfBlZV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DCx3Ragw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118719-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118719-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 558943036EB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA67A3E929C;
	Mon, 13 Jul 2026 10:26:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C563E8340
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938375; cv=none; b=UAOrfwH6hsoLdobI7ml9xx7gFmT5h+2xT+Tkjzh8/hZwDPmwpLwgOjUEPHx1NBgKcs0At8soVKCqv8Z0YSeMFhuBDFWNONB5zFOfAVPQP/K7z5O0hHlsYv60XZ97sSDnvIUURDYajSV6qo4ijFW7P6FyZYN26gEJfaCppsbl/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938375; c=relaxed/simple;
	bh=mE2NOrJHdxoNBGv2gxgWjLwSXG+AZyESlOGt4lA2jDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mE0C48edsdhKeGuWEgGmoVAdDB9jWYpuRAf+Ej6BKjumkWL/spsXSGilUEUwISEUNIl7QTvqFEXt73r2yZoUODVrJrGBEygIzmYuRQmcLl0PJfp3OCujZ0Am5oMhwmkNOj5aT8vSUV0fdFiOZzPArKRexvBJlL6OnauyIXQRBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSCfBlZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCx3Ragw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nkdr668628
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WF5vb4LRAOTAx+Nki8DeZ/zZKC0/L4nU8n/uNSdhpQA=; b=jSCfBlZVqU+GwMwT
	lTpOiKiccdkrgjBZaTgKWSUzmqiamqxlgn5zhFoqQ6nxcaD3SW8kk3ixfa9RNDa+
	9BbAqnphm/izenvTxGqqVTScgSPuDAiddRasXfcClre8SkD9ck22a2mNsFX/I5Mj
	cxmH+6TdlE9PAsxKnM1hv9A/eo5g6alftEzhABrOF3kb4yD8mFZHcJ9y/+odF2JJ
	1LwqZn18XFIOLb31JxgDm0pPzjTmKY7mOlA7qazxhG56IT5Wn7eh1T/fwMx6TkG+
	tC9M5GB8b6jICmU1h26Ja8gucs29vlYaNkivXLJ0n1g0ixWXzkxi0Xnsqw6MAPPY
	qL0t8g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm22rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484f26852dso3779309b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938373; x=1784543173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WF5vb4LRAOTAx+Nki8DeZ/zZKC0/L4nU8n/uNSdhpQA=;
        b=DCx3RagwcAri3rTm9kQ8lHNzWjVj+XbRfxfc3GX1GsGq7bc0FyI4zAFX9CJ0Sn5oM+
         wRVpHfFcU3+QWgzjfQZUog2n95xUbkPIqaAwr/wwSDKj5v51t0iYLKoc43pEpBLLqhVI
         H1D337jdIAAGZ1JMBT6tHUbmOcWEIuLtCsIq7UYv2jwWVrpyl1dpNhbZIHjs3nL/gr0q
         6UbHzh5ZxcafeWUIVikjVY0I8bhVhdySmWIbdlxBhLYDLCW/Jiu7/Hnr1AXrhOAKguc4
         Q8AhCUAzilI5ZkVloObmiHImJ5s+XQPKcvZuO7+rLm65KfjtuDg/cYM6Ua8fYYo4A8fp
         k2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938373; x=1784543173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WF5vb4LRAOTAx+Nki8DeZ/zZKC0/L4nU8n/uNSdhpQA=;
        b=YexQxdTB2suJfdrEO20UbSmFMcTKuPDcWDmZ9z5sw3BYI3JT37lYeAYS0hTuAuyp54
         SpVlKXnSG4GPUZ91GNwpxdjILsLjSZBTVNFCfOTRLesxDUO/VSFeVfrLbeVUBWn/Hd0I
         c8EHSNFM7WOjb0zL4NSc7b8OW6aNQMbQ5MK/V4NMf2mltRo4V5ysL8lUivbzdIeE87s5
         QcSFlJ36MWzCAotf/U/DuXY95v4VeNuQ/Ks9NUe8VE5uL7F2xEwmcm0AxVx4SQ7D4/44
         ALBDQGC4EEHcoldZ3kPhZC2xXnNO5Lhubw1BHRriVEgCFu+x3DD0G/f8ESxDTYCxRp2h
         j6FQ==
X-Gm-Message-State: AOJu0Yw3dtx70+S+PebGXU3m5eiAW3uAG9outkSayTuWZtZV4yejHTw+
	uCYC0OSDRvm6r6GGm3UDv8oC9d/x9XgdRbwgj5YAySq+DoX+kL4YsILWvH0sbPXe+JllxVaNyTJ
	mf9n9f9b78ol1dkVdcu84FETL+LxafhUMhGw3OzWXCfhEYtexdj5i49Kt2/7ggG0nnCKX
X-Gm-Gg: AfdE7ck0fiCnWS+QwCCy3J3kyOhZWLoaT8RHOmD1MNFeDsAUw+ZrAQPtaamhEnZ0Ujz
	3+0WlJMoUDYgwRKSw54G6+jcruaT0r1HEjK4ETPjkm6FW8jBO/R5Ff50gZfKKy8qi/Cyh3tSoEm
	uGpR7+iwNIPouIf/Tt7iu+ZHPmyuZ1nWvwhgJtCCBilDTF/phsgZi5ueNnsR4XjCN1UNsKQeGnP
	TrV8UBI9Wkc/WIRmmt577WZlvLp6v9+L93ITQZv78rPEDi/FNdRkrRdLgqEooFOyAaHPwC+0Y/A
	9VfoqaVzsPIyCWEXnpZQV1hMshU659NRgXxzCsLjexV201U8vxa+2z4W8dqNEuy4elNd3MFKBJZ
	BNtfbxThieSTuJFMZG9H/w9HG+Mo/1pKFuWLfJ72C
X-Received: by 2002:a05:6a21:32a2:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c1108c0ad0mr9582169637.24.1783938372647;
        Mon, 13 Jul 2026 03:26:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a2:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c1108c0ad0mr9582129637.24.1783938372135;
        Mon, 13 Jul 2026 03:26:12 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:11 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:42 +0530
Subject: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=8212;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=mE2NOrJHdxoNBGv2gxgWjLwSXG+AZyESlOGt4lA2jDE=;
 b=6hB4A5JUCdcjPjDBS8E9RnqPqOu7fN2p9bj9L1bmCYfeO2z7YGHprFsohO869aIxwkC7v1Ifr
 uEITKVpxrc9DW0NOMT6M4YJhVXfJkZ1D2cRJgF7nV5BCJJEnqC3dcCM
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: FYLjyKzEr0XDlueK_OV7F9Lp-9DRIp0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX4KxjD72+4WgF
 Dl7N/pxVXPd3PKfnAY2Tb/thEaSAH5WxPcLTNuUlI8jvyYwK9KUhxR3l1g7x+Nc5KdJEnBhB49s
 QlNDjL2KxiqqF0dCltAfueV+iKpUmBElWwSecGUg0XgngBb6xQ/TpmSO0DJr1LKJh0BEe4K1RRY
 FBAu9Z9V55Y1jClphTuYXfnyp618T0rABke4PAw36oW2hboL8N4/LgUUWuv/ovrUGu1cdTrsrtz
 K0BfzaXz+ulh3o31JWwm0FeYzI7Nt9xRaTGBuvpc/gVyVgG3p7VYHGjMsrIbt87mInDdeir0HhT
 r+zVcy4ZSk89miH/yPuS8nZiyHQL5ov74R/pHX4NPKfHUa9eh87UxmCUe3Oi9z0W+Z14KTBrePd
 JrXNQ83fQjDjyQ+7T3C+2NNyLnzIQX2kWycPN8nA6RPtkgVjBvpPANQUjP8NI3vR9BFnmdSZsrk
 fsC/+EurtmTYELhc9Ug==
X-Proofpoint-GUID: FYLjyKzEr0XDlueK_OV7F9Lp-9DRIp0T
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54bd45 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Pm_V6pOYiEt6IFNPE_0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX+eVPLJgacPTY
 dtifKa5SZCQQxHYQyLF6UVizYI07WMvR/v7VXJBrqy4Jx4W3hi9CFCb0uUEV2dmLs4V9qHbAXMQ
 qhCciffxvWyicA2CYqDzz+8d1ubYpYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118719-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68B11749C98

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation introduces a hard probe dependency between MPM irqchip
and CPU cluster power domains. That is MPM irqchip needs to finish probe
before PSCI power domains are probed. MPM irqchip can be build as module
and can get later inserted where as PSCI power domains is not a module.

For in-built driver cases too PSCI domain gets probed first and later MPM
irqchip leading to failure of CPUidle states.

Detailed flow of the non-working scenario:

psci-cpuidle-domain.c probe
--> dt_idle_pd_init_topology()
    --> of_genpd_add_subdomain()
        --> genpd_get_from_provider()
            --> fails to find parent MPM genPD provider
                --> returns -EPROBE_DEFER.

irq-qcom-mpm.c probe
--> of_genpd_add_provider_simple()
    --> genpd_add_provider()
        --> MPM added as a genPD provider.

Now when psci_cpuidle_probe() is called to probe the CPU idle states, it
tries to map the states to the mentioned power-domains.

But since power domains probe has been deferred, psci_cpuidle_probe() too
will return -EPROBE_DEFER.

commit af5376a77e87 ("cpuidle: psci: Transition to the faux device
interface") transitioned cpuidle-psci to a faux device interface.

faux_device_create() calls faux_device_create_with_groups(), which ignores
the probe return value, and destroys the device if dev->driver is not set.

This will lead to psci_cpuidle_probe() not being called again, resulting in
all idle-state devices failing to init in SoCs setting MPM as a parent
power domain to CPU cluster.

cpuidle-psci.c init
--> faux_device_create()
        ...
        --> psci_cpuidle_probe()
            --> psci_idle_init_cpu()
                ...
                --> psci_dt_cpu_init_topology()
                ...
                -> dev_pm_domain_attach_by_name()
                   --> __genpd_dev_pm_attach()
                       --> genpd_get_from_provider()
                           --> fails to find CPU genPD provider
                               --> returns -EPROBE_DEFER
                                   --> return value ignored and device
                                       destroyed

Move the RPM notification handling to the GENPD_NOTIFY_PRE_OFF callback and
register MPM under the CPU cluster power domain.  Use runtime PM to report
the default RPM_SUSPENDED state to genPD so that the CPU cluster power
domain can enter low power mode.

If MPM has not registered with CPU cluster power domain, utilize the CPU PM
notifications to manage RPM communication when the last CPU goes to power
collapse.

Fixes: a6199bb514d8 ("irqchip: Add Qualcomm MPM controller driver")
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 97 ++++++++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..01fd1843172aa22760d359281e39f0d9394bab6d 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/atomic.h>
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -18,6 +20,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
@@ -84,7 +87,9 @@ struct qcom_mpm_priv {
 	unsigned int map_cnt;
 	unsigned int reg_stride;
 	struct irq_domain *domain;
-	struct generic_pm_domain genpd;
+	struct notifier_block genpd_nb;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +297,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -307,10 +310,59 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 		return ret;
 
 	mbox_client_txdone(priv->mbox_chan, 0);
-
 	return 0;
 }
 
+static int mpm_pd_power_cb(struct notifier_block *nb, unsigned long action, void *d)
+{
+	struct qcom_mpm_priv *priv = container_of(nb, struct qcom_mpm_priv,
+						  genpd_nb);
+
+	switch (action) {
+	case GENPD_NOTIFY_PRE_OFF:
+		if (handle_rpm_notification(priv))
+			return NOTIFY_BAD;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb,
+			       unsigned long action, void *v)
+{
+	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
+	int cpus_in_pm;
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	if (handle_rpm_notification(priv))
+		return NOTIFY_BAD;
+
+	return NOTIFY_OK;
+}
+
 static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
 {
 	int i;
@@ -327,7 +379,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct irq_domain *parent_domain;
-	struct generic_pm_domain *genpd;
 	struct device_node *msgram_np;
 	struct qcom_mpm_priv *priv;
 	unsigned int pin_cnt;
@@ -415,26 +466,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (irq < 0)
 		return irq;
 
-	genpd = &priv->genpd;
-	genpd->flags = GENPD_FLAG_IRQ_SAFE;
-	genpd->power_off = mpm_pd_power_off;
-
-	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
-	if (!genpd->name)
-		return -ENOMEM;
-
-	ret = pm_genpd_init(genpd, NULL, false);
-	if (ret) {
-		dev_err(dev, "failed to init genpd: %d\n", ret);
-		return ret;
-	}
-
-	ret = of_genpd_add_provider_simple(np, genpd);
-	if (ret) {
-		dev_err(dev, "failed to add genpd provider: %d\n", ret);
-		goto remove_genpd;
-	}
-
 	priv->mbox_client.dev = dev;
 	priv->mbox_client.knows_txdone = true;
 	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
@@ -469,14 +500,24 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 		goto remove_domain;
 	}
 
+	if (of_find_property(np, "power-domains", NULL)) {
+		devm_pm_runtime_enable(dev);
+		priv->genpd_nb.notifier_call = mpm_pd_power_cb;
+		ret = dev_pm_genpd_add_notifier(dev, &priv->genpd_nb);
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+	}
+
+	if (ret)
+		goto remove_domain;
+
 	return 0;
 
 remove_domain:
 	irq_domain_remove(priv->domain);
 free_mbox:
 	mbox_free_channel(priv->mbox_chan);
-remove_genpd:
-	pm_genpd_remove(genpd);
 	return ret;
 }
 

-- 
2.34.1


