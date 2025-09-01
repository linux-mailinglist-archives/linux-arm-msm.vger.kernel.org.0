Return-Path: <linux-arm-msm+bounces-71397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE61B3E35A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 14:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CB0D162CCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 12:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1417D32A3DE;
	Mon,  1 Sep 2025 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TR+ed2qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0031355E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729990; cv=none; b=ZCKeYXgAktcCCZL9nhw9BGYodtijNPhubzeA2pK0X4JygYz+f2jZX1PPH/cNxR1/XpTrjmp5nsr596GvBR39ijnbmzWWYbtVh/fgRaGtvnb7UnUbvBW+eb4thsvyGyXQ4PBV3Pdjd1A4/Y2Usbuf2EMbd97KZuEIG0FsLMBm2mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729990; c=relaxed/simple;
	bh=EB7F4mbxiHQX5qGhCQQlDNKpKVWf7VS3kp1B8SPd9Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBWB4/UW2FZ+vmAY1aCe8AieWGGj4W1QCbXS6II4YgkGZ7rUXRIgKvC9rA4445645Z13b1efk52QrSW12ZwhTBCcQlEJKbEJveQNqsfy6XQzfLmJUlS+3Xicrj190TBXXrfY2FRDm0BjVUIe1x6+HOFxcpnwvDkcQ/bXIqgTeaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TR+ed2qp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4IFZ007382
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 12:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EB7F4mbxiHQX5qGhCQQlDNKpKVWf7VS3kp1B8SPd9Do=; b=TR+ed2qpL1UMcFGf
	c2LYRYswDisk5QfEcmEK8cdrYfIWWWnqNxjAjNGDTHk2kw4pT99AHy2DJpoyH0zw
	0wRIyxAyqebxwYZP5J6xOqCGBAU5sQe6XjgfyDZv4LHM5r6H5gOUN3Fs+LiCc1NC
	FENrX9MDHrVpkemQsZ5dnuNfj5zxS0L00bIg7tU7wsOYDMkwZhbfUahPg9yJrbPM
	uWu2ViZyYUenjHCGXUmIX+Vm1QNDdztFLAUkWDcnuB0V4Z+zg7EUBn0vIb+n1Jr7
	Y+xfLEUpNK6ExbYNoSmtjR/INenarXJg/cDuhRDrVwXKSSXEtWryBytQbVNlkW1G
	dTusaw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp4x54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 12:33:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-245fbdc2546so14613895ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 05:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729985; x=1757334785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EB7F4mbxiHQX5qGhCQQlDNKpKVWf7VS3kp1B8SPd9Do=;
        b=INWipwPuTq2fKcTJJHCN90aTO+OelLdpX17OL62rRt6dpuhhijUnGjfmR7aHqEr0Mo
         eb2jCH40T11Kg5bHf3iJGhodY/gHD4r/Ziv55QedodiFt78alXKkeQXso19u0ZAAoxZ7
         D9/brtlCIvlTgeQLjheLUYHcMy1LC9nCU4owyKGe5V0qVffJRLkMTzagMzUKlO/qZM/b
         Gg5fku/8a178I9KbZcVkykTavSLD2lELNA1mQ+zriDIm9USq/7C/t1a6uZgDd786ZhAS
         elcvH+8PHgaSSAJtzQb+xonS8myPc9Cuo3SiLm0kCRpM0gGvcWHtUyB9PSj/R+u8Hl/U
         273Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2XzJMgWOyQf+N0bYPll+FE3cA2uP35UZppMSXxk2XHbqFVjBVukYbidqbQhwUz87+uZtDqoGnQP6hKmPW@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJXngCSkWsWdG1fDmpcikgWmXe99sXpOKU0WYQP78vVcLGYCZ
	ykKvuff4THBkHFt9yqdqIUsYQfBQy1qI9Y5uB2VINGWtnCNhAVWmENUbpUoqz1QJqObq+iXuSEn
	tZ+mFtrreKVrLWhtnYxfp5lPXQcu3duflrewa/x8xYC2EspdduDGuZPzCq69XicvU8lpp
