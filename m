Return-Path: <linux-arm-msm+bounces-64785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD948B03A23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 10:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252E13A02F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 08:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4909723D2B5;
	Mon, 14 Jul 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVKSxzIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A0123D2AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483371; cv=none; b=ANv6DYNP5XXa6ESio5iMT7D/d9fYDbWUiIZT7mGE/ai7SJGT1Yd0UfCjXY9EFNCAuYgZl4vFQ/dsdJm5/zOihAdGCSBsMF1qDIT9mmKzSy0GnQVCHV5tiueJOWsE54E+n5dRS4x27tZpINxgO3zr9ITOEsgT+MsLwxH4Rr21isI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483371; c=relaxed/simple;
	bh=X4I+rX7MASVYPmxglye1FOXudOJ3WWjuc7xvNa75H00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqH8o9pvYzf/z7FxCv2woubcib+pewMeKjDlnMDdPDU4ai5sq7+0nsHNIgWN6rMX7a73nHfRIqp/NzSqhWEU36nyxuB/m0htMXPVNdUfEp9HKs0OFu9TX6efyU9XZWjOmzl7LO31jAyw57C6XMGF1OXapR8f6fE24hlktNkQkPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVKSxzIQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNPu9S028331
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 08:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jY0WGc6ztQzUZ3gymsyEgC3n2Bv8t4dcCvQb5/DBr8=; b=pVKSxzIQrhKpDbPi
	r5coC3MplEo48xRgsX5iu1wil4cZlcdLj/qXYycNo0fQI/0YVH92iMmb3cVCZB/u
	i+QJ9/3lADJmAl99qFOuwIOsW03gGT4Of8kGu4ZcvNb/FvPkZ+Z7L4VEF2/Esfqh
	pvi0lzNiN4DrvK1DDX5emiJuufWiQ0xGqCJxnAsENLy4WCpDWXvJXW6JNC1GxOSM
	BJmmjbkQ/t98PISBMf9oI26tbu0Xx/rg1yHLs6FAr3Gix3IEK3KFs0je0/Wms8rI
	nlkqjX+9KLU1qF8cv0g+yVQzz1p1h4mpnmsh9fpHsKX5M0icSpxvGFbRmRhGR/c/
	Vk1BZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmbx9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 08:56:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab7a01c38cso118101cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 01:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752483366; x=1753088166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jY0WGc6ztQzUZ3gymsyEgC3n2Bv8t4dcCvQb5/DBr8=;
        b=O/JDbFzQl9lxPfmkiEJGaK7tLPuDX2gDlhGP7ir0oBT4LdzO0jeoRVCGpsKVOwzlt9
         luL8aOOGUpp66bVHX3E45aVAFZfoGCjCHOXtCd5ppJv63aT330sI359SBGVMkakc0JpL
         /Ihv9c81dLG/NAe/KwCukMGHjdBRIIeLy4q3/KXt9H7eNFSBEzRK3zXT1ldmrrlnCt0D
         Yn+Ke8LRvBWrNwoWj7P1x0ecgMnfv+StVaS4vA46eCiTvrySjBs1Yq1VMzzlKu86hrkO
         7Z0UtH68fQwtRSDo4m27IlOMrjBtmSWuFrAUCkXA17G/x6zmgGVbx4vvdpClG2bqsUOv
         UxWg==
X-Gm-Message-State: AOJu0YzYQ3uKzmHcvdUiYOw8PbFoJlWRPV5NYEcaQGpVr/mEE0SN6PR8
	4DH5sdtsaAHSmpKmxT3FlzjKm2UKyhgRDioaZkoT6DVLR6bmSEAw7bPWWpHiauxDtguZoSjz/QE
	NTxK+r63MV36/XGw9ljn27tIZofXzlF0v12NvFXUrUW0iD7V8kWb+KbSkXnawDcubbC81
X-Gm-Gg: ASbGnctVBa4XY+axJOK85c+IqyRUt92fg0dcD3A7jfvy3e6QntSXjcG/EHqXJiH7A8h
	+W5jv2YV/SjnGixoa4IOCCeHzdxtmcod9kw0Wk7mMoWcp3QyjRXQ2xHpz5dEaCVGJZZAAD0J2SL
	q4oFKBo8Fn7diAj1nHJaxuYCiA1t3TkwJXEKqYcKaHcr0RpQVwu3JV+Bf5+VXCojQ/h0TW2yIFf
	IHqUmR/An7UNU93jzZHofehyDIrMKewQ4OWUXDhAL/m2eyeTES1i+6eTB6xYO3gNpeb+X3HrM1O
	Tx1s/0HGI682YN6k+8UhpCkTXg7RWRw+HF9KU/NWLI9ru0Db62f1tTwQ/WRtxPDO0otlru4mBrh
	rB8ijtJUAyKzgCSuAQlu5
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr657114085a.3.1752483366648;
        Mon, 14 Jul 2025 01:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHAGDmj1FNKm7Td/jrJizwNYUh9v+mDxMjEP9OpPhXFzcce8+hBlEif0l1OBFKxoCqJ1Zqw==
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr657112785a.3.1752483366190;
        Mon, 14 Jul 2025 01:56:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910ddsm792022066b.18.2025.07.14.01.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 01:56:05 -0700 (PDT)
Message-ID: <7095596c-58b6-4581-9823-0f924b4ca005@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 10:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=6874c627 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gYDs5GclryXmtiFo2a0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: hABcI3V5NCOZzk0CswEgmZAIu4yEgwIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1MiBTYWx0ZWRfX9Y9y1cAmr7Wc
 QIcATGiMWSbl9DAqOUCXmsUM1BZ6R/yfVyNg1T3Zy/lEX7nUxJidu9OvrwYiiFui39aomgF45bV
 /2CyQ3soOztqf8/4E0R4+LE2lTCRhCGme6cy1+xXwGcTUIwxy56lOMHtYPP+dGa2ThJf93S2169
 P39ICvPSrMvrqJk0a0A0KSKr66imP7kmkBFyApGharOApgeCGNVKuvGaUUaNlg2uz9LnB1QE7Km
 G+PqBWuXGTAvd0lwQRB7VjSyQlp7O2srI5B6W6NIbjyteztSmEJRtPmPRzL6PMD4WfqnwnR21yZ
 xjjF0xyIwC2HPQFcvXhYQwEJs3qE4HmAk8992VDlgvG443qvRo6NbCCV7nQsbMrgZTht+0oTYci
 ninwthibCbGXm6d+wZN7GRCuAyCjn/GDtPRZs4DZTfW0qxXX2qN8dqzUtspgNk8L9aO/gNXO
X-Proofpoint-GUID: hABcI3V5NCOZzk0CswEgmZAIu4yEgwIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=881 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140052

On 7/14/25 6:47 AM, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon.
> 
> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role
> switching.
> 
> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI chip to provide extcon. If usb on this platform is
> being flattneed, then effort should be put in to define a usb-c-connector
> device in DT and make use of role switch functionality in TUSB320L driver.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

