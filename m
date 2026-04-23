Return-Path: <linux-arm-msm+bounces-104285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LXoOCn26WnkpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:36:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A181B450CB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35F4D30AA64F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D8F37FF51;
	Thu, 23 Apr 2026 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0H8v9v0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LoqLeu4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0755737AA79
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939637; cv=none; b=T6IM+nZe6kRTfGF+VOUKr6cRiQxyhcfGCAGIYso5XU/46iT1N51dg5QCcNImOnQ29opT8zoC5f3GxwQ71fgWmvelFnbbnn7LqoUQgLPbU+RUw8HvTCnd9AG7e8nhhayL4H4eHEfSSbIRqMSMORZFG8yLTvKxz5RaIIAfkj7Mzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939637; c=relaxed/simple;
	bh=R+38vX2FNnuJCggvn2tdBNmfImnhD2B/HCAJZNf3ybY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BehuLLfZ7vFfN7bwh9dkjlX5P3r75IWdL0EtgOwVos/nQhewYGCLnybFHU3UFzkV5DT7qs8OoRebhBTt3pZ34E9EnsPITjKOLDIshnaSGeW5Pgxb7MnlbL419mmfKnbC+luUxUAPw6Ip/zEh2hIrHnIk3skhFeimbrhCMYb06g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0H8v9v0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LoqLeu4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uCjL3294998
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VyAfqt+wWZL4gBkHzohi+GbktLjgIONg10c
	KaMxDrm4=; b=B0H8v9v0JpFjaziXU4Uk46ig+haWwuLsYWI+446cpMwDSKurhOx
	QzCQ8VI5wsmQ3RNvzy/nlYYhsi+AfExGcbwUB/EE5LMpbSgjS2cFfRvppb1lt3Bv
	5yw+SJfBOC2Badxm7Z0EbDUGu7GBwQsedapTx9DGwTwGWKwmIYVzX3lJZ/FJwtc7
	x+E0dLKyAR3UZvB3cdC2iF82YbSOIEgUgslCkpkmbmDwY1wzsB8KhUxa7nQP8R0k
	53ohOdeEEwXeii4Px9AOoZtqNKbYpAONSNCh6m3rHGQDYD7Isyrp/ZNOWmrgc4Kq
	wmct9nyOSJkgvvotBWulu+Cp9VOaDt+Whng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282u9bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:20:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76bfd7b9cdso2738638a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776939634; x=1777544434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VyAfqt+wWZL4gBkHzohi+GbktLjgIONg10cKaMxDrm4=;
        b=LoqLeu4LOQsfgIJBsOv+BJJDSeOHl8LCYimAGVkulgb7GUqsepy39V9feUdYya9OgR
         Bzsl4pFa6ZwyiXbGMHwy6rH9YEaOKi1+2t9mZh8lF+JjEAVCIJtSszZIXaX1wAL/pr6Q
         JPB9P2IDY2wzW1rgFwQaIV8heUUXd4E1yWX1uZvtuS6WuOFwy9/kh80esUmS2iVO0RJJ
         GAxttH8Y1W3RDA9ym7JjD6PqDzTtigm9GD2km6r7/M186tpp24jJmFxJ/W3NIibTiiAW
         x6fi83Cz6PQfS/uZyfhsXxUFyNic70NDBQEFeEsBtFkDu/KWGoClyAS1YwyM6cMTMNX6
         XjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776939634; x=1777544434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyAfqt+wWZL4gBkHzohi+GbktLjgIONg10cKaMxDrm4=;
        b=RJ5Cu+UkSjwpzmlsvQPXC7Ai2THcmDDK0zUKap6qI6KSsVf4NBGb9sj6sPY5zkREHd
         1pr3bTY4J3yGcR8hTJ8NZc3SXGt5H56Rw/kpq+EE1TvJkSuK6galOTqdB5axyrrRDYzt
         J+Psq9apBz5x34nLHLXP9TAMn4epAV5fA5ZR+y1sK0XdtQr7vVc05A0Urk0C44stslXa
         ShmdO7pbSAdH+CCX0YQ+WnMqU3U8bb4Q0vsXX85plCetBrKsvoqhGIrXB36RBvJl7NPg
         0WNSYwJ6GYxXfM6AHotAuigmNwvetLkaA2zOrcfRtzwoZMdRCM1S0OfSorgKbqGBIzen
         ltcQ==
