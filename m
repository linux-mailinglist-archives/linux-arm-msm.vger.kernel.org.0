Return-Path: <linux-arm-msm+bounces-99939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE0IMnY0xGkAxQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:16:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C758832B189
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 987A93051698
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9E432ED58;
	Wed, 25 Mar 2026 19:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVleKZYf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MakCZ1X2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68934CFD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466007; cv=none; b=cGb5NYnJ72BkQMOtUIxlms85+BH4otnvlt3ogKfjNOTmrKY4vlclklnXwlr9tXmdnUTkW9aeE4QME1QGJ0a7zg/2w3afK+Uj+deSN37e1rgn0Wcwkp3cwWxRfFyYlo0+Iv19MZcNB0rH54J35Y/9bm3Di2tMC4ylJPabpdXP1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466007; c=relaxed/simple;
	bh=TQpf7rGLYB28JZgXmqsXqpuMJvlr923sKHW6YRlAH9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pd+HHKlaLLRqQQ4xCs7wZ0CXyFEeGjOqlAClmdk1gxXOAZ6WdSQuVwNDhggPQAx/O0B8TE+FabtOsTOzS/PfqsqBwq9mKQW+gMzt3z3Aqy1+B3c//JnYPOHxwv521kuUpYJcqFHV2c4vikQgXldzfY1zh3bWqU8VQ2O3yE0lpnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVleKZYf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MakCZ1X2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHdkG434073
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3m7jT5meLy7
	Wm5ePWiUB0lWAoGMjspztPS7ae/zcuzU=; b=XVleKZYfGpbpk6i3CO0MRKSdsX/
	Cz5JXS2Aj8nDy020NtjKXU5Bh3hEpwnwrgXWW9x074NOKdvgOl9X/o4Qgl+C1j/0
	v7JS13d7mdDQV0bzVgSGLTRxiCJFCF1GLAmGFSL7f41v0gx32/YPr9kQ0dFKfRZs
	1CbkqIU8mA3K7Cr/tLb3JYaMjoeLuseMYrgU8PXZJrVwjKYo1F8MAZwGcFkjLO4E
	ZAAmvDDVmNZbb6KsdKU+L1zE4D8O1W3ZLPs9Y572ionBxM8WLTpoQ8fhRMt9uWMp
	ja92esdfChcrs6SX5PaXbhWlARqonV8aSBzAvfDPPvzZ+rR+akiwRS5tAwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41414n9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:13:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a032cdd78so619145a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774466005; x=1775070805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m7jT5meLy7Wm5ePWiUB0lWAoGMjspztPS7ae/zcuzU=;
        b=MakCZ1X2d2d0hK1/0jM1nwHD0Sdzo6e0sud0kNlZKE5Ks1Ltpk+SuMpnVJzqXAPZFb
         E/hoN96WrYkryCsLwER5RibmIt0S3GsqfnKRCrDKBrWDj++lktLsuU9bx2FNFyHN6s3e
         PA1FBkHqSwmBbjZhbR0pNz3fYmbHNLTk8Ba44Reho4J1ckuIRxAxNXX0lVg7e2vq3AOY
         zSQUtvRIdmWtz6VCl1WKd8R4n3OkQoWwzIWmwcrXUssdO1LdYitpHCvzdHLieROfXFlD
         zrW96dlLuwbG2FHv83oop6VDemIwG1mMVF8B4xlFsn9VNgSGoOj5DYDhEOg+2rMtTI8X
         ACNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466005; x=1775070805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3m7jT5meLy7Wm5ePWiUB0lWAoGMjspztPS7ae/zcuzU=;
        b=TXMvZly8h/B91ES61B9ahKZaxOuwPLJIVJm0zwjUOcpHXqDkebqUfJkxYg1VQQkTzE
         daERWILA1g+x2wh1jYPjTgR6ch09MllYfh0s0u5herfjxejfNyzAvR3tRtIG0KbagpFu
         /rSs7+HUWlwWxJdNeS4CbhDV5ZgFnleGHSGJ+ENq2w2uZ1VX0xzvAA5e6v6Y71jAgCNw
         hCMtzjirP4rUU6Rvnf/UxvpaqqKhmlEZ+Lnf/l3VKdah2bQGhLKZtmqPwd2UL9joF6x+
         F0KPBXGq9yTTwlYxJuj+mKe3Vo/qAuYiddEpGIl7sYb9D/HOcre1QCPKvHMx85RR9stN
         mtnA==
