Return-Path: <linux-arm-msm+bounces-106424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEE8GFef/GksSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:19:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D61EF4E9FFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 200B7302B776
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1D13FD14A;
	Thu,  7 May 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdfFPFxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCuAueRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1B3FCB1C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163162; cv=none; b=omcvDoS4xL8+ehXnw7ZEYMYxwGOaLpUagHYOVvupKetS81ikYdlLk3ssH0Yf5XGvafJxYtz4wf9lnowIkrrtXNLba+kfPXWUl/FJMhQ6I24Q7JkByb0jKtjzPzOxAWeVtWOn450KyjUkoR5wSyKB751byhLkIlYDgTYnV1Xwshs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163162; c=relaxed/simple;
	bh=0XKtLb+KNpJzb2pfRF5CKuVsIlfPIhLw3pICGVnZtAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLTvqLax1a+dspH96YNY2RUeA3XCe8jdr68naZWQw/VKP+1SNg1+3KnZVZ+sZEwtdCIvnyGAISW2H6uExX48FKIlmcVsyJ0F30+Zk8y3Q1NzL6ANFj74rY1zcOXF6jU44iWXEJ7wJqg0NURDjxCbZOX2oOhSbXM0KrS8zfW9qbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdfFPFxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCuAueRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pYnE1424508
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=; b=mdfFPFxNy2sPNcjr
	j0FmFrSTwLflWsXzpHxg9Qh+5uXaCGTLpQ4MhjLyQ87pWQ7rSJ6A4b3q7Z8H9iAV
	EaIN2lNwHeJ8fQIxVHsV9SPPHcGqPklQP6l4nJPB0gETHTWd3onwwOAAJp37oc/8
	QayyM/qTfJzrzrl+pmMRbKsYgN6+crYiL6eImIXD5qUZAICULRJuFQAz8M2HQT2D
	/7czGFku1wAty209NJUGKRgy7OsxRyTRscRlEMIYTbz1rr+ip3DbUT0QVdhVKx6b
	VKhiu2bwbho0RD6w/8XVMzaqW3KJVXXCX2UWinpyA9Ud/KUTyfgp/nhUeEEbYwME
	TSFwyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfsdqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:12:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba6ca20ceeso10289965ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163158; x=1778767958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=;
        b=ZCuAueRokJmkq1aC37B10Hkdp4FucfDfr4otXEvUkgawOu3s6UyVm7nSRDRTDTAFeo
         NJfKW6YFgvkFeS8eW0oPbJC245VH5BJ6TWi3ZPCIWQLpDdaB0QAnzEKuM15rHFZyhlcS
         f+B4sjucYmeF8QxorImvHzdYbxWz1mS2HnZjqrjeon+2O7vMdXI+WR4/hQGY9KaAxYpl
         MLZ/IpJuoCPcSa2y0jPjjloVqu9HMcrhIIMoodpjLY7oa4wzI4HjKcJPvgbSGRgj6BsV
         B2hK/AbmmcwGfvl9HU7F4MhYnpjBA782ne7sqwvJniRd74sAzVJ+vfhghETb0NidtVJv
         vVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163158; x=1778767958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/z3TLk3YJ3zjJ3lq98822BJk5JYh6VxSRdK8UVMx+Ug=;
        b=VsPTiSwqWYosIikpsDls128tnEb/81LkQRx/TkZc49riK0za61AEJ58sPJamfo5nDZ
         9CmCwLfGtBUahmsvtJjnMzbVsle1RmeEiD0hrYczmcTaf6/jw7sY0Kv1k/4e1yqOMPj1
         pCWFN4QIatE7wGbs0cj3VqvR3lRQdo1a4r7K6VT/PCKqX1OByERDJX01rSEl8lkIsic/
         OP0o0WGnRsNu5Gbo9LSz42skNYpFusFrjh5mKdMYcfxEP9sWVxlkwWEnkhs0A/rTJgI6
         t5PprSEduJG5zYFgWv9LFUJT7hstbtnz0otJb5UyRux7yIQ7yS3+ZSo8Z1mSOGWbmrjW
         c0Yw==
