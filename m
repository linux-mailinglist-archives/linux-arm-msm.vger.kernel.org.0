Return-Path: <linux-arm-msm+bounces-61945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2428AE2B0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692C716F53F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 18:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2704D270541;
	Sat, 21 Jun 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkWpKB4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866B626FDAC
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529662; cv=none; b=NLKbO+FgZVxOJygx6nIvDbRcPZ7tblNNbncV1Ku1C5V451xNcEsa7W9llBBnU5B6j8xkWiVFxi0mmW1lqEpOo2TyE4NZjFGdFQFViFx8clyMShe/6lWfDwRLmvY8oo/dNFjsc1p2U1+zlSXXAVTuMdOmntIskGjhyS7UC520P/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529662; c=relaxed/simple;
	bh=4CYOA9AagDnQlzLO8jvRE7LipR/5rn+iPGyR5z/1opc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C70l4XJX/K2WXwyqxWg5DZ32v2Yi+zTLtAL1jMRpUwLylIC4J4ivY9JjGE1SbvQzsQOiRtHrgtY5+Yxp5JncjxzufwCYPVb5yIqO4CKtJ9JLA7u5jc30l5R4u3JUrCc72+9FEi/bSQEwC7vt0HrTsmcQ2V/XmeX+KHFPvKosxrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkWpKB4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LGnYY5023274
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zowIyNUEyO7rt+gljYGoF/edvYqN+vq2B4rXcDP0lxM=; b=MkWpKB4NGOYwGE5i
	5Kqzq4iziOFtR228nkHelZnK4XWLVSZmphg/p54UqhzNH1wWU1DN+RG7qsNk5x0d
	3Szm84sTJVRRnvF15IYTGFYWf/NmoaB6pQ7C+njcOqMA2PfKVrCv4origrBKnHSa
	ONrSat6u7iGAcfGEYtU6wNYcySqI1/SlGQP0syWUk6s8qYW3C20W1la5Ve+xPqR1
	b3rFysi9R6xA+iF3osCtpN5UFccZDUxN56+9Vl6qAoZeD3DPH+YKpYaTGWlyKWMf
	ErhZlFG/0S6lW3U/j9VqYU79gLsJwGu7IY6neo4RWSdRuh/zmJHsuP+HBG5kM3lv
	UrX1ww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dp64gw63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so857490385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529658; x=1751134458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zowIyNUEyO7rt+gljYGoF/edvYqN+vq2B4rXcDP0lxM=;
        b=DJbUjnKN6uFrlur45eoTPwGEsb2ewRZnUMkEP0pCi3R1XFgEFv0oeidoBr7IO/yVG+
         SkJfEw6Anv+CIru3PPEFWwknJcO8wgjKRzX2dXiB6rOqgSRdFQEa3WyKCYf6SswM/zMY
         BqjcBdT0I7G8p2/7dwlvQRh6bC88UxcwSnME4wkL6HmZoAPVIhd2/TMO7h1/Wuo4qPqg
         K2clnGmw/FLWir8bP0oP8/5zzq6GB7S78o1QsvwIlu1FLLAtDLwJDDibLBTp8WYFRCkH
         5aV8bbLrJSKt3scwWVMp8FDKTFeROsNw0aFBGXFK4moOE4O5Uu7TRIXE6MRxus3hyh8p
         HHtg==
X-Forwarded-Encrypted: i=1; AJvYcCX/QcPoQFecM2IHGIEVQRMGBASTljFc9Jxapf+LZzUuZOpNdnmKnJJP7YdYsiDD9UNpCHNaNIU8EF9Hr49V@vger.kernel.org
X-Gm-Message-State: AOJu0YymQCAD859KODScB08z/4dGHitOpRww4WsphAu6ZdDsB9DZ2J6u
	oB5otzQvaHJP27XiQ51UAn8SI8XMbbwZKbo0LyCBLRYGLnMS/AtWmesrpwa6bTTBVLgVvQrLDO6
	mCK6fbq0y6qnpTuc4EbA7dmDwzGW0n7+PIAcvlY1S+p1xPoGWgE+JGiexmhZkyrieUe80
X-Gm-Gg: ASbGncv9HHYjGjWzBr+qlLb4PQyH9EbrpOlmb0GjBH32TzaiWcqNPEz9Xome0uScbM7
	dAxXnc67Uqeew6nzHx9I1Cw73pR+H33nyg/t+xvXzXaJhYR6/GLrCPJXcj1l+sn1E+YadO5kN+2
	KC79KAU1OSe217zCqUjr7hwRh2yMwpM0aVeGzlyivF+E026aKUuP7xQxTSlYiFMrNqitBE9LzpI
	7Oq1c07idZkRdEP3kmnSydV9AfXeUXchBAC3hB1hHriCmPSQv0WxHJDL/1KPbbTFGQgGnAJiXj1
	bVjZ/UuaKAzOlHFBbhyNPCBnxVH4sNgI4i+ARNFQWQtg/vj4d2CwAokDT1wPJ6W9k26d/CiyIDG
	7MsIIYQNI18yah5Cw2ZeBbm+GDWKSVinUGik=
