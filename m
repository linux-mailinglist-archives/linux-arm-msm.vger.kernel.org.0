Return-Path: <linux-arm-msm+bounces-113973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8j52NB0WOWptmgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:01:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 676196AEEB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:01:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a7wLSAlG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B1YoumdV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF5DB3009166
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5723519CCFA;
	Mon, 22 Jun 2026 11:01:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC4C379EC1
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:01:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126108; cv=none; b=b+bugmDY4ytUgFb2H5vi3kCgSmGpFcl/Q55p4OYYNSHK/VWIU8bjlWwRoY0MU72i5riHbEj2l0Zu1UWYNfXNpPBVVcpzHvw1uoFCLMH05dCRqz7Pgi4gosD8ZC7wYV7L1CkS041LlR/kaKQA5VxYITx1Hi5acwSwIfZi9UOGtw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126108; c=relaxed/simple;
	bh=NDQUSnItSW38oUJTEm8zZeXFfK/1bxhGeF1F7VfHarA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLGtTOrjs4i1VUNsXQ7WiKT4tJ0uRLLP/SLj7GFCXg02SljqkLgl9ya7kNlqCGF2Q6QTZfHfLMAwQKOYcEf88KBvhDxZ+JNKEFYSXctxS1kZO7HAaB1mzKzHSK+lfvYA1L/Zrt5IAoDJEh3iUcG1bAndZm33vLloFNKXVP1hHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7wLSAlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1YoumdV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAnGI7380997
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AARN7G4QPvec8eqob/vF17xv4KWR384m4AJdD/OA+fM=; b=a7wLSAlGJ4kyyYYH
	cemNmeOIbU3IZNPy1FyLqpUR/mNR1hviUFtMuS1oDxwFA4Tkvj+e6JnDWI9oEkOq
	hSmX2LhrBQciyatQSJAHGUSI/QqStP716PSzPGFw8Q5DMbVxDxzgJ60OUb9PeuJc
	9/VYn2F2RNHYkZ4OHHqodJNqkjul8/WtRfV0n7Vbcefv9aYXtFWQYFufhmwtH9+K
	/jkUgEzTxIIgMl2OIsmwJwDo+hF75LyAJ2YIugFVpPp4J+xLA+7WRXlc93r+EwgJ
	h9+rW4wwRkJ/TQxjeFT1IGgMSzjU7w/OuB79rPt8+GQVCtX/JdsBmcRDZB2Srwu4
	SSWufQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0r3s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:01:45 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4853fc7bd03so983237b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782126105; x=1782730905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AARN7G4QPvec8eqob/vF17xv4KWR384m4AJdD/OA+fM=;
        b=B1YoumdVub4AcrLoUxDEI34HFXk4wzH+9nPZS31cYnPJRlWGMkrJXM8y1JcihNpEyk
         gf0nruY/CSKlbZJqjmMjbXqOSLMRtK84dpR7oQeg7A1IpSNa434Qf9VMNBUX8g5yz6ge
         /jai60aOLAibIGUNiG0PAWQBYNR7I/O5ZkdrvGCEQLEMRQVUoUtX9WrXbuh4CCBFlqCH
         ypLubWT/nk9jJ0AboUABjkPPAv8venDy6qAzMs7SeMJ03B5ZEefBZ+etAHDmUU5frwdg
         CsxVEAUrG0Ysl/eJ//Ad5bNrJIEL2huI2Ipns7U2JI6FAagU9bXiJvon++aN+Kl8QJtf
         2poQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782126105; x=1782730905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AARN7G4QPvec8eqob/vF17xv4KWR384m4AJdD/OA+fM=;
        b=P0IML6fLoCBbtevzoy5mi8OGRx4DM25ILgS9RM3J5dISiMGtbapRhG5JNQEirDYbyx
         0Wg/GSlY5kq9gnVqjMjIqjp+bYU60RUDfaHjNHDz3aYpcbl25djj8yShQgaeh5/ERlDr
         xgwnn1A+YK2fXBQbepHsHra3LmzGWUQlvwxa6eqK6nrm6yK/uIDg0UQgjsaaEylvCGLw
         r6X5eCuSNMu6kt9gAq8tzluO+L20NI7C1F1qId988fI4XMWM1Wat7TZT2T411z6pjLyp
         D5RxWgycZ+vEh8o+JdzJvpTTgiiesRBLGxQozg4j/jtp6Ex5GP9AGB7PLN2kdlQMHAiD
         2spw==
