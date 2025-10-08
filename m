Return-Path: <linux-arm-msm+bounces-76359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4686BC4370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 11:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EC9A402EAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 09:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A462F39B5;
	Wed,  8 Oct 2025 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QU7X0GnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3052F260B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917199; cv=none; b=cmpTyJDKjJYAO8ukq+JXay0Ej930eiXuL3ws5bh4cWk//V+GwNguNLgFsSXNc+cNl5pifMSifFKI8i0WmB8i/4CxxKm0IRoK+2HokR/JNvCg1C0DD5Mu06DNGXp1B1CelxjMNdB9wdzLDXKfJqQB4RkvHu5MYX9WI1LH5fgz6jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917199; c=relaxed/simple;
	bh=A/ljxTaixvVaouEEi360sIvfJdNqBvUqEUW4PZCQ9Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpqAlOohW+7/sky/otiLDd99trsyK1gxUqJ6xKPRGmfH2EYTWGuM8WQcNt40PJPbM7SxPAnkfj61bFUSiSZDvquG+2YNGt0gAAaKt1mW6Gh5+b0rKu72y4RS/4GIRwQxy2NtDM7HvXK9M/zTo2mcML4GbMUqekRlos3q9SGwCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QU7X0GnK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890OXf001387
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 09:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3d0Ehe0bvI1yeWqOhiX38fptBoU2YBdrvlRe0FAgx8=; b=QU7X0GnKHHJbtGN+
	pYdCK/pZRowE3bxySmMkpsX3IpW2oHHmL+x9dlo9dFmIBAFU2JxkxKaS1rznpnFc
	gL/8A6S/qOdG0GzenBkRrgvW0xbYosXTsHP7gbIfhf82Im4C5aEySxPQFO/84yp2
	IJlQ2eigXKV/06dHKH6078KU5UftydZp7Btuk0AZqxiLeeSsiiSHZzncZWUe5EGP
	y4fqhoSgunk+fR1jhkOoK+tWZm73keBh1VF910bqlsNvFuMLcK/wUBvv6qtmjuOJ
	E9GmlkzNFM9GAJc0eC5RDPcq2bvdq7M4V6ULD+/UBafzumy+AjEcO+oG7dfI76cm
	K/bb8g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy720r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 09:53:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-850553dfef2so19949666d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 02:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917195; x=1760521995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3d0Ehe0bvI1yeWqOhiX38fptBoU2YBdrvlRe0FAgx8=;
        b=Tha3HBBYA3mqsnuQl+eDrgIvFcln3M/AkqcgPHQ53HaRzNW6nY+r+0VVN82VUsHoSQ
         4Nw2WAga2SBjVddgJlqKMveoAuuSSyMBWJWlr3tdWP6dNJOfRJ9tXYjqPRi44BcXQtQW
         f2TK8D9YFQYO54Topxo8Ca7eLWtl2tFHdxXGPsnz71lEpSBncHozS4YdIy/ODeqx9wWS
         fs2dUxA66epHefnlx7UzfdVPtF7kNfH3VqiS80y9UKyDw+AfFM27u9fCbKKRHTadlo0C
         CbVGK+63C5IE2wWSvPO08anjKNtCXH1BNGx6/giq29sQiRhtMw6Cl4aMxqjUWWGmQz3U
         jD9g==
X-Gm-Message-State: AOJu0Yw6wpwiaSIIsV30Vug3JPFXxjRSILCB6Cuc+KHyX4Tb4daM6Ntm
	ZmnLzOMcxmdCgkEYGSD3kqwn8NKE2oF+jMYGVuZpU6Di5zngJBq1Cfxd9+3tLz6jUI4oE8XbgfU
	o11dqYDytTwNaFI/5Q7R//cWFHVZEXe37vZOi9WNJwieG4ORxHsw3ivyc2kjxSf8GyrIc
X-Gm-Gg: ASbGncsZUUPrtY1PjRPPpabb8yyFkoGCQjK8OIF5BzihU2Iz+4weB1xWTTdZvFTYszU
	4kv8cQPN1SGg3fHqZeJ6NC46uvVrGDfMVZo2Sg9LIZ4u7pWtKLYyp1+Ojie41luOCp8MJco7okn
	EDjIZRKYiCQ7e503oR29G7ib1S2OQ3vdo/qKye11E66FxUG/z8ctLw1zI2dMJYH6p4S1ILMgWq6
	NTBGWgFwcfTdY7qtNx9msrQe43aBbtgJjjxeJGTEeCgM1SvyyiqMFc9uyzgE4YsL9/laY0cjV74
	T4KwdQs36IPCKKGGKPdak0OVYhB0k5MuZbykL8ROeQSUL0mHyis3iEnKkLdSPuuS6V+ZRMr4bo9
	E1/QyvvJNABwpTtm1ytDAA9NiZG4=
