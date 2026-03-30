Return-Path: <linux-arm-msm+bounces-100765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEWlMotXymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:59:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335D359D30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A083F3023D92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164B13C0628;
	Mon, 30 Mar 2026 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2iYTZjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nv1x/nl1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1A3C061D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867937; cv=none; b=QLTfDECU/1mTriBll0t4zu9h7sGliDrbCW/l8msoCnES0DW6tmSQXUAYlFhBxvx5fCB4blWR1nmB0eMr+/UCGpnlvsMuU/8nXZ5hyOCWHIbGqjOPBhPpwgoboKcLVVCHu6Pd5pJxiMNTJRKd4xcyoXHwvCFUMiWp9heVRpxXDhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867937; c=relaxed/simple;
	bh=VAeKGz5nlCGqZiTTERiHlALqv/wjQTUfnj68PPe3Nh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bAMpbNxmB1bYGsc+RnO+HtVdZ2USEmQVBrWNHoVnRsxHbm2G9zMvRhZwhF9hfHvik+YJ9L7swDbctXPmHsLJUVcaVt/BgGLriTNxl0mCKuhGVewNu5Cur2HYiO7FIWKH4MxRl95TeJrhcKNW+BhuqhkGHI2AFawFcKvAae4So2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2iYTZjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nv1x/nl1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9ELNT1753671
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nVT/eC8tZapH/D8qOhk32d
	PruMQwZ5Yp2zAVcHrMiZI=; b=f2iYTZjpSbBOkjRllIyjpMZlnKtcBcCphrUgjw
	eC9lLTg7DGnNJz8ynedYetBdEA8/zXr+dDaKnZXZ4ogbzqpPRRlURm7Eacw8SaBG
	e2llx0D+UdjPGell0a3RNSW8Kcw4V9SaA5UBIetBPupr7phuBFtHbr6QOgsstTW/
	DCmLZb+KdpCrY5Y+MeiOe+u5nvkRXDOlrdDcWSnv3UIb7rib2lU8JiDMtvePi3MP
	u21gxwlT28mth06XdZ2WYpIIiT9CZvcNWyRYdbrGtTWtEdBKac7qz8KcPhVycV5z
	c2ZfR5KRf3Yy6zY6imOo5+2y7ksSHE9/pmA344Y5PzXIaQMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkvtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:52:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so142107231cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867931; x=1775472731; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVT/eC8tZapH/D8qOhk32dPruMQwZ5Yp2zAVcHrMiZI=;
        b=Nv1x/nl1dwDk07OgGnwfERo0eJEA4VEKg+eTX9UGaUQTNBMhMu9Ef21j/v7084EyHM
         2r5Os78zWVbg8HRffSR8LtLp1VQhRLPEduLLH7ErqZzOIaQmGsFnN+Dmq9665HhymgPb
         tiR33ns1lN+npzkRuGt6Zjfbtw+yk9kyefD1tBai6utIMeT48YRFOxC+zDlwvdKSHIfX
         t0zjIpM9aYDAxMnoDrFAYNbMrjVf3SGMS6po5OoLuUP5eAmssEhvQWzoTwAAKU8+FKA4
         kg2+WmQi0q/BRbVBfdQ5/77tIbf+zQaRkt1ki0G2d7SkepBgrd5W2modFBb0OEPw+4Hs
         zVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867931; x=1775472731;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVT/eC8tZapH/D8qOhk32dPruMQwZ5Yp2zAVcHrMiZI=;
        b=DdxA37yMhki4wTAFGqXCfLVCPG93u+SvkIwAYRvlxAbjBfCUVkU3KmoLm6ENkBUSp/
         q2NIvac126ZkH+w74nCAakT4VOgR0PnWVRdU2n6w+ygDTtScjZSfPqUYwiYennNlyWxU
         ipBCb5mmtFJfX+ccGY8sbG/t0NjC/u9M/g0GcA+w5ybJPfZxCIgdJSqgfnmi1RAAxIm2
         lZjrF0kEuSbfkx3yqYxSWirDGi1GZh5a2t5vTvRtI1Babp49u1+7NKrqATyZsQaRBDMw
         k64KVGWWZVbUhLN30NdaZ4srYaGT/rhMnleMuNbo3dl78LiFVWDKSVwDH2j/ask1HtO/
         BHVg==
