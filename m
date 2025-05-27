Return-Path: <linux-arm-msm+bounces-59618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F21FFAC5B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94D581BA73BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D49A20C038;
	Tue, 27 May 2025 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsuwHtTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA53202C30
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378987; cv=none; b=mpYrjdnUg6eZ+jvU2uMMpwaYo3zdIA6OnB2AYgt6vspOsBZ9F5cFRf5yRSGIz021SuahJsebMu/+FHRGLmw1CC78OTTHU/spGPdY7aQ4JGvBJG09y6dQlRmJMP6ery43KtmptXR1C7sRB1M2SYk8L7uumirRqhbgp/UaWb6MZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378987; c=relaxed/simple;
	bh=r3whjUIUpRdHK1V4b5tOyVHJGvxYVniojff5RrS+ur4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hD4cOCoDamkPP+xYX8rrAt6nZkqhUda3ivnfezIwShvYOr7YrO16ZqFJyCIo9sBaljBj2CGLXepX1rgpCizoamBbjZN5RqtyT/SQ3EKIt1Di4kRf8ZD2CrQHG/1njPZGRKXaAtdPtFcNygrIWr19RxZBPa3X4xXfloMI9hvOtmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsuwHtTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RG1YNr029195
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/O2p+x2xSIF9G83bk2qKzG3F5MRhPuwnk3uawbQiMA=; b=UsuwHtTT+19r7X8+
	9xmaaZgI+E0BIU70xalEcDbNCLUWA3zODGfnv3/ro6F7QXVxsRWDTWwby1mIIJfB
	W8z2bntkGEeR9PFuJqqDMH8dlrAKdVUw3qxjFFb7O3+F98T+bWjAh4Lo/WqA8gj5
	Ymffg0F32lHihXoT7GeEg3BRyPZu3RX70+mdjrzLjgji3SKwywfI7V6RDMuUWHpP
	mWhc8g6vUvxkgPjIMvMfEXVvLpnVcuQI2qNMFUHlKJAEHQgo+yn6w/111Xgrpv8S
	ARkHdfBTbl8Y2ByIpLAcep8iN4/qLAK91a8pqvU4NgKeovig8qb5MvcwvKY7fvSV
	N//IMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992j7h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:49:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so111488585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378983; x=1748983783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/O2p+x2xSIF9G83bk2qKzG3F5MRhPuwnk3uawbQiMA=;
        b=exXSJ2bdKKb6wMH1kj5HOjUB9V2R5cFsW5HmTZw7t9lJjIHhbOavOYc57NXe54D/6Z
         bpHdhmelN+fusxmZyAwuyuIIvUTzeS3NpndBLHl8KTabRHfCKtNS7gd/cPPDX0BZ0NUj
         QrqFFp+sh1fUv0rf1DZ0YU6besmvtC6TCEgnM6EBEPXo06Rsl1ue3Uw75czccJEfhsg9
         2XhggZHnqTRo3tdEkQg0A+x0r+529HgmutMlHS6Q8JWLhwy3Fu51lSpf66GpziEhecmt
         m84Ym/FTg6jvTebfHyjZh0yFMzIgRvSIcO5/MTpGNhgKOx+XQ2Iy+ULZVX/41v+wnu6q
         obJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgXnTs1Qpi2WZMTl9eDayvkD6qcr4Up6ZHmwM2BQLDqZou5SdboswNXq9wxfvUKU8AFWeGwxmY+TDpAocM@vger.kernel.org
X-Gm-Message-State: AOJu0YxDpeH5zQYzMn61zJExHFIQ2vQ02ujyyb7oU0f4ARXCTbtEAzsz
	K4MRnpEXsxkCFQY9FaUV6JU505cQf9pVkE2TvVQz5R21pNV/lwWJamAWuBy5p0cHnvnTfOeYh8V
	KjDzcgQKtigqIN1Mm+G8F6j2Rct08lBBSqgk/cB2IQKWP5Ld1rctErnanm4z1d0e1WHac
