Return-Path: <linux-arm-msm+bounces-56483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14779AA705D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A9954C4601
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 11:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43272417C5;
	Fri,  2 May 2025 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KOm+evr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC51F4199;
	Fri,  2 May 2025 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184057; cv=none; b=ZzDZ5exr06m9i5lYX+yo0OEy0o2dsDsRgYOtAQZUTyii/7DIhppJXDOkOh3rJ6DWaPpI/KedvMwCJxsXuJMfl8N44KX3XBKuPLddABdi+ye/xFMhiQjyYd4u1KuUuJ8r9BFqlWMvDziPGAwDN/o1gXs8iJc5inyfm8KuKHZyb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184057; c=relaxed/simple;
	bh=1b4Kb3LvxBVzbmNQ00pRLTx4VQ+WH7UNQb8GL1n96EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F8EZPx/oc0IECKt5yeXaOshxYddJJ6y7z5spK3Nm8s4Q42li7+yLGEhIkYorgXMwS8JLghiQHGcC8IJLqrcct4TUYComzQyFjmdM5d2/UBisixGUPDdMLf+Locd2MqCczOTNJp83buhMqVIrOeSB5CWVayqjvRSAS2rFXztlg38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KOm+evr1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421OsP0017879;
	Fri, 2 May 2025 11:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jqe2e9ueVUgG/clmesDdK+LIXJfRJpGZSVcm/s1SwVI=; b=KOm+evr13LH9+rcN
	87MT4moCIl0yJggw+Cgq1M+wscFBtFgh4ifnasBc/l/BRPJ4Rnv1grKFnp268zKD
	C+r0Bb9QvRnv3RRGpPHXFvuPrbyUYEyanPUZQsZLZtaNXGTY/DOnU//T2QKrCrb+
	OBhYRqdAKn5dpr+fJVc3nSpD0UP/PQYC3htB+f8+wkrMxC5OXe6RTxka2oFq8HtD
	6wR5+SsYYoZ+e6n85B8LQ/9YTvdlDvjPWLylzHbKZk4L14OAk2ubjXCl3qekBOdd
	Exg95OUZPklZlSbo+85zhwhpAXFM2KvmpKeA3S87woSD33+wjnNyz8+dL+MrWZ5M
	5GF/BA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u203w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 11:07:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542B7T93016582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 11:07:29 GMT
Received: from [10.216.12.65] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 04:07:26 -0700
Message-ID: <c86eb414-d11e-4e68-a61d-6034f989a71d@quicinc.com>
Date: Fri, 2 May 2025 16:37:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc: Set FORCE_MEM_CORE_ON for
 gcc_ufs_axi_clk for 8650/8750
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
References: <20250414-gcc_ufs_mem_core-v1-0-67b5529b9b5d@quicinc.com>
 <20250414-gcc_ufs_mem_core-v1-1-67b5529b9b5d@quicinc.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <20250414-gcc_ufs_mem_core-v1-1-67b5529b9b5d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6814a772 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=gAXrXOzCDS_PG0fV7eMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NyBTYWx0ZWRfXwKnIYEmKc2tx Kjf7vPjem8alUYl7cLoTOsjMuH9ULMzK97M27R3EuGxS6cWbBgxuprcMkj+7Q73Avof9czTG94F a6jVuIM2WmvEeW3Dk0y1/xMfZwzsizFt3XAAIvJlmBnCfQoVH0fdHYb/801IeHLjEei4ohg9uAh
 Wtx33+rkE3VeivOaSko+xTg9vBmSXKHZCGc7AaZgQN0hYIysaow7WXwPvaCJZ8vGnpfzkJ2kQwC 3YrHcMqh1t/Bp1fu9hR8VSUncPN/7ae57SQy/SIIWsBE5Tux89JHBOEBoo9Qp5XwJftMbHuALGB BZybhBR7x3xKFtHlaLvmM/59d8rjqPBFDoOLXTEHGbtTto+fLqWBLRCoFwauqJXE8SzJsp22ieJ
 ZsNBfxlh5giOUzDRzXb62nasiqcniZ/HQ+2O9MbsC9JDGWxQdkX1l4FL7I3fQQTPJi2Z79dw
X-Proofpoint-GUID: 1ztGRFG-jNAm7Kq3Xi7ABpsYHC2N-_ik
X-Proofpoint-ORIG-GUID: 1ztGRFG-jNAm7Kq3Xi7ABpsYHC2N-_ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020087



On 4/14/2025 2:30 PM, Taniya Das wrote:
> Update the force mem core bit for UFS AXI clock to force the core on
> signal to remain active during halt state of the clk. If force mem
> core bit of the clock is not set, the memories of the subsystem will
> not retain the logic across power states. This is required for the MCQ
> feature of the UFS driver.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sm8650.c | 2 ++
>  drivers/clk/qcom/gcc-sm8750.c | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>

Thanks,
Imran

