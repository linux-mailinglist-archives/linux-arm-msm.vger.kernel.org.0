Return-Path: <linux-arm-msm+bounces-93068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK/ND3selGk1AAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337214961F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9E3E3007885
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3202E5B1B;
	Tue, 17 Feb 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHdm6Cn0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Si5e6Xix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E472DA755
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314771; cv=none; b=mtdyFzg9E2aHbZwzFbGUe8TWAUwbZui6qIXZ5ngx+Ek3yQZJScyPZ/9D9nfRlFKJbVrGfKAEilfVRHGlYJ958MIbMVuH9wT8n3+yn59Ah+bOsV2L7DoJmJpAp8nudMvaqXof9fbovh4Dha61T9h62eqxhqpLJLmiS76WNUcKcTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314771; c=relaxed/simple;
	bh=kSfceoKoPkCgd7aDR+qYIcA97c3pxNAG8T/RrOOziqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTCK9I2D38tXMqJI6AGf5g+KmgSRniG+lMIo66lpa4K5Q42Qgr51Pr2vaVSy7iODcKrN+hghHL4NsRh6GtcQ8wmVtpLxXqRrabbVPk3PhPsvaKCWFXCAcTrqgMna/7DvXvRyZ5vuPBLZR6TWNUNritJKkWOPYUZ6kAuCD8DeBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHdm6Cn0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Si5e6Xix; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GFtLfO297034
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qJJfStkAEr01lyx9zngav29xGmsak5mO1cGnXwyAnc=; b=XHdm6Cn0pG3vQmDe
	lduOib83RYdJw/jF09itorJprMjibvWWqjnxjEsU18RVGUaxzvWOwhPRASvdVn1H
	Y0fIrskZ6uguGy99F1cqsaIFFbyLfsjdVoEPKCU/rowjBQPgvziF6Nu4pJDQGcK0
	LqZQyMiegqzvYNWn9GU9Z0cNnc3em/9If8RFh8LzCOr4HnG/nS/Fba31x1yrMU+l
	Roeaz3gLBAAGRDgmSz1UIK0As/m95t5ZUsEzk1DPB/RdIKmtvPNgIFReKOeiuUgX
	QBEakZCHNNO3OtdoM3Pm47bUupgtdluwz/1iTDMmRtKF0EMSPR+xCIhf2PawxKIZ
	QFekkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9sjka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71500f274so422207385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314767; x=1771919567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qJJfStkAEr01lyx9zngav29xGmsak5mO1cGnXwyAnc=;
        b=Si5e6XixNo1EJUWvZJYIF//cb5nS4gzhQe6oMB7+U5qYJOZPhEKZVzdzYkJNrABJwh
         GK30t5xFpt91POE6pk9+6VASFcZ6E5rWjewDGOYvtimImqnCFkvaiDW6Q7w1/LP4MhZ5
         4Zqc9z2L5YMun9q7ryUutkeRB/bfqknFHvWT+puDcp+BzG9rN362oSTj7e5ZzejRo/Qf
         ocqB6YUkiUISPzpSl4vk5AipHzOKCvI603Tnj9Er9ng7X7j/fK1MizBo+91z1zh0XwKz
         +eOZ3v11o2t0UhtbNBonGX7a1HfrLe8oEJvahT4AkzJamesshDY9OQW9H8rRbt/wSnuZ
         qdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314767; x=1771919567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qJJfStkAEr01lyx9zngav29xGmsak5mO1cGnXwyAnc=;
        b=vH7UO16LRcV+APFb00k7o8MGmRJr11jAcj70+hx+nlkZP0j6bF6PzICQw7uTGfOwwy
         lXgTnT6DlCGm0nFyECR9XHVZ5Cec4FJwQUKOcn1RiKhMu6Kv+Na5A8YJN9+L89V+BNdX
         ERQoguer7qM70zPxXpxHkBwFlkjLH31JAEjkb8yv06tXoexik/if2snwUyY+3isZrJv0
         bsNq8Lc23mAge+UTuJna5Y2+RHOQAUG/g9342bjxMzrX9+oXWI2nt29h+ZkVvGAiIQ61
         W1OOAO65khyDSpkWafVDrQ29LfFf5j7xEC+SG9t8LcLSP7mGrx61cB7OVf8A35+jle5P
         xCOQ==
