Return-Path: <linux-arm-msm+bounces-25903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F5392DEC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 05:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88499B20B82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 03:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA87417597;
	Thu, 11 Jul 2024 03:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j0bpZVfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC9C653;
	Thu, 11 Jul 2024 03:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720667367; cv=none; b=fsQ0KEuVEUoWK1xLouxJfSoY9c/9hqjUmOd8Z0tREzfaRw+1RzjMxqTksxrSRy7Utzi+kLlAHIQqhRqltH2nS3ExiKZcr/go8sFr5GIwfSPzD9/XhpAjYw2BhlScUusx9m6FI8doVkzINJ3Qvr9ahTu4BiCLBLGQ2x1inOM1a5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720667367; c=relaxed/simple;
	bh=nnGWHQdOE6A7vWDzQDyuDhaSsU8Um0cpmGvSiXGvIng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMLLoYY5oQ1xhj7vrZxAaPZjJ5ot+80qWbkb987JjDQHatEHCBKxcg7QYpa6UjbxeiC4OM6YXo6GrXcuKYWZ7B0PWzgjHoy2zWmytNYtxGgWoauFpg+skgoQtQXSJTatUX5TvjczzInxUHHsnuWJR0kIWLdG51KaYX0n87QtE1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j0bpZVfU; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B1SeE7029616;
	Thu, 11 Jul 2024 03:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	corp-2023-11-20; bh=mVZGnVfJuUUVJ48rZlL7JFo1gTtm/7sW1vQWinmG8zQ=; b=
	j0bpZVfUZnJww+6XhsoVlmNMxlpX5Rixeyt1ap1AcqkrFm/zR57vKicJqsnULgeB
	XMp0psHHBU1kiMUlGhtjnprK7aYWjk/d6bcJrq+FFr3TH2Lq6ZSLKQcYtuZFCDN8
	Da8GCBjBeSsstcjqZR1lzq17kc7Z3sit4iUmRsN5cxr81mlcIoOmvJ95GzGgETmJ
	WmAYZ4g+lOXGjxzTZZ7gT5frnlD9oGjSwnnIEGkKpii/P51s4DeR93a2if+3egD0
	dnbrpLriu6GntLBzalmoo3o5VlLbhjKeGW2bCYpdz9hVlUCC+3PQOO6AHyPFQBwA
	ZZO7hXHu9Ug3a9oZOAdJ3w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wgq0p88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 03:09:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46B1Zsg2008796;
	Thu, 11 Jul 2024 03:09:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 409vv3x4c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 03:09:16 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46B39D9j006490;
	Thu, 11 Jul 2024 03:09:15 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 409vv3x4ar-2;
	Thu, 11 Jul 2024 03:09:15 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_pragalla@quicinc.com, quic_nitirawa@quicinc.com
Subject: Re: [PATCH V2 0/2] Suspend clk scaling when there is no request
Date: Wed, 10 Jul 2024 23:08:33 -0400
Message-ID: <172066369902.698281.9935677312111229941.b4-ty@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627083756.25340-1-quic_rampraka@quicinc.com>
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_20,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=767 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407110020
X-Proofpoint-ORIG-GUID: DEGif5EgnZnE2v25jtB5d3eUC5M8W9ga
X-Proofpoint-GUID: DEGif5EgnZnE2v25jtB5d3eUC5M8W9ga

On Thu, 27 Jun 2024 14:07:54 +0530, Ram Prakash Gupta wrote:

> Currently ufs clk scaling is getting suspended only when the
> clks are scaled down, but next when high load is generated its
> adding a huge amount of latency in scaling up the clk and complete
> the request post that.
> 
> Now if the scaling is suspended in its existing state, and when high
> load is generated it is helping improve the random performance KPI by
> 28%. So suspending the scaling when there is no request. And the clk
> would be put in low scaled state when the actual request load is low.
> 
> [...]

Applied to 6.11/scsi-queue, thanks!

[1/2] scsi: ufs: Suspend clk scaling on no request
      https://git.kernel.org/mkp/scsi/c/50183ac2cfb5
[2/2] scsi: ufs: qcom: Enable suspending clk scaling on no request
      https://git.kernel.org/mkp/scsi/c/ed7dac86f140

-- 
Martin K. Petersen	Oracle Linux Engineering

