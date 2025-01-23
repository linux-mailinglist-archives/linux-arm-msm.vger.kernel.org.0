Return-Path: <linux-arm-msm+bounces-45894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC82A19EA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 08:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2343A16CFBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 07:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579832046BE;
	Thu, 23 Jan 2025 07:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1IeRc1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A7D204689
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 07:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737615640; cv=none; b=JkhKNEhT1HuJ32BIoTkaV4wgHjL3by3GECdLdAIdkS7lcHlS2//hpnJXrD6NqktgjgxtjbB6STdXsoFnHB8yQnlc33TM6o6oKIyWtRNfaG4K6MtsXnLYZd2LLNN31mb6kec8CcxGL3/T3cHuTGuw2XrkeHLucuQs+piBk4Cq0wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737615640; c=relaxed/simple;
	bh=iGEmou8YXPBnjgo/+uSyYUyeD1Wyd+0w0MC/QEz49tM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Sq3g0FSyuqatz3XBwwd/FLA4BTdne+fNt+yVvVQXid2q7H+P9Mza6lJOZkJ808XDDdDSAY+8sfE4HCFnD+bfxA9PJxcrb5+vE40LE2UIMMh9wgqBKX58medH1fi+XaMg9ggjPBMr+rIScefGe9O1omHm22ylB8bcJDnwxocdmhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1IeRc1s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N4rw00023879
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLn0ZtrJED7RhWi4kHyBZkUHUNX/qZUfzSOJZgWhM0k=; b=b1IeRc1sjY0SB1vB
	nE496pnBziEdFoL+LY0oXyyfWqAFcC3LuKjzTWdkmHbwzVN1RMvnM12ybBGZmmRh
	cAZmAAguXVKonhowybrw9tfLMDJ3SljqiTr2yTdCYmkN9CIugSfadkAecLrtauHH
	WDx4sHBR+/DsrczAVQbiZqgx7LHu6JYPfKBPg6Rqrn0v+zh6inMyQ/mO8WwDB+WQ
	aobb85E96jjacwPf3Kbkafm3eU9yDB1J4woOp51KfhS9QoOilMaWHnX3Y4PcCPF+
	ZiSfGfRZBk7un25i/ARWGt/ZcO9sBoQZvwj+g5nrk/CWdXvC2tJCKbT7wBnvDjBh
	0RQHBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bf51887q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 07:00:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee86953aeaso1363608a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 23:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737615631; x=1738220431;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLn0ZtrJED7RhWi4kHyBZkUHUNX/qZUfzSOJZgWhM0k=;
        b=IDKu6wBJv2KsuXXPgAL1fQG7hRhvV6UnmDw18nU6g5c/VfgCNW6JiXuyq13z3AyZgb
         j0eKGNvnQ1Vy70xuJd3FxJrIytKYCKdbh+ZX/yGbJmf05rfRx92ll6EPvtBJoucAysS2
         6XLYnOVzNAi4UZ9/Nu6hukTkhocTkIKsbYcufU/U/R9qkRBLnteScrVoNEXTcs+yG3Qd
         c4o8innq6zF/OFxEROYXCmYBH6LKl9Gu+MjtJIVPMAvALX3LQiOrPtrZQs5A4CxiRIBl
         ivPapiKrTs5ZhTCUrPg35IGIvisbgbaRq7vieeQR83S4x891ZbkWSdz3LQJiVneR6Y3g
         uosQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlSAW5RqiXXp1WX0SXcOXh7L1CuYUJLA9wCNO9pMjjokCWydDXxCucH0gng5Wt6HoLfO4lRV01570S/7pD@vger.kernel.org
X-Gm-Message-State: AOJu0YxMyfJNNiKnsWo0NPSIIb58wDwoGCc0nXp7GMgZkP3t3w/TDIWE
	UrUBehH2u9d859Facaq5S6CxPOJcQykbMWuL7XLZwr97gDw46JuIWuycjc9NlwfEblX0J91uDvd
	dNwSu5CuF5Mub5qqeSbbE4C7om+mdwcZphE6ebY24NyfLfsTCK8IXL+gmDRh692s7
X-Gm-Gg: ASbGnctQBmkwVvJSR6P611vYjZHALlPFQ2nyDtx9jeIQMuedXAxqbXYxpnJ7H7JXfWH
	Hy+tDR3mBxtxm5k6XE/ZLLrh91FNnzhSn7dkrg1BtcMk3EcRi5ZuiaRoKT4GHsSxB3gUJbxjco4
	SNeBdYEnL+ZcvLvnnNFk4gneFhEJLyB+NjELX+H7l3rs+KrtfzsPif89LB3Bn1ZXgn/7jdAbDNO
	zXWE7L6GAljhh06x6M7szSR01wKoguIUa2aUhT2gs2/MROQgguTFFdGtmRTkIVGHHHlpdCwdzZ1
	Xb9wXHQL1Kj64vtNPIahmk9D
