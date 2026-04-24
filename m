Return-Path: <linux-arm-msm+bounces-104417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJiMIBM/62nZKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:59:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B945CA6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85E78301BCC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F073C35C1A2;
	Fri, 24 Apr 2026 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXc8xt3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McEZ6Fhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B816935A95A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024752; cv=none; b=BNLzaL8Au3Tu4lE/qzAus4qxizMUHlk9BVT16x6dmAewKs2PNcIa05x92WWNzKxSMsla7oKoxhjuw/E0jF4VLh/tLHqfwjHykjT5yqriLDCDtTN3bXaZbHUF6mUr/vuRz8LKah1M4slw/rBG7/u2rtwLdgg6Slmg7YlPvIC7HiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024752; c=relaxed/simple;
	bh=bkjj9Pa2WtTd6f9G691XiQU4Bv4aq1cGt8TynBYnBf4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O5EU7S5dtVg9ZLwD+GVA83T4R8+6apnt4bXeou0a9Flx4ljSZn4bV32Y1mkkBzezxG8Ee0KgrTMWDf2yikRKytUFM9bXoE+E3lKBQSoUdcDwfZseDUUIR9aLoQ9khTZLdXyiu1uJnm1WU1DJaAhLLICWQjG9nqC29o0YqLpFwqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXc8xt3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McEZ6Fhv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7RO2r1823223
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KfSjDCquPwtnhzWWJgoDqMumMUxQ1tlnJEP
	eeQileIU=; b=dXc8xt3rSUN/NQywe4+ODdZ3ZmAFEK+P6Y3jNlZISubPg35fl9t
	3ZQw5wMBg5G81oT8JvQGlgkDGqHL6qVlmDN5sZwvlpvz3TaREZq6hf8Ivbl0MBZF
	87A53kt20t7oAZfFv7olg7N5CcaSSAyZZvlV0HE6Z9QmqchVXcyeaqN2qndBQsjN
	MITX7pQ53dp6vvZRv6RfxhUy1yXnQK768ucQOgnC8KGBpjjescWFDsGllThjqCKT
	RLkbQoNdPZr820Z5Ca6scoqhQVMuYzXN3sir8ZeBPJxjtp1E6PDBiCaegigrtfS8
	ley7x0CIxG3zmYtn/ULoHzJ77qh+aYQNhAA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rt9hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6b0a7164so10457006b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024750; x=1777629550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfSjDCquPwtnhzWWJgoDqMumMUxQ1tlnJEPeeQileIU=;
        b=McEZ6FhvyEWgSVhI42MjqeJqI0kIjUDMdXPXp0xQvuweUHHMdl4XkVcOgHxIKU/j/c
         B5EEUaDXfhgq3iAquWEOYqYpsEdcHWhb2fGi5BYqrdp4moeHR8bJfEUNHs9PNqQlcMwm
         rE0BVlUZROoL0FBRmELs9RCwrV6Q+CLZGBoct/eFGp5l8tVyT1LbVrnZSx4QVIS1GyGA
         RsE/go9CHc9aS2mhjpYyr9pQNhDdpT32WQ4EIxnuwqMGm4fzoXllZHe+NJIl+ZeSZYyG
         MwfN9UpTMHR5+KgkpK1xL0mAJ6FDH8Txd2z80ATCZHM3msdC5GPfp06IVf68PVm8QcB6
         xe/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024750; x=1777629550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfSjDCquPwtnhzWWJgoDqMumMUxQ1tlnJEPeeQileIU=;
        b=gDhF8On38KUbTkA8bCUU0N4+sVUXczomD84nToT9yMlGKeXaf5MTxNQ+bzUHMnbRe4
         IXlVfjtifdLekYKwaJIt+3PphcSoA6xOHLeZONOuRpPOydP0HSznjvMXf48qdCpzMoyQ
         M+5pAjwqzT+Y3bFcCVbQyJzbA/+YODUq4ir3R3F1jMQbe3sTAi05tFcJDyqDtmVGNk6p
         WjdYnjvMCim+uG/pcyos9nI4TfrUhnahjdlUTAFAJZ2ZmdEdT3q63+cs/Opnn93PdGhY
         bMhNnLn9w8YTkZf4eQ/yMfsTlPeH5s543MWa0Tzk+O+4qgrWJEek39IUX1BZXbgKiv7T
         NFkA==
