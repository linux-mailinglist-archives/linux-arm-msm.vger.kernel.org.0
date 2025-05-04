Return-Path: <linux-arm-msm+bounces-56673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA06AA8390
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 03:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C38BB189BF19
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 01:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5513597E;
	Sun,  4 May 2025 01:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KwWAYQTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1EC382;
	Sun,  4 May 2025 01:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746323622; cv=none; b=PfJFFtAWf/lfyItpqYb0NaQsqYPbvmv4xh9M04gGg5+rNddIIF3jdAtj66/LSwRG7y3TzLfU4mkWvVEETKx7tn3DAvloHzDJWVZpBkpE7dEkx9RnpcfD0zOWq5YcoPXDYEKynIrjAsILWuvefHRQ+9eNabbXVMTc0nkucf/Btd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746323622; c=relaxed/simple;
	bh=hFDcTNzFrWYSUP3zUFqU7Um6wnSsHAIEws7ZmYj7AjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dlBTolXGIk+xPtpvryAVzyftCR6bevlYTDXrUaOgk3Zz8dTFcRoiYflkJQ3eS+5YzR3BkOGp/WmM5RffHiiVyoNWZfy8FryGfNrQqVw2RLUsd/vn3l5y0Pzm+iVWwnbNM2MCLTC+BPkL5kvJrBQCLora++ngbbhGZQVoMiGZjQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KwWAYQTa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5441qliw001541;
	Sun, 4 May 2025 01:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gFyd6mlq6MtjzOSPXACJYufc5Gnwj3NhFIyJ+nNxZI=; b=KwWAYQTa9olAgkXm
	D91NaeyV0S0DCwI/cQ5renE3x7W6PYvSPK7OXdm4zBWomBcTyfEcmiCDH9xWfYi5
	17Rd+FIlGChzHW7nkCWMimx81OdcIDoiUH6Wu6abpjUG4AnQVvEprL7Nj/Z22G4I
	gbBD+5kxYAvLeaeHq3v5PgUrktxV0jraR4sSZmGZcMx53tg/EHS4ag9bXHl0tVZc
	2zWwJveZEFI+bjBt1CQphPQSJCupbPB/3/KjScOToPLfK4fdUCRAnlKNj8m/LDIi
	ZiSO0e68Gt9D+uyLCzqVHmkO9hN1blF8K5kNySs/3mzTX3ISGdFI293AGFphDt4a
	8A3F/Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46daqxhbbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 01:53:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5441rVGt018740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 4 May 2025 01:53:31 GMT
Received: from [10.253.79.250] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 18:53:28 -0700
Message-ID: <e88528d7-2fc6-4b4d-a0bf-677834c7b582@quicinc.com>
Date: Sun, 4 May 2025 09:53:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: ipq5018: Add CMN PLL node
To: <george.moussalem@outlook.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-5-27902c1c4071@outlook.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-5-27902c1c4071@outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CHcm7HR4Q2kEKTqk3yaQrsrVeUnOLnL8
X-Proofpoint-ORIG-GUID: CHcm7HR4Q2kEKTqk3yaQrsrVeUnOLnL8
X-Authority-Analysis: v=2.4 cv=baZrUPPB c=1 sm=1 tr=0 ts=6816c89c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8
 a=tOIPKxuczE_Drth-FjcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAxNiBTYWx0ZWRfX5wXFbgM+eOI3
 cwh9nyqDvI6HiK19DVcVeBwfZmB8CeB2MW5LZiXTEydWR6Zc+Oh3oF9Ok8zxTVHDHOR3KAGFvlU
 iAHf+o26QisVbUn94A8K2S2ApIxK19iAB4IsIgBpzM0deb4l5Zz9qCOHNcc/pgqIWuxvxpIgMSM
 eyi/ZVgH2Jf1ImacZYBTNxv6QQ1kDxaFaPh3tlTqfm8DQiU7mIoZXAD/nHYj0oSpnY/XiXx4ykP
 FOGqDnuvMWYulKz+tusLDlnlVCXO0Q9BF/NLqO7YWzHwZgQLXAAYJue5dNiNeDZ9XvjSzIjh4F0
 2KlG5ltHcy1Ti8DBHi6cfcgKioxGchyYjNyo3ljRFkMDAyHToScvioK/J1B27nA0cM5+CdyEZZZ
 mHLabjUwhnehQtix584jmKfMfWylsPFTAR21SpgIsONixX/Nk19uYnznAz3A5tgHftct4VUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=612 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040016



On 5/2/2025 6:15 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem<george.moussalem@outlook.com>
> 
> Add CMN PLL node for enabling output clocks to the networking
> hardware blocks on IPQ5018 devices.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL
> through the internal WiFi block.
> .XO (96 MHZ)-->WiFi (multiplier/divider)--> 48 MHZ to CMN PLL.

The clock tree: .XO (48 MHZ)-->WiFi (multiplier/divider)--> 96 MHZ
to CMN PLL.


