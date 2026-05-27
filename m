Return-Path: <linux-arm-msm+bounces-109980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBy4L4q/FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:55:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0115E238D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0683020ABA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0C03E3D9F;
	Wed, 27 May 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qe1IwWQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJoaThbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3932364949
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875675; cv=none; b=C1kDy1VhxHU21csx6S9BtghE0g8vNZcXqIlwNtLChExijE8CcgiabkRqfzbAjGRx8+5Jc42dmasn2/09um7CB6a5OANvq7Giy6n6Gn0nuB7KLIu886VDIV7D2MYzU5Z0QmjQse5cM/ZnjKum6nBeVToLc/p3m2DRSPV+7pupI5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875675; c=relaxed/simple;
	bh=3ZalaVWnnb8N4TRvactAKfincR3DfQTRPXVxq2Za0eE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tBYkFmpAsMV120MPuEsbnTJ4JaHJRfzavrPdvH870Niypg6EJEZFkQmQXLnToDGEyhVmZDiBmF1+mZgrbd5bL4/rW7KWkw61Qz1Qj2VU09fj2uvadcF5w0FgMD9+W0crJhp9PPNJa2zC9KbLW4KUKFKcdMsixXFVCBU/b2GsvTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qe1IwWQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJoaThbV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mY391350571
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2VyV6REMsesYrEg3KRar90Css/Fn/rZ1MXb
	7fq+g5vk=; b=Qe1IwWQgagDN8+CEK8NMy4qtOtO+I/tZamrfnjBjqjjQPY8LB3+
	bqduPcfSxRQAB0kkxGiJnblCan49u2jLMrD56Ce80MmL24syDxmpWhwRAI0UyXVV
	yqP7hyQcmkboQNuHv913ELzx3syxfRgiMabIfOrx7aK9+hDhCBynfg2r4jLrD1OT
	eBpOJGU07vDC6IuFmBqnwnLUD25niRrgG3CEwASiUP3/IjBhiPZFkvotFuHDCE8O
	o3xOSkda70hZrTGZ2pRuS3KsLXYfjK5bI2wEjVcyi4EJfBiDLgDmoGshidvcuKVE
	1tS1LUhLlsXBdzAcD1oF61UIxqwGz+cxVxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentkfd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so12628251a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875672; x=1780480472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VyV6REMsesYrEg3KRar90Css/Fn/rZ1MXb7fq+g5vk=;
        b=UJoaThbVMKokuPHCW+r0QmuLzGRxg6JiwBkrELZaTsDRHkCo7oeSU0WOhl9Qoqpbin
         VAJbNZ+vJy/eT6/iMGtZw8B/DKbyAOt7uKykFAwN1lHuT/JLAWSwDiRvCVIXsZhtmeJt
         T5gKlAlcK/cj+mQ3msF7qJB3OO5fHpNg8TteSOMHMb5+PBFA6JigGVIs9UdzGMO6YUA3
         KF11n3newe6F729ekyQqRkOl1sFyzHUDKGFabsfXEYVWd5l6uscweZE+KxvvR6Uw9wzP
         KLqPKwA5H+yDHr7s4vCjcYlmKMDKmvpt8IK1sTmUxBWy9KIUduxZVoJzacRX+qRfkDV+
         UvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875672; x=1780480472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VyV6REMsesYrEg3KRar90Css/Fn/rZ1MXb7fq+g5vk=;
        b=bL4URZzgijpaauiHFXQ6RFPVB4YgHZ/qIFx+DH32siU3TkgotUwM3dJrnL2MaChQpi
         8jMGwCk3PyBaIP97m8Qe/PYk3MEuUtHRerK1see7ylB1vOBTItgG5hmeGiqA+rrSGWBf
         Euv46TrA1LJ8gZ+WmEe+hWtz/Mmt+1fMzVjLX1NLhvFgX62JdpbDb9HpeyKhiQCuNgWY
         o50sbECb7olfk72cjf9yIJpnLXMqwMuvWGqer8zMZ1Gv0MziQlWmgeM5W4MsPUxAKCsx
         jLplX0EbKy4ynYCvEjdbsjuGDOCq0psVX0KNbOjMgEJ2Ywj1wlQBfkvHEIrO256oAizw
         NiwQ==
X-Gm-Message-State: AOJu0YyH67Evt4cJ0JbJP4eJadCpQMdBluQ6UO6krh13BCvUmOgfkU2M
	Bd/7VFr8XL5tcNu7CAnVjCH3EEeDvXpPzE2VXTr96S1eIVEjucVDFczU/fQXyi0SBhgE1RJXXxL
	Vr6+5j+KULaB3LbyYnmlIUjHhhFhT8PBELfjcenZhVjEU+GRzYcGb/1K8ZwgZzQuEgafP
