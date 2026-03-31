Return-Path: <linux-arm-msm+bounces-101133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE0mMroczGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:12:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6442D37069D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18E453078439
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E413A4F26;
	Tue, 31 Mar 2026 19:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTC0Qq/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hjm+BDRG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D193A4522
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984359; cv=none; b=usH/ltOFyrHYuN+RTCBqbKUFG8VISeyD6UYcOaab143V47ldUijpKeAGARy6Gy912S1TsUsC3oNqRSju1fDvDrlyGSqOjhWTbquMn2fyvbIJdW6g3nsIYUQlMcpAzMYBZr/tkX0smZ/Qkol7pcU0FcXOEEgXkOUCVM3SgWtVjm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984359; c=relaxed/simple;
	bh=9iCZ6Y9JZJ0ql4zO6g0u40F5yUinWBuqkF9YlqEsXG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKi8PCCEC4vumbwAORrQJRWYKbth0sqRQL+jnWfrd7shbtJvw5O7QI5hxY39G8wsrEkbiQfzdE9iCPNXfEodgLH0+B9OMrq/1RvAXMqWHB327RPrSh9oTyMZyF3YRqI6UQ/KYl6rMtKxhg6jHtJuKtq/cftQaKVbu23+9+BGrjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTC0Qq/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hjm+BDRG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VIGrtN3081358
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gqpEz+RTNlp
	93OOiv3jLTTu56K0Z1MoYtFUupVB0+J4=; b=FTC0Qq/EPFGsi9+vm2F+Zo3I2M8
	maC3yIWhKhGVjMgCvQqr4XIK7gs9ydNHh7FYOzVgUAGZG2HvgAZ75Jq96KClMt6I
	P9B+cv4xTu5QtZY6vXbi1yh8B57QYqXAOzm6Ja9vphsdkdvzRUs/Jcd7VVNwiQdc
	XeIHJsF+aCv04Wud/1MFcZUBxbUqcXYz9DKtN3ujlOrQWVGgjId3TavnBpUECMj+
	ezyshsZgI0TveLaYs5xlnYZLiDYcDpIxPsGmwFXGGZDNjk0CGByM69ND9HY47nhl
	DpQztL7uq7BWBFfuAMoLefVqfnneZXKd9aeAAyhztQqrunHsV5RsZERZ1Lw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkr6h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b23c909256so51965045ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984357; x=1775589157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqpEz+RTNlp93OOiv3jLTTu56K0Z1MoYtFUupVB0+J4=;
        b=Hjm+BDRGI4bg6wSDjvTIiSNhahvT3PR3JkAG/mQD4hxZbLpfXTeC1Xh1p5eJcSp9YG
         jIqWxsrUAfm7NSW5xDVFEE4jRS1Q7a2lA2IsUTHtaTfNl4SOl3zAe72oq8ocGTlLnuRq
         O/BuazhswRS91ImVz2oT7L+YhASOkTZSRjN3BqceHL1lw2vzRHzkTlzxorVoDIg99SHe
         C+W2cPZMJhYt91pabKKkOxvpjaGpfokcGSnJjGbMmKQ3P6CPtK6b+mHlCIsGJ9QWlalR
         sLeetAOsJS81rY9/0pXVgavi5mXKQo5IVq8VKVZd2+nPaWZspk9rIYaFpf23t202yMXh
         vlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984357; x=1775589157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqpEz+RTNlp93OOiv3jLTTu56K0Z1MoYtFUupVB0+J4=;
        b=QYjBA+da0s4G5FLkmX91xRNTq4L9qkeUIfAJJnrynXRUy0XR9YDUzQz9MgsDXsBhBQ
         z1fuAhhm24iSZiSVQXueC9EVedjSoaZpDmsvfqOR3mVGBp9sDlAAwTyxD8+oNpGXlZCe
         tgZ0toeBnf4OYhbBcnFSUQIcnb4K3OJgam5rkpl30QJACbrhJuSRejZl9U6sexAgudkC
         i+qk/CPyKQjRlZ80iz+DyDYsi926hpJ/pYUrcYiXMKnzjfeoUxotvaDNj/ij0qx/u+lQ
         Nd+XS9XNbBKEgSwBHg4sltDvsFCv3vT1TXyAwZtWiDSV1ktpJdDFdQYYa80vTLZ6ZwaA
         sIcg==