X-Gm-Message-State: AOJu0YyUpW3ZAqTEGGGBNjAhln1HlWafN15uZcmkIbj8I1cta5Hu8fYq
	Bn0qx5Isz7qZFDrXu2FQGCT1fLzzDPXIxNkPwp9EIkE3NgbQWTzxjIPm55YeF12lsLLhze2iLOy
	5x8GBN6LVo4MEH43P+PB/J2Jre5ieNcXwkDyiE70JuTP9a3FavnZpso1S5pgAMpktvuv9
X-Gm-Gg: AeBDieuJplIaC5j3wLdf9BMcG2d5B4CsMJt8mOadxtZmAX1N/KUe+nSRt8qT4wutoHN
	y1nILxwQryyEzezdiQ9r8SgTw5b1A1LOX/Ak7MdEIV3XpkCJ6rUZIGgJt+ff0QR/eEynkVw1lJh
	hd5F7noWayDnhJNulx7vHLygfjDarQGUqNcXwqqkFIOzorEXT893Ow+8bcqMk+alulkG4/Lusg1
	Df5s+AK7wYKMP6jM1ZAWsh55HrtqNHUL9hlcQB+0h0l1P2iY3so6IzrxVOShu/fmNbGCRO24gpP
	ty8/FBPsYFGivfjHyJpjhrVXxsBwxp1Cvh+bXZr707QhBtacv45GNCpRmyfLz58E/hJXBcvxggS
	rbjlCSwjUhPDC2U8LlQ8T9D9iCIDepwVPx2K4ppDOaONtkup6u3vyrl02mPCOdea6
X-Received: by 2002:a05:6a20:918a:b0:3a2:e510:4231 with SMTP id adf61e73a8af0-3a2e51044c4mr14662931637.45.1776939634433;
        Thu, 23 Apr 2026 03:20:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:918a:b0:3a2:e510:4231 with SMTP id adf61e73a8af0-3a2e51044c4mr14662894637.45.1776939633946;
        Thu, 23 Apr 2026 03:20:33 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f92183sm13944461a12.3.2026.04.23.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:20:33 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V7 0/2] Add post change sequence for link start notify
Date: Thu, 23 Apr 2026 15:50:21 +0530
Message-Id: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwMiBTYWx0ZWRfX4zcr+eUePnu+
 jTfINlwDtlcsJ6b0sHPwgkIjtaXS3wn648zDHPdzLdyYi1vo0Rur7LV+VlsNjFJ36rS9yoO68P6
 Mx6yAqokp24VsMb6+9D9r2ZCLhtxll/yRgz9b1z4n6GUmKopvyIDcVEd+fi8+PI0/5XhhTy/R3n
 jSRKUjNFQm3mBKo55+O0vW06mH1eCrQ29cbFbOkQ1lLxdYDCykQKsE9KFPLLewLobEAtTBpvWm0
 QsnJOrIO9680pZmC2YBJUCa9akXuKuSk5ZkmQnYNyfaAtf+0hCw7Vjs2a/2FrAuwzfrqCG2mDl/
 s3aoXLyPhYegMqT02TC0+Zw74vz2wBDnYCc3IEaNkwHiKw3OtOMG0kPmVb3lQCUJsNKQliz4JBA
 yKBI71uEkuJGzjxgbcpEU1mZ2aNkZaJU331IhwL63fRCZgmGx7uZOYicm8d9CZyVQsigGt/TwFc
 taAWxz0pcwtTxM5Yx5A==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e9f273 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QkLE9msmHX_cMu4pcKkA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: QTe9ifjk_9bwFq560YnjMDzbxZyzrUHq
X-Proofpoint-ORIG-GUID: QTe9ifjk_9bwFq560YnjMDzbxZyzrUHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230102
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104285-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A181B450CB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

changes from V1
1) Addressed Shawn Lin's comments to fix comment to connected lanes.
2) Addressed Bart's comments to remove warning and trigger failure
   incase of lane mismatch.

changes from V2:
1) Addressed Shawn's comments to fix commit text.
2) Addressed Bart's comments to remove variable initializations and
   indentation fix.

changes from V3:
1) Addressed Manivannan's comments to remove extra comment and return
   logic.

changes from V4:
1) Addressed Manivannan's comments to fix indentation and return
   handling.

changes from V5:
1) Addressed Manivannan's comment and added back the missed tags from
   V3.

changes from V6:
1) Addressed Manivannan's comment to fix return handling logic.

Palash Kambar (2):
  ufs: core: Configure only active lanes during link
  ufs: ufs-qcom: Enable Auto Hibern8 clock request support

 drivers/ufs/core/ufshcd.c   | 33 +++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 3 files changed, 54 insertions(+)

-- 
2.34.1


