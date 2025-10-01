Return-Path: <linux-arm-msm+bounces-75649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 297FFBAFAA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A8219203F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF91284665;
	Wed,  1 Oct 2025 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVHewn4u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802E283FD7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307882; cv=none; b=grDE+GNTelBqUBCff1H0kAoea0OGER4nuIjcJUVzHmQAeScQ2LQwpdvji4da5wNqMAnbP/WOJOVV5qZgtp5rbp61cuxp8MUPwD+qhwNpI6oPnuNIcdKiN+7WDJud0E9U4RRmoTwnCvUO8HXAjvxbxYMP3xknQAzIeKgM2nMvbug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307882; c=relaxed/simple;
	bh=SOdkjX+XhcQsICcnoi6ql60tKZY6QeQ8R+2qWbiph7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcN/fsSD1yZ/l5/H2+UeK6T+d3fVt6hFMdkTFXTsGQusKirTCZE3seRHz8+8Pfajy5qgi9j76suzHtGWxBiIOPFRED6HqLjTE4yz+hzgekOH0rws2YgBUS4gV66DbmmoYUn2oE2kqnC/O4UlSsHhDh58p9un4E1cWtVnu4GWUJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVHewn4u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKRpUA020364
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUFK/Ss0L+GF41vSD/7pSbyI+R1mc9WDz2eWU41Xx5E=; b=kVHewn4uRHjzBxmN
	Flm/1Jx7dkSemhnTbNVmBuI46bOtjsQ7yoIlvUhPOXiRikvmJ48rI4kBzOsPPiY4
	9aIGbefxkauuk6XciVy0M+ujtPpGMXDVDbO6Rb7VBaTmYxG8xERMLr+rT2/ph2iV
	UhcAnu9UHM9BmpM4o+mTA5l6yAHTAG4fxMnJFwlSO9Wgn0MvF6/0QG0/u6oZbcye
	UnHqVx1aHACN5kUMvGHgTf8s0QJmWSr9H5m1NZYqpdh4ewANAegUIhHOIXKyaOuO
	M35Adk7y1VllkUbKkUumatcevZry4gGj4zqS3oWc/mH1G+/uxDdpD79tJt61/QLe
	iYssKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5v1m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:37:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85a8ff42553so189421285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307878; x=1759912678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUFK/Ss0L+GF41vSD/7pSbyI+R1mc9WDz2eWU41Xx5E=;
        b=DnIiror6YJhttnkTFeeWJJa9PGURDYPFraTTNqWXSE37K/78EZAMzvMOJvrh96EOZ5
         o8m46zSH32wvx0FLTARTiROeILvr5TBVKzOGeiOddaZmfUx2eXeUG2jkMhYD+PopisnX
         BhlhkGEKU62L97v9sumwOipwEvtICECDSzMyDAx2rv5VgzeuZexnESAQsKYNOyt/wOa9
         6YpjOi5psV4Q6olOM+s9lZCzSnTfXz7i+2o8I+4B2EWP8MecZayS9sM+y+RGwTsbqTK1
         gIt10zNKbqKkVq139iRYL1isGZdP8bpbw6A8mIu7hrm5+Qc9cVyFcxlGAQ7ALMQLUVIa
         KtcA==
X-Forwarded-Encrypted: i=1; AJvYcCUeldgsSd8bH29AE+VE0LpwsHsGluVu6PEE+n9b4mKrX7qaKJiVdl3u9mWx2UJbung42Nc0tioMjsFrXmkw@vger.kernel.org
X-Gm-Message-State: AOJu0YzljjPUWtB7SaYugzw+cooI2NcW73mfNNxsmXRB6lCLb0Vwx349
	MWZR3rJLcDEkTnQ8Th+Riw4l7erRMGDM2Hwl+/GQ5DAcIzmveyGG8ID0AvRlM0UCUlEDikARUAl
	XLak8crDezTv0IdKJEgYskSRgpAV3tYeohRU/OjWnMxd30NKhOBmzydHzEL2Aqmt+R34f
X-Gm-Gg: ASbGncvSwalmJmY6hBX/DNilVQZCyGVylTt0Bp9g8m50e5xx89PZwD/3frEcsp7bLE9
	rrkquGtf4RKUXEfdYqbWcYIbq2tP3lleYjEq17PnpOOyHFCt6lXwRlkwyB0T2kpAaphCmqjJjyE
	e43RP4nBeXOUWmECDk6jiwTA9YpGI9NVau4ax6mVD6nOCWJmS+UA4FKIbyB2UYCeYzaMAC36zfT
	Yw0Iaeleq5PFhNHsRwCI25n58hlNKHtnkveBZyOz9ewqe+6b0lHBWLfTh7wogKF2yELFFAwiADH
	kC+B1Q28APKAfRwGSRIxR5BPiE6t+EJDKce/IeI+d4i7e2jaq7qhfHK+xixw0PRy/yKGFBt5iO3
	E8vIZowJDuHccPB2cBIHI4ch6weY=
