Return-Path: <linux-arm-msm+bounces-60080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A87ACBE8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 04:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 694A33A387B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 02:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13B6AD23;
	Tue,  3 Jun 2025 02:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sHk4yrFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A93B42A96;
	Tue,  3 Jun 2025 02:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748918210; cv=none; b=NsW+9buLqV9ST3TuKX6LKQKhN0MY+OhRu5ctpDXmhNSXVSbteA38lE+9jrboKLC370xGo/v0eYXZzPzoKPryP9rb6AAZIwYdaw/KaMg/QgTAkvV5SV4LhEesxZIFEVU23emi3XHrETMn4zAHpBP62IIX5IV6NYOzlMLVoCzuIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748918210; c=relaxed/simple;
	bh=sjUW6ypMsldfBfU02/42sNdN4jHydbZJG+R7r7LTS+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGecPtELJfziQbSBy7nByua+SflCBln+5IKjxUF2pz7Falfe3XFv3jxOXoJsfeYkMmMjPU8UPk936xfShN67fxxTwk9IzD7zWXsn3RUNcEAHd2DtehvlIVXBAmyBB4bNQuQrjgg2WX22gEgwGXKCPEPGRMIkCoB/V2blpeInOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sHk4yrFl; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552LN9Gt009317;
	Tue, 3 Jun 2025 02:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8s8HnXekmxu460KmqaDguCTGkEDpBp4pBzZlbNFy41M=; b=
	sHk4yrFldiIHJa9I1R7SYONEPQofamQvcFbIE7ipi6q01ApFAH0Day9sEayZfYEC
	MqZODiTNE85sHrcaihXmASkqwbu61V77UZ9rV6WVsZy5CJo/FZcuTv1gmCjw2Nr8
	fyN7niV10M0CANbo+nq9GbflRPTVfBB4HhailXMGBKerDcBrm4Od05bx98s4xdAd
	UnB0+s/2Ta1Zy34Bycp5RxQXiA3vPNP6IGK2LKMX0gdlNY+WcKPMBfR3ql/uXAvc
	bItVsqdqXDdr7KRaSH6/lJogRi+9dqaFQFyrS5Hla9PrU/nvW3EJulp+lYZr1Q21
	rgku74/72x3eAB7TON19HQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gah8vyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 02:36:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 552Nk7YE030717;
	Tue, 3 Jun 2025 02:36:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr78qke1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 02:36:15 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5532aEkB008766;
	Tue, 3 Jun 2025 02:36:15 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 46yr78qkdh-2;
	Tue, 03 Jun 2025 02:36:14 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com, Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host asyn scan in progress
Date: Mon,  2 Jun 2025 22:35:48 -0400
Message-ID: <174889162398.672400.4727862624188636298.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
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
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030021
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683e5fa0 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=TJ13prZXil94bmcCRCwA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:14714
X-Proofpoint-GUID: -c2OFC9XWKZZzh5c7HK2EkXGgiGQ5pvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyMSBTYWx0ZWRfX5fP/BtOIH2oX L4LxupElJW4HMGABO8V5ieJC53A+0Vm9S7DoBiHbhvQZDZgRTIPisaQ6lRkaBIyqffgggMmXMrQ 5pVWYF8ny9iI4Qcix28pPylPsXT4DmFIkkNhFXxpjX13MVRCd4FOLngf3rgM2iEro2NEfdGgltE
 iuB3+FY+DALfpCCMEoTpYa4rG5vIqHmd45DSqJiX2TPv/kBuHMDB2mu4TrD9JAcj58zUPB+f1sW 2KXJBfmzRyaAqjV4aevinsCvbhxHS4qZfxsqbju84pqYuJxiaFtQFK1ApGeMB3mUwHPb7emdA40 RMxthfWdACpGM8v/3q2DAXUl/N0k3Z/1i/Mw2pGOPnbv2XxshWAt30N+lNbtiiXeiMN+qkGk6JP
 PZIcpxnIlCyjJAilLzGvdlK61JyfbDbc+C6xR0gf41R+a9HkMpbXywLtHsCgfveDYDqTbIiC
X-Proofpoint-ORIG-GUID: -c2OFC9XWKZZzh5c7HK2EkXGgiGQ5pvO

On Thu, 22 May 2025 16:12:28 +0800, Ziqi Chen wrote:

> When preparing for UFS clock scaling, the UFS driver will quiesce all sdevs
> queues in the UFS SCSI host tagset list and then unquiesce them when UFS
> clock scaling unpreparing. If the UFS SCSI host async scan is in progress
> at this time, some LUs may be added to the tagset list between UFS clkscale
> prepare and unprepare. This can cause two issues:
> 
> 1. During clock scaling, there may be IO requests issued through new added
> queues that have not been quiesced, leading to task abort issue.
> 
> [...]

Applied to 6.16/scsi-queue, thanks!

[1/1] scsi: ufs: core: Don't perform UFS clkscale if host asyn scan in progress
      https://git.kernel.org/mkp/scsi/c/e97633492f5a

-- 
Martin K. Petersen	Oracle Linux Engineering

