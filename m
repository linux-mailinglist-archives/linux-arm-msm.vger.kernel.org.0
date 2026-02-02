Return-Path: <linux-arm-msm+bounces-91430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MzGJ79TgGkd6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:35:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A9C9314
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1C9630056D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3822877FE;
	Mon,  2 Feb 2026 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NV796G2W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfP5lUpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D0212548
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770017612; cv=none; b=odFJjBAe+HM9MO9YuNZe6aB9fAre7l44e9UHz1K5ECI0n6o90suhni9Bnl8UYwXZCNrCDza5gs/A6QZ0VLwPVZpXl3T9ZKLcXI6qHDxhjEKQI6PGYFtrtufDALWoWnUb+1gKvmcBJB5X6LrZeYj4PQV0TZuqqOoe27B/3D6WExk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770017612; c=relaxed/simple;
	bh=+wneqpHrH/TNq9lRs5i9oiuTpQ4P5Xi7INyfogQXS9c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WVa9OjVqgDEhYE1M++7h7AVxSSIfRfgvQJku2Q/vTAGxPPheDHiLrGiWqUAfbrGr04+QiEfh/4hQqlSW2HhxyLWcBOSDHHaXWyknD7JbLfskaMjQupXamcNYwLnEYHWIwS7YuMP/mpQS8/DXFmcD7HxCtsX5ZSDRfu9ZAqU8WqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NV796G2W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfP5lUpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NuUmq733449
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yXdntplLKF7U4FV3mgbK5Q5DtyvnneIEhh1
	dZ2ooHEE=; b=NV796G2WBG/xOJrwJn/XNGE/wT5P6XBWufo5yvZMhksRxNMuWQP
	rngH1HAldJMxUtLqs9iHzI7hOwL/dHiTtyjFlI4kse+MxG1fxgy2KIoex2JT4hN0
	B9sQcdLaIj0HPtPhBm7iVWHlWCXde0HB5HUlUFHvd/33NtnHe/vOqHlMTHpm2RS8
	NQg5rL183qP8yu+CXe4j7DDfIlKNNzJJKorxj5UdAPyx4jL0SvcMOZ60UMvlslP6
	E1KEaecOrMrVgQrBczBZ1S6oh/T06OhPmUEjT8ZD6rtx3M0ITOF4ysqA30PD0uUT
	cWealD4avjJzSXDEznql03lrUKQNNMaUqIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1b17vd03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:33:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3545b891dd1so3532662a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770017610; x=1770622410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXdntplLKF7U4FV3mgbK5Q5DtyvnneIEhh1dZ2ooHEE=;
        b=KfP5lUpSjr0Ce331G7zfK6FqAKJqMeo7K9uuMQyjOetNU3kVBaY6vYMRtMzTN+5fZG
         N5dbiouMMlvGgnKmyRzPn7RnIA7Qjdjoj4hQv9zqs/QEa1odeqb8hN4PP78h9dbwbHjz
         oN8Bbs0N3sFuRXeA6iztqqVKAWyFH2HmcZaa6dzN4X9T/ChXO61WvYUWLtY+b7oLWaFm
         zKZ5YsGJrKITLXuWLB3smfICXS9pH2rzzPWtDahW/vZqdTcBo7Bl2WW8fWsKLNgcr6NB
         lFwt5xVabbeuyc0u6AMtcSFaHhCsRyC0y9IX6Fh3iZteW0lV4foU1hG3rdn8NWm5/Xhp
         0TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017610; x=1770622410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXdntplLKF7U4FV3mgbK5Q5DtyvnneIEhh1dZ2ooHEE=;
        b=K0JRekq6KJGCdidxgylfFNa9wxGwfUwADeIrbNPpZRyoD0GKrR5GEWbSw5FKzfyPDu
         duzaddq2SiKsyl9zZNfm40P0yga7dynxUHjiMFyCe2gRL2xzthOLtsccvN9zzfZ0mEm6
         RkPZpi/6yE506D1md0CNQ1d2H1okBaXemXM56Kx1qE/yKM0pooXL/mMi8BwGXd2mNsct
         KjhZ49oJNwQp00gjZ/MlHMwuCUcupPwiIskajWqT/e+DGJwIcpHGGHTt5VKhQFnE+cXL
         iR0ulE/D8BF+HvL9M0uA4Jp5P6SZqWAp5ZI/geNnFg3y2FiX/wx2MPEP7jMK8TTcTgf5
         jFiw==
X-Forwarded-Encrypted: i=1; AJvYcCUrPizgoiojFysJzbj8qRd8qp8MiYg9pf2i2aiRfLq2Mbn6fhm0M8kwdCN8zY9ngp+Rskn45gWdSFYKAsd8@vger.kernel.org
X-Gm-Message-State: AOJu0YwyJq3dNUgCBbrZXnW0AvN5CxxYMbjEyNALu4SnU8zrdMU0xZzw
	AsN881bXxO+cQjGSHAVSH7i7DpWLpnTsj0ffRxy0IYEp5shAyi1oL6wk4JRn55qbWrTa/EEpTa5
	56EAx+ey0yw0yhjh/T4rcY/2ehH47YKEnQthp3+xyV9MPaoShxw0RmQXp/1G7qm246lV2
