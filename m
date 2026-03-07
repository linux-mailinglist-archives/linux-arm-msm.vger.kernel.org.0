Return-Path: <linux-arm-msm+bounces-95971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHtLJrEPrGlIjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:44:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D5C22B8AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A0E2301805A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C36A36A03F;
	Sat,  7 Mar 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWGB27ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KgIGLtEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C3358391
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883757; cv=none; b=mUT5IGnLCsIzBJJ28sjRleU+9wvEVhO/HFqPOcUPJ9Z9rNpsuk8T+u8h2M1Q53iPZEYBV5hGcpYql0St61FeyATZgNgAKpqGXKWd2XZK0wsg0jQVVr28bdYcqjuBXD+yMSfVYpXEGEFZUDFkRDJ/zOV5jOMCn9kulwMZSEO0pNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883757; c=relaxed/simple;
	bh=RC4ivP66A8RUn2mgY5duP+YJn6Z5mWCRkIxORYBNQHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIcVSjJvZ3fHCVUkcl1lN+r+9g2LosEWwBXHmbLs6FZeSnYODVBgK0XOZ1MnWr7mf5Ingc2wU3VZSmLtjz5nuM1fYZnMoVf1P6V57f/VJuCORZPwPhZnPBW5JHjNEhwtHl52phdAQwohoU2NlIK1JwkS3Iffz5ODwNoDMbBOhRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWGB27ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgIGLtEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276uaTE3910018
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=; b=hWGB27lloBw/FEY7
	X7EQ/4+iRmGn/GWkMXJJkGZLiLCOaaJgDaZMRJN0RYOpZ+mE2U1nrikwHPZBmQ/Q
	MAnHck7YCQg3HMvgfsCTkiBwywFyMkaijDodxWAWHEBoHkF5BdLL3FKp3O6lU/4I
	b3lG+MjcjDU9MKixMHZLksg9kD+nEkJtSaq3/YzjNaY30TYte4XM6KlXgWO5A8/u
	1smd54gyxHbwSnRNxFJRVsoP8BCIbrhAV8+aFvvFQlHW80suvZVsFSIwcJHk7SCc
	nVAWYvwJh08ThDiARVyImfSzXNLAr10J/fa/NeuY2Y0+p3SDa3ZZb8em2Uxl17l6
	38rtSA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14ru76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:42:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae5031c6c5so294410645ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883752; x=1773488552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=;
        b=KgIGLtEYQBMbFpeQCKEW8lfAFW8lkHllhPHi1qaGSIYjvPW/x1hTyOQLb3pU6TAiPY
         RqeYO/UaKvUqFeACJojcL/rOBpJ48JKwXuhmPikcmKYkBNgKGFlTw3rPokRryplHQiRe
         BeAeBnyq4taTtUsItJWV/57N1rxxw/W/vwn4Cx+KQhRtL+NWAKYW02EASPXfFZWiyylF
         cy966fRgj/Qous4j/oBIPV+OYQ3//aU4WsM98R7d7MRs7tk4moZapNGVHXoNBsaxugep
         ytNINJxn2HL7LMzqBlaVJiEcAZCC7mD3IrWtoiRgkrEFS9cmkXAhvuOWJ2c2GvyJimuW
         HuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883752; x=1773488552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=;
        b=rqVm3TjNHNlvh2ekVEYluvXW/sCeIKe6MpDYzrTYXCO9yxWh07/dR/xX0QC+stdww9
         OSVURWSVgCpTEJdvaEID9fanYDB/iI4/jJVbs16ZrL6jjLKS4yykiMJVFdEcFMTqZaM1
         P6huFOcJzzYKs+tLyMhTtWvS5Zs6v00w1KFdJLcmxK1NSlCNk4bKKPvOkcBXjmcL6Xrl
         rm4yYSO9TnHlZZJlZ7Y2FYw+1CtLcvfrBZWUfnuE8Bl9uUqumUNh+VMVVpnD1AvWKO2x
         zc7EabMmWJ9FENL1dLEqQHn3NEuT6pxqQy/Q8jjrtZQQ/49qgvWOnqyyXMYrEfMjZKlO
         A1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCV6mGFCzASfolbLx61DNTP9VoqaHypea1t9NaRXSCaDcAbz3pYsEsNkMbFLogGbxn4jsvKkEkK5Uw6aVgZG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrdai0OR/gkOh4JOJ8yqmTBUuKAOyAEpeMN2MTujNX3084kIkU
	2JmGaK/kTdtEkME2wHwNfnQ72jhMEucpijenslQcawzTnadtbov/RBKrp1s6P+LuTU1XaoOQ39l
	+UGZWUO7z1sKBG9rEUaHOkvWiFDvwzkMjUf8jFts0t/h7ydu6EuCNM17pYsoYCCA/+LlJ
