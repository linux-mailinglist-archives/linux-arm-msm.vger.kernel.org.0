Return-Path: <linux-arm-msm+bounces-89478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0CD389CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B808F30F2B5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F82325498;
	Fri, 16 Jan 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCs2Y3vA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fa8NN4Gf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F831812E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605680; cv=none; b=AxHgtR7h9jQpIJdGEnferWGAm81sqG2pTQxqKlXdGeGHGptQk3ZWZMBwDceBrTkfo9fEAqQbR4pPItRrrze9rxm5VYsNADvKqNEE51GdLm5QvutD0OfakGY4KSx33nj/1tthNz4sCP+G0azxH8uVv5+2/uPNxidd02w+xVzG/Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605680; c=relaxed/simple;
	bh=jYMZSplTH/Weoy7w2xwkPNIev4l2TEwX13EaENGM7y4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IIjtd9TWRIWMIDirbPCojBrzxQM9V7VZi/xZKDwPstdXoacsPf/mLndEc07/mf2Z4w2Ug92EcCjFwgUylo50uvhjiYgUavY52ZOelbTatvXp1ALBvv8msDq6C6RkSG+8aWb60laTdqqalizmZsD9F/KVmp8nPrVepmiNYz/aBuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCs2Y3vA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fa8NN4Gf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDk0o2959651
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7PTKth0UrDe
	AreEEoorgLCH/1E+7Lkz0YAQpMI46XKg=; b=ZCs2Y3vAIhSwRp2Hfh2X86eqnec
	Vp0LrLS2Q4rJzkgo6vMRUdnShjXyQM8txvRnalpRx0A85f4v+2gasrlq/nKcv09o
	LXsKGXJqZcYWkCOWkrSmJfyT9C+0/J5MxYB/pyIqQsnEmhzZwKWuoLxfbsZ6LjuF
	a11ILSL4iGtXw0LNv8MxbTWUFg+2mtxYNXHzznJ5wVfkTmmY1NCawOLuKSYDfoiv
	Zo50Gt3eOZS6Nlvp8g1hRwgLpm69fRHLm314Ye1qDwTOCAMyw2/cycbKZGWLnFG/
	jln7gCcAu6Vxd9t8OUUDfp50by1fxv0XPIJv74nvtHYWE86jjBvuVmI7nVA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvhh8ahv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-123840bf029so4797928c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605674; x=1769210474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PTKth0UrDeAreEEoorgLCH/1E+7Lkz0YAQpMI46XKg=;
        b=Fa8NN4GfJIbM+nJB5tXxrqJmFhkilYLl4U+knmm48DBsxBqbyRPj3RXb9I3slPhcEz
         8QPiD7N5DFM9vrrvsoukMEt5ZJW+6xqwxZGPLk3bzUVMgdD6oi5FudforWSqDxk0mZQC
         QoeJaPDzxiw13Gto8s9HOLZOGzXmNIubnjmEsRkOCaVY/sVk/AjmNApcPGrO3WwYYFAZ
         kkNtwbm89nHgBEooYrHAVpN2l7gSo8uOLo5u2dh1jQOroV+VpqGQ0li+2kLBdj5ELgJr
         e/YU77NUrEYqpo7mh+H6+AlM1OOyQgcewr6MF3BM5/kM+Dpnu6mPxx3oXVIolkWNR4Eq
         9Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605674; x=1769210474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PTKth0UrDeAreEEoorgLCH/1E+7Lkz0YAQpMI46XKg=;
        b=oRta9/a2Aby802JduBuKG3y5V6rj3dfL0e937zjaybynw+/vIO1rp6VNI0cRMH4Z2z
         igb9zbKKOIwo82B+eS69Ho47TfRlMrmKjsSsTfN6Zo00HjfX4TwtliTHIf4NqE8054l/
         iJFR+pxmZFTgQ2ZeupGFDW8hNh47BR9ZQ8gPO1VReSFAfHUYaolTvHfXfmaW0a0xYbvq
         ldhg42mlj+RmqKuuRjmpVAqCCQphLcIggT3wF+HxijVf4U7FU3MWBSWQ4oEYJl4zGcOx
         Y5SWLfTpRkIDNGbWnRjzpj34QMCtGDCICeooDfAPtD+PaYVdD689SXnEqD++2XBZDzSY
         Xd3Q==
