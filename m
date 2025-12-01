Return-Path: <linux-arm-msm+bounces-83977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E327C978F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 796D04E20AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD84313266;
	Mon,  1 Dec 2025 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwEwruD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehhMUU3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE43128B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764595252; cv=none; b=b2DiJLHF8bvqbdYiLyHfu6AORslcEp/w30gkPstizrm6IlSJeoVt3cDmdf27DoatRzpWeHIIb1/2hUc7PvUIrgt3KwFnjjL9pzjx1aUM7hAA8pGs/fM36toiiutw4PcK9W1aGikikHsFLvWOOSaijBeV4dxPsLEKMHBo8qFuFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764595252; c=relaxed/simple;
	bh=n7jAILhICgNy4OCuW7Ylj92utthZIYSo5Z8pEC/WSWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEO9DbeCIlX7VZgZWEWvysX85T/OK/y3Swy14hOR/hJnmcWO6kBHUgIDFuID77REvPz3wjikxTrhj985Wr9DH7+RDYqezvZRIke1+B2CAiC5w1sKwPlT2Ey+xlKhl9Bn7wIIOvhNz0iYDdDDfdTnVHZHpj7axFeIAmVRtL5sFzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwEwruD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehhMUU3S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1A7gAa435729
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=; b=bwEwruD/t1+yGKKt
	3ZHxIuHSVeOF5ji03VlJy6Jw3cWxIytOR1+f+gz2Rl40FHq8w5XzH7KNMq/MC9Bg
	/1bgWW573qIlr3SIweCbbMyPaAdVHxEXVOUe3YJK/APZflOqcGsrngL5jMSeEcld
	f4tYxij89hShYJcvNNlTEfwnEm+pDdaUdHdr8PX2ex/y2VJwbiUUGHmEka9miSIr
	IgJZA5E3euiz8yCDeKcWroSn2xjafc/TAy/xlZ6T3zQOsvG2sX6FmzARY338LTYq
	Cw0UoTU6zQC44Nm2zLsAYmCzYSKSBmJ9D4Jg/MVi7YSPv57hzCeZo9kRWHYOnAIY
	zs2hUg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as909rg4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:20:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfa4d7ed54so424863137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764595248; x=1765200048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=;
        b=ehhMUU3SQo+as2N1RV2kF3JNVGI0G7NADY2V+0J/fln3h9BqWNSnLoUDtH/dNNEPlJ
         8Akwp7sbPOXvT5EoX6S1CUhNnHLUAM4fOJpntFZkOaQ8oZMGl8whpuSsP6pCIC+bqFCM
         VHl+bNJU44RfnUdWICBq9siuxu9KIcw2JnwBbm4cs2eye+bX4D0A31Cp4MLkUsYYxoHx
         mzfky5NFHUjYy+DFaCoyd+p3YOf2CH8GoxovoQGIu+UVbkF9dTEGe2eaDtwUARzrUriv
         cYIfmcISUKIXl4r3BjWFOpn/uSqYw7zg88muBa6CTDLYQjn5daBhyaWkh5GaQmFk/o5V
         +4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764595248; x=1765200048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fT675E24P9j3zF3eg0gznwK8e2IPPsnLcZjagbqO88=;
        b=nKQD+camI81HJIZltfM7CIizKetWrywtztWBufMOW6ern6aLTsNGzO7QwyesvLenIF
         SjwxaUcTZJFActBPBqsMGlZKGcwO88HcY83B8zsSEc5MHUhPIblgQ5LGKQx9aj2gmj25
         AybKUrTZkWg6cn3PNkuW8rmQjPk379WZ19iGTVHkMIPRPuPWItyBdhJW2YEh+0LvHwQk
         Ak7wBnVi2JiSY6L2cJJnRuzbIyEXcC9okZUpmsBllMWQnxBuVD7Rdv3PTrQjLZOLg/sX
         e1SeMzEwvlkbG+TTMyh9namA9ARYojrpQCQlftnRgzp8db9HC1Y7XBmTlHvV7oxXhUCD
         3Dww==
X-Forwarded-Encrypted: i=1; AJvYcCVuoLAYpr+87pdyzyGdUGnAJ2UZ+yRUy1C0M83lq+UL12dd6G05OWlbc+pO/iU43pMLTyT428lx2c/qiw0O@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4j4N4pp2wyiQGCUUKI8b8hehQHQxpmOpNdFu5NjJCo8MC1I+k
	mG6PbtPUf9sWBdGtWqcW3sX+pJ9NVuVG5iuRnCqwMCMDvP6LSYLUcXw10BuElcH9ZvGQfTH8QN8
	+djjrGOLpjDOdM+w7KhaIehzyDf2iCZu7/CEiDuBPsPOAsALQkHM/yaZccrKUPOr9Tksq
