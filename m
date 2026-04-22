Return-Path: <linux-arm-msm+bounces-104048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPgFAzWV6Gl9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:30:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29B443FF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C3ED3032F75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F8A3C2787;
	Wed, 22 Apr 2026 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C947puJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5I7lqQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC583C2763
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849860; cv=none; b=iSP7sFSkkjz4eRylq0CS9NjZ29gg79lLZs+RCUJh9lBMwmZ5oJfJLUO/3mQI2IKqyM/uCOJbKKiVCMNr3KAXwyrH/6f8OT8Pwz/RhlbCRE3MEdcq0SGnfqcX+3Rtdj/Wl/onTIIxxJDPrsnSm+VjafBNRhprZHtff9B6LM0PP78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849860; c=relaxed/simple;
	bh=GkUXM82NRv3EU3iXhGdelkqsN5AHJCs1bVO6zuYiO5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qeTt0x4fFV8G8gjIxLnsT2Qazm7OwLE5zwSfGyfL20O4Wmf20wh0ffYBg1iDenWi1QdzIq5xa0XRfmRsDiUrE1TIBCQvO1gZiWquyiOiIy7LZ2ioneweliNEizYlfAFubayluD7iO8eskEN2EZcdyEoyNeaMq5NAjMULVJImdZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C947puJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5I7lqQy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99Bmf1443382
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NKqvNe4mpS/uLX7LczWmthkrVulr+nWnWNm
	iC+mC+So=; b=C947puJ/dKgJNtjjlBgEYRC6Eysn/TUcL6xP8j+1etHiVKKusJ7
	0Za6Sku9pJmWtx1bPquCvvLTNqLg9QFUwNytBO0wOc+kCrvSrY0O2WWiyhP8XFx8
	g9nSetkOXkNUAYxeEhLnJS4w8KG6D7NHkHxjkFbRKzPG4i9vLi+d9xT4pvgQuRaA
	odPEtOH+xP4drB8s8JZYLWFtuhdtyPFtZgqX94xktCmBKIUr2MLumYNWryXpkN7U
	N4UukgDfcCzMgQJx9kLgHidxXeCWA6U+bzgKNh/QyNMdKurPCSCJwd0ZmSkEyMc9
	2ovwPQ4MKNdvE03Uww5UucvQJwwX0AbyeCQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftmbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c798e905c29so1593574a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849857; x=1777454657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKqvNe4mpS/uLX7LczWmthkrVulr+nWnWNmiC+mC+So=;
        b=O5I7lqQyMJMzUKvld5wYDbCO5O10NhrvrPaZ4UaMYp5HixHIFNIKUb+J7fniOY4BvH
         /XzFfiHDBfQqv3YflGcN57sItFL//jd90hfXwpJdMxREoOmrMTZjwLAzNl4WS1LfjXRz
         sDbL8yXRItOk/10shn5ojRvfXhiPkR1++h4j0Tna/oMi9LIEnNI1IEJNOwZ2meShNVXr
         XYlyuVmMsyBDNHT3Q+pOGzX6JrEnLOmSbICqumcwEdqrFlEOah5qYEWXPE9gfUZOf3my
         s0KimMR0/lYxLI2p1sFHlT4K3PLUap+8gWo+jMdtxIHI9saEfLyej709KyMnImEc4NRk
         d7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849857; x=1777454657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKqvNe4mpS/uLX7LczWmthkrVulr+nWnWNmiC+mC+So=;
        b=T50R8+yneWL5HNOiNkOrpqgTs72l8GDIQnhgME0sU0kQhbL6/k7SpR0vw5kAPybfCU
         TfpoxsKSWQ+l05UzkhwAMaycrVR/dWsUz107gTtvz6F1oTkLniKP23Y1Yt7TzH67wGaT
         2vlhF2fNwRXzkW7TcgljZGPzv7nuQL4MDe1DMm0zZeUt45jG5+0XCnKy1YuopBisCEpl
         1aiYjHZDQXCIwQJnywW606+9CmBOez3H6h7oSsFCQIaK/Mx3ZyNdlpdldZkxWibnYJEb
         q73KXDWosCGEHK8uKMn0H/FyoO1nq8ZXgLDDGVk1is329Sir9cDjPmFPHhImmGajM5f3
         tz2g==
