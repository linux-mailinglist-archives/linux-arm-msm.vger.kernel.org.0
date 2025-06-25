Return-Path: <linux-arm-msm+bounces-62281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E96ABAE77B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81F001BC3C49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46871F9406;
	Wed, 25 Jun 2025 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nH7qaW6J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D23074B6;
	Wed, 25 Jun 2025 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835146; cv=none; b=prn4gsaXwHcCdbwJGiK5hK5fmu0xzi+sp7oaccyNwS8g34zWSo3/9hilRYjv0U83ycGQD+yRYVZGKoaQ0+TVCvFtaIskUL3Ex20WNdB2X9wTHcWbvr4Y5596LRbEWPc5Z/SHVKMId9OHbE2GqUOlvcKpyVKnLAsea+gFCLDJtO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835146; c=relaxed/simple;
	bh=C8yOTr2y/ecq+XG3gb4efefaUAO9l4eh1vFoEJY055o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IG4PmLJ78f1xqiH7LCMrDrpGAs1g1/hnunaVAN4eQu9PZG6xzX6vHwEF8oBXOnJZQPthY7190ZmrT8aCO0gxUry7WXavauZB6wVe9y6knK9CmtBleZ/IXcO2wXqAd5lMKAU7fk890giaMvOl4kT2DnbmFOc2kyjdYlJBMdj6toU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nH7qaW6J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P29lH6021627;
	Wed, 25 Jun 2025 07:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crqnE/nUYztq4F530MZIziu+Af+0tTqHnaVisl8RQhU=; b=nH7qaW6JRu/fPHgO
	zLxhrYC4sQvoOyMeENQOLdN2V3SMeaJd//vg6rgU6ccv7dXoFVj91X20kxJy/Y8S
	Pc0HHCYY19RkZfTKuQD8L/ZqNstRX4T07yqknxycCt5tTueMm0NkJuTaj0bObfUC
	SOvfyhpnl91gPOrXopg+wGXOAlczKDvMMAEwCeoXr6ByaemjllThPkphB3n7jORE
	h3mZMOMvvYS7GxrOCPOB/Si5cgKCY5Tbkp0EinTTR2FRT/XcSXFClppl6QxeUIvF
	qVvKJM/sVz4EOqQxgQ1YIOH7doF6qugG4vQG6vxrrU/Y92r/hhKZBJGBuAkQ0tv1
	brfZsw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpy42n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:05:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P75dRg024704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:05:39 GMT
Received: from [10.253.38.60] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 00:05:35 -0700
Message-ID: <1ba89074-9614-4f64-ba8b-ca81abc9a24c@quicinc.com>
Date: Wed, 25 Jun 2025 15:05:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add CMN PLL clock controller support for IPQ5424
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b9fc4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=MhXRct95NpJNHkwvU2wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MSBTYWx0ZWRfX6je8emwGC5Yc
 ne1OaQkX+kkDKE1mZkq+UVICA68vU/dwbX2ulFSvp2aaHSLkDjl2xzkuwAB3tDP5gikPWXw6PyZ
 kG7BCi/hY04y6qk8aYv4yMa1DJVsVwjSHGwanwcrboK+kCcuNZeUbaj5lj3cROVgky0nv6FnRCG
 swG2UVHJGS9yVLXUwOOrGQkIIEzz9c/f/cBXT/LD7z+fdx8Ghv4pa+QLSrUVy9nz1OZ4Q+uDZbc
 dCL1WzixmqWDBcdAX6CPREzb0dq3joCWNyTOlLOnlt2tvIUuOSltcPelc8ew4vrz2nkzKhql1pY
 4cZdSVJp2xuvVtCeaPPTYYMibcebOAnhW0eXoE+zp85hnbB9wcFpDrq5G/S8rcLINhybaTEkzua
 CcfYpTmnMduDEjDsdb2+il3RPF+tsXuRdnhZzqjlKjTKUkp5wagaGYfFxsC3aRFyfBvdAv1g
X-Proofpoint-ORIG-GUID: bajHyGKH0iirpIf91odtumNw2Oib2-8T
X-Proofpoint-GUID: bajHyGKH0iirpIf91odtumNw2Oib2-8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250051

Hi Bjorn,

I wanted to check on this patch series. All review comments
have been addressed, and there have been no further objections.
Would you consider merging these patches? Thank you for your
time and feedback!

Best Regards,
Jie

On 6/10/2025 6:35 PM, Luo Jie wrote:
> The CMN PLL block of IPQ5424 is almost same as that of IPQ9574
> which is currently supported by the driver. The only difference
> is that the fixed output clocks to NSS and PPE from CMN PLL have
> a different clock rate. In IPQ5424, the output clocks are supplied
> to NSS at 300 MHZ and to PPE at 375 MHZ.
> 
> This patch series extends the CMN PLL driver to support IPQ5424.
> It also adds the SoC specific header file to export the CMN PLL
> output clock specifiers for IPQ5424. The new table of output
> clocks is added for the CMN PLL of IPQ5424, which is acquired
> from the device according to the compatible.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
> Changes in v3:
> - Collect review tags for the DT binding and driver patches.
> - Rebase onto the latest code to resolve conflicts in the DTS patch.
> - Link to v2: https://lore.kernel.org/r/20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com
> 
> Changes in v2:
> - Alphanumeric order for the compatible strings in dtbindings.
> - Add the IPQ5424 SoC specific header file to export the clock specifiers.
> - Drop the comma of the sentinel entry of the output clock array.
> - Add Reviewed-by tag on the DTS patches.
> - Link to v1: https://lore.kernel.org/r/20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com
> 
> ---
> Luo Jie (4):
>        dt-bindings: clock: qcom: Add CMN PLL support for IPQ5424 SoC
>        clk: qcom: cmnpll: Add IPQ5424 SoC support
>        arm64: dts: ipq5424: Add CMN PLL node
>        arm64: dts: qcom: Update IPQ5424 xo_board to use fixed factor clock
> 
>   .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
>   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        | 24 +++++++++++++--
>   arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 27 ++++++++++++++++-
>   drivers/clk/qcom/ipq-cmn-pll.c                     | 35 ++++++++++++++++++----
>   include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h   | 22 ++++++++++++++
>   5 files changed, 101 insertions(+), 8 deletions(-)
> ---
> base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
> change-id: 20250610-qcom_ipq5424_cmnpll-22b232bb18fd
> 
> Best regards,


