Return-Path: <linux-arm-msm+bounces-113854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qbgPJ9pbNWrNtwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:10:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B47C6A69BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 17:10:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S+GGBbUM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iqDocgto;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113854-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113854-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F06473000886
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204A8368294;
	Fri, 19 Jun 2026 15:06:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B136329C6B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:06:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881602; cv=none; b=RXEgmfZjy3E3mCFZ3YgTYvUAkXFgCLo8IBl5n1tj/8L6uotZ/lNxzUUI65AeYsHtHpw1pF5H9bGKChp/cPBmUQFy6/wNLlVxsnQoW7URUsTIVycUjRU7XZcjOhyXpSJ7JV8MjyOo2ZFV+1yz0caqblPDthIU2q7lYqKFBtefY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881602; c=relaxed/simple;
	bh=UiGYjO3pkB6lfkBPWwm/laJhIY0XXfdw0uDinSFJ7Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlDw216s2M/26pMbvT/eWr4C198Sn0p0i+IQ3RmJ8UmT5ce0fa1SuBXq6ZbciO9z5bj22IJ0gYI+50JZzamnNH1NNh9P4F0diTX/EmaN5hpxH1PQIZ4odPuSA5/SA88gQJmBr3gGx3Znbf99RedvUmHgccoEvKpJ2Z/G+DdFOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+GGBbUM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqDocgto; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9U9P259680
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXBA2WLTP7wDMQw/gN3zwRvNcYmd4PqDKtZbmWkOQq8=; b=S+GGBbUMOQnWVubs
	yKeaRnULfrj4x6w696l6G6tqv1DQ5DWcukntUJqKqCJ9iFL9n4cXZnuJIr4/3tNL
	ImK9XIRt14xsO5ApVRKkQgqPQ5yRlkbxYJ2Fjj/BNkH0KZAsBRrWjnykuMoBzjB+
	ZThrjW9fVuf63Na7byCElPwPedQ6KFotyjFJsHsxGi/bySUlKYkfRMMRQDRlSUUz
	/OLXAi9takTrfk+lGiTZBr/GFewKEJvnGrn0VjP3Z2Px4fE78tOiOG3YaJfwW1eL
	pcAjctphtEmRGywbHy5wv0CftWDJ5V+tXojD7AdglQ7YcPN1q6RURtzz/RG++B7k
	UpLSxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp673m1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 15:06:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7265c1b71f6so127434137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 08:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781881599; x=1782486399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXBA2WLTP7wDMQw/gN3zwRvNcYmd4PqDKtZbmWkOQq8=;
        b=iqDocgtocZHRh4j3SVVqoSYidCgsOv3AVfZZjJvGl/GS9T4Yn/5tabpMY6GCOPXKpU
         3zy6iQLbOCJKg1cICh+7ekffM/M/l0ymuYNfuAZIflrwupjOYgZdI47SahZ84kEz1/n+
         GsZXrvYHSE9V83VDxE+/X5sVA922RlZw+Sa+qU6/BHtXAoikQVXsc25RL0Qq4UhrRqOf
         lNO1pzSIpE3d3S0IbpD2lKCmwUmzJOu3S9GoUIa1LShmDul8qTznW/61K+N3Yzi3nxYQ
         TLUUAQShSCh8E1Dmx3dDd7SAsmV9eUo7fg3Rv0J+FfpT5CdbBD3O3XhsiSI2k3QwUb3G
         Q+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781881599; x=1782486399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXBA2WLTP7wDMQw/gN3zwRvNcYmd4PqDKtZbmWkOQq8=;
        b=IpmUICxBYvCQu1t+ptbZO4ZT+fpYGC0bE2HA65EvdWaJ2M5zDFTOTvXMznwEidEKV4
         hmmZhBi2oIiMEUxZp96oEcDW5F2uxT3O4VBtOjK6VkzUec4GXn+HG/4pg6ZPckMRVt1p
         YgqBOl/fWWMshIBaYebFYJDJYylCvqL1MX22u3UHpzWeTQC0UpNim1U296phU71KKHsc
         TzXfvr9oZT+U/wVXT1eN8TcaMVdqFbhqQHpPPv8mCfVbwrGQvd6LLqy/CXgdd3qMD5Bj
         9bvWcwxhGwqTu9Iqsq6UkMZ6qOtfEPzIZDXFbHEvi9WZozCEsKuhGEAYOQHpeiKeFuSU
         kgvg==
