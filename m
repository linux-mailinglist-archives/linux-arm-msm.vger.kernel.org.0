Return-Path: <linux-arm-msm+bounces-104314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHRkLO8J6mkzsgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:00:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DDB451A16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEA273002E79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D005A2BE026;
	Thu, 23 Apr 2026 12:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDpAuxkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoZpaPEL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46CD3EBF03
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945638; cv=none; b=NnIaf+MELHVE+A6x4cKzoLUx077NP9FSfMhzs3qr04+jGk4segs/JPq10D6p43QnthKZXoBVroY2EoGsb6n/ADMuCnN0kDvwLXF1OwJCRkUEIS7Bg/fD/Zo7SQiSCzDgE/UyLrqVfO8SIgpMPZdc7GqelnzoRldBmuX1Kh/hPJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945638; c=relaxed/simple;
	bh=oL8lY7kTuiceRDZRaGs24VyCt20j8FzRSm6Nt5r9xZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mJDuA2GWHbKL1k4SaGBhr+AxvTZMw8pDMuXu2O//QquWcZwC7Tz7S52cGk0KxgZSA/N9H3hovf5m0voII9t4jTgk3UPNuSMu+7IyxwASUlDhL9Zwjl8lXxqcr9owCOMZjGbcKozfDa/zZzKkarCFUkm5qLdvntCoSwEwCp5bIjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDpAuxkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoZpaPEL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uET33044060
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eIrHtygjWg6Sl2zjvdxf1O
	/+BVTjvrWFBlUr1RH7v3A=; b=WDpAuxkSGIhJqfPeId+thTzthAEyrFT1piVRAR
	pbo2u1NtaTDet2pk1VzY8xykbV1XIcOD6KxR78UbhPUb8jKbN85+A/RjTLykRUn2
	Jm3TC2QjjTa/r0N8qXoFICA39Vy4obtJWy6FrY12JqqKpQ7l4ZBVWAfGFtjtJEC3
	R6kzJZK6itCfaI3iwRzSWNB43mUHf5wvR3EtXZRctXhdOYGTSsfm/TP7ehcUSDjo
	sx8xDUJYFa6HNfn7tOTej1yGf6/b3TQp5VU4wzDfar6ve+LHQe1qdm4B8mRiF8aF
	40mnxHJ1uI1xeEAeQeAMOdA8Pe+U67lqI251Zu2Ciz/BBHNA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3rtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b241be0126so129490855ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945634; x=1777550434; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIrHtygjWg6Sl2zjvdxf1O/+BVTjvrWFBlUr1RH7v3A=;
        b=GoZpaPELuMBUgfovSqIAjEe3C4JuxxyEmzmZrEm3ZrYT7X50GErpLn3dZINEgoWM74
         SU6gLhgTcUY+v0AA348Tiu/SyVjDzQQodC4dgr0/4btbKdL3pQqaKjBu4/jaIz2Qp5Eb
         G+nYXYZdXZ9YWTfQnTqeHKS8RiKPm/3DbfxPllFMfKkzYDoJXATek/aTUMIR3a1iKyh1
         X8WWPtLtpjCrvApA/6MaihWurHn34tS6pCz8bkAPMnYrebEr/HswVUIoKc1WrkxciEgL
         2rfnMyzoXt403m+T+iZYZfSQlXmEwJBQMdlTv3knwOr5xzobhZBzwkrN+ie1GzxeApdw
         dakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945634; x=1777550434;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIrHtygjWg6Sl2zjvdxf1O/+BVTjvrWFBlUr1RH7v3A=;
        b=ErJ3A6e6MhRtI/A3eo9MQRR7PJdSOnQv/ggz/gqFJRwHVNI2dkxWflQpwCmVmZrnT9
         FCzuiU/h0uObGEPhJWXhKRDwCElvIoqt9MTVE3CPVN0JS79BBXEiLcaa+A1rldc9RwlX
         Ee7YxqzZi/uiX5tADftyoSpK+euQWRIKVj/yUo9ouYhPoWWdAGLd/P9Zf/4DDRUAy3m8
         BXCECqAZZE9JH3lc/Wz9Xp/CMosC3kjW7XqH2Gjsjfi/2SoOytueq25EmgIi5nUhxWD4
         5XXmY3+LTVYTUN1mFY4TZM+D/JuS1/kBTt4j1P+GVKZtSF/OHJc+0kwhThCC3N1vwjFa
         YeMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vaxfJFegi03vsxviImYyBgsaJ1WzncpviFlg5f6JLVvGC+HxJV46b1DfwVmYMkZFLYBnHdVqFvZ1dOIUw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wpBu7ixkCWlrPFHFBIUl8+VuXW3LpX3ysI7qv1SPsRWjwGiH
	9Ck3GfXk2iyseSKYoRPORUyBWkuUgPAYriItS9DudgKAqJwwgNU3hVFNQnmdvCxjpHZzyEdxDDK
	v6rLL1o5ssliDAs1AnxLLBkYGc2SmMEoke1pwx2nA4ObYfhuRlwGzp0QhCSLjGRKCIw8d
