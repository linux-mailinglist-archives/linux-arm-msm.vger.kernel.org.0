Return-Path: <linux-arm-msm+bounces-74996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AEFB9DEA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 312CA1BC2626
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A0A1A4F12;
	Thu, 25 Sep 2025 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDgznheI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A2A1FF7C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786552; cv=none; b=mt1C39nPMejF8sU1zWeq4oRTeESs88TfWCRX4x1VBMMpth7HTTe2FDuH7sXUoyIZ3rqEql2XaZAxDiJDCzRS9IeKJQNCRWjgZCJiVaq5HVGiHastwzJNdQSrYy8iaPRSv/5DRJ3bQL4nNXKnFF/aj9XRkDhLRh/SDtCie8/ouYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786552; c=relaxed/simple;
	bh=S00mqYY/e7ImpwmZxWfTuBNJWY+6+8Vd5lL3Pi5EfIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGpp0RnKNmk0wu9QGNhH3ERiI7b6ZpAdxHghrGAjPD4mPhqWfDwIAexQnt++zWKZtGKyI3XpeBTWFzNNGNmF52b+zCf2iWWK0s00eo2wWaJc5oAnP6H8L2HJz2fkDHGYUK+1aw2ulzA8DqZpRQfZFBSMFVslt/cwTNmpd7ETXTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDgznheI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4a8pf026651
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PjqNeaqGN7TnTDgbbflYxfGvF5+GfS4dDejEVyN9QkY=; b=LDgznheIk71ptJCk
	Gw2gKofkGAK4nFXHiyuc5AdMW6fpT+yk1UFiCpE/jH89DaUocnl6ISaPeqAe8rDK
	9a6M16urFZO7O6kAJL7LQHfne4DECRLIafPUBjl+s/XdGK4Vj4g/Ru8G/n8TRKme
	AjPeuZnJB91NMQaUgOQj6CUQKs984TwiPs2psGlixgcrw9CHDP1UwcCRayLMLJ9F
	lImRX9oReOCj43jtZK8kSCq7A8DpdcSBRlGObWqeibMKel30uhCqC+dS0RFCTCm6
	rSj+jy5nZSTU9ILztgtbRlUNPfdae6+BXpBlZeeefcfpcOO8o0qMtaurGooBF5EE
	WO9D7g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0fmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:49:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54aa407bc7so179807a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786549; x=1759391349;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PjqNeaqGN7TnTDgbbflYxfGvF5+GfS4dDejEVyN9QkY=;
        b=YXMiuh5fKLyPIgHKlgTxCIMnEVoBtgZ4tgDYiH7Sz4x6mart6fwd9ZHrR7nroypvE9
         ePQvDS4GskJbH6fPMod8+IOAwX2pEQfyEgZBW8xtKkCP83hELK/8oj+sqM48BFGa249b
         U1ljbjOYOFJrbl4WKHBASxZLRnYorFPACXidLL+3j6a0aEQNDjWwu5cBF+hSWdPB2ImC
         rXgCGDolwkjkkYi+lPGvAF/dUXmDkzmNuoRzNxmgPwVEuhEBp93eu/bvFd9o0F2vKR0P
         pZAImYolAL6jb3lXyiV3dXyhYshEzjORIN/686IQx3Jra3RTWEDc6WDItaPLPT4mD7Gi
         wcFA==
X-Forwarded-Encrypted: i=1; AJvYcCWzUNtj8ne7wW8rZ0zdz71TrneZ22QsWtKb/et1w04yxJke4KQ8yGaP+2wg/LHpJQPycr7yKNRpYaVJw6fK@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfDDF4okAPP4scRuuiBz3flHjZoSTaefOkdup/VvTKCNkZvo+
	cDr6gMQL8UOjsYjXJQ/UZXlErlyIdQFxT/gaZe9ycX06WYeSCsmHuo4i+rM/Dk1o8RANOxoCWaz
	cZqFSS5pmFhKkuHfTp2Q9l2u+PoKLJDw+pI5Gsj+9SGDbbmZJILHIdBeCuobL2sO8r4d8
