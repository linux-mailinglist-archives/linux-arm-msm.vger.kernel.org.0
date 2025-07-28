Return-Path: <linux-arm-msm+bounces-66820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9134BB13773
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45EA83B880E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A5B22D792;
	Mon, 28 Jul 2025 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBbJn40v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20443225785
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753694707; cv=none; b=dY/ybF2MIKT+vJlojyyQ9bEQq7454S8AyWC91ywDBTnByZ3N9K4uDtAo4iMORCsu3m0/GKipg6Ycrn/RIGbold2FZ16uG0aD/n7Zv/8fDVvXSGv+25OVYOa4saeqnYTS6AokJyHV0KNyy3i3qTykpRItPecT2p6FW8BIQWNVt5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753694707; c=relaxed/simple;
	bh=PvPKcE3eALATxUJe1yT+rLheC5LBnXtwdUiRFngfSqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3mL6SEC8K+S2l9F/IA7pNxOQOBvvR6/R9sEWD9BBIFa6xA+rid4Zi0q74W4vjfxpyGb533GFOmIQNcKJxFBJDkj9TwG1olrJBSw3MoCp9oCmDE6mggeLnhC6OBjwlJxpn2QLNk57d3/0YGmG5KmlPC3dzpCE6vO7geaU5/DmCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBbJn40v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rRwd027226
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xO1DkZAA9DCroi1+CycGEgMcsvDK1LPRrUiGmAaML1o=; b=pBbJn40v9A1yBZb+
	L95XkkmCpRgxUZx1VEtq7L2Sx/PamdGr4//heZn9OqRMMFTkPAGQCLMvulXn+uNP
	QzFHiRCknpCBjIHU9rrn4QpCywqzVr9oJPgRZ/kdd3+zvW5he3zEQz/+KDhAoQ2w
	QTuMKv8KFPSKWbvfPQ72L3tXcYsncM39Ft4pWlOz/fi7vfFk6YH9PO+nASgt9Rpl
	itjUvh5ol0Zzhat49B2hetJXw1iUxFN4HUsMvUXj4/ndSlsJVYEciOhvO1R8/mCM
	sMGTb6v1iUsuTAWd6HC0nX0vGq0HPt7HEMa/84xlI6nFZ0FZlBbhM856c3VQMzfj
	VBMcvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2bxjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:25:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab7406bfa1so10678081cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753694704; x=1754299504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xO1DkZAA9DCroi1+CycGEgMcsvDK1LPRrUiGmAaML1o=;
        b=T9WmvNhvd2gd1MCEmiur+xNSjW2a9VbxxAXz/y7aF3v1Q7RJC/MkH/myBgd0ucArNh
         XSdPkZ9xbsLqtWBo8W7Y1n8d442TO/8/mBdGvMqGqPQMXVsio8F4ype2uX26u3lgPCZn
         VEiNoUtn5WT1jQykJJRTxhgIwI6yzX7Nath5VIAIpjswBTcoOe5tS7DFOfWYI+HAN4wk
         iPhX0Y+Mfu61sIl+efxFibDeHv/UTYIh3mEksBkZsCu235OZ7dy0pgR7kPj7j+hCKEdT
         ublZ1t80iwa3ju9EfenEVGhsgDDYcCeGS3ashS4ifg7Jj2NveQZxCiHsgiygs3QybqvV
         APTw==
X-Forwarded-Encrypted: i=1; AJvYcCVNvuSiNswi03vHaVAprL3jKg5YdgoFG2Csl6Axq1jeCcIJyNXDrm6WPWKhTlPUI1l3B5BoIFmAVkI2dgSk@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTkTGjJsd91T91hWPZef35Rc+J6IjsINR4b74fULRX0o6UqDZ
	ioZ5JlEcg0uorH7rSkXnNmAte9czKwVOHypJy+LoivyQ09lCfGfJ77FmTLmOksAY5ARiyFBAPeQ
	7ZpYyQYdWRIm5ZPN9LUQos7i1GjKbIivv34tg2CiIRrfdMztrVd3kh3g83DEamAjX1BdO
X-Gm-Gg: ASbGncsZmEj8xJ62HReNPvBmRUb1h3QzGEIPXXJjUAIJmMo6LIno9yv4B6yuUDFsw06
	5HnsssBGCRPwORsiBLaDSrmX/WBl0lJcmJAWKgg2r1r15Enns/hiX+xxNjLqQeA/KQl+xoftR69
	NDTCMnCSd+mtGsK6GTc/885vywybo34fI9zjrKzbZOnaTwVQM9FaYxV9tC7ME1qVhscnUWcpSEf
	tTsZIazF0kswmnNScJ57le7eFl+64jsI03D0PWNq03+NBVifvcX33vXCNsZBF8T+isgTIULU7U9
	drAq/U0N6MeyAInF6CHqoTcmz2EHYuA8YShim1vhol1AomZ9x2lKIBBp6yQbsD+/HoPQgDHKlkH
	7gpUyxqELjWIXfcjVzg==
