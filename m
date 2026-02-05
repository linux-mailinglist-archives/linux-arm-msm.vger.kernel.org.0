Return-Path: <linux-arm-msm+bounces-91960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHinFuHRhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:22:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C91A8F5D9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D65F73048B23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C0330C62E;
	Thu,  5 Feb 2026 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KglyyFKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvKws7ZK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C92D8390
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311847; cv=none; b=l4IKNDnNP4XiB3vzSU/YJpcMwhTh91RCdc53d3BuFRAuzfrVqriFOoqVnWhrLevp7Ub9eKGwXCziIj8xdtAtakT6lkoAv8NXwmWgsdLY68WLdFJib3G8ayaqzHl1rFnKQGuLC4/3UW2t1ZjvANnuQdpjnAtBSn2cFx8Jhh9QMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311847; c=relaxed/simple;
	bh=PdSzz0bj4RkAm9gUU9i1xAXXLdjyg5Gspl8Tfkihp6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRrTKY6W2YWICrMWxkcX4an2EFexkv4Ge11zxMkHczcpHzhIT206V4GBsCrHTqgQortWL+TyfBUAnQVQlnSJwqpz77tYSnfaC3wH412T5uAZlanVZej7LBOIGR+UhHx/VhjkQ4wPJNrjruKTqcIrUy2o7jXfMLNRRirm/Mg+U8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KglyyFKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvKws7ZK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BljbD4135954
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHUkWHA7HOd0fTIofvIxhQ4B2OX1P9ypBZz5EM2pVT4=; b=KglyyFKVYVqEmoln
	pBjoyIchtGMRXQdHKAemD3msQ1KLD/ovTxbbzH4FxAKOpYP88QhQPeb1WkNdvcVu
	UATZymUN1YJczFGPoydbahb8uj17LlJ/8Vz2cgBYnhpqYtSE5TShiwbVS+FugD33
	Cw6Y7ocp++DraE0Xm/9ZD31nmn0F0V0xROROR6epQp4QaMuVn/SoMfX9L8ctL5fL
	RGiWIrhK/3L/eoybY2DfOMZfZtRhs1Bwg8z42AExWlYPMLGgFyEXZqkyJmyiQ+fg
	/Kt/wmsGincKeSjE8p4ex3pjJHEPlBNVSC7z2SGlThGBNc2htWlAsF8SLbLwh9Ti
	IAbRBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tn413h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:17:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8fc061ce1so32660505ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311846; x=1770916646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHUkWHA7HOd0fTIofvIxhQ4B2OX1P9ypBZz5EM2pVT4=;
        b=jvKws7ZK6xKdmkZEQDaitHvkgaj97jfw62Y9QM5w76I65mf0L/yMfizNTXnp3QvLv8
         DafMgNcAraQqccZ4plRbhw92KK78O7z4QRw7tcqXSBWHmkhNu5kADlUUZR4ZVlZ6ZcgN
         sj1fXm48qGORNbDTcnm6LyysOh0uRuSIMMCeFIioICO9ckYO73iUSBG+XCJ5MgXKtETR
         UBKwmoAWMMTWF68kNsj6YNXxEzfpl0T27lfbPB7KVTEwTelQ16FjldiI4N+oS5SaJZw7
         iowdE7LvkbiTqpy0H4Luq7LJfKXBi0dsP6FfoVPekQakr0rWoIWFXx3ct2u8E6n4wDng
         SAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311846; x=1770916646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oHUkWHA7HOd0fTIofvIxhQ4B2OX1P9ypBZz5EM2pVT4=;
        b=k2UQr+yIktF2C1HTyV7nv5MTx8zbigwKvgONKvsKh2ZGBo1nGSiXIbwbdBe5ZHN9gq
         Hjwq97hiGAz83hmv6SUCZaH9AhrQO9i1CaXHG6RlF2hYXvPdj8eR3uMNmfhK5j1aOKYq
         SGtagdhCbJxGboz8zwKXpO2qOlo4bEarNh2dAJjsx5MeU4mKemXH43oZ+ishi8jnRjk3
         1DMUftL9nMbdj3fj40EbalV7pApFMKhGWmCPXilSUP/Kecfji7ZVerYPiSojveMsttFU
         SJz5rkGpB2kGOq5x0Adkz42HMnIRNwuBxlW4NvmfYajzI1BWqIx+4JbEykvGkE3OawMN
         7aew==
X-Forwarded-Encrypted: i=1; AJvYcCXaii+wEheMDgaF8tlbMX3/PP+B/oGqQ+3j1vmWEocOWDOF0PI3axXd6yDgbnlZQAZZh8YfiD4NKNtjwTJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKBInhktWcXXjYVsftNPpJx0/a8MPhEIjT1ZMmlfdlt0ANbD4
	+FuSySGIG5THI4+pO/CR1ET0dtgRDi/FYYQi7wqvgqtlLAcSFC4VaUEUqErKVfSDj+zQgxO34E4
	sobmXJ1A92XpG2YkUCjvzrlTYyvHubRC/WZBjj3Q8Rt2qbNgETo/9SrPNlFlLTYeRf08P
