Return-Path: <linux-arm-msm+bounces-96778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN5DAbyDsGnRkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:49:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5125803F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CB0A30A54FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231C336A03F;
	Tue, 10 Mar 2026 20:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjMbzzu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRYpaMGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAD313547
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773175737; cv=none; b=PeBZfGxSTZPcDPl38WYsHEu2ffK594apy8oFeysuarh5Xky+AAsTGC9dkWvWypkfKQV6TLceq7NNxEMauZAxGERSuMOsUeWVsTIO9HclaqCtLQEo3ZY02lHHzLzG/vrrHT54VRSkUf/P5PX12puIg1u5U7JHEawu3o3I8XQqeoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773175737; c=relaxed/simple;
	bh=035g1cC3umdzot8qbQhIyCvMn0yUJrYrK9/Cc5mTEpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCWSHCouPCic3lUx7Vk3tGiFqL61ULKgYSts+UxftEo1yPsJx6aV5p3ny7CHOSH0olSYRh9Z+tHVtEdxEolLs1dc9fuOkHRc9wP4JJOW2zRJfmrldldC26HdnmdSBQ2Ep4QoNEqTiPnx322RmgUYkwaCNy2kp7JkU2Rdy9m2us4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjMbzzu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRYpaMGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIaDJP2862524
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqbxwDZ8YIx5Q9wMcqIPFXQUkJZf97D1/1T7AOC+Umo=; b=OjMbzzu6TeMl7J5c
	/VvSv+IiJ4E6S4jiJvGyERR36kDg1aRwhGXP8NRkvHEmgvNTv7E0jl7tg7JRJOIn
	nlnqtEPTNobWifztjsAoUgprh5NXDkjVfTc/UBxTHfVE3zN0vfaY9WKZEMCCuZ9L
	RYx5Sjvty8T5qXZn9+kpEg5YjOAWJEzMOM2Eg8GOJji0Lc6aQ2ZKl8X8wStBvsLG
	3nk0zGPcIA5XTjY/aPWGXHGrjJDR+G5FD7nB2qB7XH5DdAjfhC6fNCTo8CMUq9XB
	MMxK/Khaie+aTNgRNSsvEgvuO7k702mN/0IOIgJn7PmNVslwAP455xSDzcyCspo6
	1oLMJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3wb91t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:48:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso2490141185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773175734; x=1773780534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LqbxwDZ8YIx5Q9wMcqIPFXQUkJZf97D1/1T7AOC+Umo=;
        b=TRYpaMGNu06yselZCsm69ksgLGB2wGL/NCdv4RBDe2XQU2Ys7MD9zEVtAhelptjqpa
         yUkYJhDz0XmVDrgb/zSChNDbV+pViM8QOKLHF2BKY3BW/6PxajYehDWO2XBFpsLBZGvb
         NNOLkZUUlbEiH6s3YoSjHwX+zYajkKl2eERdyRjxSBsvi+luUoHweefzhCcjTFgGc4CZ
         0nqXyR3GvQ9XLDluiOGmrTY86bYjWTa449c47MsYh3AgVM22HxA3Sd2wBh36npRDudpD
         RyGr1rjNJsPgi16wS8N8C9WRHVFU1RnAj/7og6G9UFIULzBatgf5jcHBTzxW7djwipQ0
         EkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773175734; x=1773780534;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqbxwDZ8YIx5Q9wMcqIPFXQUkJZf97D1/1T7AOC+Umo=;
        b=ERPVijGsfDdOhLdI3KxrQ/kPgBvzqOT8FS3b+c7lGbHEJMAHe+eOSI+KKcHiAjSunV
         tmheALfJDgexi8M7p4WymuxeSOTSWucoZswzZf4V6107fKIUX3F2aNvzlQE9qVuCT1q5
         o7mPezs1vHU6rznQsX3vB82Mwu85hrxxUdhwnEmbAABFlf1mMsXgZZeDfR4G9Xp44vbO
         YHv2ZSFM8+yJIO4aZD5sogUzY8a+zmAZJoNerZaPtwdlXp0mAG0e+IlQ4ZkUwfQ9wCXF
         OEbszjLXKQUXvMe0kljFW7jAsObzOwxX/u2vgHqN8wIVdTsDbQbP5mE9ieHg4LLmvP94
         Z3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUxFoES3xT7iF+DGrZ4XUwELCqQOTYaZMLw7nx04uMqvyVQ6ngHRUd1z6nKgWdvyfW/HaZiq8phOKi5OOaX@vger.kernel.org
X-Gm-Message-State: AOJu0YySqvnaJKHv255b7wXvPvj3MWMtR+tmG/THy+uLlpaVSJYDXbp+
	Gy2MMP4entvCOG14HqgrirglAECEakxwemJ1o+I2s9jaWopW+fHNDAfzkvoaenyAKYpt6OSKaqo
	z0cjuIp60PTqJ5jxC/nNJmK/ryFDbrJmEN/gIMJeQB5j8DNZmZ6bse8rynEKLM51qnoF0
