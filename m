Return-Path: <linux-arm-msm+bounces-48320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC9A393A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 430FD188500B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 07:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22BA185B67;
	Tue, 18 Feb 2025 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Efn8E4w3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1CF33E4;
	Tue, 18 Feb 2025 07:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739862242; cv=none; b=p0ZX0S+X9hI+U6qY0x6RBS9sbUXalEKHIA7eYy0kvA5GN84kGDYKRQcVNfj6zqYsuKJ5cPfGkL1/UzvWA2+3O1T+Qbd9QSqOzNG5fNfEu7i8oRxlrXpHCbe+u0P9m61q6k/5rwzXHYpyWQQLwJoXSES/34qpJDnSlnXJ9EahCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739862242; c=relaxed/simple;
	bh=/liv7crXvwWAbjuQyGYyE5HVh1xY5iD4gq7qw0UMzgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iJnKR6ybOyL24rybHDnASJXpo+rCY8usEVHFHsb8pThC9tHj/B1kYtzzZPDHa6sU/CD2QqGApR99MjB1mefM4MNg8m1IPuHc9tjHzJ38fRTtCYGx6C/X3fVwC37Y8gt+AucPo9AWwKfZ3AR7zKmd3RQl50pffNWHRl54xoj8/Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Efn8E4w3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I1p3Ya017072;
	Tue, 18 Feb 2025 07:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nu9QXqKpYlT7UJ+KoRgIAsvAzOLcOhqUfQwqUtu3uYQ=; b=Efn8E4w3Tth8bX/0
	9UBtVmZc5e0uSVACZV/KMjH85A8JjXqJwFuNXd+SvyBaTrAGmc//Bqj+IsEF8RjD
	O/kAdnudGLy1mL9Abtks2M7izW/BScURh266oBnm7kV4Inw23Cun/7YAVzM71Ete
	nLTQ/UCxBIUhZSmrAUfwi5l4rRZ5kRFu4pdAZMxnL8/WjvIJlS9PGE0iVqBBuvis
	CtUP9UVIyQGiEmI0J0K7I4S5PMHerUtLTfdBLn3FQNcpQplMXhS8120BN2Iiwfui
	w8QbBiJICi+SDTo0VpAGUSIovblVaEHjlfCCo+gh0CqaRsiO3Be08NRW5PViSiL2
	uzi5Wg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7uuxap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 07:03:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51I73ux2016901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 07:03:56 GMT
Received: from [10.218.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 23:03:52 -0800
Message-ID: <7834c2e5-8c0a-4223-abfb-e21ae82d9e0a@quicinc.com>
Date: Tue, 18 Feb 2025 12:33:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gdsc: Set retain_ff before moving to HW
 CTRL
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
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20250214-gdsc_fixes-v1-0-73e56d68a80f@quicinc.com>
 <20250214-gdsc_fixes-v1-1-73e56d68a80f@quicinc.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <20250214-gdsc_fixes-v1-1-73e56d68a80f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6UK_BgimCiztUGJuub_i3LL7fKFWuvN4
X-Proofpoint-ORIG-GUID: 6UK_BgimCiztUGJuub_i3LL7fKFWuvN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=768 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180053



On 2/14/2025 9:56 AM, Taniya Das wrote:
> Enable the retain_ff_enable bit of GDSCR only if the GDSC is already ON.
> Once the GDSCR moves to HW control, SW no longer can determine the state
> of the GDSCR and setting the retain_ff bit could destroy all the register
> contents we intended to save.
> Therefore, move the retain_ff configuration before switching the GDSC to
> HW trigger mode.
> 
> Cc: stable@vger.kernel.org
> Fixes: 173722995cdb ("clk: qcom: gdsc: Add support to enable retention of GSDCR")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gdsc.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 

Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
Tested-by: Imran Shaik <quic_imrashai@quicinc.com> # on QCS8300