X-Forwarded-Encrypted: i=1; AFNElJ/V4+fJcjHuMHnPec+H2yLAP7LxEWzq9PrL21C1G91HTO0zXbE2u9BwMEkHvp9VnCmVcVF3/yRzZtZ2VkLU@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPStTLFDHwvobgZiby14dewSEoO+9mbqbqNmzELCdkTj+Tlh6
	gWQEbVId74XhyXBg/2EiQBYRGFI1ZlzS7sN5fdimeis2tgWqQZMu+NSGHLWDvaFb6QoeDDHjtbf
	M3y+MMC84/UNPg3Cjd2XYvQvFjEdcJPkTPFsCW0irccB+eVOLdtx2wwI33tfggWVBwLVmm6frVP
	Z6
X-Gm-Gg: AfdE7cmdkWKxphUYx9S9UOXoguKUgNPubBE4EkLTKnP0xshF+5dUhROA+HhPgpceMiT
	TE4ISM58g9UhmO+oSYA397dwpWZHsLDuhZNAMrnWvGQl6puAqtLfFb4ykoN+De3VUYnbXvRQNye
	N+g4OXwgJH+ihXX7BiLlw2vczHPx7i/AjZOGfXfvndfr1kuOie+Xr9nzmXiuKZwzBP2gq8XhSXh
	zho4EbjQS9H7/IdzGV7ihLyGzxOBID3K4lGj+IZMAwJZNZ+sxTYpw5F7dUq0SZME880p0d/Ho/a
	8lohUy+90AZJ077039lDhdLg6Cwcj51UK4vxIEYg0FhB7iA1oJ4PNWIS00nhUT8KbLImeCwpsYI
	4GXa3a/M8Q+fPNFCYydWfwkRCrHq/2zmE7mc=
X-Received: by 2002:a05:6102:2910:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-72a0522b667mr971234137.7.1781881598599;
        Fri, 19 Jun 2026 08:06:38 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-72a0522b667mr971201137.7.1781881597992;
        Fri, 19 Jun 2026 08:06:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69711f439f8sm980688a12.22.2026.06.19.08.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:06:36 -0700 (PDT)
Message-ID: <037099d6-b8d3-4578-a08e-9ea594025ff4@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:06:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
 <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
 <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
 <21a97c4b-293f-435c-91fe-ca7394b5a2b0@oss.qualcomm.com>
 <829fa641-dbd4-4319-90a2-99a24934e0df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <829fa641-dbd4-4319-90a2-99a24934e0df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1hy6bxXRqBaNxwujWX10Ra3MoeQzP5KI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0MyBTYWx0ZWRfX77P07Pr2KZQT
 M9S+jp2bTrjLYYukG4Ix0nJO//P3tMbx5WIJCYQPdABzJQSUd9AyqJGYk5LWfMmXPD25bPFW1Gr
 C/NHJ/ROfEtcGExRGzoXH9GSJyImx11jzx+Ini7RzljhK5SuKGIBw7MXG0T2Hc070AHVXeS3EbD
 Mym1h3Hd92Ti94gNnr9I3IKrwXySDMxMvENWtg6M84KUGXNrHyA+yfU3TDI742AvfZiQ6cQOYxZ
 THXWliEHXkaSQih3p4Y45VDkXx+Hapkyew4dFhQX4ejgIebzH9tL0THtSwuMc8kTFNPgqeII2wF
 6SsrPF3j5QmLYzl79cn9kER7B2+bUORNek3MuNZdCDGIxlOJsa33P3/yQ4yfZv/d+JFPexSnoli
 ALrRCXkQ0u/VrJNeXTWXWhZnbQbHUhtJgNKKQJLKCPmUogWp8rKwHBnapAg7pSvgcRAFTMojTfx
 ksurX4B3AJnoZd2C5zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0MyBTYWx0ZWRfX/bWggIGOGuFC
 emOWpeo5uTb5qLF9q+hDh919+jzLaqiiOmLvl1oyZ6V8nBEdJv3ayB0T1LZvdKGD1VeCJlp5Ohh
 0Dy3yM6lvjtwKb12HWprOMvOTi2KTHc=
X-Proofpoint-GUID: 1hy6bxXRqBaNxwujWX10Ra3MoeQzP5KI
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a355aff cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8ppMBgYsIGJW4uXv3vMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113854-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B47C6A69BA

