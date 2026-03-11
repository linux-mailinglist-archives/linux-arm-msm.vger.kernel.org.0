Return-Path: <linux-arm-msm+bounces-96983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMMzO3NosWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:04:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A209264182
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5338B30160D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202102E4257;
	Wed, 11 Mar 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erU2gEXV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfSDM6aT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B3527CCF0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234234; cv=none; b=B+mUuWeIoPnx9Is2Fh+z0Q7tvGTKoAcqI3+/zukdzLUAyI/U5gO9sr8XfFe0a8e3Y7HTOsrnKQ9MebkFS20MA7Kqx4u082uRQkUBhj699M/dw+cB4FHHYv3D0M2/03lIkh1DnN4t3kXs3ITnmoEWw7m0uaFEQGfJ2UrNy5MrWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234234; c=relaxed/simple;
	bh=5+J5TqAqGh8ioSYxiauKGxtDEKPjcO3n849+lga00bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4v07we7LFSwPA78c2glvLywnSI1VLNkXUNwxmj7UzAdfV2dpLwtqqhIFIF8bqTQtjdht+1nL9OHtwlgXcd8laGDBmI6qGjvWV4Q2wbstS8QsyoOTCEdMdDP5x9KxHrsnUz6Y1DAqi0JDc/4u1tEZ7ZY6M9OVrb8WJOuhfFvZVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erU2gEXV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfSDM6aT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BC90gN1439629
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4VhR4c9gk4ZiGswHq6GTZO8dxybDlutZ+rs5ZkA/LE=; b=erU2gEXVebghbm+o
	2GZccEX2u8Xd+E01hdidrZUuxAaH1uY63xkyHo82CZ97lHfDsKlxneBid2PUBik3
	o1TJTdTA+S1oJGAHR7BHq6XrH6dQQuLOLeK1deIYeoLbPlHjbdUcTjtbNBS3plFX
	kru2dm+0IKJa89gVM7IuNasdPaKKo0FbKB+fS7SDUbnnsNYvlnLgLU71vtRIqaEG
	+hctJroMVOeqCUUSi0tnxA8566PjsvE8drEHktiljxb9f20LYs4MDy/Cv92+W0q1
	uFhOZP4wOZgOKzcv8HMxyQBgQHj6d7rlWOYm8Po2Q3pIrZRtBBA4XdtvVfuo2l6O
	7fukUA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yhdgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:03:51 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-417490c9e7aso3290255fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773234231; x=1773839031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4VhR4c9gk4ZiGswHq6GTZO8dxybDlutZ+rs5ZkA/LE=;
        b=dfSDM6aTDjDV30MY1vJUTbE1t9x6K8aO3Vc625mWfqcD9M38AqbUQ6/YjubvmAM+uv
         jb3NAw9WGh5To9W16TfQBDJ9QmmKRGdFANNINUXRv4CK3QhoBK7JlsHEekkqJFaKvP+k
         OoxPINjLZ8nFcZCYdgWWe7VQk9VMPK021xgcUEbAW+OUV7JHAysqnMfFzYm4iotdl5/R
         fNREX3pxeClM3Yl+A+TJfK7mg9Gspz1/khBbAXmmDBw5a8y0klbJCpY4pqe1VGCkR/fI
         fNqvWOc/7OTZslURvAXrMtcTTH6ZVJwmIjegfz+8yRFBvqJ60iwiNPRyGKAkPK9JaPKY
         dRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234231; x=1773839031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4VhR4c9gk4ZiGswHq6GTZO8dxybDlutZ+rs5ZkA/LE=;
        b=Yw5qK76h6UM6o/Dx1NQiKn/bJlshPlXraJ2CD3udY83IQmMHAT639zRlszRZjwGTYX
         W5/yGEsn4FIW7v0A2ZYfsdIy4ZHisIBLD4HOkc9GtlSWQaawjCHHt/o36eu4vJsux0eQ
         BKsFID7TYqOTQFEqONSPQWia1Zleh+rpw/96BNObsBzOKrKBn5HdU20+jpm0ldgTTl1p
         LsAc8gVBXyE1YPtmg7bP8UyItQPtTT2Di9xz6xik9PZB5ygierqVhXEArAL8dNAmCTNv
         j/9BHNa7/YLimNR/+1juS2PaPmeeg+yIG6W1BqndMwu862PS0O5s0JgxZgRLpGeRVuVh
         M1kw==
X-Forwarded-Encrypted: i=1; AJvYcCWDTnelcbVOpaBQSCwHrS8xScDft7VanyH38nNiFAXkporosPW22nPEOHpVcsEC7BA7VKbq0qSLHIw28O1/@vger.kernel.org
X-Gm-Message-State: AOJu0Yywjb0WOPnvbP9R7KxQF08uOEM03h57E95UoBqp4RPltDSzSrUS
	o3zbKGmkN+oZRy6kGJecjP76k6jubupDk6wC0my74S/RwaPavMQ7xJzbhCqtznuJn4U3hMZKBhr
	0kzAzAALtv+zkUs4yxOZjR4+IGhlOAjQCjcraIyO7kyXXsD7lTzX7exAPZxTNyqIo81zh
