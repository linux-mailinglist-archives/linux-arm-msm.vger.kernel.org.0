Return-Path: <linux-arm-msm+bounces-100099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BmnBGUPxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:50:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B977333C5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91C70300C9B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F9535A387;
	Thu, 26 Mar 2026 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJ/nx1lo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLWya0K7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11013CCFD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521652; cv=none; b=WS/M94790A8Hfm8pbY4KKXNlchRft9zsrJl4PzcBg3GqLsHL4pxrramjncTd9qTvFkA9qH7PezBvJ7sb7kqZt5yINPBMj6NTp4Ol2xhBnRxmUQe9h716vb+es3ymLDMRW0GdWOw+92zn2Yr+wGDLM4jXwIUUS2uaOL+B0JIX/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521652; c=relaxed/simple;
	bh=Raxp4DpOOr//GI7HLC7H3cyBdQc6n1AFESD8hy91W8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxHDR5H0130cBjhF3BuKK5MVlGUcfS7l5qKlLcwiTk1g6juIxDgaAVpEMZ3L/R3fhXhK9O36a2CKuNreQlOh3JK54F+DELmdpfWxtMIepQSOavL3e/uLASvbXibUuqr5Om0JryXBSbXXh6wU67KpfoND8yOzbq7COLrRox9uZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ/nx1lo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLWya0K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5t9Cj1175859
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/arv7lUozrv3PHdRh276TBOQ+5XzrDva6kQLT1Bb700=; b=IJ/nx1loYBEaKbOS
	GlVMJ8xc6YYsFf6TYZsiorUuWKDIY13xJAQ9uYwdUMuNcHzhcLkBpL1iqWmbgSHQ
	ucu9dx/VmHTuKbBLpt+OysO1wVRJFgs+4vTNAsx26NXxLOuLyoQTYXvPJpqXNyhk
	Pma9W4MNEmTUpnI9tumuGEeOA3YAS0W307HpkTB90nUW/RCQFEB0czBb1Tc7qqfC
	ZL6Rr0KcT3wNAt28bppJ7/kxcFXer21PK1/d8/BysphJsWLTkY2X+cEHh4IlxcYE
	6tTCZ/snM3ity+cneNOaA5NLG7sM5fcmbK/f22wMADjHQjEUmkT/66CMQIiIl2vA
	GntxgA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76tdm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:40:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a855dc82aso736951b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774521647; x=1775126447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/arv7lUozrv3PHdRh276TBOQ+5XzrDva6kQLT1Bb700=;
        b=gLWya0K7q07wwDwlZwFpl79CG5gKCATw7naT2MCJzbGqJb4BSlfenIqGCkWxeAPUGd
         2FcriZ7KFkU5oZeq59LJXx8igESDB8vSG9BMszEho3px3wKEnpEzduYrrS7suTdnM42T
         wfwxi0IHfMsi8lhtgIO+7GjARf+DHobkH7fEd8RoO370ICKWCT/PpIti87bq/dPNGYoH
         p5RbATb3XNFOMshoulddz6sPaRvQ6iCBMkUK7oHLEReXzru26Ky3VfuPH/tvxY0ayZ7i
         kT/Dt37CS/nu7fcZGEt2rTvGF3NBbiC8Vb+KOja1PSQ7FobUoB043vc0wQiB/2ZIcu+f
         0WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774521647; x=1775126447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/arv7lUozrv3PHdRh276TBOQ+5XzrDva6kQLT1Bb700=;
        b=KHQzio+jHVMlV7W6AEbulnYvUHEPb7Q/znpI8XxAne2PbQMM9+XldEjiuh1ZYoi+nr
         OBiBN+a17NhCPvlX3FuCyFljJFgR6qsCKYl5YJma3GHri9e4mgJ2DoRVuioZaVj1Zmc0
         FTxR/8JAV1Tra/tOiLwjZKhOssU/59Fj/xM+HCxAtsZXVlKb5zPhUfNmUCCKif9/FjRe
         B00wpeZ+GlUFP9iCXbNDDUASrZP2QAL4ky318A5NcUdO7i/d6U3VBKPHQDheh5/rgo85
         LRihA0noIHWg2lDW9rAfRc43H8nm8mbilQjNQpcPWOYqxrBQWcstIWmtHw/hGBAZRk5e
         xY4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXbnaicTNZ70hzybr+i7smdmXy4dTC/o9FE+NZkz1am8MFK5Qq176OgimvghKbs6BFpwhn6rY0UafSteE1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8R2jFKOwcgt92+fmnr4KNxR+ZbdL/Y5vycvZ3tkAOY2ReQLoG
	qEBDFSLAp/QhEejKU5qUWCEKG03rihIN84KOH4L7D7XGG2LeiwJ+6E8vYD1cQ11cwO0SQXPJYx6
	q+ghY2U6aedis8WaMZB2NPrwdTkV0nxyYcw+dnYF4ZXKGfVAik4B5HLCN1JmM06Gm7Dun
