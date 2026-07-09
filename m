Return-Path: <linux-arm-msm+bounces-117969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2+uuMeGXT2rWkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:45:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82C731260
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:45:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bqDs3uXb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DdbVEixB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117969-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117969-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A557E30418EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081D01A0BF1;
	Thu,  9 Jul 2026 12:36:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25296423A70
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:36:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600588; cv=none; b=DRaV4jeEhzLO+sOM2B8jIwzs33pHE3ab4eodD9Fo0IaSzg3dgZXdIS2GyeL+Chk73UnEk6q1R3Mzy/tCqjEmVSqr4u4Wr5wsvAkNYsgMyqx16F6nmUodDPy3YpMKB/36pcILBNVJH1rldZCuhvZXvEDUxOX/AeVSvc5jGkK/gtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600588; c=relaxed/simple;
	bh=4ymfqol3bG44M4dieRqnmMS9K3jOfUavSQ+oh8QEV70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2A3ucwjjCMvDGoEkdIZXQc5UF978TAoHDdIF/GBmXOcJ8GrBpOdlWVtkt0rrXvbUIys7otmToXy8Z+kCIwfY4q024VuKNBfiCKN23QVtnsN5zMBrMtz8qpaNJ6Xv6VWsdO2RuaNeOHUGzryCryfVB5A/kMYq9l9NUPm3VhuSHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqDs3uXb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdbVEixB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN6431715890
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VedXqI4bHVCsjZ/F2dwBepSjkzM47PE118HOdwu82lE=; b=bqDs3uXbVr2ARDOR
	w+8Wx4jmUPrjvBS+XOuhvm1w2uLRc1QJEhX/42yJcuoQAvf/WeXba3clgbwGnglm
	pmPc7SoLhj4upNyh5z9wkf12Ww1gMe2Wnvr7WzxEPd6DIDy9nWuMkoFHS3gOwnK+
	D9WrJ7tVHt/hphQQdFe+K5ZAoDT4G6SxNazPbL8tf2oIvUStPrX0wXraHT+zYZMR
	xOcD8299oAqnXT0llW70cxNYGh1zq6EYVT0vwBQUDuM+cYFuChNZlvT275PXjBIS
	7fhcIgTvHjhKqHitioxMuwg0geD9U7Vn4LZNxmJQFgu8MJSmBRbM2cv2s9BXAB79
	KxYEJA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vuua9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:36:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847ac21582cso2283990b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600585; x=1784205385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VedXqI4bHVCsjZ/F2dwBepSjkzM47PE118HOdwu82lE=;
        b=DdbVEixBlMPnIn0itP9FalJ+UQExWVXHuo8LrKzIa65shtqU5EFncliJdmyxYF4XWj
         INN7Y/m+TDyn6BxKDe/xh5wXiueGIzLpljWNFbW3eCkmfmkARKw6GKckyOCiRgktUvKN
         S54zva0aRZ0d/CRDuuH3rrlAtbMAoyOMxCAqon/PUHrT+PrqcJJexGP53sH22ttJwb14
         jGru2pRxo3ULf/xkZ7zxZIB3eXOKJONGoqMBHLBIpaaq8LVzPFHg2DV1lJGVqYUv2Obs
         3ZMUW518zI1bmqxyEhkxXQs6Q6OcCagP4Yw5Lw6RWNpWtsuhCBO/o2f7Fip2QsZdO8qW
         7+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600585; x=1784205385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VedXqI4bHVCsjZ/F2dwBepSjkzM47PE118HOdwu82lE=;
        b=rLJYpn8Izfif5S5EncJG9B9yJVD2VI+i8FqJVGN28gHsYulq+K07cv+dFrbwfANWNB
         3jTWiSEs+lgSynRh04kmde2kk/JpK3zq3UlTiiFO65KE4M74ATqXHQAcecqoRq4PrhmM
         ZNuzDun3noEU16dnEABKf7Pi0ih20AEaLL+5Ncfjpf125Om3VBauGjWPzhryBXYH1ckV
         WSYn9Z9r2bwHFwz3zgqbC3F5+2ywRzdiEPu/+WJMH9lyGJNUR5O00egMcsDBkmp7BngT
         AJndbzW/M/eFtdzc1lMG1DMDg9btsZbYwDqbo5SaErYKJch87Fj/PDl10ZjweqzoF++4
         ci+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro5ocUMVQ5D1O/YiwxKsyuGfne+O24OcdM6V1ebxr8uOx1AlmL6t0fMEgUW7TnD1Dxv2xPDuWShaL99OwjX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqn+3u4ASG66fu3oYN1GrMV0E0atETw9IqIJvRwnt81xfEFyk5
	rKQtp3sUssRqEwT3/QOXaIMK//1B5K4hvvUOsaIgykGx0LLOGewYQ+VDjrzERkljhAQaqeUB4Lc
	1OR+fwq3A7IGGaki0wTGOT+vDB0xviU1STzHWF6VaubLCUU+IP3uLRlKu7C5P1LOy1MgE
