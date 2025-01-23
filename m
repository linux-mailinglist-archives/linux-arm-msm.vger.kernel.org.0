Return-Path: <linux-arm-msm+bounces-45988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0DBA1A504
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 14:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76AF3188C7CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B24A210F6D;
	Thu, 23 Jan 2025 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lVgiSUWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EDF20F98F;
	Thu, 23 Jan 2025 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638962; cv=none; b=tCBEXfkPM9hj0iKJSQRxgKerYk9Jm8Ow7fFDMXHt44gQoq3xoLY/JcEzY7Voz0kd9f079N/F7PEgLpDvIPLKv7WkH+qTH12/fRpdvmiBx90sIC4i/H9jNR7WskgtrWv6ysCYcLRW3CA4zKJpBtM20GSGMYJP9VZwqmCB+AJ93/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638962; c=relaxed/simple;
	bh=ORV782yc+Xa9p2g1Kkfw4AWuIgFv3ctCh4Pi95fq/8U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYlkWb4J+VLE8iwiJZxNfB43iTqKugZEm6qI6RKWQ9Q5TG5BBYzfPUjFbfssCKiLTxx1/oSoUsxPXoz4S6mbh5O9v9+i7ZOXpxhyEE1GQpeYuMYlbkjgabZuCc6blNVDiUdT+Oed1ukw0X5h7pbzGjRwcY2I0Lyovp9aOKJGl/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lVgiSUWV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NAo2jv024913;
	Thu, 23 Jan 2025 13:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8lxYdh3YczE7Et2KG6V1s0UxT73D3aeU59zH165uOg=; b=lVgiSUWVN12fhIpk
	dKBcxRf86qf7WL81MFMOYz9eIoEwT+J2K3deK+Gdyl7kdHpixIexZU1S9u23fIUR
	4rqn7w1ewHmnOfeI5EADLL8ZQKM6QwZ5kah45jcF5xbbWxXLCxGQgYvNYyfs2tNd
	Rb678qu+6V4AKJCJUBKs2ZcNzed5IWcDH9VQnUfoQlljT7Y9bN/Ywd8OLHmUrbez
	9vI+lKTMSH/Oolo54qnCbTIG1IwEzDOZP/Iy7fJ09d+7gYyrJF+L25//t7/Foq2C
	cDKua7hy3r4t0O9TN2D6DN869lfKLmUbz1AocUet8hkbUocgu+U/62oxSksV1W2F
	j6or5A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bmbg8c54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 13:29:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NDTFWc021185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 13:29:15 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 05:29:12 -0800
Date: Thu, 23 Jan 2025 18:59:08 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
Subject: Re: [PATCH] clk: qcom: ipq5424: fix software and hardware flow
 control error of UART
Message-ID: <Z5JEJCJsYDz9b85b@hu-varada-blr.qualcomm.com>
References: <20250123111618.1048461-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123111618.1048461-1-quic_mmanikan@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tEv4nDBXFgDgKUwnP8x9fnWOBhQ2Fb0n
X-Proofpoint-ORIG-GUID: tEv4nDBXFgDgKUwnP8x9fnWOBhQ2Fb0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_06,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230100

On Thu, Jan 23, 2025 at 04:46:18PM +0530, Manikanta Mylavarapu wrote:
> The UART’s software and hardware flow control are currently not
> functioning correctly.
>
> For software flow control, the following error is encountered:
> qcom_geni_serial 1a80000.serial: Couldn't find suitable
> clock rate for 56000000, 3500000, 2500000, 1152000, 921600, 19200
>
> During hardware flow control testing, a “Retry 0: Got ZCAN error” is
> observed.
>
> To address these issues, update the UART frequency table to include all
> supported frequencies according to the frequency plan.

Would this need fixes tag?

-Varada

>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
> index d5b218b76e29..37b1a3ff8f4e 100644
> --- a/drivers/clk/qcom/gcc-ipq5424.c
> +++ b/drivers/clk/qcom/gcc-ipq5424.c
> @@ -592,13 +592,19 @@ static struct clk_rcg2 gcc_qupv3_spi1_clk_src = {
>  };
>
>  static const struct freq_tbl ftbl_gcc_qupv3_uart0_clk_src[] = {
> -	F(960000, P_XO, 10, 2, 5),
> -	F(4800000, P_XO, 5, 0, 0),
> -	F(9600000, P_XO, 2, 4, 5),
> -	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
> +	F(3686400,  P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 144, 15625),
> +	F(7372800,  P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 288, 15625),
> +	F(14745600, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 576, 15625),
>  	F(24000000, P_XO, 1, 0, 0),
>  	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
> -	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
> +	F(32000000, P_GPLL0_OUT_MAIN, 1, 1, 25),
> +	F(40000000, P_GPLL0_OUT_MAIN, 1, 1, 20),
> +	F(46400000, P_GPLL0_OUT_MAIN, 1, 29, 500),
> +	F(48000000, P_GPLL0_OUT_MAIN, 1, 3, 50),
> +	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
> +	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
> +	F(58982400, P_GPLL0_OUT_MAIN, 1, 1152, 15625),
> +	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
>  	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
>  	{ }
>  };
>
> --
> 2.34.1
>