X-Gm-Gg: ATEYQzxU0VBHa95jzIZDbC7zffETwKOWyHJyfnCHsXm33AO/0ZCoNBxwjJu8Bbswq4w
	BZQXjXuI6J7PFHtqUk2EUFMjPNoiKxHbNRXpuCFpA8QiDMZBQb0G4rC2qnC4sweIG/zf9wU8/Vy
	lw7E/qd86J70ErboPrkD9JWJGnSzG/QZttvre2K246s2MF9dMqhe9fXK9YZk8hr0Tp+VzAGdPiy
	3y6JPo6/FDK9DBQIpkfpJrkDaRWMvLLoj1z4vTW7GPFJsC8weoS/0fmnY3M6EQZFIws/R0U/L+Z
	5PIvW5aFZp2oe1T7FnGXZir5ejAl31eZe4SCFSH2TTlkDsA5VfX8cawuDfn4JZ/+PIis22neuA1
	4RebJV6a9vALjEzSm8fQzVg8sDZxb9hO13hjtHChz2BdbnWs4
X-Received: by 2002:a05:620a:414b:b0:8cd:76b8:98c0 with SMTP id af79cd13be357-8cda19950c1mr42813685a.35.1773175734311;
        Tue, 10 Mar 2026 13:48:54 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:8cd:76b8:98c0 with SMTP id af79cd13be357-8cda19950c1mr42811785a.35.1773175733868;
        Tue, 10 Mar 2026 13:48:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a3068cfsm3543735e9.8.2026.03.10.13.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 13:48:53 -0700 (PDT)
Message-ID: <500a5db9-f131-426a-90e7-77986a960520@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 21:48:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: qcom: sm8550: add DDR, LLCC & L3 CPU
 bandwidth scaling
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
 <CALHNRZ9R1XaYWeTneZmyAvGY-s2-rbSC_=bSV-nC8_zU+bGLqA@mail.gmail.com>
 <97134126-f1a0-43f4-a4f6-0c1bd85e0c92@oss.qualcomm.com>
 <CALHNRZ8vEcq75O_M2A4F6p_Y000SvVgu4pAW5OLtX0ucAGAqFg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CALHNRZ8vEcq75O_M2A4F6p_Y000SvVgu4pAW5OLtX0ucAGAqFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3OSBTYWx0ZWRfX62VfqmEMUSj9
 n/dtRVGFAdafPSfQKeh0cCAJcO/FK913La78c6ZXTTk7sb3DE47qBvIjFC0XRYWFG3Y4kh9tTke
 S0koOrw8UHDcVr+w22hXXWAWxDtaQGlQHoejn4ivzaERUFGce7Ews0Rrfn8bVhFx88YGOXUZVt4
 rs9VXk2XeGgMDwBGpQDFT54mSC/LaPSAOPR4/gMhSoywLKxesQSUXciKk/3CttTEdn/AJnAuiR/
 wmiJf+R/w53ihi8W7aS3G0J7wi4ZIYuQatpso8J1Z9IcjG/+T4JvvTHVzAp2CiTletbiUQkJeOU
 +veWybJJIW6oMgvmVYDbFZhGtMuLD8X0lEaurZQ88+2FhfFYi2xkaM7/9IYiD5t7x/lKSNieTRS
 pIeX5cwh6ZnIPLNPaOLNebi9SUTYlMfHHbMJWlpy2lt/zThTUB3hB2TAvrxYOJmlfcFr3SU6Yhi
 gk6+wvi/TUp5EzxzsSg==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b083b7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=ziVlo3KE2PgpvSKEoxYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XBSLkFPBQGKREiJBLh__r7olB-pSqWZi
X-Proofpoint-GUID: XBSLkFPBQGKREiJBLh__r7olB-pSqWZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100179
X-Rspamd-Queue-Id: 98D5125803F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96778-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 10/03/2026 21:31, Aaron Kling wrote:
>>>>
>>>> Best regards,
>>>> --
>>>> Aaron Kling <webgeek1234@gmail.com>
>>>
>>> What is the normal merge sequence and window for linux-arm-msm? I see
>>> several things that have been picked up for -next recently, but none
>>> of my sm8550 patches that have been reviewed / approved have been
>>> picked up yet.
>>
>>
>> This one is probably waiting on interconnect, no? Not saying that
>> merging here is easy, quite the opposite - it's frustrating, but you can
>> help by responding with actual data, e.g. bindings were merged and DTS
>> can go, instead of just content-less ping.
> 
> So patch 1, the bindings, has to go via a different tree; then patch 2
> goes via linux-arm-msm? 

Yes, at least typically.


Best regards,
Krzysztof

