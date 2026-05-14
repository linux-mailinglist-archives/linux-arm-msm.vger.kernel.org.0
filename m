Return-Path: <linux-arm-msm+bounces-107605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMSkIATSBWpUbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:45:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B93542752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69B77301330C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711C13E5A1C;
	Thu, 14 May 2026 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJNhajcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOXdcOj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073C3E5577
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766334; cv=none; b=TXiHr4datLW8RHUQfyzOhArP1pQ7G2uXASABZJ2dCkhLwTIYwPxO7Obrj9WCTBJVu5uTEBq/cA5JataH+idvkRWDkfdU3hMWRKPqBQQqevYCuQQoBDtZ/iZHlsVWeTkWWwrks1vNIDNQqqDb5KvZJtvtJmxRnPCM1U+Ja1Vy0xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766334; c=relaxed/simple;
	bh=UX/0/oNsXO3jFP/m3F5/1BBiL5qPA350g3fa87BSP9M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RsHN3XSvj73PZIyj6kJ6A9KzMQGE3yw9qR4nHVt7f91bqdnO0kKAQTViD23fhBi2BthdC2TPGGZUxBq3BL1kUAaHEcxOxDDv9vLRqBTr8eWka/5OExVHMdhf4TZHiVrBqZz/8IcW4CXcctj4MvglFIAhKMv6xOIDlwtkgZFjEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJNhajcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOXdcOj9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeURR3048536
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bccz44mXt5IlcgrwM6BT+Jf6mOZHElzKxevYD9CBbWM=; b=jJNhajcScwOXhHxL
	AJ6OEVXxDKfx/i1FBLfkDUXff9kTHcIOM0bdHNcENTxTrLpmzVrj6WUPFzyDCiHO
	KxFpLr6td0K9W3KrGDGuDp7bRXpnjiYo2UvMnkXhJCMNOLukvI4KZ8QJVNlsh1Jg
	Hw0Er5GvRtDs1/f94PQJ8KdRSIslVFej1EwPzCMEsJb//q3fjhJrxiYwfmIHeJ6Z
	4kewvn+lKKox2FD8vqKTHl+AoxgYVL2tk3ImNK2ac4vJh3Nx794UZHMPgV753eYo
	KDU9OCn/Hqj2AIaxuoUlf77Rm9AMQ3Cqj5cgzxARZw2fdhm3Qfk5TT+i8Mnn0a8V
	S9KZMg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492tb2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:45:27 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-65c694b54d7so18770202d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766327; x=1779371127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bccz44mXt5IlcgrwM6BT+Jf6mOZHElzKxevYD9CBbWM=;
        b=cOXdcOj9eGi2V6fX2j62NypOuHQeqs7Jy8py94MhCyOyaqrFOcqO7QVbm+p2r5Cevt
         ySm+xLbet4YDtywO2nH7Irjk1/hCpV9TnLt6gQpA0D8/CnLa2+BU+S43jwtHCOCYzDEB
         clUlNCHYQKoPhGizZbSNJa5gjK2ml54y1oxwdgXsOK1KnDkY9veJNz0maMsDZt3xDzW4
         jQ6iQ0LG2cMsuvP6LB2oqj++PD8E+WP+uY0eDo85+U0qtUCNJQx3wbo1WxLLIDuomoGp
         6pKBXReTKbaxgRWO3Oo0whvy80nsPBCnZz5LUjdhXxUpobNIhD1lL0NbhUugTKJINRzJ
         bQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766327; x=1779371127;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bccz44mXt5IlcgrwM6BT+Jf6mOZHElzKxevYD9CBbWM=;
        b=Ri/1BwzRQ3NWn/KuvPvWTcOnef6aqS2AhJ9GUIRmqHIZ/BT+mNNf2gOzCbwytT9ukY
         aXHHVCUzVlxukXujiQapvMKDhjRe1z9Vqp3AZ/HHW/dcqT9WqO68wxf/22BK46mZrObU
         6jG59YNOoj6iSgTTps9/tKrwL1Y+U4Kp87x/xiL8o2jufNYAHKEbOpaurY2X68sn04Qj
         sYS2QbeiQj5rJiuOVyRsVcN3686IjAi+kfMTT3IdMjIFS6PbLPD/AX0ak07aso4fAvEr
         mSnw6Fsgwt8QOAAG/f9FL7oHIIl/W39gFqpZv4n+fXkCYYMleMyHt+3Et07vikkbr9Ld
         FMVw==
X-Forwarded-Encrypted: i=1; AFNElJ95L9b7Ay5oX0Y4hNZ1ap8h/rIAAFkOTqLz9zBk25P6Z5JxVhB4BP/00jBgn4yW8imn4rv6Tmy+jKIDhvSO@vger.kernel.org
X-Gm-Message-State: AOJu0YxVXjFWPdIMBIOP0WQUvjvLM1UTcNTqQjOOZRxrhoM1QVVve33z
	ODsXcNDdwKSdxwuRLhdoO3hgH5rkS0CmKQ1k2VEHi0Et0hpkQA9gWJIFu3l1F5sTvUGW6FYEe9i
	lBIPvOAejh3WVexcLwLtO3hs7OrObKis3cdSRAWxaoD6BEYoi4Dtg1rj/uHLrxMk9iD9q
