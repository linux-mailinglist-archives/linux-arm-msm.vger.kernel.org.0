Return-Path: <linux-arm-msm+bounces-91930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMfOFVabhGmh3gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:29:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFBF3431
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F40A302B834
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 13:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075A03D903B;
	Thu,  5 Feb 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLVgvjod";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sm7jiHlM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC93D9032
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298167; cv=none; b=u6BwLoyOIKGO1kFIMCGldzaSs62owe/v3UHy+D0B6mYNIAH1s9czxpXPql9KSOxwuUtlRsteZUtJm4fXIr6E/OWlM95SjV037G2QXf63oSu/3gOJoP2QhH82xB5qno/iAMrGt7CP3czwIc6i8pIfzgLvtIBKCNTTQpnkm+v+BZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298167; c=relaxed/simple;
	bh=gtT/ktOOzMqzZ9tbRl9HU3cHh0H2V/C6koDr2HvE4yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrmmqajN9oa+qsiQOzpbVSVvdCwYZQR0ZBO4wppV6m7CrZsP5Aympj6T9ko8mv3bYoFZB/tpuAsgDP0ZPtii7/+uocb66kUd2W1D4ir58gtb4V2emW69xku29TLt9SHH9TBXAMubPa2fQGOIWjnlSqntxKAjxH0cjenDADMtDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLVgvjod; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sm7jiHlM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615AhtwL2713798
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 13:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kbq/E4VJo7DBsmRJCg4ZR0upQI23VzEJiixpkBxX90g=; b=KLVgvjodnBmPqnOO
	TM6NnOL4eu/W6bVZHAtkVqkOIPwV/iJ8cJxf+OT5d2ldyANE1DG5lRD4puORf1OQ
	EbN/0McXA/TdZiuDeFlJ8thMHlkUPfB96bm+dPRADkkBdX7cARVSYHmu2imX1TJZ
	62OJYXvpPdpibGvQ43gasc6dhBM90bGnpiKb14ArNHITLHfkslG/sLamePgx6rrX
	lfevlpcUcaLPMxYfKuugOjPRyQEkl3lpmy1iSENQuyBnODbXBbGn+sWzH4/CCldX
	wsQ9sSFMm96S3lXDWSYN0GMtk7sN0sbinxrfgnEwWcNvFHKlva0lf0098DyBFjP6
	wCWd3Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja3yj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 13:29:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so1635061b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 05:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770298165; x=1770902965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kbq/E4VJo7DBsmRJCg4ZR0upQI23VzEJiixpkBxX90g=;
        b=Sm7jiHlMQAT08EFsx/9DK2cgaWl4eip+Ul09nzdGoU23HIOP1VhyKEcG/bQk05QJ/r
         bd452tdk263gsMkNpEHsixqZXvvAHyuUMaFkUeZmqPGKKhhETZGTTjacVzk2c5baDI8l
         sSPMIulCysdP9oWaxaqU+Z2Yfbfj98EWjH0lKqYeXhsHMXXR04sE2VYSH6PBvr2m/LUW
         xQqRh5K7wsULNeaKsrFj4ChKG0yhqLBY4XRv5cV2b8WIcwdbGm/r92LB37CVHktkIBQv
         Fm82mlrXgM1PV3b3mS252OHwl8NP2Pmr4eYII5ec5V+uEa0tEBsfea+RLAX2llNEmGvk
         P+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298165; x=1770902965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kbq/E4VJo7DBsmRJCg4ZR0upQI23VzEJiixpkBxX90g=;
        b=M0pxcNw33oGH37+tVjiSLnta5oxF6NWGxKhZWkEUF+gDern1tFGBM81s+POUtXMs3+
         qREuo/56NOXMFwW3xXIDVVPpWt4fY/b4z/VdS0vqyflFpfff/aesx923RoxoQ3l0W7fB
         Poke7iAC02Ph7OnT42XONvvCpiC7T+BOLV4WPr3NAY3SKD6Fzs62vrnM6H4qdsPqn2pU
         ovO/mzxnNdeRDWbC67K9g8+NIGZPD5Zw23eXJ+LWGFwFyhJV7fMJVT7z9c/iWrOMAbE3
         EMhblJwDx/iuRlY4nuBRFPHktXLp2W/b3bUbnTc9K2yXLbXbk8QGsNzcwR5C+N/GZIzO
         ANkw==
