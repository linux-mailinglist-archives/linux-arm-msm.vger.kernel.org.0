Return-Path: <linux-arm-msm+bounces-59488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C18AC49B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 09:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D703D17426A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 07:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7755C248891;
	Tue, 27 May 2025 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmfN5Zls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC822578C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332548; cv=none; b=dR9DyE8l8ESuFEFSyoZAYbc73FNm5tY+JVtZlYE3ZGvms4jcFVd1R1o/AblQOZMVP44+v+8VflJIu/s1mOk6qd+eZjDpXj69fAUcljejqPvzbX/Mgavx5NxEaXxDrEJnho7taeuTWo45sYUWwpZt+T+zk9HzZ4979vsF5TpQkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332548; c=relaxed/simple;
	bh=YkQQddHb8jlPo3SKLo59UpwD65Y7ZPEUTHo35ozEy+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBmHh8e5c+S8XXY8x1HqjjE7tOhOblrrpzlG3YkapmWVC8Y1E/TOkWIEQKAY58BgoQpxbJazX4GFzwi8CayjesXTwohmA3szxhTb8sB9ruos9oxvR/hzbytxGBG0SvTXf+sgg7AqxSQn4o6Hin+Zc9mVSRiapOxNJ0iy/pL4cH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmfN5Zls; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QLjPeW005773
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 07:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSQWEBsBEF9PnfN+71Hx0sgWBcdAij9SMJAFGtN0t2E=; b=nmfN5ZlsYQ54EIHM
	Oj8+vRsULwUXZ8hmAVEjFTWJqg3oaemHWt+g/JKEP88oDLn6hVrdVcf6fqGo46JQ
	3QbDR/IWqQa2SJS/FfK6iS+MzHGz5fuOpAPqdtkcMnm9lYrkF9jEJvsnrPeQqNef
	HzohpjcG4t6S7O7rVKfK77q7IxxOX7ZexW++VoeFDF5w6LCeY+2ED/uUVZFTXTDW
	c7gQwEuti+Gguwl8ohhA7dB6uAwdF02GH6F27JDpfbK1+PLs57W67i75yL1+rDaQ
	C/tBPuOmlia4h+Tn+9jWwBQk6/VuQ5L6naJys9FwLGtAxgQ5t4kr1/91C7Y0d7kP
	4lWIGA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p62tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 07:55:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e3b03cd64so23783375ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 00:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332545; x=1748937345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSQWEBsBEF9PnfN+71Hx0sgWBcdAij9SMJAFGtN0t2E=;
        b=I82O0VBHhs7TP2u9F1GztoIXr82rR1XtpGwyj1b5gsllhUbD9Jt6NCtVEwpiQcjyk7
         0wA48WHY15kqadClVAeCd28t60eUnXpZKadcgNtjQQQFf44XnwhICybI94AfqkBMswDs
         rWUGMSZDz52A10qnjHKLm1AAX4WwmEuaXPXzl2mHiTj5LSxp1buIqrz7FJ2ruAljb96H
         n1lKQydl4JoGtq4APe/s4rcYitM3sBGRyPfiXS9Qxtu0VOjloFroXGm4CHcp7rg6AB07
         5hSNM0mNxj2osE+esDNlM2xYFXPVL5zAJf4hCfAuDstlxOBK6COM8X4+0iqRE1xHiYP2
         EyIQ==
X-Gm-Message-State: AOJu0YwhVKFkGlgHyUhHRKjP7lawGcB1is1hKpDy2a+6s/4HcPZ1hb1d
	4hFiqKXZXY59p0Q/I3eB72AQDhig4yKeLJiiijgpMUez7EQHeJitWfmDYBdp0pibFpLXRyZbAXO
	V3XsYtptph2yR8Ei7KaNsUmAVaiQsSS8dvLERv2a7VgUpI8Nkkwik+WBJRx2GTDwhOLBi
X-Gm-Gg: ASbGnctXRRaQ1xrwve1olc4hUllEpQ1qyNd7R3sRoqyeidgqFywERnUI4IQVYScBfY/
	LbJqU+Js6fmNiudJRvValQDHxoVMJUk+dpt3TrqYuoFIdh6bhCzLK4/77Q5V1GMSI1ZQAHPGREJ
	TgtWtGJ+YSxbwDEav+hpfWSfzjZyB2d7CnX4RtgISYRdFietqrZne+JmE6bPY9mTHkNFXZN2BTG
	StyQ5BNz5YBdOrxPWPOk/69hqH61uOeEF4rvEZmrMGIzrHp1FjST0qor7ri2uuZFtl60qkOLT+g
	rEvOFwn9LxALcbaPDZ4elC7GrMxEfVb4d601jr+LcYclRNGDRw==
