Return-Path: <linux-arm-msm+bounces-97622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COW+OudqtGn9ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:52:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8628971D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45B313043D57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EEE3603C3;
	Fri, 13 Mar 2026 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrXjEfYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i99ZDu6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E982E62B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431522; cv=none; b=FWIPgLSa2MmH57GYKJjKlumAjQ1ZI4xEpqfjLutw6yQpgd0yB5I9O1NXBcG77b9Dd4KJVEEO95uCrH7dNarWfPgw7uTbrDsEBRhoNJZhxwYn03S9m2BCQed9fWV1KL/epp93cVGOssDOf6Mfiqca+XKbX7u6L/tQTWQ8fnfO64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431522; c=relaxed/simple;
	bh=QSRirznMDMaXNmIvuSv/qvD0guppAKdirNwoCMETCH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C622eoKamo8+b893z31gbcP6dDS6jwy3ohUpKIz5Hj04Y4u1xgWN9okE53QX3ahIGPWNzhYuTy+zsb7TaIf8QvxRTdVS33ncNoIce2yyW9DpIFIH5G6H0mPV66SCDCj/aBCCXMCt58fHz0V2MN7OUmxpIhNdleT5C1g/BAyBjKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrXjEfYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i99ZDu6c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXTNU437983
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tfDB2zdqzgv9P1Va8yM1FU4ETWxbFpiNPRm
	IOg5/fPg=; b=SrXjEfYJLE2O/hLAIq7YO33Q/4SHxqzQEdrY/OtPlTXQlWOYUOz
	S7oTHcXdKmr69MbX9pTery3SqLMkEoJhr+ux5MnQ6HXS3moXai2en/JEIaysdQJa
	+poxJ5OEfgGKHZ/uOdiUoubnWCsv6bbeqnBGMQN8aN50BeRWh7N4DvsWdv22qBHV
	LXfA+dSNSlkBV/NSjaah15tttPb5LtifwZ5TJpOs5H3F8T1OBCRnTv5813x/1ceZ
	KVCPlXbLSKGUmk1iuLP26mQL+4BUov6Z5MRkyUyxi4Ze4/lrXH+J+HHg+MlpmmGa
	+qp7278MQ5U7ONKRGbgAMfnUkmG6rzUdibg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax8xn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:51:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77e5e187so1404635685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773431517; x=1774036317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfDB2zdqzgv9P1Va8yM1FU4ETWxbFpiNPRmIOg5/fPg=;
        b=i99ZDu6cQ4lIy2OkfYKrHSJmXPpEkTVXCy+xd+iwnuMby4rpScRuJk8uwOALUTNIXf
         xKpJzTYwDQqVX0rT6bUKux+ar4ZrBhe3koYRFcZF5YdMI+Wn/Ra32ZLJrhGB308F8zic
         fcmTMpffCmcsMNhanSkqRlHr7LIWCEUHcGNCuxfTj+Xtmc2hw8uRjcV5M0rDWhSw6tY3
         UzBSKhR9wPKoW47NyWCfAc17ZtsaDSPe/tZXq/j/NWeCGCO6wYBqtWYEWOsmzw02OL6Q
         tyQ8LYN0kyRmF4arl2MjiXqLiXHK6kdzj4UKO3+OAK/zx41cFWH5R397K7QHSiJEtV9H
         BLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773431517; x=1774036317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfDB2zdqzgv9P1Va8yM1FU4ETWxbFpiNPRmIOg5/fPg=;
        b=s+GCqTHUtFufB/olvV8UtvnPXLdl80udR6ctswrJngAzb7VQSRe1Jm1e8aQqpmtsA0
         9EP2AENWourMk2mDvzI14ndrzbAo/2jIhkF8Jhsrrt1IOTf+CnvSSUFle4t26T/uNSsV
         u94Q0YhOjM+Fm27/cejDRMz6vw3mWzivTt34CgduCHw5xTBo7QneOOtUUo7GyKwj0TeZ
         aDX1LmyPD94mCwVQ8dTvQnJbYOWj9CH+Gy5GQoKiRPOXGQOc8WbfZLx/OjSKhO6jGVG8
         MJvpVEiqeQv3O94Hrm1Xfrzogaxqwg6Qxhv7gD0LxNpQgWhOujG6jqcuv/aNlX6kghNN
         SFfg==
X-Forwarded-Encrypted: i=1; AJvYcCXO81Z5ENdX2Fdr/OlfDIHWoCX7WeoAfgEPIkZfulgHQYwhnji2iJqc7VZbwozCHVlxy96KJptJswRsOa6U@vger.kernel.org
X-Gm-Message-State: AOJu0YyRkDZd9YNl1/6442Npe/qxmlkOvPmliZ69xwEqzu+KwgP8BM3N
	yKbkMOSBfOKaq1GgDqKMFkBFe92Sid159Jy7zyU3YMHr/rHb/4pvNlCUGwbdCKj2agabfkCmI8b
	/a3dCIHLgSlLRF3F0BeSL+AFpYcF8YmbK4/z6Knyeyh+YSVlnohMpxKu1htQGkF3aiSPk
