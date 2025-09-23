Return-Path: <linux-arm-msm+bounces-74490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D897B941F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 05:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5853D444A52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 03:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EC1263F36;
	Tue, 23 Sep 2025 03:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFz4IHVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81830154BF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758598734; cv=none; b=D+WRRSJyU5vvas6j/IAiNSyHYwKCG5HZwijCzrb6pmokWd87pSNYlpFgLhfscJxyRzJvq7OJ+PurCmLlRxXZh8klYduXTX96CCkCQkKbmqBy0ATBalsLCZV2Fk77b9n/zBippWCLBDIFUrbTynRoEkXaubIJ69vDZfwDVfZrb1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758598734; c=relaxed/simple;
	bh=xeu3h0son4iAtzIYRr3b0sKUbwGe49TTuiQdes2DrQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0GC0h/t2sE9SuORfY5I8IKznEvQ38yuAufMB3CKJsyneKR9MZ5vEDtjaMRWS9t2lpYCb8QveeI62NWHNJWFW/3yAIe2Dxp2TZ6dvHqki4HZmMP0I6n3lvGO8Z9+1Rb9z5dNWxrldoyAvBHyBJEhLFXLUjq/2SYi98i7OZEVlm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFz4IHVW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGXj4x002021
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Y+UxxpE5WuCRJKuL0hvK4qAyKZPxGwcP6Rwn7/3joE=; b=KFz4IHVWkCAuM+Gr
	ihh3zMOk3sz7yyPuq6meqSBY7YiXu9sJ3Ovl8LYI61cfbz09oYecTiJe/lyjqVDG
	KEzyoIpj/5TgH/SsGYfYwYD7zQIQWJC8qOPQoNYsrjJDPIbpNkVOn+KXq+DXYAW9
	y3CO1VYETWVuyFcDyAqLjhdHY8TbVuZA5F1G/ClJBVyqz+l+v+BDQsPZrEWehj5+
	uR0MMK0F2cfTQzQmaoioJKQmVrq1s1+8cZkEF1f9ICprkjT3PLKdm4e1oybwON9c
	S/MYHMgSWrU1SY9zq+nOOo9Q9q30ORUfz8qlA7MwxCFU4ipWeBlzFBjJtnLrKzqp
	Zl/9Bw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98f148-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:38:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26b7fc4b7e3so10154855ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 20:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758598730; x=1759203530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Y+UxxpE5WuCRJKuL0hvK4qAyKZPxGwcP6Rwn7/3joE=;
        b=b4rN9IZcDlmNsAhpPms0I2cFJ8teiG2/bBXTEp4Qjn2nhMmKkU6zZ2kmHAHRBDCUyP
         xbP7N+dDaHkJvpHOO+7SQUat2bq+ggwabvZUR3JaS6HBRhusjgICZGyUTfUP6bpYGgyU
         a0+tCIT2D6H5uHUzuckR47JkkWWvyHEC83WyALytHKcTVj/HOFn57Kbp9uOZri68vrob
         zo1VWwQw4GgOzmxPwuwr3hexRaJ852NdX+A6qgYRyNScf91JwcJtmGzRrxIZGEwUsLYg
         LGQ7IWDp0eBvoOTUsiJss5AfaooTIO6b2uJg4QaBqVU8Bc+xZ4FNP4N1JH65KF3kA4qF
         NxsA==
X-Forwarded-Encrypted: i=1; AJvYcCVhITfYapKQDT3e2AuaqoCN9kUv4JFpSLmXEAGIseoqhTX0KCngpnlCpUzMhmqBcaYkiNVUA+q3SD+QofCs@vger.kernel.org
X-Gm-Message-State: AOJu0YwZBcHX+JbDJjbdypfktdD+pVuEFY9FLNp9Z9TRqnClZf77c8JC
	3lZ6lnnDr9ufK/XKNdgm9RiUInLnIwe+CFg7JuxZUiEwKPKR4abZXh+WUPuUu9cJS5OGcIyqAxd
	vpY/0rLYVF5IRlu/YWMikqCvdPDskEDrtq1sqIoNj24FoxmokZZ3frek+8EZqklC4CTBM
X-Gm-Gg: ASbGncsvPVZ9zqoIA6LJt6GrEucS3q2SyCRS3iKeG8eRKUYNAAvDPRp5tOTq4n8aoXQ
	kE7Z6XwU2h/T8QdfGBmuIn0lF8K5wapZQg/BOdZXZRtZM+rH29qCIs9ZMbO5nZyAmwg9vipYDZ5
	uxK4z2vx4/d7f1W7YKJ6m70d5HBr2OMo7SdIh7ZeMKtuFhHOtZ9bhscr1aXz1igtqTmtLKOiIgY
	UVeI41EIqTFn6+wxFxLYsE2ynrNEf6wLlPASW9t1k0ZwG8qAp6fN5BFptCJFZNJqhesRV2RtamS
	Kq9bR7twlm8IDfUysrgwW/6rSBIczrI6jTEzwTANq2NFiiWs4Qt5wJL12LLhMG2st/7h7Qc+tWR
	lhgGZ90Yx/f1lM59ICxK/idWe2XsYL1h0vUQ=
