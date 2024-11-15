Return-Path: <linux-arm-msm+bounces-37945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3F9CD654
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 05:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E57DE1F2256C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 04:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D356816FF37;
	Fri, 15 Nov 2024 04:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gWNmwo70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35407158DB2;
	Fri, 15 Nov 2024 04:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731646780; cv=none; b=Jx8lGcA3OJF5TjB+ZpnNp5RRtgci/CYVaNqW72GXG/EgeGJkCd6MFy5jPJb9+/uZRVqMBYFDHfdweT75BSAoGyk4Gayl7UNSyiZ+m86b5W7sbPmAs8b3/VXRGsoQuoVaSxis5hNN+oGQWSRHWZKQN5tmTQg63k38IIl2Yp/kLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731646780; c=relaxed/simple;
	bh=DfZB/Q9Fk/a8h0HsIc5aAVUMlB0DhflhvKf3qZsUnfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NGi2wExYK9KiWPdbSuqK6hDfOH8+Ofp1n5dDa3RH3+pbqywLIGqOaKP8j4qxZ09wAeBJBy2YXs0avKjytQyQobk3aGbUKW0d8MFHNcFtsWDNeyA//WeyhJppd7+Y9eZBwua9u1x43xN6CRRzrWav9tp2MILpG7FdizMNTE5Axt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gWNmwo70; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHHtcj018977;
	Fri, 15 Nov 2024 04:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	naLjQEOCVlYSfud/gWZWjECc3UCVfY9WDE7qLR53pRU=; b=gWNmwo701CPthAYp
	4ADLwr8+wbiwvmpQEVK6SYqwVMhO8+eBcxEYw0Inbs+wblefBoiQxN/gyJpgp2A5
	W7nSrSlCkWDuW1GOxkXFWGwl+p8f3/8vgF0UHdV91So0f+meu/qEbWG5Xz2wFNQC
	CyyUVoR+Q/m5OtVQ70bsYsO5/JJBeJ/jw8cKBoZK6F5JSf1a3Nh2lLO3KQWMHoOz
	aIQnpe3Tt3x7qlCSoDoeOq+vNgD42K3/OXvvgtiarag/UqeYnqzMnKhXWz0fysYr
	KNyZnPlnhSEq8+sr51vqMeb54lLa3k20dr6Jg6ey/rI7ThwT12xE2n/nW6P1K9p8
	Y9CRKA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wex8ttgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 04:59:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF4xPAX004511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 04:59:25 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 20:59:15 -0800
Message-ID: <288be342-952b-4210-afe7-6e194dfd54a9@quicinc.com>
Date: Fri, 15 Nov 2024 12:59:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs8300: enable pcie0 for QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <robh+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <bhelgaas@google.com>,
        <kw@linux.com>, <lpieralisi@kernel.org>, <quic_qianyu@quicinc.com>,
        <conor+dt@kernel.org>, <neil.armstrong@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <quic_shashim@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_tdas@quicinc.com>, <quic_aiquny@quicinc.com>,
        <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-5-quic_ziyuzhan@quicinc.com>
 <rg4isufmnhnbsiljm34rfdsn46gfpatbsiscynaqtsnykbhnm3@ovcaulkfj4nk>
 <26943ea3-109c-473d-818b-2a08dba859ab@oss.qualcomm.com>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <26943ea3-109c-473d-818b-2a08dba859ab@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gW9MRU-f88Y10pYvrMlMAq6Z4DCIw1DZ
X-Proofpoint-ORIG-GUID: gW9MRU-f88Y10pYvrMlMAq6Z4DCIw1DZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=691 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411150040

On 11/14/2024 9:03 PM, Konrad Dybcio wrote:
> On 14.11.2024 1:10 PM, Dmitry Baryshkov wrote:
>> On Thu, Nov 14, 2024 at 05:54:08PM +0800, Ziyue Zhang wrote:
>>> Add configurations in devicetree for PCIe0, including registers, clocks,
>>> interrupts and phy setting sequence.
>>>
>>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++-
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 176 ++++++++++++++++++++++
>>>   2 files changed, 219 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> index 7eed19a694c3..9d7c8555ed38 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>> @@ -213,7 +213,7 @@ vreg_l9c: ldo9 {
>>>   &gcc {
>>
>> The patch doesn't seem to update the gcc node in qcs8300.dtsi. Is there
>> any reason to have the clocks property in the board data file?
> 
> Definitely not. Ziyue, please move that change to the soc dtsi

Gcc node is updated in board device tree due to sleep_clk is defined in 
board device tree. Sleep_clk is from PMIC instead SoC so we were 
requested to move sleep_clk to board device tree in previous review [1].

[1]https://lore.kernel.org/all/10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org/
> 
> Konrad


-- 
Thanks,
Tingwei