X-Gm-Gg: ASbGncvOTjQGkGUPCm6l5+rBVuCp4O430HLbPNR9mfjQKji0bwLBLXL5X/p7NXlb/tN
	kCmEu7eU4K/xpPiMFL0Q1m0gtFi0kIkZG56edgrRD0hKNw8RcAPKLvtrlTYUpW8qdEfUHBiMDBE
	3nFIb9WsxQRVQEIjH2TAdHJ1TSRZO6h3EBi3d7up0Hj2mQGMUSCGMN2VszjYYyA4GzrkmsuypbU
	qa/3O6SX4gMCSuR0lYFXAbVNWuLi6bk26N8NaNNNuxFmRTVyhQnxuZ6Cr6RVJMHcPtgr+/zpU/S
	KwrCPi9etYfQT15sb9GZGgjPojLi2UeN1r01UXmUy7TcO/EgriYVsijBXkkIswYTW+F5s396e5C
	0TfGiR7ArifIsVWvJ/AUG/fHD2J39xQ==
X-Received: by 2002:a17:902:ea0e:b0:246:a152:2afc with SMTP id d9443c01a7336-2490f6e2a41mr89139245ad.3.1756729983484;
        Mon, 01 Sep 2025 05:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvdBSg+GSkVZYutloMzMAPl9JCliwrB8npGb8PaTRixqyTmb5uK1ODr7IHrQZgoOD9FV9l1A==
X-Received: by 2002:a17:902:ea0e:b0:246:a152:2afc with SMTP id d9443c01a7336-2490f6e2a41mr89138865ad.3.1756729982941;
        Mon, 01 Sep 2025 05:33:02 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249066e1158sm104253735ad.144.2025.09.01.05.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:33:02 -0700 (PDT)
Message-ID: <75f8789d-9d97-49d9-97b0-908a5692c325@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 20:32:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iDD1NKg2f0qkTO02SRBeQJIcSYAXcMAw
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b59282 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZffzQ4fVxSrCOw2gOQ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: iDD1NKg2f0qkTO02SRBeQJIcSYAXcMAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX/z3qNg6bOVmn
 0j//grOTBU+91LbwUluc5/HgO9EdI8kYjc1+ToPPMjXL6yplvlGvYk9GWjQexy22EWhnRYLJTzb
 bPW/o4opGFNt6MrldIwvmi8VXf6/ZtkXCtVizgNaf+5JzRpjU96pnb6kANijB6vLK0W2zWpXfRA
 9J4nC+tNvRPzGuE0TNX8VFUKf8fKWhDVnTSMlV95a3sHLHsLu1Cx2DLh/CJzO6K9yV/v9Nrr13t
 62VeU0gG4yE9zweZeCHGDmYnl37JZxyObRdJaZlmsW5yjtWMhLGXyJSFPFrEiZMyt6gkdAIMXeX
 BFytkcrrRGa323DqIiHQtsnHoX9sMV8mOIYxAPXv0cfH+DCeyR8H2wbsTADVKL39eCmfu83bZo1
 sjM9iYoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001


On 8/28/2025 7:05 PM, Dmitry Baryshkov wrote:
> On 28/08/2025 07:51, Xiangxu Yin wrote:
>>
>> On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>> While SM6150 currently shares the same configuration as SC7180,
>>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>>> and avoids potential issues if SC7180 support evolves in the future.
>>> I assume, it has no MST support. Am I right?
>>
>>
>>  From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.
>
> Then please describe MST as the main difference between SM6150 and SC7180 (which doesn't have MST).
>
> Also this needs to be rebased on top of the MST bindings. I've picked up the latest posted revision, but basing on the on-list discussion I might need to drop it and post another iteration. 
>

Would you prefer I keep the current patch and update the description of the
MST capability difference with SC7180 in the commit message, or rebase on
your series and update the dt-binding accordingly?
https://lore.kernel.org/all/20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com

Since MST support is not yet mainlined in the DP driver, even if I rebase
now, the final implementation may require redefining msm_dp_desc for
SM6150 in both the dt-binding and the driver once MST lands.


>>
>> According to the hardware spec, MST is supported, but due to limitations in clock and pipe resources,
>>
>> the maximum concurrency capability is restricted to 1920x1200@60 + 1280x720@60.
>>
>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -27,6 +27,7 @@ properties:
>>>>             - qcom,sc8280xp-dp
>>>>             - qcom,sc8280xp-edp
>>>>             - qcom,sdm845-dp
>>>> +          - qcom,sm6150-dp
>>>>             - qcom,sm8350-dp
>>>>             - qcom,sm8650-dp
>>>>         - items:
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>
>

