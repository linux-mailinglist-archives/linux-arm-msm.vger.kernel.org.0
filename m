Return-Path: <linux-arm-msm+bounces-43808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 794F5A0014B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 23:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05D9162A34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 22:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2D81BD9E1;
	Thu,  2 Jan 2025 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mU1UDqhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954E18FC8F;
	Thu,  2 Jan 2025 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735858064; cv=none; b=KVT6ngRrEyiN+IYblWabqbUJWhunBYvT0XJb7gOmV7WVsfWOMlasSDcsByheoGFTzKS3rRM4EPU0BFZl/RLKl2YG1RrQ+fqljadCyUAErnwIdynVnzMa6lZBs3ORcmuS9+pRALorb73KwcYqe07DP4x9lJOvHRDCPUsaMYo3fGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735858064; c=relaxed/simple;
	bh=362Kp3yiv/MIDOpgb5Pxmu6NtZ4eXnwuST+RJ3FKn1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+24GUahTbVTGa996FDmjPqqNOMdvwbquzSsXaTxTbH7sLEgzPs9bbqA31tLHGkjdoP75WnaLN1hfE942xLNbPLB5+SWieE4Fd5lnzZuuEN+OIqhvpzB5xlAolJp/ot3HeKkeLpSxNTHCZd0fX9IVBzYgPnkbbEDBw2ju+EXoMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mU1UDqhw; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502KgNJN031223;
	Thu, 2 Jan 2025 22:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=+1vN7PJEpZ09dhospqFvT7FvXNjyEpJh9KnfAkfsDLg=; b=
	mU1UDqhwQEHJ11LlUN5jECMDRyrcnVWCVhBionQ7E09MyEyBa+RmIUY3yc+jaa2+
	F5owE+K9tWDy5vfnlVCfcXu7+p3LrWtcLl5GAufA5tTynloiCHS1w+H+VJ2hu8pu
	T2wluIH2ERs03R0Ar1t0Tge7bsDBBVmN906/RN0SHOwPjvjqXLHMpnCCuYb/xhZr
	KXuGlGQpTeX/bbZLlNOd/H3nnMHdJ2c6ZdJBxipk/NrL8yG5kgWzrHqOZjQ+3T2X
	bU/1xQoDjSx6/gmj5bPx1iUqNhC1XKA1/XdClvaY2RRsOLUCd1tfhf0OcAfa+pmK
	cms+OoA6fhIdmEd5tBmTgg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43t9vt7b80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 22:47:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 502MKcQW034231;
	Thu, 2 Jan 2025 22:47:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43t7s8vs9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 02 Jan 2025 22:47:21 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 502MlKrx016933;
	Thu, 2 Jan 2025 22:47:21 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 43t7s8vs96-1;
	Thu, 02 Jan 2025 22:47:20 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>, stable@vger.kernel.org,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH v3 0/4] scsi: ufs: qcom: Suspend fixes
Date: Thu,  2 Jan 2025 17:46:56 -0500
Message-ID: <173585773702.369835.2709540698524341995.b4-ty@oracle.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241219-ufs-qcom-suspend-fix-v3-0-63c4b95a70b9@linaro.org>
References: <20241219-ufs-qcom-suspend-fix-v3-0-63c4b95a70b9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501020199
X-Proofpoint-GUID: 9OeQ55FO__vnxIJybm4US3pHkrwzp4fn
X-Proofpoint-ORIG-GUID: 9OeQ55FO__vnxIJybm4US3pHkrwzp4fn

On Thu, 19 Dec 2024 22:20:40 +0530, Manivannan Sadhasivam wrote:

> This series fixes the several suspend issues on Qcom platforms. Patch 1 fixes
> the resume failure with spm_lvl=5 suspend on most of the Qcom platforms. For
> this patch, I couldn't figure out the exact commit that caused the issue. So I
> used the commit that introduced reinit support as a placeholder.
> 
> Patch 4 fixes the suspend issue on SM8550 and SM8650 platforms where UFS
> PHY retention is not supported. Hence the default spm_lvl=3 suspend fails. So
> this patch configures spm_lvl=5 as the default suspend level to force UFSHC/
> device powerdown during suspend. This supersedes the previous series [1] that
> tried to fix the issue in clock drivers.
> 
> [...]

Applied to 6.13/scsi-fixes, thanks!

[1/4] scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()
      https://git.kernel.org/mkp/scsi/c/7bac65687510
[2/4] scsi: ufs: core: Honor runtime/system PM levels if set by host controller drivers
      https://git.kernel.org/mkp/scsi/c/bb9850704c04
[3/4] scsi: ufs: qcom: Allow passing platform specific OF data
      https://git.kernel.org/mkp/scsi/c/4f78a56af4c4
[4/4] scsi: ufs: qcom: Power down the controller/device during system suspend for SM8550/SM8650 SoCs
      https://git.kernel.org/mkp/scsi/c/3b2f56860b05

-- 
Martin K. Petersen	Oracle Linux Engineering