X-Forwarded-Encrypted: i=1; AJvYcCWSXXAiRFWZREd+OK/D9PNikL5JmWK4k1zic9aedPCvSDyJAQw8JA8itMFSFOqyVrZVKzGyrQ9sAQZ9Ov/t@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ0boZlDl7PGwFL/8JYNmlMyDHB5xi8J0p6uIz4Cf+RQcpvV55
	AWSbpccS33L/GlFLT46ZLyMSKd7VSI9OZ2V3z6Xx4yM7xTz9SciXKIaEObSHxAPzuQBtOSFn+gf
	keBG8Bc13tKZjWpd1JlQA2vENldd75M7R2hDmdc5Z5tFAtc4uw/2N/tBexgn8wD3K9cWw
X-Gm-Gg: AZuq6aKvIeeiZagz/yfOdJ/zX3daw8seSMYTO5s6hQfnW9LrJ9Ch6KYkBLR0ntGzZqB
	gJAh/3ua5jPFQWsNRl9MIi+YGMnmyx0rxO57DZ8yQSZyIXPmOnfUBMH9r9pM7utN/y8cqFXXHO1
	UCwoGt2XnPx+NMZB/P7T6gCuFz9fZce/5zuJOwRMxmHPFj/tua24AiDzq5nEwFXpkeifzgBZkmv
	KJwFrUxY01gxImrJCae3Xq2n9UY57tLjm4XNZiDE7+gdXXllv/hnIzpyWzYGFv6NBaNiHhdvBOM
	uc3T9IgzwdypNV1oUd0D+e708gHfi4d/vyOXJ2QHFtjJalGUJKK+zThCFn/zAjE1gITFp8Rst+p
	tX50b6Wqaik7qS2lAGUXC+xJV4+MZvQsGMw==
X-Received: by 2002:a05:6a00:3e1e:b0:81f:ac1c:709e with SMTP id d2e1a72fcca58-8242d9ae9e5mr2614481b3a.31.1770298165107;
        Thu, 05 Feb 2026 05:29:25 -0800 (PST)
X-Received: by 2002:a05:6a00:3e1e:b0:81f:ac1c:709e with SMTP id d2e1a72fcca58-8242d9ae9e5mr2614461b3a.31.1770298164541;
        Thu, 05 Feb 2026 05:29:24 -0800 (PST)
