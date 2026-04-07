Return-Path: <linux-arm-msm+bounces-102168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB3jDaAD1WnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:16:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8839C3AEE99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A1DD3019838
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1CB3B3896;
	Tue,  7 Apr 2026 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppWcSLxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlkfxFE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB13B3C0A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567769; cv=none; b=Y9EXULA7HIk2Va8K07ZRYpmsyG3Ab8FSFqAJT8fGaXfthASl+inOkiMi97GCLOaRwP9s5O4hfgPj8z9+PUwfSUXYO5bplXkzLMFFH2z2zZwooNI8xYtR+sV4CgEKGAvhxAfJDjn4JcxVj7L0V9nEkZJKfI3m8lTwJ4RmNHBtfBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567769; c=relaxed/simple;
	bh=ZhvcqY6r1tq6QhvYIMabKOvGzftrA2RhnzWMy/baQZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZFqfxSH+6FTwiZ9x4WDFYJ53PFJ314MambOuBrIM+mG3grlhg29VW5GYzlv2YJlGmvMKkq9CidA/yxwrE1SdpFoGcpIzJnBX/F8ECkwJEJRTPZYvJkvSkjmbXiXy714e6APgudXzz1rB592peUWAKTc+taufDhKdfrM7Ff1mmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppWcSLxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UlkfxFE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D3cio492494
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=; b=ppWcSLxqr5d5b9/h
	OZE7Q/KsO6xrwkRE+iJkyMXvUzZ2FHC429n0VxXDoAKUuMeeNxqlu+YiU9jT2+aK
	HNv45y2ToeC/B+P53CW+nbnaDOxNMuMco7kqoq2TpnigXwgQRJGkjmxAFhQCj/Hv
	9FlvYA1OMWAFVSiuGOKzW3gWIpt90V3EkfR/2+SrQMBzEoFvPwkjYPYhZJ4u+RvI
	F5iAxX9snpkLXYB04U1vbOQBxsBuYJzw59EqrOmWGi1y2SPmF2ESqETCHkEpFnGX
	ZJpHUlgLg7CH/sG+4Kg9SB++Zd59PFWq3IG7h6bJ23Pi3jERXb0pt5WqTC+2Hq16
	6Ld0nA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8tt7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:16:07 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6838006a075so383250eaf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567767; x=1776172567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=;
        b=UlkfxFE8IK3F5JeqDM3vBWvs7vdjej7JFJa9zodmXX0g6AJmHCaOtKAs66eYw/Fk1P
         bOraX7ki70vWe3g4xdSBj5hvHRVoVvF2JTtKphA4oh062mrzq1/xxvGe2KYT7llrw2w6
         ATEfxB098UtCBu2iBM5ajJ4JSeBoPyWiZif/ZpArU9SRN8Havl39hNEAnLr/ykJWko8h
         +7pCbOKxxoMODGKc6mRbO9u1kevL/c9Bu0VMhXLDrraAzU1zJXGwYdKxf9s5BDSOMKMZ
         dXKEnF8T6ImfuTReGWpOhQrxBCDBXd0O7nkELK4syeBlpfdnRScdrd4M4uUed2yegUHL
         2JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567767; x=1776172567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=;
        b=WVXORvJsyfu2aSb3QOgrDIOqPj/+AorIIDJwu5VF49M/W/T5A5HlAmZUQTzj5rFXgW
         BFb8l8WztjVM1zTl+W/Il9GGIeK3kn1G7hBZTxBP3b4yu4Rj2jN2TgIDHq/rssmdB5uK
         Z7NDMXuB6u6JzFdHH31MLzzn/sajGc06XwZ+NVeP14PWqzU/eJORKIMVm0olwURjTTqn
         AL0wybU676gc4jSA7d6TLAjo/Ett+o6BjfIezv+TiyvBA5WxVC+U1puTK4apsrKCyQfw
         OYLbwnlQHrJKOjHhNeBu5/MjR1pNa/UVim9OY5u9mjWvABjAjIB2ikOblBxPcLNcTqeX
         o4dw==
X-Forwarded-Encrypted: i=1; AJvYcCVADtQdU/YM/uMLLQ+z/EW4CXATRPRPLio6PBmadPUSGByvFJGOxMHU9dZQBDG4D+4NllauHOdiW6Oqp+aH@vger.kernel.org
X-Gm-Message-State: AOJu0YwfljdselPi64bc2Gs0OvdbyoBu1ZzcwlFQwmHOG0GkvewgCwzk
	hJh0gUPLf916unN75AKFGCp1Pqzm5AVvDTDqgtbGTxSTPOf4Js5RtZUfc698R1IdrTnRoNzmgGr
	nU/+7zs2K07eCu7maBsz45XJXwJHLr9Mz3tD6LJhtsN4csRhc0mUKDtkjrHbg5netMAlv
