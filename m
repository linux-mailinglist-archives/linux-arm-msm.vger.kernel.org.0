Return-Path: <linux-arm-msm+bounces-112307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dnHiFRIGKWrqOwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:37:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A26936664F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:37:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VYjFXEYa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="daoO5je/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112307-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112307-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69EC7317B29F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEC1377007;
	Wed, 10 Jun 2026 06:31:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7BF37C91C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073061; cv=none; b=gOCY+lvsJwlrvPu7O99lm9n1tctYxPQGuTtHppuWvQwnk0deRrKsU/TTD/jfJ5EMV/581KR8Z5HgA0CfRftMTHnZ4KLbnnV4vXcCp0nm9qECWrt+KkumMeIIpQo0RN8HWWfcYcIP2vZ19o3SzkzqSBhgIkR1wSGu2WcLfJDKNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073061; c=relaxed/simple;
	bh=badfC//XMJ5PPAJeyc4F5me30UejF2kg78Rsds0lXZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ch70iwnSWP9TfrfmDRy4+0ad6a17K/gkrdszQE1JK4piEFJvevdfNcfGJSMGzD03ngNi4ioGGTCse68lQoHM2/a39+iOaGRysxQSk0idCBt+HPEjWsh1uUZtVNMTR2pi/d6o8HB6NIUesAf0eyRWnmBNZwFuAvEJentRlERH0C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYjFXEYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daoO5je/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2elEU3999858
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXbmiv80zvsPRLNOSFiTUpdHf+w/tP2wNdIU2WG9TQE=; b=VYjFXEYagdl1bk6m
	d6HSGmSravEek1QBr4qfh58cRenRt73mJDRA7soQ1Qp0H8zSg11Chjg0mpgkVchF
	fgYdB6UVX4bKXRkCsm3Huq8CH8G4rbrSyZzc6tSsPlCKFz8qA3rTpzhphWirMxGE
	QBlb9kzGPjmtCDREWAWjn8KBu1Tp1l7+o0XS5zuXlduY2TI46p6SxCk8V0ZcAZdO
	HxTxXlqUtq4ebVhbDMsu6uy59v7LkdUAkscGuTR3E2+O1153J3Rd7xH2Gz0WQxPz
	Xu/frzDybgw/DNYN7Aj6qlRtFgIH5mwwZ3wMdWOw6ZFSiALeP8R3Tj4fAq6P2wz1
	U21xXQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvgt64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so7249795a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073055; x=1781677855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXbmiv80zvsPRLNOSFiTUpdHf+w/tP2wNdIU2WG9TQE=;
        b=daoO5je/pWhQvnnLgAUUZ917SGhvzhpQse0KpooldAViif/7LIyTK2E8NrVemirjnn
         w6l2AK1bRCmJHyyIz8O2X8vjS/IF6F93lveZ8AQSBk92jUxD+sk2SzJAobs7oIOr24IY
         3OsfZll+SrYRozC1dTZwezcrJCmfD1xPLGrAUFpcND9NRbWojxwqhr2cK01fi6oINXuQ
         8as406nPo8ih1r16SNvVd7OGOp3MJObP4IQpX8yiPV/J74WuNCPATG+pH+z7i1vuRTv2
         8b4wE+qGoX/QV/oN44DTNVRZzvNvUDpmP8mNVwjzABvpw5SaDkc6aRccAsIL6pHUEmeG
         +Bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073055; x=1781677855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXbmiv80zvsPRLNOSFiTUpdHf+w/tP2wNdIU2WG9TQE=;
        b=Z2odMaztQDUMJqlnNi/Xaf3hrGhR/GNO5PaH5zSH5ObLeoR13x4pHxNOngi21ONTGs
         e+5/Px/7t4UQuBWMArn3w3a0SvygLA1M3qD6z2YM5RAxR5sXq74szTBHRrbWaoxDgEJq
         bNrJ9Q1oSDwuNCYrLf0DrIOOn99U2aPwqgAwOfC9PygASVQA2C/WSWRDqoBc9IhPVC8j
         ONY8kWaRk8oelm6AIxW6o4wQLCiN8hetp47+X0fM1882q/S9BZ9Wu/rBECUiPHlEO5Lx
         vKQwJs3dixk0t3G2HuOGCjv9wvvCcWmr4UYBSQzih3BmZFrvGEkzDJOaEeJWzDvAi9Mv
         nm9A==
