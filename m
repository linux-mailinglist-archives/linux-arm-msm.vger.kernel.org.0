Return-Path: <linux-arm-msm+bounces-105424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAHYGzOq82kd5wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:14:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92C4A753A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F6403059322
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AD647DF8F;
	Thu, 30 Apr 2026 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftkVCqNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hg07vx8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F2547DD51
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576422; cv=none; b=mk6VJ9fxpTkDcwu7kjedMc33O6BMSv01JrmLdp890dce/p64nSnDB25cRuG97jPrs1ljoxZMb8jJIlZtWAmExL+dPKlSajsuiJwqmwmzVIRqd6odJ/Z8yZp7tm0VrdwcfTtAfSyTSu36Px6M9abpDdGSTnj+PGheC/iaUGjflkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576422; c=relaxed/simple;
	bh=kD4ecpTGjwK5qwh6hLibYlIp0vrFZGM+vF3SHumvgwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oy7IJnVYqurULRcslo/snkC7nHAsU2RKSDSQ0WGRbPUNhWenU3bVWoH5yymiGmBAgj3In/SC2zRCtXM3JqYDBdUAzOf0ZLkg3IrHx5i9HkCKbN5Ff0WGw/sBGYJ0U2syncJ6bMfrfk+/U3YMZL/Q2e0Z1rW/G83xsC8Wd+KMKnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftkVCqNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hg07vx8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UF2aRD007768
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WgDI7C5Mlq8
	cSRlS+CF3UfzqdurX3EaCG/jh2n5zBAg=; b=ftkVCqNFaNbIgeXSamlxbbLwYnY
	syxYaVCSFZIzQQhV5VEO6b3/HKCs1HW1cm7GrG9UwF7C/bX5mSuxDXYxuTrNn1LC
	PPBl94sc9Y2wJA7fLyfMNcsKGNjVhNOUkQ2fNi2CyfCWRw7nL39VTMO+b2I0RSVf
	MEwNuiWPyjQdOxqeA6ncM//19bhmbCNctAx1EUtFckhYCIOoqOW0rLrjAeDC4ee3
	N3oI+tyNHwri4g4vibxuOKZyN+H/fuYmVI+mLDZIZ5BKQ8g6xP3Ssr043pSHuu8l
	6UCdLm2BOO204ITSXknJVYTHpTq32XiRcb3c8giUNVBOCQZLMpC2J9RrCjQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54wamrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bce224720d8so711265a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576419; x=1778181219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgDI7C5Mlq8cSRlS+CF3UfzqdurX3EaCG/jh2n5zBAg=;
        b=Hg07vx8nDPFmZOTFzA0Ki+AUggQqGYxZV+J5kg56FOyHW63T3o8J/WxBb5/K21ex1a
         xh3jbFmATYp2amh5AHjf5hTP/kWr/MIfoHy6jGt6k1QHf0GwV3XzgZPGx2oYvqUVSC06
         yivI8NsQhymaAbFskmhPf1Isxe72Nqny8aBlCwqqjxJW5HyfyA9e4ccyCsl9T+VoCMvL
         U7cUVlnVZcsBLjsSL83qAt0lVbfKxWJcThDNIs+Wepxozja3FUH0+cUu8YbCCnuyK5IJ
         8mJuOG6n+7OU9di0fndjs7h4qSibwweSsQ5TzfRvzRQfwUpEW9A7dGxSzvhSTqd/X4Z0
         gr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576419; x=1778181219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WgDI7C5Mlq8cSRlS+CF3UfzqdurX3EaCG/jh2n5zBAg=;
        b=oTNdDNi5WqFlIqrA0mCIspjbsfUgaKKGru9Etv/RQJVQ14u3N18bEpbKfu55dDSN8w
         8BB6XgdolwIw61ndo7+THyBd0a3ldblv0ft91nXAqjkcZ/oCvt53jTgihC1cceXbqydK
         RuhEDqiWUTbfTHK1iVMz63LfJBFYZuabrFhSUB0b967RQNd2HsiI2tOa9k0bRNMjoIcm
         dMvk79hN1yhcGzOVCTUxcQBVjd2isLz/qdYr22AiaFuKYR858yKatbZpzx7pc0Vwk9k3
         4h8Y6QH0Pr9tWvM+5Ad1TvZKsb5MPOuK+wf2tXygMauZJQYKHs0pJVfckAuzPLo84iFV
         paZw==
