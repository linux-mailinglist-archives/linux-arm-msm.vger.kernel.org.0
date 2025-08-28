Return-Path: <linux-arm-msm+bounces-71105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA490B39AFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 13:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FCDB1C25B52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 11:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ADF2EA170;
	Thu, 28 Aug 2025 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkzNktIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44317A2E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756379116; cv=none; b=iZvIGnIpR23orAp/4hKX/TrSYCIdWR6I+Sx6yYLJUBHc2iimAPJFK/7X9OTTpqvBSSO3cEZu88F60fI+EmT9NyAoecYpEAokcMiwT62E3PLrk0Tr86mol+B+Fz036RzqK3YeShrW/x50fFyTCuD+LJIi6eKc6f9Pr/c1LJPwBMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756379116; c=relaxed/simple;
	bh=e03dVCkvTvpanWPDwCJj9vnAVCkN3SPLyZbfuEJYznY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8COwz5/ESzw0Bc65u6wQX35Iuzj9mYIw3pRt0HiPULZ6/ksR2HFBe0tPvzgvmPeFx7ImXeK/zllhIAtQisD24TUhQD54F4bjfnRtJAQ5uIL83BaQsvYLgbuwZuRZPpLwRCFsVkclmNkodCqp5WamMDGCug3s7MM+3y/j/2Iu44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkzNktIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5oJY5030584
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWz4EmxyWXf7dXG5o/SW5rNMyyXGmYaGBN9NZMKjXjw=; b=dkzNktIes08QLczO
	hlxo3ShN3hIS6b4EPWNK7XpY0ycS08KtG+q8doSF83aKpqd8BIjg9xWQfREPwSgH
	MQNIkYh6KYv64gvNZgoCoJKybu/BjmFW3o+p7V0K78upoKCyHZ2Bw2f6Ak14MLdK
	HGUgeeSx5sYiI6+kuCH31IWr/5fNHnVVi4iPifl//6dCEHs2spk8IfxR3r96dODv
	jfXHjwiWOdPTWCYQT7zTp+2bCJqHQQ8Xs1ZProWWlP3TLDlGCvVlz7COfXqLDPhD
	2gtdzc08CYCrgXLmuh8p25hghTl8KsKLuHAfPfMY1dahPyKzPoDYFu7Jqxb5PZrK
	EVWzdw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unytfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 11:05:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dd6d25609so23482466d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756379113; x=1756983913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWz4EmxyWXf7dXG5o/SW5rNMyyXGmYaGBN9NZMKjXjw=;
        b=wfyzyYL3BBbQKIqQf8M6WDcbuyiswuWOQ0H6nwXfCyvUeQWKrkTD7No1+sAn8js3jt
         B+/Lw0Z+KzwiaQdsk/OBLBADKwnlShOpEa6ldoAMyBh8xPYG6aNAezWV6xuZbU3SvWcs
         KXapFlsd8GT3j4pm9W4Ajn5hLieLXjzkSEItQmaTVXcuYB80rdoYczf+WirG/Ws5T8FV
         nC9NkffOeC1UiRwAY3XEJw6xVZI8FnQ+sOoH3FPuDroiTkG+6iKJ9mQ013+6uLs6CR+u
         lLg9ZdIGmW4R7yOZ6U9Zz6ShNv0UTr49mjGCR6XAq+WeHU45COCgHBDPZoGmiqg0WEG5
         yTqA==
X-Forwarded-Encrypted: i=1; AJvYcCXxKvc3k7woKDsgI2ubtomOUsFUBWLt+hEA6CngG/+jYanlH8bYWOS0jRp17d3i/vVsQqjRcVBmhV/3hjWl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4NXoV/DeEPoMtShO5SLKWw4ahknySdBP3AKggKOfg5zq9JCGT
	dwMg1l15xyURayYqbjZzT7cL9SQalN4PnivSfYrLmFXcgivE+mwveA9kmQ+4/Pj1+1OpDWYd+6i
	Dr2D4QUPuR97LmmKQPYG+J0xjxK1gjMBQduc7ZYUJV+H42l0g45YAwqu3mM08xwWIVHhK