X-Forwarded-Encrypted: i=1; AJvYcCVsek7FMlrtzvrrlFaJ3zi1gb5jC3ACn0ElAjMdIzrFgXeSJ323TexZsGxwnHQdhdhk9rm8jJ0KG/mwxViR@vger.kernel.org
X-Gm-Message-State: AOJu0YzRqTVk00ikowbQU8HzW33LHxwOYkD6rFHo34OCthmloJat0oNV
	WrYGNWnNlScGBRZ4FnRsH32iS5u+Ys+9zlkgZHnpi3pOcoMEEFbVII3jNqHZbdoRSEVMHlw+exE
	pWpWSq7zvINsMBotL2e6XkyAHoDGlmF580xmyJgj0TvJvonUDxd+bBTYXLsRiSLGmfAp+
X-Gm-Gg: ATEYQzyGnlX3M3O/ppGbEHixMvb8Muyw4fWuolzw9nzRpU1P96fWn5Q5BTqMF1WCpbO
	8IHY4A/XkR/KgUOU9Bzse1Lpgf64DC8OSabvER8l5CznP3ryE1rZMISp0X4MbKadPUtHDmO6XwW
	7MxmZO31LvSzeAx5FLhX4StjqVXodp6BPOCq2XGpyrTrEavIIp3/WfVGuGqWfsfrWD8DbLvUbzz
	yNZrD4CGmcxx5ttpk2BxOgZtVkYfCv7FgqvrfjFDcuNtJhTVzJVGZUBhvtnEU7j5ppMYQ9B65bI
	+wQkrLRygpvta1Q/gucvGcVQoT793G1qaCyaWKw5ZX/IwXiY13kMs1Kzp5s7ARvKQGF0R2ueKv7
	D3Xjz9QA9yb5fErJQq293TjSb24kKV1ThUkYp2Jz6zCeXUNiWkw09jDsHBB4h0OPTWSWSW26dTq
	ahxlTinGgQPrva2g5Bvw7qjLohS5wV0EtDY54=
X-Received: by 2002:a05:622a:4807:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50ba39bae92mr152599311cf.64.1774867930864;
        Mon, 30 Mar 2026 03:52:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4807:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50ba39bae92mr152598921cf.64.1774867930238;
        Mon, 30 Mar 2026 03:52:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm13970521fa.21.2026.03.30.03.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:52:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:52:07 +0300
Subject: [PATCH v3] media: iris: drop struct iris_fmt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANdVymkC/32QTW7DIBBGr2Kx7qQMYMd41XtUXQAeN0ixnQB2U
 kW5e4mdRaRa3SB9aN6bnxuLFDxF1hQ3Fmj20Y9DDvKtYO5ghm8C3+bMBBcVl4jgg48QqB8TQde
 nCKWUsnLC1tpwlrFToM5fF+XnV84HH9MYfpYOMz5+/5HNCAgtca6UKqWt6o8xxt15Mkc39v0uP
 +zhnMWrR254RPZQaxH3WlrU1Ybnvg4b6DzltdM6MbMmEjyKfGqKga7pvTcxUWCvF2mKpTXK5wo
 zDVOEvDbEvhYlh07LmoSmvdL7Zi7/wiUi6ie3KLqjP0G8+OQO0JbayM66yii7SefWyFdushcHv
 Ooq5ayVaKiZ1RYgxH4FTkeTujH00JpkwJWu5lSrFk0eFDGf5f4LbDbovhUCAAA=