X-Gm-Gg: ATEYQzyaoKZykRTZceBAwgXIWRqTvYzBuAV5PgqiGcUpHWESFc+sTzXjbXvgiB+8wFv
	Pr4g8OpgeYJn2vQbFV8zpDcXXEuXHZDzq7gcwS87+y5Xh8OPgSalb+UgV5kxAj+93YDcqCLAw+5
	tSlXB6R8FW1F7ZNCPYiAWd0GkGXRZOPsD88YY7PzqovjRc2HHKscGNhMhXogB3Pz8HqsT2R38tZ
	thAGuMHPrdUL7JC2UuT2OjAezrWhg6OPkP6XYzOZjN02avnITQ9t5k15rg45lkOEhB0ZDbu1dAB
	CBI9hBgqNG8PiPySRwgezGpds1/6tEbrfg/o6hxRFtTxRjED/Y4tVbIxRRoEvR282UubobRlbUo
	L8+Qnofvj0oiT1I9sf4dSBT8RR3GN+b+5VfnfEn20S2VB7sKv5KmQoyYTRRuCk/OW6cNvSTG2Ho
	QXaXg=
X-Received: by 2002:a05:6870:678d:b0:414:b05f:1ce2 with SMTP id 586e51a60fabf-4177c9a7bb6mr1147763fac.5.1773234230697;
        Wed, 11 Mar 2026 06:03:50 -0700 (PDT)
X-Received: by 2002:a05:6870:678d:b0:414:b05f:1ce2 with SMTP id 586e51a60fabf-4177c9a7bb6mr1147705fac.5.1773234229627;
        Wed, 11 Mar 2026 06:03:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de5684bsm54177566b.23.2026.03.11.06.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:03:48 -0700 (PDT)
Message-ID: <1ca4cdaf-d8f7-43c5-9087-b0394036c461@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:03:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
 <zqVKBYSFu9Qsyz7CKpxCBliYAzh1QjVqyTi24YLuiZy_muAh81pAHgkTWsEaAJsRbMlG_UewopTzYleJCypPrbukpTaBZSpuBtmG5QIKMPs=@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zqVKBYSFu9Qsyz7CKpxCBliYAzh1QjVqyTi24YLuiZy_muAh81pAHgkTWsEaAJsRbMlG_UewopTzYleJCypPrbukpTaBZSpuBtmG5QIKMPs=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMCBTYWx0ZWRfX6A+PQBsb1Yte
 qQJcA4DOypd882kphQkSQQNSp9JBE299V+xMfEpq51UuXbhzZzThHBwBkfh9jStdNGiIbMP/Dkw
 rLH5mS4WjRj1I/Da9mpvFKrfdECfbC3m2WZzO70Ze3u5c6y19a4E0afRODC6bCUAd33BWtzin34
 pY1+OKcIppFnfU7exbOPYT/P+XN8AjdMpNzRZHhjk0vZtElZQA6WlGOvguj2Fg/QG+Qsd8iK3WX
 YLaCAcP+/GnouGtMFwCqeP+yWLpD2vF9xM6QdZ6j1uVzcu76jXRGO0maDcuGZsjGNAInmeTtbiE
 KXCRDaNgSmIRLbFyuUncTvWYrPECWO68+Y/9RRTmC9r9o5dqSINM+fWwZRit1HPQjrIRw8LgLqA
 NvgMIv5qrulpRULH/iJawje9dBabIvpca+s5BJVxouLifZc0jcjBtBoAAQB96bIf3tS9X8rAiV7
 NQYd1P7bo+9VRe9zwIA==
X-Proofpoint-GUID: drBfQYSYvMkGVkgZEQsfliY1OOOHq4Ox
X-Proofpoint-ORIG-GUID: drBfQYSYvMkGVkgZEQsfliY1OOOHq4Ox
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b16837 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=ZEhHOJAMJ-b77FbnAkkA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110110
X-Rspamd-Queue-Id: 6A209264182
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96983-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,5d:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 5:20 PM, cristian_ci wrote:
> 
> 
> 
> 
> Cristian
> 
> Sent with Proton Mail secure email.
> 
> On Tuesday, March 10th, 2026 at 14:08, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
>>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
>>>
>>> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
>>> Add it to the device tree.
>>>
>>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
>>> ---
>>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>>>  1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> index 7b2849405462..709ea6fc9fbb 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
>>> @@ -94,6 +94,31 @@ &hsusb_phy {
>>>  	status = "okay";
>>>  };
>>>
>>> +&i2c_3 {
>>> +	status = "okay";
>>> +
>>> +	touchscreen@5d {
>>> +		compatible = "goodix,gt5688";
>>> +		reg = <0x5d>;
>>> +
>>> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
>>
>> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
>> even consume the former. Trying to read through some of that, I think
>> it's on purpose since the IRQ GPIO is repurposed for setting the I2C addr
>> (which nota bene doesn't match between the comment in that driver and this
>> submission - perhaps that's just a SKU difference) during the reset
>> sequence
>>
>> i.e., does the touch work any different if you drop the above?
> 
> Apparently, not. That works as expected.
> 
>> does /proc/interrupts differ?
> 
> When interrupts-extended is defined:
> 
> ...
>  50:        318          0          0          0          0          0          0          0  msmgpio  65 Edge      gt5688
> ...
>  54:       3141          0          0          0          0          0          0          0 GIC-0  65 Level     gpu-irq
> ...
> 
> Instead, when interrupts-extended is removed/commented out, I see just:
> 
> ...
>  53:       2404          0          0          0          0          0          0          0 GIC-0  65 Level     gpu-irq
> ...

Hm, that's odd - I don't see the irq handler being registered anywhere,
or anything requesting that name. Do you have out-of-tree changes to that
driver?

Konrad