X-Gm-Gg: Acq92OGcDYTeYH4KEUYVPWMCoKdW53aAQCmw5XwOkyEnPyvH7uD7+8w/K1EDghUHbeV
	HUGNHE0ybaHcJOz+8VqHjTJbcVqlertBneQYkpS1ZwVN6BEF3Bf6x5uVsAfP9VFGFzZXujB0EqK
	sgrAfs5CmHZBo/1cFz90z0dWZwzwd9YQYqGaHTjORkVmsI4mW83A07S4HieSSS0OwguNW/Ru6WH
	BtODx3qjY3kzgPjdjjbSCHyLLL6VN/xUwAE2v/JKJVj2bid+zjEcYpcRpHzpz87HMlrgS92/nto
	+8hWraVU4IXJUcxLXaaDDtgg2ZMs5FGxFzPUR1xfuDQmieXFPfhmZwc9kZLKYxRTjmhB1316Dso
	1cC5Aco6aDFffkkz+FzSnHBoC2KMChpUWDuzISpcLX2HuEz8uUaiW8e0HmMI=
X-Received: by 2002:a05:6a00:28c3:b0:838:4952:1109 with SMTP id d2e1a72fcca58-8415f0ebe62mr22304787b3a.3.1779875671549;
        Wed, 27 May 2026 02:54:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:28c3:b0:838:4952:1109 with SMTP id d2e1a72fcca58-8415f0ebe62mr22304753b3a.3.1779875671004;
        Wed, 27 May 2026 02:54:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f17cbsm1809325b3a.45.2026.05.27.02.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:54:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/4] irqchip/qcom-pdc: Misc. changes
Date: Wed, 27 May 2026 15:24:22 +0530
Message-ID: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16bf58 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7EbbzXnA1mKNCY6AvRUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: KNGP_eppQrC7C8_-tJcWdxJh2un6ab1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NSBTYWx0ZWRfXzaNfEuHO5fRt
 blqpsIbj4XqXBKsbZGrwHH6McY7eDXUSaDhxE4wmvqP9ASzyhiRgGOKbnMfoBV2op970/cksq6L
 odKKs+N4wz8EBJrjYfotY0PQA+is1Ob7zmLJhsGmf2kj02i66IHOcdSR0nrhavY9AJP4UKndfJQ
 dB10k5cY5jj4TJuvcRbstR8Ugt9CYCHb1QkXdGABMm/+G8opVeJ3edaBpZ+ojA9UdAAg7IS4+Ol
 Oev0ma62edGsmEXA+8q2teFXnnZZplvCJY+IQAfzppybWf2OkRVoCduyCoDCCObVkEhtPUCOyLY
 pruuSoUdWA7/7U4VlWFaiPwvGcs8aPFnYFREyjqzmQTvnx09wnRdIj3iVPMakfz6XostQpPWprx
 uIBc/6G9VqgYpnXZli0LThyWsxovxSjegiM46HkEqNy86doqeBo90DGLm9an+6sseb23xHYe/Ns
 FuQnjX7AelIpLYJwMfg==
X-Proofpoint-GUID: KNGP_eppQrC7C8_-tJcWdxJh2un6ab1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270095
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109980-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E0115E238D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PDC (Power Domain Controller) hardware exposes multiple DRV
(Driver) regions, each 0x10000 bytes in size, where each region serves a
specific client like HLOS(High Level OS), TZ, HYP etc., in the system .
Linux only needs access to the OS DRV region.

Despite this, the driver was mapping up to 0x30000 bytes (three DRV
regions) via a QCOM_PDC_SIZE clamp introduced as a workaround for old
sm8150 DTs that described a too-small register window. Correspondingly,
most platform DTS files described the PDC reg as 0x30000 in size.

This series cleans up and refactors the PDC driver, motivated by the above.

2/4 has a dependency on https://lore.kernel.org/lkml/20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com/
for a warning fix, otherwise "OF: invalid reg size, please fix DT" will be seen, however there is no
functional dependency.

Changes in v2: https://lore.kernel.org/lkml/20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com/
 - Split the series into two: one for driver changes and the other for DTS corrections.
   DTS is sent here https://lore.kernel.org/lkml/20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com/
 - Dropped the 4/35 from the series as current code looks more clean.
 - Added R-b tag and rebased the series.

Mukesh Ojha (4):
  irqchip/qcom-pdc: Split __pdc_enable_intr() into per-version helpers
  irqchip/qcom-pdc: Tighten ioremap clamp to single DRV region size
  irqchip/qcom-pdc: Add PDC_VERSION() macro to describe version register
    fields
  irqchip/qcom-pdc: Use FIELD_GET() to extract bank index and bit
    position

 drivers/irqchip/qcom-pdc.c | 61 +++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 21 deletions(-)

-- 
2.53.0


