Return-Path: <linux-arm-msm+bounces-59823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9BAC80F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 18:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BCB31C029C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 16:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FA322D4C4;
	Thu, 29 May 2025 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K66QYJmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2292DCC0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536502; cv=none; b=XI+vN/u1yoqQ/+W8i2FZ/vJ5crC3uTqe1h/EeiAQv5ODyHaPabndoVp1oXCjp5jwwAuZB5xNMCZJlVzlWKQbdCOxsyhdIXgTDqTFRsKyL+2WZ6Rn4hf6z4n4iILLOGhULbyEXsU4TelEMhWNl+nUNzo7JqwzOkKnLLBdIwjuOmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536502; c=relaxed/simple;
	bh=ejWgNmNYardDVPgxRviRlja6u2fQbh1NpGtXEbvlda0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8gDBOXZSISVJ0al3XmXsUB4u5xNs2E8TmB/HED3MbVFEhSPLsw6SOteK/V+HYwXMQ/gYgvgSKTfowhWIVWkZyTQprEGc/euqYRibT1ZtRWv1PnnrOwRj/kaOHj0zuSv5PSoY+kwZqsVPkXXBjFV5TL09J7L92qPkBzCJH9KvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K66QYJmM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1IAJ024414
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rIQYsd49PJi3Pc8vfrZCnRgJdFHlsZ5iOjOney/LHNo=; b=K66QYJmMnaBFGQuK
	Ssr88wVX3OYOKVlI75o2YuvM8FxuK5VsTt+tldIiuJgEQMO5ZE8rjqmJpS9HFG5c
	uOlkbi81MFRXqa+5Oo071J5OJiJTPaAMgovWhWdW4SZA/hJukBorrXTpzHft+vIW
	97rR0xhamVUzyeJ47ZmcJZ0XlnvbONFZPlXnV8nol9oeHPjlgyOYrXE9czhGlR8j
	z2o0DwVo6ya3VxkwlEIiTQT9YD9aIQfhgLW/tuB741RDDTx5/RGr8NHgJ8iGUf8U
	xvpPZMftdlgChFXmHF1XSn5+UoI5uUnQ/6FGJLNJF7DSzq/8Yj2K5AhXY9OyoUNx
	iypY3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mvm5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:34:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a3c8011f16so2830161cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748536498; x=1749141298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIQYsd49PJi3Pc8vfrZCnRgJdFHlsZ5iOjOney/LHNo=;
        b=YC63q2r1fJ23kRohE8pMrcNB/b5g1yPwJhq3b37+dJ2fp1wV4q5pa8b8UZxoGKpPY7
         CIehMh7dNJwXE0MLn0lGgTaEvAFeFTv2uf4KwgRU3AMRtUGr2E9pZ5N3YMn8dc6F4Dpd
         n6sDpRYGJ/rfvDotRSC8G9yIK2wIZZymm6FQavAD50ZiYZ4/I2gSUzJaQh5HsH8+MjOe
         cA5vVB2tPESrzYKHsnG9RELTuYlBI2k1zKrq530LHY3y0la1uq88vE45NNJDH1TMkfp+
         wHGJuaS1COAz+64EsLYCfqlLCX0mBWcNeGh1wYiGDfsCHEb0Y1WYY23T7CkhCZEgaCwD
         qI/w==
X-Forwarded-Encrypted: i=1; AJvYcCX4A2giltSAHsGLe8J3F/OiezUVM9a5/uCfxHScY7Vk17b3HXyc0KuZjj4bQVJM9wkW0VSt5F0ItHmZnR+t@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5e3HU1RpP4+Qac3s8wsTkveklumGImdHN0e/vLcv8gRl4RRJx
	O7Y677SvopTli9SN+TlfKpHBm3kTprhL4N2o7MfCm30KKUc/jRxWUwwCfK4GW2L8eSlCU1n9esc
	jfsdXnHCMKO77y1A7FZo+nVIbB7msDZkrIDkdn4EUCFXjJGBQ+lNR+yNGDMnzU6uTLeVz