X-Received: by 2002:a05:6a20:8423:b0:1e1:ca27:89f0 with SMTP id adf61e73a8af0-1eb215bec54mr40615270637.37.1737615630973;
        Wed, 22 Jan 2025 23:00:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZ6pMT4A88Fdmsz/cNXQ9PxRhY0+FNHVX1QOqxLkCD3YyRypW/6C9+UUpI2loS7HZ7xJvTqw==
X-Received: by 2002:a05:6a20:8423:b0:1e1:ca27:89f0 with SMTP id adf61e73a8af0-1eb215bec54mr40615194637.37.1737615630406;
        Wed, 22 Jan 2025 23:00:30 -0800 (PST)
Received: from [10.92.167.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aa84ed133fdsm9486272a12.17.2025.01.22.23.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 23:00:30 -0800 (PST)
Message-ID: <f607aa9b-018c-4df6-9921-725693353f65@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 12:30:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on QCS615
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
 <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
 <anfqf3jvh7timbvbfqfidylb4iro47cdinbb2y64fdalbiszum@2s3n7axnxixb>
 <Z2sJK9g7hiHnPwYA@vaman>
 <i7gptvn2fitpqypycjhsyjnp63s2w5omx4jtpubylfc3hx3m5l@jbuin5uvxuoc>
 <Z2sOl9ltv0ug4d82@vaman>
 <318620fc-e174-4ef3-808a-69fe1d4e1df5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <318620fc-e174-4ef3-808a-69fe1d4e1df5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QHpp9w4fx2abRXW6l2Us49U1LaXeSg9c
X-Proofpoint-GUID: QHpp9w4fx2abRXW6l2Us49U1LaXeSg9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_02,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230052



On 12/25/2024 2:01 PM, Krishna Kurapati wrote:
> 
> 
> On 12/25/2024 1:12 AM, Vinod Koul wrote:
>> On 24-12-24, 21:33, Dmitry Baryshkov wrote:
>>> On Wed, Dec 25, 2024 at 12:49:07AM +0530, Vinod Koul wrote:
>>>> On 24-12-24, 17:38, Dmitry Baryshkov wrote:
>>>>> On Tue, Dec 24, 2024 at 08:55:18PM +0530, Vinod Koul wrote:
>>>>>>
>>>>>> On Tue, 24 Dec 2024 14:16:18 +0530, Krishna Kurapati wrote:
>>>>>>> This series aims at enabling USB on QCS615 which has 2 USB 
>>>>>>> controllers.
>>>>>>> The primary controller is SuperSpeed capable and secondary one is
>>>>>>> High Speed only capable. The High Speed Phy is a QUSB2 phy and the
>>>>>>> SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.
>>>>>>>
>>>>>>> Link to v1:
>>>>>>> https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/
>>>>>>>
>>>>>>> [...]
>>>>>>
>>>>>> Applied, thanks!
>>>>>>
>>>>>> [2/3] phy: qcom-qusb2: Add support for QCS615
>>>>>>        commit: 8adbf20e05025f588d68fb5b0fbbdab4e9a6f97ecommit 
>>>>>> e1b2772ea957c91694aa91b90e4c0a1d7b0fb144
> Author: Krishna Kurapati <quic_kriskura@quicinc.com>
> Date:   Mon Oct 14 14:14:30 2024 +0530
> 
>      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for QCS615
> 
> 
>>>>>
>>>>> Is there any issue with the two remaining patches?
>>>>
>>>> Something wrong with b4... I have applied 2 & 3
>>>> Patch 1 should go thru USB tree
>>>
>>> Hmm, strange. But then, please excuse my ignorance, do we have bindings
>>> for these two patches?
>>
>> I see to have missed one!
>>
>> This one is documented see:
>> d146d384222e dt-bindings: phy: qcom,qusb2: Add bindings for QCS615
>>
>> but, the third patch is sadly not... I am dropping the third patch
>>
> 
> Hi Dmitry, Vinod,
> 
>   I see the bindings for QMP PHY in linux next as follows:
> 
> commit e1b2772ea957c91694aa91b90e4c0a1d7b0fb144
> Author: Krishna Kurapati <quic_kriskura@quicinc.com>
> Date:   Mon Oct 14 14:14:30 2024 +0530
> 
>      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for QCS615
> 
> As mentioned in the cover letter, the bindings of phy have been merged 
> from v1.

Hi Vinod,

  Can you help in taking in the patch-3. As mentioned in previous mail, 
the bindings are merged and present in linux-next.

Regards,
Krishna,

