Return-Path: <linux-arm-msm+bounces-86372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D783ECDA04D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C0113001BD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D694313284;
	Tue, 23 Dec 2025 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llzGLSkb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0PVMC5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783E330E84E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509352; cv=none; b=NIf8JtQ/icm79k5E5Jbdbh4eD+dDcTO/95x6+jiorlXiQV44uLkd+fwS3VaZF9ceN3QxZBU7+dpfyO1tMuGMAky8tvetyM5wcDlqWtnPxOHVMEv52bI3QuRYiZXZfijJ3jjSIlqIPpfAm1IVjEIjiB6nsDNuafKpPY+0PR5M9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509352; c=relaxed/simple;
	bh=uR+sc6N5yYjJj5p9jhwriPD9bSbFu5rEMnz8fqBfs4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETSKjoF8+DSDGSfjuP7cCZn//Q7N9FLFkh4ZqSwcW3gsJL8tDCpSHDcnwmy+4fcm2cml5O1ADzl6XSp3XQXrQ233jghW/u/tCaE6mCmQTjeVo06Mvb9RiPWrP3VHHoCKNOCWLBxvd9UXbuwQFnW3UY13aXaBs0s1QZFv/GG9ans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llzGLSkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0PVMC5U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNErvE1461402
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zEoNXLlw6C1jJEcLfcS5hFPgLGKLI5XaxPE
	aVhISaLA=; b=llzGLSkbUO7D1EDztU24hH6X3UCSKSXjDmbRS8zgwFSrNp0rb6o
	pCs3zIvKBwmMCwuOU/1Jpd9DrLbWnpNK8rKVVvfJLGW/WMIaqIwBTVez9Cuq3ysA
	uupdDcp96L6n6sdjBzr55n2no41YDNTsx2eQyeWn3KxHrxFEsMGyWfuB7KPbt9vP
	kvc2vYoea8G8fXbUS26qMgQGI9nheOjjJ9nTgJE/tyJ4zjgSCYgyDO0ZN4YwOoXy
	V0oOsyOKFojZe9mbFAfzK5tOUfSYrkTiu8VAo++nlJxguqJrtMjen9Jhz7GEtK6x
	xjCzI9kZWa0PbcBwSPGzdalXp8k6hG3+QNw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8frda6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:02:29 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6465127c7fcso8234321d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509348; x=1767114148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEoNXLlw6C1jJEcLfcS5hFPgLGKLI5XaxPEaVhISaLA=;
        b=U0PVMC5UDmjm2l9QtXXe4jgPqiJix2nSuhpYbHYMoDTyq3hifO2foTtL7fSYgL5U8D
         89BtXbaf6RpewFj5pPX4VqoLBbRAuh4UEjWV3RN/xvINjDOO3n6xmPelOu487u8fNU4G
         YmEb/XH+0z3kVxn3ebEyf04JSyylRb8tx5CjBc8q9qyBMtIpiDkrPKaJ4OqhvRp/7TFO
         JJpdaLVpYzIjRuzYmpSV10lscR+Ag/khEPjnEvzG4DyUy8mOFdDk9QWfLlTWxUz4yLia
         x+sdNEW5hCcoC06LKQ2Vio69bRl5r4c51iE33CgSZxCyq/tLD7nD7p9KLZtFPSTAbyTe
         aAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509348; x=1767114148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEoNXLlw6C1jJEcLfcS5hFPgLGKLI5XaxPEaVhISaLA=;
        b=Jcqeea6AnVHeHjDeA6p7nlTTGp9RF0+P7F5kkq+WpPB+V5IB0ayredtr2g8XBzXyOi
         s5y+8fmVW6DtSqAT7v6iN9FJARqC1QKnECYWKHycnW/18ahJyA0/pb4qPy5Xm7BiNb3n
         fbzUQ8/k+eH8XIbc0N3c1z2pPfEULajkINW+3DNGW7nz81xR4Gtq3DYQ1psW3IQ/3pe4
         55KSkJBaHXBohwoKNzc/sIv4FVqTs/5NRbyM/Mi/9f1UxuLsV9kgg0cOPq3Lb8S347B8
         UcEdtk9EPY943urSUOZ8X8IrMYf/0f0DUK6N03DlNRajU5RFyf3FPQD0TQqOsQc/Un5X
         gsJw==
X-Forwarded-Encrypted: i=1; AJvYcCXU0Jp+LTKhgoDvn7sdOVNyDEsIlOZ1HE3pWyMuyAwSr+yO2mMggTojmoxvBzgYmb+y+f2frVkaJKubEIN4@vger.kernel.org
X-Gm-Message-State: AOJu0YwkK6uH+uAELq+DsapJ9bqxz0abxymsw1Sz+Nn2BZJ1T/5nQu2D
	GrA/ozvvrzJZetGqnkUi6U52xouLQlJp1ukNXbOdHYkZb+1YYCPmkDbVn8qYK102oqmSoQRb0x3
	DBNRjO1u9djOWjEVYhuN097CTtLpugV7cBnIAiLzNKZ5kybgn8e9fGihh58gHb5rTJa83
X-Gm-Gg: AY/fxX7LLXpN9oLokpCB0tnEi8xG5QduDquEiRqOeZ/vhX8SU9XR4RYs/crmj17pKle
	9Nzz+2ItbhUT+sEZlRS/nDnshW6xlf4eDMie3eB8M6OKs+dxzN9ZxeDM3WRy/h3vwzw6LfKzo6I
	P8gLKsypAPIAMx/3JF1nE8aAbyYtq+m7cfh6//9qoEoHJgi08p3wox+k/PjDH+cqShqq2hoVPB0
	fPwxKaNKHz3ZBZ4m2hxVuvp0fpm0QYZ77aEhnj9M8GW/3HMLjaQO3D+BcwQ9YiFo1yWM64DwbNj
	/AoAkJjyLa+kg0bBA25F/56tdIAmUq8Za+O7BXeQ5vYKHu6aAfN1xNV3dge66VzhLbbppygykpX
	EJ0IdBdQ+huCbVAbdmjpJf6mIZr3Zuy7vqzxDklnZvrXFmOhkkQ==
