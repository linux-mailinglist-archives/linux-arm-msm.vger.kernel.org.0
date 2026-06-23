Return-Path: <linux-arm-msm+bounces-114201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LKJqIiF6OmqS9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:20:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B15836B7070
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MDTJXwf4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f6VoG+r1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B64F7304509E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D560F3D567E;
	Tue, 23 Jun 2026 12:20:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89D03D45CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:20:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217246; cv=none; b=k5rlkxGE2GKazWYlM/sHG8rLkwOYMaQrfrAehXjJoL4jdDEwz26EoVqsS6VgmeeDSW7dQxAIjbjMltN0VrwsKGvcBjsJq5B2D4bsX2Kz5ihX4Qlnw1EIbMeYM0kEDVlPjR7Z/kaKCMK/hnDOdKR3qjZHb7YKE+lxZMF18bTCkAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217246; c=relaxed/simple;
	bh=+andxJoQaxh11RwL5Ar3DWavOKD9vT0Vcjr438MV6Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LDlpewXoQface0vgoi1U2Q/US9WiVNCmcIMdWcKPXXiCk6BiY0XiFHLTzmiVlEQ4J2r4ZAxS3L7qKRSxs+WCQm8084AIaEI+TrGoZg55Hv+uMP5zsqHKBEvPfm1LhdkKdnmZAtM5/8XUQzLrewVwN3T/SIOq4PIft5HNXqA3JQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDTJXwf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6VoG+r1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXmHX3668729
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+KblVWqnrcQ1YGvHTJZqI/
	1q++EEgqUk0YUHE+Mq35M=; b=MDTJXwf493TWigh9NJNfuYpSVEBYPxoCmWI+yv
	WrU/nAcqPopzAuR9Ia5erv/ccTMfF6R24bDoFyfKW36UPjwIUjJypRvq82nlF2Hb
	XD44LPyrC3g3XWTDKOZqCMq1MXraXCsoOp0v3D9qfQ671lzSqYEdLKxPQtgDZift
	vWUhCo8JnAyiPfTj4Bipsnbfvt+wJye2sa8SdGmORF4g3/oz6TUbu00qa8nnmyLs
	z4oZ/L0eMwfzDyfLzHfQfQY1dPRaXnUTdeJ7o336oE+fc8fENaYDTUGRFcHsqq0O
	UdPR+RjranIVYvO+YDb7yEq6rXQkVfqmpOriE+uZfY1ZeJDg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygwv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:20:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453e61d6f0so4482284b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217244; x=1782822044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KblVWqnrcQ1YGvHTJZqI/1q++EEgqUk0YUHE+Mq35M=;
        b=f6VoG+r1+pBzP75HPFk6VWwB+Qx8qOOrlW6lB79xpIiPnWh6BhOS1GF3LxZEV5Kqwg
         BsUeUGgwSocflmUaVoBOAF8WCSGXP0gcdyD0WiM/xduBuYwz2tGHho6xGCoGQ+/FSSJ3
         bUXZ1hT1ko2btXr2Yf7aKIDiKHIrAuFYfOosBln/XbVMv6JDUfrVlzcM52J1Hej4yaBG
         BvZVGq2nEmD2QtW00oA1+BgcGLKQYPtlvpRwQetMF2wz9OmOI02/SJ/s+V7en3vzlgJ+
         0TrsKmxmqPpwEx16EZhL7ISEUH/KGhKfMImNdGf7UDTLynaWQIxJHTN78pZQFhjIkKhV
         OydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217244; x=1782822044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KblVWqnrcQ1YGvHTJZqI/1q++EEgqUk0YUHE+Mq35M=;
        b=KFKdUCuXEjs5uOD+pA1fu5oxeFHYY7N5JoB2/PS119vAadG1kPjb32ePBz8yb6U4hy
         HNKLX6+YEaol4KfKpK38ioMnMtm3Tlf/sN6H+hPWUpMMno07aJrXG8YdHZbJGxs2abMH
         /RKADwQrdjuYkZfbMHxhzi8eVohRB4qwELAeBlxiBSuIUD9bQNymTvbQXqkTFNyhjIwR
         XZ9+SX+U+USHsBulJ7/PvvTe6dtgX3Gbe+DNEXNwYMeQ5Is1HoDT7zCwdYkw3aAkNDTM
         CTwhhhSgIiD1NM1UDR5E7jnAvnd8wT13xGjs9BMmW7dQENwY9jHrKUfPYn9VKM5uWYOj
         AUHw==
