Return-Path: <linux-arm-msm+bounces-59254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C37AC299F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BD6C7A847B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 18:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29399299AB4;
	Fri, 23 May 2025 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfR6BXcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A92299A8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024756; cv=none; b=KwbQ72Vu4xqOYkSWq6KL4Wj7pH9ssk6P9JmLoKrB9oqgz7iO0CfQqa9wzGd8Q+k9gK72lg8Nw2F52JkAYP52/Y9PiPfPN+KT07YrfnZSqKbNfpnTrXJfbRwPGMfK4aTLzwRB4lIbsfgRpofZDeAx+nGUdb9V+dK3l7smGIZ9CFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024756; c=relaxed/simple;
	bh=NtQOkWCQz8U7GrzRiRmsaukr1M2Wq2lGQo0FZR6FC7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWBwKPd2TvGKIv/njtYZ9jMwCVLJBdugYAiLd1kU5WJY2UhkyUEqTOWGHwyOTCB/kGGQaJYgXEGT86lcIUb4xgCuH/U0NKQRkNNCMynJKmRkWgDF4o0oyPOiy6dT2bk3o7caRdhZT0rphzQMmxUzEUFu2eG0KqBEBy6qOSRH2SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfR6BXcX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCls4e011349
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7jAskVrOtvAVeaEb311Ty4pkBPjetu94PQoDx54lkY=; b=HfR6BXcXPhL9z02U
	7PYNsF3D2uRj8K+AgnLAdgTlfOtOTU7JIrVaxVtVsb4fyYBC39rjqJBgMgzkha2V
	V/BW4qrAp1ucCNPQf9Paw4wBMBv2dCA5FmNtc3AUhlMiEBnAuTNhO+PJ1xP08Cod
	pfRla/oupSxgc0uE+dionxeGOEvAQYT2e5zFwIbZDW/ZgfHz3Garg+7PIofVQDYe
	0xtFPknPdg2XuffIKAXg/2WUCJOYQWpkrb5K5aPX/GhgfWxUmqSDn3UcSlKUE6mn
	VKLhIpafA2fL1XeOQA81nsI2tnVWD6mT02eNotorFnM+gl571xYwfgEh5Qt6Ycwt
	xXme4A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0u1jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:25:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d32c0b57so242206d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 11:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024752; x=1748629552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7jAskVrOtvAVeaEb311Ty4pkBPjetu94PQoDx54lkY=;
        b=VdAsKF/6NJ17PavRtfcf9UKy+FH27svHKVk2YZhNEwqJbY0tP4fiuEwYdHbnlR9l8k
         QlJS16FGJS1jjmGzUHiMRcf/oK9Lc0vTvtUBUiAMrMIZ5xVdP1xHh0vkGu+ZaCuAa8k/
         7UkS63/cDp+07tihynCIK9Z/9p4wVN1nPhM5+R5OnR7tKDIRF0BXI1YcMvuEJpGKvO6Z
         8YmegF9zHjYCjQE+YbHpxY+GGbZ6fV5yLcu68sy3Y0o0CjbjVJYNfWngMYRiJURQLoWk
         Qmi81Y0fL4ySDCDOrTrcunlB3y2cIg4wdK1IN2Br8iic4NtLMCYlrbkxvBTzgqwP3kGm
         3j9Q==
X-Gm-Message-State: AOJu0YzI3RnO2b2zbvoHqFi/jJN6g0W1wd6ksdXNjo3M/juJURWecGQR
	rFSrhZyR6wXbRmaokSlnOWPjgUcgbyaOl36Apds5tGpVcqhN5rTloNmBKO6sf+csuvYzsSLUWOh
	VGjEMsJZbUB4WZOtzv+MwAvY86q8gwbAI3Ycjq8aF9Si6Q+ul0QQfUQdr54i/UsxIhK4y