X-Gm-Message-State: AOJu0YyuBg6jJ9VhLEOXuNpHek3Dro6DkOLA3szF8YpNG5zKsWk3iDdh
	P/RQmDkH/vZ7hw/CQCoCyz7IP65cqUb5n7M0NVHrQZYVxqXtnxGpYSlKlkMSASN0eWL5Ct1VDaN
	h5nNwtt9+LomPZ83Vvl8w3GOFr2hZcfMKdS7zZStpowZ1hO9jvBl81zTWAlHWhjPtITiC
X-Gm-Gg: AeBDieud9QnpoyF0DueVr4wzmZ71D03Eiiuobui+V5sRCbw1/QjbOSYPYsBqe4j2bTY
	gPwrzond9KYX+9f5Jq5CkT0NfRuWgPNzPk9FEcxUN6eGigpkHSmDuDJoIygW8SHMbQRMCVWXkOU
	ryTZyNKaCAvb4DOFTR3MGIGr4YrsUoHf7H9Z0FVM/gWTvEhV5J1vxUcTaM9wAc9rUCotVEDaW8s
	ibS2voQoEGh9ovW3+ADhSqEc5WEWfvfaDBtUMThWVq8Mg47FTHdbhttRsSQDbdWzSH9XYk7Qt5k
	VU0ycTUwXd+aDZr15A7T5cV//IWG20GxO445nAILSC3LsYrOMv4fKErgLRP25sqAmn88wHCkbFt
	6CmNTyLHE0563fxltsVQM0dhfeL1cxxfhojVVBgOvYvDAMc3A0cVx16uuHrk=
X-Received: by 2002:a05:6a00:2e1a:b0:82f:2319:7d4a with SMTP id d2e1a72fcca58-834fdcdeac5mr5459227b3a.31.1777576418748;
        Thu, 30 Apr 2026 12:13:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e1a:b0:82f:2319:7d4a with SMTP id d2e1a72fcca58-834fdcdeac5mr5459192b3a.31.1777576418185;
        Thu, 30 Apr 2026 12:13:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region field
Date: Fri,  1 May 2026 00:42:52 +0530
Message-ID: <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Aj_7S7HWdToXZchInhNkcmELJwtD2Lzs
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f3a9e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Lqr_36QtIFBVL_bOULEA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Aj_7S7HWdToXZchInhNkcmELJwtD2Lzs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX9gN+/Ap03mJ8
 fyjZBvsv12hcVBxi/M0i/A7Xa7Z4QBvGHzqoSSCgXTH0H44q6RVaPG/A7QnmHpk7jtIG6MZf80l
 EAChH+ri/nIhHV9wSFpG5mEXcocMcXMwuUJCSkqOvUZeMF7okMe0WDt5axOKkRgyfjZD/pf8mZO
 2pnRfAvlymsq8GjxJPi/LC1Lp+LkvXZHStribCAUBYYnE2m6Ef3jmrG/4kn0Ke8i2LA0KIBJgg0
 gawcrklTzyj4ZCn6YHqqIZZxA5F5djTJsEjKLH4cVatc5BQ+v0vkuOSCoInG2S0GXM1R76nbfU2
 vP+JHH7CoafkaLHm0B4rPWzEA/DKUK1Ya8QtFrysWx92UsUFAsJNX4kbwollkK31ry9JruoaCDt
 pLUYWUjYDZpdjrxQ3plw3o9Ipjd8hAJTl9sVwlDi9IDAc/ZbVYs3ZbEwcPZSfMHkWUjr6RqQlW3
 v5mO/DqVRgJo09+Ck9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199
X-Rspamd-Queue-Id: 2F92C4A753A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105424-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

dtb_mem_region is no longer referenced after the ioremap was moved
to respective places where mapping is required. Remove it from
struct qcom_pas.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 6f9fe38fb1c4..5be3070fd52b 100644
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