X-Gm-Gg: ASbGnctamBbq91cZKU2Wn+0ofYpR/qnPgMwaULsTiXY+FydbYnRnhkGWwQQUKez8R0l
	RWvyVExEFLAWNDH6pv9ur8X2UBI/HFvS8dX5V6zIh5CtcXver4oiz/BQnudYtbu+6cs5nKfFs8k
	eoKIZq21KnW5Tc11nr4tzHzDGLDpawWDJU+HfA9gYbcUe7Ixvb4gqQRIJb1bPx1vedvTO6gMoUB
	JYezAUdnjvoShWH3tkdlEEvaMIUWrkveECr5f7YbdpAk8S7ahaOb4or4nrVyCcw9znC+7X8qDWY
	fesQfSxqKM2Yz+XeP1WMYakRZZFm2f56IdyVsN8tA49UQkDRAhIvj3baQa0Y7TfAPQ==
X-Received: by 2002:ac8:5982:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-4a4400c62a3mr1397091cf.12.1748536498224;
        Thu, 29 May 2025 09:34:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/9fsTD2pnZau6Ubyd/7evR4/8s33kyWi2oDxzEfxdv+Ya4C4RYdlxwwfrfdKsXHXkWhuWqQ==
X-Received: by 2002:ac8:5982:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-4a4400c62a3mr1396721cf.12.1748536497701;
        Thu, 29 May 2025 09:34:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fed0dsm170873466b.9.2025.05.29.09.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 09:34:56 -0700 (PDT)
Message-ID: <b4235317-97c0-4225-b6af-f79358cbf508@oss.qualcomm.com>
Date: Thu, 29 May 2025 18:34:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
 <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>
 <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
 <7938374e-85fb-42b9-893c-ec3f7274f9c0@oss.qualcomm.com>
 <9c8fe115-97e8-4966-b332-6de94015f832@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9c8fe115-97e8-4966-b332-6de94015f832@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5SO1MdZoh1WAZNTOv1PnvQ44teeiKy1Y
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=68388cb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=wjVnlRVulhwI95BqwIwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5SO1MdZoh1WAZNTOv1PnvQ44teeiKy1Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDE2MSBTYWx0ZWRfX0dmADYw6kCWQ
 LPcoKiCi4VSEBrnSnWZxzEl4t0TZyX2KTXwcnUopH5Cj3eCaMeSY2hfXkHjnZwWvDtLGSKlFOw6
 4gnZrW3AjoDG2kmX9iNn7wBS30yt+tsE1kMWUAZVOBPhm2JjeWLXoTX30K56dXJ1TlaEx4oNalX
 e8yaYw0382vPIs9WGfA9WYZq+pkNTgJrrSj8UOuTw72Sh7y8IM4QnApEnYYHWCqIe5C5pWUvlEd
 m0h9MS/f2agSpSD758CpSOoqf7QarcA6TDvG7GnYyU0bWMhd96/DykhL4t2h7Ko/JL8EB1E5rg7
 iiYPUqC4YcVyXr81qz30HgKIJiWdGkKp3fwpjQeA0ipgQ5UqzFS5HX2kaB2Lu6mpHHhkTVlIPkH
 o5vcoXpqzeafELzBpTmdynC4f8Uk+gG14hosc6jpIwbolKfwOcFcDitsi00ozKfZHabS3jh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_08,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290161

On 5/29/25 8:58 AM, Krzysztof Kozlowski wrote:
> On 28/05/2025 18:58, Konrad Dybcio wrote:
>> On 5/28/25 4:37 PM, Alexey Klimov wrote:
>>> On Fri May 23, 2025 at 9:12 AM BST, Krzysztof Kozlowski wrote:
>>>> On Thu, May 22, 2025 at 06:40:52PM GMT, Alexey Klimov wrote:
>>>>> The pattern matching incorrectly selects "wsa" because of "sa" substring
>>>>> and evaluates it as a SoC component or block.
>>>>>
>>>>> Wsa88xx are family of amplifiers and should not be evaluated here.
>>>>>
>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>> index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>> @@ -23,7 +23,7 @@ description: |
>>>>>  select:
>>>>>    properties:
>>>>>      compatible:
>>>>> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>>>>> +      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
>>>>
>>>> Why dropping front .*? Are you sure this matches what we want - so
>>>> incorrect compatibles? To me it breaks the entire point of this select,
>>>> so I am sure you did not test whether it still works. To remind: this is
>>>> to select incorrect compatibles.
>>>
>>> Thanks, great point. I tested it with regular dtbs checks with different
>>> dtb files but I didn't check if it selects incorrect compatibles.
>>
>> Maybe we can introduce a '-' before or after the socname, to also officially
>> disallow using other connecting characters
> 
> It is already there.

Pardon, but I don't see it, only in the 0-9 group

Konrad