X-Change-ID: 20260311-iris-remote-fmts-53336c2b89a0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=20223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VAeKGz5nlCGqZiTTERiHlALqv/wjQTUfnj68PPe3Nh8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpylXYb0ItqMQGyJqyK4CG/QvkRofE3NuvTZ9Dt
 zfGZmFANdSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacpV2AAKCRCLPIo+Aiko
 1fqNB/98LHSH/yeibupprIRGWEgZSDxD9KgY4ztgBwicPVQg442K66NL0jOKh5KqLtsspUsiBV0
 lpcB3fkcZ1jG7hTWjeFSmn4oGJC5ji+Ar9SYoiCUSUdDYDNXVjJRK31DyjkpHZGe7ixlhwr8NeO
 CovNEZhNugnDz254sSKnYT0aCS+SxPVS/TCv0zL77XTB5Ni1Czmw6k38+U40AoD/m8XgMVBKGU8
 5fnY/kiZ7+YMLoW1Tp8BBuzawhATAjC5Ss/t31LnhFZ3ZSQy1dEracVwMPF0Tw5Gzl9Qjl6KAtd
 pEac7jGSzVZJ8azvsbU8j/xrzrvFFgIYYd9rfOBK+jjSbrQG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NSBTYWx0ZWRfX/izM0LoghOTL
 kF6KmTYp49u5T657gVfe1YFJY1jPsHchgpZwtX3GIYzN6yLaZrYEUmNxt/svzoqMUPbhvoa5DoI
 Lj0l+dNcM64G69Ql72ZTgcqe5046Fqyt2nuRfOIYpHHLSkR/5PicEXaJDEB093+PAjM1JWBzZFw
 Nl8z+EvFq34gsMCdJ2bpeTHtMjsx6qgu1ACcpBb962uj5FGD8Lh1uru/eBaTBXFcVI6dis1XvzA
 6rd8CPvtaZm84ik1mpFp9WVXx7dfjLMa+1uo1wgMIhSaSOy5ksOASxgAL3wyQ7pd/8QXFnjweWD
 E9hYYpyLZAvpwbzi3wCB76g5VPuwGUTSVvJQFM2Ks0csZtfBkbE+v4vs8gwg5FZAXIUyBcU3Sk9
 iEWrnyCLArgtPxM0dbygs9bLX6WIc+UO3ifCbWvGMd8cN2Ek7l2SH6MVV1BgWY1NO5xo8ocNy8n
 b1jBW1BjSmPUihDv3Gg==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca55de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dcVNos7z9-UCmku5ySMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: kzu1SfOHYlwbgnRxEdAfzz4f_rWfqC4a
X-Proofpoint-GUID: kzu1SfOHYlwbgnRxEdAfzz4f_rWfqC4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100765-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7335D359D30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The struct iris_fmt unites pixfmt with the plane type, however the type
from the struct is not actually used. Drop the struct completely and use
u32 pixfmt in all the callsites.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Rebased on top of the 20260227-iris-platform-data-c5c80e84d1a7:v11
  (Dikshita)
- Link to v2: https://lore.kernel.org/r/20260313-iris-remote-fmts-v2-1-edb11793b196@oss.qualcomm.com

Changes in v2:
- Made platform_fmts_sm8250_dec const (Dikshita)
- Sorted entries in find_format_by_index (Dikshita)
- Link to v1: https://lore.kernel.org/r/20260311-iris-remote-fmts-v1-1-de0044453b68@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  5 --
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 17 +---
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 22 ++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 78 ++++++++----------
 drivers/media/platform/qcom/iris/iris_venc.c       | 96 +++++++++-------------
 6 files changed, 80 insertions(+), 140 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 352af99699dd..476efa4d6a03 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -29,11 +29,6 @@ enum iris_fmt_type_cap {
 	IRIS_FMT_QC08C,
 };
 
-struct iris_fmt {
-	u32 pixfmt;
-	u32 type;
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a108173be35..0408d51188b2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -280,7 +280,7 @@ struct iris_platform_data {
 	const char * const *controller_rst_tbl;
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
-	struct iris_fmt *inst_iris_fmts;
+	const u32 *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	const struct tz_cp_config *tz_cp_config_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ff8ce078238a..00d6244bc92f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -28,19 +28,10 @@ const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 };
 
-static struct iris_fmt iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_fmts_vpu2_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index c3b6cd6fe777..6180104f3b94 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -41,23 +41,11 @@ const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
-static struct iris_fmt iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_AV1] = {
-		.pixfmt = V4L2_PIX_FMT_AV1,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_fmts_vpu3x_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ccda3b9fb845..ff8d664558af 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -67,23 +67,16 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_vdec_formats_cap[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = inst->core->iris_platform_data->inst_iris_fmts;
@@ -94,25 +87,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -124,18 +113,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_vdec_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -143,14 +132,14 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	default:
 		return -EINVAL;
@@ -163,15 +152,15 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
 	struct vb2_queue *src_q;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -179,7 +168,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
@@ -228,7 +217,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_src;
@@ -266,7 +255,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->crop.height = f->fmt.pix_mp.height;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+		if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 			return -EINVAL;
 
 		fmt = inst->fmt_dst;
@@ -295,16 +284,13 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aeed756ee9ca..2398992d0596 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -85,34 +85,21 @@ void iris_venc_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},
+static const u32 iris_venc_formats_cap[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
 };
 
-static const struct iris_fmt iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = {
-		.pixfmt = V4L2_PIX_FMT_NV12,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_QC08C] = {
-		.pixfmt = V4L2_PIX_FMT_QC08C,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
+static const u32 iris_venc_formats_out[] = {
+	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
+	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
 };
 
-static const struct iris_fmt *
-find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
+static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
-	unsigned int i;
+	unsigned int size, i;
+	const u32 *fmt;
+
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt = iris_venc_formats_out;
@@ -123,25 +110,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
 	for (i = 0; i < size; i++) {
-		if (fmt[i].pixfmt == pixfmt)
-			break;
+		if (fmt[i] == pixfmt)
+			return true;
 	}
 
-	if (i == size || fmt[i].type != type)
-		return NULL;
-
-	return &fmt[i];
+	return false;
 }
 
-static const struct iris_fmt *
-find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
+static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = NULL;
-	unsigned int size = 0;
+	unsigned int size;
+	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -153,18 +136,18 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = ARRAY_SIZE(iris_venc_formats_cap);
 		break;
 	default:
-		return NULL;
+		return 0;
 	}
 
