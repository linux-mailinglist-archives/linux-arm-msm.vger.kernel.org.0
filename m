Return-Path: <linux-arm-msm+bounces-117874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k3onAwtPT2peeAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:34:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0772DC52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:34:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U8FIlzz4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IBirFVS8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117874-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117874-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32E0E301CDBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC8A3DE445;
	Thu,  9 Jul 2026 07:29:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB43DFC74
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:29:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582188; cv=none; b=jg8L1vpj+xdvAA/dmQXnDcn5G8oY2gKjy5J/1vkrxZFz8WUYaFcz+kvIbNilxTB+5I+9xKePUmY3BNgC+5zA4hjE/KMX91+Rk/hp5ZIX8CIBv6rvIotlGzOlwH4iJDg+cjQdgNM8s/X58QNuS0kOLsUK3rhryC6VjRh8xburO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582188; c=relaxed/simple;
	bh=0s1aN4Mi0AzWm/Hayt7uymch60EarJ0VTt156et5w+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sH6PyqYlyZUYIhKyl1b13lXCkVFaAbbi0VKnnFxl/w7ZcU5evO8MXsnJMM17UxPD6SL4lIsydEuT3+gNEYZD6X/Qx63qaiPpKU5EvVRasrGmS0MUYhLIkeK8kG7on5iz8BLyvAczNEZHfZtomvUYGS2iRQ3u9XWtbJ6NUnj6yy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8FIlzz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBirFVS8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GVk887930
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=24AQujv9vKySCI+b9FnmRb
	ZgOeazlB7CEm9iOmkIzr8=; b=U8FIlzz4sgYpiaugQKX03IEBhuE4qll7VT927r
	rZAhKIOtfOrWUI4AUf1D1J3BjNBWnT52LHPauV0TwlH+n6IdMQNdKXYI64BDheJD
	pKSecc/fQnK1WKAZBLjpLDS6Kd24hZnM6xbAnYTt3fjXxFs14p0FA181+khZMWfU
	wFglt5uuLm0gW4fK4c8Q45yWbJRHgw3STCnW7fWahPKaN5dMlrOZiMmazTllc75P
	G8RCrTmQ5sUIrtkzGAqPCLjZ/KzkDmF9HeWxXNqu3yIgXb4G6Gohcy9e7qyyCh1w
	66GjMG3bxyX/rtWOevqVlfP20xAAiJbpv83V3NQIgC9vlPug==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq339t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:29:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84848067b0aso442182b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582185; x=1784186985; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=24AQujv9vKySCI+b9FnmRbZgOeazlB7CEm9iOmkIzr8=;
        b=IBirFVS8kt/emi1fH62YQwVJRgtbgs0f8qC+JO4+Ytu7T0M8o8QMwsLmJLvEnYi9k1
         lRZTchggG9XPHW2jp15T3RgH9NFfP4RGDlmGoLoBTi7thgbVAdNUVY3Vvrb6LtNHHTZp
         eJomsXRbeXXci9t8uHWSWQNiNxi2qtUqG7azNyZGLsXu4U+wqL7CqhEII8tTtO3ARUnJ
         bqaMRB4uJG6kLNlX20Ee/GmjhCCThmb2sjBrWNe+szQv6LHE1FoXvS6DD0vadSS8kLFR
         2eXHPsHGg46NR1T7Bq0diYt3OVkYS+OgzugNr+l+p2iDlxPF08LtPxj6jQ8uYaT2bi6o
         OOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582185; x=1784186985;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=24AQujv9vKySCI+b9FnmRbZgOeazlB7CEm9iOmkIzr8=;
        b=E14shvDgRv0u1lFu4o9slV6iP9khjM/RQlg4onnQe93xeEdP6KOmZCFVVRNFjNw67k
         H3LxhX+OvRkybawfhP5xmKIcbCpeTpBlck7V4iFE2P/ZE8Y1rHCI9RM7aucjAEHM1sB2
         UL4d2TCVdOAQ30nu2sKAbHosXo78Swhvq2Boe2gUFBGT6xylcgXhW2pjE0ZqiSP7XHPS
         BbFY72O6sIxi62Y9O+hjeA6FMjBTIVtrLLAWEhFjnleFleZeNnVMKWUmeMHbX9XuBPDP
         puSsI6p2dyVhhevOkvM3ffRfideXN/1nkGhMtcI7kgRWJyYPKl1JABPYrvyftylPEh+U
         SFBg==
X-Gm-Message-State: AOJu0YyrnN4qred7mrEeKAEWR6GMVJ31CP7V0hnO4y1iN1WP4taYUQjW
	BqSDtJIqo+mm8ALaRmNHwFlwfPev7FMnOIP9gH4TV+la6In0e7v8VdbcpefgAPmYv6riX5aJpMo
	p8lh2Y3osAG5Wqovvffjp9AfoTqCy8K2nyod56YRbs08gAkjA1BJIvR7wi/78SNvIW7w820PdDE
	EH+Sw=
