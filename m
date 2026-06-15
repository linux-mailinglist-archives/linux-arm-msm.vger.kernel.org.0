Return-Path: <linux-arm-msm+bounces-113138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GaeIFRfDL2pfGAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:17:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93848684F99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:17:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YYdGFnq2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QxYFfgyf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113138-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113138-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C04F3019517
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906DC3C4B63;
	Mon, 15 Jun 2026 09:12:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F018D3C4149
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:12:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514777; cv=none; b=QtkfY9nInJLqYLn9GjyJp57gzKhhrZ33ThaKiNCQSGeuQBEEaRdpIQZAGoPWo+ROb5326yztyXeH/qFh/cvDZjizlvTu2NynPb8krhagDI6NSE3kDyfAHUzXDbbF95ivJ4Dlbd7r0rZlfpwzGfyhddo+WlEOb6FdU7r06PIyOvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514777; c=relaxed/simple;
	bh=BdCJi1Rg2mcMW+kq/5v3D330ZxIanUdz6zLDDIpa908=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VWILlhf0LvUpxO0KZmGoFf6wq/zWSLVX7yQsCkOWX8YcPOVlmInksdxPMnkfMSqTkpUWWk42MNStEOo9HknLNjrMejbmAwL9O2kcDsDpnSMc1QGeUJMH5EBA5O/BU1PE+HWJSmNxpP5HfHBWad64mFcVZOc6RRHh791Cceo1MyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYdGFnq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QxYFfgyf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6K9HW3692439
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PfJKg8Yakt8VpLjLlx9CcAmkKLgOzxTG617
	/8JeNaAk=; b=YYdGFnq26kH5QqyU8bjvqxWiQ+kGldvSHy9V8u+L3iGduUfgIeS
	oiCdcwF0BOTjTWZN2SHu2iThVTpeMVHFk6nnsqr2vWPETQEsE6V+3g7XWarBY86h
	n31Fl6TiQ4aRr2IQlXqPWqdbBFaMq9LFlKhZqsBqdOeNjbuiveGNydolP4KDy2QR
	XrOfGUd8esgJmES+sN3ab+qoCXpLl0TaVShhPYmVQp8F5uGfSWESSH76tu0THOxs
	wYYMfPv6bd62zcX1+4CYq49kYmU1GDKTtxspkFGtt1hDj3EWiM33QejDxTt4G6c4
	AX0ch0KFeFCxX/JNGw+jgiD+YBJswfCgyhA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6ehh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:12:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf243973c2so22534275ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781514772; x=1782119572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PfJKg8Yakt8VpLjLlx9CcAmkKLgOzxTG617/8JeNaAk=;
        b=QxYFfgyfA1p6vOfz4o8BNGS/ESqC33nstYQP4vEU7Gyk21/Dw/HuVnvpzpc4cRVnhK
         nBKES384le1uhw7cGnjIHeRd09yUlOh0AfbDxCjWmb2wpdb6R4nNd1bkevzUzkDIrNhV
         K9p16OiC6muIZei8Rmq3dRz0SJE3DPEu2wynuuvy7Jql+IAdsvtAwK1PvD0uLJiN1zZq
         fH0jqBB5UYo48tWRhsHNz+4XSkwczFF6o7etDLZCNRQpe0j/0MOax50BrHxLP4aXYPen
         wJQJZZMz+1XKILzTMXzW8dNJEipO3HmxYsjg2rlrzI4b2bbYg9iRgDnscJilNuOMeoi3
         RSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514772; x=1782119572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfJKg8Yakt8VpLjLlx9CcAmkKLgOzxTG617/8JeNaAk=;
        b=o5eN7RvpLs0CHqv25GQVTholXO79mndYXyoEnxdbCyhyZNN9WkRYnwc5FjjkmJiwbD
         2H9EeQvBXSmvP5ZoiFLJOMOk5ODCVlGGDHeLtH5Tv2+ryVUNiwJ9XjhULqH4SjtlTpa+
         N33FYJrUiR2HvMVWIkvxL1gWf4vm3CQ2zOdzqJ4nhhhffGUiL5fSNw+s/O2GkhePKkBe
         bwsmNcHnwiHS+8tKfQhgdKqXIwjtBwC92jlgqTJvgdohgKqRo6vvDYcNOBXI/s12NlT/
         l9PB/J3F3xK2xuZpavur6LEEcDBeKri8zm452ZxUBAF3ZsI8a2THtzEQop97eiCE7DHc
         o7iw==