X-Gm-Gg: ASbGnctS4Wts0SVaC4D2tkbpC09vdl6HEOe7RH/eSk079Z5cIovM3c2+waAOUu7IhLL
	NEkWQzG7xMenVX5VEMw7Vhskp5zp7pVcgz6NE7smKhi2KlmUaGjHEWCR1xU1amnglC/4eZExiI0
	TtYiwnmoisjo3qnrW/FxWdCjtZba/oIjJ5dxwhl33M3UNTqd+GL4EUTqV0Dy8tP31cFZZscx6Ly
	4gvLlzHS+N11vQodrl09TBie0fnP8N2tPvUhOQq5FmFalss5D5OLcpq37rJ9lVs07ArAmiUG9ur
	25BD63w+4vE+nyCTxI1wmR8qRxgTxPwRixWi/HiyHqgIhajFFHiLbA/9te+M6xJG5nXDAOMCTeW
	gnSqVBF/zY4sBQS8YGQkwAFkgvlNNIWM=
X-Received: by 2002:a05:6a00:114c:b0:742:94fe:c844 with SMTP id d2e1a72fcca58-780fceba388mr1520202b3a.4.1758786549283;
        Thu, 25 Sep 2025 00:49:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFinaZ90QR5M0XdFZvvOkdBI4OVrioOY3xXxXUY10q56iLTiuCLf12UuzRtTaZoEQdZW+XkkA==
X-Received: by 2002:a05:6a00:114c:b0:742:94fe:c844 with SMTP id d2e1a72fcca58-780fceba388mr1520186b3a.4.1758786548785;
        Thu, 25 Sep 2025 00:49:08 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06f2dsm1120456b3a.87.2025.09.25.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 00:49:08 -0700 (PDT)
Message-ID: <00594112-36ac-47f9-bf26-2270b7cc3266@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:49:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-6-3fdbc4b9e1b1@oss.qualcomm.com>
 <sn5a3dqnd4xz3tgtw4vbmjr4pdow4qlo3jjryp5c2sx3wzke4j@fnbexj3kch6d>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sn5a3dqnd4xz3tgtw4vbmjr4pdow4qlo3jjryp5c2sx3wzke4j@fnbexj3kch6d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4f3f6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AvVx_7eFeZfI2HUNGooA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX9KcQ0oAdW8aA
 2DPYIoMWTrS+1k5LEGelVBzEGRbGst+XCHKUuwrROuafXUPijyn/USSzeIe08jxEDeL6B+tU3OC
 rtXQqfo7CYqCBQxE1/egZqRgVWPMAIXJDNiTbPecxDrASq8xce7gnXDD6V6ziBYDmsOWq+D4yZu
 YIB7s6LfkI5xNg1zXO7T4NYsX0WYhOTiOa+C5Zmq6o5HRHu+iSmAFt2wPgZmc5OZIQUfs16Wunp
 AEyBoii5SHQcDrbfUvB024LjlCeFR4AdMuC6LerAB6D4kKLxFtc2w8duPgKX0QofuqC1qAlY7zz
 yCGwvReZBq0XryOMz2B59ha/cIDPlGImN+9qpr8t3t9d8e68kzbYUvo7c7U7IBq84lxu8NLOZ2/
 6RYMSlPY
X-Proofpoint-GUID: FL_BxJk3vfCsGam2ticEf8B6Fh845kDI
X-Proofpoint-ORIG-GUID: FL_BxJk3vfCsGam2ticEf8B6Fh845kDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

On 9/25/2025 11:20 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:17:23PM -0700, Jingyi Wang wrote:
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>> (rev. v8) and M31 eUSB2 PHY.
>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 155 ++++++++++++++++++++++++++++++++
>>  1 file changed, 155 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index ae1721cfbffc..08ab267bf9a7 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -12,6 +12,7 @@
>>  #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> @@ -958,6 +959,160 @@ opp-202000000 {
>>  			};
>>  		};
>>  
>> +		usb_1_hsphy: phy@88e3000 {
> 
> No update for GCC clocks?
> 

could you help to have more detailed comments here pls?
For this driver phy-qcom-m31-eusb2, only ref clk is needed per my
current information.

-- 
Thx and BRs,
Aiqun(Maria) Yu

