Return-Path: <linux-arm-msm+bounces-79624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0BC1F3BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A1B524E7FA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2328341AC1;
	Thu, 30 Oct 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/keo+Gw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBagm6oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4990534164A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761815911; cv=none; b=lXp+QPi3qe3rXjrt09irMelaqGbzqVQcfh1SIr4MNsF10I9lOYgHg/bhsLTz1tn5dq0FUZR1e59AIdNes3oAukEDdbvDeC2osHs/Oo3DiZKkGcxGHZAbTuZyNKgThEHzqlBUj6fUGkhs3fpgpCmfi0/FGqc2UVELK9GernjoQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761815911; c=relaxed/simple;
	bh=RN5Gy2e44hs4pd5k+0pZ6+992/Fz5/HWJsqtJRp1kF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsxxPzXcYQsqF0EDD633rgUfXXlqIdPV35JsRdlfPiFN34BloFx/6xHeY1W0Gf0WSOBLHdZrRqs4JLNFGXIeCGNW9BDubn5wgXNnb9JGjzfTLr6b4wZ+VONCKwSJc3oWWsMUkIwqlFT7duqRvkVdm6bamm/A5X8z6BO7CWzPIUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/keo+Gw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBagm6oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U81OSh1578977
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHEMia+Pz0ierHzqmwDGQUplMNYjbhxw/U4nXbi2Fyg=; b=A/keo+Gw3dIP4hy2
	Hz27P8102pPNoLOWa0j56Rz3MBLe0+OIubXyDguxYIynIKbC5OUsg7XAP1IumZ6t
	IGM3VGRwiotpM1XONEXmkHAy5E29HxK6XaB3CFzJj/LhQM7BLRa+D5UzIxYhb8G2
	zWz5ejuD+FLPXSArWe4U0cfOsm4isOzDQcC+qrq0f6nLqxJzDCkqREK3KHNu0GAB
	rbTf46q7N7fVBRN6OvN27I2Ye/gbS3Iw0zPxasTD6G0ZwHt7xsGQ68kBRWRF6qdn
	MWG0MC4Gz2t8Ds1T8M6+PAW2osPcUHvFDSv+YggzAu6JyXHP7yCWY/4M0YbDSVAG
	0nrw8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjehsj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:18:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf8fad13dso1379931cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761815908; x=1762420708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHEMia+Pz0ierHzqmwDGQUplMNYjbhxw/U4nXbi2Fyg=;
        b=dBagm6ocwcBBmpBukpIpNSuSB1wSC7U25ecXFB5AY1BXST7AAAhWm3cd5+IR9u+ytr
         tIGLRH3pK5+zUD1mNbC9e1tTKXcBks092++313OyTIffnsYNdYjfQyRpEDC8P/dUMXfp
         dhsUrIvBUJlm5276ajmtWTSWZl8xgiEDh6iQnbW9nPtyn2sKddqEzg7TZAznP9DGq8o/
         Ptw74YoI6FQI2tLcMvevhHpLVO+9WK9yHyM/zIhkYjjnY8rj9Kl/XhAP93rXwlEsnnaY
         2WUkKEEvn6yDJQoszo1UftdwvXMCD4sCUmi+VHMCvXqxoFPS3lYVDfu60nJxMDlo328U
         yTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815908; x=1762420708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHEMia+Pz0ierHzqmwDGQUplMNYjbhxw/U4nXbi2Fyg=;
        b=A4qXaNmbTOLhAUOpMlCrhCZlyKF/kB8pklvFHe2ooaoccMMOxoRj7TJYUxjcUq7ODW
         89E7m6ICVhFvLxrB+2vTKu5EBhu96XuxVKPA8zQ4QDwKSZIJKliQSTx1MSBUB6VAy78J
         1ASaU1J7K9eIeyb+A4zi7DyVOSZqk79F69CdzvBhPKjQRTOoH//R7CEZ4A0lGDW9OYLs
         oHWA2vGXuZH5yu0W4UZ5WE9em/0bcy6YELINLLoI3dTnOXi3jWWofXaJDYeDYDKol9o8
         td1iqC744rhmuECO12dvHndc7a0sHPxdcoSYKcEqXPgFkLOJO8maMIyDc2G0GBVp58yg
         Sm5A==
X-Gm-Message-State: AOJu0YzUvzE74CgAHhDKuQfpCjFfS3StNjaI1FljhHFcpM6UrMlceBZV
	vEj6mh8rlWtNYjtX37KhGjY85SBpTmmTnRAZ01J6aX6TjFOZt3iiFGLGuOkRpTEheCXFTG6SE0T
	nnmt9/Dsm0XPh4dRvPM9nVenLv7y27RldWgwMvkRRYdEi9DDLaEm3aVJp4lNdPaIdZPD8