X-Gm-Gg: AZuq6aKNeyywPmjMtALtenTX7KGHyhgi6EQ8s7VL7gKUZfA/VvC6lelJ9gTndIFkvbO
	vzZcqEehHD0YwxriN2kPVfW8tXgFkJDW6j48E8CK7lrlGrUgjY8lMrttJIOxkl/nvx3FQLWCIVi
	WZLyRxsYKXzVLNTyGjjToOwazTztjTJ8L1Tzp/Qv+4htH0Zhn5I5ZJwfsQkfr0wv4VRZSXU1S2E
	mWqp1ZXS0KsEYdZ6uqz2axGV+pnYQ6MAKk+K/cls8Oeg5Auvkr2hb3ikX1X4+OLnqPSSxiSiJo6
	esa+aBOED3yBIkTxtT82KqJUj+p3gwQJptKzXhaT1UZNM2jTj6OHu38jrSGi4OQ3FAsKtuwq0HP
	XIF/qUtm2L3mqYMdZFZRpUj30AhJuYwwH9BiE24j1g5xIeA==
X-Received: by 2002:a17:903:8c3:b0:2a7:7c72:42b6 with SMTP id d9443c01a7336-2a95162538amr100075ad.18.1770311846255;
        Thu, 05 Feb 2026 09:17:26 -0800 (PST)
X-Received: by 2002:a17:903:8c3:b0:2a7:7c72:42b6 with SMTP id d9443c01a7336-2a95162538amr99805ad.18.1770311845752;
        Thu, 05 Feb 2026 09:17:25 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933966f12sm55059415ad.76.2026.02.05.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:17:25 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 05 Feb 2026 22:47:13 +0530
Subject: [PATCH v23 1/2] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-next-15nov_expose_sysfs-v23-1-b0c5bdcc9f94@oss.qualcomm.com>
References: <20260205-next-15nov_expose_sysfs-v23-0-b0c5bdcc9f94@oss.qualcomm.com>
In-Reply-To: <20260205-next-15nov_expose_sysfs-v23-0-b0c5bdcc9f94@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770311838; l=2327;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PdSzz0bj4RkAm9gUU9i1xAXXLdjyg5Gspl8Tfkihp6c=;
 b=KE4P3jBLhT5sMnwR5f5AIEdie8k6/O3aU5yDalttV/ckA3l1/TysQCT+6B29nBWldXpPHcaGQ
 XWJLe6CAyXYD6I3SglZn1D6GjYgcUJRMalFHqrEaLIsPSCjoHKU7tU2
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: YL8TbRMLKgl6myqhehaae9nh3-LJoHha
X-Proofpoint-ORIG-GUID: YL8TbRMLKgl6myqhehaae9nh3-LJoHha
X-Authority-Analysis: v=2.4 cv=Dfgaa/tW c=1 sm=1 tr=0 ts=6984d0a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=LKyF0dicRlewKW4vAhwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMSBTYWx0ZWRfX3VBQAVMkIrTK
 i4Mb+C3N0Yvcciws+sB2XifkroU6AqpHOLiJDEF4906u2wN6P2gIIb5MI0SD9K2F8olVKNtzidJ
 PF5/BVfHAN9K7CdaU+VnAzPD0lNdpH9R6b59CRlP33BNewG3Uek0MX9wvA2irdC482aCjBh2HE+
 lt0nVKileaWdV49v6Mfb0AzU9VLaekf+SZ8DHOnqcPvS02zig3H+zePeX/APINYy9B6bg5fphk8
 W9TTdYDrmUSh+3mAkMYu5cWPo+Lpfcqk1LkvUBNSN3DuPI8yosN953s6NRKrYFj1754+AMULnzV
 mrAl4B6MUhybIdrK9cp6Uc0QYtQhtZwm3+0cXC+MZCdNlCAYCTCxg8Y08A/yQE4IKHRp4upY7GE
 rgVrvZc6jjEogM1bEhR86lv62d00hE+1sWiECShTGwauRskNx1r3ihqXuHLVnIjGA/DoriqDG2Y
 0+gC/okLqEQv7Dk9xgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91960-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C91A8F5D9E
X-Rspamd-Action: no action

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes, a
read-only sysfs attribute exposing the list of supported reboot-mode
arguments. This file is created by reboot-mode framework and provides a
user-readable interface to query available reboot-mode arguments.

Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..a16c54ab841bb4687d3844ac5dd4abf6b37326e1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,36 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		March 2026(TBD)
+KernelVersion:	TBD
+Contact:	linux-pm@vger.kernel.org
+		Description:
+		This interface exposes the reboot-mode arguments
+		registered with the reboot-mode framework. It is
+		a read-only interface and provides a space
+		separated list of reboot-mode arguments supported
+		on the current platform.
+		Example:
+		 recovery fastboot bootloader
+
+		The exact sysfs path may vary depending on the
+		name of the driver that registers the arguments.
+		Example:
+		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/qcom-pon/reboot_modes
+
+		The supported arguments can be used by userspace to
+		invoke device reset using the standard reboot() system
+		call interface, with the "argument" as string to "*arg"
+		parameter along with LINUX_REBOOT_CMD_RESTART2.
+
+		A driver can expose the supported arguments by
+		registering them with the reboot-mode framework
+		using the property names that follow the
+		mode-<argument> format.
+		Example:
+		 mode-bootloader, mode-recovery.
+
+		This attribute is useful for scripts or initramfs
+		logic that need to programmatically determine
+		which reboot-mode arguments are valid before
+		triggering a reboot.

-- 
2.34.1


