Return-Path: <linux-arm-msm+bounces-22913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E78A90B793
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 720791C2302B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC4716ABC6;
	Mon, 17 Jun 2024 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dlKjsyvn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289FA16A954;
	Mon, 17 Jun 2024 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718644480; cv=none; b=dM8+vrAVxmROOlYmReEva50EJ4w8+bprgIO61/Fs+waIuFWLCmezwFFRM6YPd+oZ9rh5uMuIxYsws7lcOtxedHe0OIgcxT7c4WelW7XRfvHF9/l4ykJlMJrv4iCTjAr2VqXoQU6sKgr0gj1e0L1N9B4Tk33uQI8GQpxjLMH0t1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718644480; c=relaxed/simple;
	bh=GCcw5hlFjsov7vU25ey+lZsb4laxgU4CrkT8OCyG/GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f9y0KqYFD/AL6VTUBZQZdzp6DbZpu52GTr83DNchQCQNyngL1mjeQMs4lOjSTfrAR6vhus+VIk3LXabe6rMwBkGxPllvIaT2+umHtQF0aCqM2nJtRZspAOKnkq3u2lr0z6WZAlTpbialyp1PikNiEpLMoPkueCG3ygBrA9u9sWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dlKjsyvn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAgu99032598;
	Mon, 17 Jun 2024 17:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHW2sipXV38cUjoce1vWKeKDVq6sQZZynA2UDf4+2II=; b=dlKjsyvn2o5OJZrF
	gCjlFZRnHUN1QlQ8hwX5YMPqoawxqH0fwtjXfHpWCOdmBcLNea9fRpTf8dTDJCo5
	VbulNChl/zPy10oPr9rYvkFKDTmeQq1EExa6yXhZs9jK3Tdd0uoky/+FofurPF1D
	A19GFW5WNAtzLgbdw8P2Rk1WLWrE++HC08IlFlJqqBiTew06HXzMbRiISPE/QNzB
	uBuQM/uNKa9HZoHzp8QM0O17Jya7QLZ2GXqoKG8UCH8h4vjCCCgf+p5SCgsCxNjd
	JlPPKez0o70gQNQ28YsHL+PXe2UVHOSdSAaaRztinP1E3JgLxJTxhuq/uRGCQFzd
	mwJO/g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys0an4f1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 17:14:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HHEJlY002735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 17:14:19 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 10:14:17 -0700
Message-ID: <c18c3acc-8f08-1384-0d99-509ffd663879@quicinc.com>
Date: Mon, 17 Jun 2024 11:14:16 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Marc Gonzalez <mgonzalez@freebox.fr>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, "Arnaud
 Vrac" <avrac@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr>
 <20240613-hdmi-tx-v4-4-4af17e468699@freebox.fr>
 <348e16f1-0a1b-4cad-a3f0-3f7979a99a02@linaro.org>
 <pprbxhow6gl6bqlhzoiozz7ymwqk5uwuyuwclviulie4ucyjok@xv34zrzw72oz>
 <b6676951-33a2-4c3a-bb29-0d1ea7ad33d2@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <b6676951-33a2-4c3a-bb29-0d1ea7ad33d2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IyvUU1bNab2aZg9p9Kc3nauTBhv-hJ07
X-Proofpoint-ORIG-GUID: IyvUU1bNab2aZg9p9Kc3nauTBhv-hJ07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=829
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170133

On 6/15/2024 5:35 AM, Konrad Dybcio wrote:
> On 14.06.2024 12:33 PM, Dmitry Baryshkov wrote:
>> On Fri, Jun 14, 2024 at 01:55:46AM GMT, Konrad Dybcio wrote:
>>>
>>>
> 
> [...]
> 
>>> GCC_HDMI_CLKREF_CLK is a child of xo, so you can drop the latter.
>>> It would also be worth confirming whether it's really powering the
>>> PHY and not the TX.. You can test that by trying to only power on the
>>> phy (e.g. call the phy_power_on or whatever APIs) with and without the
>>> clock
>>
>> I'd prefer to keep it. I think the original DT used one of LN_BB clocks
>> here, so it might be that the HDMI uses CXO2 / LN_BB instead of the main
>> CXO.
>>
>> If somebody can check, which clock is actually used for the HDMI, it
>> would be really great.
> 
> +CC jhugo - could you please take a look?
> 
> Konrad

Documentation is not great but it looks like CXO from what little I can 
find.

-Jeff

