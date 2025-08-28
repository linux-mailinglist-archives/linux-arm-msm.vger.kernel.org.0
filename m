Return-Path: <linux-arm-msm+bounces-71063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C933B392C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 06:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682E61B2400D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 04:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FA12066CE;
	Thu, 28 Aug 2025 04:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4bGtHj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6AA14F112
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756356678; cv=none; b=PyTxjv20q2EMH++4xG3ZtDcotokvf/GL2l+wXbrzcZfN++i44c/lU3IdThJ74Tm9CsNNC4VFq/bkDic4xMXulmWwJgiT7BhNMzPApy7Qc0TrQEayCjiKqveoHQcudP/OVB8vZfbWzEXvH/twtpcLltfHPqmHAP7S1eQ2KbrKxWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756356678; c=relaxed/simple;
	bh=sW+H8loYGF2a7tRB3sx4xlDEPinDir8bUKJY/rco5A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXfh7J/9tFMxSnUnwVCo5eVdCIw2F1XUwxvPzyKJ54XdUZBOociG8j0ANzcwzRxSF3kb7IxFuQgdcpB6kcnXwsGDLWga3EyO52dtbrlG/8zJPhWldawqPjfK6NCxMBpXz6cQO9Tqr4B/0foHc9RjD5i77q7qkcRMP7Xd7wwemLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4bGtHj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGYQW5016186
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jx+gQH4DjWBB2/iazSCQmloXHWcepkEB1b0fEXviJpw=; b=k4bGtHj/gKo8gjmQ
	A9eJvxG33infZlCbybUvdrkUHfTeucuGnhBKjiQxy7fRgFtO9KCY7utD1yQ+JdQ2
	a0Qi0JIaofhGapQPGrmZfhuRFSKuIh3cJKwOLgqpYhQaHU9VUpvmDaIkIMTLyVdW
	9RD28ON52PiubJqyM+RayTbLb9sbEdjHsBQspPQ0dTA18tI9tS2C6j4TV/LY9h/6
	heFCPQTDy6mWNg+udOCIy9Ft/5X/MIECfp3m64Eh6NOVStMiK5AYBLGuusENe/2p
	kQA7JXDo2AWC8YWA0x8nNKMUnqRVGShTJhyNHZ+MKYUDYnDvdP8tPmwpnorpubZc
	gwzNNw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf17yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 04:51:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b471739121bso128805a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 21:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756356674; x=1756961474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jx+gQH4DjWBB2/iazSCQmloXHWcepkEB1b0fEXviJpw=;
        b=jMof+Qd2pkSXt3MpT9gsx9/7PcBK0D3Lx3E8sWBXRau7oabPF8dePf83nn0Ciq7dmT
         q+2Eg3OcN8LfMPAkX/gqGT+uKMkr5QAJM8341FW+m9vsP0FeBqPIuRFNiACDEvCqpDHe
         9unDZNhSbwnJZAmqWWiYgxxRQ7yP1rHPlvNskUQ/MV+F78SlV2sI2kf9GpzA8wiq9ECx
         JiOvI6aB7uXG9vbDIJd9ZuIF36v2Ppppp+odITe3CBcZswu7wyZdAr/u/VFxHnCXThbA
         YVDwJQGR6CGvXzxxSi18/POosZav36NTeg/x9wEbQDvXkzlk/TrDUHVLrD/NzQs0Pnml
         /zWw==
X-Forwarded-Encrypted: i=1; AJvYcCVmHN56mPFsqD7OkNXWZXtL1S48MRohkFg6T1sEgS8TKEIQcEvWjDGZp6mVhF/LpHKxcltN7JZgarsbhpKK@vger.kernel.org
X-Gm-Message-State: AOJu0YzQPrjlPa/O53sTTfvM4d5RNjTY06f/oGRoDXPIIlFuyqH6o8Tv
	QumJpEKI+qYULdrOnn1hYkQLwaG2obV1yKjrTYMp4PI5nP5vn9D6iiRolyJUAtHTqhvHiRHfouG
	PYF5IDZOgUqN96IJ+xB0BOCs+w4+q2qiW7i/HYwROORcBREobu7yjELbLB3K0kCUY5V0A
