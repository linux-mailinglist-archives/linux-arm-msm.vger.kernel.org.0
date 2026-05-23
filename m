Return-Path: <linux-arm-msm+bounces-109466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGv/Kc8bEWq+hQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 05:15:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4695BCE05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 05:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A844300BD7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 03:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909A73314D0;
	Sat, 23 May 2026 03:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DrSldC2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BD42E2665;
	Sat, 23 May 2026 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779506121; cv=none; b=Qnh96o6YbYip6/WnL5ViWBlrGpvY+6s2N+YO0uhZvMK4Y2hFZTb1bD/vI5DyET5FUqzxjM4q25RkZHyAZBjWE2HdoUtu6gEd5/CX2rxjwPOlSY9AMQSrbj6VF48fGJY7zyB6//BUA9BDttmp5JzGno/gZN6mrnvlwr8GYbTBjRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779506121; c=relaxed/simple;
	bh=fffIBECqRrEqMDzO6I+63HzuWjSWvJqM5yCa5o3Q9b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FZPNd3PeQS8lGC57GH6mYqzx9wgruAPV9brkzL+idX8czU+rLSus4QjTWkjjcUqZZd5Sl2BlTvEni5wudzpRlKFKcdRfX2bCd1BFNa3S3VLPtN1u9CimC5gOkcxK8FaBSpRCjiKsVh7ywChGnbOQawAoNvyY6qGLB3RCViMVMfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DrSldC2A; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N39nuo3040029;
	Sat, 23 May 2026 03:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=w/DhubJ+KzeHNZhnQKF3InkEGDt2aV1Pel+qmMM8aR0=; b=
	DrSldC2Adn+BieYRW31cLpW3jDoEft+jqx5ajcO6TWUFjll9eIkt0LPQyGKjTM7w
	iTqkk/eqdR6y3SU2oqDPkFzPkT0UGyj7o0dFQ8b51VPKvNWtxXFDDjC6o8WbjblZ
	b6a96L7/kTMslty6HkIvuAA/Jmm/gARrgI55vhT+rBMKjv0+bjRIBPuYEcutsCU9
	PE4FJrtu1q7Ys0Puo+Vcb7RM3BwMqE/7Smoo4tIuTBNwUkAJ+0xG/Q8gt9+B1rXD
	1MG8STsjm/sQfIovmzpXXgJFnN3bMHUpVdapTm6kXsaB0oxqOrioQQtiSbg2BNgE
	0xeGAOaGscw92FXi+qmFKA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb314r63d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 May 2026 03:15:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64N3F70T032458;
	Sat, 23 May 2026 03:15:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4eb2p6hses-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 May 2026 03:15:15 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64N3F9e4032824;
	Sat, 23 May 2026 03:15:15 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4eb2p6hs6k-6;
	Sat, 23 May 2026 03:15:14 +0000 (GMT)
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Unify user-visible "Qualcomm" name
Date: Fri, 22 May 2026 23:14:20 -0400
Message-ID: <177913641739.1181900.14211597067642050312.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427070048.18017-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070048.18017-2-krzysztof.kozlowski@oss.qualcomm.com>
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
 mlxlogscore=683 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605230029
X-Proofpoint-ORIG-GUID: iuWyzQFJyYIpZb4QzvUn0vtIPOOCiKVB
X-Authority-Analysis: v=2.4 cv=V9BNF+ni c=1 sm=1 tr=0 ts=6a111bc4 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=VwQbUJbxAAAA:8
 a=NwLMpufPYXkEYjmL-asA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDAyOSBTYWx0ZWRfXxuUydolK1WmD
 hl+gPflXHo7X6wLZcJO0HHhnDwnchQ9SM6FqT0XDaSLdmk9sJjhYLieocADMvzMJPfiqzVmhfSh
 P8n30a5YrgUAQjZ1C69A9MhNgzkJKrhC88PFO5hfs9LLV4Nlhz6OA38fJACZ3rHXVcsJ3jDZ5px
 rbFwwVLttHwovtwe7dD2i/jGtuxpkCXp5QO3oJYsgw3sbn1M3W+Yly+mm6VZghgkEg7UM00FjhB
 kbeAWASit5YY4PIIT73XohHK6+T0vOyooQWW1CvP0W/ktTWN6u9u5O0cDIkmfNb6I9cDE2Ryc7w
 WjxLhpCswq2o8/O68fh/w7mnO8mj5oekhfKapsJjmfcdwH+pIuCgt/JN8N4ylzSjC60Zgqi7GGK
 kuOsKsbPJxzg4yfNEED05UTvDZfP3eboUMeg5RNaXcu0egdLiRCWdEsqBTOvNQ/+F7ll7+PmgDH
 mMYfuXHg78tm9oNy40w==
X-Proofpoint-GUID: iuWyzQFJyYIpZb4QzvUn0vtIPOOCiKVB
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[oracle.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109466-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AF4695BCE05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 27 Apr 2026 09:00:49 +0200, Krzysztof Kozlowski wrote:

> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied to 7.2/scsi-queue, thanks!

[1/1] scsi: ufs: qcom: Unify user-visible "Qualcomm" name
      https://git.kernel.org/mkp/scsi/c/0bdf7d7ee75d

-- 
Martin K. Petersen

