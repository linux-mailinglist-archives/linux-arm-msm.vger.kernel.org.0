Return-Path: <linux-arm-msm+bounces-114205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k73xAAd7Omrl9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBE56B70D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:24:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Gg212elX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Jid/PzHI";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114205-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114205-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CD42313464C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354AB3D5C0B;
	Tue, 23 Jun 2026 12:21:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F2C3D5C1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217276; cv=none; b=Z7bhhYqpJiDhuVkF8Mx9mFj/VCS2pYFXWtgR3rhdCgnjBk47WQkhnxMW6sC2KkjqVq8AZFRJMtUvf+vkQHrGrU5oQ0uVb6WzTzXtGxie7VcR4ufS4AZVDOyY3/K1PxG4M4MWgzxI5OG+/FGpQU9FhwGCaZK+KQjeD1rvCtaC3hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217276; c=relaxed/simple;
	bh=AN6ppwR3kd1WFUbU9DKEq3apKpJ8vyt9ejViggT5/c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEnUoLBvjeB72ink+y1bdUBdn0dLkYlxm8gbk/zzwVtiwvUuywaiEtWkfouwEGzStrKOY9BxiWHNhIrbxCCQfimk82wUE6m4IVpqrt+xKXJxni6GI60nkN5R54Xdrb5HPRFQCFZRWjyf+M/4bZ8KJwbRWH1BJJois0IlHqCqgMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gg212elX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jid/PzHI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NC6m3l3745068
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GaQcQVT5n9L
	HLCVP7PYj+va6pm+vVtEUtpzmlxdT3Kk=; b=Gg212elX8YWQpGYnRY7LnqyzNqV
	8rdTz6d3EdWibWgx7AmJQtRmFGrfcg2+2JnNVbOuq8pdoZ5gPVvRQ/oRt0dmSc//
	x6hb/ct9e9bTnEjzzO9x0UU/YKB8qO8x9ZzE/MXA93jpLHkesWlVNA9Vw3Etyr0j
	tI0WvJwM+S4oVy8XFU/YU7wqUPQKa8Pz/ldmTUgNXUYSJ7Mr1fF+r8gsSnX4l2Ei
	p2KjzibpsEh7MzOeAwXmd1RteQFP7kFMp5qDsn3wukO8m7NUIVxkdMmOB6Qlq2bZ
	ycEpUHPj9/kBcs/1D3P7R6IREjxjSfnUielRKmkxeEYkluzKvf4teiacKpg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3g1gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88d7a75507so7305191a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217273; x=1782822073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaQcQVT5n9LHLCVP7PYj+va6pm+vVtEUtpzmlxdT3Kk=;
        b=Jid/PzHIbW+Yhvw2mwV5orWDH2ugdadk1PTcuAIXlxkrwKW09M7kLv1tNAu4BdFqka
         5Vp3fLHNyclWkG8ik+OoQGk5XPrv+9Dt5iImjbqz5tCx629vvaRf894KKJpwxSXE/fvl
         dY79g9QCckRQe6hD/7zr0NZoRpIEEnBzD7S7NOoumn9+0UBzYKm+CX2OgYhJ01Ojvpzi
         CYz6cbKC/FNYGPwo+9pdm1hwJEbJW7ootaR4pripXaxUZ+BJfRkX9fwa65uHWlSjWq+5
         WBcK9TM8uUoYYlwcveoYUXIDIkmey3uRR/LqFtJPfKEs0W5QKpBfwbyBzjuDCBbBHhv1
         IrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217273; x=1782822073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GaQcQVT5n9LHLCVP7PYj+va6pm+vVtEUtpzmlxdT3Kk=;
        b=Woi/Dc1AyUxqzig/ars24pp2FFXaqjtqmw+6Kx/mD7djCCITE2WYYT2Xk42gBiGxUO
         iEJofV1vPnYXw2SVhRqedlD3XaZR+ngBndDyAThFhZpZHjUQs7+G7r9mbiWeIAYdOUWc
         WgblxqyJCDxDNW/YnMr1QIPHXEYBfiEawZ0C0YZOhNZYR/tNVKqRnWsWNYudd2OevGmr
         vsJ3WprWdJad1S9z/cyCYh3AhIyr9tG0h2UZsTVKvC3lLrKBR6Am+qi88RhIhJPqU6Gm
         oQY8CGewXAmn2B/uBvd7AjqGRUtmRvGZF6XKEkGvTYuLaDNCFFX6zKKL51RKldWWJEbf
         wzFw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ud4E6nlqJUxsQluyZWUN2Q9hKGycNvij/G/mXVP1wVXg3oSAgIamCV28m+MBLKySvRq/TLMt/76RWy6FW@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwsWWckGYBcDzHRLoCn1103cxAtGqGx8lVS0f7mI8LGc6piTF
	meebnKJ1XX8SsFh3wF4Ka3tb1nJvWURSyVIr8xmE+NjtnFWTFF7IE5jWLy9DAP3s0qhAeNyasw5
	ePLbJkMEFLroWSeqw/2d4Cq3yY3qpk/o5KSc/CM6GzaQMI/FIeyEKNsPtJRvsXFhPW5s9