On 6/16/26 10:40 PM, Hans de Goede wrote:
> Hi konrad,
> 
> On 16-Jun-26 1:04 PM, Konrad Dybcio wrote:
>> On 5/25/26 2:46 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 25-May-26 14:29, Konrad Dybcio wrote:
>>>> On 5/25/26 1:47 PM, Hans de Goede wrote:
>>>>> The EFI memtable (shown when booting with efi=debug) shows that the
>>>>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>>>>
>>>>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>>>>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>>>>
>>>>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>>>>> correctly show mem blocks matching the EFI memmap:
>>>>>
>>>>> 82800000-829bffff : reserved
>>>>> 829c0000-83efffff : System RAM
>>>>>
>>>>> Instead of:
>>>>>
>>>>> 82800000-833fffff : reserved
>>>>> 83400000-83efffff : System RAM
>>>>>
>>>>> before this change
>>>>>
>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> index de0f2346cb38..5a2e84365901 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>>>>  		};
>>>>>  
>>>>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>>>>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>>>>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
>>>>
>>>> FWIW the reference memory map shows a contiguous block of:
>>>>
>>>> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
>>>> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
>>>> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"
>>>
>>> Thanks, so the first part here 0x8280_0000 - 0x829c_0000
>>> aligns with the EFI reservation and with the dts reservation
>>> after my patch.
>>>
>>> 0x829c_0000 - 0x83f0_0000 being reclaimable matches with
>>> both EFI + the dts (old and new with a different start)
>>> having this as usable RAM.
>>>
>>> The 0x83f0_0000-0x8400_0000 area seems to be marked as
>>> reserved by neither EFI nor the current dts...
>>>
>>> With the first part of the reference memory map aligning
>>> with what EFI shows, I think this patch is correct.
>>>
>>> I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
>>> range though ?

[...]

> [    0.000000] efi:   0x000080800000-0x000080dfffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

=>
gunyah_hyp_mem: [0x80000000 - 0x80800000)
hyp_elf_package_mem:    [0x80800000 - 0x80a00000)
ncc_mem:        [0x80a00000 - 0x80e00000)

then we have these ranges that are absent(?) from the efi map:

cpucp_log_mem:  [0x80e00000 - 0x80e40000)
cpucp_mem:      [0x80e40000 - 0x81380000)
reservedregion: [0x81380000 - 0x81400000)
tags_mem:       [0x81400000 - 0x815a0000)

> [    0.000000] efi:   0x0000815a0000-0x0000819fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000081a00000-0x000081a3ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

xbl_dtlog_mem:  [0x81a00000 - 0x81a40000)

> [    0.000000] efi:   0x000081d00000-0x000081dfffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

RAM

> [    0.000000] efi:   0x000081f20000-0x000081f2ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

=>
usb_ucsi_shared_mem:    [0x81f20000 - 0x81f30000)

> [    0.000000] efi:   0x000081f38000-0x0000826fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

just normal ram


> [    0.000000] efi:   0x0000829c0000-0x000083efffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

this conflicts with:
xbl_tmp_buffer_mem:     [0x82800000 - 0x83400000)


> [    0.000000] efi:   0x000084000000-0x000084afffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

normal RAM

> [    0.000000] efi:   0x000085380000-0x0000866bffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

=>
spu_secure_shared_memory_mem:   [0x85300000 - 0x85380000)
(hole)

> [    0.000000] efi:   0x000091480000-0x0000a67fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

RAM