X-Gm-Gg: ASbGncu8uO9tAj1TwnI60xro0d7B8AWBUsVJSzjQz40UwDQd73/FnB6edyX/uV3JQnj
	QZxYrmkAjt8e4Ot9C1hODSg8vnHrWsrogH3GshqLkdSCtvJB70Rc6HZacU7nCFm5xbglKZB3Env
	M+ihthSBjCDdqu7SoqEGXergdg4u8pWhc2KfxCFVn3cuFycNE9okAQtxsX7v7QtNVEghreE0nAX
	4TiDM0SsGxG9ykZP5JJ1elsu0C8htySyxEZvtotI67p0nA5eEEQPug8k3cOWXSn4L3wHl9E8OMf
	xV0bd2/veEiNllpJP2R+eWPSvclj5BIdEHlulmITVZs9tiHkkKwIioizOSebX6zeBg0/uBJATwI
	Vhy5dSptnDrdDFmKva+wHjWLPrvF9RBTV36B+ySfvXJ4=
X-Received: by 2002:a05:6214:1312:b0:70d:9291:bdd8 with SMTP id 6a1803df08f44-70d97109866mr271525596d6.30.1756379113183;
        Thu, 28 Aug 2025 04:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLnBHAxYeOFUCjvzXXjJoPfriPl5kZ9soekFn2bdbrOltVRygzUC2PVtjW1wYnOgDWaHGQnQ==
X-Received: by 2002:a05:6214:1312:b0:70d:9291:bdd8 with SMTP id 6a1803df08f44-70d97109866mr271524786d6.30.1756379112368;
        Thu, 28 Aug 2025 04:05:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5da244sm30163331fa.58.2025.08.28.04.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 04:05:10 -0700 (PDT)
Message-ID: <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 14:05:09 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
 <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QgzV8tmuf8u81tlT2HLh3pr4_II72iWM
X-Proofpoint-ORIG-GUID: QgzV8tmuf8u81tlT2HLh3pr4_II72iWM
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b037ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KSO3TaR41uafEWVwNF4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX+gjUR2URWj9/
 IjqD3kVO+xvgfWuOegeLR+Ou3ccYHJXxszkO3sM5H1ej1ec7dlFrF+4w+sT146ADUM//A//0w79
 c1oJFZ4NhgrUaUJ53n/ZEk6fnz/seQSDtpnl1hk3eZ/OpTvJk2ou9+4oHW8Nu2boG+vA3SeeHCY
 ahfnDVOXhOgOU1Uxw9m2CGAynr2Tmja74ePnHRz9VfogIy5WOCaAjQaorkLN6qj8zqtD9Bhndl0
 BpTo3B2PjX6d0yqkTZhLxU0yTLPlN6tC0EgtmChDXWJrlfpBggsiX/SsjpB0BAy+CsQgE2INIgD
 kSaO9PmZqNhvnrEHO7aldYyWIILyfMb/TamtU2UOMTeDlj0SUkgEXg61BR93S8wdjf7bbdtCPMk
 Nx4Ej1Vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

On 28/08/2025 07:51, Xiangxu Yin wrote:
> 
> On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>> While SM6150 currently shares the same configuration as SC7180,
>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>> and avoids potential issues if SC7180 support evolves in the future.
>> I assume, it has no MST support. Am I right?
> 
> 
>  From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.

Then please describe MST as the main difference between SM6150 and 
SC7180 (which doesn't have MST).

Also this needs to be rebased on top of the MST bindings. I've picked up 
the latest posted revision, but basing on the on-list discussion I might 
need to drop it and post another iteration.

> 
> According to the hardware spec, MST is supported, but due to limitations in clock and pipe resources,
> 
> the maximum concurrency capability is restricted to 1920x1200@60 + 1280x720@60.
> 
> 
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -27,6 +27,7 @@ properties:
>>>             - qcom,sc8280xp-dp
>>>             - qcom,sc8280xp-edp
>>>             - qcom,sdm845-dp
>>> +          - qcom,sm6150-dp
>>>             - qcom,sm8350-dp
>>>             - qcom,sm8650-dp
>>>         - items:
>>>
>>> -- 
>>> 2.34.1
>>>


-- 
With best wishes
Dmitry

