Return-Path: <linux-arm-msm+bounces-100183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DWEAv3vxWkkEgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:48:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFE33E7E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D5393191A8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 02:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4076934A796;
	Fri, 27 Mar 2026 02:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz5okk/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro3mAG6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825D33A9E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578243; cv=none; b=mNG42Eur3tnCTt6ZVYX8fkXoIFBSsykl9SfS1f17ACi7oV+D2DcErOdLJPrtFbP3k6kXCQ03qlsKvvLBwJ/3zYvBYiZrFePbafMxY8syTgbTXA6tOVAoHAbYqV1+SHXoSvJT2NN9opBbfKtAU8/oky7tZBsShoAuYLX9MKzPNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578243; c=relaxed/simple;
	bh=i4N0HAMPUm3zO7DR4evOSl6UDCHXGFgITARXSeiej4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpSOfPRBGFTzSd4qfKwcf2B1BS2LgBouZbeb0Mro/ARQbP6FutGoUkmo3NKcpWrY1BdNNUHIEkEqoR/RbBI7V1addDWQP8B+cvDrlMrG0akjJJpL3E4jX5m7OoonelsCbZ/PCTAu2JrxQjtV0XlmzfhEKn4dGAWqO2T0GI+cm+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pz5okk/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro3mAG6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QI2mZI3757371
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ma8Dtb5mLRnOlanyBjOcRR4ysLdtbJQy/XPGvVqSw0s=; b=Pz5okk/dAmH6Xe1C
	t32tYr63p8GljDR73ywqS6Lbr94+QY0CQiBDiYkQdmOfAQzykOURiSoCOXMnFVOW
	rf6xmxkF5cRAwxh2cMpuTD+708LW2OXwk77no7XYJtptPG2g6XPG5TeBULvRc6U3
	TLVJn2Gqd+D+9vbG7E/I48sgVFEl/ddvoUJQcfCmqxlO/kdlGUtwxCrDccWF8D24
	II/Znf7nBHIocqkHMnhK9W2kTsI8+uzjNWA6sbJS3udJxHCAnEnsKaWR82cWryjx
	L2OfenT+zMMYgybkk6CifCl2ydNB63BerD3hHBAwT3z6EXyPl5RD8QMhg9vmmKvx
	HJKmSg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r19bqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:24:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7656dba76aso1045468a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774578240; x=1775183040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ma8Dtb5mLRnOlanyBjOcRR4ysLdtbJQy/XPGvVqSw0s=;
        b=Ro3mAG6RU9l0Rc5+i6eoJ4SBIEZnDuhHo8pcUgVQTbRhvA4l8BAfw2PIwII5tBfxGX
         KSKIOliwBZZc5FXQWj2p+8Win/6sdiRsaHit9HYtoeusNP2B1soKdPcDE8Nga+/PU571
         2n9oUCxK3H6Bwz4O8IGDLlR5r6V3hE+UYALqN2c1KE7I+lN+X9ixLQMtu2uhWHDmlTsb
         CTaqC13dfhtaVBPEXWTjaNgWBUK7prAXTCuTpbhMo+N0PwKIsQCDVR/BCGurfES7wyf0
         DEmiF3ZYuqttLZ5O4ULLFb3c9aFZpSPAJQGpWt22VJrlqTDZxEVP+iqU9gWyXrvqbYoH
         GIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774578240; x=1775183040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ma8Dtb5mLRnOlanyBjOcRR4ysLdtbJQy/XPGvVqSw0s=;
        b=dIY66FlW9ynmmS9UXaep3tmns3UhaDE8N83ZKf585hGPNFbhnFk/m5JV2t3GscJob9
         HOoGdeuAbJxThva9wAq2QxlCv2rHhqRHFPKtOGKQuIvAw13ACF5XwTdAexxmY8VDElZt
         KEW7ASk/QCBXdkV5TGjP1RrsAPxjYhtihrcvRywybahwG+LGRlx5C6fw+ADyXfRU3PCN
         Gm9GhRzS/Bn3C3swlD+IbhlylqY/zVyC37BEKhRXEYDSxxiVIM6o7yQmj+u6tcteDV1G
         15uFsUZGT1+sTbtYHKfONL2g1U1DEuvN+c2v2W3ixC+pQoCwzDWuats1wAirqTEf25qz
         aZZA==