X-Received: by 2002:ac8:594b:0:b0:4e4:a58e:9505 with SMTP id d75a77b69052e-4e6ead440cdmr24627261cf.12.1759917194914;
        Wed, 08 Oct 2025 02:53:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC6bA5v1u+idL4ua2HM8tJ6bVay9UPd/1uXn1QC9RWuiyig/PmN4kVrGIBptf+wzMdeKoHhg==
X-Received: by 2002:ac8:594b:0:b0:4e4:a58e:9505 with SMTP id d75a77b69052e-4e6ead440cdmr24626981cf.12.1759917194391;
        Wed, 08 Oct 2025 02:53:14 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b8df3sm14313824a12.13.2025.10.08.02.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:53:13 -0700 (PDT)
Message-ID: <25a53665-d400-4bd3-a1ad-5ba8d3a0d9a6@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 11:53:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 4/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable UFS controller
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-4-045f7e92b3bb@radxa.com>
 <9a18cfae-4fcd-490e-b44d-6f9345cc7c3b@oss.qualcomm.com>
 <4AD4461A95C1A8F2+bc2124f8-d1ae-4fe4-8d0e-55872609d3f3@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4AD4461A95C1A8F2+bc2124f8-d1ae-4fe4-8d0e-55872609d3f3@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e6348d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=ksxQWNrZAAAA:8 a=u3vnbMqxRyurYkqyvPYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: DArV7Pk3I9pJe9QyhQ6GezFGTagHjnDj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX0RIa3xZXC9eS
 xa6KEOsBitqjSnAXZqHIVHbam9oSZqzZ8xWfPJLIXueTXCRiEyo9oij9GHWBCkQ9KAjRiFOTm2k
 0shbUimuygFlXsJ6ngypIeYdQ6qTGNml9kIj4UEkb7XXi0TOJ4S+8ciM9iurBKKKWfMbmX/+Jl5
 ZdUqaU2f2kG+PxZ1a/FifheXTDRQrphRDjNmrUuepGC+Yk9l8RIuAtUfMrU/oMR87REK1QYObrU
 Nuq8GNWvEsDHYN9B9SMldITYuf5qk7nfI2rBV+yxQnDJGsQOLdvImylaeo6GutbqiQRDGue4ClZ
 J8hGUpWBM37f99M3Dz3cN9vlW5Ufa+nyqm295fXQMLmA0oC+A9YxmRjojAM9LyoishNsajTe77i
 u7KJGifaK854ogr1+5KxVD+yrjgKHQ==
X-Proofpoint-ORIG-GUID: DArV7Pk3I9pJe9QyhQ6GezFGTagHjnDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 9/15/25 9:34 AM, Xilin Wu wrote:
> On 9/15/2025 3:24 PM, Konrad Dybcio wrote:
>> On 9/14/25 5:57 PM, Xilin Wu wrote:
>>> Add and enable UFS related nodes for this board.
>>>
>>> Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
>>> limitations. UFS on this board is stable when working at Gear-4 Rate-A.
>>>
>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>>
>>> ---
>>>
>>> This change depends on the following patch series:
>>> https://lore.kernel.org/all/20250902164900.21685-1-quic_rdwivedi@quicinc.com/
>>> ---
>>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 29 ++++++++++++++++++++++
>>>   1 file changed, 29 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>>> index d30cddfc3eff07237c7e3480a5d42b29091d87d6..3bf85d68c97891db1f1f0b84fb5649803948e06f 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>>> @@ -482,6 +482,11 @@ &i2c13 {
>>>       status = "okay";
>>>   };
>>>   +/* It takes a long time in ufshcd_init_crypto when enabled */
>>
>> Huh? It only turns on some clocks, writes a couple of mmio registers
>> and turns the clocks back off, could you investigate a little more?
> 
> More specifically, it takes a long time in `qcom_scm_ice_invalidate_key`. Considering this platform boots from SPI NOR, while TrustZone doesn't really support SPI NOR storage on this platform, there could be something broken in TZ.

Hm.. if you change the boot order (if you can on your board..) to start
with UFS (which would require reflashing of all boot sw onto there), does
this still manifest?

Konrad

