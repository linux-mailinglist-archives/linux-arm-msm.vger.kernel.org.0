Return-Path: <linux-arm-msm+bounces-78664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2DC0438B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 05:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A2664F4B5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 03:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1670A24BBEC;
	Fri, 24 Oct 2025 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nppakm/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E8B1AA1F4;
	Fri, 24 Oct 2025 03:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761275380; cv=none; b=hx5+1eURAVDWkqvhFOd/2nEVd/UUO2bZDSKFWxrZMoguhibyFgo9voI9/fdjiAiAewQXkaxkvYO85nIt0i/Oca0ED4sD2SyghhF07XHXZGKZKN8d3yZm8hPrcasTHaktPdLQeezKGuV/kBZ8A62ZvvN9BCU7fDz1wfwtKJkZy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761275380; c=relaxed/simple;
	bh=rFbdG33yTA6ABPwVswT7hZryKQz8WBOCVj9FmL7xrOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDUrWSossJfo72ALV6y+5yhQ48JYuJuEswSVeAYiV68qqkty5mPrb0FJztWVCBPf75YPU9TOzGfXtXp/ujQrZrXX3xzvk7Ng6Q1LIkXldme/6xFhpc3qwyiQ2hO1l+DOkrJbSw5eyEWWfdvfGGPM6tVp2GGImaJunPGlgk0XFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nppakm/r; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLO0DD001598;
	Fri, 24 Oct 2025 03:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=RDRxwxS5mGdh5dm9XrIkIp+2Qj2GQl/8xYffaVjIYhI=; b=
	nppakm/rmY7UiQxAaypZth+bO6Xcw9su7o580C3UWkJQfeYYugVPFfD2nO9IpzHe
	1qVofsXSPfk3d+a1vY5UP1c26X+vlFLMzvsVuUvSTjBzocRM9xgy0IxgBq8BkILZ
	GCaoD+ryqZ+mWSTd+yPTtUqM2XG0UxaZEJOA3gbc/rINsWsLevbYUVmmTAHUPK+n
	9C9hXWfmXGQ4YRtOKkdgMUVOkAm6RidBxKsSqALMYXSoV9qltW5tgnDQQ9HUt1eS
	eQzdsligIgky1eCeFwUHqh34g4LmomkAv31P/P7KhS660IMTnsGPbVS/Hwnq4m3h
	YRW1HPkCLaNIyvarR2TyHQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv3kut4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Oct 2025 03:09:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59O2gu20012175;
	Fri, 24 Oct 2025 03:09:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bfkdye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Oct 2025 03:09:28 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59O39RNk014958;
	Fri, 24 Oct 2025 03:09:27 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 49v1bfkdxr-1;
	Fri, 24 Oct 2025 03:09:27 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com, bvanassche@acm.org,
        konrad.dybcio@oss.qualcomm.com,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V1] ufs: ufs-qcom: Fix UFS OCP issue during UFS power down(PC=3)
Date: Thu, 23 Oct 2025 23:09:19 -0400
Message-ID: <176127514327.1781649.7123820195194287738.b4-ty@oracle.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com>
References: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=545
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510240026
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=68faede9 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7QR6E6h3abEZ3QZYDiMA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: GQen-p-FkaImzuUhi76TQZFlZBXBOsrF
X-Proofpoint-GUID: GQen-p-FkaImzuUhi76TQZFlZBXBOsrF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX/rW24lCU6sAV
 qQF8IYwa3dozoAqxhEnow1u4AVwqUKBbx8NBoZ8clc19pgcVkoe76kUoMe24DsvavsC+oeFidE/
 M2he41E9Ngb9JPGxc2Py4voSoUnPFqeSvjcjqeNixD9vCbrhMTMpJlXZdZ415YEm9Oxp3ojuJYL
 qo+/NUkfiDCsQFsnRwhdxPDTVJ1+al/0goJ5h1z5oRVd0gfBombloD4sGLsJa0GUjqiqQuOTk3K
 SMCXR5SVSQ4fOIwplRbSlUQ+EaBeNOUsk8v6YSwlOpSXCUZt48o6bKpZra+VMRxYod2ptHmICIM
 CZ1rTeoqelyIy0dP5Q5PWiD46ktYPca2r31SLEmLsmd44iNAHHADeltE/rZu3Xzr+irMtTo5g3V
 Vco2YhD0YhPWj3OGy0NxIQnICImUkQ==

On Sun, 12 Oct 2025 23:08:28 +0530, Nitin Rawat wrote:

> According to UFS specifications, the power-off sequence for a UFS
> device includes:
> 
> - Sending an SSU command with Power_Condition=3 and await a
>   response.
> - Asserting RST_N low.
> - Turning off REF_CLK.
> - Turning off VCC.
> - Turning off VCCQ/VCCQ2.
> 
> [...]

Applied to 6.18/scsi-fixes, thanks!

[1/1] ufs: ufs-qcom: Fix UFS OCP issue during UFS power down(PC=3)
      https://git.kernel.org/mkp/scsi/c/5127be409c6c

-- 
Martin K. Petersen