X-Received: by 2002:a05:6a00:1828:b0:77f:3f06:1f78 with SMTP id d2e1a72fcca58-77f537a8173mr828271b3a.2.1758598729787;
        Mon, 22 Sep 2025 20:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5W8YAPrrchgMVeHplJ5Ln5bt4yZvCXn/JchjMJMX2nlmqazlCN5vnpvVhSh9oEhVk8Z5oRg==
X-Received: by 2002:a05:6a00:1828:b0:77f:3f06:1f78 with SMTP id d2e1a72fcca58-77f537a8173mr828234b3a.2.1758598729324;
        Mon, 22 Sep 2025 20:38:49 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f41b85e84sm3439351b3a.86.2025.09.22.20.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 20:38:48 -0700 (PDT)
Message-ID: <d7b2a904-97de-4716-b179-4ad8d3ecbe58@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 11:38:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
 <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
 <t4x7okzjvh5ltyoniwlreoyy76735igtnxpeohpbojn4hkqk4q@v3ayfjrkez3e>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <t4x7okzjvh5ltyoniwlreoyy76735igtnxpeohpbojn4hkqk4q@v3ayfjrkez3e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -7Bb5HydxflrP9n20p65MMcD00n40GhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX8OgxmzTUXFNd
 eHkZ7m+U8jebJjYN5gFEqW2BuJyn7lo1N/ZcoKciFNZY4qEgQ2qa5A7DxtTHwq0GnrDNmKsovkY
 8Er8GT5fPpRKfGqfTvczmpwEAMbXTLgFl4Na5W4wK2dLThzNbdBqUIcl7Au57U3VV1+UnznLlrO
 qGYepbnA5hl7rd50WTb5qtHRr5ZM2IwaAaIdhEpUsP1tQmfiJEjneFMBYiZ1I2MfG+ChpwvXDzC
 OURDCJfJ/Halhu3Z1Exlu/ExpqrabUGMlbpt9xKrPDymKNPwUHH0V+ialPYxZ0fz4O7zscrXQri
 wZD5RMuhGesEnMWBXmuVR6dTIS6WAXKIKTKjsrRShS6nqtNDmEecHsRW6eZJgWAFDLbge5aNgWy
 CfVMv549
X-Proofpoint-ORIG-GUID: -7Bb5HydxflrP9n20p65MMcD00n40GhS
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d2164b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gP3TSUq4Lgg7EeaY2V8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018


On 9/23/2025 7:39 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 08:13:00AM -0700, Rob Clark wrote:
>> On Fri, Sep 19, 2025 at 11:35 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>> On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
>>>> QCS615 platform requires non-default logical-to-physical lane mapping due
>>>> to its unique hardware routing. Unlike the standard mapping sequence
>>>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>>>> configuration via the data-lanes property in the device tree. This ensures
>>>> correct signal routing between the DP controller and PHY.
>>>>
>>>> For partial definitions, fill remaining lanes with unused physical lanes
>>>> in ascending order.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
>>>>  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>>>>  3 files changed, 66 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
>>>> index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>>> @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
>>>>       return frequency;
>>>>  }
>>>>
>>>> +/*
>>>> + * Always populate msm_dp_link->lane_map with 4 lanes.
>>>> + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
>>>> + * - For partial definitions, fill remaining entries with unused lanes in
>>>> + *   ascending order.
>>>> + */
>>>> +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
>>>> +{
>>>> +     struct device_node *of_node = dev->of_node;
>>>> +     struct device_node *endpoint;
>>>> +     int cnt = msm_dp_link->max_dp_lanes;
>>>> +     u32 tmp[DP_MAX_NUM_DP_LANES];
>>>> +     u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
>>>> +     bool used[DP_MAX_NUM_DP_LANES] = {false};
>>>> +     int i, j = 0, ret = -EINVAL;
>>>> +
>>>> +     endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>>>> +     if (endpoint) {
>>>> +             ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
>>>> +             if (ret)
>>>> +                     dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
>>>> +     }
>>>> +
>>>> +     if (ret) {
>>>> +             ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
>>>> +             if (ret) {
>>>> +                     dev_info(dev, "data-lanes not defined, set to default\n");
>>>> +                     goto out;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     for (i = 0; i < cnt; i++) {
>>>> +             if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
>>>> +                     dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
>>>> +                     return -EINVAL;
>>>> +             }
>>>> +             used[tmp[i]] = true;
>>>> +             map[i] = tmp[i];
>>>> +     }
>>>> +
>>>> +     /* Fill the remaining entries with unused physical lanes (ascending) */
>>>> +     for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
>>> Nit: i = cnt, j = 0; Don't init loop variables at the top of the
>>> function.
>> These days we can party like it's c99 and declare loop variables
>> inside the for(), instead of at the top of the function.  My
>> preference is to do so, unless the loop variable is used after the
>> loop.
> Ack, works for me too. I think I'm not used for having theese parts of
> C99 allowed in the kernel.


Got it. j is only used in that for loop, so I'll update it to use C99-style declaration as suggested.



