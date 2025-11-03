Return-Path: <linux-arm-msm+bounces-80051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27CC29F61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 04:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C4983AF16F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 03:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB2B2882D3;
	Mon,  3 Nov 2025 03:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ofREGU/b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2127FB12;
	Mon,  3 Nov 2025 03:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762140565; cv=none; b=pjGv+tRJeGdrtYIGJHMQom+ZTq6lTdiVi3NfwUlInLCu/K+tT3xhG478TxZS6iGYNhY0SgXhfx3ll5R27adb+g/zv9vfD/JY4CJQg88oUaLsCqq8rqRa+ckj7KmcYHZYQqhasfMsQrdXmsrOjVW/tMKR6Khoe0cynfqFX5ih0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762140565; c=relaxed/simple;
	bh=tqmitF/29Z4qlmJwQbxhrvzFFGjOil8856TO5Q4MXJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gv86jzygGBp10v6xCq0PL7x9f9gExDG0g1csBjozTObd3Btgnl9Kklna+eTBSp+OZmzcGoYHuiA3S925J6Pu+BZ1YmybaTi508mf8pMqDTUxZ40OYGNnhPHyz0yUrlHW8Pj4e+SQOu+C3kPC/A8Szg+xA/IvIrgbVA7TgHyjFXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ofREGU/b; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A33P1YP026448;
	Mon, 3 Nov 2025 03:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=X/229lv+AJ3iI3m1nNDbvqrCsH8Cak0URuZG25qwuOk=; b=
	ofREGU/b52VhUyfDOLAORZWRW4tdZRNTSqb0677WoH2aChlx53RJLh+JOcIVJR15
	hi8icCsi5+/uMAphFvVF9tCEKlEamqEIDP6lo0qGKKC+PXX59ZTGcxctbmw8ZVku
	NXcfsN4Yb1gF7Y0MIEt4N6Q6e10WKpQjNm5syS+Vst/z8qIQiI0rsmpR1T2uzWIx
	mGf+yTDUM8Qi8iRedwIt5tOenH4kRsX3OykZKMuYwBxHeGvm6NjVoENIQ0RYJBub
	cYF8SeK/fFvo4v+XjHQOg3zJbfzExrdbGcB8cVs6MuuMCgdZSwn1ZnwcoSomsDL4
	6uE83vEfkXUWLIaeUjjNJQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a6mf6g0cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Nov 2025 03:29:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5A302BYv017316;
	Mon, 3 Nov 2025 03:29:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a58n7av8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Nov 2025 03:29:14 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A33TCcr011931;
	Mon, 3 Nov 2025 03:29:14 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4a58n7av6s-2;
	Mon, 03 Nov 2025 03:29:13 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] dt-bindings: ufs: qcom: Drop redundant "reg" constraints
Date: Sun,  2 Nov 2025 22:29:07 -0500
Message-ID: <176213716994.2123602.16843780415769421339.b4-ty@oracle.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027113107.75835-2-krzysztof.kozlowski@linaro.org>
References: <20251027113107.75835-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=815 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511030029
X-Proofpoint-ORIG-GUID: MyYMB18UIcZUsSklm7lIqfu-nJzz1MS2
X-Proofpoint-GUID: MyYMB18UIcZUsSklm7lIqfu-nJzz1MS2
X-Authority-Analysis: v=2.4 cv=Xp73+FF9 c=1 sm=1 tr=0 ts=6908218b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=A0Ky7YohR1HiQrBXehkA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDAyOSBTYWx0ZWRfX30U56Y9Yv6fy
 D2xWjzSvB8XDvNJtg+ODC7VhAuR6251pzddB4hLkguD6XKyF1thq4VaFGfE8NujRdFsOOyz0nQF
 u91D5FOYAhDy1VMT+DqqJ1p6qL/c3ACNE9gA8QycPNzFnB+Rl9mxCoDf4Qw5ZZiFxdrCC83ZC/m
 LDwp6jv94hheMPPoAL6rSmpRyUwxAbIfnqxLASODImTMr8V51m9+FtwMrqdsVXEVy1lndIxWMrs
 uAF9LT6imOLwmAV0WOD6+eU3IBtemlM0ojJnsY4rxT3mRfbrmLcsQc5ZCrhOcILdEBS1MACK2dl
 RYEA6T3WvgmGKUOUD9+6Q8t3mzday36qqGi8OYoIKaivzO7WgbtZ8NINhz4aP6cP4elRWyWP14m
 iVqtGjIyt77+xC6W0I641Tie+/WMDg==

On Mon, 27 Oct 2025 12:31:08 +0100, Krzysztof Kozlowski wrote:

> The "reg" in top-level has maxItems:2, thus repeating this in "if:then:"
> blocks is redundant.  Similarly number of items cannot be less than 1.
> 
> 

Applied to 6.19/scsi-queue, thanks!

[1/1] dt-bindings: ufs: qcom: Drop redundant "reg" constraints
      https://git.kernel.org/mkp/scsi/c/525a411f9a5f

-- 
Martin K. Petersen