X-Gm-Gg: Acq92OF7tkPuiUqeAreev57NYm7rY6b9YEBoESbn4ZaZZcjzc/ahQZyVJxhTooJ0UY7
	I03ROw4CO25+k2uQnfO1S3x13jWiFJsuG01ny9GKyZXZB/AeIOQl0izLYzgWX0QWvDwg0Z1pDh2
	BU0LjHP2Xz0F4rm+ZSR91WSh+NgQs9TnoNaDl1BnGQtNF8LW9w785RGA3xFXv1dB2ze/zpN3LGb
	9ysLvoS3NTUVemHDmxPpXfElL1uiymEmfbmyomhpoZbipu5bo8xzu4Nftu0cVKGJQkgU83uITlL
	OB+GvQloPtUryyYTglOmnHs/vjyLy1amDLtBbE4wJn66qu22TI05yz9wIwKdc8H4IAqqi38WFKC
	c6YduB16GltKhYNn9dIIt2Zhs17TO6cs0DQf0PQWLMchh2FFujqTK
X-Received: by 2002:a05:690c:6603:b0:7bd:a4dc:c23b with SMTP id 00721157ae682-7c6ad473846mr84572727b3.49.1778766327377;
        Thu, 14 May 2026 06:45:27 -0700 (PDT)
X-Received: by 2002:a05:690c:6603:b0:7bd:a4dc:c23b with SMTP id 00721157ae682-7c6ad473846mr84570937b3.49.1778766324839;
        Thu, 14 May 2026 06:45:24 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.69])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f55bca95sm12983157b3.39.2026.05.14.06.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:45:24 -0700 (PDT)
Message-ID: <ec78d81e-5b0f-4d79-9bf3-02d5985356f9@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:15:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
 <xxouwrtrhgyf6y6xgpqev3cxomn72mty7kvuzh4tof3jnmfmnf@6deaf6mhhdpw>
 <bee49f32-cf46-4cb5-9d84-0a813b64bd6f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bee49f32-cf46-4cb5-9d84-0a813b64bd6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i23uQWiFl0bkORJJkDM_jjK74cFhnD7L
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a05d1f7 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=UH61rShEP5ZXOK8RUAspcw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bZB2p13Iy_By7FS0diAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: i23uQWiFl0bkORJJkDM_jjK74cFhnD7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzOCBTYWx0ZWRfXwSTWr6Cb4fH4
 Gz1oC0RHWDOv2g55adUk8Txr/L3lLaNfGUcGYIOITGZDr/UZ6MMPq5hrgTW2+ac1l3gt7OcPsL+
 kxTkYAV9p0/cA/PWOT8Ja2+V6m5QnrcWm12wmDTd67CruxjIMklUTcPHQrZl9OMVU7Ax7+fq5OO
 i2ihMczh1C73WWTGY/mdquynwSR5KpS2k6T4RQ+RgNFX8O8iFVQmotB6ZTMjagnWke45kyk/U4L
 gzBmHnkAjTKFzKj2TujKZZ8ytChpFvvWypyUmqTn6rOrmn47QXotEtG+posljtKg1iUy8KYBFT4
 P4NB2SLUa4FVbTWor2aBcOauMTRl+VGThDL6By74+qFJRNPcLEDlQlnyN2jspWRIRZuFw72howA
 nJOm8w/a0+h+K0t+PTpiomjQw/D9rzdg8sVf8SFO6I2bXkbT/vmBn0P9bvlMlTcEJjoRJqQUj7A
 fvULsorKAq8VZEWUAOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140138
X-Rspamd-Queue-Id: B2B93542752
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107605-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 4/19/2026 12:16 PM, Gaurav Kohli wrote:
> 
> 
> On 4/18/2026 11:26 PM, Dmitry Baryshkov wrote:
>> On Thu, Apr 16, 2026 at 05:04:48PM +0530, Gaurav Kohli wrote:
>>> Purwa IOT boards support a different thermal junction temperature
>>> specification compared to the base Purwa platform due to package
>>> level differences.
>>>
>>> Update the passive trip thresholds to 105°C to align with the higher
>>> temperature specification.
>>>
>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 +++++++++++++++++++ 
>>> +++++++++++
>>>   1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/ 
>>> boot/dts/qcom/purwa-iot-evk.dts
>>> index ad503beec1d3..261d1e85651d 100644
>>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>
>> Is it a property of the SKU used in the EVK or a property of the overall
>> form factor, cooling, etc.? In the former case it should go to
>> purwa-iot-som.dtsi.
>>
> 
> thanks Dmitry for review.
> it is applicable for overall form factor, 2nd one is applicable here.
> 
> thanks
> Gaurav
> 

Gentle reminder for this change.

> 
> 


