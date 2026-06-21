Return-Path: <linux-arm-msm+bounces-113896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g5GmCcRtN2p9NgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 06:51:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D061E6AA395
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 06:51:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eTue4SPU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WvxagoG9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113896-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113896-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD84C3013EEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 04:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29136308F36;
	Sun, 21 Jun 2026 04:50:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB96230674B
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017459; cv=none; b=Rh7SZSAibr7XS9gffAbbEyfs8de1XCxiiZrfczz2mqHDBAgbbrl8jyGIfkRjnUwyAZu1Knht7QhRO42GtLKSe0kHdBRwHbWEykHXugZ6ZE9klkJFoVC/N3Te7Gt9l2CdYgLhT//3lS9LAExzCQXlK1vmMMoZRvuPQlJcKXiIShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017459; c=relaxed/simple;
	bh=1c1Kt1vhMgfjap+7+BLI1rc339XdrNx+BYTbudyrh5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spFqyk9wEjIQEhtyJcY/AG5kJxykZP6x2pZd6yU4Bk0WQQ85/6ZGa4Af6cRZhTqhRCTVMSN7slayz63gG9f15kH3lc024ibZ1OsuPXvmdK9sXP4b0XQ8zBh3Bk/94WWMm6PwHbhJg/4Kd0Ao/qUCvFp/1H76Q7OGsKFFq7x2j40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTue4SPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvxagoG9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L1FiCG510118
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVFdGjHEo2CMYavDiLCcPr/f5Nf9GwgzzP388KYM/lY=; b=eTue4SPUskFQ20N+
	VNbrOcGOWEPM3KrjBrwON6/FBoySqck/xc3lkoK1ivOlhPY7MIIGr3/9+yg63+3Q
	n/eXO0POusYf2isearheWanu1iEOtohI54/qSpweSLGpQTRnj/yz3rg0T1xMDmdD
	wDL9PIXRsAtOnOSa0HvJnNGc+9A6pyu0savVhzEuzqbHN7nBZu29osoWY5/Sb/O5
	q+4/4YGMM+Hn8qjIWqNR5lYNzJYIhmxarLdqWsE8oKDNpy8npOFDcAVaGsFoL/GW
	oVVp+suiOwG3ila/RT8RBCqXDFmh/vlahAjMiPBJmOUbu/gUr2dgDcNnO2J40F+Q
	f351rw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjeahw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:56 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fec7afc9d1so68277717b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782017455; x=1782622255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVFdGjHEo2CMYavDiLCcPr/f5Nf9GwgzzP388KYM/lY=;
        b=WvxagoG9Mg/fR6W4YwA/HE6jV0tg0SenEGzEt8646v5tID6YahXjquYL1NHMwkMC5q
         uZNf2OkjBhCXUM8at9Mt1wChbZkhVFneOPVRjQbJLzKgFxOHcq1SAZkVOl9m5RFYbEqP
         7LbL9nXUWQDIQ2G5czd1ViRFsg8rgsclTMxU4oGhE248xZwDeD8FUaVOTEQSq2acCj5/
         u4TR8sYJLBUVGVUjuruuwsX++jb3UvNcgKVEVxnlO6wxNojxuZ6g/PH3fQQNt09cXTUA
         5Gqc+dwW359P1B0wKXPFEV5h60gAHQY3lqTCSEOn6I8XLLyeyhe2a2j/YyqrNnH+iH62
         7oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017455; x=1782622255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CVFdGjHEo2CMYavDiLCcPr/f5Nf9GwgzzP388KYM/lY=;
        b=WJPfVFN1azk1AROmOPzWpSvAM65Pv/rsMcYezpPdnBF+NWsmFIWl9bOVITKIfS0Tul
         A3Zs+tp4GC1cL0149IXt8D3OJtS8ffBDPBzSUopjVbuQ6+ggzXb4TESbH8uLKc29y+v8
         dCS6UDQ1ibh4lrmMbma5S0T6h6NrTE5YSZPQaYuUbjWwKR8tsFpkhx9sb55OEF8JoGll
         m1RgDShjO4yUD0fk95dl+icjGX/ZTMDlwNS1ef6Gr1poGj38xGRIOMfkXqI3R0mpERht
         dXnr8nJF09dhVm1qZQqZSFzAuGacwbhZKj6+um/Xes7jkuWwfJ2BCJJsnlHlknNCQEUB
         Gz7A==
