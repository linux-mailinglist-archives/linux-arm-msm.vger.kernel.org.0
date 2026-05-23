Return-Path: <linux-arm-msm+bounces-109467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBNeKO8bEWq+hQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 05:15:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9735BCE38
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 05:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 600C4300D4D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 03:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677433191A5;
	Sat, 23 May 2026 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JJSFbYbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29932B107;
	Sat, 23 May 2026 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779506133; cv=none; b=DR9mu/uA2eoPh73TFNSRZ/01oO+NTsFpxfZMyjD05azZ4bcBJ4tSf8YGFIzXO21ExMwWN2OpmlhEo2QxSqoWQpX8iv9OHFjGL5OpN/CHmnmQ6YWt8gB+mEkUIVZN6td6dy/0okggCxmIkj+lqMH84CgAatLkKq1N2Fmda+Amuw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779506133; c=relaxed/simple;
	bh=cYmNgJif3MBctwCNz7r10/ugSuy7ZEM2QzwgNXh1UTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mN/i1IP/uWuwtymep/tm50kurGrQFXTRalKhulT/IXkL+lKjOCIKXeLdJkowKGJdmpau476/9AEFbQj/G8BqbLO2QY4cY+tEirSFDE0EsrNKChY30+bluhTS0T9LGalTjSVvKWEGPcy/Sa5MnanqKIQOX6r1wyicbKxq1Ai05zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JJSFbYbf; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N1hc2Z771545;
	Sat, 23 May 2026 03:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=W1qTmqz+ukB8nZk0DsEoX8bnLpw96qTX6w9LOPBiuuI=; b=
	JJSFbYbf845+iBQSo1SRyZYS+jUL9yBlKUsb0wOS/nC7g8X1QqjZvTMCBoFBSlYP
	DMeHskrd0FWU7sGkTfQ11rXxOxKnEJ5dQnwq6sVlNy/PwyYORn6hyVdMvKSq+a9y
	2CKQXAVfrG1bBA0coN1yzmW3p3Ax61LQl7SlvJVlSkXiSIxqToYDUtm+OQBm9pdZ
	PXbM8nMQ33lx+1XeSrlm+XcxQg2TVOcbjv2Hwhbw3HnphGOeKH/zu//euAAsgTMF
	4Ssw8kxEARFLhTvu07YJBfRAqW1QXcIgPE1xaTArcXQh4a2Do/LFXmc9/sKk1VSg
	PAFoc5MJ5Gwn8YJnWFg/cQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb2tyg72d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 May 2026 03:15:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64N3F68j032371;
	Sat, 23 May 2026 03:15:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4eb2p6hsjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 May 2026 03:15:25 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64N3F9eK032824;
	Sat, 23 May 2026 03:15:24 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4eb2p6hs6k-14;
	Sat, 23 May 2026 03:15:24 +0000 (GMT)
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] scsi: ufs: dt-bindings: Add compatibles for Nord UFS controller
Date: Fri, 22 May 2026 23:14:28 -0400
Message-ID: <177913641751.1181900.7719645023341396564.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
References: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
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
 mlxlogscore=790 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2605230029
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a111bcd cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=VwQbUJbxAAAA:8
 a=ZC9mcO7Xf2SOoCrdTL8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Uy00OdLTBUayyDaM-tM0EIugTWm-V_9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDAyOSBTYWx0ZWRfX0lEhNU12WDa4
 iNx5UlkdjiSQuiTJJ7X1jDNWlXNywJmESOpr4REz6zQ3Q2wsItQng9OG8dc6LmmrliZfGzZS7Zu
 dpbnU3kCJlXGwAtDKXV36tXnLHT9GXkoLLpDucD33wB4Da89+QCXFUK35siSJ4D6nZsP4QiJSYA
 ZA2u1oCGBpyMsw0oJ+ozIWo4IKBsSFnQWu/k5H6awnd3ZsJjHAaasij0Y73+ljgQY4ddUqEq0uq
 GalPFnBbo5gY27McrlPhGb9GtREdmDet7vSAT/ffP2jUpxL5PAnkfw6oODPFbR04RJe7TQESZEG
 9fRClquDNODekBh9ApzkLDRedxuIJQkyvGg+T1zqqF7x67gvI1VL4PLhdCdSUzCOcoCNhToSqXK
 UJYx/ro+rpFfABE2ieQ0X+pvZ7J4Qw+HrzxTRYj92tXoNkvn0Lar+66TFD18g+CJjysxbhZAJDs
 Fw+zO+Mt7LIQNYnhdnQ==
X-Proofpoint-GUID: Uy00OdLTBUayyDaM-tM0EIugTWm-V_9i
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109467-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AB9735BCE38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 27 Apr 2026 09:31:13 +0800, Shawn Guo wrote:

> This series documents the UFS host controller on Qualcomm Nord SoC.
> 
> Nord is a Qualcomm SoC series. Its UFS controller has a multi-queue
> command (MCQ) register range in addition to the standard one,
> both of which are required.
> 
> Nord also has an automotive variant, SA8797P, where the platform
> firmware implements an SCMI server and manages UFS resources such as
> the PHY, clocks, regulators and resets. As a result, SA8797P shares
> the minimal OS-visible DT interface of SA8255P and uses it as the
> fallback compatible
> 
> [...]

Applied to 7.2/scsi-queue, thanks!

[1/2] scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller
      https://git.kernel.org/mkp/scsi/c/c9ee94c7e2fb
[2/2] scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller
      https://git.kernel.org/mkp/scsi/c/7030e16247dc

-- 
Martin K. Petersen