X-Gm-Gg: ASbGnctBUfSEVk0o3SGpBmpPKjVFZwJg+w+z9CASMrPZ0n8JkeBCVNYGmOTvNCv3HAt
	09HnfYk7pMMCotfXo6SZhvoXnE8NzER3pc7czpYO0+baILvfYci12wKmz7iqzSAZqCVGr+0be6U
	YJjTmEEeEQCLUKrIEXd3Cl36K7/8fKpExvbd/ZzrqZcGjWt+U6SHD4QkjpljM3D1K/gOWsXJevk
	CWZvrlKtsut5wl/dq+bNumqMH6hyoUrvRMLGAll81+g1zgZppYn97J24N/aB3/mGMCiaMNuRCu5
	FztA0U+AcYs/TbOlgaHU4Et5AuowWwEWxjDDsnIIqkqp1pTX3HaD85bZiO9QC86RSg==
X-Received: by 2002:a05:620a:28c9:b0:7c5:ba85:357e with SMTP id af79cd13be357-7ceecb95729mr796619185a.3.1748378982923;
        Tue, 27 May 2025 13:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Ja5XuujBwuUP9ccKnyssxrFJe/lbLz9Lqf/caKcpdJ8XAsoYbJmo6SDfbvW/t6c1zMYunQ==
X-Received: by 2002:a05:620a:28c9:b0:7c5:ba85:357e with SMTP id af79cd13be357-7ceecb95729mr796615885a.3.1748378982465;
        Tue, 27 May 2025 13:49:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad89f2508b7sm8518366b.132.2025.05.27.13.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:49:41 -0700 (PDT)
Message-ID: <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
Date: Tue, 27 May 2025 22:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
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
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
        quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NiBTYWx0ZWRfX5+iAbaPTkdjF
 ejYbIOXTlr2ZD3OVRzSbwTHzCcb4wO1maPzTMd8hAGfcKum2ogaBAjDEspMlW0dUQIB9/rk0OVw
 VjyUOtk4czYlIrhn7+OWwiI1wQ3nlPUW4LhX3PxBQ6R9N/NSAsFYUXi5/z/2s2fm/+ZaewN5ud/
 FJ9MRst9iMkK71hvisIJA6WCle5u22aSOnDJBnCxzMF13US1Qv9MUSGEZV0qz8Mn07JXjFqt1fV
 G+Gb36saTVlR/3qNCSNLr1EYFmXUDfzz73QPouHmiVATmNkq6E//0T0FLZqurjkLA4r6hiLR9Fv
 d4XZElQt6BlShnTXXpqvC5aV3U+cKJKeCgfxvc5o51Jz7R0ufg5elLkrblbj3Mz6cGPCzaa6jsr
 IQ7umm23T6a5Ks/IXCeWnGxC5nN6EBPRANCgAsnwsZrCW5BmMsuYZStfttg3lwwu97xBy2S3
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68362568 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=OAqA0DyV7igbTOjjZJsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: R5-eUoPd61zwnHqcRrnLszjFO3KI_-HT
X-Proofpoint-ORIG-GUID: R5-eUoPd61zwnHqcRrnLszjFO3KI_-HT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270176

On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
>>
>>
>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>
>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>>>> when the link training #2 first attempt fails. This approach enhances
>>>> compatibility, particularly addressing issues caused by certain hub
>>>> configurations.
>>>
>>> Please reference corresponding part of the standard, describing this lowering.
>>>
>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
> 
> Anything in DP 2.1?
> 
>> - All devices shall support TPS1 and TPS2
>> - HDR2-capable devices shall support TPS3
>> - HDR3-capable devices shall support TPS4
>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
> 
> Any other driver doing such TPS lowering? Or maybe we should be
> selecting TPS3 for HBR2-only devices?

Bump, this patch looks interesting and I'd like to see it revisited if
it's correct

Konrad

