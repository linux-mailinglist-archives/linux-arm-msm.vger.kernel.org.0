Return-Path: <linux-arm-msm+bounces-86102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 303FFCD4C34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 887173034639
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 06:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736D4326D76;
	Mon, 22 Dec 2025 06:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADDhwNWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxUx6m7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4CD326937
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383422; cv=none; b=n8JyJYiTPm7DneXJbChEG2CpzzH2h0134lauOFGxFFwCh9QGD3yCFpHqDUI20y4OI0lrb3Jg/fnAELNLNwaLDYaH2jLJGLwDRtdamerALVL9yO4ePKB4L71rt3IAc6Ys2mr+ZOkW56BTxQ479Kuvm20pK6IveW53FOYzASxvh20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383422; c=relaxed/simple;
	bh=2HOdIFHx7rQMqAGvzHoIwZDSOaSh9TN+QYrtFLDPAoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tRHaqVsg+5RJo+T7cxasnx3lwDr4wv2aMU87+ihnrUh6vBTuFuHq0Ys8fl8mZnX2bvKVCQnUX/kvgfO2pJinAdXtBKfMNduOjBMNUJFw47py2hMLRzumFIKdk0bA+HZ5RlSw2ODO3dYoKckVt0ql63EE5u3Vwf/wur98uBJk3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADDhwNWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxUx6m7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLNNdvY4176444
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jRrEo65pOkA
	10zcqstnnxrzqRwyrbM6potO7GiKVyKI=; b=ADDhwNWc2afmYB8uHyDEdnQtK42
	Z6y4b2Atwnn6oJ/a2nKfIPZ/PQyR+oeJz0F33l3YWFCZJtWVHRBRzYWX2+ALeWC+
	et+IPcCpjSGAA9Vjpc7j5ib+aJV0+6aOwQFmpckUyc4uXSIo7KOugiuByKhwDGeG
	GRphpBh8p1l9MtbExV0yMeriVEXb1qYgm7iE559JVLNEqFDQpzNLK+OWiKwriqmP
	ApuE79DCsxp2Zktz4MIXpi6LqKfQJhF9d+FSdzq6SWIfjloyh7ZMFNQMrPo8kxyX
	1AZfYngeZLJDfIw3KPyHo94hiW3sdiOWOeNtUAAJBAEM5+SEWWjC53nmqTQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfkutg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso10084650a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 22:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383419; x=1766988219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRrEo65pOkA10zcqstnnxrzqRwyrbM6potO7GiKVyKI=;
        b=bxUx6m7RGc2g5qZeRfpXfHYYJxcWV7GRIeDywU/1XqXpmKe/dvLaFo+BIB4Ju2ntdq
         PaC6m3bfy2gkFxEqOqp/cNbIfdaNtgjhyO0Qae0MfU5+RJCzgC8w3WeyIk+nQ0opL+Lv
         mlMY7jjrEVRazIYMlwPb4K/RwJk/SlBMcUZ18eGopjkXiB+wrZndDJJCjoXzsurslfCi
         sTz+gGyuSpzjFAZPho/Uyz588SqWCBiGcC5/mQP9U8WECbY0wRRlHqt7p+yQTbW+K17Y
         MqhfVUkuDwyHwF4NHBoDDQ6UeV55N6MrcgIERQgvuG+9Jb+Sp/49BQnt5fblnMg+/zmB
         zTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383419; x=1766988219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jRrEo65pOkA10zcqstnnxrzqRwyrbM6potO7GiKVyKI=;
        b=hqCiob+hdF9LLatNNGivdip2thDM6GdqgoVHx5W7ipJ/+WOYaCYjwubO+MFYFyqFoG
         ZbDTTcPz27AlEB4dzIEjh6YNk8zK+0wt7DmN78fd3TspLzntyox321cDdFq+8VUFu0lo
         OTet8HuVFhukq5m5BW6cBuJ7m4Pl5oVMknRNV8xCuCVO5rkVYsIYoyYtmkB1BWrll/V0
         eQFSMySHA4b6Dj9Oq/nZwQd96xjSGwz0Ev6mCpaRs95WF84/FUDR8JnBwLirb3N9f6dx
         4Wg4ANKorCgx9t62BQxKbnA72bMR+wzRzFyQTelmvMtXhjqMucIpfKg6Uf0fK4Oi29X6
         ZllA==