> [    0.000000] efi:   0x0000a6800000-0x0000a7f00fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f01000-0x0000a7f01fff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f02000-0x0000a7f04fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f05000-0x0000a7f0cfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f0d000-0x0000a7f18fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a7f19000-0x0000a7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000a8000000-0x0000bbc0ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000bbc10000-0x0000c177ffff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c1780000-0x0000c178afff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c178b000-0x0000c3933fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c3934000-0x0000c4c76fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c4c77000-0x0000c50aafff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c50ab000-0x0000c54fcfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c54fd000-0x0000c5b12fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c5b13000-0x0000c5b21fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c5b22000-0x0000c5b23fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c5b24000-0x0000c5b34fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c5b35000-0x0000c62e3fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c62e4000-0x0000c62e4fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c62e5000-0x0000c62edfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c62ee000-0x0000c65f6fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c65f7000-0x0000c66d5fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000c66d6000-0x0000cf6ecfff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000cf6ed000-0x0000cfbb9fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000cfbba000-0x0000d0020fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d0021000-0x0000d5135fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d5136000-0x0000d5136fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d5137000-0x0000d5cedfff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d5cee000-0x0000d5e7dfff [Runtime Code|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d5e7e000-0x0000d6c8dfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6c8e000-0x0000d6c9dfff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6c9e000-0x0000d6d02fff [ACPI Mem NVS|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6d03000-0x0000d6ddefff [ACPI Reclaim|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6ddf000-0x0000d6ddffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6de0000-0x0000d6e0ffff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000d6e10000-0x0000d7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

as described, RAM interleaved with UEFI regions

> [    0.000000] efi:   0x0000de5b0000-0x0000e46fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

This doesn't reserve:

xbl_sc_mem:     [0xd8000000 - 0xd8040000)
reservedregion: [0xd8040000 - 0xd80e0000)
qtee_mem:       [0xd80e0000 - 0xd8600000)
ta_mem: [0xd8600000 - 0xe1000000)

absent:
tags_mem1:      [0xe1000000 - 0xe36a0000)


> [    0.000000] efi:   0x0000e69c0000-0x0000f84fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

and absent:

smem_mem:       [0xffe00000 - 0x100000000)

> [    0.000000] efi:   0x000880000000-0x000cc236ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000cc2370000-0x000cc6bdffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000cc6be0000-0x000ffdffffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000ffe000000-0x000fffffffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x00000c264000-0x00000c264fff [MMIO        |RUN|  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> [    0.000000] efi:   0x000081a40000-0x000081cfffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

=>
xbl_ramdump_mem:        [0x81a40000 - 0x81c00000)
aop_image_mem:  [0x81c00000 - 0x81c60000)
aop_cmd_db_mem: [0x81c60000 - 0x81c80000)
aop_config_mem: [0x81c80000 - 0x81ca0000)
tme_crash_dump_mem:     [0x81ca0000 - 0x81ce0000)
tme_log_mem:    [0x81ce0000 - 0x81ce4000)
uefi_log_mem:   [0x81ce4000 - 0x81cf4000)
secdata_apss_mem:       [0x81cff000 - 0x81d00000)

> [    0.000000] efi:   0x000081e00000-0x000081efffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> [    0.000000] efi:   0x000081f00000-0x000081f1ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]

=>
pdp_ns_shared_mem:      [0x81e00000 - 0x81f00000)
gpu_prr_mem:    [0x81f00000 - 0x81f10000)
tpm_control_mem:        [0x81f10000 - 0x81f20000)

> [    0.000000] efi:   0x000081f30000-0x000081f37fff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]

=>
pld_pep_mem:    [0x81f30000 - 0x81f36000)
pld_gmu_mem:    [0x81f36000 - 0x81f37000)
pld_pdp_mem:    [0x81f37000 - 0x81f38000)

> [    0.000000] efi:   0x000082700000-0x0000827fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

=>
tz_stat_mem:    [0x82700000 - 0x82800000)

> [    0.000000] efi:   0x000082800000-0x0000829bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

=>

smaller than
xbl_tmp_buffer_mem:     [0x82800000 - 0x83400000)

> [    0.000000] efi:   0x000083f00000-0x000083ffffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x000084b00000-0x00008537ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

=>
adsp_rpc_remote_heap_mem:       [0x84b00000 - 0x85300000)

> [    0.000000] efi:   0x0000866c0000-0x00009137ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

=>
adsp_boot_dtb_mem:      [0x866c0000 - 0x86700000)
spss_region_mem:        [0x86700000 - 0x86b00000)
adsp_boot_mem:  [0x86b00000 - 0x87700000)
video_mem:      [0x87700000 - 0x87e00000)
adspslpi_mem:   [0x87e00000 - 0x8b800000)
q6_adsp_dtb_mem:        [0x8b800000 - 0x8b880000)
(hole)
cdsp_mem:       [0x8b900000 - 0x8d900000)
q6_cdsp_dtb_mem:        [0x8d900000 - 0x8d980000)
(hole)
gpu_microcode_mem:      [0x8d9fe000 - 0x8da00000)
cvp_mem:        [0x8da00000 - 0x8e100000)
camera_mem:     [0x8e100000 - 0x8e900000)
av1_encoder_mem:        [0x8e900000 - 0x8f000000)
reservedregion: [0x8f000000 - 0x8fa00000)
wpss_mem:       [0x8fa00000 - 0x91300000)
q6_wpss_dtb_mem:        [0x91300000 - 0x91380000)

> [    0.000000] efi:   0x0000e4700000-0x0000e47fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
> [    0.000000] efi:   0x0000e4800000-0x0000e69bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> [    0.000000] efi:   0x0000ff800000-0x0000ffffffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

llcc_lpi_mem:   [0xff800000 - 0xffe00000) (UEFI reserves more)

Konrad