X-Forwarded-Encrypted: i=1; AFNElJ9uORrosYZlrcjZSFHhv1cWG8VzYtS3BB7tjgAEnDxLYXrxWCfmmnboMXLICOjDoz0cKnRMj9e78FTsPx7y@vger.kernel.org
X-Gm-Message-State: AOJu0YzUGci5lG7LzYTARfZHbRl3FSYtMv8VC+aT8JuQHh1eWjwpOMLL
	FvRXLZv5zH4VWcMksIqf8BhNhDwsnLocYBPGtaI134D/RA0bIRE2oTt7ekHljhiNvMKf+uy0K/r
	5mBQWxsDmeaAMqwKMSvPo8y8+ij+V+SsTN9cqhcq22TvRAl5lTN0yNnDCVxOW1Hw0mh8F
X-Gm-Gg: AfdE7ckSRI/re7vJh4FqG2USHi8G8K+JNvVaI587uMfHzfCa4ZC6xONG5HyUX2wG/mJ
	WS3P2JQa9fbIlpAnJGsp8IVXdhtXrl0QBdE7gtaatTRitrl/wGJKIiJaxIrSsjfnJeVoSNwK0m6
	CYuvWKgUDNbwf+cWLi4gAyCaN8sBQOf9fL47VNEvlZIoLpy3aFJpikVws+OLfHnNX0t1VqlelwO
	dp8909uHYqB+JtZBXo23bS7f9RXSdsFmVdCrBDqgu9+8LYyf5zHI8IBLBFP0+0PI3YcWVzJkQlV
	wIQErhpzVNB5pzWvn1AIfLMbFerr7Y/s1YrOE39VAqCSoRMnYvTeKXwW/+gDi4TnCY1RZAr8S6N
	7WjGpkxNTujZdfsTVdEqjAWor+DTCbSagW7rywA==
X-Received: by 2002:a05:6a00:1311:b0:841:dcbf:e82b with SMTP id d2e1a72fcca58-84562478d11mr15797266b3a.12.1782217243971;
        Tue, 23 Jun 2026 05:20:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:1311:b0:841:dcbf:e82b with SMTP id d2e1a72fcca58-84562478d11mr15797220b3a.12.1782217243366;
        Tue, 23 Jun 2026 05:20:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:20:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/8] iommu/qcom: Misc Fixes
Date: Tue, 23 Jun 2026 17:50:26 +0530
Message-ID: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX8g99E2xDKYdp
 +8o7OKrniCLDdjNlbQwK6l1N6cUDeteevwFwIxzZdtWGhyTEqWzmrBfRXgRgS9tXuWZlUIy/zGg
 2PGQN+zWUv0TGFeYC/Cl+28k/Qic5oOrvAOjZT+bsd1gE88iNsG/WeaWDFW479zihLngN8QvSmP
 8lu0aq9XcoIKjn4JClai7Q1KZJHckWR9U08Uv63Vn/5yMqoy44ZW9FAfaBQw4ow1eE4KBF8BwWI
 iOGtQtkmadj8TLTI3FIalXilUwvDCHr3MmbcdNwG6PggJR32MrqsaFljAI6djx+OJXRYypRzqpL
 +Hz6jOBYIrPCdpuyZz/1j24vv8AUj7m+X+Me88FYCQwUVKwm2DCGBIUe0fxVhBb2lwKlU4IjHOP
 vgfByfYiil+MzKEdxmwVwp1r/YLrt/IZzfnAIahVx5o1c4eqrcWmet5JurUqholHO05xfrMjGIe
 Ui+mWmxj4U4fGoiaZ8w==
X-Proofpoint-GUID: KMPNhnjnbHaIGOL0LxY1ElLc2bVR87EX
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a7a1c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=AmUTqjPzaPleRPW9gFYA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX9CfYTypxNbPh
 UGQdRfFjz8h+4fwN+pQKP+Z2uScdCgAnecTVWvr/fd7OrFEhK00CTuuyAby761+wYjPvKKUTqvD
 y4+S/0o9QOUUScjwnjpUCTT/inBhMlA=
X-Proofpoint-ORIG-GUID: KMPNhnjnbHaIGOL0LxY1ElLc2bVR87EX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114201-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B15836B7070

Series to address fixes in legacy qcom_iommu driver, it is based on top
of  https://lore.kernel.org/lkml/20260623071245.1985938-1-haoxiang_li2024@163.com/

Mukesh Ojha (8):
  iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
  iommu/qcom: Fix missing pm_runtime_disable() in
    qcom_iommu_device_remove()
  iommu/qcom: Check pm_runtime_resume_and_get() return in probe
  iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
  iommu/qcom: Publish pgtbl_ops before releasing init_mutex
  iommu/qcom: Add NULL ctx check in TLB invalidation paths
  iommu/qcom: Enable clocks before hardware access in
    qcom_iommu_ctx_probe()
  iommu/qcom: Document why sec_ptbl allocated flag needs no locking

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 45 ++++++++++++++++++-------
 1 file changed, 33 insertions(+), 12 deletions(-)

-- 
2.53.0