X-Forwarded-Encrypted: i=1; AFNElJ8dyLJZ8IU6DJOrE9ZEdnurY/M7sHQUsRqLXAlOhXoSOu0HfWJ1BUn1u4XLDM87HcrXqYi6Bc4+/cxmS6Dv@vger.kernel.org
X-Gm-Message-State: AOJu0YyxXe90TNLD02zgMXI1D4MaXhn+S8UUIlKk2XzK7p1aNJV650Iq
	Uy0ldkVpvIn6f49TImc76/JV/wu31bQJSwcMTJ1PEl35MYCIu2lJUq0f4zLkRCUUzb2kvVDM340
	mTGZDSdTUElN9Zt+Ceu8knaihNgDlKkb8PDuV/WuK4Ht76qw+YLdGksSU07b8Dw9hhCFE
X-Gm-Gg: AfdE7cni1qx+RnRoBAl8YgxOAfNAQwL8oOzUUatLPfV8S7WL7IltruLPexb/I4ncS9x
	ad+CYezwZ511pVHFGce7X9b9TDAPiG3P/BgQfQEj74LqAQ+BzdMolDHdJhCoJHf7Vv2baqMMbCt
	Z+PL4fTb3ILRwLlOlNOfZeSfdVFw3p2+6RzwNcWOD3dUj//PUz+wkldlkFrZ+ObRhwgfxGBGhhl
	0hFuq9gzgbjDOet20FeyUp+o/Suds+um+8uob3J1nVEc673i38Vs8nKdZeqCENdciQ7dJUQ/OJk
	K4mrG4Nxo6ofPetdk0m7peNVRFW92tzZWf8l7JK6jQZjlqsx8upQQf5r0etl+vAya75Ve0k5rAX
	Bosw+XhT6AMfbjy3+P/zAyj14Gn14OnbG5oI=
X-Received: by 2002:a05:6808:4f22:b0:48b:f341:1148 with SMTP id 5614622812f47-48bf34123afmr3761847b6e.3.1782126105055;
        Mon, 22 Jun 2026 04:01:45 -0700 (PDT)
X-Received: by 2002:a05:6808:4f22:b0:48b:f341:1148 with SMTP id 5614622812f47-48bf34123afmr3761687b6e.3.1782126101919;
        Mon, 22 Jun 2026 04:01:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac98c9sm336066766b.29.2026.06.22.04.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:01:41 -0700 (PDT)
Message-ID: <e203221b-5de5-4cc3-b65a-a3545986a954@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:01:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-2-a3ee6837c18f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-2-a3ee6837c18f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfX8Aqah+0CuMfS
 ZYtQ8wdYmCl2geQZ9SasoKqB935gA2f7t9Bxtw7DSsQsva+mbBoHOAL09PXzJeNDQxqrlpFtPit
 q6g3KCWCfFtWyXxjdaVb9eRsVb7N4Kc=
X-Proofpoint-GUID: DjzqHyJtH6ict3AYwvZOooslZhjNsBGm
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a391619 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=02jEIrHkWd2Y-gyNavAA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfX1R6l2N7i0SDD
 /QyTg3X6KDEsFX5pvCkv7oCYnpbcupsWLQdls1EupSn5k7MjI6sWn7TpnIG9an/octTv0b2HfcX
 lNihVUYZShneWLYpRzgMAqWgQgiSuwLuX0Cxw1qQejk8s5HpIwOnuByNq7HVEoDf3slW6Odvp/k
 ncl2pfkjOx59JlU7SDJDQwUjZ4e3VKxJjwx7r/sOxC2Z4kVFwBVb/WGrbhQE3aqo6PG3EqywntG
 13UiXedge3CnvHvbpmKQaUqnRnpA1Kkl+t3XoD67o9yEVCARDbqtHpctQcniSPOBDtly7yCld8V
 thxdDVzRQP9KWOI3ZK48N9LcgHPPb3+t7+m3Hdpj7ZBDHaW0yD4ieDCEj40PxycfLecsMgeflEj
 oA7U3iGR4ACHJewMHus1JOmFucvnQOH4Vk7GejFSW1hgLJ2A2P1YcfAOnxVrh33EIiN3us31BjJ
 XwIPSOvs3kYSZkycikQ==
X-Proofpoint-ORIG-GUID: DjzqHyJtH6ict3AYwvZOooslZhjNsBGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 676196AEEB9

On 6/19/26 10:39 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/powercap.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>

Please ensure all the includes are necessary

> +
> +/* SPEL register bitmasks */
> +#define ENERGY_STATUS_MASK		GENMASK(31, 0)
> +
> +#define POWER_LIMIT_MASK		GENMASK(14, 0)
> +#define POWER_LIMIT_ENABLE		BIT(31)
> +
> +#define TIME_WINDOW_MASK_L		GENMASK(14, 0)
> +#define TIME_WINDOW_MASK_H		GENMASK(22, 16)

Is BIT(15) not part of this?

[...]