X-Gm-Message-State: AOJu0YwdXeSOgyYDBhhIJQMYxZ4oLab9v9cA+xrOrXwGchxt7sJBLp7d
	UPNEPNYl9U0nCsZd56xFAd+M65/alBf/xBYuuhqcC2Ha5njLjhgWMUr4yqFFTUlpkxnrEOoZJDv
	BUPBXPqBUCAytwhXmyopkhp5FPYku2AbDe4xhIF5ICuqxIChYoryIAvBoWTEGITtMZMWy
X-Gm-Gg: ATEYQzwg5897E/1BDJGvK2ZjV/qhWbvfekP9KhOduBWNO3tcRbNNymHC6e/hE+xH5O8
	/SxrYPmF1mSU9srdrx76mWOk5XNOu4wUiRE2vRrrC05A82e8BtVWePfXbCdeca63W3hjhZ8Ypay
	IHMVuUWKsBgamdK4J+Zi2dKhEAb587xnmkhYfyFvsc+5L4Is8zg06hgpSu182GTZdEx97fPfjnX
	jgeOXkqGuk6kDGsIH86XUT5aDZPEsLVrRRkuLPEGm2TpvZmqbD1pDwTjpmo2DjuYt0FDRSq2Rt/
	pjkHVHyrM0VEk/kQoKdi7GkebTTgKcT2VLgUA5B9MB2DMBpf1Z4wjj3xSXjdH3XrgLgoxREmN4Z
	X5QYmnRgEw+kj0NQB0TU/LgwdhkJj4xdkTZSZ5FxdLSCpUGiO
X-Received: by 2002:a17:902:d592:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b269ac58f4mr3535235ad.18.1774984357230;
        Tue, 31 Mar 2026 12:12:37 -0700 (PDT)
X-Received: by 2002:a17:902:d592:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b269ac58f4mr3535015ad.18.1774984356711;
        Tue, 31 Mar 2026 12:12:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm152784535ad.19.2026.03.31.12.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:12:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 5/5] remoteproc: qcom: pas: Drop unused dtb_mem_region field
Date: Wed,  1 Apr 2026 00:42:10 +0530
Message-ID: <20260331191210.2019758-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
References: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfX8sD2VCHMzfT/
 D0b2sp5KlUOniIgDnLrP/+cv8Dn2lRCDE8q0XC2siNoHYhi7seASNgKPmBvoo8OLrnOzTP5gUgF
 3FfYI/pKQwpkhFKuSIpbp+pnJojZxVHBACWm4vnOviqxh/TwkT6pyMM7hscwbUlcFZ8lEuoNV6E
 o5powouW2RZ3FOk8AsfNJcR6NP+3r2pxl1RljLtKgHUNbGCtBZ+1rtCYI43FBGe9hu3//E1QVhK
 pIJg3ll/vq6LmGVefPcGSi8QEEoWR9QJ8aqpI0bksIfcTRIKvdHsnNjwi8xWhzCrUlJG2FMPEX6
 V8yPX84Gf/R84tE3/F0bhmMJRfEWQmx+j9lkERg7vw/r/jUyaSwn211GyZg/3VDGBXqlO6wKo9l
 /JsMvKe66aYgpgifFC6EUldLekhsG24tMXbMTUsqNwHK6fvmxE0ARf6GTgNhXHM5AopCibyOk+p
 d7MybIGWYwFW5zeO6Eg==
X-Proofpoint-GUID: XNrSaPJ8DUdTajDjD8iJnC46F6I_hyEs
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cc1ca5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FNOO_Oh7U0b_lUwsflcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XNrSaPJ8DUdTajDjD8iJnC46F6I_hyEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310184
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101133-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6442D37069D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dtb_mem_region is no longer referenced after the ioremap was moved
to respective places where mapping is required. Remove it from
struct qcom_pas.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
changes in v3: https://lore.kernel.org/lkml/20260325191301.164579-3-mukesh.ojha@oss.qualcomm.com/
 - No change.

changes in v2: 
 - New change.

 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 53780efa8be8..e279f5060e46 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -100,8 +100,9 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
+
 	void __iomem *mem_region;
-	void __iomem *dtb_mem_region;
+
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
-- 
2.53.0


