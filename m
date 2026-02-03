Return-Path: <linux-arm-msm+bounces-91616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOZRI2OugWn0IQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:14:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9730D610E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73292313D58F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0483939A7;
	Tue,  3 Feb 2026 08:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSJa+yC5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMjT4a0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B964518C33
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106128; cv=none; b=RW0fsNhhuGjKcX6PRNfxvVPoPsaJouryAGsTyUDU8SMww+2oJUHWBFUCHoUZxY4cpBYfM0J70W1rhX2YcYgadqGASZjC4zt5QHmvLRNIkoXGXKEITAn/7KdS3p9k65Fb2Rog+h1Azetr3EWNn6oYBYTeIoWOefspYyCLzcpHdLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106128; c=relaxed/simple;
	bh=VXVt7+WRwV9U4+KBIyvQ/YO2I0p5y3dPbOD4xY3JpCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PQNVvdO7ftpalghT09wr0ixqF1ppGbsfqhVUPT0ZqEjzB4uAEiKdHnhl0LiEWgW7DXg9w8hzgJk87zhJuASOcwYtLbvtIWZOpyNArpuDo06psihWAmjv5w1Y8OyTgTsQoENXFxCLVuR1Gc4n0+6WVTBWRcN3ltL390W2kuzJgg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSJa+yC5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMjT4a0q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61366HRm3459151
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 08:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xj75HyVx2rW+IuheiWaB55
	7dHSsiJDBomjHiklCYwbY=; b=kSJa+yC5QRc7cYKfF+4cXNWsjbt4QlS9BhFbtm
	9+5ZsdB1J9MR7PIGbUDyqnp23kIOPtjTedpGZxqy3i2L8iTU1kTFL5QfEn0Dg4sF
	U9W0rE2uyTK+3h0fSJcGGZpB5uHLtOzFVq1N9d1kccJp/MTSecBw8CTHMR9D8enR
	JcB0Se5zYDLhCbUbi8/kDxgNuFXzA3Gucjie85RAC9vUF4gcwvncfgHeJGSFmAKA
	aPYOArF66pJESl48A+mCNnqzHeViUYlCpAjgAW65vhW10qBy2ymU76iRWTvwXM5H
	qy9XW/G64vFMi6Hw8l+UvrMVWmJW4R5L/eI27/WVH0uPlRdw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbkeub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 08:08:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76f2d7744so52510985ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 00:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770106124; x=1770710924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xj75HyVx2rW+IuheiWaB557dHSsiJDBomjHiklCYwbY=;
        b=eMjT4a0qw1QqqBvPUbwElVxO9+adkEMvPdmSJRv8Xim9eSvmTc20I2bgsyw9SqH6aV
         /o1O09DOyVnJgcQ+kS1t1xmAxoc4w71k4H8dZwA5aqYkDm+3eiIW54nnZJ59VrKPr+2Q
         wAAiA1QqaOm+xjDTvaiKhJvIpeVmabgYYsbgkiaswpAdPCwt+pdFxNN0MJ5Mj9sKceSu
         OBd+pkUrnZlS5q05CLmO5YAHKglEshsC9oKuRiDasxqsh8+bYVsjqsqX9cfkWGVTT1M/
         b3PGtpnXRRzZ151N6J53n6H6DKj675JBKGxlEkx7nSuQ75ktqXHURUCJGAu5ldZMwG/j
         FRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106124; x=1770710924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj75HyVx2rW+IuheiWaB557dHSsiJDBomjHiklCYwbY=;
        b=np3oRkyrtokPvKiHwwGdwF5RpANfFZBfoqolUMlqoGkbRTC2CzjnOc0133+Z3L3bfG
         2VIAjia2Bs+CyjxOqC2gtKYHUnI2ZgsZ7ozQ5uce3jW2JxEJtcaGFyx1tLVHVCrc3Cpj
         5En2QQzc1PNaPyNBIyIq5Z4CGQKSaVvkTk4QOLo30/MaVAduBs6wszeHI6ffFcuTTDHI
         2WYvmAJt3umIygZkKHxe33UZY7kDC+ARK55yaDkPjl/HxCPyAL/cME8Y/q2KLVRfvwr9
         gUyr+8aMUqsGEKsgenJVOZaK+EqJnTg4ymg8Ni2l6uc+9+iMkuFuucyRg8orS4kmzcm6
         1KPg==
X-Forwarded-Encrypted: i=1; AJvYcCVhhQkIi76lzLKhjSlHlJQBTTvnmHIOAL/uxfP7icRD8jmRzXnSmYxGCo4XCVldYPkf7mUftYydfeBehFAf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz21ULplKLEcBm1Qnb0rhcfP3FW5e0Kzn2dt/W3purbHfIygGG
	hwCFUkmiQhQKHMA9hLdbhcFNQgPHpXDH7POaTtp0buQLPYkvesEZwvMuNGbvGpyTo6yAUhgdrqj
	D8pxfP/UGaFj1qy9qJMJKv1g4UjTVeoVx+x7wcZgYpAD7AGL0UKdwnGASvyNk035q1a15