> +/* Domain configuration */
> +static const struct spel_domain_info domain_info[SPEL_DOMAIN_MAX] = {
> +	[SPEL_DOMAIN_SYS]	= { "sys", 0x40 },
> +	[SPEL_DOMAIN_SOC]	= { "soc", 0x00 },
> +	[SPEL_DOMAIN_CL0]	= { "cl0", 0x5c },
> +	[SPEL_DOMAIN_CL1]	= { "cl1", 0x60 },
> +	[SPEL_DOMAIN_CL2]	= { "cl2", 0x64 },
> +	[SPEL_DOMAIN_IGPU]	= { "igpu", 0x08 },
> +	[SPEL_DOMAIN_DGPU]	= { "dgpu", 0x44 },
> +	[SPEL_DOMAIN_NSP]	= { "nsp", 0x0c },
> +	[SPEL_DOMAIN_MMCX]	= { "mmcx", 0x10 },
> +	[SPEL_DOMAIN_INFRA]	= { "infra", 0x18 },
> +	[SPEL_DOMAIN_DRAM]	= { "dram", 0x1c },
> +	[SPEL_DOMAIN_MDM]	= { "mdm", 0x48 },
> +	[SPEL_DOMAIN_WLAN]	= { "wlan", 0x4c },
> +	[SPEL_DOMAIN_USB1]	= { "usb1", 0x50 },
> +	[SPEL_DOMAIN_USB2]	= { "usb2", 0x54 },
> +	[SPEL_DOMAIN_USB3]	= { "usb3", 0x58 },
> +};

I would expect that the names are going to stay common, but the offsets
will be different. This array should probably be called
glymur_domain_info[]. We may have another LUT just for names of indices
(i.e. [SPEL_DOMAIN_xxx] = "xxx")

> +
> +/**
> + * struct spel_constraint_info - Power limit constraint information
> + * @limit_offset:	Register offset for power limit value
> + * @time_window_offset:	Register offset for time window
> + * @supported_mask:	Bit mask in capability register
> + * @domain_id:		Domain this constraint applies to
> + * @pl_id:		Power limit ID (PL1, PL2, etc.)
> + */
> +struct spel_constraint_info {
> +	u32 limit_offset;
> +	u32 time_window_offset;
> +	u32 supported_mask;
> +	enum spel_domain_type domain_id;
> +	int pl_id;
> +};
> +
> +/* Constraint configuration */
> +static const struct spel_constraint_info constraints[] = {
> +	/* SYS domain constraints */
> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
> +	{ 0x1c, 0x7c, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
> +	/* SoC domain constraints */
> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
> +	{ 0x0c, 0x6c, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
> +};

Is this specific to Glymur, or SPEL-wide?

[...]

> +/**
> + * struct spel_system -	SPEL system

odd tab after '-'

[...]

> +	case PL_LIMIT:
> +		new_val = spel_unit_xlate(sd, POWER_UNIT, value, 1);
> +		if (new_val > FIELD_MAX(POWER_LIMIT_MASK))
> +			return -EINVAL;
> +		reg_val = (reg_val & ~POWER_LIMIT_MASK) | FIELD_PREP(POWER_LIMIT_MASK, new_val);

FIELD_MODIFY()

> +
> +		/*
> +		 * Enable/Disable PL based on the value:
> +		 * - If value is 0, disable the PL (clear enable bit)
> +		 * - If value is non-zero, enable the PL (set enable bit)
> +		 */
> +		if (new_val == 0)
> +			reg_val &= ~POWER_LIMIT_ENABLE;
> +		else
> +			reg_val |= POWER_LIMIT_ENABLE;

Likewise


> +
> +		writel(reg_val, reg_addr);
> +		return 0;
> +
> +	case PL_TIME_WINDOW:
> +		/*
> +		 * Encode time window: upper 7 bits to [22:16], lower 15 bits to [14:0]
> +		 */
> +		new_val = spel_unit_xlate(sd, TIME_UNIT, value, 1);
> +		if (new_val > TIME_WINDOW_MAX)
> +			return -EINVAL;
> +		/* Read-modify-write to preserve other bits */
> +		reg_val = (reg_val & ~(TIME_WINDOW_MASK_H | TIME_WINDOW_MASK_L)) |
> +			  FIELD_PREP(TIME_WINDOW_MASK_H, new_val >> 15) |
> +			  FIELD_PREP(TIME_WINDOW_MASK_L, new_val);

Also here

[...]

> +static void spel_detect_powerlimit(struct spel_domain *sd)
> +{
> +	struct spel_system *sp = sd->sp;
> +	u32 capabilities;
> +	int i, j;
> +
> +	capabilities = readl(sp->config_base + LIMITS_CAPABILITY_OFFSET);
> +
> +	/*
> +	 * Detect power limits from hardware capabilities.
> +	 * Start from index 1 (POWER_LIMIT2) since PL1 is always enabled in spel_init_domains().
> +	 */
> +	for (i = 1; i < ARRAY_SIZE(pl_names); i++) {

int i = POWER_LIMIT2

(yeah, nowadays you can finally declare the iterator inside the loop
in the kernel)

Konrad

