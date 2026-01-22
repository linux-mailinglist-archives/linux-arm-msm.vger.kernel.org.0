Return-Path: <linux-arm-msm+bounces-90125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NSIGqDicWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:41:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB563522
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 58B3A5C2EC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6188E3A9D8F;
	Thu, 22 Jan 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/JPliBO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCgQBccA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8394C350D5E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070735; cv=none; b=oI36GZaJNAwUc0a5GNna9p9DnFm/xv1Qulxdv1dnYmUYWgQUxZMdeMYmbqwfm8vUJCspKjBHgcXwCkqwCtVVjgYB0LruYUJmcFeBGDry8+Qn8J9l+9KNKVXUnX7SiiHrIuWLIbxet/YULHcF7wD/g57WaMc97SZ//7W+iyxIsFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070735; c=relaxed/simple;
	bh=uATaKfecwuZpQlE1wgafrpigCMzAtsS4/43cAsKSuyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSIkhhVMNlSplDT/KoyKoDRtUrYYJW2iRYeM27DwLnUPJIg1P5gVElKzc4fq2d0Ar7e9jXHeRxwB8G8w9/aPn8fVapmLtBJB+IyTYEnzMZ0ZtE4O0aWupmDvCRJT1p9A4c99wavAw1d5/zzJy8xoXGaetgerg+r8zRuOVvbB158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/JPliBO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCgQBccA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7LXNk483542
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB7h5TBBAjWDecbOflZxYmaW8tipfD/xijV1P46UIYA=; b=I/JPliBO7FAYLWCD
	18cZR9dv1dhXIdnILDga7Fm6EGD9281nA+oAtHNWSbogUQFNePibusYGzYU4xKUZ
	lC1NtxgAi80zP5BlUEPoNeKQ4Z+AJJKA3sGjLYkb574D780Ljn+H7fMkpMfX81h5
	ZtxBfBfY5FSJxlm4kPXfqS72VmrKd18Nxk3zFxHAFwfH9L3U+WKSjgSlTR3px6hK
	Sn9WTyjZtMSUKF59vdO+aFSLAugzBu8fGCs//CieBQwL/RF5aDIqG7bGqMpMUCEy
	D+2dO9Xn/86D1Df13Lw9BwBD1PqhVS+Q1J1pkaPreQDGsInMxXYyxaJ8K4eUcTvf
	N0V71w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj1psq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:32:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c532029e50so23026485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 00:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769070732; x=1769675532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LB7h5TBBAjWDecbOflZxYmaW8tipfD/xijV1P46UIYA=;
        b=GCgQBccAUfA7FnwzBgInyEIZlkxx7El+OMWWpvNGqciFM+lIUlnm8MglH+pHihHis3
         XaCkAdSUyYLoIDg0IgFT3H9UmSAplncIfQrlGgNZg+62zPhz4RMcSxOrRwR9fm3ndzxr
         7KnOTZ3Bh9mtEdhCQEXjNMpHlkEXXZ7+8hJ1R/HycOyEPGz4VWaQ+5sS/z7cOMS70Vai
         TpiQVmgC2gEmhVv1EgGC8nkxMpgOrt6b+Gff5Wxbi5z0cb5xhSSpoZTvifj21WwhTO/7
         EpvBxQipRhYVfiR/cwjgQFgP7eAwgRpXEOBQgkoVn4VigZbGdbzgWUm05FUS3bRNS70S
         7miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769070732; x=1769675532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LB7h5TBBAjWDecbOflZxYmaW8tipfD/xijV1P46UIYA=;
        b=XrEcbkmDi8vy764kWXCGsLwVMHWzBkW2lgbLAQ7HjIsE/YW3NTSLfh1DqHPnmPHcOz
         uLOjX6F+tH4+ULiVGcOkI9EDNP9Y9kdZnBV2AoQSUAEXQTI/orTTOtYDH52oOgDz5/PZ
         /d0fsxjUza9YdDtoMCf12xW3UBXS1jrnk+6QQxlNWb9YhLuAQRvpXI40PHC7nFbDYWO9
         E13kdPo6IPwO1EVOrA3H4MIJ4aOPUw67i/i620Y1w+J34JEzb4rBhZ1YScq1Puc3OTvz
         hSLFgzQfaD4kgovChNvliKb59toYGefVLBxtfEna0T32VIw1nNpj4Ejd0KJ7eJBkTpjs
         cQBw==