X-Gm-Gg: AfdE7cl7Z2f+gc0muskZG5HwWTNzwaeUGm50qUoHR9pI4guJeVe0v18uao+lhOH2rzC
	jGPJrbWHsemdZx6krJRhDXYQKxwME6Xbcj7SYBR9ElxmV07HL8Zs9SVGBl0Bzbvu8CMZIC77zSs
	7BXeYzgDmV6YmgmQcqFHxkYl6nzD28EEmQHBhCHD4kUJtbjzvoBI2hR4oUUVFllBIZ2UsX+A2dF
	BSzs3Ed8D37R1pyLIX3ZxC0SHG43cRHPnsi2HoedgmpKuD2Q5DZQTTYzMDwXvZmrGcN2D69SqJ+
	+9QFKFnG8X7WkQRRCdjB2tfa/XJAeFY3UIfcQ3dJ9yNTwFgltyzcqUCxmusrkbiYafJnJasO2vr
	+rH+F4nWnDFvOB0TO1ETDa5V1+Tg0u2oa6YKPhBb2zmpKEg==
X-Received: by 2002:a05:6a21:62c8:b0:3c0:9c19:6596 with SMTP id adf61e73a8af0-3c0bd1a19e7mr8925620637.62.1783600584749;
        Thu, 09 Jul 2026 05:36:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3c0:9c19:6596 with SMTP id adf61e73a8af0-3c0bd1a19e7mr8925573637.62.1783600584294;
        Thu, 09 Jul 2026 05:36:24 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:23 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:48 +0530
Subject: [RFC PATCH 02/11] media: iris: Add hooks to initialize and tear
 down context banks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-2-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=3266;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=4ymfqol3bG44M4dieRqnmMS9K3jOfUavSQ+oh8QEV70=;
 b=EUm26+pkJMkdEdAiDxWpWieP9pkCNaoVMpkiJ3cyXOwBgglEnhQxkHvSNC6Fu4tPzo13iMGns
 wP0oIRNMd3NCJzite82JbdaC3oKlTq3ZtiFyUWJJE32gKC2licWADwJ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: CJFgWuh5eKK_-wooxjDcej9I__E3Mpmw
X-Proofpoint-ORIG-GUID: CJFgWuh5eKK_-wooxjDcej9I__E3Mpmw
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f95c9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=c7F6BOMWhwAoq6QR8kcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXwC+j9X4jBdit
 2kciLveoIm2UyWdEWuBiU/+0IqzBfhMi4Kq8Rv619zrXNeHp+64VfNbhxohIlBqJVDV5y4AxozS
 1JV/J5ascdyRuJjBC07vySUJTQNVL5wENHOYFUS8JQx51uJnS4sA1q+5ufujGDH16lqJ4ed8Rhk
 H8GnWuzs0psWotHPx/ckDo+YyNDeVD5f0NtYF/ezT7s0yZrVMWR3saCPhGGSNej8yDf1Jbn6N/P
 rzgqginpTVEtJyy/KuPMrEQtEA1srjlgjJA4mXDmmMn8enJTrA/fikJA2gNwpVUWsWSSTP7L3eU
 8QVK5LRPsrKugyFt2PAIplRM/t6ROidLMxPSL2nge1gLAk9YkStPR6MSw/SseWHcVA6+N7hjSTv
 WM68+yNvUMDjMoXbrdLtrxR+ZexBYzctsXVUnsWxvzjJOzBO2Y6hd9jwpd1aPQhh5QIOg7Qhpzs
 4lbZUDCJH75ceBBLiuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX+8zuK+PlgZBj
 MZw4DGPTWvdXnS1+UQmKCfUP8We2KqftAKYMYf/Y2RR0NG2ThKQF+2y9EyaAR2nkC8+A6L4xagN
 E35X7fGlnUbBQuHpLbsAv3fJYucKIkg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117969-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA82C731260

Add platform hooks to set up and tear down context bank devices.
Different Iris platforms may require different context bank setup, so
let platform data provide the required operations.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  6 ++++++
 drivers/media/platform/qcom/iris/iris_probe.c      | 24 +++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..0d738005fbc3bc0f675165aea0bcf09943441a5d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -288,6 +288,11 @@ struct iris_firmware_desc {
 	const char *fwname;
 };
 
+struct iris_context_bank_ops {
+	int (*init)(struct iris_core *core);
+	void (*deinit)(struct iris_core *core);
+};
+
 struct iris_platform_data {
 	/*
 	 * XXX: replace with gen1 / gen2 pointers once we have platforms
@@ -295,6 +300,7 @@ struct iris_platform_data {
 	 */
 	const struct iris_firmware_desc *firmware_desc;
 
+	const struct iris_context_bank_ops *cb_ops;
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a27824d45d5fbc8b9e22591decbe2a23b..0bce4fb1786bc9371074cb72e082219ded4840e5 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -150,6 +150,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->cb_ops)
+		return core->iris_platform_data->cb_ops->init(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->cb_ops)
+		core->iris_platform_data->cb_ops->deinit(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +221,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -273,10 +289,14 @@ static int iris_probe(struct platform_device *pdev)
 
 	iris_session_init_caps(core);
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		return ret;
 
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		goto err_cb_deinit;
+
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
@@ -310,6 +330,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1