X-Gm-Gg: AfdE7ckP+FSwZTtQgRE+ms0O6wv9F7e6bHGWWN0wt/m4jcEK0urJeTcHvplKu/ID9Bx
	edmF47qTfX7NJKxKm7XWA9VG0gJHxP2pekXY2dGcHwuqFbQL2UiCbJfZx+/zcmyog8Az0zohUYc
	5l7BDXyoCzA+RWnBFcOODiYMKqUnTlVj/1wQ6/Nclv2eByNibQgbnrSwNjoiZkpD3886kKEsxqB
	ejnrJClSVU1jUUYCqyRMPaTOH6D5KdkaIGrRWMkyESqjpwSu7l7tmKqIc+IO67hM8ERDJbeRrg7
	wUArukWkYo0H/aRz0/Cor1B86zoImfSc6owhQ4fYhDSAMg0y9iBaIoXuGKmHL/9uR5Lw9uU4oas
	/j1GKd761E/yzqUZLHEv2RTAFaBCR2gEYMHJjM1Vlv5u7XIHRkVjsdi/tTSRHDQ==
X-Received: by 2002:a05:6a00:a0c:b0:845:ec35:6d7f with SMTP id d2e1a72fcca58-84855fd49b0mr1758072b3a.4.1783582185326;
        Thu, 09 Jul 2026 00:29:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0c:b0:845:ec35:6d7f with SMTP id d2e1a72fcca58-84855fd49b0mr1758050b3a.4.1783582184905;
        Thu, 09 Jul 2026 00:29:44 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm8167222b3a.38.2026.07.09.00.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:29:44 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH 0/3] power: sequencing: pcie-m2: Enable USB/UART BT
 coexistence on Hamoa EVK
Date: Thu, 09 Jul 2026 12:59:39 +0530
Message-Id: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAONNT2oC/x2M2wpAUBAAf0X7bGtt2PgVeThYbLl1TqHk3508T
 s3MA0G9aYA6ecDracH2LUKWJtDPbpsUbYgMTFySUIWj3Ti7dXe4Ml44WHDdoow0qkhBwr3kEOv
 Da1T/c9O+7wdPMdSdaQAAAA==
X-Change-ID: 20260709-fix-hamoa-m2-w-disable2-0fe775072c74
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>,
        mengshi.wu@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: AwoF9KuOFYWEZMcXAOcfNu83V3TRDPI7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX9uO822oaolXk
 HB/GJ9zEXGQWcQYaB80foCVhUQWTDeLp6izDXNhLh/yaKz2FkEnRPsouNoutVfd+ZJuRG34Wzg8
 EJr2lsA7Bv70aldDq0waU8xwDLMhaf4S5iW60LBd5tGwXCnX9ckkCQLYpcefXqL/t5KTrOJNoaJ
 JbgoVP1NzuN9srM8kjSkecAkWgGDxSsQ/yYFUvp+u2hye4m7PGbyqj8TXmcPX4oGazVV+h1DFe/
 HJ/Ob4vSQjE1DGnkXislVa2Jixc7heTBe1jDZCS10uwdjbGzukUMxpxr0saKBJbWgdYHFG0LeEa
 vozXefeMPGIJxyTGh4ZUgAS91scb8sI/fyY9reXenIn/8FZ7DmcVrPp7Otw2Eb+bbGINeSdhRWd
 hL7RxqZtRsheeBoi4PfPpdaIk8ITUJ5Dx+opMnTFCAMODywQGoJ7JGFvPkOATzCq/ulXQ7Zd9/3
 eDZkLm3r3LrMPJog4sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX8UzJK8+vKZFC
 4vC49C0+SKIHZwemh1S6X//QlDVzEso8pwogBnheU3YtvQRZf7ai0MDaRuYZaiTbMFN6KTZHM9v
 d8OMgitkSnQGJ7ZDu7VwVqUJpvmgql8=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f4dea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=H5-0xJHwKRPjY1VIS5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: AwoF9KuOFYWEZMcXAOcfNu83V3TRDPI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117874-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wei.deng@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9B0772DC52

M.2 combo chips expose Wi-Fi over PCIe and Bluetooth over either UART
or USB, depending on the card variant. Both variants share the same PCIe
device ID but use different sub-system IDs. The current driver uses bare
PCI_DEVICE() matches that cover all sub-system IDs, so both variants
trigger UART serdev creation — wrong for USB-only BT cards.

This series fixes USB/UART BT coexistence by:

1. Narrowing WCN6855 and WCN7851 table entries to UART-only sub-system
   IDs so USB variants no longer trigger UART serdev creation.

2. Deasserting W_DISABLE2# for any PCIe device detected under the
   connector that does not match a UART BT entry, allowing the BT
   subsystem to power up and the USB BT interface to enumerate.

3. Describing the PCIe M.2 Key E connector on the Hamoa IoT EVK,
   adding w-disable2-gpios for software control of W_DISABLE2#.

Validated on Hamoa IoT EVK (IQ-X7181-EVK) with multiple M.2 cards:
UART BT (WCN6855, WCN7851, QCC2072) and USB BT (WCN6855, WCN7851)
all work correctly.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
Wei Deng (3):
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
      power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART BT variants by subdevice ID
      power: sequencing: pcie-m2: Deassert W_DISABLE2# when no UART serdev is created

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 129 ++++++++++-------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |   1 +
 drivers/power/sequencing/pwrseq-pcie-m2.c  |  39 ++++++---
 3 files changed, 74 insertions(+), 95 deletions(-)
---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-fix-hamoa-m2-w-disable2-0fe775072c74

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>


