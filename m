Return-Path: <linux-arm-msm+bounces-105285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IPBDaXu8mnhvgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:54:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B2A49DC30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91EC5301CDAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8355D371071;
	Thu, 30 Apr 2026 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsD07KxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMQb29MZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366AF246782
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528480; cv=none; b=lBue71fnKv4HO09fbvFujS1eNBMI4UAbD/zhwB2s/SGeExS7f6q7miiWaeMH3GVZdwGV9MXvdU6e9oVMF/5yd4AJf87CEi/iUllwpqVdnubQmnJ3rkZ1bVpoLQ1Ow73zfFfRvyB4W4go+z2E2cEHwvMFOHpr10YHqC1CwlPqHo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528480; c=relaxed/simple;
	bh=BpJgaliSBx+fohZC+GCBnwXiaNlDF3bUebjJWarb3lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WXFinQ/17yyAGB71gC8s2CaZNR8hnQpbk9n6/Jxlrbc1tdjvI9Vy15hcoJG7KuUCy+ZLGY15yEIdj1lflzVZDnmFA5pt+ji+xiOrYh+3I5H5bW59FN22hdwO6VeDLTM1wAUTI+bbtibrlGZ/mEVqVFDuhnYQEA6G3i3GEkkgMmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsD07KxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMQb29MZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TKbMYs2855875
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LRDx2hiugsE5taRYICgVuQ
	HfUVZXUoQKUB8tQDrNhNo=; b=YsD07KxOosc0UkbwqQea2k1VHrUi4Wc5Zbuezf
	CAhFtinwlY9qupVQE+h58dfgFFT7K1EoZjAXNALsV3/T61cBbsx7EYss3gQtIHOI
	fQPrdKsDaT/2HSi5toaUq5IOoZOQtqlq4vbQjRjKvWMbVA9HsDOfgZuPW2lfxENf
	D7sluI8ZohlKM0/PATbz98hEzIDFk6zKYtLDnFQ8U3QCT9ymObXe0qkA0kqK3Z7U
	+KS18tdMN16cmLBJLvGsn3cgzYcdlIXIdgJL8KKCUgIC8/O+DuYCX/gqHvZhsVhf
	qywxyPEDXyU0r8ba7fmqnbwqSKXPQcxu7mEM6OCgEp18pzjQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dukrp2xbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:54:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7ada7b25f0so253519a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 22:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777528478; x=1778133278; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRDx2hiugsE5taRYICgVuQHfUVZXUoQKUB8tQDrNhNo=;
        b=VMQb29MZIDiyICXwAFNMsnDF/x7cXkOxwn+cXELm6R/2nmNJxNgtO1rwUh+0ebCvVL
         7scIuR/1UQqMNLDY3AVnb++ccJp38qrnFmvbS5UqwDhcXGwFuIuglphpvzbbFG0ecnUk
         Znzf2h0fR2P3UhMp8cnz4UrQNQ4+KEOa1pO7SpgE3Xno9TCT4fVu56MN9FF3uue4KWyh
         KuqnykURAKDk/M7pwcY9jYDw7OiB/tttEsUAjzk+ZzrMA6tUnUpJiLZCdfqdRmx8A0vx
         Q5Xwj5Z2trW3KKBM/Iwsu/FTqDcS1mr2h1AyZMAk3k6mGiYDunIplv02D3X/sOQmfyoY
         L6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777528478; x=1778133278;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRDx2hiugsE5taRYICgVuQHfUVZXUoQKUB8tQDrNhNo=;
        b=hMm466lmiUWoMwUljGFgXTaSCKh0GemFtWXzfnrbs7UKMJcisFlg2uArVLWG0YrPzl
         UGhKalU832mgBDF2wnjSdQG0akQpR2Ce3zWl6zQ8+V9yy/INp/jKwghB1nQkm9SXBGsC
         c3SXaYrFkpkbPQIFWAvuVoPLU6Pu91lJm9OJmywUr4iMSt0FePwXq+tSUyMIk+eYNSEa
         pgY6C7KwS+n8A6jTh1QFqGSffrBb7ANVyaVY5rXrZiJK8poj8lDlAsNkQK6QT6/ICZjU
         GIwa77RdkF+uO4beVzcY/qZxaYzNzeyFmeEmqnwTeA2cGPS9vu4jjSuU9vqlTQRMmBNf
         02QQ==
X-Gm-Message-State: AOJu0Yz8KX9VtWGAZttRPoo62gzWQnSczcC3u6kg0LDIx5Zn3ENHAICp
	cXOYHOP2mGJD/SGzTVQ58TISBWZPa5CtL+4Xfr+3WM997Ihcl1BKAwk6Mq0fHXMpJWe5MQsiv8h
	rt0cCtvjyv0XFWU9v6bQlCEJFDquOPOLamcTGAvHcuz69m3JzO4J4Xz5TWmviLltSrJ3dRMKtRz
	Uk