X-Forwarded-Encrypted: i=1; AJvYcCXC45tNpvM8hiOFF3pVAqlQ5sjk64rWYNPiM1vJDt0qLEahI0ffkVV53lQvnwmjGfmZSA/1W00cC8kiKX7V@vger.kernel.org
X-Gm-Message-State: AOJu0YzY1l0B1higpGy3o/QgfD+Tvs79gqW+AyA3AjQtn1dLExmx2Uyr
	zgTIXi0EQtai033nR7t0tixeBtslco3/nVDN4pgQ8VZDSwhN4xZOZPDGsT9eDBmDXUN+oFuXKfR
	6lhoLQuRK9ynVqzmGr1NywPenHk0KBg3+x/aJwvpxh/jUzKk/4uYF1tatRfPQjbhU9r8R
X-Gm-Gg: AZuq6aJFP/Juv4O599e51v/N9H3kagdCQlt0Y48XhpuXpy3rgkqfCeJjWoxEwtGqY/e
	x+AMBix8s7lWfAhOGGFaccgdwSrocelRIRZ2yAzPw/9TYzg7qCW/vxyyYIz1+7+Cm3rIvzhb6ma
	xEOsP9bhPyDcfpKegq+THezjVUf3G0fpoza8Ju9F69FyykiwXIIi6S9hhBJjj+tw/MeWteLkN2E
	yNYQHLRmSMKV14HwFDPrBIZt1/gSyE0af1HlHkoMFcVIzzYBtBBoJV6WOuC4LpUxfsN8NRgCfVW
	bASukGV2x9Wpmt1RaD4DyOI36j7iQlFET63f6I8HWCaTN+LJRMK3Btqhgu4DCLkLRYIxIKSDI0V
	dIy1+/79gdOmQJQjTQ4X4hWtMw/nVtxaDkqCIQDh+9KVzz/llb6soA8K9VPTBLcp2kPA=
X-Received: by 2002:a05:620a:1920:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c6dafed670mr207525285a.10.1769070731570;
        Thu, 22 Jan 2026 00:32:11 -0800 (PST)
X-Received: by 2002:a05:620a:1920:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c6dafed670mr207522885a.10.1769070731024;
        Thu, 22 Jan 2026 00:32:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9f8dsm1646666766b.36.2026.01.22.00.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 00:32:10 -0800 (PST)
Message-ID: <dfe91e99-a686-415b-9211-7cb774e5343c@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 09:32:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
 <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
 <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
 <wpjvuclvpjft7y2rlrmfgszkzmc5vvmohif3etqrtvymxjjyjk@h2dujh5egdvd>
 <DFU439A9HP2H.1Y9OS2OPAXGOI@fairphone.com>
 <t4yjnuty7tmvs4vqzm4vdid7oowicy7hcnmqmu6nqtit3yru55@zpo6kprnarth>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <t4yjnuty7tmvs4vqzm4vdid7oowicy7hcnmqmu6nqtit3yru55@zpo6kprnarth>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=6971e08c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=8BatEDlHAAAA:8
 a=miy9QUiAF7RNB75P6oEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22 a=tjV2R_ox5hktXOQLSeCq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA1NiBTYWx0ZWRfX7LMn+/1+nAo7
 KsaUK0Baokoqu6BrfCD6zYypM20EwkI6wS2rbTNZTULwARfQvNIjpni+V7ptf2AZ97Wp+7EieRH
 LqXKohSncFS60uG72FU/KapzQFcv/CDfortTOy0vg9gnZe/TAbyn2S3DcP+d5YpDC9sctwgECvJ
 aA1J8Uj6W5neoETfRSYROCCDxBMCQU5I34DmZHosiP0p1VrkfbO0R3i7XojpqwUu/lFXhKWIACI
 Y+lry+Deuu9cUbx2UzP/w+czPNKtLAObJfQfNF+kDLKTnIpTUJ16a1812y11Bh0hOHK33dIGUMC
 c26xxbzNn3goAVCgxw2ksJWwgInhEIVtFcvk8FzUCJxYglmpx7Creq04y3NUyMlEWzj729mxTdi
 MhQ5ZI7Eie8AwLYoA9LR3KK0d6M1XbhKce7Z4IvOPnj7ofEwGLsVk5u1gVk/O+UEy496avvp7oM
 OLH52XxmujgePMILqdQ==
