Return-Path: <linux-arm-msm+bounces-72617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A85B495ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 741B9340E71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828542FE06B;
	Mon,  8 Sep 2025 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cF9r0N20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599D311591
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349948; cv=none; b=oRc47WarroYeT4YHTdiiTDBN5Y9mYzx2aJ2VYNW/SP9LAf70zp0on4INq3QD9QeEmcozqtMrqIi7oc4/Taw//ibzr39fi5014zj4x8drU8SmN9f0/esdQbJCJDwBBqo5X2WxjtHY03woSCWfp11ay9jIFRn+szNNfgejnxwWpok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349948; c=relaxed/simple;
	bh=6PqMLWKDJtKfVT+GHF4Y1k5/ea+AFwqdR62kduV2yF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MjhSOt0iKIZ5T2R2nxO//AgraE7xvehUTg15Hoo2qDV8bk4w6N4nNYCf4RLf/eXLqW6xG2cwoZ5IHUVrNEonX+DVNc17K4AMyATtZp8vo3bBpdJG86MybhrWPOinlL2Dv5+1+CinWIuHu97L90znWfOPv+G3+NJerbhB2gnMpS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cF9r0N20; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58897ZRn024097
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 16:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=34Aw1JEvLQX8Jf7s5ppgnDzivC2hh4Fc7ZC
	M6ufDdzA=; b=cF9r0N20D8+R7qV0LuaJPtmTWTyirlUMuLt4CWP0DDtbTECV4Ni
	6a8S4DqTNuh2niaw4gb7riMZlFcZdMy0HRj5iJakGDXT+fucFYKswdgyBgpRX6fC
	m+/WX/N4clA10mffWpvAoPdzN7fHCDILpp1U0jk9Uu0cApIc50B2tHkjGMfG8jAj
	HLNytukr8EM3VcjqDNkE+kYMIs1AVXJSnIKmaFxO021wnx0X5XYEYfCV5V59nNlV
	ByE/75TvK8Hj3mRR8qOmdhBIUco5AbiueOOsjmOp3rCpt2Epmf96i7z9LkTYNHwL
	ca+zz+VdADBY3tabIxfjIBHYPSH0cHShaEA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a56gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 16:45:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24caf28cce0so113648885ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757349945; x=1757954745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34Aw1JEvLQX8Jf7s5ppgnDzivC2hh4Fc7ZCM6ufDdzA=;
        b=FymkQB6lw2zjdHDigJFysdZcawiNRs3ReO6rRS5oeNCrtLA3i0s7EkzyAt0zJ2hnXx
         wSJWGVlQiFw5UP2zeQTF1xDaHubcQLmUPPviiEmVTRaIlKnR6blNV96VAbN+YDqhDKVn
         kQbFpGF4So7izzAmnuqDfBx5762xg2tbYnCoQ9stBj5N8UBXucdYNekkxDNdoRjEP44O
         IWgtW8KaSuj8Mluw6Gah828u0RZZrBVVC+4wNO688ZlAAe6N8N5qX69Df8DJ/KNsa+zb
         HV2ppR0YU5JJ/aKQew7oadsgCNY62vA5UR2WFTt9Xsgmx0sAY3eIuj92quu7qEYs1+BI
         ey3w==
X-Forwarded-Encrypted: i=1; AJvYcCXssXVOJhaEf532cYeEHb+13wlLJLzGdXl0GiurwmkEDftVqoix3E83QJsh8BR38qmiTwwY2w1FnOYY/PdH@vger.kernel.org
X-Gm-Message-State: AOJu0YyQY+gvxBx4Np2n7xZc9ZyhvpTlEGEPN8Rny8+hcsjTU7R7eNQ3
	3/5s7hJt+gIBWiJ1G1X8ZdAA8T76Gs8K62g1YrHE8rrPsFnwQKRJlwO9s8Dn+hjjkaQWR7nRvRk
	lGz7cGGB+zfxN3XeQu2N9JrALi7kOu9x3a+KuF11smpkzpL2Y94Pmso5EEj5uEBLDmH1w
X-Gm-Gg: ASbGncu04JM6Ko5lNB+ACAdv6XQrU5XG7D8ElrhFKBwhQUPIv0VEg1mu0VHXQtQGbaP
	pGcteHJYFv2+mASxmeaMPNhvmWZw66b7mWeIansEzQTBjMNyK15RkkQY5Gi468Ujw2MP4omEnbD
	Y35yIfhQHHSrP8LEABygfIcUHzMMpS52BwoaemTfUgvLDzkST7wWXJMOARjkHwtinPUg0TXCSfQ
	Ju1GS/Q2em5rD2UMMRdaKutnlarNYjy2UNqi6ZEkMSJrQq+qM1RTW0al7D9cWGXvw5ytCPckHmj
	091FUoMY6m6PhM7W52QCH/49vlP1oUzkKPhjnnrELgHyoZ0/g+/wsSFdU5RBJEwvd23IobuDig=
	=