X-Gm-Gg: AeBDiesrIS5zD+l6ENmdp6UwXT9JBlbssUnRVU2IVfmIKTj16+hy/earDkC8gIFB9+t
	pwDx/0mDS/uNPclTY0DLIH/A779qP0UPVdqunz30i4w+MlpOhsUpX4UYrfbeHvynPlg6yAwKh8q
	NczQeEHkNWapa8ozKNz/v+xLwJltRcs1RKvrFeK1+FMPhv3HGFj1whlVdNE4tqV3hwB3ssurCDT
	1iw6y8ddrgwitUPvZA+tUhoM2cQQGOdrHUSdxgOnOO1fYBfqum/1bl6L3sk0zFo7pfGEUZUB++7
	o3yqCm6oFmBTLJ9d2hysvO38xFOdwh75mnNXF6kRE6IFUn6FyJxOGWmcuMkArIkmnK1TNKSN+wb
	P52T8NYcwDpqM7Lg4k2ZMGGY+8A8gVU22LPtjqgPd9c7BMZH+XW86EZ/jTZDUaPPSIBB9aw==
X-Received: by 2002:a17:902:6bc7:b0:2b4:5ddf:24f with SMTP id d9443c01a7336-2b5f9ed21f1mr207066525ad.10.1776945633339;
        Thu, 23 Apr 2026 05:00:33 -0700 (PDT)
X-Received: by 2002:a17:902:6bc7:b0:2b4:5ddf:24f with SMTP id d9443c01a7336-2b5f9ed21f1mr207065705ad.10.1776945632497;
        Thu, 23 Apr 2026 05:00:32 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:32 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/7] media: qcom: iris: miscellaneous code-quality fixes
Date: Thu, 23 Apr 2026 17:30:04 +0530
Message-Id: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQJ6mkC/3WNQQqDMBBFryKzbiQZVLSr3qO4kGSsA42xGRtax
 Ls3FbrsZuD9z3+zgVBkEjgXG0RKLBzmDHgqwE7DfCPFLjOgxkZXqBVHFmWDy4VfYkjkaV6V6Sr
 djabBurWQt0ukkV+H99pnnljWEN/Hm2S+6c+If4zJKK1aMrWuWkSD7hJEysdzuNvgfZkP9Pu+f
 wA2wVV1wQAAAA==
X-Change-ID: 20260420-iris-code-improvement-19409f16258c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1700;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=oL8lY7kTuiceRDZRaGs24VyCt20j8FzRSm6Nt5r9xZQ=;
 b=6gcZwThJ9xJ7vHMnVnorb//NKP8y5g/L8dZxIsyZx7HcS+EU8+ld2iR3icdx5/IU3L6jhzKKc
 8It0pNiEGTVAAPuUlA1iKeBBNnsCgntrNRnNRbttQDXbM1kkmmjQt1D
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfX/AkcHIG9hCd0
 9EmEbVaXMWr466xX/azr08MEaDb9mkyqN7oEZD6sjXgmuTNz2yd+c+GW2V9g0Sqrv0Euh7Ttmjy
 bcUv8woMcHo5NI0/deiyT0wsp5AtuGNgtJEGPUDyoLGZttbWOsEjWRgQLERhhk1EqPD2sdTw3L+
 LrqEmxa+NmcwtvpUsVfX8JYF3xDFj7HL8/u7PSEJB+E4XEBq419agcMeIrLfwFHRndlR2GzlkJJ
 PESaUADQqKdA79uZCfMqndnzaCLIB6Phrsfd8JUHpQtQjlDNOqvHPtL18rxdcZZcPhYKet7m0Wn
 QrbeWLdADu2oe9jy+v4Uk4RfBXEKpf2eQbRP86clrphYkHBJVwitM086l14srX+dDF9+cgcLbRG
 DwfTfUqOGpZ/UJ371Gy2Zqc8TxPF0+MYdWsCU2uUd7fMZu7N5gD1VxsE/PdeKTrH9cKKG7AP7hM
 0+4iJFFRNlLQ46npvWA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea09e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Lb5j-gmOE-iAMMu9PAMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: lapJNB_b13w1OjwcG9qo7zxhU_BFR9Pq
X-Proofpoint-ORIG-GUID: lapJNB_b13w1OjwcG9qo7zxhU_BFR9Pq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104314-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[dikshita.agarwal.oss.qualcomm.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3DDB451A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses a set of independent code-quality issues found 
during review of the Qualcomm iris video driver.

No functional changes are intended.
 

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Changes in v2:
- Updated variables names for iris_get_int_buf_tbl helper (Bryan)
- Removed un-necessary fixes tags (Bryan, Konrad)
- Addressed other comments (Bryan, Konrad)
- Link to v1: https://lore.kernel.org/r/20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com

---
Dikshita Agarwal (7):
      media: qcom: iris: Centralize internal buffer table selection
      media: qcom: iris: fix state-change debug log printing stale value
      media: qcom: iris: Fix bitmask test in iris_allow_cmd()
      media: qcom: iris: Remove dead assignment in iris_hfi_gen2_set_tier()
      media: qcom: iris: Remove duplicate HFI_PROP_OPB_ENABLE entry
      media: qcom: iris: Add missing break in iris_hfi_gen2_session_set_codec()
      media: qcom: iris: Make iris_destroy_internal_buffer() return void

 drivers/media/platform/qcom/iris/iris_buffer.c     | 123 +++++----------------
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   7 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   4 +-
 drivers/media/platform/qcom/iris/iris_state.c      |   4 +-
 6 files changed, 40 insertions(+), 102 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260420-iris-code-improvement-19409f16258c

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


