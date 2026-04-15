Return-Path: <linux-arm-msm+bounces-103281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJzWDwJ332ljTQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:31:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC013403CE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3388E30EE695
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB68737AA8C;
	Wed, 15 Apr 2026 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TV1SR84Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNAAOQ18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC70340298
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252340; cv=none; b=Se/zGX/3tlETGNrxfYiZOeoo7F5/7EhHetbn+CWgbs+9d9cYosClnj4lmJY+/qUoG1YQ6TrF7qtIFpfPbKL7PfV9IXTcm6yL2qu6j5W4BLJ2mf2MS27SwfYpCdXHYXSE+/14n9B2tNRCZBa3v3dT+j6wFeIKyyy+4/MC9WzdtTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252340; c=relaxed/simple;
	bh=9+9SXhB6a3BriMK9Jz99mv7Hy4r6NzgAX//9nl/uEzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U1H81TPHJCaDEryB5dK/WPmaDFtqfG71xXRyETZ6KZZObpv/7gzdeOnezKnE23RzWYH+aDKW07gfil9F6BuLO84ndhKk/3LD0RMIxKfYDe6dgMbYdlXzlrlSj/N6t+1jmpZE+Q98ldO/J0vfiE8oZsmMaXk1leOsKc7ypGrm3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TV1SR84Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNAAOQ18; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9ICev1566849
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L5W9eUth5C6sQLYvD1LwKVnbRfoQjFfPpVJ
	CNUqAszk=; b=TV1SR84Q/uktgKfoyhVMSkb0ZB5zTpkdVSgayF7ky+uOpKrn+o1
	D7e8Tr0uQN/fv+YDd5If1ebqtqtB1g8QKEFEci4kYg4DMOSp8kxfurVrfbsEtqPP
	oYiiIUeNVTeoIBMSmsYjLRFI5QtKLX/jGnM5CsgIr1OHDGx/Zsd4PbAgUI0p86Np
	jncxP5PulufO//A1FjC5YboaFegppirzTY77Qyd2HsBR87rKgz9Cv5kvI0kExRSf
	44nkdvLSMlhwcPVirwQbLL9UjIp2lItEgPRZeEpyA9aqUUkGUhMjESLAn54OweDz
	qh68yYyRrz5SGMQWbhtxMU9ciP5qOFOa9iw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv0cmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e8ff14e5so29914965ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252336; x=1776857136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5W9eUth5C6sQLYvD1LwKVnbRfoQjFfPpVJCNUqAszk=;
        b=iNAAOQ18FySOmQheVy54rWThdAaGLWi8BgitkMZA14sBYVUcYx4e6Bh6wLNBfV4LAb
         SnBu2qb75b9cfVDmKEv3rSDXbhPwCtsNkxQWbMhnSincpAQqKrMfoumG0qgp8RJUrGVe
         aHiAhX9U2JNr+MWKo0FVi9WA+H7U/xoByqIL3Qv6iPZc63gcd2SzoCeuOR+xNVCXKa6m
         fGpYm2cn3afakktRbgGRRAaUaa7yKx7+cdgFiYTpZOeSPxLKOLomlnMia2xmGZ9uLPg1
         XIdPYjhKk8aYidcaV/1Zahdmd0jYrweUxjEFaQJ2c7A7ahHF/iip6EQ43yLGrLIEPY1I
         aieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252336; x=1776857136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5W9eUth5C6sQLYvD1LwKVnbRfoQjFfPpVJCNUqAszk=;
        b=Ok4rR+pB55tG2y+9YtxY/xN0ObBznZ4aOThGAk0knha4//qf7S+1/7bjNmcCnkxpHn
         EDYhyTD9d7g3MvLnkPtMmUlsGMrOwN4bFdQWwaKhKiv3TStrZf7FBTEuJBwt3e9S4VBB
         48QdQAA2nlQ3jRHAJMB2Rxq0O5UqHxaHpbTdrWIXf4ihpU/YG49Of/QrcDRmogrp/pa0
         nPU2IK2HeXhORDjvRoOfNy0u1vAyZ5w80NNFoFUo14yyHowdNLaBap7kV/CjRWLHtOSP
         2f8y6+PF8u8bzDhcM0t/0kXXkDJ52eKhH3iYLdteQnrHLKswlRwzWebrxqpL9qMt3Q3T
         6VSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9M2Hd3LC7PjSwsYg1rbsaQjVRFoc+37Y+FSb5Kn9IvcWUCupVq0HZD8eMHyzexH8Q10FTnB1iFmlhsiJrr@vger.kernel.org
