Return-Path: <linux-arm-msm+bounces-114308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cA8dMY6bO2otaQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:55:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 164BD6BCB85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=firXKm0L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="F2/6z79q";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114308-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114308-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 920793014950
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA4438D6AD;
	Wed, 24 Jun 2026 08:51:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26452C0274
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:51:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291114; cv=none; b=Iv508gVJdGEANquYrN89jSh/CIoQqXpq4bSluZf8bmCZptkJbmu2y/z3VfNw8Xb7yx26MTaSFSQe5ySCRPsnXZ4hgwuMd9whRghKp/XwkIoIqAIKoVtGSvvTA4QtCDb1JJ0Bmei71TEe41dfREEbSEFE4EIq1PUOuCdL+r1WXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291114; c=relaxed/simple;
	bh=znIPxVQSz8dtKadTFIF0UTNeLbMfAah3gZA5e3t3csw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R3Phbzwgbf1NArKHKh4fG2P8mC6jHtzrJcnOodcd4RqIzxNp435jijKgu7LmoueneltvysRNk3HSgNG6R6BRvXiq9ftZq5p6I5HuvCglcPiFV1gapn+1Okx9GNaNuxI/GHcZv4UzZsWU2TOrW/XurqUR9odGKynvdQBZZ4TK3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=firXKm0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2/6z79q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uASq2439069
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QW2n1nJTzhvBpl/6emQCpg
	fkyQBbHqZBBwyB8zOU/rs=; b=firXKm0LKJZZ8czNnNR8UqTRQQSymSw1j4TtOP
	sg4t5o/Nm18fxGMOZ2Eif5P+SultUgNUBShTiW2Rbrd8qV1yW7Ys1A3aaMGhUM1d
	SrZtbCy/0VbJtBHxD7bFr4GNVIaRY3wl9qX6uol9KOf6gtobINuZW/g2FFGjCAPw
	ZJs43+EAXnZS8gkHgo6gQApE2Wlw0+pzAiXb7G5qZlAaTh6mZLkG4B+imD7w5AjB
	xi1jI04DQtVHpweYMYnhQ7NMxhj8GHTZBdDJc94rYwFz1GwaqenJdVdcYykDvj54
	CK1ptFPCGG+eZMZHOFpBO9Yu+NAnkuS3wkEjOboqcD5tEcuQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar1cf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 08:51:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89956023dbso499049a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 01:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782291111; x=1782895911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW2n1nJTzhvBpl/6emQCpgfkyQBbHqZBBwyB8zOU/rs=;
        b=F2/6z79qGHGDWcBUEdrVTQvTSWTcAWEl0NCJ2RjAo3LIk26jYKbdGZV2kg4n2z7e4J
         MRCx2lhZlgVwJIFJJEcT2Mo/xgtvGB2T0QdGFem0xnJZJCAgwnxHQrcJRoT8QlN/YPbj
         9vVoEGA/y3KqKm3Jqny/t8saGTQuCmts2DqQCH/RaBzgU6N723kbUyAheBvfX3haupId
         A7sdJVbBI9rhYmHgRmeQItHDomYzbcOmvIKtQwQnFpEnkX3QsJc6vx01R3hFrGOOZrOn
         GRfMr9dOc/sIx/CIcSAp9lso/vw2AGYVMPsdQN8VD6zs0o6tXjn095tehAjUxBGMgtWk
         z5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291111; x=1782895911;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW2n1nJTzhvBpl/6emQCpgfkyQBbHqZBBwyB8zOU/rs=;
        b=o81oUFwSH1eEPJkmzmmH3eWIoXoRSJYn5MX1mZ9DGt5QtFVG+fl+E2ujrx/jqLQYnQ
         MDAyqYG77t7MSy4C9eRkqp6uP6WAGAmt19UqTXNyuw+MO/6kfLeZ3lP+6pbMmEzW16R+
         TikyMOVugD6wdxpjKp9LXlEbNiUgGQX5W7n3JREczp9piMaKh2RFhKlLJ5fr7Kt9W6hv
         aP52mQfhMXCB4IeDRDP1KtQ8tqQR9tRmj2wjJ8dhYTn2wl149syKKXG6QzIiCfg7F9Gj
         hwLndwQ11th+FkPoMwOQgGbz15gYM5DQ4mSgmTpMNLYUyS3jc6GUaYeohL+vAg8Gmzj1
         zSNg==
X-Forwarded-Encrypted: i=1; AFNElJ9160HF+8CvcXIdRSHT2dQ3eQGwlxz/P1jZbOErhOfI68LImKdvT8H67LIguRu3L+GReQ1krVKRR43HJOcE@vger.kernel.org
X-Gm-Message-State: AOJu0YzD68wcRKEgJGR+1q37BcJhFAl3w7gS4rAu34ROxrcLpLpalL8/
	bFWinzQ4ZlqEttfAbpxlp8Ct1z/SOw8zrJVV5lqWs3Fqm3gtMXAH1hR2gtkPJNf5NEhGGWTcHvP
	RsL9QrlYu9VhNErJRCBtZTsWfX7zS5+uZ0scTbZf+Vrh2h98SaD/HUFZK2nK9CFMmZ+4k