X-Forwarded-Encrypted: i=1; AJvYcCUUHUBAwP+6JMOtOCdk92uJvcz4MZz1ObvHo8p5F0fq/mwfKNGqskAEcXDYV3aB2iT5ztcsCBpb70d0c0ZK@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4mm2uUNKBsj78WTEO64dsImXdUuqOP0dyWhFa+WbmyCgJoHO
	RkAM8/Txg5Y2qQw7jY599j+Og8fz/EedqPcnNDpMYjzhhObrB581GGRRYfHPp4CxUKgbk+AqrHh
	KHF0jmaKl4D3pDzmtYuHZDMjSmWEAss5zMIbGKXGhyf54uc6ABfOSgHuNBYPxAFRR/Si8
X-Gm-Gg: ATEYQzye5roDcpI/CGLGcFSqA1NhrTBlFkDnug/k0Ib8B5EgZteCaz4uWSEjw/xSfJK
	SUN55ZZFJ/ahARslGVG2iaP4UpG8KiTWbt55GMRuE6AkoaOW/GM5nLAwR9wh86Nnc43bU4lmeza
	opUGgve/mmgSNCIp61GfJVOlxOkTWDtovij92alWf0yECH0FVcqHCvAZUMXhrr4kUqKC8V4srdd
	rWGLDxfWHdAZWTqlK8c3WJgCrrGx8iDz+VlCjSjqrj6/GhwfAxP+IeiHVXj2AgSrWo2lUgEHIvy
	C0n23SUUKmRjMmDqjJlV+4MyEQJUpV7Ozp/nvy3AZzlZKHFlJD6kCMvWMvsD0v4m0nhAZrQUnPj
	myy0e49YItvbd7OxoSCvONetvIaxGEDYC1NDva8HloLGbAavxoOFeL576CawTXX4fbmDeJTHex6
	yjs0DyhFPMqqeVVXx0lQ==
X-Received: by 2002:a05:6a00:1803:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-82c9605c95bmr685468b3a.39.1774578239897;
        Thu, 26 Mar 2026 19:23:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:1803:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-82c9605c95bmr685441b3a.39.1774578239395;
        Thu, 26 Mar 2026 19:23:59 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c2714sm3848975b3a.48.2026.03.26.19.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 19:23:59 -0700 (PDT)
Message-ID: <bc6abd24-d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:23:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAxNiBTYWx0ZWRfXyslL61WqrPDg
 oXq0lCszIT1fdg8FAuBsuuPSPOV7xcmofOeCX8cJdGlUoDZuu/Hke9vSpQrsvVupyZoNOTkiTVA
 rlLWkjlBYpBDGXyDEgWA27D55ZXxPiwuEFn1ujrjbzS+l2NDP/Y4rHrpgO17CAN9EpKbHZs/5wh
 revl3QYTdQsQoolyM9//TUH++79I8oY8D5w2xzISFLG9JBL/sZTYwRCneM+/QauM2xFRaJcqoAF
 tI2ipL7YGM5VNM+ZUD7SY6meROVc9Uw+Ke8fCNtq/QlIIsvk0jDAUcNwruOnHs1VmfLKe0h08Kb
 VzJQ9n+nevsllB8PuzCImJV0Ojsdywx82Gx3/0ntbzAOklHXwcH2NQ1bxacI+3d2P02nJ0hHFu/
 6j8ja2cPOYMntllplAEVHi4NfnMboP1U3gUFVl7iNWHBxDzegHrjJrIIpPnBASPALBe+VjTqDMq
 6/KqHmTVFbMJALnghMw==
X-Proofpoint-GUID: F2Zk8h3IE4hrxN971nn0SumWER5JxMCS
X-Proofpoint-ORIG-GUID: F2Zk8h3IE4hrxN971nn0SumWER5JxMCS
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c5ea40 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=irf8UKbSWqAIktAtPRAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270016
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100183-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7AFE33E7E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/2026 9:04 AM, Bryan O'Donoghue wrote:
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/time64.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
>
Hi Bryan, one minor observation on the following macro:

	CSIPHY_3PH_CMN_CSI_COMMON_STATUSn

The 0xb0 offset implicitly assumes a fixed distance between the
common_ctrl and common_status register blocks. This holds for the PHYs
covered by this series, but on some other platforms (e.g. Kaanapali,
Pakala) the offset differs.

That said, I think keeping this fixed value is reasonable for the scope
of the current PHY series, and it does help keep the macro set simple.
It might just be worth documenting this assumption (e.g. via a comment
or in the commit message).

Alternatively, if future PHY variants need to support different layouts,
this could be made more extensible by moving the status base offset into
the per-PHY data (similar to other register layout parameters). But I
don’t think that needs to block the current series.

Related patch before:
<https://lore.kernel.org/all/20260112-camss-extended-csiphy-macro-v2-1-ee7342f2aaf5@oss.qualcomm.com/>

Best Regards,
Hangxiang

