Return-Path: <linux-arm-msm+bounces-49209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B7A431E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 01:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B6E3B0492
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 00:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCCA17E4;
	Tue, 25 Feb 2025 00:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ahfSHd+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42207E9;
	Tue, 25 Feb 2025 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740443631; cv=none; b=CdVOv0PWFQtaEMRSpIvRWFrQz6wrQXGHzzbivaKVwsZpUGZPQRrWgKTqCIsoIpECs6izRrvKKj9fKufk8ETT9B2l2RRwlqj7XchKobSMYfPLUTglkioLj4N626g6kIbip3/dnbw3lJ/bimz3KUj6YPKJQsx/ozU2K+mjVUVApOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740443631; c=relaxed/simple;
	bh=3Dgn6ap7O8+TC3enKytA6srfujJVLRQOiILzEizZ/vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=siYPjUrxLN5ssGfZb3mg0pSaf2SGLfpW/APUmldlkBOwkQSFLDyz4AYfpKFJzNS9VQYT8PEXTYRFpTpIvYsTRPD/NZ1hxT7AAWHGGWYB3Ss+MJ7OVP8NXcmUCqHl3canYDyOXeJVhWmRP4MN2/hgKi1jnnBCyXtsfe9yeEQuuCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ahfSHd+e; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OMK4A2025220;
	Tue, 25 Feb 2025 00:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9rhjYcVXQZupgyG31N9S6xdQy/eIyTiHVZxCjl50oL0=; b=
	ahfSHd+ee39+/n2jkR581gq4cakz8SZgHscMySx2Z4p0Vu2Pb7APelbGO+eZdDwb
	U1EtRmPWDp+AA5AMshLCTHyl2pSnQuK4rL7kVFJrfA6N2eYVPh89A66S4f6O2pXF
	JwgEq7tBlTEQGsorFAUOokZrBZ2gnrN8bkS7qJibSdk1DYnlcZThKTL51j5JiRDi
	vhnyD3z33Cv98HhYxHCxRIoQWW5JNby3FH6lWINP8UIDwN1/kIm1yCJdHp5ECsi0
	HHL2JW4a9JzR6ZVez71NLrINHPPdxfkeLAqL8NriZJBShOJeBbgQ6oHoyibtikY3
	xf7JKIDNlJuSjdZt9Cy0+w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y50bkwek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 00:33:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51P0UE09025437;
	Tue, 25 Feb 2025 00:33:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51f0q94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 00:33:21 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51P0XI1x025171;
	Tue, 25 Feb 2025 00:33:20 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44y51f0q87-4;
	Tue, 25 Feb 2025 00:33:20 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        peter.wang@mediatek.com, quic_rampraka@quicinc.com,
        Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
Date: Mon, 24 Feb 2025 19:32:49 -0500
Message-ID: <174044345145.2973737.15116992944360697674.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
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
 definitions=2025-02-24_11,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=955
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502250001
X-Proofpoint-ORIG-GUID: 7ty-sRKwHsNKQL1Xn1bsKeyU2f8-As33
X-Proofpoint-GUID: 7ty-sRKwHsNKQL1Xn1bsKeyU2f8-As33

On Thu, 13 Feb 2025 16:00:00 +0800, Ziqi Chen wrote:

> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.
> 
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> SM8750 MTP + UFS4.0
> 
> [...]

Applied to 6.15/scsi-queue, thanks!

[1/8] scsi: ufs: core: Pass target_freq to clk_scale_notify() vop
      https://git.kernel.org/mkp/scsi/c/5e011fcc7d16
[2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
      https://git.kernel.org/mkp/scsi/c/367a0f017c61
[3/8] scsi: ufs: core: Add a vop to map clock frequency to gear speed
      https://git.kernel.org/mkp/scsi/c/d7bead60b08e
[4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
      https://git.kernel.org/mkp/scsi/c/c02fe9e222d1
[5/8] scsi: ufs: core: Enable multi-level gear scaling
      https://git.kernel.org/mkp/scsi/c/129b44c27c8a
[6/8] scsi: ufs: core: Check if scaling up is required when disable clkscale
      https://git.kernel.org/mkp/scsi/c/eff26ad4c34f
[7/8] scsi: ufs: core: Toggle Write Booster during clock scaling base on gear speed
      https://git.kernel.org/mkp/scsi/c/2a25cbaa81d2
[8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes
      https://git.kernel.org/mkp/scsi/c/6d7696b4d447

-- 
Martin K. Petersen	Oracle Linux Engineering

