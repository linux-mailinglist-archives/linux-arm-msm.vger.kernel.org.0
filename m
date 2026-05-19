Return-Path: <linux-arm-msm+bounces-108383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBFgGCcRDGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:28:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C1579156
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E5CD30B856B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBB73D669F;
	Tue, 19 May 2026 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XS7djqFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuT4uFsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1213D34A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175475; cv=none; b=lCa3rP90Q87jAfHHRD9V47bLA8OuUnpejb2oRrKwRb1DI4oV2OVhEZvQkGb6CoFv1pilG+13yXh7TDn4ygUx22dxpfzrqqNmZTzglmhMmullcXmNrBCQmrSF2YHg3REGgpw9Szyur5HRl7dggd6y6/0xiVjsA3k0rbZanQnj8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175475; c=relaxed/simple;
	bh=QN6kQHSZ7wMJTaDZlVY9p4d8+XLr8TFnK5FsU73schM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2rwjHCqWQFeJ/v1BkYEf91Chh3PgcR1A6HsjUWC1CNIVGVAZFUylDK95srtUbrTCy5QfBrY9xdz2G8GOUgHo3by/g0rw6qn9INzvaFY1ERPj+FeA9wZK7twz2s+WkiK1dFCl6zJ0xbTvWf/KdcU1GllvHFaJQKWgx/5LDm5iPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XS7djqFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuT4uFsH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WH1q4130977
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8zBH03hz9ckfvwNSoaR7EiPr//dHF3WikoaKSBYWgQ=; b=XS7djqFQCZ4May5D
	XJ5EU5SHHCyeoe8/QcplgSrKPENwT28a1tVte8qHp7h8YHkjq/xSk2OEUcP012dT
	3y/z75qIqiEBdN+CxcoQ1WFe+5D6b126iIwaDlNKB/sb/E507IYLNSfaBwv9Xges
	5XY8V4JzwVTdzbNCs2a7zXK0RdWXYmOZYerOopVsP3AHaxXJ40crKukdSh9CSBWa
	STOEgVR/yZgrMoALNxohBCJ8VVMJImZHPXHwKCCFH3S7IVFewBoxqUCxcwqesifF
	my+2pzpNrnD94Av5JkICB76aQYA1nsU8xn5O28iocmYYKXwUHWYMFNX56wAGvjAd
	fxB6KQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1gemt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:24:32 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12dece274b1so4599268c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175472; x=1779780272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8zBH03hz9ckfvwNSoaR7EiPr//dHF3WikoaKSBYWgQ=;
        b=GuT4uFsHtTdD04WW4QYJqUHRizT9xlpkxwUuwKSeFtuKs2XZgu5Hqhs9tIj+wLXpLm
         S7Syq09bIv9vACJ3MLHPfu2kjhgvDGZ5RsAcGzJlyIAgGeBdHTCVY29M1ZCKrcwLA6Nb
         Q8z6MMF/IpC+0P5CD0+p+vhE9tNRgOCK/+c+7ZV5fNgMRcgtjleryT8bHi30eJnWMpjj
         1ZoKFbs5ssJ52Ulqv9SdZp81+syfR9K9CCgseGg3DV/7HOagpS5Nyg0NVFzGQ8rU6rOV
         3P2hwQ1Fa+GA3X9TX2hRViwVZINNRcgwA991UHCaxSATb73zGQ6M5MxFI8mQSKXxjJc6
         qsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175472; x=1779780272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g8zBH03hz9ckfvwNSoaR7EiPr//dHF3WikoaKSBYWgQ=;
        b=OS3rWMrDW0kGjhBRbov6+/bQP8y0LZGlCVR7dzjo4OVn9oQdC5OqP2YUILdv92aMFq
         ZS/cyeVR5f8DG3mQhw0NB2mBo5bHpGJnO5DuzeP6v89e9q+QEoyfBgWL7OmDyws2nWCr
         f3kXlDoL6y2qxxXZgYDvNN3ejBVPpa4gvmlLH7H9413obUcpJgb6TxoMsBSLBdq2HRHD
         A+KtIgBrWMOJrLGfXYUEfg+nV45/KkPSDvzcDB8WM02Xst38sdXh5EslqfBxLSJAjfNH
         9B0zwt5maEf60RBVwT6PTF2OxmXEtmR7oU5uTOB3Zx945VSbeIW+ETdH9LFMG0ChoL7x
         tCXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/ynnoNzl6QXPxRUfyZvgv/HqEOf7/vI1KVP0I2cFT/LVF3CbsuTm0EouC/IvBgJpVOso+g2a5ZkWEpKOR@vger.kernel.org
X-Gm-Message-State: AOJu0YwVaqzBtNdd7ekQxbuBu7Ujz6pl4bLp1NnV5VC3O+L1Mq2eiN+B
	oYzEYU/3g1+cEkzu3uyMZtFlY6GeiKLOSgqlYps5Fpvr9E+sG8MDh1FkCDstWHFIII+NhcE/SHL
	4Gwc45SYbXxzM5CeYFCcvhxVCh3ibLOggNZu1afUw3mJEyByVS46+OpBVuVFz5Y8t1lUg
