Return-Path: <linux-arm-msm+bounces-73481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C1B57034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 08:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5539C16FC5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 06:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58461281526;
	Mon, 15 Sep 2025 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSQ7m4bJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E1280A29
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757917588; cv=none; b=Uy4ZhRc46hvnq/mgiP5P52KbUpmMRO4DIcbABYygpmgzk8t7RoawtSfpwJ0g5pRqUnZNa5Q7D4AI7lRStFafMtRGiiUu3QtOZQlUD+37fuXD33yf86Td7Vy8dfZhAPnawTE0Awaq/6MxFLlJ/i5nbTyBo7wpQV3JS4KYQLgeIsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757917588; c=relaxed/simple;
	bh=p3cqF/An1AZjw8JVOz9xUECjqoR0vI9WU1IXWZyL7Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBAfzx0YcZiwmCj8B/l1TxoSRjsgnUZYAxQzpai7Y/5ZGrYxMKVwYCCicBigwryRgi5z6NQc+uUVfuFNnD/YEZc/q15jf2+zQy+6QYoOy8XDJAARYXMUzeM1eQPEZn7STboaBIXohs9dWSeqXTCuawfA+PoZIhbQkYVNOVsi0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSQ7m4bJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ELeNvx015658
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3cqF/An1AZjw8JVOz9xUECjqoR0vI9WU1IXWZyL7Ro=; b=aSQ7m4bJjFzNFsE9
	VSYPcz4xcmtaJlDYhC2EqGRUm5ndV0GtZ5ZBeFj1LG8f21dM4HFUVcP/Qazs4L45
	XQxVIPundh+0tP7/APebYUPMFWTcQxN9OVcP1byjVF1P5Uh8pRvGWO7EUqQxkE0N
	pT/lfc/eZPD91lpJhu5PqogW9Ekn8y2aszHjn8LEVB1C4Xf8eGX1j4d6LCX9fDty
	NFDaIUaSlsixlxtqVNaCN/c0k4rS9pH6tcKJgMdDT/49vF7p/a+BvSarI08jOi/O
	2mww+i6wAEfLN9bvaRDrLHZG/EhSq/ICZPPgbGmCXUhw/pgg1rA35kABR+uRmVN3
	M75Hjw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yjv3s69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:26:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b54aa407bc7so798736a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 23:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757917583; x=1758522383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p3cqF/An1AZjw8JVOz9xUECjqoR0vI9WU1IXWZyL7Ro=;
        b=MS1R7hd+q6KsFpQjbSTW3q4vfR3wE6o+5u0F77J3fa83AJqg2a7Jy/uwDfZe+LuKzW
         fB6cHLPeNsgxQQYDIt60Ig1mQGBAtmCbUc8mPNAfqQ1KQSB8PRgnHOiEO3LkGu7Aw9kW
         XxteRxNvH3LRO8dtszUM89x0H7P3nsqEVsxSK5EbFQDTnv7DrAYzFzqamztxiJFvr84/
         0Mdr9SeM+qNjs41I5pNVqUTR6ywfitpjqyPY8BaJSD1SgSDFAVwN5pQYhBxM1J4eN8kH
         KorNWYrBk48NSUYshmv5YmWdt5dUpiuEd0bU08AGDu+IpCIqc+5IA8keM0gms1ged+Ya
         BKSA==
X-Forwarded-Encrypted: i=1; AJvYcCWrWwnA8nzMO/9RdI8BST8qtCRruI8SFbDymXkfUnhIpgGcJsoGOERxsUsrwTWxN+c0dIINLaR9R2BmcbVn@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4T9rA7N8FlKFbw3ZWp0GKXgVDTUb7mc8LefwJ4vptjvJbB+O
	MLEoOh+U7jRvL3lEuUC8Rjbh/mWhk3wztQWmhXao9Vb2Iwav8gVu0WaR7xkNpYMa7jZ9qNl+gKF
	5tXrjTLAveHt0RNpWOhkhjKDSyq4m9uqUnAtrZTabCCAsxoEf9KkcIRpqOGMuWCMDaqkW
