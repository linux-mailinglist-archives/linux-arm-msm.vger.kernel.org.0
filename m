Return-Path: <linux-arm-msm+bounces-71667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30184B40AEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D73E04E4368
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796DD31B102;
	Tue,  2 Sep 2025 16:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4PKlm42"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ADC30E0F1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831571; cv=none; b=RmaPMTEXJ0CuddKmzdmcWdWxODoCijQWWPWatiZ7s+JTAJnls5Nsjpusy/6CVkVXTDkFaXGEAYou2hz/dBqH5lZlLPmf7z5mIcbTSb5ptwTrEci3GdDINv8EqYNJh4uV9Kv/hR7RVTiR0Vnhjin2zGI02/W6iN/9FdIizgdtD14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831571; c=relaxed/simple;
	bh=+pd5ibWIKyHRFFR0VYcPPSihlyE9oJC51HBCwcLMQas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HD7uIcKMtGsbU56oiFpHXdf30f0iB/ieDKWtDgxOqzKImDmtUu+cDfPnALwu7wwDzdWRy8x77Gi/5rQv4mFq4VcdW5qzWpVszvF7XM6h6ayfsd8tf4o205/mzsCrxKYpRqRrWv7oZhOxUdgnjg3OTPvddh23wPTPK5ZdCmApudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4PKlm42; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqCKk032215
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 16:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X6rGdPxT1UiWkrcEgByQOjggZJJnyxAl0XI2p+tHJw=; b=J4PKlm422wVwPu4D
	Mc2+lAOVFo9MKrDO5ujM4PiUEFzyZwkV+gGesR+qnpbJX23HOo+F2C5BU3RYQl5X
	Kr31+FJJdxeViNchZ8mMelrxvx6dK6nD5rSi5C2pHD3qkdb0Acr0LaCjmthyXqwc
	8nCX8akkRp8pTcbbAhe7UtoRxiXVf1mXKuUM+IUDliaUfnHI0J8RpEFlj/lYd1Ub
	ODmRslmztdkaHpxAq9f0nKQEAl/QcwQnLmmopveajSt4B9zCllVcv3yKcuf9qIiU
	XApT1/PdWplyo9BzjWqW+j1EkDeMew7uWYIEn2IDyWYOlLQ90imsPqs5pRJU0GcJ
	TTmGmA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8rj4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:46:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b471737e673so7957959a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831567; x=1757436367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X6rGdPxT1UiWkrcEgByQOjggZJJnyxAl0XI2p+tHJw=;
        b=RXaBMCN9tMwRd5wjhi97ACRbvYJc6tw+YJl1gS4PUFl8sFp++BHMOc5gHbreH+5HLy
         tu3tjhjbuKUxKlSauQEoIwXLw/AxQmhFE/u7oTf5RjO6Nm20UAEHBp2Bj1bJnFpR9ykD
         mxv9grvs9qPJ3tedGvEkGK5GpLXZ7/wVFrFZ8jAM/iNA0XItJ/nw6y2sqc3H5CHRMCtn
         M7LXvbJZF7WDTz03cUeE+VIjt1+3yiTOGgX3hxov5MhqwX6aJnRHYmhh+v30O6Dggq2w
         wb0dclU3DVohDN4/30ALi/+aEI2XU1ZRccnkbOwMTV4qDkTGdQo8ElKvAfD+APsYozXw
         LJBA==
X-Forwarded-Encrypted: i=1; AJvYcCVLLFQMfwUZnL8sc5GeFhxDCcbGLga5+x1pf5+1iKrKoux3Ohy7SXjOpvtGSscVeuKBCp5qQvADr1Q7OdBM@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxc1bxMiHfcRbDG6X/8S7dYvhHrxnQcNTWYSYPKv1cGfkV19S
	UGVhnjao5ZGy9uhefaw0tg4DKrySkh2Kw3wh+pU06aQ0bA5XV8MiKkD+VZyIyblTet1LDUbro6Z
	CxvPMgG4ctDtk+2aWWrm/IyK6vhw9+OoqNstchGwqnaOs+pWk+bNUXeYhqCWDvU3pRu2UhesOmd
	T9
X-Gm-Gg: ASbGnctBADh1xVy2wwXFCEqYOzTaMKCEcuYgDyVDbmevYk8B/psxfm7GPx2pWU0afqm
	r1uK+mEAv2iHYE6jDKyqWPEaf/+XVpJRhCx3twt0R5OIAMTG1hAIcoSIBlfGa8eicp42ez3rbUt
	D6pnwDzbYr7JpEjmx/CBHbc778Aw85vE9aY+Te5f9iLedgzP7KpDCpw+WsSRKU1kXScO5IcvFKp
	F970CNikfmWsITP9QKFImM2BgKD8fkSzJnQVI7r7YZ/d2k59t6fRTVJ9uUNCmPkcIZpl3bUcmlz
	dVGBUrq47iSTk1t2cZRAjvrIt0IGndjjopOMy82DiD3g6H5sg5c4FQ71gKAMKbUqtppg7ug=
X-Received: by 2002:a05:6a20:549d:b0:243:c5c7:1126 with SMTP id adf61e73a8af0-243d6f0324fmr17153212637.30.1756831567547;
        Tue, 02 Sep 2025 09:46:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpXLMq++UENp17zgkzAVidoy/rMcBj+5w9Vi09jk3fctElIIy1kaIPr2lyaGmIxwQhJIRuaQ==
X-Received: by 2002:a05:6a20:549d:b0:243:c5c7:1126 with SMTP id adf61e73a8af0-243d6f0324fmr17153173637.30.1756831567069;
        Tue, 02 Sep 2025 09:46:07 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm12393842a12.51.2025.09.02.09.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:46:06 -0700 (PDT)
Message-ID: <0855853a-4b77-4bc8-9e78-bd4e8a211b65@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 22:16:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: common: Fix NULL vs IS_ERR() check in
 qcom_cc_icc_register()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o4du0Inc1oYrtLQq7qxx1Vd3yy0RM1t7
X-Proofpoint-GUID: o4du0Inc1oYrtLQq7qxx1Vd3yy0RM1t7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX4u2fOB94ud+A
 Oy6kUFjJlFuaW9fpP5zfQGQIYWMM+BdZzfcbVvYt7nkA4WPItR34ivWPLEd4KRef135ZkYYreMV
 52vEMglN12FF1TL8z1xBpxLcvpprZfCS0awJYmEe+m/bf4CAZW0ifCr5608+230QaKjr8xX9Iih
 XC6AXBqWjwXWUwKwEfPEUz0oR99oc7MA0P4TsXd6dEjIaefrkmPKDfpIh7Bxw/o9TsAfoi8fzgg
 h/abnsjNWJnAZniZpKubZ/x9n6H+LGc9DDnO+zHp65dh2kD0EWmMe9FFRTCLr90PzzDsjNzFEbB
 T1FZ5YAiHzTnmon4xsp7VN+E8suZ9eNIEQoVYqpNFgwDjBNm8W/an6KCuzsW5sFnb2VOYJJfSrb
 TsPnmvRP
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b71f51 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=+KjSowhBs1waSO1ngDLaHg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8T--ygq334zCgzS6G-IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 9/2/2025 12:03 PM, Dan Carpenter wrote:
> The devm_clk_hw_get_clk() function doesn't return NULL, it returns error
> pointers.  Update the checking to match.
> 
> Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/clk/qcom/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

