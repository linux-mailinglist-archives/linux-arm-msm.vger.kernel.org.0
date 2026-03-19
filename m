Return-Path: <linux-arm-msm+bounces-98648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNywBkqZu2nwlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:35:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 862B12C6D78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31405321236B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EC334F484;
	Thu, 19 Mar 2026 06:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsLNHs4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADrZ42HO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5753451CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901945; cv=none; b=k4Rt9xDZ77Y3E2hjyzUtoSCjmtHFGkccmLXeciABmuTBmCRsAFtBji4TJBrTZA9lSv9HrQDM6TQxlFOyffh3cmUpjDqr+04aq9lwMI7QogahWPjQC+8tKRw9kjbTgqsfNaJxFmv7yf9FDUy4Qi14j3yf24sG8il+kC2V6ZRCpjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901945; c=relaxed/simple;
	bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SuvSw+7Mwi8BHS6Focb9ne+/Hkugvj00aqLQsjzasRbLpuFFqzF60kEIWyms29MLWMD/vA8G9cXHGx65PvhmVfyC2ruHvo1uL3jkA8h3slKqwazUv5wWfmowGh6ZHumADWRgMhG+7+Xq87fLyzKR9/sQBfieLEqZcAgnkv9+hPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsLNHs4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADrZ42HO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xn9u2470005
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=; b=YsLNHs4ESlAlVBun
	SQlyjD5zscJyYzZ7SvkeNmzOkYaKxSikbLg1ELzJJZTBiU+CnRu0Dx9bOa+N2KnG
	nCil+AlRj/yvaGwbkgjj6glQdR3T1c4k462uSVSibHHPGdCdcfmabwlZDOOYxMO7
	39pj0Y8ztpK4W/badPXfvDZxs2VxverZt2Mw4BmjpoztOT4e0GyUK+bsQl5QwmtM
	KwDA+Yl6es15EM1RIIkpRVffWm+vHCLZS6HzUpx/Er8VHY5Toq/KgqDVsnl+ZYDo
	G9fVCXHqEVcK7L+RjRr/lD9sG72Ov3sMYc4KH9xPW6m068gobAecuggJq98q07TV
	Whm45w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj53ms5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aed1beaa73so4713615ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901942; x=1774506742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=ADrZ42HOJabjta4ZEQgi4Fu7uy02LXKrd0n8kJHF30hoUObXNHcn3oqwhDReNZsq01
         i5M3EYEmsrFh265xI37g9yRmX41rD4ikxWxDDC7irJB6RlFHUSbhQScv8o+btIDJBamE
         NqHwIppceUdyHWhKUWqmwd4DBDyS/NFjGpybhYDqyAWY2Q/UTGPn2yRoWkNed3YjGbtU
         w+ilV1H475mVVl+MkrWAYWUoVm3miaHZkDAYdKOwxWLFsTSXJyp7X05uV61SMIfr3vvb
         5iIGIcMppQkNR5ymDryByy3mRnMp5CkwdV7obiYbH/LxIpxOCFpH65hhGMemW/KF6SA0
         6Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901942; x=1774506742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=A8MrjV/12HFTKZfuBJITAJkxqfByLLz4+8GVPbrxQwXL7MNftu2QMhr/yA//voC1wH
         QnF84cq9BWEQCRPXRg+8V4DiNLfiG7WHIr3AGfGk6B+voSDBAYPoHbCfFAmWvMDtYZxh
         2P7jj9HUEQWiklgopqdKVHeMGwqzdGVtzL825dz1JNX3UHsOqEqP+rOhiKs/COjpV5RX
         z+CbDcDMjIpLdZdy5QJlL5J6h6P/93qMoHs92FiUuZ9TfLushNYaPfLWJqZad6FJEEod
         Xlaw59zlKr8zABB4zb6RWbYDZbs+Rxwy+eCIJH2YqYXizGUyVEvUzwQV8oA2E054sAHU
         F/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH0yAESjZKcd0NXqx5XLmgRn/Zo1kW0ApfcVuKpstfh49ENEktuuChrOodsIsjIcrE1I48L4k1glu82BlY@vger.kernel.org