X-Gm-Gg: AfdE7cnQWvuky+bPswx/wMLtOwAL1zhpqykuFDadFAjBPgBh3+MJKszVx76FdEjx1Mr
	9O7hooT26vmT+TpCf5Y/qjhCLC6U11SFs0ec5uzuek+6mRlkOUt1Gw8RsDMhLfC8tTU0qQ2Hgfd
	B7HODMP6eRl7/+7LwLSbAVn5fTzfSaCx1u3Vgzf0erkYFfPvdNw2EPhM1k6+lOOqqEQWI9KnJQR
	evjpuYUUBnyyurMdfyRhjXROjBOkIx4Rg5N7KoD8fgKMW0hc6WQPR6CXtbWi9VqxKMWKpVh088b
	6M8KwCL1KWkbyb1RwPQehbU8gBbYhQJVxxH0kbnySbr9FcCguZoTFyB3q8PXIGyWyRTCWBLjR2E
	8ZdLaoWrVNKB9XxOfxWNUD9i8Ry0gPGOmO6svhQ==
X-Received: by 2002:a05:6a21:6e97:b0:3bb:1629:17c1 with SMTP id adf61e73a8af0-3bd151a94bbmr3396903637.35.1782217273379;
        Tue, 23 Jun 2026 05:21:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e97:b0:3bb:1629:17c1 with SMTP id adf61e73a8af0-3bd151a94bbmr3396862637.35.1782217272829;
        Tue, 23 Jun 2026 05:21:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:12 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/8] iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
Date: Tue, 23 Jun 2026 17:50:30 +0530
Message-ID: <20260623122034.1166295-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX7nWvmSqEgB1b
 LqwW0tj/Nn1QOQBco/fMBtyMFaSC5FcdNPcn8Zdfhpl1u+EdGYvo2tdwon6ClMGK52kWTIQHqSJ
 RW6qhcowngMCWb3Bt9NFcZZpT1kPQpQ=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3a7a3a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pv9nQ82OMFi3fEhVMZYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 32UHJ2GQ_g70CRUl8L6jJMRWeTtoV596
X-Proofpoint-GUID: 32UHJ2GQ_g70CRUl8L6jJMRWeTtoV596
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX5YSdR+qufx5f
 9RVS7pVX8juWMNFWB5ryUlaKLJ5jqYV4CYPgLWvGlOiZ3ZLUY/xAXfm4DcNqzhdmAQ8Bfshsoey
 +CvDnNuY8c+BFKDvBDwqiUzBwsFf2H09KAcngQzp6suYbPdbY4bi4X1Y6D7sV0Xhny1Orjsa20Y
 rk7YSaEZ9PPXBxm6FF3E5l7Xq/5i+wuDRwcbmzMUfQDcqVQbJsd59B+R99mLDpbVXcBjSw49FiH
 l9oRdKMx9NJckmbeKWh9mQuS/aJdC+5/LOpUvmcZsjLLBqaZTZlGfYuArCD/2gC4KQewwNgABkz
 VdCpq+Yk7eu7VPSkMq310Hq2lTiswsu5kZQWODO6Z+ND8gWHaNCYFpHwxPCgz9JEZksdeH9URM6
 FI+Ax+wCoGZVI2U+DcCEdyVirOX62zFK0v+wgzOl65vRM/j0nCwbPAdpU0L0Pf3HIaLL54LQq7a
 1BLFbIJYGKbCYM9COCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114205-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DBE56B70D7

alloc_io_pgtable_ops() can succeed and then qcom_scm_restore_sec_cfg()
can fail for one of the context banks. The goto out_clear_iommu path
only cleared qcom_domain->iommu; the locally allocated pgtbl_ops was
never freed, leaking it permanently since qcom_domain->pgtbl_ops is only
assigned on the success path.

free_io_pgtable_ops() safely handles a NULL argument (covers the case
where alloc_io_pgtable_ops() itself failed), so add it unconditionally in
the out_clear_iommu handler.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 4e714a8e1fac..b6ce85f7f923 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -314,6 +314,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	return 0;
 
 out_clear_iommu:
+	free_io_pgtable_ops(pgtbl_ops);
 	qcom_domain->iommu = NULL;
 out_unlock:
 	mutex_unlock(&qcom_domain->init_mutex);
-- 
2.53.0