X-Gm-Gg: AZuq6aIwbVPIetdUe+Y9olnT1a+rOq94cDgX02UgSnACCywxXh0gH/tticvRMBj5fl2
	z2nMMJ85XwgJQXqQ9QHqW+elqP4Z1/kyaBPWXwM74l56XKB478aU5XeAxdQI1upgitwkqdFT2R1
	bAuTj7f0BRbDLf/XwGJjOt0E3PzaoIv4gzEpjHYi0gthVznS9MY2kfBTefltYjJ12UYNFOO40s7
	b2ebAbKDHIyVgV6z/YdVV51sPY5SCKxsXKXjtHWNbAgy0PLA9TcjhpBJXWLknSLx+5pfwaDqlY6
	WcH+FEJWaNOJXQwv+Vu2p7UV21fW2b2xxsdWqYYRgD5Czc2YB1ZZEMScxl7PFLWTw55QvSDSwr5
	Xd3HSZPhsBmYeMFw8Bmb5vHwrikkRzCXRdCer83UjGkAbKoLyNhrSgowegM01GEmLkzpu/QFVaX
	YGuMk4tElKGuM0lCXAkyTtNomolJKLiaG4oNonTCo=
X-Received: by 2002:a17:90b:2fc5:b0:33b:b020:597a with SMTP id 98e67ed59e1d1-3543b185498mr9468518a91.0.1770017610350;
        Sun, 01 Feb 2026 23:33:30 -0800 (PST)
X-Received: by 2002:a17:90b:2fc5:b0:33b:b020:597a with SMTP id 98e67ed59e1d1-3543b185498mr9468490a91.0.1770017609732;
        Sun, 01 Feb 2026 23:33:29 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6103e25sm20758332a91.1.2026.02.01.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:33:29 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Enable IPQ9574 RDP433 eMMC variant
Date: Mon,  2 Feb 2026 13:03:18 +0530
Message-Id: <20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=6980534b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0U-vFLkCacPubaFtw1EA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: XQIJOZrMrxsPd9V7VH50kv3K3LJkFMNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MyBTYWx0ZWRfX1YiyVpLJmcOg
 1UBj5FKdxAqWpgeEqiX14SfNOUwKbqEQtd/hK9148mFQDcznSfzohUuwHR+xlqUJj/STOkzbCch
 dGHGD17iGV1+vAVZSNVmJYVxFR3Y0MVUvXYWqvN60S2TU/qsn5bztHvhL87xZxQaU4CLsJb9Im1
 G8BzC9Lx4e1ow4eLxcIot/HP77n6Gqkhvb66e9xLol7m5dsM2fe2OTWdpbS6+vd+FQzgw3yZr47
 SxuAVV8TUr1TKcbSdEnOR3SY1ldyl6LnxOJ8ojDIVOQOaMoFpaOgnX44A5bkAC6Cf++yvJOHNxP
 0zGqo4VarNFXIQaEavllcNrn36rwh0Edevt2i01YyB1/qSJE0Nr80t7zuw56bFWfqPAbidZsAmn
 KUOUQP2wrQIwpMupxzrJUoY40X83VTPhxyn8S0EYyzaws3JtkAzuAvCn/6ME+3HYbI1kw8f4j4v
 +gEGfPpyimlDLZzM6qA==
X-Proofpoint-GUID: XQIJOZrMrxsPd9V7VH50kv3K3LJkFMNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91430-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 427A9C9314
X-Rspamd-Action: no action

RDP433 can have NAND or eMMC based on a board level rework. Since the
same GPIOS are used for both the interfaces, only one of them can be
used. Add a new DTS file to disable NAND and enable eMMC.

v4: Move sdhc properties to SoC dtsi.
    Disable nand in ipq9574-rdp433-emmc.dts

v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where
    required.
    Add r-b tags
    https://lore.kernel.org/r/20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com

v2: Create two separate DTS files for the NAND and eMMC variants as
    suggested in the review.
    https://lore.kernel.org/linux-arm-msm/20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com/

v1: https://lore.kernel.org/linux-arm-msm/20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com/

Varadarajan Narayanan (4):
  arm64: dts: qcom: ipq9574: Add gpio details for eMMC
  arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC
    support
  dt-bindings: arm: qcom: Add IPQ9574 AL02-c7 eMMC variant
  arm64: dts: qcom: ipq9574: Enable eMMC variant

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +-
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     |  32 +++++
 .../boot/dts/qcom/ipq9574-rdp433-common.dtsi  | 121 ++++++++++++++++++
 .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     |  24 ++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 116 +----------------
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   9 ++
 7 files changed, 189 insertions(+), 116 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts


base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
-- 
2.34.1