X-Gm-Gg: ATEYQzz7hYp2go+HkK9rjdkOfOEDSdazCKCENWHiFSi2nR16ntqWGwKyoU1ekwJpDmd
	Y1qKkosLURUk/+Y8SLk+4qj+kNLfAKs838hq8cdL3DyFaoLZOmRmgFjfYwEJfApog+f7tQrg/9F
	z5WLA907GgRyZYcZnj4Q/uUmU8wMHWMI6qCOhEdJQy2iWmO2+yavUI+gB24uHq0rjzTHxrICIIQ
	rd91WN8sdD0Sg8RY6b/d3PLu3wi0JQkAAZI0nX4qJy0p3KU0a9JRdxTsNA3s0qNRSbRkkHDMwLX
	8uzVFusUCoTQraZk09QikfuIvOm5JHE4VRLMM7glmVSe2S1UPpR4dFQuDK4TxCSzBPk7M7RRJBw
	rJ51/sQwd/0JnRSsRAV6QgKyZdt+PiY3frPbzbEvz+QLXd+8TqP3K+1UNLsBbt+lzgnEKO3mnsV
	ZLrEQwY1xbSIvW
X-Received: by 2002:a05:620a:8c8f:b0:8cd:c0a6:5100 with SMTP id af79cd13be357-8cdc0a65885mr191685085a.71.1773431517233;
        Fri, 13 Mar 2026 12:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:8c8f:b0:8cd:c0a6:5100 with SMTP id af79cd13be357-8cdc0a65885mr191683885a.71.1773431516787;
        Fri, 13 Mar 2026 12:51:56 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b22e7sm20112060f8f.16.2026.03.13.12.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:51:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: qcom: camss: Fix PIX BPL alignment handling in CAMSS
Date: Fri, 13 Mar 2026 20:51:49 +0100
Message-Id: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HhuGcUqGiakUw1EVtaH0KwsjqhP2KyBQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NiBTYWx0ZWRfXyZkGW+iWYdRB
 qOnB/M0OVKfsSQe+PG7yPUp8RYQy8Q5PHh2BqE5lXDpWQ1xoEoy0eDDSL9+2n+jFpXTz9QWhp4A
 Hn+IAzh6y018nL1sRu8jNLMR9ie1rCiZiShdqciI61yMeOQcZu63tZCuEgzTyNYnAjQclVXZIqS
 ONr2xbouYWFvwWxqz9yYsSGOBTLT0nyi/sOPlc/44+ZwGcVUtnunPQpokR/0uamHqwPSm/EpoT+
 I8hYpWU72k8qQ7suK9rfjZyTtCHWj3R8pcc8oua9+nCzFaHXd9bg5Y/M16YDtaYscbHbRI6q3Vg
 /L4UPHAB6ote7W+6BZ33kta6bNj5DzTjEisqwvFXqUhw8YJCGCZXmcBIcjnz12DQYQSz3UscOFA
 HS8bfZv1pioheoWRKj//w/GhCgHuvFUmmtKyXE2mEeCHbweaB4Mk4F52QQueXDSf3SdganfydND
 z5oJIhBkIrtBPg0TJoQ==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b46add cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=bjMrCntxDvG4r4YhSEkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: HhuGcUqGiakUw1EVtaH0KwsjqhP2KyBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130156
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97622-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BE8628971D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refines the bytes-per-line (BPL) alignment logic across the CAMSS
pipeline. The current implementation relies on ALIGN(), which only
works for power-of-two alignment values. This is fine for RDI
interfaces, which typically use 64-bit or 128-bit alignment, but it
fails for PIX interfaces with Bayer formats such as RAW10 or RAW12
that require non-power-of-two byte alignment, causing hardware config
violations.

The series introduces a per-format alignment helper, updates the VFE
code to use proper rounding for non-power-of-two cases, and makes the
PIX BPL alignment logic format-based on CAMSS_2290.

Changes in V2:
Move from switch-case to an LCM based expression to compute BPL alignment
in a universal way, as suggested by Konrad. That also means we don't need
to handle any error, as we should support any format/bpp.

Loic Poulain (3):
  media: qcom: camss: Add per-format BPL alignment helper
  media: qcom: camss: Use proper BPL alignment helper and
    non-power-of-two rounding
  media: qcom: camss: vfe: Make PIX BPL alignment format-based on
    CAMSS_2290

 .../media/platform/qcom/camss/camss-format.c  | 14 ++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  1 +
 drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
 .../media/platform/qcom/camss/camss-video.c   | 13 +++++++--
 4 files changed, 49 insertions(+), 7 deletions(-)

-- 
2.34.1