X-Gm-Gg: ASbGncu7CDvy12nNsxV6m7t0fdupp2Y8jdcMYvsochTT06Bn78jMrEQ/YwzjcHX4Pko
	yaG7O3N4u+XoRiWYldFhH9q5Lj2nJAi0+/XNHLKGV7OBEZhUo6WhlGjWVUrMdm0/hSD03QeNsMp
	QqhWj61a5b7VKOfHAwDlME2VUEB73SoF7uEkxio59SjaCOecedmEL7l71/x6pMYu2te7KhVIahp
	5HcVvdeKg5KNzo1eKnn8rmyku/csnpU+fqFBzwtfhTp2AyObii+JBcbkgAZjkiNMfp+0Jc7PA6j
	Eu3FOAGKqyQmkqGz6hmU/IRaDFpFq38U/AhQ1eBjFY8wS+dvVxZ0TOSuEpXqHQQPYNX/dMOzaKq
	QCJsr7P1KbhB5iIjPyZuDYcZ6bFh0PQ==
X-Received: by 2002:a17:902:e5c7:b0:248:dfe0:2bac with SMTP id d9443c01a7336-248dfe02faamr4013995ad.8.1756356674471;
        Wed, 27 Aug 2025 21:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmRbZMzQhw30/ipLkmYDVQtFMWzPa3KvkwGn6LZpn9/xGeveJfUognFXSqr0kP7nvEeevGgA==
X-Received: by 2002:a17:902:e5c7:b0:248:dfe0:2bac with SMTP id d9443c01a7336-248dfe02faamr4013685ad.8.1756356673983;
        Wed, 27 Aug 2025 21:51:13 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248e3e0b73csm2558005ad.132.2025.08.27.21.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 21:51:13 -0700 (PDT)
Message-ID: <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 12:51:03 +0800
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
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WjClWhF5BKxY7cOj0Opou-tHjJQ5ftHk
X-Proofpoint-ORIG-GUID: WjClWhF5BKxY7cOj0Opou-tHjJQ5ftHk
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68afe043 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=RRKZIDRkA7xEvhLoEfwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX7UnR7oQYzMLB
 XtWEzO+x3UP7tiFDpo42AcJBwYhd0vdRGcpCRv36HrE+pP9ZZIc8YnfQQgeazIJ5VH769DrHyA7
 M7ST1y4bf7+7duM3JZLn6cdYqMuR29GUDFji9VzhAh2vGItAj5v7VlP0q/Eky5Bpr1KeUvJWOSj
 Cg4lkE10NVJ+w4PL5I3VDOGU58cxeM0wUHffto7RXT18OnRKprhPRd06fnYzxbee6btFVGoHTq6
 ttFGprrNs8IlnOx7Fqx1iSKtHrvgFw55xwL+gZyoly3DECKTDx+6J7sdwiCOfQT1OTVsySv3cHU
 EgxLRklt4G+ya3inu2ohicar3cdbolN/R+kdVeOHLPyVU79nkeN5burVWzSGF7tL/peoOKGhJSR
 RpCBDf1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142


On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> While SM6150 currently shares the same configuration as SC7180,
>> its hardware capabilities differ. Explicitly listing it ensures clarity
>> and avoids potential issues if SC7180 support evolves in the future.
> I assume, it has no MST support. Am I right?


From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.

According to the hardware spec, MST is supported, but due to limitations in clock and pipe resources, 

the maximum concurrency capability is restricted to 1920x1200@60 + 1280x720@60.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -27,6 +27,7 @@ properties:
>>            - qcom,sc8280xp-dp
>>            - qcom,sc8280xp-edp
>>            - qcom,sdm845-dp
>> +          - qcom,sm6150-dp
>>            - qcom,sm8350-dp
>>            - qcom,sm8650-dp
>>        - items:
>>
>> -- 
>> 2.34.1
>>