X-Gm-Gg: Acq92OE+J8vFLR4ht/leaz422u6DWdT9KJG7ILAWPYeOXYzCmhD5pTPfbArk+1OJzru
	DApadX8YVIeT1B3CQD6FwMZEnsuX+WV157+isZeII1J9EKbGxGdzu8xBvMT1V/9QfzYotBv2kos
	ehjU41EGf7z2U7JQ8t6USdJ3wVCSWgEB640rimbjGW/J07dOZ/69yIRw4HvwM0mLV3bqRaGz2mD
	OhEZNvcAKDZPJ2ppeVaIXPuEnluTz1yH63g99CwtR4d0zMSQBIfEFvZ7xSUpPS4PDTqCaoE4fYq
	81K8FIGUS3u8WRohaHnfnMuTzA6oQckTkk0nQIvEjD1a7hKGCdQg6rgAy4s3iSG3vi124aQ3hmh
	IXN9omx0tfLs8LpS1xdqq24d8mf0wT+qQZPgGLELTJIgHiIVbNoU2vR2SyaqlTyxzULGzAu91
X-Received: by 2002:a05:7022:388a:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-13504414f41mr7181991c88.15.1779175471658;
        Tue, 19 May 2026 00:24:31 -0700 (PDT)
X-Received: by 2002:a05:7022:388a:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-13504414f41mr7181967c88.15.1779175471087;
        Tue, 19 May 2026 00:24:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:30 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:24:23 -0700
Subject: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=3683;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QN6kQHSZ7wMJTaDZlVY9p4d8+XLr8TFnK5FsU73schM=;
 b=U9glJukBAUOjsfvyNq+Nhh0TZrFm7DSDSVRT37fu3rqk+uheQ2fkKGE7qnfPlqsqQxPipbAGm
 cvawG3nPFEHBEUhzhYx3DOPyNbKcbZ14h9gM6aKUHK85zqqLlI1CiK5
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c1030 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jQEpcGcuKFcweVAcgyMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: QIrDRL7zEkahLFj93xZPpkIIUsTIMZ3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfX+aWpGaBp0BMW
 Q5wm6pEK4tv6lOXn8RE5ylNtGyl808f3c9jMfOHBC1kgVnvZJq4O1Q47f7tX/0gL9B++uI1JjhP
 0K6ZLH4OmOIMVMEz1KrvXe0+POzUU6JyHOHvok8O+3h5g5GHFK/ZEBYd2+pC9jh1eTCdcNX0X1H
 woBh2bFk8Hm0UMzYMEhQMmHN/FjMRApG+OuYzFJMvJeJKTSH8p7vUqaUX/zfu5qTa0RLUkx50Ti
 UoPvQUHTm3qUiA3X3NZYge7NAxJQWS4ZZEqS3VyuO680pQQ7IxObc/JSZ/gdi9L4jv7f0sKv9rG
 2szvX6OrYPhmFTizCe6OeyUPkcuT0Xo/Z74UoDNWox23k0/rCpNkYzYj1pYFmZrodwQsJxSJ143
 t5NsJa8BPuHsaGEFS/fXB1PWoCQWKm/BDvTLgeToBY8cM190BeO667D8L4XoyRNLtH6SKL8Yb4r
 Db3glYu5YbeyTDEHfHA==
X-Proofpoint-ORIG-GUID: QIrDRL7zEkahLFj93xZPpkIIUsTIMZ3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108383-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B33C1579156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Subsystems can be brought out of reset by entities such as bootloaders.
As the irq enablement could be later than subsystem bring up, the state
of subsystem should be checked by reading SMP2P bits.

A new qcom_pas_attach() function is introduced. if a crash state is
detected for the subsystem, rproc_report_crash() is called. If the ready
state is detected, it will be marked as "attached", otherwise it could
be the early boot feature is not supported by other entities. In this
case, the state will be marked as RPROC_OFFLINE so that the PAS driver
can load the firmware and start the remoteproc.

Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..ac2a00aacd2e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -60,6 +60,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	int ret;
+	struct qcom_pas *pas = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+
+	pas->q6v5.handover_issued = true;
+	enable_irq(pas->q6v5.handover_irq);
+
+	pas->q6v5.running = true;
+	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+
+	if (ret)
+		goto disable_running;
+
+	if (crash_state) {
+		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+	if (ret)
+		goto disable_running;
+
+	if (unlikely(!ready_state)) {
+		/*
+		 * The bootloader may not support early boot, mark the state as
+		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
+		 * start the remoteproc.
+		 */
+		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
+		pas->rproc->state = RPROC_OFFLINE;
+		disable_irq(pas->q6v5.handover_irq);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	return 0;
+
+disable_running:
+	pas->q6v5.running = false;
+
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -518,6 +570,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -529,6 +582,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.coredump = qcom_pas_minidump,
+	.attach = qcom_pas_attach,
 };
 
 static int qcom_pas_init_clock(struct qcom_pas *pas)
@@ -855,6 +909,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
+	if (desc->early_boot)
+		pas->rproc->state = RPROC_DETACHED;
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;

-- 
2.34.1


