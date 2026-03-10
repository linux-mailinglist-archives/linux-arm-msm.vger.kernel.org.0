Return-Path: <linux-arm-msm+bounces-96516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G4YFmbHr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:25:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C61462464C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F134731508F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EBC3E8C53;
	Tue, 10 Mar 2026 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYn2oJD7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+7/hFm/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB273D565D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127367; cv=none; b=Lw4hgDB9ick5Bbj8b5aKMZx7el2mUGxJnVEQiVDFXKGv0zdwF3BQKiA9tCN03B5cBBUVV+BpsHydVOeNtYtRur4v02fKx15okKwqA6FW1Gy19RZr1Bsc/aXYVt7nvGe1/0KC6+NqP7E1FmRUpmgFVOGF+8/AmkZ7pQqi8iu/CM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127367; c=relaxed/simple;
	bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMwOSKBx7SaXs/++6eRgpFjP/E5nbtvXA0YvAlAV+L5n/E0IB3QT2snn6NOTi0t7Z1c59bHO0ZvI3y2B+7V6xpC4dLHUoSOLG1QSlU6Ymj1P3fgL+FIkBSa7vpo2PBHL63idCkvva/XLGWxwWZ7Os2egBEGo/PNT/dy6UYDTTIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYn2oJD7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+7/hFm/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EL8d2363224
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=; b=oYn2oJD7ZYS6xKDv
	L4wJAW3KR170Qvd8MThH0/2fBJzXL3055SL3k7YpFmDUnHdsOxVtI4l2o8XLU3SE
	4kO7QO6FhO3XrKNJBfNmVkprnYwOuOoyeRbVfVAXlLf9TIYrxjGFHn/JS7w8Db+h
	ogugjfX5CIH9HsQytnjPa/xHoZkmUn4WnJFaFCT6H0cRKcXvYTa4aKRsA8NVAqKb
	7cpvBcPnBOQXifSV8Bnyej6olfF4ztc4vT+wszB39fTvwDyhgwV89LA3AR5XVAWg
	qtw36XPeAG82UftvrPS/YmU9GZrL36LlWzXYCjLmWy1UmPBhiMAPHvTxjL/c4hEF
	paaFMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032b23u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:22:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae42659a39so555994575ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127365; x=1773732165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=W+7/hFm/EQpv4+9Lh2/gcXUnTmOLqXQbspH9qCXSM7ZrNfyxaNL45DhE9fm1sCfcT8
         pZGp3kLJ7eeyInBsnXn+GLPXDe9rp1du4x4Q7LRHKJRhF/2R56x+xn9ZYqQxwJ+kx3bc
         xGW/sLbG1dqpIwxcCwt7KmOn9iSkSMMWJ8SlvGehyF/OOPBZvmurmp1d4E+XCk4cogpM
         jbm8fwin9GLT4/oJc7rQDWhlnIGwI0lOQJwRGnyOTGaGdrYBDQ8VBp47EoZVKEqsG1LV
         aXAgfI7yKgpkgA+vafFgg3eJTlaB5yiYChoqW5/zrqh09MexNl6KXTnkFwbXssZnfK16
         Y7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127365; x=1773732165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=DnFca+7AzGkgCPV/OwODiJnE/hpBH50DZNUzI8RiLvG1TIOHn4fm66ht8VMbuEo210
         hGT8qVYianZasmUz3O5EmBYyDxtAXTOBpJfnkBbwHPpiHbKY6YrQ/2kIamO6vuiE0LoH
         cnqyQSzoCN9V9QnZj4hdQDAXw5jhKd2Bzod7kz27+X3xXXCdlmrApyIULXJY8YlHJiND
         UnIBElQZzsSKateU9+hDzMYccF1R/xdDQc4+SagOCYla0vCPJxW95k7wDFgqKFQDn8/D
         /3PVuFv+PsnRNQmsK7Kys5Qj6XjR6JCfjCMuqoQOCaUacAKtNooDYYwzTC8ubRJhUtyD
         TCKg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ObDMsFOkT2641L4Xjj7uzkPm9S6kkzk9P15fj4W6f7nhZXh3JzcvyYBgmDUP0pnUdwedO7CEsZKeE24q@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYIT11e8Vko1m4Zg/yj0pB+8GTjpHW0mhDMZFtT6QRmjxWHDq
	hKTEitbLhJlk3uWipAtWHO7QemrhYayMXzXs6TGHsbFHj4QWc+TxVxNqWwwsKayyEbTf5NpobPn
	kdNvT+tXBItEtCoupCf8KuNs5e4Mei3C6F+cTdCh+hcgckECy1HJKojpBQY5XKbeCUn+K
