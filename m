Return-Path: <linux-arm-msm+bounces-91765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PJfN6PCgmkpaAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 04:53:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11FE163E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 04:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32452305FFE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 03:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651BA28B7DB;
	Wed,  4 Feb 2026 03:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bvYgCLwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B0273809;
	Wed,  4 Feb 2026 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177185; cv=none; b=Xf6YSclrn41+hUx2kkgP3AS+p3pcytrNdJYrjz7HqfHPO4lwyqI3gSQreQldAi0m5fy5PObJ5YxPxxdO15VqpkTOmGk2tVDJ1ouE24I/Slszvp++Idtysdb5Yj2PT1BqsetPMlr2xbRI+LNH9Uvi+VIVqP0/Rj72njfqh4fokAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177185; c=relaxed/simple;
	bh=WsWJ4pA76Y9dfi75XAQeP9j6QMXKCrH+fkFQFvQBqYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IUobocPPKnEWWJvDiDm/7UPU4bQiXMMYYcB0cC2GeW2t9ZRcx23NKlPFJCezD5hug/MlJJhc3iEMtu8CqZJFrr6b/M4aLlZI/BrzgT7uAF+1cPY1nbtMBMHLhBljl9unfJkmvuNhq+8QhEBiDRIYLK8iaQyflBf6gNNw8+tAddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bvYgCLwR; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuFwW318461;
	Wed, 4 Feb 2026 03:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3XKAryPtxogdcLAxCh1HrDZrzstpB9MRU8o1LuKbNkY=; b=
	bvYgCLwRmjGE6hYOngg8toTA1o0T8MJqjTcAe2wSBmTjY0GH6Xevt/L1AA9HUoNh
	XcsefHsVVxhKHURPSukdUf68U1nblw/mkJX/JfimbvyfyOe5uPof+hXWRPUvOF3S
	WkgCm+YFpDw1947DOOCmfpNUdI3KigUofjcfnq8CKAJxE4bJX+oPMrKeF3h1/Siz
	l/VRyuzvlnN3iMyOegTBbxK3vBEAbmHYQZb+FlcZJFHuT94ubNRBLn/h0T4Y+yV7
	x3pkBU2Oi2RnQtaZDUDWYVOv4yE6DBS9pwUpdJD5ty14q44ludNHiw6C1Qqi/9jG
	/dRv/6z0do8Is5lIQdw75g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3k7uh1pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Feb 2026 03:52:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6143Xmlm018710;
	Wed, 4 Feb 2026 03:52:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186nd32w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Feb 2026 03:52:48 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6143qllr024698;
	Wed, 4 Feb 2026 03:52:48 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4c186nd32a-3;
	Wed, 04 Feb 2026 03:52:48 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 0/4] ufs: ufs-qcom: Add support firmware managed platforms
Date: Tue,  3 Feb 2026 22:52:42 -0500
Message-ID: <177000116185.3467927.6891331238644067167.b4-ty@oracle.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602040023
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAyNCBTYWx0ZWRfX6Ux8U/AVJBDV
 AthrSaWkjYCVyhUn4jANUywlDPtLZRxZ1V8cJspoMP51bYJD/ao8D7W8UvZDhJx4S4FVRf9lc7C
 A9Qlusydt7ub/5DUZuyjk5ylEREmPXXxKWE7mSuBB4z2XgXdIBgp4JvzOiefbzRtzLiYJkhgvwN
 K50SLlgCfe9LT5LaPE6Fa56Q+samd8UTwNcU5zgWmnHSJMMba8j95JO2xhk0uUymE56qF97wGdC
 3ECqlw/ZVqZF2sJJPZ480faZfl0equKSIwnvPhpf9XKmTeNPUTN4PwUnqgvdEx55igk0pY2cr3R
 GLvhauwsRwjnElLO2LyYgI7XOhuSM69aRYUlZzUyo7/aKt4a94FfkCm7mmskl3IpG5iNSBmaGGt
 Gz4W1RyPjuey69Y34QsRDxt6NMeDCbn1Babft7rSEoQobJ0mNWcbHI87uXTkyOzLPcU1q5MEYby
 y8PZOGuplsz2g33nF3VOXa1i/gCah8ZMtfWhor8E=
X-Proofpoint-GUID: AMn0Sx3Ev-GuXTfFpvjFYY88hP5bFUvS
X-Authority-Analysis: v=2.4 cv=Z7Dh3XRA c=1 sm=1 tr=0 ts=6982c292 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=oZ1sQb9pZEqHDet5TIMA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12103
X-Proofpoint-ORIG-GUID: AMn0Sx3Ev-GuXTfFpvjFYY88hP5bFUvS
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91765-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:mid,oracle.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[oracle.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7E11FE163E
X-Rspamd-Action: no action

On Tue, 13 Jan 2026 13:30:42 +0530, Ram Kumar Dwivedi wrote:

> On Qualcomm automotive SoC SA8255P, platform resource like clocks,
> interconnect, resets, regulators and PHY are configured remotely by
> firmware.
> 
> Logical power domain is used to abstract these resources in firmware
> and SCMI power protocol is used to request resource operations by using
> runtime PM framework APIs such as pm_runtime_get/put_sync to invoke
> power_on/_off calls from kernel respectively.
> 
> [...]

Applied to 6.20/scsi-queue, thanks!

[1/4] MAINTAINERS: broaden UFS Qualcomm binding file pattern
      https://git.kernel.org/mkp/scsi/c/7f386b05f994
[2/4] dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
      https://git.kernel.org/mkp/scsi/c/e2725ed2a7fb
[3/4] scsi: ufs: core Enforce minimum pm level for sysfs configuration
      https://git.kernel.org/mkp/scsi/c/26c06d0baeb7
[4/4] ufs: ufs-qcom: Add support for firmware-managed resource abstraction
      https://git.kernel.org/mkp/scsi/c/ad44cf1b2845

-- 
Martin K. Petersen

