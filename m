Return-Path: <linux-arm-msm+bounces-115619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lPS8DSzdRGpH2QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:26:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8622D6EB95A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AX+PgbEy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OuEr57O1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115619-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115619-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01702305530C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 09:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C581FC110;
	Wed,  1 Jul 2026 09:25:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CD319CC14
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 09:25:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782897926; cv=none; b=BAJ/nF/KmCCSrjiF3tY9Z9iOrVCn4YJkhsAcwNa1W3vemoI6N8JUwA13Z2T27ccGI7fH+ViNR8A9Zs9GsVHl8myEFf+ynufIT/rhY/cakWKiIxFyCm/EMKavMy2vyh6B+EjAZK5fYTDqq0Q/taaehcitDgn3UZXl4s5inRcw9cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782897926; c=relaxed/simple;
	bh=mrZJL0wWuiBiYZaLKVduTJdGQVMOqrorjV68LoyJ6uA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kYBPW20Artu1wFl0+U/AUVX0qXPx/adpOp4Y+KZXjh6RqZVuNW/S4lDvt5LC2ndngvLWo6C2I9waWsxWo4o1vBkC2xK8uUD6BqMTn8XFV+Z4OXkcIPd21vt0q3jkDTQrzBbBx3r3kkDjOmEW1QIdw8SM6QmQWZ1DTu5KnX5kmaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX+PgbEy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuEr57O1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618Fuw0479274
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 09:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4oM/c+Ilwmkiwi8yamCajo3c+lZrBmHM5pAIIsPN0Jw=; b=AX+PgbEy+fWhvRrN
	CYcu5+4NKk7khAXp8M4ypaxPZTiVM3e01J+ps9xiTeTCAwmRnuPKWi5grTkJVTiE
	adWCwGu2E/k4K//sLbmkagCrdwKnRRpssKAZwaywPD8mlcRGlnY+RzMZqDijm/Jq
	Wa3MgRqvV63HL03YqRhv7uBbYicO+gwcnZgxMl7k9fU7+PHSqO+ZDo6zdM2sfrer
	qdLJXU0+i6v5WeOxg2s0pjhdknXSw59cS2h3hhpY30bH3PwTHXWmidhjxF1oi8m3
	qWTX82Uq9ml+eiA9gLI5hNUOguekqJjkxZzhIrpfl8IYK52KrARsidYfK3aDSeBS
	q7Gnbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tgqd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:25:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a20348ceso7020935ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 02:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782897923; x=1783502723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4oM/c+Ilwmkiwi8yamCajo3c+lZrBmHM5pAIIsPN0Jw=;
        b=OuEr57O1GGdzjxOTZegQUP1J+8mNMvB6fgA2gzaZSHt1vRCpjjB7O3mb/i/pITUaBx
         gtipaGeocXzWBggRkXqd40vnQJYew4tBG6SFzc7aBEduRb2X/r6kaEAq5c8CgTjPpvrd
         L7ZxxQKzCM7wGKd/PbAdUeXgZDe49MypH8Q/1NCZBkjbHA8t4yxHIjOqUD8XwuEpwc/8
         WwI4SqIkw7AhLXSUJnbu/towS8D08y/R5IuaM6jUduy4WrBEj8ogyniKmEawDjgAGw5m
         TJF4RIxDGqXQvYSAF0PoLqB3NHTbEqAXWq5AVIcsIv7lkfoekf3FI05f7pXQNoLLj3rA
         igVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782897923; x=1783502723;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4oM/c+Ilwmkiwi8yamCajo3c+lZrBmHM5pAIIsPN0Jw=;
        b=RrAaz/5nDhLWdKr6n0IAs8ybD9Xj+ONTt2y2H5t/a6PrTYJ9VYfXuCE1jNhI9zqfiP
         DaDL/p4ryFpaeLJs8pQp//gKTZx5L7xKK90mC0eCuhEr499mutOHLxSSBRXtdhUN7WGF
         uCrOKlCkrX41sPLoQr8tqbzAwhXH+rAAdzXQqaZ3Iu1svj5kRL3hv99+jkcw5rc+kEI5
         n03cwRKJ8Qpcjhbf/uqX55TptuBHfJfdf0pnlhZDrWHB441X6QI9TDtUEYPS41pb8l2f
         7t1WgqOZIU8PpJVXW2pA/OOcawh3attzrTwztAHoWB9jSleNC7x294EAZuGB6zX15oic
         caNA==