X-Gm-Gg: ATEYQzwFxEsHhtt8/cC3l5IHv881meovtGYhI0qdSh11c8ObKUuNF+47Sr2//S7K1+m
	P4mS5sHRQ3H1s7NTUJemuqF6vzLoDPaPcfbpOzXtBvmBAv8PrHe+319k8DGtIYOWczNGC5uq1eR
	LDHednud9oxZYZY7ZGEY6ya/vllBpOZq9t+Sxt+9lxGwWDMirDCpqnhuWcl+vMc2BUWpKbZoqg3
	Pj+cnZo/yJzpWj/K64TwJy+cle1gJNrg6CZqDo7YXm/7NTSTwhdlg8qIpiT2atmUKz+mO3cX42E
	5twwxglQDL3zXLRAhJy9dER1qpam3oG0YHewaWTlOoPmqCJp3hMB47xWEChTtq1LC3XK7BCyJmF
	72F6jytX6TvbkeAE+K2cW+U98/RAd//ysqCCa6B1skOL4/DUy/L4=
X-Received: by 2002:a17:903:2ac4:b0:2ae:673b:6a3 with SMTP id d9443c01a7336-2ae8249d4fcmr140850835ad.49.1773127365098;
        Tue, 10 Mar 2026 00:22:45 -0700 (PDT)
X-Received: by 2002:a17:903:2ac4:b0:2ae:673b:6a3 with SMTP id d9443c01a7336-2ae8249d4fcmr140850645ad.49.1773127364647;
        Tue, 10 Mar 2026 00:22:44 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:44 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:05 +0530
Subject: [PATCH v3 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-8-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=3311;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
 b=pes+jy19Oahyjrj9tGIH89vFrAWYY4NOq1AgxQcEUjKQTpqGWSIU3tWU0VFnNvOBkuhrGWxoq
 VU6vI4W5RVXAVK+t9BMlRNCZDOBecfyTaszyNRJ9WUpQiU+8fxa1BuN
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX5V1pkQSA+3El
 hQRlfms6mD2i2LulkoGjNJ78tBevxCSZ6zR/g2NpebKmvfSGs42d35++z1htg36/aAjuqznTrYv
 afLbavviSAqZEpPis0IY4/vaeX9U0iAPCq7YfiX7kSSHU64ERgNnV4t8BJmtvsytvQ8BTvo16lU
 sNOTG7FGQx9cR9Tx4ubr9WauuQg2GAnT4gcWqr9ExqsekqV/jTxZNS6Cjg/hV3ojHOebjxkPckn
 9D6QKD6cO2C1EaEKGa+eIHolaWZt5qc5qFrz7f9YlrfEVZKi+bPaNET5mjx83oRKhQ7Nx5VhsWb
 KPXThH5I+1vd17qSWwUNDHhiS/P20XvO0EU3nO9UR+8jW+uvT0DgTbj1vP4UDPbmu3UpyArmPGC
 zsijxkctp0WwjqynaLG2yH5VsnulW9oWeg9FUSuWLJRrb/9iJln4qjJzwx1C9cHk9yNxRXDlPF8
 zQ43sgHuy7QQY7uODFA==
X-Proofpoint-ORIG-GUID: NQZHo-HjxVBnL04ZZSl7bThqZk0kVyMV
X-Proofpoint-GUID: NQZHo-HjxVBnL04ZZSl7bThqZk0kVyMV
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afc6c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9mPLix8uEUeM4unapbcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061
X-Rspamd-Queue-Id: C61462464C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96516-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
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
index c88f1220199ac4373d3552167870c19a0d5f23b9..b7208738df10fc3c3895acd46873412818dc1730 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -415,6 +415,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
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
@@ -1272,6 +1339,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1


