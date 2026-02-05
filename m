Return-Path: <linux-arm-msm+bounces-91886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MRrDwFjhGkK2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:29:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5966F0C28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48B56302BBA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AAE38F944;
	Thu,  5 Feb 2026 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mH7Cnn7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Edj+BRSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B313557EC
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283267; cv=none; b=DQxcn7SAp0RZc/UzXQQpPaM2HVKpbFoeP94rUL0kfA7sCtQ7ademxBqZrMfu1J578y5wLcn7K3pkXZYF2dcYXoN0VoCGUGEJQswObvuslkgUbUW0NSP6gwBSeMjxkI1cYMw5bQSgge1QoQSQITH3FfvkS5Qt1zrqW3QXaLH98K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283267; c=relaxed/simple;
	bh=BAGNHV5HIzxi7nY+JZgjxfOW0BYdFJuFGDt/iD7FpYo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TfKQpsF4Ugec0n3NMstJZW0HAYgJW2vC6GRN9JhuYywCdvOWD0ZKTMZ7+x8kitxQPBtXARCcHNDk4O7oTRa7PYNTNs+2VXlFTXWkVLbuBRDy0NuAqvQrfYKWQ04TomH9/bk7gc+0FMgCjYdE76WI62l3h5txQTv07YVSKljkkSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mH7Cnn7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Edj+BRSG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6157Meu9890243
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1tM1o1A2UK19+9JpxFn7xu
	q4+YgsH22MM9B77HjwXX0=; b=mH7Cnn7crDAE1O6nnOLI57Gt/7sk5blYH8hmln
	yKmfjbSHxfwtMshlYLYR0sSjsOs2scKMbXuonC/X+nnvkR2v45/ar2+PhctNgeLZ
	egkB+g1MC1AypSLN8Hif1ZL1KyV4HYMAh7qGKoF6tQXhOtZDuRKiz+bm61eP7zZ/
	q+4NJCSi1ZMS93rPfJ2QLO0Ui8xc0Ji5Tln9QxgMn5fSixcBX0g/23gSBwNiSXTH
	yDspBOTCv92EyX3yTSzsjkJlcuUlB0kTPRsPKzcMSlGZER3P2DRkcleI59M9rJR6
	d6pEJehbCxQ0rVvHoOsPlbJ8AY5O3rVZMDJGCm9cI6TLoQFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx8cc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:21:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6ad709d8fso196598085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770283265; x=1770888065; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1tM1o1A2UK19+9JpxFn7xuq4+YgsH22MM9B77HjwXX0=;
        b=Edj+BRSGqiGd2i/kYqLRES5rvalgrT4pIqFTRNVB0uxhcTJXjfJw9vLhB9DsH2iGxg
         v6CC2P9v5cnDE2ohBBrD0N8y4J3J6rkRlUxR6YH7Ju9J78Egy8rTLf7znLtgNmbZp7/r
         Ya1maqujE3jOAKdb5j/8xkh9Tfiti7cg8nfBvoRzyXcUgin+wz/JxYAAq5ErDL6dhiRS
         KzYb1hZh4LoOTAelpHM7xFjjFf9j1VOhuphozT9CMuSh/gX76eYjKQKGuLXZfFJVwyQY
         pdgFPgqlmDjjexMg43ubOcs5yyR+us+a8gzOAeZHT0l5qOEmXZXEW3SPPx3+MFidY4TJ
         CzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283265; x=1770888065;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tM1o1A2UK19+9JpxFn7xuq4+YgsH22MM9B77HjwXX0=;
        b=jKLAqZbbbwDt6EPZO6xPpZBRt96V1685F2YQrZwFyDRGpN2Z2ZF6HJ7Kl4YMwVpGSK
         HIUi+zsKF7YFqJe47f8fUfdz7Wqg9zrTYw1KFseYXp/E05gf8NrObmvAcIy18B8OFbnF
         rG37vVMPeDGITr54OQR2Ajxh/CYHwK74F6wzjcyppueEOsMD1KzFk7lIC1o+mEYXlmVy
         OqU9ihrrycorkvtuTa2GtAPIbN6X2rAPVb5vY0+DuXsyTVZ0nTd+cWG7WwgdG3t1yqab
         UwBXC0VFcG9oW0c5JVMK9TX204VZBmO12go/1hduRu02B47acCPzDHK/iVQV5Z3pqtK6
         +aKw==
X-Gm-Message-State: AOJu0YyY76E5cfSTKpw+8MPekklTp0zqcmxLpwwQxtEhrwigVarLvJtz
	UbHbtvudAoEcESBUGj2jSdwd7jTupzCe3jKeYEz8tIOFqpvqv8gF/JVbhX4RvJNeL+8FLNzi4jx
	GhuwNHRX+2UhGptBTfmr4HfF+YdEjnkxu1Qv3NBKk+sj2PNXVl+tdOuR3gOahIl7B8qnj
