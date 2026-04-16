Return-Path: <linux-arm-msm+bounces-103443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +InzAnXu4Gl4ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:13:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7EE40F6B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC50030E0950
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4913E0C6C;
	Thu, 16 Apr 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqjGIXZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJZzALKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5443E0249
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348636; cv=none; b=rJlHDPgQ2ycrzY1BLujer4fPpvuK1yxNACbgTdNIB50vVHUHmF2Hr6zzS7NkUnYp1P48f+mMNv4xUwf/SvuZZkMFS0zXeX/Pp2cAo7G74z2jNOyR4xxqAecLbohgfHi6+lM4/lTJGDQdsmR5R5BbxznOphqnr3f4DYi9Ea2sjV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348636; c=relaxed/simple;
	bh=ED34D8b+KIsBJGlgWYmYp+bxz9nF9W6dhG3Lu+L8T+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpXQhewDzlY09CChTXc62P/i3AAi5CletomFB4txCjCJWb/dfDFPy3C2VQ34fxnp/Bf2zq9tgqXtPbJs40fIPtxU/PVdcc0KfRJ356ADutqrQzPBSjMn76I5AzDnAOOT7P9/+1eyzQ/6iqs153OlcbtbN0LH6j+TvACJ1xn/7Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqjGIXZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJZzALKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8QTlT862166
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=; b=XqjGIXZdw6NKQMIj
	hSdPAXMczheOQYqH98Bq4weVCFDDFn4Zl9dpgUgwEA0k6WsX6U5CdxHcdpikXQ7I
	osU9HlveeflD3qM1vNr9ljKCejtLeubry2wpPTOPiclUymeC3eF06EVlH6SlR4jV
	1Uh5MPrhLPMk0lQIwaNs1LdmIlInNKAYvidiw08ZmneMzSWnRoroYB9Yg7kyLU3D
	0XeKNpgw4tok3ZAlx3r6RONqmRy3Rdn4RycrT99ZTnszi2EZVnOawonyeWfylSV5
	HCyH90Yqe4uIR75M6mt0P2Rk+k9EmjsU7XGSzRifJSks8W0s1UqK5vMDGjGdWEl2
	8ThZ0Q==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ec6fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:33 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-651c92dd649so7741376d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348632; x=1776953432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=;
        b=DJZzALKmhPmWQs4MEBjB2vZ0ouRqz1mqpwsnQT3miKMQVFJ7JR60k8Q17RbETP3djF
         lgWEtiN+hJVX/W1qxgqNiFNGvw61eA5IOUoxSc4zNytEdf05A7h918oA6QX9SqCNZ4A2
         DHc51z1qVQP+r5pXXd78bkn1oxB39+F/0xJnAC0aIJo2fJz8b1dq/kVYtkZPorLepcLB
         9UhsSnd+Z3o/czRivMh1hbRafx+GwwE2l6ktEPT205MTI1fyAJ2ySSTFXGAb1OL5lfeL
         VpZiJsiZtBmsy1m8oKajnJg2u7cnI5LZtCBZ817RZqPd0YFq1WGwshvaK12GGk9Kdhd+
         QLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348632; x=1776953432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=;
        b=Thka7GCugh54iKtHM+i40RZn3RTedo24BvfpqfSJW0cn+NSKp1oWki/EOcBKALUk5r
         jktAeOSLlv/Cq6P1w9Vu63yjhWiPRid1nDGAYs/MTFFuqD0G853TgHhOjuctGlt0Z5eo
         mtuC3YP7M5YQSDk/cE840iD82ycQJ/HB6a9HK+v5fKilVnV/uIZG2L5vwCS8VeIp+Ys8
         MudWyh2RC6kyg0OsN9PRVPGzVN5ucaufaLw+nbIuBOuR66CpDPG15gWc7OG8HtMimkH2
         vFBnx8PlX88SAtwHuw8Fr+CtMFsq8S7lCAAD+pty9xiXd2pqSzKCVeTaurKSwKgjEQv9
         In6g==
X-Forwarded-Encrypted: i=1; AFNElJ8MobbuwVN76zMS44gnrsvPLVKuaCrZwKz0LWS8NNro5a/gYZBkaqsDdA45Dn7wugpjOsyGJRZdJgjlWOcE@vger.kernel.org
X-Gm-Message-State: AOJu0YxaHEPjjV7Vwnsa1EhakybF9fbP+mG0mB6uti6KjAtZFVw4feB6
	9DmNx0IcbweDIqXyRY16lKxR5UnlulxPF9IuCRjN7+Ovuj+puij2FYiNaQenYs30g57U+88f1yM
	ZZXf1U0kOGDOh4QaZbHz+ehEHRkI4oF2rdbdC+vVMjRArOJU6QsU2v8smJL6ZBYvxJhll