Received: from [192.168.1.8] ([106.222.230.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d49cabdsm5396870b3a.60.2026.02.05.05.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 05:29:24 -0800 (PST)
Message-ID: <593afb89-031d-4376-8ea7-024b645c62cb@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 18:59:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>
Cc: rob.clark@oss.qualcomm.com, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
 <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
 <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com>
 <4c2faa1d-504d-4642-90d7-8db21b99d7c1@oss.qualcomm.com>
 <CALHNRZ-HzFfgeScszdHb3CtAsm9rc9UBrbkiz7wgo+dVUZ4wWQ@mail.gmail.com>
 <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Xl-JHREsPk4EOtOGlNsHGa8B-kVj5udy
X-Proofpoint-GUID: Xl-JHREsPk4EOtOGlNsHGa8B-kVj5udy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEwMCBTYWx0ZWRfX+k/o1QVwP9Tj
 k6CH7inslhurmupXLq3CTmEka9A/JwC5oXCdoX7AbDcfOh8DxwzfVzBenAveuGxe5zg2vRavTTb
 Ey5+zqDsZ8+Oejhqlk5rB0H1S+0GCjbPx4OgwEg3iAvttrpuOCSlxAJLrijEcYS1zPCpdnoWqc/
 dNnVaDmYwZYa3nNCWYEpz1afLskw5Y0oFn7Kn0oOwxhRNQk1n+KQNvqbto+c1xbfxnnaFMIdlt2
 2ifwx8BvTMfG0Cog0ZxKo8fXJzKBaHg1SGZrO+2aHm/gu/UW5MXe1g3lA72JPwtaq+QJf6Rw3Kt
 +Ngs1T1hNmCPXUqMwhH3cF5wZuROaaU4iNcaGZm7xv9bzr88/2BpvcxPSJodqwAYo7LOftALOr9
 yQkXQoeOa2Art+G6P9Hogcdii8s1w1v+0GdZvizvE0Pz+zg8ULR+4rheGB2JBKfEsnth4eXjRrX
 OWiA+OeCksgoHdcc/vA==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=69849b36 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=doIIXzKVU+7GAp32YQRM5g==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DHUtlFEAg1RzC_2m_U4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91930-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86CFBF3431
X-Rspamd-Action: no action

On 2/5/2026 1:31 PM, Aaron Kling wrote:
> On Thu, Jan 29, 2026 at 8:35 PM Aaron Kling <webgeek1234@gmail.com> wrote:
>>
>> On Thu, Jan 29, 2026 at 5:11 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>
>>> On 1/28/2026 11:24 PM, Aaron Kling wrote:
>>>> On Wed, Jan 28, 2026 at 8:46 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Wed, Jan 28, 2026 at 12:54 AM Neil Armstrong
>>>>> <neil.armstrong@linaro.org> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 1/27/26 23:48, Aaron Kling wrote:
>>>>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>>>>>> for Android, using mainline kernel drivers. I have come across some
>>>>>>> missing functionality and failures that I would like to inquire about.
>>>>>>>
>>>>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
>>>>>>> mainline. Using changes described in the gunyah watchdog thread [0], a
>>>>>>> dtbo loads and the devices boot as expected. If any of the changes in
>>>>>>> that post don't exist in the base dtb, abl will fail to load the dtbo
>>>>>>> and go to the bootloader menu. This appears to be an issue in the
>>>>>>> baseline abl code, affecting all devices of that generation. Would it
>>>>>>> be allowable to merge a change adding those changes to the sm8550
>>>>>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
>>>>>>
>>>>>> Any addition to the DT must be documented in dt-bindings, so if it's needed
>>>>>> for boot they should be documented and added for sure.
>>>>>>
>>>>>>>
>>>>>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
>>>>>>> have locally copied the commits from sm8650 and adapted for sm8550,
>>>>>>> and that seems to work okay. But no measuring of bandwidth was done,
>>>>>>> so the numbers are likely not entirely correct. Is there any plan to
>>>>>>> generate correct tables for sm8550?
>>>>>>
>>>>>> Cpufreq works but not the interconnect scaling, so doing the same as sm8650
>>>>>> is fine but since the values were calculated from downstream DT tables,
>>>>>> the same should be done for sm8550.
>>>>>>
>>>>>>>
>>>>>>> * As part of a series to support the original Odin 2, a patch to
>>>>>>> update sm8550 EAS values was submitted [1]. But that series stalled
>>>>>>> and this was never merged. If this change is valid, which per that
>>>>>>> discussion it appears to be, can it be resubmitted by itself and
>>>>>>> merged?
>>>>>>
>>>>>> I missed this patch, please re-submit, I also need to update the ones
>>>>>> for SM8650.
>>>>>>
>>>>>>>
>>>>>>> * Per the mainline kernel device trees and audio topology provide by
>>>>>>> the oem, these devices use primary i2s for the speakers path. There
>>>>>>> was a commit adding clock support for that as part of an hdmi series
>>>>>>> [2], but that seems to have stalled. Is this going to be picked back
>>>>>>> up?
>>>>>>
>>>>>> No, I do not plan to do this work, it required adding callbacks in the
>>>>>> code to handle the clocks like done for the pre-audioreach firmwares.
>>>>>>
>>>>>>>
>>>>>>> * Inline crypto fails to detect hwkm support. And I see other logs
>>>>>>> online, such as for the sm8550 qrd, that logs the same way my device
>>>>>>> does. I traced the issue to the check for wrapped key support [3]. On
>>>>>>> my devices, the derive call is supported, but the other three calls
>>>>>>> are not. I was pointed at the downstream headers for sm8550 support
>>>>>>> and only derive is listed there, the other three don't appear to be
>>>>>>> used in the downstream driver. Is this expected? And if so, will this
>>>>>>> case be added to the mainline drivers?
>>>>>>
>>>>>> Does hwkm work with you remove the last 3 calls ?
>>>>>>
>>>>>>>
>>>>>>> * Some gpu related clocks complain about being stuck off during boot,
>>>>>>> causing stack traces, but the gpu does work. I tried to do some
>>>>>>> research into this, but quickly got lost in the weeds and I have no
>>>>>>> idea where to even look.
>>>>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
>>>>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
>>>>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
>>>>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>>>>>>
>>>>>> This may be related with the display handoff from ABL, did you add the
>>>>>> plat region to the reserved memories ?
>>>>>>
>>>>>>>
>>>>>>> * Sometimes when starting rendering, a bandwidth submission times out,
>>>>>>> then the driver immediately complains that said id was left on the
>>>>>>> queue. I have tried increasing the timeout, but the same sequence
>>>>>>> still happens. Timeout happens, immediately followed by a matching
>>>>>>> unexpected response. Implying that this isn't actually a delay /
>>>>>>> timeout issue.
>>>>>>> [ 1848.517020] platform 3d6a000.gmu:
>>>>>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
>>>>>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
>>>>>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
>>>>>>> *ERROR* Unexpected message id 1015 on the response queue
>>>>>>
>>>>>> Weird the timeout was extended for this very purpose
>>>>>>
>>>>>>>
>>>>>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
>>>>>>> unsure if this is a kernel problem or userspace, so I'm submitting
>>>>>>> here first. If the consensus is that it's a userspace issue, I'll
>>>>>>> submit it to mesa.
>>>>>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
>>>>>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
>>>>>>> 00000001512E9000/003d ib2 00000001512E7000/0000
>>>>>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>>>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
>>>>>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>>>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
>>>>>>> (com.futuremark.dmandroid.application)
>>>>>>> [ 1860.258126] revision: 0 (67.5.10.1)
>>>>>>> [ 1860.258132] rb 0: fence:    2884/2884
>>>>>>> [ 1860.258133] rptr:     36
>>>>>>> [ 1860.258134] rb wptr:  36
>>>>>>> [ 1860.258135] rb 1: fence:    -256/-256
>>>>>>> [ 1860.258138] rptr:     0
>>>>>>> [ 1860.258138] rb wptr:  0
>>>>>>> [ 1860.258139] rb 2: fence:    41563/41569
>>>>>>> [ 1860.258140] rptr:     1752
>>>>>>> [ 1860.258140] rb wptr:  2319
>>>>>>> [ 1860.258141] rb 3: fence:    -256/-256
>>>>>>> [ 1860.258141] rptr:     0
>>>>>>> [ 1860.258142] rb wptr:  0
>>>>>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG0: 0
>>>>>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG1: 0
>>>>>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG2: 41562
>>>>>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG3: 0
>>>>>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG4: 3736059565
>>>>>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG5: 3736059565
>>>>>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG6: 3736059565
>>>>>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG7: 3736059565
>>>>>>
>>>>>> @rob do you have any idea how to solve this crash on a740 ?
>>>>>
>>>>> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
>>>>> something is unhappy about gpu pm.  I'd focus on that first, since
>>>>> that is almost certainly the cause of the later issues.  If things
>>>>> _sorta_ work (rendering UI, etc) you could try removing all but the
>>>>> lowest gpu OPP as an experiment.  Could be that power related problems
>>>>> surface when the GPU ramps up to higher OPPs.
>>>>
>>>> Things work amazingly well compared to what I was expecting. Using
>>>> mesa staging 26.0 as of yesterday, I'm getting roughly 80% performance
>>>> in the benchmarks that do run, compared to the stock Android. And
>>>> rendering is correct everywhere that I've seen so far. Mesa 25.3.3
>>>> gives about 89% compared to stock, but there are graphical glitches in
>>>> some of the benchmarks.
>>>>
>>>> I set gpu max_freq via devfreq to the minimum available frequency and
>>>> ran the failing benchmark again. It completed once, but failed with a
>>>> similar stack trace on the second run. And per sysfs, the gpu did stay
>>>> at that minimum. Of note, that causes the benchmark to fail, but
>>>> rendering does recover and the unit is still usable afterwards.
>>>
>>> In sm8550.dtsi, I see that ACD values are not specified in the GPU OPP
>>> table. Can we add those (from downstream dt) and try again?
>>
>> I don't know what I'm looking for in the downstream dt. But if such a
>> change gets pushed to lkml, I can grab that and verify.
> 
> I took at look at the downstream dt and took a guess at importing the
> acd values. I'm not sure if the gpu here is the baseline kalama or
> kalama v2. I guessed the former. There were a couple values missing
> however, that I had to extrapolate based on other frequencies. This
> however changed nothing about my test results. Still getting crashes.

Please use the values from kalama v2 dtsi. And if the acd property is
missing in any OPP node, that is a hint to the the driver+gmu-fw that
ACD should be kept disabled for that freq corner. So, please follow the
same.

ACD configurations are required to meet the hw specifications. We can't
predict how the hw fails in case of a spec violation. I don't know if
this issue is ACD related, but we should ensure that all power related
configurations are accurate first.

Also, could you please try the latest firmwares (sqe and gmu) from here:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom?id=30979b116b5c5857b72c4332db8db0ff1ca2dc08

> 
> From my perspective, this part does not appear to be a PM or frequency
> related issue. Some of the 3dmark benchmarks I have never seen crash.
> Like Wild Life Extreme. I can run the stress variant of that and it
> beats the unit for 20 minutes at full clocks with a screaming fan and>
that runs perfectly stable. Solar Bay Extreme also runs completely
> stable in all of its glorious 3 fps. The two problems are the standard
> non-extreme Solar Bay and Steel Nomad Light. Both of these
> intermittently crash with similar traces to what I posted before.
> There doesn't seem to be consistency in the faults, sometimes it will
> be almost immediately after starting the benchmark, other times it
> will get 90% through and then fail. But they virtually always fail to
> complete. For another point of data, I have never seen GravityMark
> cause a fault either.

The peak current draw can vary between benchmarks. So we can't rule out
power issues. And are you able to reproduce the same issue on another
device?

-Akhil.

> 
> Aaron