X-Forwarded-Encrypted: i=1; AFNElJ9qY4ynlsJKMmlNK+j93SwrdcwQbU09/beJF1n+t7rc8cH7DMO7/RPpG2jEUi+DQC3Iar2m0ezmcDkyIi9P@vger.kernel.org
X-Gm-Message-State: AOJu0YzXKCL7Vls1QeDwwzpio8gdCiVXgC8FrNScurYSzNy07lPyBhDx
	4TbIXuzdGTNbhiF7iSt+SW2mjcIcYaji5tnBBepz9bmIFeoHAcM6BjBIQooVh1v8uYJRc7r2PIJ
	pA2bknCd8o0wcPZuz5yJv5LEJEHGzjhj2fKEsACLi/mfuOFSEVsLipy8XCu3i6X1hrM5U
X-Gm-Gg: AeBDievIKAJhnOThf4FGZe/FueWia+L6hb4CfuC42u9FYze//q1wOXuT/Q40EfDLq46
	beH4bqFVM5ZaGOwSbwuWoR5q+PJ4k6W5L9VuqfLQqjD+2bXIEST48wA0B+GsKNnwA9PXkpfN6lz
	CoRBQ+Loal3Ga0NJHNHjpXytHFStF9led+0GxxsWpGUNoPk+ctLYyLGQiApE74C2XGiS5y3GAwD
	uq6FCuDkWmFj5k3q5zcjwguZHNjRl8vfo0mJ/SF6ezDSJzXDKsr9ulw703swxUqdOglkp2tjGuN
	micv/SnMLjaqT7fBCuByA9wujQ1rZx0Mes8dkJKrOmauUD9rXVc1s027pUQ7+bcEYzoyvUARtNy
	eWGDR1C/gnqSMXMjbeJEzR8M6MkafJyvtvMN1D6LdyFVLQD0XgCYbBmqJmmkutVQl
X-Received: by 2002:a05:6a00:3385:b0:82a:805a:7cc with SMTP id d2e1a72fcca58-82f8c7da23fmr32439323b3a.4.1777024750271;
        Fri, 24 Apr 2026 02:59:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:3385:b0:82a:805a:7cc with SMTP id d2e1a72fcca58-82f8c7da23fmr32439293b3a.4.1777024749858;
        Fri, 24 Apr 2026 02:59:09 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm23679702b3a.15.2026.04.24.02.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:59:09 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v10 0/4] misc: fastrpc: Add polling mode support
Date: Fri, 24 Apr 2026 15:28:59 +0530
Message-Id: <20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb3eee cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeUw2I9XaFYL6OdlDaEA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: DnYiWzDDP21fY3X0J-14OBARSQiBSvV_
X-Proofpoint-GUID: DnYiWzDDP21fY3X0J-14OBARSQiBSvV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfXwqRT4vbsqdpK
 lEV46Lv3BFvpn1U8qi1hbtLZUA5eP5qdNSRH9ulKihjuT4ajhRZO/vzTX0kgDfL5NvMhdMB6fq9
 F/uQHEQBSnAPjZsb6sHagGiVpp8MYZyaNQB64RvAhhp/ve3+CPkvJbOtwpiCz3S3yhCk/wmuDaV
 QRM1kxgMYIN5VngW1TIqnDGRIkI2x2H1j5HNrDsO1qJbs3iE4ofAFAplULiZ2249fu++gMclMgb
 9cvnNhrowoqilg0NVXfLC2RYpBvCfEDfDEvNnQyr9aC1VPI7rCHSvgVTWmT0FaS8nqYJYHUiRny
 jEzEedQzgJur8ySMkWA6rAwTwrg9DqiGsL+o58e9DeY2srJsl4pbywCe0LtsOnwK4K3A2TT8xMM
 2IJisX1wsQne9GIM63aWjPGropACK1B1ACshCkUuogGMwsBHtJQyTpBr9BWjvPMFZd02ZnpDd3O
 NH42ZLZxPuZga8WyLCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240093
X-Rspamd-Queue-Id: 0B7B945CA6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104417-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v9]: https://lore.kernel.org/all/20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com/

Changes in v10:
  - Add milos and sar2130p to fastrpc_poll_supported_machines. 
  - Updated comment for supported platform list.

Changes in v9:
  - Added platform support check.
  - Moved to readl as per Luben's suggestion.
  - Cleaned up fastrpc_wait_for_completion().

Changes in v8:
  - Added more comments.

Changes in v7:
  - Fixed warnings.
  - Fixed commit text.
  - Addressed clean-up comments.

Changes in v6:
  - Fixed poll memory calculation.
  - Added few formatting changes.

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 177 ++++++++++++++++++++++++++++++++----
 include/uapi/misc/fastrpc.h |  25 +++++
 2 files changed, 182 insertions(+), 20 deletions(-)

-- 
2.34.1


