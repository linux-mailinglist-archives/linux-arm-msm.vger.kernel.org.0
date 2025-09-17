Return-Path: <linux-arm-msm+bounces-73982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1FFB8163A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 20:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DF561C2608B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 18:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AEE2FFDFC;
	Wed, 17 Sep 2025 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqUZ5lCb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CFE2F7444
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758135077; cv=none; b=TetxQrXy517igr+iUFBCS9yV6uKKJdwrrV8w6A1UL9Hitq/xmostR9cxS82132Jj1bLZBZYUKjeO0g6N83WQotyOT+dCBuM7nRdLHzcCwI/SMd5g9+sCyXMOZp3jpRH8fx9qYMVQ5VQJSlgdo4PCsKSFNEu7NpRTZlqxJvCoKhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758135077; c=relaxed/simple;
	bh=g1vnWUaMY21ZweVmDS3CEeizZSJGhlvyw+DQg0nuAB4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jrQVBgCO2fWhffx2HxApZ1pJw7qxdRbot00LmRLztkGO6ZYpkCYxkyEgAWPwHLkR45mlZ862p1zISDJXyE0Bhm3cr2l1XkIkIgeQyYkuCVV0CICFc886mxxg37zmHfCH/rabcry6IVhVKL7nxICW8YfHR/uXzTq43fBdiQbfSSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqUZ5lCb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGWsrt019611
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 18:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=80VzWFaJZMNEFuuP5xyZJUoij+JkgurBnIg
	JG8M7y9o=; b=DqUZ5lCbQTmMcbH+yAMIuW/jAyyyEyp0xF2lK3J9HErR/0t5PD6
	NUJAc7bRuLKYkqINieSrLdJcvd2gs6acqSjsa4M7qOxPJtK032WKV4dUA92eLwva
	sx9CGOhkpuS34xm19pQPnSpb4/Tzm7IIiA1W9EdJbCaKlYGhS1bXCutMiU+A52eX
	gOE7IFhec8ulvrSi+GX6RNAfaQ68erFObeFO/0iI5bXMyzwjxA663l+fTdlkcoN0
	TgnIRZogV0vSj5KIxXj/My6akede8MTfhW5FH+W/TkzU89AfVWz3/Ti/Tnq9Rllg
	U5f6VQS0MR71Cf6AvBtDRqRlcBVWoAEu5bQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1ujd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 18:51:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329cb4c3f78so55306a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 11:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758135073; x=1758739873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80VzWFaJZMNEFuuP5xyZJUoij+JkgurBnIgJG8M7y9o=;
        b=qTKTYeO2574J9Kece7TjP4+eQyDrU0C27Ooqe7MMWj28GezfJ77Dm3mxDSMZQdeZoJ
         SxF7CcRJdj4YwFLTFjWRBuwzZhFXJ3uv5aMTr2UGGGw1srJjEBFN0AeCj3qkHt0WZJHT
         1IzV5bzG1s2yvLbLQjjgEDq1OU/zp0msoz66K6x8aF/8ceePt7aJPJkATgxgu0INmpXr
         rsgNMsUZY4KrkrsDFV1LoGAo9FYNr2kIiZBi5Ehyiv6lFFgqySZR9tuBRsprBT99QC2N
         qREMdso+ObRaMrSUDzrSWvNbZQ0Ox/IWTz+S58P3jm8phzT0w9RGCg6bV4P42pw9+uwQ
         bE5g==
X-Forwarded-Encrypted: i=1; AJvYcCX/uFftHtKT76juLfl6QQ7TCspaduByP9E0A1V4qJhaTlGfKaKxqokHS8yF9zwHYitCCLykZs+sbT0JkbK8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+03CaRGRU87zunWWc5doAEFzAiLZ7gVvbWcALDtTKAUVed/IM
	7+vwbZb1IFsvike2zv+sw2jSGChri8Qb2M/8sO041vU3NIVxlz+SMnIfIEVsgn81BvW5JVBV+I5
	QYCthArDlV2b7OlUrD0SYKfTaL5UOcDdyTmnqOH0HGySPNjekctSAP+RokEXmzHMm3p9W
X-Gm-Gg: ASbGncutwuvhAnqb0Y2HnZqxGXDrheGXs/V5odrA9Y7s11JhG1jAAapyzfoGPM5B9rv
	Jehukn3NAby/7OraGWxikRanvObb8s+4EcbkfvnG8lmTmgpJOQDZvyZrszT3I8cogJ3tUS96oEb
	H+pdfZrjcaY8bDrB1eQMj1XYKIHu10Ot1hId28NLG+b+FVG+Nyf6Slert33yG7wgNAU1GTO9fGG
	HhiToRXSx/9QuIr+iLdU3zFsI/gRINzVwhbWEesS0QKMdVvca5V4EBFW1PEUeM5PCtzW35T2qAP
	WOnXyx9dCWDkSjrg/IiaE9oMucgTo1osFZazq/2MueTpacuNQmPq+BpXUOS+doE0jEVCRx+6GA=
	=
X-Received: by 2002:a17:90b:2249:b0:32e:96b1:fb56 with SMTP id 98e67ed59e1d1-32ee3eaf849mr4036495a91.16.1758135073158;
        Wed, 17 Sep 2025 11:51:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQyT6jR6EPc0UlP+uiIETFX1kVKYMkXJBU9ZXM/pXHo7xVC2tlsDhwpR+iBlSm3oCncUstFA==