X-Gm-Gg: AZuq6aL1DDL9bwAUwzPl9AL2kFDRt1dMLoxdKdaY/bvuH7ppYzbSURpNzUM3t81FQS+
	SdkXb8n1Q95tolkhXkH3LJXq4jmcAfzORVOoFBMnIgZuca4lNdI7Ny8LwOfSSAlCJcKavqd07pi
	fX2KP2tmXddspyE4BsxoblCZjPcFAjSfv+pE54rO3mpf46MP+pd9re8SBW4H7jJUZdB8Ise7TG5
	E9YLbtRRzHpDD5cNgZmrxuqjOJa/V3beJ4eNwZPtLgtZ6JwTyrqtyxNhx9Xg9CrhRInMmNODLGy
	uPfIx7TmcioqolPK4N3dlwN+ItwJLEQjvmVlX3LnoEv9JUFn4TPDCx6TG6h9l69Gams+db0x7Qb
	/UKxpWD7KJgSP3d7bYClcSdNjY7k4+0AMso89VuMMaNjlCIHr9xQb+QwnExT2bmHndeGWZFE=
X-Received: by 2002:a05:620a:4448:b0:8c7:1181:779f with SMTP id af79cd13be357-8ca40c4b43bmr273265585a.35.1770283265154;
        Thu, 05 Feb 2026 01:21:05 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:8c7:1181:779f with SMTP id af79cd13be357-8ca40c4b43bmr273263585a.35.1770283264731;
        Thu, 05 Feb 2026 01:21:04 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd2c3easm353674885a.32.2026.02.05.01.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:21:04 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH 0/3] phy: qcom: edp: Add DP/eDP switch for phys
Date: Thu, 05 Feb 2026 17:20:52 +0800
Message-Id: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPRghGkC/yXMywqDMBCF4VeRWTcwMYmir1KkxJmxZuGliZYW8
 d0b6vI7HP4DksQgCdrigCjvkMIyZ+hbATT6+SkqcDaUWFZYolPC62Mdv0oLeSOMtSWE/F6jDOH
 zL927y1Feew5u1wi9T6JomaawtcVAVhpNlWkI/dAYrgwZdj2hiHVOO+baofXQnecPciTKv6UAA
 AA=
X-Change-ID: 20260205-edp_phy-1eca3ed074c0
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770283262; l=1226;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=BAGNHV5HIzxi7nY+JZgjxfOW0BYdFJuFGDt/iD7FpYo=;
 b=3kjemvmqUlE9LbxjoBd4T7O75tGCggnRDPRO6csNoYeMbeoqbYj6bhpUDQFnWxpGI25/UcdGy
 9KHvurf5/MaAxPZXUqIEb/MY0QX10U4CiuNsIdWmTqobpQo7+rA+a9S
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: uZFnP6QYuiZBHv71mfsWzI-Jx1sXBSJW
X-Proofpoint-ORIG-GUID: uZFnP6QYuiZBHv71mfsWzI-Jx1sXBSJW
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=69846102 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=M-2OMZX0rM6BGFiE4MwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NyBTYWx0ZWRfX3pTTVwbBnRJN
 Cgsaywu2Abfr86VSri1suQ19/fcUpL2P/4UJs1XZ57mh/n70EU2OB2Oxv1qmITEkojyjxs2Gs6Q
 ajf3HKZDVx7uVnN3tgbtfrlTb400Zna62nmvz2263mV81miF8JvY1Y0yGp2LiZMbu/6w4S13kWL
 K8WbEUUg7TkHBB9nF3HzmXCo6LJSPYcnzx9htUTVgtDf95/pcm7i6+DeQ54O5M9YGHJUt2gyrwL
 Pk5w3idWpu1n5ImV3RmLbRtNhUkL7OlS7JzsRNaHSlaEGTOcFvt44nEBfmJA6frvWnLB6eeCCOQ
 R2a/Bx6Har1uG9ZJv31uTgYVGSe+anHf8Bmh6UEhSD98/ncto07zRKCJ3ebzZEfWfaaM/tiOpEm
 rfgXd+43Z8igeFgLkD7Au/GCmMHM+akjqgG08jmaUyyO6I5JFHucxRWdQP2uHYvRxGmuKgay39u
 n5aT5fCOZNIMRw6cArg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91886-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5966F0C28
X-Rspamd-Action: no action

Currently the PHY selects the DP/eDP configuration tables in a fixed way,
choosing the table when enable. This driver has known issues:
1. The selected table does not match the actual platform mode.
2. It cannot support both modes at the same time.

As discussed here[1], this series:
1. Cleans up duplicated and incorrect tables based on the HPG.
2. Fixes the LDO programming error in eDP mode.
3. Adds DP/eDP mode switching support.

Note: x1e80100/sa8775p/sc7280 have been tested, while glymur/sc8280xp
have not been tested.

[1] https://lore.kernel.org/all/20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com/

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Yongxing Mou (3):
      phy: qcom: edp: Correct and clean up eDP/DP combo PHY configuration values
      phy: qcom: edp: Add per-version LDO configuration callback
      phy: qcom: edp: Add eDP phy mode switch support

 drivers/phy/qualcomm/phy-qcom-edp.c | 191 ++++++++++++++++++++++++++----------
 1 file changed, 138 insertions(+), 53 deletions(-)
---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260205-edp_phy-1eca3ed074c0

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