X-Received: by 2002:a05:620a:294a:b0:863:88f9:3edf with SMTP id af79cd13be357-873768a51dbmr256003085a.13.1759307878201;
        Wed, 01 Oct 2025 01:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdWKramJMBSaYig5g7VcPPZxYTiTru0aoo2NQ2bTcuSp9N2EDYIbAH6ZqLIO1HALQ6lWfzyA==
X-Received: by 2002:a05:620a:294a:b0:863:88f9:3edf with SMTP id af79cd13be357-873768a51dbmr256001385a.13.1759307877747;
        Wed, 01 Oct 2025 01:37:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3f57c9c2e2sm562881666b.68.2025.10.01.01.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:37:57 -0700 (PDT)
Message-ID: <d2b1aef1-b367-482e-87f3-eb08d0bee9cd@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:37:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
 <fc5d2d9c-7200-416f-ad89-4c1907e313c9@oss.qualcomm.com>
 <DD6UFOT1KRFG.3M6QJRGYRAJF9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DD6UFOT1KRFG.3M6QJRGYRAJF9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3H1ZB9NJo28UZCZ5L-SYaE3BEuAQ8eST
X-Proofpoint-ORIG-GUID: 3H1ZB9NJo28UZCZ5L-SYaE3BEuAQ8eST
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dce867 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8
 a=_VV5rCy9AiPTaJ_phtcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX+MBH3JD5zIJl
 FL85Regcnmtk9HwcAdcqtazJTOLV7RonKZjFUQV0xVNEphPDcox0XU2dqUOJRkda9DZcUdoqCfX
 WhamFDy7kjHiDhRf5tEK9CC/mUk3+JZI9r9ZyyE6Y2sG8lQkXFHrbth/XQDB2Wl2nv4CLJWc77i
 QGe0z2yt14lD4IrOMQb+UXHCmwtcwuEiwemiB+QCVureA6/pyAY9L/Y2GS/1Zhp7F7oHTCohojE
 K4UBzvBFScXX7/BnjyfqOmJ/5Ep14JCSR5xLawp3HMsvh2JrfZx9WbdOdOW3iHcGjGRHduHblqI
 uzUbU/hXnENGSHMh6a55jWFV1RWPz56rjEo8KDsqnUH06RqJlj0BtZnLxHKNA5cvR+fz47fHzxH
 HPtacU/dp9S5Pnvkw8AgMjRnZ3LHkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On 10/1/25 10:30 AM, Luca Weiss wrote:
> On Wed Oct 1, 2025 at 10:29 AM CEST, Konrad Dybcio wrote:
>> On 9/30/25 4:32 PM, Luca Weiss wrote:
>>> From: Luca Weiss <luca@lucaweiss.eu>
>>>
>>> Enable the RGB LED connected to the PM7350C (PM8350C).
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>>> index 36cc67469615974c193ea3a9db1b2362869d56bb..b4c69dc50ed0f0b3cb45341a01c89210bd261993 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>>> @@ -632,6 +632,33 @@ led-0 {
>>>  	};
>>>  };
>>>  
>>> +&pm8350c_pwm {
>>> +	status = "okay";
>>> +
>>> +	multi-led {
>>> +		color = <LED_COLOR_ID_RGB>;
>>> +		function = LED_FUNCTION_STATUS;
>>> +
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		led@1 {
>>> +			reg = <1>;
>>> +			color = <LED_COLOR_ID_RED>;
>>> +		};
>>> +
>>> +		led@2 {
>>> +			reg = <2>;
>>> +			color = <LED_COLOR_ID_GREEN>;
>>> +		};
>>> +
>>> +		led@3 {
>>> +			reg = <3>;
>>> +			color = <LED_COLOR_ID_BLUE>;
>>> +		};
>>
>> I assume you managed to confirm these mappings are correct.. sometimes
>> they are not what you'd expect
> 
> If you mean, that red == red, green == green and blue == blue, yes. The
> RGB configured from user space matches the color on the LED.

Yeah that's what I meant, thanks

Konrad

