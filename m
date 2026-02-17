Return-Path: <linux-arm-msm+bounces-93158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAOeMC1ilGlfDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:42:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C479814C0C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A22DB302A06B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FA53542F2;
	Tue, 17 Feb 2026 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoKPKbsG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUX44s7B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FE29AB15
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771332137; cv=none; b=ZU5P5MwaG748bneIlx4gfOo/j9s0s96IDTIAcLoiRmf+kvQzymyKm6mxkn+A1vKntkJNqgqkVuMHYmYOm2jxF/8NwnUwqvtx3tfOtOauRpICT7S+1ZH4kUFw5pbqlJt7stcIsjFDQfJwjlAhGxN6WUmJUBOAGD3rVWFuy7wBp0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771332137; c=relaxed/simple;
	bh=Uzt7RvHwwqFSV3phhIIGejkiKsOxEO0Vb+GmvZWLI+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KN/f5dGgK3qyODUCvWZ3T/OdbxhYSv6UukZ8vbB95cWv47yqYQzZrNTrtUkfwQSpFe681J9NYkckSIS5xnYgmy7ZACVdN/I8DxsV2IkXx1DZ8/8B/EgPvjKheaGRwvZLf6bOPMeqCWmiOp/1fVkEE796hmvjZaC05YO1Y5vanP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoKPKbsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUX44s7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54exc2111894
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6e4jsLCb9oNoLVirKnKjbtTHj3HOKLPKd3Pmm55v7Q=; b=DoKPKbsGJ4I0F6RT
	FF+O0s9IFeEQwFJlKdIz+VDLe7bQaUrSiLGCzf5C3MAfpw329GTdc3nRXpglqtj5
	Kj2BGFD8HBX3FpJvgWVkZlVwdIGm5O1i6Eda7tdDOiUXmFCFk/NzLm99bJkdor10
	hnUh8aujkznWS16KDKLat+rNmmCUVCjpKP+F+G1OQnUpbUHt7czKGYmQ5fNW7Sc1
	2SPjTurQQiZGKfyDRmiDlSBmdPKh9WKs5+c90bUDVInYsTV0ZgX4U9OTYdX4O/5G
	tyvryUJJcmFJkURu3duM1hJ+yIwUds2H1vlODtU5h6v/PJs7Ms0roq0khFFVehTA
	fY/Ibg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4h2u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:42:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so332402585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771332134; x=1771936934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6e4jsLCb9oNoLVirKnKjbtTHj3HOKLPKd3Pmm55v7Q=;
        b=UUX44s7BSLVb91pR/gukmEFCq1aBGk4BsOnZIr2Gpb4elt0ObRI/Zevys31WXVzToO
         jJe7ZSWp43kbzFtYNDzRlO+0QtIpjomhgkEN9xb0z/VGQOZo6ZOkorgQMNIwc7wHNjjW
         ll+gxbRiY8mPXNRaGyXFN9WnwLNTKvaY2WQ2JGUg+xzU4gGoQyTrY4RNEDocxp1gh3Xa
         MfSvVcW+K/21cuj2heIdiHbOQezOeKhwgOIiYLwzuoDR0W5nAUw+RSIujon0lDdIYC25
         jNk7IrZSqP1aayKvufwTTs8FAFaN+gr2dlUQalv5ge0xJfaE3iBAbrQJKkAMoyrOV2Cu
         epKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771332134; x=1771936934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6e4jsLCb9oNoLVirKnKjbtTHj3HOKLPKd3Pmm55v7Q=;
        b=sTpQ5otbAeGCPsqIsVesGZv2NfDE7T+1ukZrsRDwrEoa7Obv4lTKDGIFyOsUQzsYoQ
         cEftsswEetJ897GthdhxiPiKhTewQGjZMvLiy9+RPeL7FkKzxtPp2J4Zf4RerkXNbV5F
         p6ulAm2jwz0s4AezP1Kyi5rR0rat+u3SE2L3L13JAEAiBxbYnQDZdAByYc6PtuctrycF
         Y2Gb8BZK7lp3y7UY1NSnCzKd+dJ4AmFP8/lcrhDRg1sI7pT2CQ/NlpEZ5I2J8guwBFVJ
         h8gE0miXjtYSuGWjm5Oe7DCtqt/Jni49KSmvhLEPAOYx6CeiCNCsg+Roo3OIOiwdyUJE
         9LVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7SuyC9w/UCrOeEiwITHnsRTc5fRfnz+c6GGlPLgS1ug9oMdg8BgX2gOeeXe9uYPSTui2w03W3/spMeGdH@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZX3CvRzl1YCiedlwNOGrx2xvsNVgnzC+cSI2w6VeWzU3j6Li
	04qYof7OOoNBoE//S1uouKd+hcaupGbIc8wh6OsPunn1FNQisjiGc9Q8mPVnz78pLVi69qjQt2i
	MulKTnL7Viy1ekwC2Cf7KLD25WUWywC2Q4GMK5Aj2+d0W5rhNA68Ep6ICdAKPqfdI/psbrg29m8
	/m