X-Gm-Message-State: AOJu0YwgAi+EcbIC34fNpxsChSbzTITdWWDF/t0snkDxWabb9Zgoke+c
	3rJ2bU2zmo68CUSCIt/hKY0046Ch+XqqaMHaLHw7T4IbOfLVLiOWgnNCLT+P/RFl4xDX0xA1bs6
	SwHFBuJA9+Hv0n6vT0caChAbvf6/ujfscgDbTvwv60vO5/pV38rZ2FF9NYk9YsoYZLo7I
X-Gm-Gg: AY/fxX5HuyVxnrFF76GaIPjh9MVsFI80Dfh83dzydZNdMPPHDt0aa+0dBprnGwPdQCF
	QQKsIEIezvSfWjPYThcPrJbczdjs7FgVlvVlAY29SNB4uF58R3BPCDMEJ7Wq/8jeamy0Lz5B/HQ
	O0Jv8UH6KYkexg81oIA7fGeAlftQw/zG80J9uyTqLlEN/wZXOKnRJiTs8sMeJIwFzmokWDydG9g
	dvaA26yq7HDRJdKbGJoyAT9KzTp5gvKyl/KXUbdLXnbeqEl5fPqhwHTJfZm9YMTIU2she7l5xkK
	fb5OelzZXWpnikvGhK1lAlT9rSakPUcjq1g4KHpcSRS5nAZAl+3lkRqSLN2XiOj/svEPAVRHiXL
	VnJkB9Qkez0T2v9qvuIQH9MUYe9eBgXKGT37I+IVW7iTg+9GK/fbjFtbWT2Lvdkc=
X-Received: by 2002:a05:7022:4190:b0:11b:9386:a3cc with SMTP id a92af1059eb24-1244a78115bmr3483068c88.45.1768605673615;
        Fri, 16 Jan 2026 15:21:13 -0800 (PST)
X-Received: by 2002:a05:7022:4190:b0:11b:9386:a3cc with SMTP id a92af1059eb24-1244a78115bmr3483059c88.45.1768605673137;
        Fri, 16 Jan 2026 15:21:13 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:12 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Fri, 16 Jan 2026 15:21:04 -0800
Message-Id: <20260116232106.2234978-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0CCa_veR8dsBjnke6DZXe29LuGDUfy5j
X-Proofpoint-ORIG-GUID: 0CCa_veR8dsBjnke6DZXe29LuGDUfy5j
X-Authority-Analysis: v=2.4 cv=foDRpV4f c=1 sm=1 tr=0 ts=696ac7ea cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oDIJ3hVRoRHbvujwG_AA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX3OReqd0vJbEt
 ax1sxWgzvV5tHGEpYSzQ5RjfFXIUSdZsF7WyWtxgzky3+/IzEP5ARe4gZ1bwWn/+Xex0TWxCcNe
 Bp4ky6sexOvJwruW3rf45kGrWtVcBJEJACRJHvs4KIuGVENRTWWSYbGhCRk+Yj/Ly0pRZJVdM7Z
 qBrXrIAu11KzygQ0mK4j+6S/UJjocf265Co0jRgPBIUWXLQpZKKDNo26K37wfkfW2u6HkXkMO4y
 k6+JDxXOXhym56xzm0JMAR5pA72VKQvXO4tRZSTHLH9ahvUtRf1KNcNs45/zVrjvdRPKB63Z8pJ
 rcQYRaclxL69/71SVjMJ8uFvZLk+dtqe0t3lwBLza97AD78DwdFlUSOjo4YaZRZ9mZY/cCYyw58
 BGJwDHFIt1JcEaa2pwhGSS+HdYQ/TCKKBPMDyAQXDu+HBOmcgY8KbUN0Ep086gPFghi+pFYZQGw
 W6icxyVWe6yWaJV1CJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 3f1cc7ea2a6a..60f566427abe 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -343,10 +343,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	if (!path || !path->controller_sw)
 		goto clear_irq;
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1


