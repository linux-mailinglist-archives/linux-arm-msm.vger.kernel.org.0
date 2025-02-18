Return-Path: <linux-arm-msm+bounces-48321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC579A393A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390CC166C2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 07:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7652D1B983F;
	Tue, 18 Feb 2025 07:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q2QHpV+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A228233E4;
	Tue, 18 Feb 2025 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739862248; cv=none; b=UiVqMb+WhzqvXoQqUQ96wT4495Tm0qep+egPySVSzG9lnxMBZrbukX57XCszJ+k7kpWqcaCzh6GSEX6XyRPtHuSrZqt71swBvu4HH0mp+6go2bvesAOzJdek2KLe7kEHXCVcEeQCbBDEzNLfxMD414tl/rkDjOZCX/1m8Bdgmt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739862248; c=relaxed/simple;
	bh=v27i0/Y7IbMkoMl5dXY8lkEEmNmBXsOtf2ypUWvrK/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D84x3aWEYeZdQ2UZ3OX3ZyXXrxR25PnaM8bufeWLYy5KCdmi0FND4kqflWwXKDz/iqn0U+9Cz/hCjpJHIg4UfUZSMNYfAJX7Xo1BnmJqzRao1xA3/go4m5L56H8YfhQ9D1BI1hGuvewq1npDBf49yOcP3bQ4+CUTi6qot6mDJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q2QHpV+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I1MaR1027314;
	Tue, 18 Feb 2025 07:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSL9zuJUXEbXclE9+b+diToGUZd9DITU+37fs3p/eOM=; b=Q2QHpV+Te0zhOcbS
	FvlUb8BuTY0tQj4YizDN/Cd/0mG5+jvaPm6hx4gEQGSqBGD51B1TzBjXgbBLxgdb
	zT7Ap8eQ2C4TMW9/Ifpn4o9zyIYfGfgAzryit8PMHOZPR11yYfTyCXZnRpzzDiiU
	q/1Jk5coHXUChW+FB8IEs8v+rIq/fK68WD6ykvCTi2UQmcHP9ODn9mCfb7/CctSm
	sAxxL3h1a5/tyPxl4IKfXh2oRFWdcxQmuPnQBdtIGEnZznZIOAW4f5tEbQW2mKCY
	YsVpmBv/kpvLxuuP9dh4Pqlj91wVG2rrhEkQAI2Q56MlyEMFwDc3rbB7a8/ZLllu
	FWkazA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7tuy59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 07:04:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51I741bB013716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 07:04:01 GMT
Received: from [10.218.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 23:03:58 -0800
Message-ID: <4b4a70f1-0419-4383-a63e-5fc2ceb27e7b@quicinc.com>
Date: Tue, 18 Feb 2025 12:33:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Update the status poll timeout for
 GDSC
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250214-gdsc_fixes-v1-0-73e56d68a80f@quicinc.com>
 <20250214-gdsc_fixes-v1-2-73e56d68a80f@quicinc.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <20250214-gdsc_fixes-v1-2-73e56d68a80f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 35hD-d9h1xsySEXke3bIt2dxLAFRR8Ro
X-Proofpoint-GUID: 35hD-d9h1xsySEXke3bIt2dxLAFRR8Ro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502180053



On 2/14/2025 9:57 AM, Taniya Das wrote:
> During the GDSC FSM state, the GDSC hardware waits for an ACK from the
> respective subsystem core. In some scenarios, this ACK can be delayed.
> To handle such delays, increase the GDSC status poll timeout from 1500us
> to 2000us as per the design recommendation.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gdsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
Tested-by: Imran Shaik <quic_imrashai@quicinc.com> # on QCS8300