X-Gm-Message-State: AOJu0Ywtpe0QuPSqHwqwl0fRlA5i7ai3t4zVQk78ZkCbw9nb6YHLfwco
	F+lmj4KXCjfoJDDv07HqCRRJ7DFJULs6OTm+GSRwSSL1EkMTG8+B0DS+3MZTS2IBqVcDkFRbg0F
	VRwqmZOmp0WgfbSkQ89tmkovMq7Arlz+IBLzFQ6VXBXa4qTuSrW0z0Fsw0zO1MjyFu+p2
X-Gm-Gg: AY/fxX79y0263a3OgW4o9WvmIHb6UkzEFIi7f6LeIfYxrk0vlHO+pQkvBSxek9djxeb
	0htl0EbO4FwIi2BQAafDb2k9AYfsqqpbJRLY4VRMj5GGd2nrLCfXtYbN0Mr1+SiyK3Y2V302Hib
	O0FM+j8fXL0Wtb49oxbfz6hinyrR3XO9ispkbSLvZ7H4XLQMrXOmzHEDTQQvcvaQXw1CItBQ0ez
	6XJqp5ON3jPbv7+4qK/tg34nBY+NpUOIpiAvVQzis31KgbbJsGOm0/sS/WwISR5r7bs0lMy9zMA
	+2NVYKfemSeIxqg9h+peCoEIWz45//+wG96EKzaoPJMLtNRQqFpzpq1Es16USKvRNIN60Df5hbW
	ZC0deWXfssSV3n4x0HGrbMqG0p1MpInm2DIAWkDQCEFLJU4//ZXJfE+PfhuMhx0MUCaMw8uJibU
	A=
X-Received: by 2002:a17:90b:37c3:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-34e921222e4mr8407964a91.8.1766383418532;
        Sun, 21 Dec 2025 22:03:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKA3D0UZC+xjfh66ByXXzYWd/qrhrAJAJRBonmIq0VE51dl8kz7ILkP/PfuaCUcDaBWyqw9g==
X-Received: by 2002:a17:90b:37c3:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-34e921222e4mr8407938a91.8.1766383418083;
        Sun, 21 Dec 2025 22:03:38 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e769c347asm5846668a91.0.2025.12.21.22.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:03:37 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/4] firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
Date: Mon, 22 Dec 2025 14:03:26 +0800
Message-Id: <20251222060335.3485729-1-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=6948df3b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=A5G4tF9_Y6NSfw4zGTkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: sFU6V7ohHV16iJuHPHoMIscwwnNeXT9V
X-Proofpoint-GUID: sFU6V7ohHV16iJuHPHoMIscwwnNeXT9V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfX0WTD5APNQJ2O
 leFjEdMLP/qGaG8kd4sZ/E6AAAoh6KKy3Xh2/9V4p3BXYL1YX1DDW+P2gOfROwVlYawTNC1nx36
 /v9Co8dCELxGmWSF2XguCTlI4EY8/M1fRagAaPB35JwxnNAJu7YNflerzSuuqBhe4jpZyAKd57P
 CmHQoKbVffAK7YtWvMH4GPBCocoWeAZe0LLDX+vbJIn8+NBpNgjvzkZabsZB3r3tAnTKVbXPXOs
 nddmOvMgygIGQGYINvyQfg/G/EpNRNs1cSaovAnWF5a0oQfe4VfDoxDaYNfO3ODhBcXAVENphXf
 kM54aXMte/qLEeSrTSr9HiWHZYonAVirvIcyOsf/BMXkr3WvMSCI770NxHIKQxvjo3OBNwaoUVH
 CTUl+jIjWBMfsFtYBdd7X8XLeuzOU0flCLIdKjYXOzFZLsYb9YNyUtt7dEQDa+91csjL55+vqSe
 7MHC7yHKSZMm4TMVQ4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220052

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Add the Purwa-IoT-EVK board to the list to enable access to EFI variables.

Guarantee that subsystems relying on SCM services can access secure-world
features. This change improves reliability and prevents missing functionality
or boot-time issues by making service availability explicit.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e0..1fed7a81bd29 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2010,6 +2010,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
-- 
2.34.1