X-Received: by 2002:a17:902:db03:b0:248:fbec:7ca0 with SMTP id d9443c01a7336-251753ddc6bmr114527245ad.52.1757349945024;
        Mon, 08 Sep 2025 09:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4KvQs9Tv5MscTkp53nskEqyMUOykepAr5xV7PIPByLyoDaC48YY8vt2347cxTMkjP8lyWfQ==
X-Received: by 2002:a17:902:db03:b0:248:fbec:7ca0 with SMTP id d9443c01a7336-251753ddc6bmr114524405ad.52.1757349940303;
        Mon, 08 Sep 2025 09:45:40 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24df9e881casm91508045ad.62.2025.09.08.09.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:45:39 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1] serial: qcom-geni: Fix pinctrl deadlock on runtime resume
Date: Mon,  8 Sep 2025 22:15:32 +0530
Message-Id: <20250908164532.2365969-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bf083a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wCWT4eE_qC1rGXKMDvQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: D7mFCdW6pJpwfdO_MuApvv95eRbKvA56
X-Proofpoint-ORIG-GUID: D7mFCdW6pJpwfdO_MuApvv95eRbKvA56
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX1rmP/sgVEp4s
 AXrnQa5dCz44gHRQx8E4HHZJrK6C8rzH/F8N689ZPeWPIQXpvMS3Y/O2/EfBAwdDllJdyCx4vD2
 jnJ0RoTpNsLV/czPcrYzMSZzaNEXfQxtTrl15Qj2eRc/U8sLDkhC8tyz0XCH6LfoiNq/UVkcz1G
 f/JtXyapj+Ntkjmejje/aMS5EgNluSptRyLgjuid5tjkPe4pSY44WisJXuB4haMm6OJEgn6SBWA
 2O78RzTIMopTCr5mHQhTeA/uRjNcfAJV4KhBcdDpSeI7YErzTwse2g/vDwU726n64Gb0t+8wc34
 Y/1TU3/l4ErnuTYWUJuoIEUZ8sTIL3+UEi/qvQB77Vyz4YA2uzQmMfY1T+kZcI60WThRTdrinQ1
 sfAuc65h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

A deadlock is observed in the qcom_geni_serial driver during runtime
resume. This occurs when the pinctrl subsystem reconfigures device pins
via msm_pinmux_set_mux() while the serial device's interrupt is an
active wakeup source. msm_pinmux_set_mux() calls disable_irq() or
__synchronize_irq(), conflicting with the active wakeup state and
causing the IRQ thread to enter an uninterruptible (D-state) sleep,
leading to system instability.

The critical call trace leading to the deadlock is:

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
    irq_thread_fn+0x2c/xa8
    irq_thread+0x160/x248
    kthread+0x110/x114
    ret_from_fork+0x10/x20

To resolve this, explicitly manage the wakeup IRQ state within the
runtime suspend/resume callbacks. In the runtime resume callback, call
disable_irq_wake() before enabling resources. This preemptively
removes the "wakeup" capability from the IRQ, allowing subsequent
interrupt management calls to proceed without conflict. An error path
re-enables the wakeup IRQ if resource enablement fails.

Conversely, in runtime suspend, call enable_irq_wake() after resources
are disabled. This ensures the interrupt is configured as a wakeup
source only once the device has fully entered its low-power state. An
error path handles disabling the wakeup IRQ if the suspend operation
fails.

Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0fdda3a1e70b..4f5ea28dfe8f 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1926,8 +1926,17 @@ static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
 	struct uart_port *uport = &port->uport;
 	int ret = 0;
 
-	if (port->dev_data->power_state)
+	if (port->dev_data->power_state) {
 		ret = port->dev_data->power_state(uport, false);
+		if (ret) {
+			if (device_can_wakeup(dev))
+				disable_irq_wake(port->wakeup_irq);
+			return ret;
+		}
+	}
+
+	if (device_can_wakeup(dev))
+		enable_irq_wake(port->wakeup_irq);
 
 	return ret;
 }
@@ -1938,8 +1947,17 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
 	struct uart_port *uport = &port->uport;
 	int ret = 0;
 
-	if (port->dev_data->power_state)
+	if (device_can_wakeup(dev))
+		disable_irq_wake(port->wakeup_irq);
+
+	if (port->dev_data->power_state) {
 		ret = port->dev_data->power_state(uport, true);
+		if (ret) {
+			if (device_can_wakeup(dev))
+				enable_irq_wake(port->wakeup_irq);
+			return ret;
+		}
+	}
 
 	return ret;
 }

base-commit: 3e8e5822146bc396d2a7e5fbb7be13271665522a
-- 
2.34.1


