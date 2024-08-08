Return-Path: <linux-arm-msm+bounces-28139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5E94B7D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 09:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E5531C21CF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 07:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C361188003;
	Thu,  8 Aug 2024 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="obuFWtQm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF97464;
	Thu,  8 Aug 2024 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723102084; cv=none; b=TYH5abx0U8Uy0gtCsGouIEjz2/rk+i5EV2F+x7ICb8c1xeYV9P1CXd2G3nTqBD8ZCwVQH2HtPo41NjhnHs8UHMPiU6uArqoakPIWWk3bhaIBKJY+43P9yZ89n89BguwmQcqQntGaaqqUm9N6pH5CygYwJrPOoCqvn3bEuzfS3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723102084; c=relaxed/simple;
	bh=iKFF9cuoPKYMCCFAiUSWMPfk4pgo+XWQPV1zsB3QMyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PDFjoSmcZdKFijsLJShWHqlD5TrD2FeoGpgYcHkQrZGNpw/gv+IrDn/TX7zTWe/21STx2SdWXBiRLqGAkaDYxf8bNVwdz/ZM6prxvlPOR6P5PZz0NVhqL4DCJ0BPLLq287//L5HbmOCk8zAtM/7jU+BF/HLWIJGAc81wihA8hFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=obuFWtQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477HLYC8007155;
	Thu, 8 Aug 2024 07:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05dLjMhMWKbkdONJ2XhA0SRRF3OQ7tGCFSjCCChUPFg=; b=obuFWtQmsB2WLnw3
	KyPcSbvPAuBk/zYPETbOi9UPML+wR1lWPGCQOWau8wiEuJ7cBg7gMWeAPL7tlrsr
	XQBdFElEhLxM7lEXUCzKD4rz8P756lWgYuqDKTHHDBHus+H0No7TJ7bHVPGNHjLi
	lo2tkHBdSJlM8sAkn7u4AUVq8Kj08n4CLBhbCewcxkPbk0W/V2egzHLWvmCieWwj
	FJyQJQbB+MGwr6p/Wl0y+cJ9yX9aTl271+f7cQrlLXL+Dsc0cLM1UO4yji/W6r8v
	Ixcr3e8iHtg4nP4Ufpv0lU+YNTEVkgfNdKc6nsUTTPGa9X8DKrPmaBFH2iOeRd+o
	/XDQLA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx6w5r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 07:27:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4787RXvf028619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 07:27:33 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 00:27:29 -0700
Message-ID: <b4c58fbd-6d9c-4c1b-a21d-7650a6c4270a@quicinc.com>
Date: Thu, 8 Aug 2024 12:57:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Fix overflow in BCM vote
To: Imran Shaik <quic_imrashai@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        David Dai <daidavid1@codeaurora.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>, <stable@vger.kernel.org>
References: <20240808-clk-rpmh-bcm-vote-fix-v1-1-109bd1d76189@quicinc.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20240808-clk-rpmh-bcm-vote-fix-v1-1-109bd1d76189@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i4trENvTsXmF50C2CTfhtJZ0yy4-T06-
X-Proofpoint-GUID: i4trENvTsXmF50C2CTfhtJZ0yy4-T06-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_07,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=989 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080052



On 8/8/2024 12:35 PM, Imran Shaik wrote:
> From: Mike Tipton <quic_mdtipton@quicinc.com>
> 
> Valid frequencies may result in BCM votes that exceed the max HW value.
> Set vote ceiling to BCM_TCS_CMD_VOTE_MASK to ensure the votes aren't
> truncated, which can result in lower frequencies than desired.
> 
> Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index bb82abeed88f..233ccd365a37 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -263,6 +263,9 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>   		cmd_state = 0;
>   	}
>   
> +	if (cmd_state > BCM_TCS_CMD_VOTE_MASK)
> +		cmd_state = BCM_TCS_CMD_VOTE_MASK;
> +
>   	if (c->last_sent_aggr_state != cmd_state) {
>   		cmd.addr = c->res_addr;
>   		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
> 


Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

-- 
Thanks & Regards,
Taniya Das.