X-Forwarded-Encrypted: i=1; AFNElJ9vlRgELD2HuJ6p9mwQ0LIrTQAAD7tStv9lnMg9sIo7j96PAoB+9nVy93kGQ/aq8zXfcXRWoeySujk8VNyb@vger.kernel.org
X-Gm-Message-State: AOJu0YxczqgLoP+pO1DpNMJljVrvE5K/JnFztSbV9mbzaorx8QljL4Oi
	n4KXPs8aIG0RX2dDdZmfzOT63GKNFANpe0SOODMQWiGzngJPwGyQqOin4rHoAzafuGCD/aEnpU4
	2UKZj/zar6IGsPh477ihlI/6M/om84WAz9aIvot+xjtfjPUCyWq+xbelVgNU4EUCHQ/Zo
X-Gm-Gg: AeBDiesYYVo/b1JeObhuQnIBh8viCYDqQhkAdIlNL08hCD9l66UNccc5g8ug/Puh2xM
	rYYi052IMukitEfDlwORaxYmJEWRN2QDnDGfNLaY4tw83V2mALHy5DGFwGutj2TFe62VgRE/lcc
	oHeObJLU0irOUxB7mEhT0qDzzd6ZPFUdce11F9u1lw+SdLGG1GJ1niOxYTzPvzQ2nsYIqN5/cZV
	YmHcywQqirUAlZlmtRq2XhoEmJ4coHQ/Mik7Pd57cuGnOcej6BQKujq3SP0f+Vi90Qvq2A4jnz1
	KYgURja7g0PjVKa2XRlP4UFgA/UsLo1kiAyPDUmoerxJ52P0pfUHK5ORmaJIn1g2NgmYCnGQjF4
	CAaex/Oa5OwldGgl1hj6vhJxIjGnJtet3ZOuo0Nml/S0eXP7lmii9FfX+05gbZbaT
X-Received: by 2002:a05:6a20:6a11:b0:3a2:d68d:9e7e with SMTP id adf61e73a8af0-3a2d68dd1e9mr12341509637.41.1776849856742;
        Wed, 22 Apr 2026 02:24:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a11:b0:3a2:d68d:9e7e with SMTP id adf61e73a8af0-3a2d68dd1e9mr12341468637.41.1776849856235;
        Wed, 22 Apr 2026 02:24:16 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38ddsm15778576b3a.34.2026.04.22.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:24:15 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v9 0/4] misc: fastrpc: Add polling mode support
Date: Wed, 22 Apr 2026 14:54:05 +0530
Message-Id: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BI_NzFfTaXe41o-MikO943DoKuk1L-bY
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e893c1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeUw2I9XaFYL6OdlDaEA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4NCBTYWx0ZWRfXyTckB46ChB7i
 IHu8d7WX9JB+59JHGuWEnQyHHM8bvlJDqDqKjNRaa4wk6Ahz052nJu4khA4T6WpiW3lrklyyqgu
 FU711peJOGp+2Gt+SliMIaII3bvX04EAuL2RLRtjIkvQMgUmfzFsLyKOYJ1CT3YCB0JBxHK/KM8
 Ksi1mblHsWHXabl0iICKVtsp6Va6VBPvs7t5JpaklaUNEgJ/GtSgSJfv/Ib9WbDOGH6qo1cl/vj
 lufqogmOYeyddyRJqa3z9pFlwRV9MW3mdET+9B0weQQvLoLuWyVjYwDIluedoRMnC5Fw4bHNw6I
 2e6amHrm522UDEybSxpFvgv1aphECh6Nsmng6sw7z1CRjO0gqZGKfhJnMcVVMEf+8D5KkFzSOso
 pz6dl7Lb83Lfe0FM1zUE1H6+H1XqF08ENeOblyI73Z++AJdgyZXfK0nrlAJi7KBnDYJROpX+xBQ
 rktpslwniMpikPIjzXw==
X-Proofpoint-ORIG-GUID: BI_NzFfTaXe41o-MikO943DoKuk1L-bY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220084
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
	TAGGED_FROM(0.00)[bounces-104048-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A29B443FF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v8]: https://lore.kernel.org/all/20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com/

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

 drivers/misc/fastrpc.c      | 170 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |  25 ++++++
 2 files changed, 175 insertions(+), 20 deletions(-)

-- 
2.34.1


