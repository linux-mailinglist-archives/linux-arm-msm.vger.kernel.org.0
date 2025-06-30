Return-Path: <linux-arm-msm+bounces-63107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A817FAEE683
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADA3C3A62B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0438E2E4266;
	Mon, 30 Jun 2025 18:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJkE7tew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6585A2E3399
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306980; cv=none; b=K5Q9hq/PDtaoXU7MADop4Nft10SGKSlCPI+fOhI26LLtQPpgn5W7afdyDmqjU2tfyeESfc3vRNc2ENckRZ7nSDJJyPXhbT/o6yjc47+URZNwnryCpXpxZ7EoD5LyfMPeL41z5HCWNbO8yTwVnfLOrG30L0OoFcAIFSyEyAGE/E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306980; c=relaxed/simple;
	bh=4z6sPZHX6mU9xcwsBj0a1MUuFEmGFs16ORINfVkFrGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ib0oBUC3P+/ODzhWeNVKYPE4nvOru7ie3ZOqgyUJtQE35NUo4/5kmeI2XK+Xt2Fk0UvItbRfLtNrrvU7zn7okYEriI4bh/Fj+uk3lK4CpclgzBpTMqaxevHv2Q7a/+yskzj3X5QghlfSP2nptXLEZ9vHvmM5c3KaaPlxJUDztoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJkE7tew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFuaQV024791
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IJWy2YzEJyY
	s9EZMMf+CwoyQREsppkk7QGGbGrM/qFc=; b=XJkE7tewXXRhXyHfiZGAANv3t4J
	nadCBC5F5QDRXMcV29Ye0Vvxc2sTsiAwJfl0l/kFPGdjcd/FbZT6RQywEHVj3jHK
	FIt/98/j81qsf9p74xmtv5aaUNxZGvbK8vKiOhfNVGBJMha9ajknn3PJMR5G5G5z
	FHrEaK2YwI16e48YrIdu3pTwDnStMax7Y7ehl1/P/Um2J+4rcZjfmEAqs8eL/83w
	rtKKd3x8s3gjXWNl3oK5+LhaR7KuKP+oTF0ZV9ZnDvuERXXgCCGnoteaszz4o/1Y
	HouTmZ0BGgjR/wqfUg/nLud53unck7cpVLt3KY8QOpolXHb973rOi1OryTA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9dqk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:09:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2349498f00eso44967705ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306977; x=1751911777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJWy2YzEJyYs9EZMMf+CwoyQREsppkk7QGGbGrM/qFc=;
        b=iZRlKcMrGJROO4svVpAUtsTrAHMuGWNSaiN3RAp7yYU81GPH6SfqxCsYaOnClkikF0
         ZEzWumyX7hdoU9SLEUxKW0OiTXB92xxv0uKZqvPrGUqoeDNwFzZN0rTIvSDCORffQ97k
         KKf3LelHQLSpU67PgfwSZHNaz7f7Z5ZTpJcJapx0SWY2IS0OO5Gvuue6t0ZOLLkVQDWx
         H8N7bCir9buik0r9fyYlPi0Meex1jWzlh22d5gV4FiAZ0+8bKkykwiq7zksZxE84Kb8c
         VZtsFNA+tcIhBSB2hKRlGlBEVXsqrDv88D+x6dn3tgBeWJV7XToWVVa+juh7jEVV/9wi
         0tIg==
X-Gm-Message-State: AOJu0YzI4f5HjMlgzF+4K3sBnXe6k6l3jB+W9dLC6xWLU5bfiGCjq1pe
	geQ8D8okCew3jtH6PjZ8f01KEIlrVdKYZd82XeMCsHDyHDBas/qLAjKJt8ICn/OXfWFxIGo4U1M
	o4EVCU+ZOzfCTKronuHeRrUoK7PhgdJkAInuKU1UQkZIaoyrgYXOxakJc5ICGX5E0yBOn
X-Gm-Gg: ASbGncvF9X8FzcpawQWeZ8kt27Q0z4/sQWd9hkP21C45IjeqA5t9wYk1Npol7dJ87OR
	b8VoF6p4zgxCVYKbP5PuuT8pjnz464aGxETt9I7FEo5KKa1hfUlMay5ETro0Jm9NUVtPHKKgml9
	Bm3MQIKy4NYZqTh9Ki2uh0wupEhk0qsE7iiJGQiJ/le78ElmDPlpP4nxAi4TQC0Z/AQZe3NdYpM
	nTivzKzYHuN+AbKBcMPR5ptK+L7r+A9Scvlx3H7CNEUWsWnZzyEchnPaEmsGiO+RD1cIqexoEhn
	VPbwqYFPtk13DkJPQ4zkq44W7eHc1tPDhg==
X-Received: by 2002:a17:903:1745:b0:236:10b1:50cb with SMTP id d9443c01a7336-23b35545a17mr7446095ad.26.1751306976886;
        Mon, 30 Jun 2025 11:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ+Qty+kDBWOA1YlE9PCYg9YlN5CgMFJljWFv1gfYcNh/SM7Zo85y3IlX9e/eOEDwLKBfETA==
X-Received: by 2002:a17:903:1745:b0:236:10b1:50cb with SMTP id d9443c01a7336-23b35545a17mr7445875ad.26.1751306976502;
        Mon, 30 Jun 2025 11:09:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b9fdsm91560265ad.108.2025.06.30.11.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 3/9] msm/mapping: update for sparse
Date: Mon, 30 Jun 2025 11:08:57 -0700
Message-ID: <20250630180903.77990-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6862d2e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Gj4tO84-8EQ2_5EzKZ0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3ITjNRIuMs8Hih7wWXipJnm_vZgKDfv6
X-Proofpoint-GUID: 3ITjNRIuMs8Hih7wWXipJnm_vZgKDfv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfXyEqlc+hiI/u3
 CA3i8rvO64NxI+Fgi6W7/VzP/BQ5h/DjUKLYphbygNQKqGp2pCzTGT/RTKGLuUpY+Z79nOjmWob
 99JdSa04UkJ4uVwRvqVhPWXGhDzKhGNnYnwGNO0PDW3uryKvFyvjH4TXTzJbACElOLrN2uWacki
 UO+rAC0NiqS/E031i1jxPcx8/S+YEfq/kqK5LFRP+H1yht5p1AT3zJvuwYeq2VSCatUpcv5mNcg
 Fj7YONk7BD/r1AUY0/9bIjEIKanoIy9R94hZ+NoDVuussQhMID9iKMOL3wsNAegzhzrXLWZhAVq
 h9dTTiDS2Eg/QyexgsseB/hfJcz3xiyRvpsKhJOniH6Bs2H7Imji48eCirzwRB3Yl5fkBTNhuUj
 ZldAIXxgsBNB1cB4LsrVqfHhnYrT52RM8XXZj3iOuU8YIyo+SCuIUIiZImgXHy6ZYzgp/2UR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=916
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300147

From: Rob Clark <robdclark@chromium.org>

The debugfs format changes a bit.  Update the igt test to handle both
cases.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index ac20ca91d613..f536db82aba2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -148,6 +148,10 @@ get_bo_addr(int drm_fd, const char *name)
 
 			ret = sscanf(line, "      vmas: [gpu: aspace=%"PRIx64", %"PRIx64",mapped,inuse=1]",
 					&dummy, &addr);
+			if (ret != 2) {
+				ret = sscanf(line, "      vmas: [gpu: vm=%"PRIx64", %"PRIx64", mapped]",
+						&dummy, &addr);
+			}
 			igt_fail_on(ret != 2);
 
 			return addr;
-- 
2.50.0