X-Gm-Gg: AeBDievultlPlRDKMsN4cEiwjc8R/ypoQp+LSvyNTFXEzT8aTKi2NzUAlddYC/XfShu
	txWGI+rQWzJCLhukZnkYgjcguqLMLOHzNvJUwcq/ZMAiXoUY0N75Iu+FYJxQGSyD3pb9k+P9dBm
	t49hjhtZcNvM5e6IFIW/4EhNCyWdX/6MCzKuXyhwqbQfxAwmk/XXVdZo7aFnvQ+BaqmykfP02G6
	sXSf1cOgVs6RynGLOvJ7kTMXYIqNGxv9+ACqsYSkWURS3k0AsLTmZgG8YMwdmJExHaIAkPN7xC7
	GqS9d3eXSFSHBej2r98jefaP//oPjFicrOX6cxp8V3baLmdZut4gxUmB68OZ0mWzB/Vz1mZzYAC
	eLe+faeibqKivQOw959h/mz87KgKnTQf8mEZk7qCToSdIGAJZrtt7YQoUm1gCS5Ezd9HJ0HHOkg
	A+RgQ=
X-Received: by 2002:a05:6808:4fe9:b0:462:dd41:414c with SMTP id 5614622812f47-46ef831d5aamr5805558b6e.6.1775567766056;
        Tue, 07 Apr 2026 06:16:06 -0700 (PDT)
X-Received: by 2002:a05:6808:4fe9:b0:462:dd41:414c with SMTP id 5614622812f47-46ef831d5aamr5805526b6e.6.1775567765296;
        Tue, 07 Apr 2026 06:16:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec5dsm567712966b.15.2026.04.07.06.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:16:04 -0700 (PDT)
Message-ID: <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:16:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gBb-unsKraGfAtZdwYpYz_raNVfmbpSx
X-Proofpoint-ORIG-GUID: gBb-unsKraGfAtZdwYpYz_raNVfmbpSx
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d50397 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=iIL34To0PIL57gYWuS8A:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNSBTYWx0ZWRfX0f9SKJ19vV2+
 gNQQ8ktxNdhZP0vrccwKNrYqoJwT1qsZqZFQFbeacRjr22keftzi7uELGOinXMF6em/nm0bxx2M
 hEQp5KXCg7q/K5Rr1AwoIRdLaNbcINGUQ23Ew8pdxfha7vfILWvWOjqcRuyQ8TMJGiLnwn/uopW
 X9ug6d5l/jFQYkX0gqARKxgoqBrOlhM/Z/CobW9QUwTwmruTBRb//KmTt4DQielZSD0+w5IpJNO
 JW9pTpUzaFCuS6YY96rUddszY5KKPQ5gWRjk6WIzMdh5DVx9sC+NGMbdQf/26KvvZG3dbAYn/mI
 gbDKDg9Y5eS0XXHhqZLxnNIVoGsYih7X+lZrtH2GAXq+HhJro1KPgcsljhCecNsu9GZ6XEmN6Hr
 JyF2HOKN5Wy3iWKm5Jvt2s7xstVVtVDVN0mxF/vhN/pMDIcVSejQWrKroEZ7hRanJvaE9xSlQBb
 cfoDmks3oAbtrPy1Yig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net,lists.sr.ht,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-102168-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8839C3AEE99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>> Configure and enable the WiFi node, and add the required pinctrl to
>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>
>> Thanks to Alexander Koskovich for helping with the bringup, adding
>> the missing pinctrl to make the WPSS stop crashing.
>>
>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index db72418b7195..d8ac495ca7c8 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>  
>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>  
>> -		pinctrl-0 = <&bluetooth_enable_default>;
>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>  		pinctrl-names = "default";
>>  
>>  		regulators {
>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>  };
>>  
>> +&pmk8550_gpios {
>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>> +		pins = "gpio5";
>> +		function = "func1";
>> +		input-disable;
>> +		output-enable;
> 
> Hmm, if it's a sleep_clk, should it not be handled via the power
> sequencer?

If you mean that it may be needed to toggle it with specific timings,
possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
access to some docs that I think should have the answer, hopefully should
get it soon.

Or maybe +Jeff/Baochen could answer faster?

Konrad

