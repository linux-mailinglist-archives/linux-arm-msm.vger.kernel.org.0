Return-Path: <linux-arm-msm+bounces-109468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A7lAuMcEWrIhQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 05:20:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 857FE5BCF0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 05:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C399304A841
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 03:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA48633BBC0;
	Sat, 23 May 2026 03:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j4Q/VYrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2CF32E6B8;
	Sat, 23 May 2026 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779506135; cv=none; b=Zpl4x4XoYotqz8IyVXLpwcYABOo5Y+1F3SSEdT10hx+UZksUMdfqTe7VourX0NcwZpKvl6e8toAkKSJfaAoIcmIrgzCcAd+9kLa+xzUFRkHvTAXvypY4BeVAyCLtrrhiWmHMF13Ziuq8vqqlSWRMTaNKJLzuJWK2manUZMZFL3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779506135; c=relaxed/simple;
	bh=u9C4Z4dZr+w0n/DyvHPclVp15F+JVvK4VRpEKDED+so=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ukO17cZigwE5eUQbIyCpH1j++Aa6RqcfQVelCdtQF9Yd4cyIZTc2SR24WH4pWXcUPsK24kz9zjPTIu9ovLvwNflJvMhGEoVFSYzVUPRrXyc7/m3emenvuNlzYyd9uNTcZWuv32YP1aqjKEMWyCgzHvJSK80ThZmm1F9Anst93Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j4Q/VYrT; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N3FKos2851105;
	Sat, 23 May 2026 03:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=C3U5VgtECS8JBqQIcZmV30T5avejQzNYMQ8UfH1cCyQ=; b=
	j4Q/VYrTju+Z/cxVqee+rVvMnuNnz+omjK0PqhLoDIf3o/TO7b2xy5U64gExXPi0
	to0EqbeeaP3LGlbk6v1nfUcTgDiBRc44rJG91piYt9zm6yqEC81dFW7KWKnI/nYz
	mx+04Rn5Sg0nKGmRy0r6WZgGYT3YwFF/3/qXwODaYY1sag5zuzo6RTvO36GUJ71Y
	b3d6KJlIxyiHFAfK3FQSieZmtFlOH7ffyNIeAdgjqHK0GrdkrJVU61gCe+45FIc4
	7In5VnUA8u4ty75PSFJOCqVVNjVctu1sq3XHTLhRQfLY/d/pfxVo6hbRG+bqsbQ+
	yOiYg/U9VtLqP2b9d7qrcQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb3us80d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 May 2026 03:15:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64N3F6jx032335;
	Sat, 23 May 2026 03:15:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4eb2p6hsfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 May 2026 03:15:18 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64N3F9eA032824;
	Sat, 23 May 2026 03:15:18 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4eb2p6hs6k-9;
	Sat, 23 May 2026 03:15:18 +0000 (GMT)
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        palash.kambar@oss.qualcomm.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V7 0/2] Add post change sequence for link start notify
Date: Fri, 22 May 2026 23:14:23 -0400
Message-ID: <177913641794.1181900.10456858477800005065.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com>
References: <20260423102023.3779489-1-palash.kambar@oss.qualcomm.com>
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
 definitions=2026-05-23_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605230029
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a111bc7 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ntT2GETeEWiR4UES5aAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5WqtKi6zLyqdHrBmtKnKVw7u9BbxnBZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDAyOSBTYWx0ZWRfX9TIhXdTCIgQs
 UWDCDH+qWadVJWlbq6AaAj0eK8ZdEfHJkdoa19EkLWh5HLw3pv0E80ffKiphB6Y84EzHF/BtyNC
 7GirDRtku/Fa0IvbYRMGKupxRNHI8lAj6oY+6HtOREakPk7YigLm/zGOru3LDrjbNMmkjrJ4+yv
 vP2Z1AZYmLxeWzGl2hG4SuvuZ115PTchb6H7Oj4x980F8ssQ6Q+ixqzKkI+/Mfbs9C72TQIX6eR
 3fUghK/3+EI3RYhDTqoKSidwRdCS0fzVSfIZNLiHkRC5eeBb8H+4YtcdLshOEFdzJ0YsL5FIv8L
 oXcYYjyuIwKKUuCz0+GXdy8ovL50fgM20UAPYLrvOQPnnQj3IY2hjhhhazhCYwD0Dt4NJHs7ulr
 nYXfVBedZRR/nHICP1aV/F7Rtkq2/1j1zMkoyAjoUk7Q/V7v6LhVKBu57046i2eOYYvDOuEdQqV
 vw7l2mKdlR2+zuMU0aQ==
X-Proofpoint-ORIG-GUID: 5WqtKi6zLyqdHrBmtKnKVw7u9BbxnBZV
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[oracle.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109468-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oracle.com:mid,oracle.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 857FE5BCF0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 23 Apr 2026 15:50:21 +0530, palash.kambar@oss.qualcomm.com wrote:

> changes from V1
> 1) Addressed Shawn Lin's comments to fix comment to connected lanes.
> 2) Addressed Bart's comments to remove warning and trigger failure
>    incase of lane mismatch.
> 
> changes from V2:
> 1) Addressed Shawn's comments to fix commit text.
> 2) Addressed Bart's comments to remove variable initializations and
>    indentation fix.
> 
> [...]

Applied to 7.2/scsi-queue, thanks!

[1/2] ufs: core: Configure only active lanes during link
      https://git.kernel.org/mkp/scsi/c/e72323f3b09f
[2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request support
      https://git.kernel.org/mkp/scsi/c/76417038c4d6

-- 
Martin K. Petersen