X-Received: by 2002:a53:e1fb:0:b0:645:54a9:11b6 with SMTP id 956f58d0204a3-6466a8a5f85mr9520288d50.52.1766509347884;
        Tue, 23 Dec 2025 09:02:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsNqAl1dpdbis+UQMnk81hdxUKFdOJZ55XPKwAtlXwrh8PO+4xtuo9HzuujHlJVZmks77obw==
X-Received: by 2002:a53:e1fb:0:b0:645:54a9:11b6 with SMTP id 956f58d0204a3-6466a8a5f85mr9520257d50.52.1766509347455;
        Tue, 23 Dec 2025 09:02:27 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3ffbasm1479973366b.61.2025.12.23.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:02:27 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Simplify bootlog line handling
Date: Tue, 23 Dec 2025 18:02:26 +0100
Message-ID: <20251223170226.2275812-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CNxIF1f_2yuAo6GxmIhIOzIG1PbUZg5c
X-Proofpoint-ORIG-GUID: CNxIF1f_2yuAo6GxmIhIOzIG1PbUZg5c
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694acb25 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7umvpdEBtmFyuxGRyLgA:9 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MCBTYWx0ZWRfXxPi3bzGRNaTS
 HE6pe97YyH4DxPUkZUyOjVSdlRKma1d9R5byYDE/5VTTlQ5/96PLm3TElnuU4tGp3/UxJAVzrQ8
 6p0G7e9PBaKU6NCu/HITP7pO2l13DkQyNcdTQ8ZHsUlnukWM1X3Q4OQho7udIvaEQdOMrR36aNc
 H2636dUDeesNggn+MDP4k7DoPdc0VKB+5sHT1Udb7/2gtVkzAMqCedcMvfwNBRrsZR1LW5TIy/r
 HxgUK3lA9Nd12cTQKJKu1h6pSZPzR85fculDaONNYQgfw5q4mQZfSCKcXEXIF0L1pXs0FUKLTez
 JtI58LDuJwOJYw0rlhAInx/Z+reCgTayuoDS6HGKJNS0cL71Fj0+asFztq75bbu8AY3gmYHGstm
 0QFjSq3yprc2w92p/fPkhL8jathShFZh9EDop0ivxP0TG6BTRslLkQf2+LbbfUWnMAWbvaG5MZG
 +lXO2//mjiBu443m/eA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230140

From: Troy Hanson <thanson@qti.qualcomm.com>

Instead of storing and emitting bootlogs as individual null-terminated
lines, concatenate them, and later emit them to debugfs in a single call.

Do not insert a null terminator on messages received from the device.
Instead use the message length when subsequently storing the message.

Exclude trailing nulls to normalize AIC100 and AIC200 bootlog lines.

Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 8dc4fe5bb560..6710cedc194d 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -27,6 +27,8 @@
 struct bootlog_msg {
 	/* Buffer for bootlog messages */
 	char str[BOOTLOG_MSG_SIZE];
+	/* Length of bootlog message */
+	size_t len;
 	/* Root struct of device, used to access device resources */
 	struct qaic_device *qdev;
 	/* Work struct to schedule work coming on QAIC_LOGGING channel */
@@ -46,18 +48,15 @@ static int bootlog_show(struct seq_file *s, void *unused)
 {
 	struct bootlog_page *page;
 	struct qaic_device *qdev;
-	void *page_end;
+	size_t len;
 	void *log;
 
 	qdev = s->private;
 	mutex_lock(&qdev->bootlog_mutex);
 	list_for_each_entry(page, &qdev->bootlog, node) {
 		log = page + 1;
-		page_end = (void *)page + page->offset;
-		while (log < page_end) {
-			seq_printf(s, "%s", (char *)log);
-			log += strlen(log) + 1;
-		}
+		len = page->offset - sizeof(*page);
+		seq_write(s, log, len);
 	}
 	mutex_unlock(&qdev->bootlog_mutex);
 
@@ -182,15 +181,14 @@ static void bootlog_commit(struct qaic_device *qdev, unsigned int size)
 static void bootlog_log(struct work_struct *work)
 {
 	struct bootlog_msg *msg = container_of(work, struct bootlog_msg, work);
-	unsigned int len = strlen(msg->str) + 1;
 	struct qaic_device *qdev = msg->qdev;
 	void *log;
 
 	mutex_lock(&qdev->bootlog_mutex);
-	log = bootlog_get_space(qdev, len);
+	log = bootlog_get_space(qdev, msg->len);
 	if (log) {
-		memcpy(log, msg, len);
-		bootlog_commit(qdev, len);
+		memcpy(log, msg, msg->len);
+		bootlog_commit(qdev, msg->len);
 	}
 	mutex_unlock(&qdev->bootlog_mutex);
 
@@ -271,8 +269,11 @@ static void qaic_bootlog_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_r
 		return;
 	}
 
-	/* Force a null at the end of the transferred string */
-	msg->str[mhi_result->bytes_xferd - 1] = 0;
+	msg->len = mhi_result->bytes_xferd;
+
+	/* Exclude trailing null to normalize AIC100/AIC200 line endings */
+	if (msg->len && msg->str[msg->len - 1] == '\0')
+		msg->len--;
 
 	queue_work(qdev->bootlog_wq, &msg->work);
 }
-- 
2.43.0