X-Gm-Message-State: AOJu0Yy4i+GtgZLO99ELr6/37bhm1uU5Nlk4GayFop1j0L0NdvyHLvjF
	rLmRCEblXqOKrnNeG4/O1HkqTqCCYpGxhsB1IsAW0JxH6atY3E4/ERi2KXhPkEdw3Iye7nh8fXN
	qHbVeEPet83RRtPGNNyYRtQeUAe76aatHXr5sBt9rshyRd8lQwv7U+VgOedmFCAItj7IB
X-Gm-Gg: AZuq6aILT4LAATHnDEqyZlcJi8ovZnNY0mOE811k5T4ZVGbtQ9U34LPkwU2QNwBfikj
	lCBXjiVjefMkRNBMJbLDXTup2IpnFGDVK6SsnbbpB0XxtKRFi7P4SmhHia5dnKpefOiE+R76gIw
	fT+KzW/qhGxea4y07SinWf7dUEOxpgUMRiygcRNs/OzEhkyRFshMCi/gy0UFPkx7BT3Los5MyBX
	qaZnPSTMjWxP4sseYOXKkBgJNufGSZRKXoN9tb3cPcgoRWuaVlWCXCoukaIoGELDArrN7oUE/fi
	R6E/2IbJCilchNowMRJPWSIlwDq/t6UJiSQQByyNAs1cRQjLUkk3eurwsAF6Oit926kcxQM+pRR
	64RxEka2uhZOfIt01bV5Gv+pBhJ+vSA==
X-Received: by 2002:a05:620a:44cf:b0:8ca:3d7c:e765 with SMTP id af79cd13be357-8cb424604b1mr1389478785a.50.1771314766947;
        Mon, 16 Feb 2026 23:52:46 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8ca:3d7c:e765 with SMTP id af79cd13be357-8cb424604b1mr1389477785a.50.1771314766327;
        Mon, 16 Feb 2026 23:52:46 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29860229f8f.33.2026.02.16.23.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:52:45 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 09:52:26 +0200
Subject: [PATCH v4 6/6] clk: qcom: Add TCSR clock driver for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-eliza-clocks-v4-6-5d09f28d4251@oss.qualcomm.com>
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6777;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kSfceoKoPkCgd7aDR+qYIcA97c3pxNAG8T/RrOOziqk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplB5AQoZm+JkV4dOCIsIyI+j7F7Go56+dlOmFX
 +Q9hUgLTleJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZQeQAAKCRAbX0TJAJUV
 Vh/7D/0clbUjuOxScSqTi1SBKFZdN0WJoGEqf80RJcwF6uQC9M6c2LCW0GtD1AG1rCGBIRd7Ef4
 AHd3uxrdrELebfCyYZUGXMf6CPz69K/9EN6DJNzoYcS6NIQ13oNmQGn/Mk97Y3uj6XgLPii+pGm
 z0hbi5H8u9SZiZPrKhF/NF2MyjxV84EqwNDorBmL/NcdMBH4XmY/SyBo+6YVvAzh0hy5Ngap1qU
 0uvwNG5JAhKNUfYk01Wa6whjRBJ4plWPTBU/OArHUvBiZgKcFBzjf4xlf8T0lJOZZYi8vctO6VB
 bsL6rcRCt2IN7yqnY71aD/99K4lwF2tik1aWW/6+MkhAHQeNyB1h947nUCilqFy9d8uXYa418tG
 ilLYKhXQdZroY+2QT+aT7O5DaKZXFXHoiboC6ZIqsvQY1QWvnPX5WGOsgwT8BMqvpclAaxFzqpm
 wDZUSbmJ9Idt8l2W+L+a48dYMIi8B+RIxlOnWolnCZHAmDaVLFor9lWxXHU02UXSCE696/O9oJ4
 0Xvmuua9vTFbJub025UsZo3N48A1Drft3ZpiNyXlOs330PWeA3D2yEVQfOiqDvWtaK+LqVvY3KU
 dThPI7Gbx+6+cWXBcUVo3CE5GSyYntCzvKQfFIQViCFddhZSdTHOpJD8jHuZ0jKOFMBRjGy8cOx
 rZXtpqT9abYRDpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfXzDTGua4o0Xl8
 heF4gHDRrSYNiUPce4NQRRgBK9CV4UV9N41HePfusz7BP28zNsEJXArY1QrSH0Es0EMgZs7q4sf
 vouVd/e77N43t47Rxi3PszXaAhy5cW3dXKXZS7WUhBnl1zMu3J4ki8MaKNwATBbKxFJaMrNdqaM
 +obLTTZ0ImY3rciijbwDRpg5TLl0M+uGR8aacsH7syKZxDFc5MR7ajtviZkFmOOaLfGfMaUpQSa
 Ak0iALvKY9iG/o6h1cYxgWjm0P12vJ2pB2tIn+WrZoFvpZpvhsG2oE0plZFzoCOwM9O2OxTE7J0
 NtDsHMHXRLJ1go5cW9ejyHCMDcvAGvtNB3bmKIK36xmwi0AeAxkrhu/3ubVCuj08tak52fhlov+
 kozNeRtlzZW65xYgibt4IhP0gU1yVGKqRAEQEtZGIeYZz1VMF/A6frRzlHRMyBWyNmQSOeFmoHK
 YYtKv0IMcDKyAB/6VSA==