X-Gm-Message-State: AOJu0YzoKAySGS1rnbrao24lYSje5loOP7AnzURoZwUmy5ZYEKRMAfUY
	PuREaFLdhTys/ohZpaefZSXZKgpPJebZu6sCnOYhgAPeM4lxycJyVVyVJfddqraUavRSFuhMjPQ
	haUJoaNpx2XATkFvmpwylYpBRxL0/wvx2Jmq77fIraeKUV4IT6b3BrDQUZooOj0DM+y5+
X-Gm-Gg: Acq92OEUcx+M9eMjudYJmlBAXMW3KJg8mCJ+fpyx5z/XkWrjeC9lEDWWIfeIswJC4rL
	sCgEtC0NFHKwIah/fTIT0NggvTWacFPteRMstSmdiX3IX5DlxpMfpQ2bDknq34zF8edcm2MOOTk
	5vHxA6mf2QGHuHwdxVBTLkDu9eeO5tT7pOIzPgd4BtRBaGQ5YaWCg1ZkZ2LBo8TSvV2MfjBWl3D
	vdRI6udjFPBhKDfKd7fK/iK20dofjmT2Wjtzk/uJsHMCrCl0PXggasTJ3axiz0awRWsjS5UkHsU
	TXXHV+4a36qEiIRY86ogTSq1Ne8gLJ6wCANyCAcspO+dUoxQTavVPCbPtPI/oCxFnYGzTxbqOqz
	mdzfQpOIpR+RNm26hn7I1i5xWwe5H5KKjzhhKzdHdkb+gwxDkCWTaWA==
X-Received: by 2002:a17:902:e808:b0:2bf:281c:d2d3 with SMTP id d9443c01a7336-2c4104137c6mr147565545ad.9.1781514771827;
        Mon, 15 Jun 2026 02:12:51 -0700 (PDT)
X-Received: by 2002:a17:902:e808:b0:2bf:281c:d2d3 with SMTP id d9443c01a7336-2c4104137c6mr147564875ad.9.1781514771145;
        Mon, 15 Jun 2026 02:12:51 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433079999sm91669065ad.66.2026.06.15.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:12:50 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add Hawi UFS PHY and Controller support
Date: Mon, 15 Jun 2026 14:42:40 +0530
Message-Id: <20260615091242.1617492-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX8lEXGZDOcU9q
 80RanbBAmSSnajMYAuB+I73LFJ/50krbM/vMz8KiBbGamrzNUjt+aVzTsOGz/ypbAMwVFszye0D
 nmpqkSi77xyIUKbJ2zdiy7qHWZAjvoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX4emeKtRWF60+
 bKziYg3Q6itT++UlfmYl0R2dnvfPKaUDHKJrrfd1HH2pH0nYK0zsgdqhqWjCXzGr/kwU4YxJsX3
 PoUuiRlXh0ntdFclB0bqLGOD4HEgsm8b4IAXE2NJ7mBcHVj6htMtZtLwCMJLg0NqT88DX69daMu
 9nysI2dL+TYUsbXWCANADPi8M/0p6n4vyGnIS/KiK98Cm4+NzpSyShCBMleS3VRhy9ZBvqZJqnX
 R+EXdLAV2yIaTwjRH5riS6UPfrhqnKKArDwNMSDXDWXL8ZVatY1tzRmV7IqTNTwZTNVh7ATWfgG
 H3Scn7q+oZ3mElOgwi6xTvTyEOiGZPbemUXnmmeLrBgJam0FzRuwxJLRNozfvvaLroREWnogXil
 mXRYJNuuEIMRFd+3+YorDJ6qVnjd1VjcQz57+MYGJTUcMUMqWNIoT2UXRXvpyrHLNEsnjGB2xd2
 LajWWnFju+NNprFPU/w==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fc214 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: i7d-4HcF-q4Dxg_TErudctENG6STC-mb
X-Proofpoint-ORIG-GUID: i7d-4HcF-q4Dxg_TErudctENG6STC-mb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113138-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:palash.kambar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93848684F99

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

---
changes from V1
1) Addressed Dmitry's comments to fix versioning for PCS and qserdes.
2) Addressed Mani's comments and fixed missed compatible string and
   binding name correction.

changes from V2
1) Addressed Dmitry's comments to remove whitespace and stray line.

changes from V3:
1) Addressed Vinod's comment on missing macros.
2) Binding patch for UFS controller has been merged, so removed here.

Palash Kambar (2):
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v8.h    |  13 +-
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
 5 files changed, 214 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1