X-Forwarded-Encrypted: i=1; AFNElJ8XDcuA0G8b2fOKX82CU9eaCcWYfRGKmf1cKDt0oNbeOYARZBnNVDyJm1k9wxuw14ooYQH+no6GYpeDUW/y@vger.kernel.org
X-Gm-Message-State: AOJu0YypRrWCMuNoCwh5H3kxh7u9VRnk/mun290Y9DMa53npg39fGlou
	Yh/Ns9UzCZ2nGHPJEhQLPd4aswliXvZ+oLhLjGIrfOgB5uOHm7TCGEt2azisvxUHQ1+Ky8b+L+a
	MeaACn9hSmjyqwj0MssKZyRNE30Nqu8GgACiQUhp/SWM5gQ614RYvvJomaLzKPtVojriR
X-Gm-Gg: Acq92OG/2zxKiQrX3BCeMMTXSGOo2h9T5apOOLf7hRd/zSpSacXwLCLCNpO/if+OjTV
	pa78tgAyQCc2zYGxBCV8otywbAgbEbgVYYhbYq9C83tt3PT+AXNhZcoKDporV6FCjUHoUKl7W82
	KXJWJ9fdwQ6iCFRpNIXzl7mgjVSUxyqGdZd0pjBBqadO8JTGbuEREZfSuMtJYqdLRS5j6WAvxad
	3OUjRxWzaNn61koveYGxH4rt4lv7KmP3LRR615rTqoQB+fZtHyG3Q5jZ8lC+R7MxbP9iaaslbc9
	WOc1N9B892jX/6n1WhKa6hAJr4zrVLi7Pf4kr2jt964YpJhvT0zK/o2vYpkXeUbj+mh2VxBGLwF
	lQMAjSxy1xS1OPg2ZD5FDJ3czf18yM80r/WOgTFaF5ygFLD0I120CadGjmZQTRYLqzw==
X-Received: by 2002:a17:90b:5545:b0:36d:6315:1de5 with SMTP id 98e67ed59e1d1-370f0771c54mr28472517a91.18.1781073054597;
        Tue, 09 Jun 2026 23:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5545:b0:36d:6315:1de5 with SMTP id 98e67ed59e1d1-370f0771c54mr28472489a91.18.1781073054093;
        Tue, 09 Jun 2026 23:30:54 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:53 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:43 +0530
Subject: [PATCH v8 07/12] media: iris: Add power sequence for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-7-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=8914;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=badfC//XMJ5PPAJeyc4F5me30UejF2kg78Rsds0lXZY=;
 b=nkdlsiPSlAX9lHKY38PZ39oJCivhQB4FScvjAtWifbtKbMUF91D0LhF8NZ8bGaCxIIm+Rmg75
 ZdjCWvjrox0D2Pq7qhiLrwiLlhd/fbVc/NqLQG+97IsEc22h3Yeg04b
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: mSX9-gx2Bl4CFctJmr21tLE8VxGLa_rg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX4OYAetUdLQk3
 C+E/8uebJaJeuWutgRKiKqdUTT7Y2D6AzoIW/gt9mm6reVIjMSaamKIByGnvpFiWMH/vZEo1KsQ
 brxmcBFjsntU1b/ulGdYK20WWIUYGu27W2fM/7ZqQtsrS35HBTI1P/JkU6krl0V9hyG6IYP7cL3
 N5MVwGvUHYnMaQSevL6NU1y3iYNbrTVd4zOEn2+NhMVo/BW4vYrGEF03Km7k7X6WR0SDQmaUeoD
 wMoQ6vVHvw+ujR2gkd0pELBqFt4G3tNxJDNxcNFPKUtHELjhqNDK/BdmhdGO7qSCn3lMfkUAUmu
 IQS8IUAbvdtM+xpxtg9xGSlMsot7BMSTMSWho42vhoyWz7v7p2M/kfy0mqaA61oOVU6YT1zW6lF
 qm8gTqCMN9lmRxsbZjRv9sFsT0w4MN9RZGXh2Ar3pBkvk8gSNJdCesRZQtMATVwivaKF6gPwJQc
 i6qaaDv91vURECCfQRg==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a29049f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=on-tpLi9NVdX0ogc7TgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mSX9-gx2Bl4CFctJmr21tLE8VxGLa_rg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112307-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A26936664F4

Glymur platform has two video codec cores: vcodec0 and vcodec1.