X-Gm-Gg: ATEYQzxrULwwy0/odBHO3a7BfqgsAkvSDCYJfL2UOULkNVgY2ggAhww0zvX1ovswvMl
	NRvkx92KkS0sOoesWBf12Aks4AJ+7GiwKOQvSNeAZd1TXxLIyzWQ4X9A0i7yt+AGeTgrq4J+4EY
	ms5axN8svWHDQ4FVeEjaC7RRq4AmyHYb2KlKPnfwAlzuWV+qVAStW2u1uA/LmSwwM8clfV3U5XT
	v7bh40wj0DSgf6WmQnNz4rT9O8f2OUF2TVBZ6q8/B6NjwlslijmOU+gdoe8b7UXA57NE4q/81UU
	Sd4liEQY0AdrbWPZqiKXG9mAvkSNDf1Lff0qYOhfX6zao5ap/Wmc+I5Kfom7BfRTDP0uOPaD1n3
	byJ9oYWFDlIIe5ouJFdDC65Tsbvapfx0Vqr7Gj58zzJx8dXM82qM=
X-Received: by 2002:a17:902:e74f:b0:2ae:4ad5:b76a with SMTP id d9443c01a7336-2ae823a246bmr55868055ad.21.1772883752161;
        Sat, 07 Mar 2026 03:42:32 -0800 (PST)
X-Received: by 2002:a17:902:e74f:b0:2ae:4ad5:b76a with SMTP id d9443c01a7336-2ae823a246bmr55867845ad.21.1772883751723;
        Sat, 07 Mar 2026 03:42:31 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:31 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:29 +0530
Subject: [PATCH v2 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-8-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3311;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=RC4ivP66A8RUn2mgY5duP+YJn6Z5mWCRkIxORYBNQHw=;
 b=WTCK3v2dWMuJgvV+WvtdUdlEGdN9Q3tZgllxtaV70N5KpZhm5jlgTO4F899UDqqR4f5zYYf9T
 1QqtJ9iX5efCi7+fx9C1L6G4XBCBD3USOrXwifUqcHoRjDxe0fTw67n
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ac0f29 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9mPLix8uEUeM4unapbcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: RFzdNBqEqgGu6a3WIPLXIEooEs7FgGPR
X-Proofpoint-ORIG-GUID: RFzdNBqEqgGu6a3WIPLXIEooEs7FgGPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfX942ITUroZTKk
 g50V7ecar6r9LE9Vby3wu9b8uuz6BWJWx0CJWzpcfcXkWjrfgjS+RVms+FVY9FlYhxv2fYp0Nz4
 IfwS2S9H9irV4VtA6wJnV0pKRhBm1jEBpgJnc/wnn/ebZOiTlyrfaAGLgW5+1HRqgZNB0Nrd6Mw
 6JuoU0lx9QCweRtU+8Xjewd6Vz5CLo7+zNIWkvYrvBcX7oArxMWXSOYzLvF1DM1RDgX+gw1yaBC
 K/CSHQxtxO4g1OpYgneOcre2ZVIZ0b4Q63SqfSe0R3QwW0El4/z4OgCh6ACpqSNHjo1zUrm5Tww
 UYXonbJspmz199TMgLHkwfEJIrSxh9WmLjJLC7MvdElcwBzyCbgVjYBmONADskEAGEu4vqO0JC3
 nhGIz6c9o52lBICgB0Z3+9ukr6y9di4xJGm+tQJHKJ3br29nhM82e8QkfZX6CG6QwtRHWZY89JV
 dUSeTzkBI6zA2jpYk6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106
X-Rspamd-Queue-Id: B6D5C22B8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95971-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.933];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device. The sysfs file is created under
the controller node, allowing userspace to read the training data even
after the sahara channel device has been removed.

The sysfs attribute reads directly from controller-scoped storage and
relies on device managed resources for cleanup when the controller
device is destroyed. No explicit sysfs removal is required, avoiding
lifetime dependencies on the Sahara channel device.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 1eea93384724f559f3b6b78cb6a6e9a77cd5de6b..147bbe20c768198851ce78b9ea36867c554867be 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -404,6 +404,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_ctrl_trng_data *ct;
+	size_t available;
+
+	ct = sahara_ctrl_trng_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+
+static const struct bin_attribute ddr_training_data_attr = {
+	.attr = {
+		.name = "ddr_training_data",
+		.mode = 0444,
+	},
+	.read = ddr_training_data_read,
+};
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &ddr_training_data_attr);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &ddr_training_data_attr);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &ddr_training_data_attr);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1249,6 +1316,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1