X-Gm-Gg: AZuq6aK3n3Gfn3YWWfeVgy2T7z9Pqy1VErTjHDHThSwHvxCBpbueZKWinS3TIldaPQ5
	it6jkx+kXVkUdndWvekXoh0yvdhyqW5b4/53K4v1WgseC/hKYuqBFDggaNpIXVjZOtevS+rXmSb
	Uc7mYb9RjQmModLMpbpYmM3xp6bQUqL+Ld6VGBapkujMi3wHa9hDYm+WkHFFq33o8tmviYtA/vu
	K/Q4Tamo8Z/qYHRIc7s95QnDZEMC4YD2eDo633FnJ2jFtdJsm038QJnQ5pd2t4EcdWfVrxVY4kq
	7uk/0Q+TX0J57ZGaL01R2Bxn2QCbPaeSpvrsTJFvVdOpWVAu++BW5V9hUaRh6nSjN3KAxJ/kbVO
	Pg2q4ZYdBol/zoNhoUzftYHnxU7b4aymvVfsqWKj9Y2/sbfBJF95cJwkPFWOTEOZRSYRBj8DYNW
	AxtVw=
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1269566685a.7.1771332133850;
        Tue, 17 Feb 2026 04:42:13 -0800 (PST)
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1269564085a.7.1771332133311;
        Tue, 17 Feb 2026 04:42:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76278b8sm350008466b.33.2026.02.17.04.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:42:12 -0800 (PST)
Message-ID: <7e3dfa3a-f526-42c6-94d8-d6390dee0acf@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:42:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
 <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>
 <DFQ3MBO2EAYF.1PRF2111N0U1I@fairphone.com>
 <44f65bb6-616c-4dd9-a7a1-ee62d5d217cb@oss.qualcomm.com>
 <DGDVK13XN7OO.3I398MMB95Z8U@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DGDVK13XN7OO.3I398MMB95Z8U@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69946227 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=n6VhdLltzCPXJ-gkZbsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNSBTYWx0ZWRfXwXilFp6QuvVx
 Ea88KWFuCxX50Hv6/odLiNcRLTjMJ0ne/QIeabQpfwH2usT35tlUXhshSgorxHgNjkYWWIVxbNP
 bMNHND+ZwcUb+2cUzacgbBEdyhsmSMDIM9WUZOmfW3H5DvHoDeF/F4tGTMGA13iKuP6uBRJDLes
 j3Ui3a++8Nund7kI1a34e0DMizbSJA+A9f2evvBKg+Od0UK66o5zT4TdhzcciX4gx6CJhQUFxqi
 G9Tt5ISZtevhbeU0hPQgNN+79ZQQ3kmoIG68ytbMQgTpZIINpI7LWo351gIFFpH3CD//Nh4qj5l
 ceevVoQ0U+cZN//RwsVfkDqNyi5kHWxK3aFR7xIEVMvSP3vTAB+IAULk1A+tHHbn+aoRF8nCUx0
 Snhl3jgOECzUuuGfGBzGwdDaQTZIih/dIxntWEZae4lI//yFZs0HR9LaJCZFWIhPPdikOtkvTPr
 ILBHbI9OiAPLnFLdO5w==