X-Gm-Gg: AfdE7cnlwD0KhL2ndj6ujlMy/ve6+3yh06HeV8fJroKP6b8ZJq3jZklPhaJkWj4H1iX
	XO/I7j0dsQ7CzGigd/VtW2rOrffaJnR8z6ApYtbHUcb+DXjGNDb3PgUNm5cQ2b7XsNnJVXehHRX
	Ij9+jcDANc63pnqd/0ymN2K6l3wiXZ7LUys5xh+vP4G2oeujDs3HeinaSLNstSWtQdOlc+pdOab
	xJoVY1ACdo3ZmWcvoBrgYmjikboUmp02r9laMTsHidOrLAESLu+7lG5Gw0jQQHbT5KGKoNlHZ2N
	ehZT++GVXupN/6Amm+7vY15DF/bTnEwI6HkrgRynlgDu5EZvhN95QY4L1y1EAbz2wIB6OExFG5R
	aSdQ94tA/V2ZMpbw0LZqloS9PTiDYBa7bBDllMqejB7gQTG5OzgIrgLRwibCmlICwRHomyKwbj6
	HTyaIoM2gN2g==
X-Received: by 2002:a05:6a21:117:b0:3b7:8e6b:7001 with SMTP id adf61e73a8af0-3bc51b6d080mr21430068637.12.1782291111233;
        Wed, 24 Jun 2026 01:51:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:117:b0:3b7:8e6b:7001 with SMTP id adf61e73a8af0-3bc51b6d080mr21430039637.12.1782291110747;
        Wed, 24 Jun 2026 01:51:50 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm11926464a12.19.2026.06.24.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:51:50 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: qcom: iris: add dynamic encoder properties
Date: Wed, 24 Jun 2026 16:51:43 +0800
Message-Id: <20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+aO2oC/22OzWrDMBAGX8XoXAXtSpasnPoepRT9rBtBbSeWY
 xqC372yXSg0uQg+wczOnWUaE2V2rO5spDnlNPRlyJeKhZPrP4mnWDZDgVooMDzeetel8EF9GCJ
 xaWpwWmpBUbECnUdq0/cmfHvf90iXa/FO+yfzLhMPQ9el6VgpqmPrTWiUABTCBBmM0AColQXvg
 8VowLfAVtcp5WkYb1vrDJtsz0LxP2sGLjgCNsFCDa2g1yHnw+XqvtbLh/Kssb+0fUoH23ptITZ
 eukd67Znxr6F4HixYLJqsia2QqBp8YlmW5QcetFL0gwEAAA==
X-Change-ID: 20260417-dynamic_encode-3751a6360ed4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782291107; l=1682;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=znIPxVQSz8dtKadTFIF0UTNeLbMfAah3gZA5e3t3csw=;
 b=WO5oY7bMrirRcO1sAcvrto698iTTQx5U/a2N4D3+nU8PwFFz8XX4ca7i7lI35TfBUmKxvWWNV
 aresOUpnjxTDbG/hDwcVaTjIkhp6Tea2OofrPdv9V6KIY+JABXzpI9v
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: kyIrtNZ9kCftDb1qwAGI67rbHKHX9IyH
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3b9aa8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7J5Ww17mAtRdPOrEpzAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfX3AXmDsBUyX2f
 8WNcnJJv27XmKVCfzNoKfR5ajiBLjF1sPXu14o4cCOM3CsJOPrE/rpXCYRRWTQwpEUabyoer9Gm
 OIa9S6b/bzb0mEwF5IXO0nAnebHWJ50=
X-Proofpoint-GUID: kyIrtNZ9kCftDb1qwAGI67rbHKHX9IyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MiBTYWx0ZWRfX9kTnZgeLRR4a
 pHAyxWxDdNyt66NkgFOKqHK3kwo1BUXhtxIqWyG77cs6Cnr1A6dG/X2ufUE19S79sh3HALUqC74
 ycwdUS6wXj4oEzxuSZkv9RDq8BR9LYs2h78JnWObb7ClBpXxTsjBjJuQ+0LTD8YS0tZjy9c9loV
 f4WR4DzqTsKEYhsFZb1b/r60feDsQTzMP3ypa1wNg4cEQqA+8i/Jw36iV4DeRQG0dnKKUN3+esL
 K4zWF5EmmctoZQm8ClfcxyrvwnSVGTY9WUFAk86ti+iLCa1IMhNgw922XmqRpCVIA31LICpkO0j
 5/dx5C66tJeMLlFJJXW7xQwgugf6oJZ2eWRjB6PGk5Kv2Kf1374Yfsc/0OayuHUc5DJ4IS2G5LB
 Z+5AphAkPrenKZaigJ7+Bt+VJQIwD6Uv54OC0foOakeBRFidDxg59/DXjx01/ZScL/IJJpmLOup
 OELMhkIpHvSbrNKWU7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114308-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 164BD6BCB85

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
video encoding features.

All patches have been tested with iris_test_app on gen1:QCS6490,
gen2:QCS9100, X1E80100.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Correct the max value for FORCE_KEY_FRAME cap.
- Link to v2: https://lore.kernel.org/r/20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com

Changes in v2:
- Rebased due to a conflict with commit 'media: qcom: iris: split HFI session ops from core ops' (35da0884068226ca3a53371dbf685db6e0d74658).
- Link to v1: https://lore.kernel.org/r/20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com

---
Wangao Wang (2):
      media: qcom: iris: improve gop size support for gen1 encoder
      media: qcom: iris: Add request key frame support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 24 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 26 ++++++++++++----------
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 8 files changed, 61 insertions(+), 15 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260417-dynamic_encode-3751a6360ed4

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


