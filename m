Return-Path: <linux-arm-msm+bounces-107834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DWNuMrQGB2qNqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:42:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8254EA71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71B59315648F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B00147A0A5;
	Fri, 15 May 2026 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbq6+Ui2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtOL7cna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ECC43C048
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843762; cv=none; b=LIcDvAVzXyQAdQtbL6mu+pN/gvzITGFb/kJihI+D0Mbrbbf/NSsCbFpyC78YAT9MHQQUv3W4gZd64Y+eAnoV5T4huH1ouDhfd6SDI5vOy+j3l+ZyvEhavm1vnNYFAQYt3Eh4JDOEolC84iUIIiaKEwyUAxDcqTrxvp4FV9FAwiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843762; c=relaxed/simple;
	bh=Qr0x+XXmA8orVwCAe1zPpQ343isne1YWHZc19uAxi7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oD2Dv1KIhIGYo0Puruceu2WuBdJCr9kqiW1iPVVpmLC17lpsLxzNpV+wG1W4Qx+a71tab5GalVvhHEgIc6GRyiJsEwggBpL5JgYGPffHYhVO1lFz8vtoVJUZdS+E4xEFW1T4QLcZEivkz5x21WeV55nHazO3jPeJ1cbLbyaz1I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbq6+Ui2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtOL7cna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAX64o3219657
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EE0vr/o64+jCrMEIp9Eikn1XzCYaUppIX2M8SUyS5js=; b=gbq6+Ui2EtDkH5hT
	LY2aZeiWsPj0IZucvCcwIGzTyinAR031HyApL+EBmgrFWhneNwsND9OSGAUZvLJZ
	Kgl2+hUU7NZscO3jYjyZOSZzOBKHDpx4ng9d9iQtOzaBdv49Yp3bSLXGJtlC/nf3
	0is9wYOJC32C59F1blPIJq9HWh2d2xDNMNFoAVYysgS6lutdfRF7bH+iKjT1b27v
	kF6y2JqkBHdI7TBnMHNMj57aoNTxBKR74E72Q/A8U+m/i+cytmrAfVad86T0M9Uk
	NNF+XQbFiBa/Ho0LgjXPD7u4GD5M/x4Zk0npgKoUa6KapDVfe8diTdB9dxdntynd
	QOffEw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2ynj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:15:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57548c75628so8175097e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843759; x=1779448559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EE0vr/o64+jCrMEIp9Eikn1XzCYaUppIX2M8SUyS5js=;
        b=KtOL7cnaAPiMIboq0tud14/UZDNBzfAOtPfML2Gg0roTDjfCPGgz+AbUJCffzx2Q7B
         5t0dcdo31rX1syIsY2TiS5z1+0fQeDQwd50N02r9JrrUmYN8LG8fPzkFQ9jrApZ6kWTJ
         m2jZ8k5CoJpYHDbaluv5psfQ7eLyNG199XPZWLm6MgNgN2FvhVu90a/MvrKhL4pFeIx7
         38LMF1H5sD6Q1T4Qa3F3NmwfXV2a6FlRgfBu2nre0Hl0XjdLINVE47zoN7eL54/pYCmS
         8ZdrIwIPOnGisVuWai7SldBLa5rBh8DCgb2Gxc2Md6ExPUZvArD4KSiOFjsDqy7Dn4yi
         OH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843759; x=1779448559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EE0vr/o64+jCrMEIp9Eikn1XzCYaUppIX2M8SUyS5js=;
        b=Wdls44dUcMa30oO4Bgsp5mGoLbCfTpoOzr2b4lvHQxTpiDBGJ4RVjp9YZ3BB0iUxK4
         TBqTpmWEWpsBntlZ22w0pTXnEdUvxcAEGHtRxiz1AqPes5yhAvsBiTBbK+0OlUh5QKFC
         UhN/4x+ifEIOTBG9knH3Q/HlDFPVPU2QAeaWESGihx3uOYLc00YjzQM+MHPvlPnSrWDo
         3pt9zkFZdrdDqEtxmHyFMHUyk/Lfnkf8erW9xowhOtW6jvVwoElXHY1EcRRNj19uUCIk
         pmHHjTv5RoAVMDD9KyXzueUFg7eLXHJufY8kKA/buHWUnbKyFhw7y3BZ1yY1HvsNnQdK
         pffw==
X-Forwarded-Encrypted: i=1; AFNElJ8olKFaOo92MSgsic8HnYSwAxaQChgoZpFvmRa98C/V2q12IoPTMwyxw+MXMNTop9UFtI74UCGXvBH3IuJS@vger.kernel.org
X-Gm-Message-State: AOJu0YxiXmzLGn7KN4tZ5B7lJ2dSV/L+Dh5cNaZtvoXZWrK2CCjeWHcw
	4OdOvb8IbZquAOAGGTaFWnWifvoaNyC7I4AH0PMBpXx2oaY1d8Z9oq9bdg9xdIWPGNEdJ6dLjsJ
	HtlgsYFCsDRivBxHOR9pdpFoZJbrd9+Jg/6+86uQ/2sVSZvRHGQb14r+ZJz5Zp51Y7/aB