X-Gm-Gg: AeBDievN18RfGMnO2cv9La3c9dbNtbTjT1uYeZ6O+YWlQNj9oQZ+/EobOd4MLPUiXBN
	yNz6LMyW+owfvpLAFGo35ll8q/U5jDlEZg8b9+yrNzh4y6G9YmfxLQuoRX5CVfMqncGm1ES4FNa
	0wm5aWoxVNlUlLYjwwXghWCymjp2q/7N5k7KeAwhQZXuyWjr/rOaCpfACDmur1frf0ykNAFOMZg
	Qogmx8MWKz+gxcwLU9EMB0K/pl0XNDPdrAbUPjeAuqfdOugR9D6JXcuCmuq9hDoPtOINvXPLI03
	2dE3Jr6jKbJt9lqTeoa5ErEsUVxdqDtg5/huHULQIDgmBmyc8U9FBn7S5NUi4UtRkI64CVD5s4h
	KvUN4YV5sqVLEzxpxRE43DJg2JSYBJP4zYW5Ik1h27uyU3i1cqAU=
X-Received: by 2002:a53:cf05:0:b0:650:4aec:29fa with SMTP id 956f58d0204a3-65198b734cbmr16936305d50.38.1776348632123;
        Thu, 16 Apr 2026 07:10:32 -0700 (PDT)
X-Received: by 2002:a53:cf05:0:b0:650:4aec:29fa with SMTP id 956f58d0204a3-65198b734cbmr16936245d50.38.1776348631578;
        Thu, 16 Apr 2026 07:10:31 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:31 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:48 +0530
Subject: [PATCH v5 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-7-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=5329;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ED34D8b+KIsBJGlgWYmYp+bxz9nF9W6dhG3Lu+L8T+Y=;
 b=wr3vSGs78JSxGrL9+BaCDjQaV430OdwRmfmRxGfEA18NdKlc7cPBYHUMyREr7q9wjEQydgh2n
 fowGZKpD2eLBYkBvWD8gp2LTGudSo2ECATeMbqaMDKsHQlDphB0Yaf9
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: RUmAYzJ2h7r6R30E1662AVg6W7yBh18S
X-Proofpoint-ORIG-GUID: RUmAYzJ2h7r6R30E1662AVg6W7yBh18S
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e0edd9 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6t33SRJ6vQwVIDTtI9kA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNiBTYWx0ZWRfX1+vRnS/MZEQk
 4xtseCBfs1ahbpFx014bWQ3pEyVudk4eic5mhQ1tlUG4LiMpQV8RantQRTAlYslC5dHfnXaiYeg
 IT8XYsyqhnI049huDxM6CsKvXki8KqqKtwKsia394QnMWVbxQrzgad9xBgdH3bSGBMUjQVRk87l
 Ye3RaVMEfbfF8jXQliuQa1/OVawvJ97DqCaZhuBA9hInrlv69onN3joR7EfcjeHu+PnNFpTI80s
 KiSll2L3ariEe3Km1X7mBO+S5IjAXPvc+KjZkk3830ZoRygdc9dYEN0VnNdX+vF/EuioHqk3HWQ
 oVTIuVoXcpsmyl6xTKkH9J4rBDg5dtd0M1g+CLf7GJlsdPAAV0HZ6SvoFjazYEGKfzoV+nxHNrZ
 ZNyrmc71PmMAtie0X78yhmkZytvNQ5a2NV20O6aobZJyS0yDyFw21mQ1YvUOv9IOB7AnGCpHpVO
 b2mih37kJIwxxj3dw7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103443-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B7EE40F6B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the Sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device:

/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data

The sysfs read callback serves data directly from controller scoped storage
and protects access with the controller training data lock. The attribute
lifetime is tied to the controller device via devres, allowing the data to
remain readable after Sahara channel teardown and ensuring automatic
cleanup when controller device is removed.

Userspace flow:
1. For each controller device, userspace reads the ddr_training_data sysfs
   attribute.
2. If the read returns non-zero data, userspace persists it using a
   serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
3. On subsequent boots, the Sahara driver attempts to load this serial
   specific DDR training image before falling back to the default
   training image, restoring DDR calibration data and avoiding retraining.

Add ABI documentation for the DDR training data sysfs attribute exposed by
Sahara MHI driver.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 ++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 69 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 07bc743aa061dd2fa85638067d494562152474e3..fef5dc1d8884133397d204f23361584fd1d9b075 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,73 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_cntrl_training_data *ct;
+	size_t available;
+
+	ct = sahara_cntrl_training_get(dev);
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
@@ -1131,6 +1198,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1