-	if (index >= size || fmt[index].type != type)
-		return NULL;
+	if (index >= size)
+		return 0;
 
-	return &fmt[index];
+	return fmt[index];
 }
 
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 {
-	const struct iris_fmt *fmt;
+	u32 fmt;
 
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -172,14 +155,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = find_format_by_index(inst, f->index, f->type);
 		if (!fmt)
 			return -EINVAL;
 
-		f->pixelformat = fmt->pixfmt;
+		f->pixelformat = fmt;
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL;
 		break;
 	default:
@@ -192,14 +175,14 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
-	const struct iris_fmt *fmt;
 	struct v4l2_format *f_inst;
+	bool supported;
 
 	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
-	fmt = find_format(inst, pixmp->pixelformat, f->type);
+	supported = check_format(inst, pixmp->pixelformat, f->type);
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -207,7 +190,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (!fmt) {
+		if (!supported) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -228,17 +211,17 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 {
-	const struct iris_fmt *venc_fmt;
 	struct v4l2_format *fmt;
 	u32 codec_align;
+	bool supported;
 
 	iris_venc_try_fmt(inst, f);
 
-	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
-	if (!venc_fmt)
+	supported = check_format(inst, f->fmt.pix_mp.pixelformat, f->type);
+	if (!supported)
 		return -EINVAL;
 
-	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	codec_align = (f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
 	fmt = inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
@@ -281,7 +264,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	iris_venc_try_fmt(inst, f);
 
-	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+	if (!check_format(inst, f->fmt.pix_mp.pixelformat, f->type))
 		return -EINVAL;
 
 	fmt = inst->fmt_src;
@@ -350,16 +333,13 @@ int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
-	const struct iris_fmt *fmt = NULL;
+	bool supported;
 
-	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	if (!fmt) {
-		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (!fmt)
-			return -EINVAL;
-	}
+	supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (!supported)
+		supported = check_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 
-	return 0;
+	return supported ? 0 : -EINVAL;
 }
 
 int iris_venc_subscribe_event(struct iris_inst *inst,

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260311-iris-remote-fmts-53336c2b89a0
prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v5
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-change-id: 20260227-iris-platform-data-c5c80e84d1a7:v11
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: ac7f4d5dfb5cfec475ac4f3dee8f26077b5d1ab6
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-patch-id: 34d473ba50399f8cfaf583f4def12de776aad65d
prerequisite-patch-id: 5a6a2b41c9312687512db5d12bac95114b8d8719
prerequisite-patch-id: e6ec4cd9eb5e93f3443f5f496a1b990a95b5d96d
prerequisite-patch-id: 4be4bbb454444d6f314c2b6ad6a73290184e6d57
prerequisite-patch-id: fd9cd7882f2a8f1b6141f48ff5c3da708839d03f
prerequisite-patch-id: 952471fa5477280d399978c05fbc9bfe6d2d33b0
prerequisite-patch-id: 01c5b37358de833f85de1954f770fe0489818a16
prerequisite-patch-id: dd14b47d6cd8ff14d1bc78c187c061f6fe262fda
prerequisite-patch-id: f4eba0865e7f91bce3fb4b2c627ee123980e0ff9
prerequisite-patch-id: 72984784b916e2d94ede8ab7d52cc0dedfa37c41
prerequisite-patch-id: 2fabf4e36b4e4f74b27fe75133ab8ba0ec9b6e3d

Best regards,
--  
With best wishes
Dmitry