X-Gm-Message-State: AOJu0YyjBi5Wpbbm3FmKF/ZFR+QMLgll54c4/tToT9jZTryyn/97E/sU
	K3B1xr9pm5igHXMPP7WmSPEcLVcdLhfzoXTfvMv30Qjf/0SnGyzNfAKEcE6GwgmdoIUFn/AFLRc
	9PL86K1a39S9S+EN57aE83TeoJabkbDNlNUcJXLZ2fjIO36xQE4TnZNAjRBrnEwpAy1RG
X-Gm-Gg: AfdE7cnaU6EB6Ki/H9ZajDuKSZF94qv0ZPeM0uqcVM3Ab67ullzMqhft5NyAT6w1E99
	8OGntuSklA674KHFITc4cQM2UIo5Ar8lyWw5i5MvhK57Ijy3yqEgjVHgMmU4Uk+BCOOkO5UL1lM
	LjKDrH4x+HNqp9hHufpFHZBAghFjKV3qX+ZtwPNrlxzm7eEz4Krh0h21e97nBewPBjhGerHcffo
	so9KH9iHBQxw//k+fHK2jiFOGDNSlD2oOptZ4jmaN6FBWaW3Ds3II/BV7diRzZzeyoPfqGyH4Js
	Scn+S36Oi81Capm3RhotoxBDGPbM22yn4a1WhdLd3tLV5DHdQvrQqWoyDvD0WXrqn/oOUzlmkZO
	0QG5aL+X/29BJ5d4g7P8IQABognkD73RWsfi2rk6gEZ8N3zXps5xv9Fx6YYUwlgu5tssN+JT1bZ
	7sVGnrT0hUAXKE63uQdX6ettnWngzPTyuGaMCa8U9yVlvGZwK/MNg5dx0=
X-Received: by 2002:a05:690c:6b83:b0:7f8:7e6f:f544 with SMTP id 00721157ae682-8013498873bmr95668567b3.50.1782017455362;
        Sat, 20 Jun 2026 21:50:55 -0700 (PDT)
X-Received: by 2002:a05:690c:6b83:b0:7f8:7e6f:f544 with SMTP id 00721157ae682-8013498873bmr95668457b3.50.1782017454905;
        Sat, 20 Jun 2026 21:50:54 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:855e:5925:800e:2644])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8026089574fsm17226837b3.44.2026.06.20.21.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:50:54 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 21:50:43 -0700
Subject: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook X
 G2q 14 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-glymur-send-v1-3-fc4a2cfd107c@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
In-Reply-To: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: Q7k_seweF2HXfT7Spgz-3wi_psSjApeD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX0BVBR1/S+Zhl
 BkNS83QMTokCVc9m9TZJ7fb1Y4U6ZIqA/fXjy1lGiyRrPcpMno7r+igSa0tOjF0cZF4xNeU3oEy
 saCxaCEvS59bHDpnNc//e7nLHUiKCrA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX9dJHL4s87QZC
 pFcGGR4wREKf3JGs8RyDluWTGCwAqWwBJIAGbz3vAuCpxuZPHkHLu4Wx9wp14OgoYx/fNDWRjRL
 ib21B3ljvV/yXSY/G2jZEGt1UZvqbUEL4t44E20dFfH41L+PUCqxu7bbBews8wWe164LsCstSkh
 tdkUTMYnp9ZvOsMQF76IgGF1CcrVSrrRKdEETNRhOV4KzMwHBJQuNnZvJzb44UwNuqf7HT/CSZB
 5c+wPToAwACixS+82qP2cx8ptLsXPWwr/aM1Nd1wxtkPCz2mp3oFug3qb3zzmBPl9G77VIOB0pF
 ZeHuj0qBF0O1zwN18LDmAwzDnJNN6hmu2yNs+Qn8u6fF+rs3D4iA/FkY+Le4K4xlSQpSEoYwcUm
 AfmPHyThf0k+I8oRdmr8j4VjovDRtkC3leEGgDFMMkELSI6LBluW4AVIkj/PM3Cak6jIlv3AwmH
 /dy6vFanPiYiNgAmIjg==
X-Proofpoint-GUID: Q7k_seweF2HXfT7Spgz-3wi_psSjApeD
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a376db0 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UXNKUhSJZRFg4A5DIqMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113896-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D061E6AA395

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..618437f5aac8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2296,6 +2296,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1