X-Received: by 2002:a17:90b:2249:b0:32e:96b1:fb56 with SMTP id 98e67ed59e1d1-32ee3eaf849mr4036441a91.16.1758135072533;
        Wed, 17 Sep 2025 11:51:12 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea0859e20sm3049771a91.0.2025.09.17.11.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 11:51:12 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, jorge.ramirez@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2] serial: qcom_geni: Fix pinctrl deadlock on runtime resume
Date: Thu, 18 Sep 2025 00:21:02 +0530
Message-Id: <20250917185102.3763398-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3qenwwJaeh29rhF0yMNRUezU8JQ_TNoa
X-Proofpoint-ORIG-GUID: 3qenwwJaeh29rhF0yMNRUezU8JQ_TNoa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxN+wx6J8yXPp
 807J1RDEMfqoXhYcPcGXIvjQ2QdPXH0zQZzxU5zz+/vv6HzZ7YaBGBAyCCutlBz1AFm1sRJDKEp
 xT5Sw4ln2BLAnL7GBmYmy7JTwEqVqaLdq4XidclmwtePBm4eQt7NGF6le2uvhMEWQtISibmpG81
 T6uPwtQJ2Rk2khazrp+WJ9Cv97ienFuFUgzCNpZDuSB0saTgDvaW0w03IrOkmEK6hKTsZBgisfr
 tznVu+/mZnQITqBqh2OmzoxTX0aSCUxqIJyy0VO6uOWSmSQdXGd7Pl6e2zVmY5bdW2jGIgktVKd
 U2egdIKToiSB2YEYDCuY9GQafsc3pAWXzwsqeAzuCXa9r2qOIBILOmA12qMP/OQS9PrGsqCDtnd
 vyCUZZCO
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cb0322 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Ep-CN0p5e5Gb-nl4-GwA:9 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

A stall was observed in disable_irq() during
pinctrl_pm_select_default_state(), triggered by wakeup IRQ being active
while the UART port was not yet active. This led to a hang in
__synchronize_irq(), as shown in the following trace:

Call trace:
    __switch_to+0xe0/0x120
    __schedule+0x39c/0x978
    schedule+0x5c/0xf8
    __synchronize_irq+0x88/0xb4
    disable_irq+0x3c/0x4c
    msm_pinmux_set_mux+0x508/0x644
    pinmux_enable_setting+0x190/0x2dc
    pinctrl_commit_state+0x13c/0x208
    pinctrl_pm_select_default_state+0x4c/0xa4
    geni_se_resources_on+0xe8/0x154
    qcom_geni_serial_runtime_resume+0x4c/0x88
    pm_generic_runtime_resume+0x2c/0x44
    __genpd_runtime_resume+0x30/0x80
    genpd_runtime_resume+0x114/0x29c
    __rpm_callback+0x48/0x1d8
    rpm_callback+0x6c/0x78
    rpm_resume+0x530/0x750
    __pm_runtime_resume+0x50/0x94
    handle_threaded_wake_irq+0x30/0x94
    irq_thread_fn+0x2c/0xa8
    irq_thread+0x160/0x248
    kthread+0x110/0x114
    ret_from_fork+0x10/0x20

To fix this, wakeup IRQ setup is moved from probe to UART startup,
ensuring it is only configured when the port is active. Correspondingly,
the wakeup IRQ is cleared during shutdown. This avoids premature IRQ
disable during pinctrl setup and prevents the observed stall. The probe
and remove pathsare simplified by removing redundant wakeup IRQ handling.

Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
Tested-by: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1 -> v2:
- remove changes from runtime resume/suspend.
- updated commit text based on changes.
- added new a change w.r.t wakeup IRQ setup.
- verified on RB1 (qrb2210-rb1-core-kit).
---
---
 drivers/tty/serial/qcom_geni_serial.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0fdda3a1e70b..9c1bd4e5852c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1160,6 +1160,7 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
 
 static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	disable_irq(uport->irq);
 
 	uart_port_lock_irq(uport);
@@ -1168,6 +1169,8 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 
 	qcom_geni_serial_cancel_tx_cmd(uport);
 	uart_port_unlock_irq(uport);
+	if (port->wakeup_irq > 0)
+		dev_pm_clear_wake_irq(uport->dev);
 }
 
 static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
@@ -1236,6 +1239,13 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 			return ret;
 	}
 
+	if (port->wakeup_irq > 0) {
+		ret = dev_pm_set_dedicated_wake_irq(uport->dev,
+						    port->wakeup_irq);
+		if (ret)
+			return ret;
+	}
+
 	uart_port_lock_irq(uport);
 	qcom_geni_serial_start_rx(uport);
 	uart_port_unlock_irq(uport);
@@ -1888,17 +1898,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
-	if (port->wakeup_irq > 0) {
+	if (port->wakeup_irq > 0)
 		device_init_wakeup(&pdev->dev, true);
-		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
-						port->wakeup_irq);
-		if (ret) {
-			device_init_wakeup(&pdev->dev, false);
-			ida_free(&port_ida, uport->line);
-			uart_remove_one_port(drv, uport);
-			goto error;
-		}
-	}
 
 	return 0;
 
@@ -1913,7 +1914,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	struct uart_port *uport = &port->uport;
 	struct uart_driver *drv = port->private_data.drv;
 
-	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 	ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);

base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
-- 
2.34.1