X-Received: by 2002:a05:620a:1906:b0:7d0:a1d2:436 with SMTP id af79cd13be357-7d3f9932ab0mr942601385a.33.1750529658155;
        Sat, 21 Jun 2025 11:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1/0MhQYuKfBpzeVErFNYZh8FZs6s89lsKMD66pGJWLmGvzYlwhn1nDZIEbwBmB1PBHWKAUw==
X-Received: by 2002:a05:620a:1906:b0:7d0:a1d2:436 with SMTP id af79cd13be357-7d3f9932ab0mr942598985a.33.1750529657781;
        Sat, 21 Jun 2025 11:14:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:58 +0300
Subject: [PATCH 3/8] usb: typec: ucsi: yoga-c630: remove duplicate AltModes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-3-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4CYOA9AagDnQlzLO8jvRE7LipR/5rn+iPGyR5z/1opc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzEwCSquoV5Q2Y0LnJ2z5hijlfP4HmCo0CY
 WaWygQHwP6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1UWdB/9erkAZ/EL2NpUqbd0w3OylzoPIom7LGhqMTEJFDyP2tBqOczET09Z+xyhim9bUXRRvoM2
 VSaa23CqxqeoilfJMB67B/BTP06kqCv07Mum81lER5PQoqeLh5MiKfKLjhupdFeHxUt/umpkmoR
 nwMW0W3NtoedisLaIv+r68ZLWHMQhU/nxOW72rMU/5QshyNtZ92+VbaMffjE+uo8miBDynSaAEu
 btb1zSAgosSHqaOu0+9Hd9WJ4V5Ep0/bHZQVowFqjGI/8zoBpV9UMBaodNJ86Lc1SOLBNlHNux3
 M7VZpB0tHP4flQMmrqaFNMgWuzozAfvPzzx8CArzMlLyZNbB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: QaGWamHSJlZKvjSZVDvxOEZWtkA56MRX
X-Authority-Analysis: v=2.4 cv=dPOmmPZb c=1 sm=1 tr=0 ts=6856f67b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=AZjPiHVZ31VRnYr7GT0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QaGWamHSJlZKvjSZVDvxOEZWtkA56MRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX3D54N9x6BBGH
 N1VwGpHSRt3o5TEyxPLmxXKstdd0ak8ozHpgBD0UYwPia7kIVSIr1XwPLanfhnEoPUcPB1rb72f
 1t7jCKrxozv+HecQ8P0UMXPqB74uMDAMKhTUv7DnHQe/yfpgQfx7jdKRz1nq+xlHAI5U/D8AduU
 UEFuXkJjv2N3jFnpBIAwBS/FuPJQYbBdxnRIPOt1zeHXJlsIw01xy7F+/W0K3NEHbhWsRTwtVsL
 PIuWgDHwnYX+yQIb1RKUR49Z4K4DhmqvulHn05AHTQ5zK2jR1eGlDtnBU8/X3/mRwoBlaUerj/j
 1r3/h335EYNQYBrFjTYoSQ//81B0UWadIJDqBNHSOIiEUFjIp7TM3qd6dD96B30/yHw7fwC87mq
 nrm0EwiagUau7NaU74Yn2y+1Zngqon0Y5aYU0IMA0xn5heUo5fQrE1eZWlzzw2YKAfDlOEF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

On Lenovo Yoga C630 the EC firmware is buggy and it returns duplicate
AltModes over and over again instead of returning an empty one, as
demanded by the spec. Ignore extra altmodes by zeroing them in the
update_altmodes() callback. It is not possible to shortcut that in the
sync_control() callback since we need to know if the AltMode matches the
first reported AltMode or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 47e8dd5b255b2b306dd9c3d6ac8c3b896954981a..7cc1342d6e2f1d2c6f5b95caa48a711a280b91d3 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -71,6 +71,28 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
 }
 
+static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
+					   u8 recipient,
+					   struct ucsi_altmode *orig,
+					   struct ucsi_altmode *updated)
+{
+	int i;
+
+	if (orig[0].svid == 0 || recipient != UCSI_RECIPIENT_SOP)
+		return false;
+
+	/* EC is nice and repeats altmodes again and again. Ignore copies. */
+	for (i = 1; i < UCSI_MAX_ALTMODES; i++) {
+		if (orig[i].svid == orig[0].svid) {
+			dev_dbg(ucsi->dev, "Found duplicate altmodes, starting from %d\n", i);
+			memset(&orig[i], 0, (UCSI_MAX_ALTMODES - i) * sizeof(*orig));
+			break;
+		}
+	}
+
+	return false;
+}
+
 static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_version = yoga_c630_ucsi_read_version,
 	.read_cci = yoga_c630_ucsi_read_cci,
@@ -78,6 +100,7 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_message_in = yoga_c630_ucsi_read_message_in,
 	.sync_control = ucsi_sync_control_common,
 	.async_control = yoga_c630_ucsi_async_control,
+	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 };
 
 static int yoga_c630_ucsi_notify(struct notifier_block *nb,

-- 
2.39.5