X-Gm-Gg: ASbGncsJyJGRb+QQbNvdZbN87ckvz8dk9il6yiVAfeW2cCiA9ERA3HHjesjhzWRFztb
	xch+qMe8Et8NZoqHOraS+e0GX9MVPv611QVpLqG9VIiVCHHwbFCOAYEiV6xU0UvM0O6n4MZ0mnB
	/bG19TS/m12buUsKALHhUtw1sR6qHG5897lxQ1pqzHRymDxOyMKGkUnnihofADoJpTm/GVtl9Ht
	Lqvk2gvs1xDP3dFbu/EotZ4veWl22B18AmMlkbd3TObwlJR/YDaZ0mXsVDvCVTDQzSpjuKsvdTM
	TBqYS5FIBWI2yJUhyHEjVU/7LGIBpPsTPVy8+fIcqiBxd28CpZC2c3cCpgL78MfG96wN8KO6XVM
	4ST/clOP3TdvyzKKqiTFwUSE1O9f+6qJNJOlwc0X/6zfis6h7zru8Lca8mE4rhRXz5R4=
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id ada2fe7eead31-5e1e66f4505mr7907312137.1.1764595248357;
        Mon, 01 Dec 2025 05:20:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJer9mBVBtbELIfrNvmv1HkEBNnwK7vOpXOPYANlc3/9Cr+1NOG/fhoTmkAz9sJEK87Be98Q==
X-Received: by 2002:a05:6102:dd2:b0:5dd:c3ec:b76 with SMTP id ada2fe7eead31-5e1e66f4505mr7907275137.1.1764595247937;
        Mon, 01 Dec 2025 05:20:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035b75sm13571646a12.20.2025.12.01.05.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:20:46 -0800 (PST)
Message-ID: <8d0ec7fc-6eb0-4b71-8e0f-3deaf1f489d6@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:20:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
 <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <w3ezxipjucswfswfg2z7b7uyu55bssqatdnbxa6jflii4j7nym@lxsnidrewepu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwOSBTYWx0ZWRfX9kMEPeZkGOrZ
 8ReZoba8PE541amORsozoXCl3AnCfHwFxCATjRt2BuGqtzi29dbRe+6A2owWVyzqoZ6M6r2PvDc
 UPnlp7MhXHOpEjLlljAQgtZ9hBqNjxaOBlYKa09Mq2G6vxTCteOIcIni9Doh1XO71qSHlytge9s
 px1HFXw/t269F5q7XmxgirB01Fjm88AtqWp6awlhlRG0TWqULAvQYAAmLogO7rPp+UOY80f5xOp
 NLkZ9mwwvrM86Gw3wvJetWKOf4V1Oqoew2Q0j/BZK6wIyAaXtICK104YKMUEGj3wN34b4cIHdPy
 HbnzaZerOrHfuYv0Asr4SuPGa/zf6pjPKA5IO1L6XtOg/BynYNuRQkXksjgKl9V+2WNN0ERmhOS
 DP/HV7VbPEEHYfVQaKHvfk80fQtHMg==
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=692d9630 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yXmZhl0dwuD8hoocJaoA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Zg4K5njm7qcr-LBg4AAXeQ5YCrqmq4kZ
X-Proofpoint-GUID: Zg4K5njm7qcr-LBg4AAXeQ5YCrqmq4kZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010109

On 11/26/25 1:09 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 11:15:17PM +0530, Taniya Das wrote:
>> Support the clock controller driver for Kaanapali to enable display SW to
>> be able to control the clocks.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---

[...]

>> +/* 257.142858 MHz Configuration */
> 
> This is a bit strange frequency for the boot config.

The frequency map lists this odd cookie as the lowest predefined config,
perhaps it was pulled from there.

More interestingly, the only consumer of this PLL (MDP_CLK_SRC) makes no
effort to use the m/n/d registers, instead relying on the PLL to re-clock
for its ratesetting with a fixed divider of 3 (and div1 @ XO rate).

257.142858 * 3 = 771.428574 over-drives MDP_CLK_SRC, FWIW.

Taniya, we've seen something like this in camera too. Is there a reason
the frequency is being set this way?

Konrad

> 
>> +static const struct alpha_pll_config disp_cc_pll0_config = {
>> +	.l = 0xd,
>> +	.cal_l = 0x48,
>> +	.alpha = 0x6492,
>> +	.config_ctl_val = 0x25c400e7,
>> +	.config_ctl_hi_val = 0x0a8062e0,
>> +	.config_ctl_hi1_val = 0xf51dea20,
>> +	.user_ctl_val = 0x00000008,
>> +	.user_ctl_hi_val = 0x00000002,
>> +};
>> +
> 