X-Gm-Gg: ASbGncuuX365tQcB0fMaeGhxUj6wGu7k8uQxQSxwXCwPHgbqIAq0Cn9bPSjKsrbCEJV
	XJ2ldOWl3VMHwZNdCRIZJFebjekIARoZfmnUKcEhcbbRzDX18//WR+ev4ZF9AMiymxqAghG52Yx
	yQ52CcaYjT3lItdxoQHIYXQeW/h0eIMqhTD6KLzUfBMVJvJGZuxgdcMs/DPC0+PMJyqLBWaE+nz
	WKUIOLUwTVEyi0ugNKNb6BDHdAqC/HDf5mOHNoRQwrDxTUIStX8uUalhiI+BRHpdyqgyVpAraoF
	2FzRmAjo6i16wJUeuHrW+ueURrX7GTwvZNEkVkLnHEda+HXubo+qfY5rdMo+4xgIor2tezBu21u
	TdyVfxfbDJHMYptiDcj3zI2sCzYFzNuM8kvg=
X-Received: by 2002:a05:6a00:a96:b0:774:2286:361 with SMTP id d2e1a72fcca58-77612060f79mr6738232b3a.1.1757917583117;
        Sun, 14 Sep 2025 23:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnsuQAVbn2atzfG9WWx0sSeaLKGnzB1+E9spf7myo63WZ+ZUpm7ftykU++CRXawOnpXfnInw==
X-Received: by 2002:a05:6a00:a96:b0:774:2286:361 with SMTP id d2e1a72fcca58-77612060f79mr6738214b3a.1.1757917582644;
        Sun, 14 Sep 2025 23:26:22 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b347f8sm12075678b3a.82.2025.09.14.23.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 23:26:22 -0700 (PDT)
Message-ID: <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 14:26:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
 <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HcoUTjE8 c=1 sm=1 tr=0 ts=68c7b191 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=olEU9l-643s81VMgE3sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Q12TtIuYnqA_vWuje-8igSdp7B5vZ-up
X-Proofpoint-GUID: Q12TtIuYnqA_vWuje-8igSdp7B5vZ-up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNyBTYWx0ZWRfX1874F4Kh4F+O
 F8jmKVyGLQLBJQ0U4vR3wTArdXnb10A3Rw2nxYeww1STACvpKf67GT6WZdcB/xiP6MOwNeZTFX8
 9ZyHiLHvs8bOoQqnp1VTeGxhANAj2lCVy+WzHI+o6zvbbutl5dl+nlFaIpiInoE9jKoldNzARNJ
 iE/vvGRDfWz3SQxmeRLi8hdOjJzYnjqgVKeQglIS9IzcIwZH2wWXr/V92vd6g/qWdaT6T++NFsl
 tEJDTFj8CmJ8gNQh3HrtJknojqbVctaLOFtt6bcDJIYMkVcK9kRA/vTeC1T7zLxR9ac0FBcdu8F
 8fJy6rtZYbwEcLvloE2N2UkpgHI3zGypHVq0XB7Rx0/uGQBW5e2fYypv4tuGSckuG4e6wDMOyuU
 xch/ypdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130017


On 9/12/2025 8:10 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>> SM6150 shares the same configuration as SM8350, its hardware capabilities
>>>> differ about HBR3. Explicitly listing it ensures clarity and avoids
>>>> potential issues if SM8350 support evolves in the future.
>>> The controller is exactly the same as the one present on SM8150. HBR3 is
>>> a property of the PHY.
>>
>> Ok, will update commit msg.
> Please red my response again. What does it says to you wrt bindings?
>

Yes, SM6150 uses the same DisplayPort controller IP as SM8150. I wasn’t
previously familiar with how fallback compatibility is defined in the
bindings. Since SM6150 will be declared as a fallback to sm8350-dp, is it
fine to drop the driver patch ([2/2])?

Here’s the updated commit message for [1/2], does it match your expectation?
'SM6150 uses the same controller IP as SM8150. Declare SM6150 as a fallback
compatible to sm8350-dp for consistency with existing bindings and to ensure
correct matching and future clarity.'

Thanks again for your guidance.