X-Gm-Gg: Acq92OGm6QZTX4wOC6GAO+zacqvJl+9qGPU6nYfIgLyb1jz/3OPpGRHXCJBlz0h5qTI
	W3Izm9ar2TadCgD6593NQyKZQknMtpVL0LzxnRMtRMHXxSl4XorK6NuCG0OZI2k+HKsNH6IKT1D
	UoIYOUo2dCZGSikMojxb4OPAtA/Fo+2fWb0HND/0FScUJwRm0UH3O2tu9mYbAbGv9XiMiNHYg17
	VjEP6a02i13N491y+8pwwnI+4OHRe0hA4QeIvAKz2GXC2v95ij5UENRZfuhCu5mxldy8rKOVvmP
	tMf5EuOaqM8chJeoMK4bI+D8BZH0Yz1IvZn2ybjWnJJju3zpbmUmq7e1E71YFfhIquhjk9DXomm
	bpmH/WTZHyrt1eao0k9IZwdOzrt75reogzKfNhdaOfHPw+RC71psw/fICHRW9CsAXoY+ieXkN95
	GBsZ5I2WHujgzg1aKL5du8NQp4N8lKwXff1qhwYyhmHTDYYFaL7WmFfH5zQDdBaZJg11wpW8wiv
	ik=
X-Received: by 2002:a05:6102:6047:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-63a3d93b6edmr1487072137.13.1778843759040;
        Fri, 15 May 2026 04:15:59 -0700 (PDT)
X-Received: by 2002:a05:6102:6047:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-63a3d93b6edmr1486953137.13.1778843758006;
        Fri, 15 May 2026 04:15:58 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c6:df5c:d8ed:c370:3eee:b864? (2001-14bb-c6-df5c-d8ed-c370-3eee-b864.rev.dnainternet.fi. [2001:14bb:c6:df5c:d8ed:c370:3eee:b864])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8c8415sm14755861fa.11.2026.05.15.04.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:15:56 -0700 (PDT)
Message-ID: <10f2cd7b-4f87-4581-8065-3c140ee473c1@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:15:55 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
 <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
 <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNCBTYWx0ZWRfX0rxezHk9m43h
 Ro9bN4XIxCIo/1X7C5Cx1h4mSETqJjRklPQNgPWSc3gMSDcQh1co1TxyLSkuqFXKZiDlVM/l++K
 t2jLoux2bkaN6SCZw3tKXLk2qKeolpL1JFeUcINfJpI8fkXPiMqR3f7H1Tnr9MjcRTSHMXOVioA
 SkaBsMYcfT0IuRF8phbwD7MANTbNPh7w5KESOiA7EIZFEeh0noAzPSVpFIxnFMD8Ky+tJOVgrF1
 SEQsTHuNq/VR5ArssamdFP4G1EOgqtzOCyDhso/ykVCJ8Da/ZWEg/a8KfftFZO2h1T7yKPQTIGD
 aMtwABywuS61hShS1n+46G/fkGXfJMqCKzq5f+jCe2BM407eSZZMz/uaA+sSgnUnbEpdeMrLP3u
 5o3ReDGestoDZ/gL7guAiiUmZNSnPt4/Wm8ImW2v0MvWQbGNIg0Yx6PQsZyxxPyfjvF82lAiP7g
 idQ79srhjBy7t2mVWKw==
X-Proofpoint-GUID: jxE8H9s8hMBiggyE4eoTnbnesgcadnJ7
X-Proofpoint-ORIG-GUID: jxE8H9s8hMBiggyE4eoTnbnesgcadnJ7
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a07006f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8ydOt6MEuqIVUQlor14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150114
X-Rspamd-Queue-Id: 2FA8254EA71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107834-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 15/05/2026 14:13, Konrad Dybcio wrote:
> On 5/15/26 1:09 PM, Dmitry Baryshkov wrote:
>> On 15/05/2026 14:03, Konrad Dybcio wrote:
>>> On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
>>>> On 15/05/2026 14:00, Konrad Dybcio wrote:
>>>>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>>>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>>>>> C630 isn't stable enough. For example it might reset if display device
>>>>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>>>>> value to make C630 work in stable way.
>>>>>>
>>>>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>>>>     1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>> index e41200839dbe..e6c67016552a 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>>>>         status = "okay";
>>>>>>     };
>>>>>>     +&cluster_sleep_0 {
>>>>>> +    arm,psci-suspend-param = <0x41003244>;
>>>>>> +};
>>>>>
>>>>> Is it better if you do hack in a
>>>>>
>>>>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
>>>>
>>>> Any clarification? Then I can try hacking it in.
>>>
>>> This will send a message to AOSS to intrusct it to prevent CX from
>>> collapsing
>>
>> This sounds like a dirty hack. I think, hacking psci-suspend-param is a lesser evil.
> 
> Yes, that dirty hack is supposed to help us understand why this is an issue
> in the first place. Especially since it only came around at some point
> (although I suppose you're not really happy with spending a day bisecting
> when exactly)

A similar patch has, I think, always been in any laptop tree targeting 
c630. It could having been a disablement of sync state, a removal of 
cluster sleep or something similar.

> 
>> I know that we should spend time on understanding, what should vote on CX instead, but having the issue only on C630 doesn't really help. Maybe it will go away once I can sort out the gcc / dispcc / mdss issue on SDM845 & SM8150.
> 
> If it's a "not enough votes" type issue, it can vary from device to
> device, from unit to unit, depending on your luck in the silicon
> lottery
> 
> Konrad


-- 
With best wishes
Dmitry