X-Gm-Gg: ASbGncsvzMq14+IiuIjLM8IU6k+fele9NBFJdYWKFRwmWdnPo8pjeAhsYRjrm9h8ot+
	SN+/YjglqdN9wIROAxBjBMgcwjv+LJ9ZA87fm2jn5EXe428QqQLGpKBIiRMX4i3fOuuT6Xw5+64
	BtfUTKF8/W2brIyfDmdOBKXlRWHV+1uw5lr3A7WJVaa8VmFNLUwa+rY8AdBccEx5D3fi7eHEHlo
	Eaoei4qLpRayMWYktbF/5pgzUGtZjPXdjV0TpEc4q8UAq4vtm8ulsJuwFqM3zdU5VIAj1LzE2lQ
	pzfHtw4l9rNp7qf2ZREGjXr6AUUGQONbwrYLzz5QK6dlnhnje/Xkv40nVzi1n35DNFlIRIkvpIy
	DtJ7wrroPvyRfopWdZ509fG98ebTIgBe9DBCRG+fzsSFgt/rTqAvoGG/3
X-Received: by 2002:ac8:7dc5:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4ed15c7ab81mr56822911cf.13.1761815908364;
        Thu, 30 Oct 2025 02:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNCKE9kYbdCMSkRstEgNVCybw73OUFRcjBy2w5NSuhLAsNduqpvslgDuJLndZu+Bjw77eMCA==
X-Received: by 2002:ac8:7dc5:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4ed15c7ab81mr56822621cf.13.1761815907798;
        Thu, 30 Oct 2025 02:18:27 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640342e5acesm6069096a12.28.2025.10.30.02.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:18:27 -0700 (PDT)
Message-ID: <7e5b3291-c36b-49a9-8a82-fc62d93f73f2@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:18:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-1-b5f9f7135326@lucaweiss.eu>
 <48a217db-b85a-411c-81f2-3106b60da86f@oss.qualcomm.com>
 <76f108e7-2ec6-4edd-8640-a82fc99f7dbc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <76f108e7-2ec6-4edd-8640-a82fc99f7dbc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TEUgOvnCdA_uPc-Dh4dMoMbS6Jn5-W6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3NSBTYWx0ZWRfX6lfi3ln+J5mW
 QAreIUOASRGr/zlQiwfuKeO8lk4GoN4STVnO9ad4WfFCP2uPKg1MUL7F1c/T5VrycoG1lZusYgQ
 V6nFrilvDH8QUULZEr5OgpUgpJ9n3J/QQtb40yTkTBALs0Eq1iCa0Xt5ZND5e4iy6JStQvrPNYq
 BaeiHKEaXNyTQD4uyoXfQsHuXJw4vVX9v9QELwJhSIy9BasuxoNKAtWZ+c7RhgexAztCW9eFwAP
 RVcWpev8cn6mYI0zqhtNOibOVBfmDs3Vw26amIOUj7q8jYjqGKfvt24uvNTJQIPA25EpvxJwfHa
 i1JDwkxsJ5wwa3bMAp82DDxldL1JkEBQ0nSP3YmWA5G+6W8XAKSAF7NUdjSCvI0oBfX1UCRsVS2
 4OW3dhO3rD+PGVdbWn/SFeSrK1NwzA==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=69032d65 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dlmhaOwlAAAA:8 a=Z8tL6suUy-G7dtvowrsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: TEUgOvnCdA_uPc-Dh4dMoMbS6Jn5-W6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300075

On 10/29/25 9:41 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On 29-10-2025 10:36, Konrad Dybcio wrote:
>> On 10/28/25 5:40 PM, Luca Weiss wrote:
>>> Add the msm8953 CCI device string compatible.
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> index 9bc99d736343..ef8f5fe3a8e1 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> @@ -15,6 +15,7 @@ properties:
>>>       oneOf:
>>>         - enum:
>>>             - qcom,msm8226-cci
>>> +          - qcom,msm8953-cci
>>>             - qcom,msm8974-cci
>>>             - qcom,msm8996-cci
>>>   @@ -146,6 +147,7 @@ allOf:
>>>               - contains:
>>>                   enum:
>>>                     - qcom,msm8916-cci
>>> +                  - qcom,msm8953-cci
>>>                 - const: qcom,msm8996-cci
>>
>> Sorry for only bringing it up now - could you check whether
>> all the clocks that you defined are actually necessary?
>>
>> It may be that you can do without CAMSS_AHB_CLK and/or
>> TOP_AHB_CLK
> 
> Removing either GCC_CAMSS_AHB_CLK or GCC_CAMSS_TOP_AHB_CLK from dts leads to an instant reboot during bootup - presumably during cci (or eeprom) probe.

So just like 8939.. thanks for confirming

Konrad

