Return-Path: <linux-arm-msm+bounces-56888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988FAABA4B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14BD3ADE79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7B924CEF1;
	Tue,  6 May 2025 04:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bg4MmC5y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46A20E31C;
	Tue,  6 May 2025 04:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505568; cv=none; b=V8WQCv/TLIpkuAhu8kgwFqGN/6Rk2+Hu0rucUlSv4DuRfD8TZOD2+YspXYqKtfMFYUYC3755r/X41wks9Djbggyc5fTLVHnY50JQoO0XZg5gF/RhzD6KcnJH1StqYq0I388UQyGGrPe8RRd7m1gKSUtG7OC38mYqqk8Q+b1otn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505568; c=relaxed/simple;
	bh=Rh9SKd22I48Ek6d4GWZ9Xjm44+9Rl1TQD6hbjaKkcmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsCwMfKVi1wiRGZAp7/iFdsioS+b/QktipfwJCL2H5g7eIaOQemo95b//SPKnWnKLnUZRr5eOoveKB8CerEkqvgJzjnim4Nvi4BdHsbvRLc6oulbtBQa55qz4nyf+z9KPOb+EuY8p4CCVWAHfotldEiXxmLYedD3xoPNCR69IQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bg4MmC5y; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5464I3f6027690;
	Tue, 6 May 2025 04:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xKMYtzz4PjkwqeFoHU/pV8nhbnSecZZmWShadmPUNKg=; b=
	Bg4MmC5yrgu3hn9kNi1eq4M5fmZWz+4twRlK+MQB0FPX4cxHiV+yJw/HPeaf00Or
	61NtP+uL+a3LVa8NacZzxsQcCkn8pC3mhQ8Gczv2UzDv2h7QBDSt+559qf481VYd
	0fh/NTBvPsqny+gmxV7hOzZKapBm7jDk2jaUYGKBca9N0uSdNMCzdgSOu9aNbkXe
	C3WUq9YQ3cZ9CDQ0thcy567A+DdKeMX5Don3EHbTZPcb4km7uMGqF/L6/TPnhX5E
	T1rsr99goQaSJvSNibYLWEoqzN+LiTuP2Ooib6McWA2xuM0j0KUbjy0hG/TR08OT
	ZWV187FVNlJszTI0laThJg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fb7h00bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 04:26:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5462Ci3H035319;
	Tue, 6 May 2025 04:26:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k8gpqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 04:26:00 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5464Pr4I012838;
	Tue, 6 May 2025 04:26:00 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46d9k8gpmt-7;
	Tue, 06 May 2025 04:26:00 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manish Pandey <quic_mapa@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com
Subject: Re: [PATCH V7 0/3] scsi: ufs-qcom: Enable Hibern8, MCQ, and Testbus registers Dump
Date: Tue,  6 May 2025 00:25:25 -0400
Message-ID: <174649624860.3806817.7736361955168870871.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411121345.16859-1-quic_mapa@quicinc.com>
References: <20250411121345.16859-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_02,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=470 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505060039
X-Proofpoint-GUID: kZAmzgZRsWShPYfdL9CaX1oSizIcdYFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAzOSBTYWx0ZWRfXyxWBPlwewuiU Dkw6Ii94SmTN0d2x/FQU4Rq64kC8quDVEmarnB2998sB123aOEt8agh+RaLKB+to+I/EgZCjNQ4 Urx57kM0Qjmy9XrpbRhwhB1oaFrTunqqcFqIP7VWTj+ywvs+fro9CnZLOpXDnhcWqvPOY8pr3GR
 hOrTPnJdPCEe1ECKrAr1I7rOel9AKkvNmSobfdIPq8FVDxQb2+91I7SYxY3qAiDmrnbkC7ya2f9 dEIELvUFCdA6D9c8HygDauuJaFmJDwHhZMQAHZlgknERNSQXICQTOD8Fd4lLrRXRvVYirZm1PiI nmELxMcHlJDjE8uMFCIvEQO15PLmKjyimy7hnv9xDLPYb+bM9/GlDCcyaQsXd/s/+9DIwLKONIG
 m+8Zp+VFRwF+nkF8NlC8HeMCkzJ91hPtUOkkJ5c12ZqEAzZCy3q8Ls3wtbnA03HrFXtLie2e
X-Authority-Analysis: v=2.4 cv=e6AGSbp/ c=1 sm=1 tr=0 ts=68198f59 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=MzbHoceOyb6HJEcDhnUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: kZAmzgZRsWShPYfdL9CaX1oSizIcdYFZ

On Fri, 11 Apr 2025 17:43:42 +0530, Manish Pandey wrote:

> Adding support to enhance the debugging capabilities of the Qualcomm UFS
> Host Controller, including HW and SW Hibern8 counts, MCQ registers, and
> testbus registers dump.
> 

Applied to 6.16/scsi-queue, thanks!

[1/3] scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
      https://git.kernel.org/mkp/scsi/c/fe016bb54dd1
[2/3] scsi: ufs-qcom: Add support to dump MCQ registers
      https://git.kernel.org/mkp/scsi/c/82edd868888a
[3/3] scsi: ufs-qcom: Add support to dump testbus registers
      https://git.kernel.org/mkp/scsi/c/25b5ee122b79

-- 
Martin K. Petersen	Oracle Linux Engineering

