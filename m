Return-Path: <linux-arm-msm+bounces-102397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFWXIV8S12kSKwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 04:43:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB203C5A01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 04:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C5553013BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 02:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D2536C0CF;
	Thu,  9 Apr 2026 02:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Akfifrwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC86D36923F;
	Thu,  9 Apr 2026 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775702618; cv=none; b=nUe/21/p5XlFYv6RilKnihX0OQEEcsX3ohUil63Flw/YhE7GOKsqGAX7cVfgvKY/yvymsL0pf+cMUocgxD1VpiwpKRJOoFCvQm7f8jh6CgfA4mHWnQtZFmcupqCqAFf1gYgs//d/dWXJOsldkVmxVLxAnS5rCGoPu218t21OHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775702618; c=relaxed/simple;
	bh=wZIni3TW3BPXQg1AYXnOur2mQp/gjhpSP/sbZn9OBd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kM2MwtEHWohUv1RXacO/8uvTK5U4LNicWw1SphH0qFM5ZnjUhjuPGBJiJ5pZChykjvXw8CPSQiJ/QUtZfZkAU6o/K1Dtk1wF9hMvf78spNeAP8QuOGklP/yP54b6kDb2yrHFtGm4efc2ORf7EldUEibnCsRFj0jLPC8d0WXUGu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Akfifrwp; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NtY9o3997127;
	Thu, 9 Apr 2026 02:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2me7jFs6OK5LqDeQX7iQrRDtd5A/wEDyoUVRKbjRDA4=; b=
	AkfifrwpmOeradDr3g+3g74ru4ChiiUmujnKoZVMIK/w7WTCqoAC5Fz4rZlwLtp9
	K/C9xbe7MjJDlIBwXGlT+GINs7O4DMmsfWDjbRiOwVnt94BQXffhD+JoptzUYg+4
	99VuxM7NgBNUrkM6ZNL+8d7ydkwwVFJ0XPxBEPAl2bFVMuGdSUd6p/SmH25oRZb7
	nu3sohTOwUwsb+B1CPxK8MjzLxnF6JbbrKI8pXVjB0xsionCFHvae2wrU/MXxGC9
	6UnTHoTVklVmrWd8mO74bZT1ClNl3aY4YWu/XWI7/gQpwcY++vtbeLl0I/OOvaxu
	4AmhfOIcvPAlUA7EL78j1w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqa4y7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 02:43:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 638NmQHI003907;
	Thu, 9 Apr 2026 02:43:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dcn5xhrbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Apr 2026 02:43:30 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6392hSUr031599;
	Thu, 9 Apr 2026 02:43:29 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4dcn5xhr6t-3;
	Thu, 09 Apr 2026 02:43:29 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] scsi: ufs: ufs-qcom: Fix spelling mistake "retore" -> "restore"
Date: Wed,  8 Apr 2026 22:42:59 -0400
Message-ID: <177569866589.3870441.14685669843824311878.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331153049.1344957-1-colin.i.king@gmail.com>
References: <20260331153049.1344957-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=883 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2604010000
 definitions=main-2604090023
X-Proofpoint-GUID: QEy7Ui0AvqC55CH6GELY8gATYBjyKrg5
X-Proofpoint-ORIG-GUID: QEy7Ui0AvqC55CH6GELY8gATYBjyKrg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAyMyBTYWx0ZWRfXzntu4dn3FNFT
 6v6HVLaUS4QwpzYk0sgClG90HncUaNwobcftcsoeZi8GB1V7IILmx4BGSyHxVB2YfItppsfQpYK
 MRbABu1w8juYgBdlBifyXiKoZ5eEqAcqRr9F9SrwOYeWP/4UWlfgysBt70DMCl9r3dcLOYtUMkr
 0awOFdPQ1azw2E1pOufW6HatK8iRCxu+kk0GeL6JLyYhXWCTrX65WoOvo7/Rh3WHzmhoPgWDcKK
 CiNqRGObiRYFUiFbmFz8K9Payo8tCtQ734O4HmLGDq5qBqmV0pw3SQ0in2V1OufdbEb1FvpeI3W
 SQTTlmBS+blarPTnJOjn1NQG+8mk7kSv/HE/1bLGd7KeWlfdSqQ3UMuUBWtjVg33oGPs1sahCpQ
 9o9uWO3jqcPDouGieo4wrjl1Q1I+O0bfkmBXSDPH8rFcW2lUr2wPL+ABC3yL0EcVjPO1pRv4J2m
 BkBeu3zDyB/gOsDx66dGVhIDcdeQiBiVeaQl4E9c=
X-Authority-Analysis: v=2.4 cv=DLS/JSNb c=1 sm=1 tr=0 ts=69d71253 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8
 a=sf3gWBItr03PUpgVmuwA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12291
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,HansenPartnership.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-102397-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:dkim,oracle.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2FB203C5A01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 16:30:49 +0100, Colin Ian King wrote:

> There is a spelling mistake in a dev_err message. Fix it.
> 
> 

Applied to 7.1/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-qcom: Fix spelling mistake "retore" -> "restore"
      https://git.kernel.org/mkp/scsi/c/23c29ca113e3

-- 
Martin K. Petersen