X-Received: by 2002:a17:902:fc84:b0:22e:566f:bca7 with SMTP id d9443c01a7336-23414f6e2a2mr178065395ad.17.1748332544962;
        Tue, 27 May 2025 00:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqcJUwDQW18Rp+AmlPMd2GnC8aI6d9TNf36XirBj5sKw3tRyXu3GPUgfP+hb+ogtTPpdBA1A==
X-Received: by 2002:a17:902:fc84:b0:22e:566f:bca7 with SMTP id d9443c01a7336-23414f6e2a2mr178065165ad.17.1748332544573;
        Tue, 27 May 2025 00:55:44 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23452e810basm33558115ad.40.2025.05.27.00.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 00:55:44 -0700 (PDT)
Message-ID: <04a93057-c67b-4042-9ff9-fec4183a85ab@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:25:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <cfd4f557-7f97-4da9-8eff-fe3749e336db@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <cfd4f557-7f97-4da9-8eff-fe3749e336db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pnSkNT4qVBrlmdnP8ob-pgTkJ6wJeQdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA2MyBTYWx0ZWRfX7jAMzM4+a410
 vitq7lyPsVB+X6dWbpl4XBxQiNzqTmwSPu2dvE8lzxG8O23/5zFntWfhTpMyMRVfgw4DTlOhCtj
 1dbzGZG0TTm3J+AYObk+JH32aK1YZb4H6+g8ZRI3zZfv7eVtXvTpWNrNCVhtUJjiGgOTDs7YuIs
 kC0CWJAQ4aa9sz+8VXbtuaWeyl0boSmuqKXQ9tblcuqo1yptmMpsc5bXQwOOcwkS/j9vooQP1ed
 CmrrXAzhekuQIaR5gj/zcL6FBX+mrzAsgu3keGwxsZUmuWc/bCfDduWFCdPUUXnpbR8YnZwPvNp
 cF/+eyz5p0qrYBUB5MzTXhAJuea+xjb4Dmpely2jhc72rTQ2EYNvVhgCoidQBPDZwJInAky7y3B
 BQPJMdahX3Ks4xLl+PWieOjL9JuKslX+Ixbrdfbjg/5B5k8m4pBcTPKxsanT5OJBg8g1qg9G
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68357001 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YJSMDzQey5MvNt0fXBwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: pnSkNT4qVBrlmdnP8ob-pgTkJ6wJeQdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_04,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270063



On 5/25/2025 10:43 PM, Dmitry Baryshkov wrote:
> On 25/05/2025 18:53, Mohammad Rafi Shaik wrote:
>> Add the sound card node with tested playback over max98357a
>> i2s speakers and i2s mic.
> 
> I2S
> 
> speaker amplifier

Ack, will update in next patch version
> 
>>
>> Introduce HS (High-Speed) MI2S pin control support.
>> The I2S max98357a speaker is connected via HS0 and I2S
> 
> speaker amplifier

Ack

> 
>> microphones utilize the HS2 interface.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/ 
>> arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> index 0e44e0e6dbd4..1ebf42b0b10e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> @@ -6,6 +6,7 @@
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>   #include "qcs9075-som.dtsi"
>> @@ -20,6 +21,57 @@ aliases {
>>       chosen {
>>           stdout-path = "serial0:115200n8";
>>       };
>> +
>> +    max98357a: audio-codec-0 {
>> +        compatible = "maxim,max98357a";
>> +        #sound-dai-cells = <0>;
>> +    };
>> +
>> +    dmic_codec: dmic-codec {
> 
> Just dmic or audio-codec-1

Ack,

Yes right, should be audio-codec-1

will update in next version.
> 
>> +        compatible = "dmic-codec";
>> +        #sound-dai-cells = <0>;
>> +        num-channels = <1>;
>> +    };
>> +
>> +    sound {
>> +        compatible = "qcom,qcs9075-sndcard";
>> +        model = "qcs9075-rb8-snd-card";
> 
> Were the bindings and the driver sent? Cover letter doesn't mention 
> them. It is better to send them as a single patch series (this is the 
> case for all subsys except net-next and trees maintained by Greg, e.g. 
> USB).
>

https://lore.kernel.org/linux-sound/174773911882.44858.10139663344496764867.b4-ty@kernel.org/

The Bindings and driver compatible change is already merged, Will add 
patch link in next version cover-letter.

Thanks & Regards,
Mohammad Rafi Shaik

> +
>> +        pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
>> +        pinctrl-names = "default";
>> +
>> +        hs0-mi2s-playback-dai-link {
>> +            link-name = "HS0 mi2s playback";
>> +
>> +            codec {
>> +                sound-dai = <&max98357a>;
>> +            };
>> +
>> +            cpu {
>> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6apm>;
>> +            };
>> +        };
>> +
>> +        hs2-mi2s-capture-dai-link {
>> +            link-name = "HS2 mi2s capture";
>> +
>> +            codec {
>> +                sound-dai = <&dmic_codec>;
>> +            };
>> +
>> +            cpu {
>> +                sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6apm>;
>> +            };
>> +        };
>> +    };
>>   };
> 


