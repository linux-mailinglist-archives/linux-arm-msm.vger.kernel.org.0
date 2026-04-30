Return-Path: <linux-arm-msm+bounces-105419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLBfINup82kF5wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:13:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF34A74B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D94F930143DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59F047D951;
	Thu, 30 Apr 2026 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PE3einur";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhVCKfQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D5477E40
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576406; cv=none; b=n01HRwP3gVuIDcEm/KPqltu5D1L3v4/iZMY0NNzrqb9yazbYlz1PNiY42VYy61D59jVsNLefFtKo0ME2d6FNisK/H4d79Ny/7Dhbn2qg/v4fRo8HCKJ3kup2upFsuqnnqCuqDDSIybLVXut6UzjHIj1X7lg+CgIxn+12F1kEXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576406; c=relaxed/simple;
	bh=4Aj46rPmBM5hQYPzWG3VyLR487m6blVFzHS1PuUL2wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nCGU9arA7Xb7IvK6UNR4CKTloHfi+9kk+DQluGK22bUwgjmXdZZSnrgZs04gfb3E9dMaMRRzIB/SbIl+gtYhEbMYcZjH8Tq6oMSjOtW60rbGtwdxSLt0ppHrtxQ+Z9aPHRQe1AbsqVvUuEkEmfHxHkowpzjpYxhmHbj48YkO5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PE3einur; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhVCKfQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UF2aR9007768
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zsCkvdytycFY2jGceriNG3
	8V1DET2f2OAEvmV/UYijM=; b=PE3einur1k4CmG9LYrJOXeOpi5wkV3yXVsOPUj
	KZvDVLIzDEQdyluQSIVGQCsGE1AKkRmsRYzjcgrzpK9zPyGsg1DFFhcabqxsSW9O
	CxrZu9xa1DtGCKmD4k1HGtRiF7DB811LnUw3kR8sllaoCbX3bamRRSVU3G8UOBIz
	qHqmARzxs8vJZS2SIylfY7gn1yjgk78nrgzqY6dF0rXg6R6Mnu7lxOA5mpUiY08v
	sU6kCyXIWyyEM6m5RhAXzaJaYuBfXfmYP5BNUnLN04KQQ6zpjLT71TJUaWwXA6io
	hIZXHyxdOa2UFHRDKJtvHoK8SJLQxd5Tz4zpkyR50GejvcPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54wamqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so727901b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576403; x=1778181203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsCkvdytycFY2jGceriNG38V1DET2f2OAEvmV/UYijM=;
        b=BhVCKfQw1k+1wqoJAtY90GG/YryTnp/TN44MQvdbaU1YVtUm3+2qKu2sIkItV2/tTg
         XfIVsNM4kyf6Xm+9tW5c1ZdOieqsNmUOXWT2b7qLlALWQVY5vE+YeYM/yJR4TehmJs0B
         i4sT0MZqH4o/0eXGWSJxE6tZ87BsR2kRH6mkK5kb2V0lpj3Pldihwtd21IJKeGN10PIx
         +yDzux9wKokA99hO+pckE7VcHgvE23O5y3Uddnr4Cpw9r2w9tv5CXdinkTgYaYRHHsS/
         uIb1GBiW7FY+9h3BIgi1QpH5DNCjisN5SSyfARK2CeXpfFNfraEgMNocW4s+UKI1yCjX
         htLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576403; x=1778181203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsCkvdytycFY2jGceriNG38V1DET2f2OAEvmV/UYijM=;
        b=WcgdNRWLzcqwB36PaSdNGaB4bK79yMka6Xo73R9CZhB/QGhKl1k/Wfjnw4zWzl9fDa
         kdSlVWKwYT6j0CsBTd7IzmC63s0apNGRGrIxR3FI6ljVjtLhp2T/KbujR+ygmQ+7+doC
         GXu83/Mcl3I0DAaOKNr4g78bftWT8GwQwxsIOxJ62Knmc8fPMq3myBlHCK4rJ0eSl/nL
         8Mpbvj6Nd701eXqQ+XzBP2BZC2rzEOxalgkT5PET8s9e/RcIn0E0railU2D9I1rliFGu
         8/ICyysJk3TZM7WdN522n2TSHJpKscURxuV4iU02yXT1kftJBGJUYpcp0Fq5TbgGUEYM
         /tKw==
X-Gm-Message-State: AOJu0YwhWrXu+ykd++sE2Pk0xTvQUGXl3De4QU6ouTH3q281VpmBuUSX
	Uo0R2Kyk/KtVC1o7+UFd4d6KFKLrlCh3MRWwCawevXzHdonEuzgXMguw4Th9SkdePHAqBRxN0Vb
	nORd2nh5RXTJFIf5MNx6WQQGyjZBLVmwvKfUMEAcDhngLzi7I9oTLv9v0Ij4IksHaT9Nz