X-Proofpoint-GUID: yFBsjQvWc6mreUNkkVcUnAwC3A1u3YCh
X-Proofpoint-ORIG-GUID: yFBsjQvWc6mreUNkkVcUnAwC3A1u3YCh
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69941e4f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=xMpycIIAKlYumkEOWPcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93068-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0337214961F
X-Rspamd-Action: no action

Add the TCSR clock controller that provides the refclks on Eliza
platform for PCIe, USB and UFS subsystems.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/tcsrcc-eliza.c | 180 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index edac919d3aa2..dce21e33e366 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -28,6 +28,14 @@ config CLK_ELIZA_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_ELIZA_TCSRCC
+	tristate "Eliza TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on Eliza devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
+
 config CLK_GLYMUR_DISPCC
 	tristate "GLYMUR Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6ec63a5d4363..d2bbaaada826 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
+obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
diff --git a/drivers/clk/qcom/tcsrcc-eliza.c b/drivers/clk/qcom/tcsrcc-eliza.c
new file mode 100644
index 000000000000..ef9b6393f57e
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-eliza.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,eliza-tcsr.h>
+
+#include "clk-branch.h"
+#include "clk-regmap.h"
+#include "common.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_hdmi_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_hdmi_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_eliza_clocks[] = {
+	[TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_eliza_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_eliza_desc = {
+	.config = &tcsr_cc_eliza_regmap_config,
+	.clks = tcsr_cc_eliza_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
+};
+
+static const struct of_device_id tcsr_cc_eliza_match_table[] = {
+	{ .compatible = "qcom,eliza-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_eliza_match_table);
+
+static int tcsr_cc_eliza_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_eliza_desc);
+}
+
+static struct platform_driver tcsr_cc_eliza_driver = {
+	.probe = tcsr_cc_eliza_probe,
+	.driver = {
+		.name = "tcsr_cc-eliza",
+		.of_match_table = tcsr_cc_eliza_match_table,
+	},
+};
+
+static int __init tcsr_cc_eliza_init(void)
+{
+	return platform_driver_register(&tcsr_cc_eliza_driver);
+}
+subsys_initcall(tcsr_cc_eliza_init);
+
+static void __exit tcsr_cc_eliza_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_eliza_driver);
+}
+module_exit(tcsr_cc_eliza_exit);
+
+MODULE_DESCRIPTION("QTI TCSR_CC Eliza Driver");
+MODULE_LICENSE("GPL");

-- 
2.48.1