X-Gm-Gg: AZuq6aLzq9xjFDTp19wTJnOCEStXxdQLNx/aKF5BAw0vSROvkB4zSsYMYVjwR1cpEbm
	Wr5eBPxfu/MfrC68QaLBsiT0bZ3LKOpX5hfnCTQkSOSKm2GshTGsGzYmHnPBsGH6U+lVbFTR4zi
	IEWmlHzT26Rw7BpS0B84aDm3sx0zJiHxvWzBBG/zdEf1aBdcZhz1paRo9KFbA/PEDfyx9Ik7ZiY
	3Bm+xcBJB7Bq6o7yOZJ6V3fpOWj9iRxzGhcedz1wxOb5DXDdS98VSV6CWTwqhHYqhCejh7YQfak
	BorFUtaHWdb6fpu7JKOJ1gPRcUwotbwyV/6NDBrnH8fQFmrJR810Xjy4xFUZDmZWhWPRDZdlBc6
	Fkk/t+3QImpzr5SJPSkRwLZlNMLMSVxeBcSohtQLrM5agoQ0XZQNAiJUdhPLhf0Y23/sW5sM/
X-Received: by 2002:a17:903:11c9:b0:2a0:afeb:fbbb with SMTP id d9443c01a7336-2a8d7eb5ab1mr146742345ad.1.1770106124488;
        Tue, 03 Feb 2026 00:08:44 -0800 (PST)
X-Received: by 2002:a17:903:11c9:b0:2a0:afeb:fbbb with SMTP id d9443c01a7336-2a8d7eb5ab1mr146741805ad.1.1770106123857;
        Tue, 03 Feb 2026 00:08:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8e512bc2asm103144485ad.100.2026.02.03.00.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:08:43 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
Date: Tue, 03 Feb 2026 16:08:23 +0800
Message-Id: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPmsgWkC/x3MQQqAIBBG4avErBtQg6iuEi1M/2ogLLQiiO6et
 PwW7z2UEAWJuuKhiEuSbCFDlwW5xYYZLD6bjDK1MqpiBDuuYHe4k23wjCNypacWrdeqaTzlco+
 Y5P6v/fC+H5SWBj9lAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770106119; l=1423;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=VXVt7+WRwV9U4+KBIyvQ/YO2I0p5y3dPbOD4xY3JpCc=;
 b=Aay4DUF4/BV07tWHTYfxRXp7lipM3sImRVggUGuyEoEqNxFi/BSdipDwz7phPOnrZ+fN8iJUp
 I7vg+jtXwDoBTl6GFB16amcORXHeQgkxha7hBgpORaGNSp5wCbuzxvt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: JLHygEffNl4pEWLQSJwrjb5J_gDcbc_N
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6981ad0d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pO0fZtIvyn0UN2_VQdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: JLHygEffNl4pEWLQSJwrjb5J_gDcbc_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2NCBTYWx0ZWRfX8AE+sbMl3l3d
 a6uUhBdUw210tqXIcNG15v/Ipk2bMknfeWFMiXIpcf0k7k9q2F/1fg7hoCQdDXCEi07acguIrJa
 dXZ7mZoOTO/4eP7GNeu8T1pt7Te4NgGgwUNexSvXRSyEgK82cmonfYmdpMwZo/mQdZo/cmC1YCv
 hpm5IpHdsVzyTIedB4GHfUI47cKC9JzwhZ29hb6zvRsNNvGQNzNPjYkC3UcX+sJUm91IHwFKu8g
 yTmXu/g7J6irENZ1/PJ9JooXwKfc59DncKecYrvfvSvOWMvtgoHrpcZ/OPyuyjpwy62vuMwBb9O
 OIPDDXEJMbbGz+KgfIraa4CFWfJ7qlgVy5yJ+0DagRLRmijAizTJ6OqLFSVqRIDkrUzW+Gs/e1A
 dojujFY1KImmHGvHCqgNEJXgxsBJLNrq/T6rsYZvhOhmLZWArsul3FrrrRISLZMFwb5I2MDiAq8
 pJqwrd9yfXYTBulHiqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91616-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9730D610E
X-Rspamd-Action: no action

The DT‑binding patch adds platform‑specific compatibles for the
CTCU device, and the following Qualcomm platforms are included:
Kaanapali
Pakala(sm8750)
Hamoa
Glymur

Since the base Coresight DT patches for the Kaanapali and Glymur
platforms have not yet been applied, I created DT patches only
for the Pakala and Hamoa platforms. I will submit the Kaanapali
and Glymur patches once their corresponding base Coresight DT patches
are merged.

The Hamoa‑related patches were posted in a separate email, and I
have included them in the current patch series.

Link to the previous Hamoa patch series:
https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (3):
      dt-binding: document QCOM platforms for CTCU device
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      arm64: dts: qcom: pakala: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++++++++++++
 3 files changed, 340 insertions(+), 1 deletion(-)
---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