X-Gm-Gg: AeBDiesLDpdoDyEoHREMo2fSy6rQOzNdf6bkNU21LBNgU/Vy7B6fxV9m/zbtcAol2jJ
	CblDyORKxfltFBSjRTNobomWfg/ORvxzp7snYd8LEj3SQ1ca8bnpwcqjhuLTT6lF8n5/Bj8TczT
	MzsQbwLB5AXv7uysEudwJnaub7Y9sGKoaHdkDQ0yKdWdz/++UXvuG8rIfPxlOZek/muKIXZwUxq
	sjdGJb7lyAUdXhOGoxa41LB/yG5aCn4eJvff/ApVgXro74Tk9A2U7MPpR64EyfdhFeuRJDOHjLC
	oFJPk4aj12Bk7l17wz5EBZPivg3a7eMI0ePNd6m6L59mPYw2CaEgz/7sBO01VKLmox8Nf51p0gQ
	p/2NPTaZ+M7AFOnP0MCdiOq2P9/Gblv+z14YevCykyQ7dAmX0xeWbitcj5ls=
X-Received: by 2002:a05:6a00:1ca5:b0:82f:5154:d1d9 with SMTP id d2e1a72fcca58-834fdb07c68mr5252407b3a.6.1777576403000;
        Thu, 30 Apr 2026 12:13:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca5:b0:82f:5154:d1d9 with SMTP id d2e1a72fcca58-834fdb07c68mr5252361b3a.6.1777576402336;
        Thu, 30 Apr 2026 12:13:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 0/6] remoteproc: qcom: pas: Misc fixes
Date: Fri,  1 May 2026 00:42:47 +0530
Message-ID: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bUpmlNQKZsDCa-1FCl3Zd9NBCWWyfuZt
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f3a9d4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C3U_2sOWQCZxbW6OCDkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: bUpmlNQKZsDCa-1FCl3Zd9NBCWWyfuZt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX+QkWype075H2
 sbCBk4VJvzlv3hf434X54iFRAOcuvzFsQysQjljdYDlPQe+chJI94fkOYaDMsOoS3+/py25F5Wm
 0sw37k8qODHxwUZZamMqFY9UOl33qdTOH1d3Q3MlIo93/KqW/YlmVVG2BOVERLOgcq0dWVW34Pj
 +DFhZNCeWAdLKSpXCdQI/mYOrwRfmSjBxvIEwQ2aaTWUfImbKPSn+4louZQsHudkgK1//n2ccB9
 Hudo1/LDGesYXV7Tep5NL/bPwxj7o4P4TwVrKdraO+4bhyMwE60uBiVLMlJuTBNkxGqFphZvs48
 u5stpaTvJUir7g/Y1y7K9OFu0DmBpdU2rDaR0QhnbZtC8mXDY0U+ssOOqTyq3pMfQFLmbuzMpfR
 d4uISWqL8SVFnKXEpV4Vr98cwpNK8qt1RKOit3evNtKnbQvm1hzlsvdBe9XN1ryZVJD9lxiKWTv
 ZUN8tE3JwzVmB+Tz/pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199
X-Rspamd-Queue-Id: EDFF34A74B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105419-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series is a collection of misc fixes for the Qualcomm PAS remoteproc
driver and its supporting SCM/MDT loader infrastructure.

- Fix sparse __iomem warnings in qcom_adsp, qcom_pas and qcom_wcnss by
  annotating mem_region fields with __iomem and using __force at call sites.
- Guard the DTB metadata release in qcom_pas_load() with a dtb_pas_id check,
  consistent with all other release sites in the driver.
- Move PAS context allocation from probe into qcom_pas_alloc_memory_region()
  so the DTB context is only created for subsystems that actually use it.
- Map/unmap the subsystem memory region on demand around firmware load and
  coredump, avoiding potential XPU violations on EL2 platforms where the
  region may be handed off to the remote side.
- Drop the now-unused dtb_mem_region field from struct qcom_pas.
- Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
  buffer retention explicit rather than implicit.

Changes in v4:
 https://lore.kernel.org/lkml/20260331183957.2015440-1-mukesh.ojha@oss.qualcomm.com/
 https://lore.kernel.org/lkml/20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com/

 - Last series mistakenly divided two series cause laptop shutdown.
 - Some minor refactor common code rest is same a rebased on latest
   kernel.
 - Added new 6/6 to the series.

Mukesh Ojha (6):
  remoteproc: qcom: fix sparse warnings for __iomem annotated mem_region
  remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id
    check
  remoteproc: qcom: pas: Fix the PAS context creation placement
  remoteproc: qcom: pas: Map/unmap subsystem region before
    auth_and_reset
  remoteproc: qcom: pas: Drop unused dtb_mem_region field
  firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context

 drivers/firmware/qcom/qcom_scm.c       | 21 +++++-
 drivers/remoteproc/qcom_q6v5_adsp.c    |  6 +-
 drivers/remoteproc/qcom_q6v5_pas.c     | 99 +++++++++++++++-----------
 drivers/remoteproc/qcom_wcnss.c        |  6 +-
 drivers/soc/qcom/mdt_loader.c          | 18 +++--
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 include/linux/soc/qcom/mdt_loader.h    |  4 +-
 7 files changed, 99 insertions(+), 56 deletions(-)

-- 
2.53.0