Both cores share a common clock source (video_cc_mvs0_clk_src) and the
same power rails. The clock dividers between the source and the branch
clocks are fixed. So when both cores are running, the source clock always
runs at the highest frequency requested by either core.

Since both cores share the same power rails, the power corner cannot be
voted independently. Scaling one core's power corner up or down would
directly affect the other, leading to under or over-voting.

For these reasons, both cores should voted the clock and power rail must
be based on the workload of both cores.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 111 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
 3 files changed, 117 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 7cda94601555..afd2a0e2a3a5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -17,14 +17,14 @@
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
 
-static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
+static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
 {
 	u32 value, pwr_status;
 
 	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
-	pwr_status = value & BIT(1);
+	pwr_status = value & pwr_status_bit;
 
-	return pwr_status ? false : true;
+	return !pwr_status;
 }
 
 static void iris_vpu3_power_off_hardware(struct iris_core *core)
@@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	u32 reg_val = 0, value, i;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 	u32 count = 0;
 	int ret;
 
-	if (iris_vpu3x_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_vpu33_power_off_hardware(core);
 }
 
+static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
+{
+	u32 bridge_hw_reset[] = {CORE_BRIDGE_HW_RESET_DISABLE, VCODEC1_BRIDGE_HW_RESET_DISABLE};
+	u32 power_down_prep[] = {REQ_POWER_DOWN_PREP, REQ_VCODEC1_POWER_DOWN_PREP};
+	u32 bridge_sw_reset[] = {CORE_BRIDGE_SW_RESET, VCODEC1_BRIDGE_SW_RESET};
+	u32 idle_status[] = {VCODEC_SS_IDLE_STATUSN, VCODEC1_SS_IDLE_STATUSN};
+	u32 lpi_status[] = {NOC_LPI_STATUS_DONE, NOC_LPI_VCODEC1_STATUS_DONE};
+	u32 power_status[] = {VCODEC0_POWER_STATUS, VCODEC1_POWER_STATUS};
+	u32 value, i;
+	int ret;
+
+	if (iris_vpu3x_hw_power_collapsed(core, power_status[core_id]))
+		goto disable_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + idle_status[core_id] + 4 * i,
+					 value, value & DMA_NOC_IDLE, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	writel(power_down_prep[core_id], core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
+				 value & lpi_status[core_id], 2000, 20000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(bridge_hw_reset[core_id], core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	iris_genpd_set_hwmode(&core->vcodec[core_id], false);
+	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
+}
+
+static void iris_vpu36_power_off_hw(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	int i;
+
+	for (i = 0; i < num_cores; i++)
+		iris_vpu36_power_off_vcodec(core, i);
+}
+
+static int iris_vpu36_power_on_hw(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	int i, ret;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_enable_power_domain_and_clocks(core, &core->vcodec[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		iris_vpu36_power_off_vcodec(core, i);
+
+	return ret;
+}
+
+static int iris_vpu36_set_hwmode(struct iris_core *core)
+{
+	u32 num_cores = core->iris_platform_data->num_cores;
+	int i, ret;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_genpd_set_hwmode(&core->vcodec[i], true);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		iris_genpd_set_hwmode(&core->vcodec[i], false);
+
+	return ret;
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -248,3 +340,12 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 };
+
+const struct vpu_ops iris_vpu36_ops = {
+	.power_off_hw = iris_vpu36_power_off_hw,
+	.power_on_hw = iris_vpu36_power_on_hw,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu36_set_hwmode,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index e0dc109bbe6a..e2e3e66574fa 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
+extern const struct vpu_ops iris_vpu36_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
 
 struct vpu_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..e67d98b8c91e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -7,6 +7,7 @@
 #define __IRIS_VPU_REGISTER_DEFINES_H__
 
 #define VCODEC_BASE_OFFS			0x00000000
+#define VCODEC1_BASE_OFFS			0x00040000
 #define AON_MVP_NOC_RESET			0x0001F000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
@@ -14,6 +15,8 @@
 #define AON_BASE_OFFS				0x000E0000
 
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
+#define DMA_NOC_IDLE				BIT(22)
 
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
@@ -35,6 +38,8 @@
 #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
 #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
+#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
 
 #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
@@ -52,14 +57,19 @@
 #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
+#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
 
 #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
 #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
 #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
+#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
 
 #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
+#define VCODEC0_POWER_STATUS			BIT(1)
+#define VCODEC1_POWER_STATUS			BIT(4)
+
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
 

-- 
2.34.1