X-Proofpoint-ORIG-GUID: l8_KLNCbfLkztLwa_Djs5XyjyYBl666B
X-Proofpoint-GUID: l8_KLNCbfLkztLwa_Djs5XyjyYBl666B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90125-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,fairphone.com:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,orient-chip.com:url,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,fairphone.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	HAS_WP_URI(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EAB563522
X-Rspamd-Action: no action

On 1/21/26 9:06 PM, Dmitry Torokhov wrote:
> On Wed, Jan 21, 2026 at 09:07:44AM +0100, Luca Weiss wrote:
>> On Wed Jan 21, 2026 at 12:05 AM CET, Dmitry Baryshkov wrote:
>>> On Mon, Jan 19, 2026 at 04:52:23PM +0100, Luca Weiss wrote:
>>>> On Mon Jan 19, 2026 at 3:41 PM CET, Konrad Dybcio wrote:
>>>>> On 1/16/26 3:22 PM, Luca Weiss wrote:
>>>>>> Add a node for the Hall Effect sensor, used to detect whether the Flip
>>>>>> Cover is closed or not.
>>>>>>
>>>>>> The sensor is powered through vreg_l10b, so let's put a
>>>>>> regulator-always-on on that to make sure the sensor gets power.
>>>>>
>>>>> Is there anything else on L10B? Can we turn it off if the hall sensor
>>>>> is e.g. user-disabled?
>>>>
>>>> It's the voltage source for pull-up of sensor I2C bus (so
>>>> ADSP-managed?), DVDD for amplifiers and VDD for a most sensors like
>>>> the gyro.
>>>>
>>>> So realistically, it'll probably be (nearly) always on anyways. And I
>>>> don't want to shave another yak by adding vdd support to gpio-keys...
>>>
>>> Why? If it is exactly what happens on the board: the device producing
>>> GPIO events _is_ powered via a vdd. Added Input maintainer / list to cc.
>>
>> Yes, the hall sensor which is connected to the GPIO on the SoC, has an
>> extra VDD input which needs to be on in order for the Hall-effect sensor
>> to be on.
>>
>> See page 133 "HALL" in the center of the page
>> https://www.fairphone.com/wp-content/uploads/2025/08/Fairphone-Gen.-6_-Information-on-how-to-repair-dispose-of-and-recycle-EN-NL-FR-DE.pdf
>>
>> The IC is OCH166AEV4AD where VDD is (as expected) "Power Supply Input":
>> https://www.orient-chip.com/Public/Uploads/uploadfile/files/20231014/1OCH166Adatasheet202203221.pdf
> 
> If we add regulator support to gpio-keys do we expect it to be
> per-gpio/per-key? Or we'd recommend splitting into several instances of
> gpio-keys so that there is on set of supplies per gpio-keys device?

gpio-keys {} is very broad and generic, I would imagine it would only
make sense to keep it per-entry, like Luca suggested

Konrad

