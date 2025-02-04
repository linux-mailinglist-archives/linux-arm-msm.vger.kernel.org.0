Return-Path: <linux-arm-msm+bounces-46842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38189A26AB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 04:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B138A3A6AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 03:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A7F1EE014;
	Tue,  4 Feb 2025 03:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FFJfIXHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D73D16D4E6;
	Tue,  4 Feb 2025 03:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738640116; cv=none; b=IYww34eIH++eP7LHjNlobCOrFVlPEqNp8lHI2O/V34gQuveuiSLnI5cpxR3nUubxOG/FTaaoISgtWkgFqKEuE0WlMfFOxz52XYC5PSyzHGS8jnJH+iXeMd0vFEDypSeCv1b9u4Y/02dmuZ0YfHHa1upCAmPvk+ox80KfE+SE92g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738640116; c=relaxed/simple;
	bh=LvjcqtCOQasUzHGgpJ3ldZuX5qUSyl44nPnp8M2+sGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YcvlIcTKCmP7HxR9yYvM1YQBBPG+JA1291MDceAI9+GmQTwz6zsznJf0iunHJV4XCrvvsJsnRK+/LzUleWcrtT5weDT3EtaXhyLIKy+ByswnuQVyNxUGjpkeHu2mJZD40xaA2tAouNzsbWVbaWiVyfOuBFfNvMfbq/zPjViZ6gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FFJfIXHj; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141Mpce008581;
	Tue, 4 Feb 2025 03:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=OljqLUza+/baG9lUxsAUE7xPAIhfTiIdxHd6klwyagw=; b=
	FFJfIXHjRuOGQVijrnCzoA156Qk+NYpQhSg1UlL94wBJ77jYyJv4E/QsaaZEVZvF
	MzRNI0Ga7MuJutF9QhkpTcPsVgJ57L8l1ftRhMKWNTGsHswN5c5uwnOv7MWwSFYw
	Aqj+IrOeLwJKeBJ1X9jxBUsVowFlbdLc2I+PcPtXBBpqh1iOwAdzwuR37b8iwYJs
	CMVDWLn6y4gofR9Cu/VIEB04UoqX1PcR11WebONqF1/fPOC1bj72q1vhYDGSN7Q3
	wUbfJhLpOsDthRV8CnngZlJty2zAQ8HizjK7nl2gb/PJutdYh7r+wiASEX4mKx4W
	uXFkHdD25UhN3YuQYM2n8Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjtuy2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 03:33:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5140C0vi038928;
	Tue, 4 Feb 2025 03:33:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8e76f08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 03:33:55 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5143Xs6k015172;
	Tue, 4 Feb 2025 03:33:54 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 44j8e76ex2-1;
	Tue, 04 Feb 2025 03:33:54 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Satya Tangirala <satyat@google.com>,
        Eric Biggers <ebiggers@google.com>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4] scsi: ufs: fix use-after free in init error and remove paths
Date: Mon,  3 Feb 2025 22:33:04 -0500
Message-ID: <173863996284.4118719.16500657324570528150.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
References: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
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
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=888
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502040026
X-Proofpoint-GUID: aWx47z6fFMo2i7ui5DF1-UpbrtUACWdk
X-Proofpoint-ORIG-GUID: aWx47z6fFMo2i7ui5DF1-UpbrtUACWdk

On Fri, 24 Jan 2025 15:09:00 +0000, André Draszik wrote:

> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshcd and therefore Scsi_host
> allocation.
> 
> [...]

Applied to 6.14/scsi-fixes, thanks!

[1/1] scsi: ufs: fix use-after free in init error and remove paths
      https://git.kernel.org/mkp/scsi/c/f8fb2403ddeb

-- 
Martin K. Petersen	Oracle Linux Engineering