X-Gm-Message-State: AOJu0YxmBKUhgV+SaLuv0Pa9oEoIlpQ6pBD9D74sm4kLDtkRrwUbng5o
	+1WZi9CSx6lUxhy0GyHn4EVzlm50gpjAf7QOUZLe/408KxgyIisFzkE0clmyMRQojWLTkxgZZ29
	duvvpXj5FFlEAP7Yomy9u+oN1Ae7Un6sMlwZI88519z11Ts1nF3UdfLI+s5VMud0jk0Kv
X-Gm-Gg: ATEYQzzwz1SWMcIJdGM59V3wKfKEIy5khHpMoX0WYyauVevZP2ZOwogCM5nK1u2oQDw
	ErPuhYEDJlbw4nxpTAOn4hdCcw1kiCuB2Xq25umr384JWP0RwxTRueXU+pTYHDl33z/ntRinXor
	yE30gWqsxJ0B9y/eU9KzHjcql5biSLSFNlfl7kRnUgGM6w3HokVaObUnbPsH0wun8WYJUKpZcoJ
	cFeecJQOzT6/o4dB2epDigV2kpPsbJP7KmYNQu8HXp+L5BNvygdtwVd3y+9+idulqBYKtFJfRe7
	odb68ndmBGfs3/U+Vum97kdvgO21KqAlIUWd+2laCsRWRoYTclobF+ZWoHqQfK8bBCHSEUIz9Wy
	rlbPc7V6U4q8KBDHJ1uzrDoWwobRRFA2Ll5d7/rD0ya4qKyWw/k8=
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr57939945ad.43.1773901942217;
        Wed, 18 Mar 2026 23:32:22 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr57939835ad.43.1773901941736;
        Wed, 18 Mar 2026 23:32:21 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:21 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:48 +0530
Subject: [PATCH v4 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-8-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3311;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
 b=E912BIRgk2tIUK4/M4i8++DPEcAM8x+0kS4yuwICPrM81yr9VdRFAzP87se9p2qP1rqiZUxb4
 9ZzAK2xR+g5DkO5ycJfNGU8vhWZhLd/M+V0j9MwRw2DwL6pPFoJCvz0
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfXw2PvhtXlBWsK
 y/TbDp4AtURwRswOD0+bW6FdboaKvNsHGscSj0rqx4/sRQKT8EwHW8YFTLcCo8kR9sO242EKJjQ
 odc55Bn5IGIGaoUcOnS7Z0feVfX/VR4R5LjwqnnHiHl0y9lYLHSdciwBfBYmEj7FaxidjpElTav
 6quZ2eEWUJ1ZCaNH+UOarR7W57DGraI1P10SqzBajbmRnolBKJx6Nw9gxA2UpbVRefECIieAuWG
 k0TZrdTN4CvcnAUxh321p1FtoP0p/SsEk5djjfOn1FhjEzCh8jnhxaDnAOeAz9kgqV08qMvG9EE
 fduXrMPHLIDJdoiJBFr0+MAwEvXQUpUHqrgWg8urn2TfOB3BjnXwFhkDMCyQhcjaGm05Kcwn6Sx
 iv+BTCmP8m27D0HHOUEojrNqBN5MG1p5vDmoyiBdFADt6R5fcm700EFspvrhaKIGwGejU5YWrk4
 Dhe1NdcjSjEWHTz+m5A==
X-Proofpoint-ORIG-GUID: jPbPh5VU5G1njOnPdGsyz4Tm89LgBy4I
X-Proofpoint-GUID: jPbPh5VU5G1njOnPdGsyz4Tm89LgBy4I
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb9877 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9mPLix8uEUeM4unapbcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98648-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 862B12C6D78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