X-Gm-Message-State: AOJu0YwZw8R3db5UcHdTt08MiaYNEPoQTacmajmfBfemPPYT8VFHgobF
	LcDCF4S1Fu0FbkZYFQpOEuW+sxt8nMXUZrJCwP/t7eYuFTtHJn+y2DCx+MQedu9TtTx6s+JYaPQ
	EeZM7vWRR+ssZhY2ug6oE41r4IMqe+912EjXIMcUteaJ/otri0v94Yq2JEWR5edN65Rlx
X-Gm-Gg: AeBDietQZZRb9zahMR9ZXusha8hytKFEMq6HkUgPQv41caG7/vaOtIKQcVD0EauzeYU
	p5Djpe1KqKtONgzpWOZfv2WpxEeVxR2USeRUkFBDUquZUcq+V6kodElM7zDfbFigsZXx9u5NxDC
	8ygjogVDsEpphn80mfj3MGxn1fDniJkPxIypHWFRS9Kaq6ACvEeqz0Nru9ocy1M1HfoaA56WXbT
	xKhVt0fRPszlProjZV+7aslQAyEuX9Ym28ZIB2i3mcF7MapcQV3llCkJRZL4WcxTNTrePEv+dUM
	fe8qr0hZ0biFzkWXU3iI1weOYDQalnejeeANo3ikX95cIt48jgYC3qWGz73reZKk5bYC3W1EoRq
	DLkxRA/X2pDP79Mo1GlWhgk61RY4KPxTQ4p4C14AKoKjrd4StSFxzoiXmyU29aWyb
X-Received: by 2002:a17:902:7003:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2b2d59808d0mr153165835ad.14.1776252336169;
        Wed, 15 Apr 2026 04:25:36 -0700 (PDT)
X-Received: by 2002:a17:902:7003:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2b2d59808d0mr153165585ad.14.1776252335662;
        Wed, 15 Apr 2026 04:25:35 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b6fd8sm26794325ad.73.2026.04.15.04.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:25:35 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org
Subject: [PATCH v8 0/4] misc: fastrpc: Add polling mode support
Date: Wed, 15 Apr 2026 16:55:26 +0530
Message-Id: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YGOl2ggVt8h5Zmgv9ySx9LR4sW0O2M_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX6TvteBLUXK3C
 iVM0kJV8VjbOSdPDmUUT9oP0CeBV36PVSt0wQLLSwN02lX1Go4aC6lO02RTvIHB4Kl6muBSjNWy
 6yA3pW1lfFdRJSjNfi5XfEn1kqiIcI2G/lsmwkcKEKJKIIUVob/IVoieyWIoeP6ZpYvBY4YbjhM
 049epAqwPIW9hYg9Q5LsE1b1kkQvArE+qIfQeK6B8xnFTcDePOgn0fFM2VMn+2PFGEqxCHowS5f
 7QarH27oW0nhRSKtcXSp4h0KRddapsegN6kYEj6UUR21x6iKzEezf4RcXZ1Pky2X4l29G7N4n1c
 I07+HD/WTLdr0sVLyfd2xUcev9io2o8Mq3XA2oS/Xb9AEb7ZtAOWLjUa7QL5SZs3VK97N1iKZoN
 E+omBUKvc6z772JO71WJS1237OngPPmjXrdlr4eVjhIk6GK5GD2YpCOkS6fSgcoLjpe8gBxvb4n
 xxMAAIoNlkmQbZCU/WA==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69df75b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeUw2I9XaFYL6OdlDaEA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: YGOl2ggVt8h5Zmgv9ySx9LR4sW0O2M_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150105
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103281-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC013403CE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v7]: https://lore.kernel.org/all/20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com/

Changes in v8:
  - Added more comments.

Changes in v7:
  - Fixed warnings.
  - Fixed commit text.
  - Addressed clean-up comments.

Changes in v6:
  - Fixed poll memory calculation.
  - Added few formatting changes.

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 159 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |  25 ++++++
 2 files changed, 164 insertions(+), 20 deletions(-)

-- 
2.34.1