X-Received: by 2002:a05:622a:1b92:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4ae8ef7e796mr58446301cf.6.1753694704006;
        Mon, 28 Jul 2025 02:25:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxAT4whBsHT+qBFJmzRTiibTXpVW5iNbuG0sn1pmyCWfzieUITf0fIw8UP0wtE2IZXWRpuTA==
X-Received: by 2002:a05:622a:1b92:b0:4a9:a2d2:5cd5 with SMTP id d75a77b69052e-4ae8ef7e796mr58446161cf.6.1753694703376;
        Mon, 28 Jul 2025 02:25:03 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61500ae2f31sm3003928a12.51.2025.07.28.02.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 02:25:02 -0700 (PDT)
Message-ID: <6e8bcafc-da00-424a-81a3-439e7ed6e080@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 11:24:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
 <20250724-blazing-therapeutic-python-1e96ca@kuoka>
 <7d444f4c-fa1f-4436-b93a-f2d2b6d49de2@oss.qualcomm.com>
 <a3846433-f1f8-4b83-a965-baec24ee5159@kernel.org>
 <adffdc2f-7dbc-41ea-ac9a-015af251b43b@oss.qualcomm.com>
 <a16c19e2-a4be-4c62-87f3-5d0354893bcf@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a16c19e2-a4be-4c62-87f3-5d0354893bcf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WplezZR_iUgR1TeRySuOp4Uur9Kfhc4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2NyBTYWx0ZWRfXxzeNAbb/kXbg
 +ElZO07u4pU1p4+fC0g+bzuryV8KGrBQfUrxgZmsSE22HQE0XQIewqc8HlrXWFgnM7PNGszcgVa
 PqtQWR7xteSjAvXs34BIMlGVfjHKLmCLN9BpxBwY1gbNqBEKLyemVJVc9j94gb4uUpxTfBb+j1t
 xjsqIAPKJJGnx8OViCMYwkG0jNwS0l8wzZ+bgxDsTl/qaXkOVnrIeg6Ccasi+L9oAYq6w8xAA79
 AfWmeuwKipXu5uZ77gJNaMX0QCDXUh5L4ehAVtOoyvB93jfnUgo/gcCVluRHyflYuJD3EcSM3Ne
 lCafC56qhCVf0q5AouIx/DYLpIa0fSxcp9hjeXQ5S+kKO/7nw5/y/N7zDcbL2mjAgM79ZeIIt7J
 4/6s4gZrztnB5+jODkuH9SGXsgqvVtuBAxT3gVQYchOnO07+Dront8lwWxOk1UUZW0ozDb+u
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688741f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Rh5PIcw8VRhVldmlYEYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WplezZR_iUgR1TeRySuOp4Uur9Kfhc4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280067

On 7/28/25 7:05 AM, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:23, Konrad Dybcio wrote:
>> On 7/24/25 4:42 PM, Krzysztof Kozlowski wrote:
>>> On 24/07/2025 12:53, Konrad Dybcio wrote:
>>>> On 7/24/25 10:18 AM, Krzysztof Kozlowski wrote:
>>>>> On Wed, Jul 23, 2025 at 10:38:48PM +0200, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> The SM8750 features a "traditional" GPU_CC block, much of which is
>>>>>> controlled through the GMU microcontroller. Additionally, there's
>>>>>> an separate GX_CC block, where the GX GDSC is moved.
>>>>>>
>>>>>> Add bindings to accommodate for that.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>
>> [...]
>>
>>> Yes, qcom,gcc. If that was missing intentionally, it is fine assuming
>>> you implement the rest of comments.
>>
>> With the description addition that you suggested above, should I keep
>> this file in clocks/ after all?
> 
> Good point, I don't know, this is unusual case. The question is whether
> there could be user of this binding/DTS, which would need/use
> clock-cells? If none of possible users could use it as a clock
> controller, I think it is not a clock controller from how SW sees it.
> IOW, it does not matter what it is fully (in bigger picture) if it
> cannot be used in that way.
> 
> If all users of the binding can use it only as power domain provided, I
> would move it to power with rest of power domains. Also rename the node
> name to power-controller or power-domain.

The hardware block can be accessed from the CPU directly, skipping
the microcontroller (although that is undesirable and the only "real" use
for it I can think about is someone trying to get rid of a blob).

I can add clock/reset-cells to describe the hardware accurately, but
the Linux driver(s - this is a block that exists on many >=2024 SoCs as
you may imagine) will continue to only provide a single power domain.
With that, I think clock/ makes sense, as this is essentially the same
hardware template as other instances of QCOM_*CC

Konrad