X-Gm-Gg: AeBDietmzpaqc3PQOCiikXhXjjqucEXQo4Pe8gCo+QC3uwm4NKb53kzM1OomJHWhUcS
	2LOrxDqyM1v64yOtWMAE/76EckLW7Txn7zs42dKT2rY++vobVjdhUnc+37Ewjwz6oeUOJqi7OqI
	H/JLfrcqVrMOkE6vwUmyVAClHOKFcLW2NHvMzw+tz7CkRd4oynSSxM6FWRaJoKLRATJSbMcRswK
	vUnIPqOYt/LhLuocvPdRvFgyZjHY3P79k41qsi2Yv14Te/+BtqvjPy2cb+pdayyF52DOjEuW8mD
	XC02HcXMOabq1/QzMsKWZ9/Nlr65DmbbsDaGgg4tg7zzxY/QgBAklXgVUPvZYNf5+V/O5Cgb35w
	UudkdqYefXqrW1bwI03N+qilWLIJxw+k3Ans8GtujJYJ9E4xwn9W/s2SbR6i5CA==
X-Received: by 2002:a05:6a20:7291:b0:398:abe1:eaac with SMTP id adf61e73a8af0-3a3cf78d1f4mr1736541637.27.1777528477658;
        Wed, 29 Apr 2026 22:54:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:7291:b0:398:abe1:eaac with SMTP id adf61e73a8af0-3a3cf78d1f4mr1736503637.27.1777528477176;
        Wed, 29 Apr 2026 22:54:37 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd5e6c682sm3914516a12.1.2026.04.29.22.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 22:54:36 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 11:24:20 +0530
Subject: [PATCH] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIvu8mkC/x3MTQqDMBAG0KvIrBtIo/h3lSIyxk8dKjEkaAvi3
 Q0u3+adFBEEkdrspIBDomwu4f3KyC7sZigZk8loU+oi1wqOhxX9j7/YfW/ZP5y9bFHZoSnyhlF
 XlaE0+IBJ/s/+6a7rBquweuFtAAAA
X-Change-ID: 20260430-enable_wakeup_capable_gpios-cb9439ae8772
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777528473; l=1989;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=BpJgaliSBx+fohZC+GCBnwXiaNlDF3bUebjJWarb3lM=;
 b=m26lDkjcrLAmhfPzGeQ80LMthG6PD/5pZWiZuoYoco4Ka556NNVcA8ZK6PJK0kiAB7nuM3Cyv
 znxLFoObgW0AyLGx8YtC4AMjv7nK3zFqKAU6slaui8vBLYZkH2Bu5XV
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: _1f_C8YXtMJReIYaQBZHbNeYN8rzwyot
X-Proofpoint-GUID: _1f_C8YXtMJReIYaQBZHbNeYN8rzwyot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1NSBTYWx0ZWRfX2Log8exNiikp
 neXvxUIN4F0GSWME9Vj6DPrtLlWT8b+IJ4/JiMrHLxRimdUAc/idXkfhzrAC1XyG6nb4PSe2gDG
 9BRb+j2N5WwIk315SmNmYQ1x+RGe2Pg3GC1OCYHzWaKYIfXH7mBiUSBDaZTGiNya1F4+SdKkcxf
 ZDrWrGBWLCUCKuVs+YjQ+HpT01zMHOygEaYBXBgHOw7c4nVzO/1FAP4SvgQMIU92HEJh7YjVw6D
 BQZmL0tK80VWEkJ+xMdfzT+UPHDJaWJWH98SAaYVVinQ2CQ6vGksYaquxhhk5wmIcIB4KWxtFY7
 LvM83grniD0ZM5yXZW1oG4ioIA31i1GJ5lpyuXI37matDcdAmSEcR+CfmwpATQYXXAlb1moz5+A
 ynXuQM0WL7RoLwsI3U7CgSDp+XSwEHK//dredgfNDHAYxMdhd+3CfFLUA8B16+IPf6M5fn/J4r0
 R8cizwo7njiqOh5Wy3A==
X-Authority-Analysis: v=2.4 cv=WoQb99fv c=1 sm=1 tr=0 ts=69f2ee9e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9gMZ1K9C5k9pR_rhVsIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300055
X-Rspamd-Queue-Id: A5B2A49DC30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105285-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

The wakeup enable bit needs to be set irrespective of the SoC using PDC or
MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
to parent irqchip.

This is set only for PDC irqchip using additional check skip_wake_irqs
making it impossible for MPM irqchip to detect the GPIO interrupt during
SoC low power mode since for MPM irqchip the skip_wake_irqs is always
false.

Remove skip_wake_irqs condition when setting wakeup enable bit to allow
forwarding GPIO interrupts for SoCs using MPM irqchip too.

Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb85405fecdd4770ba3d4ab684563f0..96df8eb8f5d3f3bcfe165ac02a07414e491f1178 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1247,7 +1247,7 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
 	 * While the name implies only the wakeup event, it's also required for
 	 * the interrupt event.
 	 */
-	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
+	if (g->intr_wakeup_present_bit) {
 		u32 intr_cfg;
 
 		raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -1275,7 +1275,7 @@ static void msm_gpio_irq_relres(struct irq_data *d)
 	unsigned long flags;
 
 	/* Disable the wakeup_enable bit if it has been set in msm_gpio_irq_reqres() */
-	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
+	if (g->intr_wakeup_present_bit) {
 		u32 intr_cfg;
 
 		raw_spin_lock_irqsave(&pctrl->lock, flags);

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260430-enable_wakeup_capable_gpios-cb9439ae8772

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