X-Gm-Gg: ATEYQzweNnG4D3gveaW2sJcUJs7yxj3N0kssDjumu0GEvQag3Bpjrp6LDr7rPhQLhxT
	67/RKiTuVGBACa+QrsCG5NCy7hzY8l1BHelmB/CeVvO1T24dKqCRS6wV7WH0fSvxyn82CIXMAWH
	/EogwlPJIOzruCWRWszMOGF4f/l1JLmRtMXHfSjNvUkZhnTKHO5031Bt8d7KJZwUzzcLaZQN8IJ
	1ZihEO1QEidP+t/xssXFzkEqZ5EdBit+YvYBWkY9HXQP4lpTKeN7lqVKWmICjM0aDmzmM3h/EFa
	B3jyCzaR0T+DQEfrCYP9DRFVeMbH61VQiO7iO8bzjeRdbYHdoGwURkXTqNKyGiGknrmfbHA8ooP
	yDLTc6U81qURdYPc4h9YzmNdurULbFoS6tB96rI1NFCm17w7T
X-Received: by 2002:a05:6a00:1311:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82c6dfb855cmr7330105b3a.28.1774521647277;
        Thu, 26 Mar 2026 03:40:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1311:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-82c6dfb855cmr7330073b3a.28.1774521646765;
        Thu, 26 Mar 2026 03:40:46 -0700 (PDT)
Received: from [10.219.50.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d22c8e8sm2154139b3a.24.2026.03.26.03.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:40:46 -0700 (PDT)
Message-ID: <c7ae56bb-284a-43c9-be17-fc7e61e46845@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 16:10:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: qcom: audioreach: explicitly enable speaker
 protection modules
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com>
 <sf2hegu7qqiq56nftimjpvf2hj4jiti3zxjex75pmcjuoaqkel@4rosfzs5zvcl>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <sf2hegu7qqiq56nftimjpvf2hj4jiti3zxjex75pmcjuoaqkel@4rosfzs5zvcl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c50d2f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=h1kNtkvBWpyXzFN478EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: rTGIXTDVqqBqL5vQ_PVb-dyENpr6P4Uh
X-Proofpoint-GUID: rTGIXTDVqqBqL5vQ_PVb-dyENpr6P4Uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NCBTYWx0ZWRfX6EsLMJ8O42S1
 6YrZ47bAPjqktlkjzLPtla5fI5rypFKhvYGbsk7VnHWAUT+P6lGUI6mmJusZ98t7VXzmSU/qHQH
 nB2vA+OxWMxHgbu/HbbH3ds6ab5m70btwSgm7bthew4TCj5LXDdMJqrHg01M/OvuEh6nZHMEUs7
 xs9POlPA3gz6p8SW2rPeYrmJ7b/K55gV7br0RFUGJERJAr5QtmJ5GD9N/k7uGF2W/w7FCAC7whZ
 4qEl8JlllO4XMTHK2eEB1JlraS4hRlYbj0RABVNHDXutia9TwwFUu6zif75XQ1mntae39h4hjGw
 UfHgMhaDCSTNGYD64m4+JKUsOKmpwMULWZd12ZGZhAoXFg0UeAoEuFf/ZGhPqA4zT3KSzSOaI4K
 uzrcyZfECBrdO5UpQVXmUdEuqZ8nigyP2NywVTo61Op1tp7etvHEUnQ6YehHRq+ObE+tvGSiAm5
 UTFubWOnemndK/v99mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100099-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B977333C5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 1:00 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 25, 2026 at 11:14:08AM +0530, Ravi Hothi wrote:
>> Speaker protection and VI feedback modules are disabled by default.
>> Explicitly enable them when configuring speaker protection.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Fixes?

ACK, Will add the fixes tag.

Best Regards,
Ravi Hothi

> 
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
> 