X-Forwarded-Encrypted: i=1; AFNElJ/j2S7u6q8UWlstSmps81Zb7mKYjsQf3r0USUKNQKtKjxVIhMX8q8mvErNHWA3bvH6XyPRpSOaq9JY8Pfrs@vger.kernel.org
X-Gm-Message-State: AOJu0YxXNXOZC1AlVWHxR4ZLFWXLKKqXH6IbDPAKZGTHE2w5LoYHELzk
	79AhnwJ8aTsSllZ6pYH1lZjg5tta0mQrdaKSZWr7sQSasq9/UyWg962UJs6BkM/h/biuICRr9JY
	5KE5sxhhuLbVHoVm8brPFbaeGHmSXaul9v+Gz64JgYprSSbotr2+zpjB7R/m9DA+cHpYG
X-Gm-Gg: AeBDievi30LkpZyW1EvgehfMkS/Im6OPDN/NrQsjtOq+OV6ruadkl8re3+81tYQoZax
	xJxoXPlLR0nVolH6XygeGLbB3LY8WkPbuFc3jyMuw5ZSS95TH/1cd98pJLbTTUC/dnhbJ27gKj6
	PqImsey/r2+KY6DqlWYQw5SGqd1t1hHYpujD+zrt4YPc1dPvvnCZuVK13/fp1LCqNi6PGOtI8Gy
	4x5s5Rcr4kXzrGGprYcgOUE1zNFqHyjY2L9yA6YwKu2q45QvDj1rgvnQmw7I1IOWki+vZRp2r2F
	1K/AEvT44xkVkyGAa2ZQuW+ain1TzyPnP/pnUZPNzzJHwzp3HeWwRIFpQHPWGv+P9FkLcbmRrXR
	Ju91YF+aROh4C2D6GYhcwi/GebX+TsMB7Ak9bEl5/KUxIY3LEEmnobbEw15tKEPcxEf+UG1zSbh
	r3X1tQE15zYuwXiA9C18g=
X-Received: by 2002:a05:6300:218a:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3aa5ac0ddf5mr10192221637.49.1778163158476;
        Thu, 07 May 2026 07:12:38 -0700 (PDT)
X-Received: by 2002:a05:6300:218a:b0:3a0:d88:6d6b with SMTP id adf61e73a8af0-3aa5ac0ddf5mr10192166637.49.1778163157864;
        Thu, 07 May 2026 07:12:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:57 +0800
Subject: [PATCH v18 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-1-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=3816;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0XKtLb+KNpJzb2pfRF5CKuVsIlfPIhLw3pICGVnZtAs=;
 b=D5cf6pQGKCuusxfGdwFLVMla/i8jhs3iNib8sL+WsPnBr7WuT16FNM2Rk4aS7L5AhjxNGcrZb
 r6yv0LM/wAeAiYYRxxEr5kalsz3g+7nvRuAzWzkLh701BpKSL4wrbM6
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc9dd7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfXzSgCgNGvGqj/
 7hcjezJtPZx94FOIqF0PsblGDLk2fBKgdT0cajNT//QFTL3+ShApWPWelzrgWQeZwvWPs8PLAdQ
 4OxLt074UcBKurj4/edpv0ndvGijDjCSHdNP6btQCvgVgs5+PMqdbuzcz7qVrOpQkz0ob8I3iW2
 yjRdFCcUf00HUBnLUQfOjLIkYgSa0PTCgUIaRKJZYbOOTrA7Q3n1VAGADZVZDynTP7qtX13ffbB
 yis7cj4csCveqPplUGxOVUK/deQAoZQ07wPUCgelp9/Gicks18yLC3jBRHe1p1CiMZQaRUD/ybm
 G/cjShjZrw4OEQVVwGjPk5W33ELjsKkE5IMNycTW8b+LlxM7ggQqqazq0k0MaQ1AbPGkvl6B/K7
 YcS94w3JIa+CWdgffKko4on9jkmUkGArJapubntq1wC0cBkbKopjTIGUunfIdweXaENBh71um7F
 ARW3EMwQcfw2u4PpJvA==
X-Proofpoint-GUID: 6RH8lfiF8OVC7ct32s9IENsbl5H-O5Tg
X-Proofpoint-ORIG-GUID: 6RH8lfiF8OVC7ct32s9IENsbl5H-O5Tg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-Rspamd-Queue-Id: D61EF4E9FFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106424-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +---------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..9e19d370c207 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..5532ec82e82c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