X-Forwarded-Encrypted: i=1; AHgh+RoKAVjDTNvZ8p+XdW9valui0OFcawXWrAShOKa3YJlav5GvGQY81ah0ZIro+MuQ93g8DPAcpJH0AHmmS6xf@vger.kernel.org
X-Gm-Message-State: AOJu0YxntoiqAzhkUZcuAXrT8Cp7C7Kecz7eEzF8zVt+F04xzM1ByK+4
	RU/MLh3f5sQwZa0Szku2MEeBHAZJYYmTh6i7x6mQNGiAE52cx2XpIHWsSYuOINNoiY0eHd0ighI
	Npv3HIWI6wAESyckx/AwiXblpSzhCRDFMZdvqFK+tmI+CBn7R6j8cnb1aF8mKxJQVmdrV
X-Gm-Gg: AfdE7cmH/0nSXCYlyBAWpLQoId8LUuvYoa8LUnSMiLkccDU/9XcMU6wylvRTiydYRsO
	HwOhN6G/WCLw4T3Lom2LF8x15cNEqoOvdSiM6/ldRPRT0VF9Exo/oHUNhzYy9/4Qeb2Tnfra07t
	R4mngy7ZuKEay7Wo075LsfAh1lY7cm+3VMtdKkJ+xfVuaKRL17dH8gpADum1KdBNnTJy+ruAApR
	JurMoieGokOyRK6G6f9/0aZttGqQECkl+UtDzML0rpIBwRr0WRzoyd6YczLG0woPRJFLyUVHAxa
	JilLYtVaxo9oWP0nQxDnGaPrEUha0QQIiAV+wODWfoh8BCQTOKhilOOetsJEV/M7y5TG0CamP7v
	wi0ynj2oxozDleniTfngIHW2MZnEyqRY6ftXiN2Sn
X-Received: by 2002:a17:903:4688:b0:2c9:99a2:d108 with SMTP id d9443c01a7336-2ca7e8b53f8mr11354225ad.37.1782897922734;
        Wed, 01 Jul 2026 02:25:22 -0700 (PDT)
X-Received: by 2002:a17:903:4688:b0:2c9:99a2:d108 with SMTP id d9443c01a7336-2ca7e8b53f8mr11353945ad.37.1782897922220;
        Wed, 01 Jul 2026 02:25:22 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c82810sm28865905ad.28.2026.07.01.02.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:25:21 -0700 (PDT)
Message-ID: <25a71fc7-6eaf-4a6f-b511-26e1827ddc7a@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:55:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
 <ypic3vctnnci7mkv4bg62n5xsgzpd4e3mam5kt2nvt7dxzyim4@zdzpup6uydtl>
 <f46b78cb-cee7-46ea-985c-6fb1c2f21071@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f46b78cb-cee7-46ea-985c-6fb1c2f21071@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 90-n3XZ9LzKtrFQ-4JAW3pLIusd-hAsv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NiBTYWx0ZWRfX1fACRi/6QdQD
 3iVx9+lxT9BCh10zYVHi3RHBOZ5s5pAJ9R2sY2qxusgIO1R87q0yGUs4Ate+IATySHrft4dnhmE
 glhn4u+cAwARB1i/bcQDxfXKawN4NSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NiBTYWx0ZWRfX4PwzPeP71HmI
 enPuwGAhj/29fToE1L1b2Ys9UEQjYXCnm0B5aYcsyqkdrw7BnJZsZd1qmu350k+cHI0F5uNBgFQ
 Tt5kExgyenowAuraVnJNFfgwdH1ZMtgM67G9AoyqkvI4XaMsbCoZKw6p1aCXtvi8c6tq73aMF5i
 yyoeW5nLU7set29OXTUJKRZZxQF/n6Bw3vz2nQ1b3nQhEXMeaVXAqnPzJa/lHWZs70ec1/i5nUp
 gdKusKbH1nPsgEt8Pp9GHOsxkqaJZjS/3NsxuZOMtJaCSPPFWzP3aLB7fgdkPXv23Kjcslng7kD
 bYUD1XNafFLXrRDXGcKQ2/+RPZMxbwdK001fztpw9s8uVPry7Y0nuIW2C3WQH1pAEQ4b2afo3tW
 pyazlELdPbUgxYLNZbGjC24lKdVyh43yIzIcaygcyc9d22pPGSEjcKSbPRGdQsvE4az4WAsMHwZ
 HVzCV52hF+zEi8KSP8A==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44dd03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ni_s6_Wbm9bTVVOsB1UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 90-n3XZ9LzKtrFQ-4JAW3pLIusd-hAsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115619-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8622D6EB95A

Hi Dmitry,

