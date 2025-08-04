Return-Path: <linux-arm-msm+bounces-67642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6347B19BB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 08:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01106165B25
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 06:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629B21EDA02;
	Mon,  4 Aug 2025 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ty17tV5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FC1519B4;
	Mon,  4 Aug 2025 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754290156; cv=none; b=SweVSzA73djfJf5EoHLCU+GVhdsddf5Tih1M3DqAGU6gYDQEpX3VGNxsQMcHCyigHYtg10Tg3LAiQtcPkCvd2yvrlLhJPTgFh0lyesxbFj9YsulCO8o32ipWTlMXiF9qQkHjfvMQPCK/ZyaRTCNbBjl4ruZtaD6euji4chebVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754290156; c=relaxed/simple;
	bh=bH/OKB0iXBBeMw98g6AmQ/DBCMkRJab3HR345SxoPd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=peMOGnPfbqC/AerxXiRwcEzg1mwEGM51qBJEh2AVrd6Eq11ql2XPJ8MAOuuDukUSqynVlaD5PkxXuN7bpyniDEsqZfar+alzxsN6NUGaMiSumyIyCg1PKd6HhK1QZ6s204IUQfVUdDTDX0rl/xD3DF39Dr6WuX8KVlvA4egHxfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ty17tV5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573JrNpn019944;
	Mon, 4 Aug 2025 06:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gs1pMseRuEEN8I2f9dD26+jagK1zs4LRt8x8ariZTcM=; b=Ty17tV5uCri5TvIC
	ZK8W8r0nCcPjvK72nUAeIrl9Gu/iR9I+VAzxZytqLrzWIWqbQhuljrMxETLFiUJ0
	qg7cwRjF9IRhQLBrGgRNUYVqdjGV7EgP0ckP4iEx6acm7t7bAFBbP5DW9VAFQLcQ
	+NbQOIdaWAvxUT11JPdCUhGRqXg+WFPtd16Np4iqHJuv1IPjqR2aq73Xg3clE1bz
	8U0E7ar9SbZXocDuR+svAEJRXh5wnDcCBl5/m4bwNGVwKrsHTWOCX861OFATc8fb
	46OYn91r2B1WAOSlnqcyUmQqciiHmR6RBtTBJyUexpHOvHeUq0jQzpd4Y+MqVbHO
	16hD9w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqkq2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 06:49:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5746n8Tf021941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Aug 2025 06:49:08 GMT
Received: from [10.218.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 3 Aug
 2025 23:49:05 -0700
Message-ID: <c69e8347-e005-47a5-9e20-6806c92f7b0c@quicinc.com>
Date: Mon, 4 Aug 2025 12:18:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Remove double-space after assignment operator
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>
CC: Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250802-topic-clk_qc_doublespace-v1-1-2cae59ba7d59@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <20250802-topic-clk_qc_doublespace-v1-1-2cae59ba7d59@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1AYlROAuJ8N3xaHjGaUhPWoVuELhgmuB
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=689057e4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=wXdJWVuGbmjov8BqX20A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAzNCBTYWx0ZWRfX8pdXrJ+xTOYJ
 COTaPznWu9u6xQmAFqH7+iVrMaiNBGybEXpFT9f5wU3QFpDT7A/vfvABQO+I64EweX0aNXBsSkc
 hujPawnMKZ1FD6ZLOKPfOAkNzDUE32lUWg2W//TRcOg1Lu/dj3IRXUmySlUQlH0cDIj7Y8mYZtq
 s6bQBrvOlhh05LQ5nkGn6yhuShF+BVg+yilkmD1wovmMkua8IVrZQQs40UO0zFBxGS+Jr2hmCg9
 qE+UJ3/yB+GZ+3QgG4HC9PLqhm089AFwWG+iJk1BSYieFULyqJjbLCukkjMpZ5CiReqa7LsNIM5
 YSNBb7s+gNLvqUh2znlifUBp25HazJxv2Z9HXtUeQngEGUVi4jf2BZLhvSZ6bgO0c9P76D8kgXv
 BI6UUBK3ABM0U8DN40yf9OxO/FmLWJzdB00FSB5KrYjm/YMqcMNyTCqr5tg068fR6wWfbKnU
X-Proofpoint-ORIG-GUID: 1AYlROAuJ8N3xaHjGaUhPWoVuELhgmuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=864 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040034



On 8/2/2025 5:14 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is an oddly common hiccup across clk/qcom.. Remove it in hopes to
> reduce spread through copy-paste.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/a7-pll.c              |  2 +-
>  drivers/clk/qcom/clk-alpha-pll.c       | 26 +++++++++++++-------------
>  drivers/clk/qcom/clk-rcg.c             |  2 +-
>  drivers/clk/qcom/clk-rcg2.c            |  8 ++++----
>  drivers/clk/qcom/clk-rpmh.c            |  6 +++---
>  drivers/clk/qcom/clk-smd-rpm.c         |  8 ++++----
>  drivers/clk/qcom/gcc-qcs404.c          |  2 +-
>  drivers/clk/qcom/gpucc-sa8775p.c       |  6 +++---
>  drivers/clk/qcom/gpucc-sc7180.c        |  2 +-
>  drivers/clk/qcom/gpucc-sm6350.c        |  4 ++--
>  drivers/clk/qcom/gpucc-sm8150.c        |  2 +-
>  drivers/clk/qcom/gpucc-sm8250.c        |  2 +-
>  drivers/clk/qcom/lpassaudiocc-sc7280.c |  4 ++--
>  drivers/clk/qcom/lpasscc-sc8280xp.c    |  4 ++--
>  drivers/clk/qcom/lpasscc-sm6115.c      |  2 +-
>  drivers/clk/qcom/lpasscorecc-sc7180.c  |  2 +-
>  drivers/clk/qcom/mmcc-sdm660.c         |  2 +-
>  drivers/clk/qcom/nsscc-ipq9574.c       |  2 +-
>  18 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>

Thanks,
Imran