X-Proofpoint-GUID: iTEHfKjMtcSn1-Rj_qlsgjWuV82gIIhw
X-Proofpoint-ORIG-GUID: iTEHfKjMtcSn1-Rj_qlsgjWuV82gIIhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93158-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.50:email,0.0.0.52:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C479814C0C8
X-Rspamd-Action: no action

On 2/13/26 2:39 PM, Luca Weiss wrote:
> On Mon Jan 19, 2026 at 11:42 AM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:54 PM, Luca Weiss wrote:
>>> On Fri Jan 16, 2026 at 2:59 PM CET, Konrad Dybcio wrote:
>>>> On 1/16/26 2:38 PM, Luca Weiss wrote:
>>>>> Enable the CCI I2C busses and add nodes for the EEPROMs found on the
>>>>> camera that are connected there.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 ++++++++++++++++++++++++
>>>>>  1 file changed, 50 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> index 7629ceddde2a..c4a706e945ba 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> @@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
>>>>>  	};
>>>>>  };
>>>>>  
>>>>> +&cci0 {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&cci0_i2c0 {
>>>>> +	/* Main cam: Sony IMX896 @ 0x1a */
>>>>> +
>>>>> +	eeprom@50 {
>>>>> +		compatible = "puya,p24c128f", "atmel,24c128";
>>>>> +		reg = <0x50>;
>>>>> +		vcc-supply = <&vreg_l6p>;
>>>>> +		read-only;
>>>>> +	};
>>>>> +
>>>>> +	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
>>>>> +};
>>>>> +
>>>>> +
>>>>> +&cci0_i2c1 {
>>>>> +	/* Awinic AW86017 VCM @ 0x0c */
>>>>> +	/* UW cam: OmniVision OV13B10 @ 0x36 */
>>>>
>>>> There's a driver for this one!
>>>
>>> Yep! Already got patches to add the required regulators & devicetree
>>> support to the driver, but since I've got zero on CAMSS so far, I
>>> couldn't test it more than reading chip ID.
>>
>> That means the digital part works.. I'd say it's a good enough
>> indicator
>>
>>>>> +
>>>>> +	eeprom@52 {
>>>>> +		compatible = "puya,p24c128f", "atmel,24c128";
>>>>> +		reg = <0x52>;
>>>>> +		vcc-supply = <&vreg_l6p>;
>>>>> +		read-only;
>>>>> +	};
>>>>> +};
>>>>> +
>>>>> +&cci1 {
>>>>> +	/* cci1_i2c0 is not used for CCI */
>>>>> +	pinctrl-0 = <&cci1_1_default>;
>>>>> +	pinctrl-1 = <&cci1_1_sleep>;
>>>>
>>>> Let's keep them per-bus-subnode so we don't have to override it
>>>
>>> I don't see any upstream example of that, would the pinctrl work
>>> correctly with that?
>>
>> Hmm.. I assumed it would.. and I assumed we do have examples but
>> ma-a-aybe they got stuck somewhere in the review purgatory?
>>
>> If you'd be inclined to test that, you can add a pr_err() to e.g.
>> msm_pinmux_set_mux() and observe whether that changes as you
>> interact with the sensor over i2c
> 
> Yeah that doesn't work. With the following diff I just get some CCI
> timeouts and at24 driver doesn't probe correctly. I'd prefer not to do
> some yak shaving to get this patch upstream.

I think the setting happens somewhere near

drivers/base/dd.c : really_probe() : pinctrl_bind_pins()

which implies there would be a driver in play, which there isn't for the
CCI subnodes.. But let's kick that can down the road

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