On 6/29/2026 4:24 PM, Arpit Saini wrote:
> Hi Dmitry,
>
> On 6/28/2026 6:00 PM, Dmitry Baryshkov wrote:
>> On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>
>>> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
>>> board and add the DLC0697 MIPI DSI display panel node.
>>> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
>>> for DSI PHY PLL stability.
>>>
>>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 
>>> ++++++++++++++++++++++++++++
>>>   1 file changed, 104 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts 
>>> b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>> index 683b5245923b..c9ea093cd8ca 100644
>>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>>> @@ -23,6 +23,18 @@ chosen {
>>>           stdout-path = "serial0:115200n8";
>>>       };
>>>   +    lcd_bias: regulator-lcd-bias {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "lcd_bias";
>>> +        regulator-min-microvolt = <3300000>;
>>> +        regulator-max-microvolt = <3300000>;
>>> +        vin-supply = <&pm4125_l17>;
>>> +        gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
>>> +        enable-active-high;
>>> +        pinctrl-0 = <&lcd_bias_en>;
>>> +        pinctrl-names = "default";
>>> +    };
>>> +
>>>       wcn3988-pmu {
>>>           compatible = "qcom,wcn3988-pmu";
>>>   @@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
>>>       };
>>>   };
>>>   +&mdss {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&mdss_dsi0 {
>>> +    vdda-supply = <&pm4125_l5>;
>>> +    status = "okay";
>> Empty lines before the status property, please.
>
> Ack, will update.
>
>
>>> +
>>> +    panel@0 {
>>> +        compatible = "dlc,dlc0697", "ilitek,ili7807s";
>>> +        reg = <0>;
>>> +
>>> +        reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>>> +
>>> +        vddi-supply = <&pm4125_l15>;
>>> +        avdd-supply = <&lcd_bias>;
>>> +        avee-supply = <&lcd_bias>;
>> AVEE is typically the negative / ground supply. How can it be supplied
>> by the same regulator as AVDD?
>
> Ack , I will update this using two seperate regulator-fixed nodes, 
> vreg_disp_p and vreg_disp_n
>
> as defined in schematics.
>
> Thanks for pointing out.
>
In LCD Display Bias driver , it takes vin from vph_pwr along with LCD 
Bias enable (GPIO 151 controlled supply) and it outputs two signals 
vreg_disp_p as (+5.5v)

and vreg_disp_n as (-5.5v). I will update the dts as per this.

Thanks

Arpit


>>> +
>>> +        pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
>>> +        pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
>>> +        pinctrl-names = "default", "sleep";
>>> +
>>> +        port {
>>> +            panel_in: endpoint {
>>> +                remote-endpoint = <&mdss_dsi0_out>;
>>> +            };
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&mdss_dsi0_out {
>>> +    remote-endpoint = <&panel_in>;
>>> +    data-lanes = <0 1 2 3>;
>>> +};
>>> +
>>> +&mdss_dsi0_phy {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&pm4125_l5 {
>>> +    /* DSI VDDA - must be at NOM voltage for PHY PLL lock */
>>> +    regulator-min-microvolt = <1232000>;
>>> +    regulator-max-microvolt = <1232000>;
>>> +    regulator-allow-set-load;
>>> +};
>>> +
>>>   &remoteproc_cdsp {
>>>       firmware-name = "qcom/shikra/cdsp.mbn";
>>>   @@ -116,3 +174,49 @@ &wifi {
>>>         status = "okay";
>>>   };
>>> +
>>> +&tlmm {
>>> +    lcd_bias_en: lcd-bias-en-state {
>>> +        pins = "gpio151";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +    };
>>> +
>>> +    panel_bl_en: panel-bl-en-state {
>>> +        pins = "gpio91";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +        output-high;
>> I think, recent recommendation is to sort these entries by the pin
>> number.
>
> Ack, will update.
>
>
>>> +    };
>>> +
>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
>>> +        pins = "gpio91";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +        output-low;
>>> +    };
>>> +
>>> +    panel_rst_n: panel-rst-n-state {
>>> +        pins = "gpio3";
>>> +        function = "gpio";
>>> +        drive-strength = <8>;
>>> +        bias-disable;
>>> +    };
>>> +
>>> +    panel_rst_n_suspend: panel-rst-n-suspend-state {
>>> +        pins = "gpio3";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +    };
>>> +
>>> +    panel_te_pin: panel-te-pin-state {
>>> +        pins = "gpio86";
>>> +        function = "mdp_vsync_p";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +    };
>>> +};
>>>
>>> -- 
>>> 2.34.1
>>>