X-Gm-Gg: ASbGnctpuz5UU//FiRgDcvR0rRng02NXy8j0V6zeLOjNkLUKHm5axoKNiPsAxYJL9BF
	BAfkf1jLAUu4+SaYq4AT08XD3AArqRuREWDSuM+Kdv5OJf8kaZShnqdC/B5oDnqGPCJ1OTyy1Xt
	M0uQNF3M7mQgjgurQYFUBXr0FRyDHkTpFZy7Dew10Gc2voQHMBqQ6+vhzZrdboD5ZB1c0t7o6+4
	iXWAWGpEWf2oOT3y6/9BtnT9pqpL70nu7fuzD1XlatyGR+c+uFl6pPqC7sLbuHx9ZJ1cZ3V+DB7
	PMIQvq1VAZYQkm8ZE3ibHFjXP9++NIvL8L8qLcyWqfr2iYbGjteTmYE6YtgBAuJEqg==
X-Received: by 2002:a05:6214:21c2:b0:6f2:c9dd:353d with SMTP id 6a1803df08f44-6fa9d2baa17mr3427566d6.10.1748024752351;
        Fri, 23 May 2025 11:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRXjYKiZh4UzYAut+MyKZE13w0f4gwaL2w4sBdwdgygXZc6Mqqi5zfAiRZTmNuRy9a3FKMAA==
X-Received: by 2002:a05:6214:21c2:b0:6f2:c9dd:353d with SMTP id 6a1803df08f44-6fa9d2baa17mr3427246d6.10.1748024751924;
        Fri, 23 May 2025 11:25:51 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04f263sm1257906766b.1.2025.05.23.11.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:25:51 -0700 (PDT)
Message-ID: <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:25:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/3] Add level shifter support for qualcomm SOC's
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9RXooKnphW4rAtJEk_4H-gsotD2phb-A
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830bdb1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=phjHtPm2XXW9BfwSypYA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 9RXooKnphW4rAtJEk_4H-gsotD2phb-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NyBTYWx0ZWRfX6bmN2qDR8r2K
 Zil+TQ6DLouZbAaCO29huKjxdwEyz0hrgepruKnk1lxIKJfYZCYL9YLOkQq4+WRlAstV53kVy2k
 udi+CBufTIPJcPuqJSu6YtNBHjkxzzs9srjf4psSAouwKb5yS6KkCmrfcJdLpbCwkc2UfdcpURU
 O8dCe1QXtOn4+4kbiGt3EYK6tpRTjEuzSgWJGQdJpBUtModPdYsEFmyNGqm4iypkgvhRIES8b0h
 tEGHntL7ZcuUEbfMDC0+FZycam8OVB+Jk4cBRW6NN7W5GIi1VRJU56IS1cwmbvh6KGyXh5WIAl2
 r5AihdcXWBdMzkf/JnfyjS3DBhf09HgydgiS9KiBk9h82FN82WKvU0bV/V+0hiE8c04casbITA5
 VRHgtsjHz0amUWb8jZOdf0RHq9wAd/fwuocG65mwaaKajF72qGY6Ys0WGSvzb/L9P3TWh8LW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230167

On 5/23/25 12:57 PM, Sarthak Garg wrote:
> Add level shifter support for qualcomm SOC's.
> 
> - Changed from v1
>     - As suggested by Krzysztof Kozlowski redesigned logic to use
>     compatible property for adding this level shifter support.
>     - Addressed Adrian Hunter comments on V1 with resepect to
>       checkpatch.
>     - Cleared the bits first and then set bits in
>       sdhci_msm_execute_tuning as suggested by Adrian Hunter.
>     - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
>       as suggested by Adrian Hunter.

During internal review I suggested we could introduce a generic quirk,
perhaps called "max-hs-frequency" which would update this
currently-constant value:

---------------- drivers/mmc/core/sd.c ----------------
if (status[13] & SD_MODE_HIGH_SPEED)
	card->sw_caps.hs_max_dtr = HIGH_SPEED_MAX_DTR;
-------------------------------------------------------

(50 MHz)

which I believe is where it comes from

Konrad