X-Gm-Message-State: AOJu0Yx0KnHihz+dClKjjZLqq1yeKgUId2+FYIQQa7Uv6GIH3xQuHnqr
	y1rcDKgyeUfTsKPD4hhhuaO2LmsNYelGMX/kPyy9ckdSRGa7MoCk+0pa1VWwYaHtk+NVlKODKaE
	n/NM4c8kXBQjTeCjGJn5kjfWtmvZLWU30E7yTYiZ6MxUYE+aFOuGmVBOek0du4/maVuxh
X-Gm-Gg: ATEYQzyQNrqp3cZD5e4rG0yFTwvt2hqdeoBo474y7c5jmigY36aUIhEpDOk+Rp+SM+K
	oO287sMuAYRiEGGP+/AnKUGKfTyrgCIAVG3dq2TKt62FRWa7my4WY+HCF31EYYtNaJYqgZCHfMM
	OrdynMKVqXRn2zQZ5QIkLYbPFo3Q045YRu+aELqFLxuKiZdlMUAL0fhtahV3Ks7Q1bJX2CSuOAL
	zx7pS1SMmxctZSuVZ0oMLUY4FNpEBmShRRf+8QnxeuhnHBGi5Fbd2y6+0yZ5nlY6sbi3HuAB2yE
	oxeenEBr/FE0rcZFFox8QqXCV8se1R58nZ+FOga7N84ssn9Rc1OK5Rbtoz0onQaoiqKt6jX7BYf
	gL6BC7V02Gf0YMwSb/3K6wyzyGjqD2zCeHEd0yK3UgZMfisgP
X-Received: by 2002:a17:90b:4c81:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35c0ddad8c6mr3937523a91.20.1774466005377;
        Wed, 25 Mar 2026 12:13:25 -0700 (PDT)
X-Received: by 2002:a17:90b:4c81:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35c0ddad8c6mr3937500a91.20.1774466004788;
        Wed, 25 Mar 2026 12:13:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1dd36ef9sm76379a91.4.2026.03.25.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:13:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Drop unused dtb_mem_region field
Date: Thu, 26 Mar 2026 00:43:01 +0530
Message-ID: <20260325191301.164579-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c433d6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Lqr_36QtIFBVL_bOULEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: iazBNGERyXZn-Ca2u4tqk4mEWq3Q7rKi
X-Proofpoint-ORIG-GUID: iazBNGERyXZn-Ca2u4tqk4mEWq3Q7rKi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MCBTYWx0ZWRfX+ZdmT3lxF6G5
 ccP+CJDIjeTKNpfu7sbt06lqUxwQFQexmoXrryls8+C7dPRpmvnZ9Y+KGLW4idtZgT+/0Kq7VT/
 yyTEtUFBihv/IY9yRdCtG06Y1VKZhwCtwBw+2a0K7YFgynVW3mWn3EU7bmaob9bh0FK8UenaWOt
 ySe7CRfdu9NYHEwxfOqEpoq0ZuThwbP4Pznxu/zsVIbctT8qLc7/Iq0W4C0AaJfgX7l2sVB/Sg5
 91z2msvsy6ukAqDanVhemHl1sPx5cB9PGfdU5ANxlss00c3gIcdJLLIz29XH05Urhi+zrvUF+vD
 8xX9X4JCg5yI4h8p2QQaeLjHj9lzS72+PiWrhzrh+NLjQWgJlCr2ZQiAZxLsBBSgVW1oAi9lSt0
 E5GifNGrps1LIDXv3mgVQ6ebM7FMM++MCMKEax4UIUDfVok/0kLsPeXY1d2dPNXdjUNmyVO0wnR
 xzui93xPVcn7dnuuZwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250140
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99939-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C758832B189
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dtb_mem_region is no longer referenced after the ioremap was moved
to respective places where mapping is required. Remove it from
struct qcom_pas.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
changes in v2:
 - New change.

 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index c8c143fea1b4..0c9183ea06f5 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -100,8 +100,9 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
+
 	void *mem_region;
-	void *dtb_mem_region;
+
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
-- 
2.53.0


