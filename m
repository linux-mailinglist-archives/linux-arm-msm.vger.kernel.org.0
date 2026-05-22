Return-Path: <linux-arm-msm+bounces-109368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GOAMoqREGqIZgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:25:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5005B8265
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D03D1304C128
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD98357D0B;
	Fri, 22 May 2026 17:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB53vQW7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmCVLSsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6538357D0C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470224; cv=none; b=XyvE3SUk6jUdl7ShNSpz22GEpLSoW5LrjBEpVXNYz2a1cpkpwDlthlbjDEFYKC3EMLheP0cf/nD8IvvW3t6hLIppCn/yeHod8jkaP/vNcw41YjXDvhwp5TtIg9k4Sb8rKJqwnzl2Iev+nZqL7nQTgBD02zjZ+w8u7bPj0C4WaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470224; c=relaxed/simple;
	bh=U+hd1nq5Ba9sKgpCIAr9hKLqwF2P52OkoE9q+pl5LXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNNGUdH0hclJH04S1qO4GaUfyT+YRzxr478L3yWjZj5ZmpLssOjaU1lfreplH2/yaQgEwsOujkiLp14OPkKDIaMoYgRsnc6Ck5KgA2o5+76Nz86o8d5NACHKbANx3g8IcH7GkdrORg0l2CzTSkgKiOR3OAvKEBxs66S4j3awobI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB53vQW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmCVLSsV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0hVV3477048
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sclBxpHfctQ6QwGlU6dwiPzIZrTCVf6A9WUqY/ePdZU=; b=ZB53vQW7z9jabqQ8
	kgT28do1vkOHhEdOIgPru97GG4AP1cUWLReg75tBDiOVExo7EeOAmYVBm4veb7Yt
	3Ycvg/CwAaPQN1waWIhCYhHoO0B1zP4Qlc2G6SPBD6/6bnmUpIsfZkFXoyx4UbCJ
	TIT7QZWc2FRARdZFrV160XtL23c5RaAQua6el+5BCTX+Ld3TGqv9xMrU/MfJHNTi
	sYlAxOzpzrSRaSVkeGWxZGFCbwHDshAG311FuICxN++O4JHKdskdQKGcCKNU1T+L
	9GEGg2EM96TjueNSqmyhEzJjENXuSsZeEexLMryJEBJrKKbmnGV92QOdUlr4FFMy
	q+I/iw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r89hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:17:02 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7cff695e4a3so81401087b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470221; x=1780075021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sclBxpHfctQ6QwGlU6dwiPzIZrTCVf6A9WUqY/ePdZU=;
        b=NmCVLSsVIl5mQjkJ0VRym7ndk7SzIwjwefqN3NQKuGPhERfQLu8DgP12atthDT/ZUH
         4Gc2C6y4S1+PWOmdKMQr8U6e3CyMFq68CybuY7B/Nqg3C0sriXoK32ycHySJCSKJ4MPD
         1+JRGb8tUCa5bpurAkczkS8hswHmqje2Z+Avref15I2PPGGQYCFyrHiQf+tF3NsYl4b6
         sBBbkko0brW4lNpQHiotYYJfwRbo7VFS8LC1DSq95q5sAT9OaG8NPg7e1UJmroCWfvRV
         6zsbtn8Kx8KeNWzizofaSieIAzB2nBo63A87YaK/TFK38m45TwA4FrOU6omHmU4F7s5q
         tMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470221; x=1780075021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sclBxpHfctQ6QwGlU6dwiPzIZrTCVf6A9WUqY/ePdZU=;
        b=VL4xubfKPiGGf55LOgTdFZKmYGSapKrAPTRtuswnreBn0LuYcZZGSEKG22S5WqMHnf
         92svcKGVKPRq9FhYFRq/ioyKULK6PY2hUwsb952Epz8nNLXKDwesmR470e1x00E4o8B0
         9VgOwm9Cg8rptCyl2sjtfE0hL7OrfPLwhYBS1wz44FDjcqQ43qGja4AXw+Sx+iCzBgpz
         su9WmUE+NRLbh39azXZwIhPJa4arfvHuCOhZ2qPrXfZFbD06+VXf4s1xLRopmJhtP113
         Mp2tBo/C18eZJJy9yg0TPpYnGywGA55W+95cse2kJerRCwTt7/w2LRWjZeGgLl3Watjf
         aN1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+I4+GBzje62RdSu9uaUaDIEyWTi72EsRUM3cQYbuuZmL30X3i98m4lhPHsih1e7/uVbufKZsNyydoUynMg@vger.kernel.org
X-Gm-Message-State: AOJu0YyjulrYB/vtQhKJFpsi5pHTNwkoTzU44V44NnzRhV0YtaetepDh
	C5I67f87qi9bmblWGK+3no3n7z05xWp+CjKhnPkYenYaZHf3hEa+7sQPRLVJdlcUZe6vY9RijM+
	o9fUsLGsk/PCLhYgYLPEVlmzfEkr/s7ysr60NZL6QGDsg4jv9Ue9wef0vyjt2xDLM+c9E
X-Gm-Gg: Acq92OEtz8/vTbZERITKnaiC8vQc3OzChW4bBJkrE5KJ6OmSV7HXmQZZXck2qjpdEkb
	Esk6sIXqdqJSjypS4AggBgWSR4zKCGsi7myMfH3e91zXWQY2LIQIiY+2jwXG45IfZEmmmYYs7K8
	y309n5vhcxYGUDbuF2IBt6cc0Bo7KXCOisKz7c8y7jvHq1toZV2y7gRu7p9K4rYNzb7waagRc22
	T8ce+FC/F2WmJK6BS5tqRkFKLZ/31R5hciZhc5D3oewRzEZ7CEFW+pk1y4XpuRvNor7CY0ZL28O
	bQvZ3x4d8yguC2AmT8siM3OP/e6k0tHDqMETwtfIdujwZuYjRnT2+XqfHZX3Fa7q/fu3N7YcrQN
	LqYe8LzvXtWJnR2HCBVaBYq/k8fypIQQyhSORDjcQ5LaAEqc5KzF+L590Q05bscTmYZn+1WZkzc
	bqVTZuzl+0ZQ==
X-Received: by 2002:a05:690c:4b0c:b0:799:198d:8c5a with SMTP id 00721157ae682-7d335fbc537mr53940687b3.34.1779470221241;
        Fri, 22 May 2026 10:17:01 -0700 (PDT)
X-Received: by 2002:a05:690c:4b0c:b0:799:198d:8c5a with SMTP id 00721157ae682-7d335fbc537mr53939907b3.34.1779470220720;
        Fri, 22 May 2026 10:17:00 -0700 (PDT)
Received: from [192.168.101.236] (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c73ff33sm11043207b3.45.2026.05.22.10.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 10:17:00 -0700 (PDT)
Message-ID: <581cc180-b993-4b86-81ae-17822a35a1fb@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:16:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        laurentiu.tudor1@dell.com, alex.vinarskis@gmail.com,
        linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
 <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
Content-Language: en-US
From: Michael Scott <mike.scott@oss.qualcomm.com>
In-Reply-To: <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a108f8e cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=87SNHxiu0QhxqWoJ-3IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: krsYYrLQm_uxnfzeOWKrIW81hbx5UJWf
X-Proofpoint-GUID: krsYYrLQm_uxnfzeOWKrIW81hbx5UJWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3MiBTYWx0ZWRfX89+HcHImgg/h
 BxtN+uQWURCfpZnbFoqCcvcaU1aDvq9Belqx8z+704RwegjDxKs7O6oYDS29rE2exH3pOBxYFJb
 vHYAuJWRL2kCgsh9vyI+jhcXpNv2Z+U4rIyZJQpbM2Ze/32p7Fee0NCpH9wm5ml468KcRDAh6TJ
 M8xap8Rx/8iKsXZ64++p5WskyzocYbV2IH10mLtB/St8KvZa3YOnfAD8tlHgYz4r01T9msvBJQK
 bY/THHhFDmxkeuK4E90LGpAnwLPYnBJBIlexJtp2k1cFDEr9cVCChB4daqnIDBfI4nLmUlqrBhF
 T/ItpkTvwnchhCB6d3ppELlSr3VJaX+pzdBR5vGrozX2WQ96jazGNiU1z6NEbo/IbhnInWW6EJg
 6AJLF2D3WgOe13spYofSneZyVc+xOZaH4uQ1TrQBemWqFOdxjO36pF5op+4jjSxfc8sEXlqqmtG
 aU8sgkC6y4J+MCHBm5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220172
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109368-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D5005B8265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 5:04 AM, Bryan O'Donoghue wrote:
> On 21/05/2026 02:09, Michael Scott wrote:
>> The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
>> to support the camera pipeline in parallel with the normal Linux
>> desktop. On a freshly-booted system with GNOME running, the typical
>> runtime consumers — msm DRM framebuffers (Wayland triple buffering on
>> the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
>> pre-allocated buffers — already occupy ~100 MiB of the pool, leaving
>> only ~25 MiB free.
>>
>> The libcamera "simple" pipeline handler used by /dev/media0 on
>> dell-thena allocates four ABGR8888 frames at 1920×1088 = 32 MiB total.
>> That request fails on the fourth frame:
>>
>>      ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
>>      ERROR Allocator: Stream is not part of /base/.../camera@10 
>> active configuration
>>      Can't allocate buffers
>>      Failed to start camera session
>>
>> resulting in gnome-snapshot's "Could not play camera stream" and any
>> other libcamera-mediated app being unable to actually stream.
>>
>> Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
>> typical 27 GiB RAM) leaves ~150 MiB free at runtime — sufficient for
>> the libcamera buffer set plus headroom for video playback or other
>> CMA-hungry workloads in parallel.
>>
>> Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
>> GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
>> camera cleanly, and `cam -c 1 --capture=2` succeeds.
>>
>> The companion board files dell-inspiron-14-plus-7441 and the upstream
>> .dts variants inherit from x1-dell-thena.dtsi, so this changes the
>> pool size for every dell-thena-based laptop in one place.
>>
>> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi 
>> b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>> index d6de4da02dcd..714988a81384 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>> @@ -167,7 +167,7 @@ led-camera-indicator {
>>       reserved-memory {
>>           linux,cma {
>>               compatible = "shared-dma-pool";
>> -            size = <0x0 0x8000000>;
>> +            size = <0x0 0x10000000>;
>>               reusable;
>>               linux,cma-default;
>>           };
>
> How old is your version of libcamera ?
>
> With CONFIG_UDMA=y you don't need a contiguous memory area at all and 
> you will get juicy and delicious GPUISP.

I have CONFIG_UDMABUF=y enabled.

>
> Instead of allocating in the kernel just use a better version of 
> libcamera
>
> ┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 
> 21, 13:03]
> └─[$] <git:(0.7.0-multipass-v0*)> zcat /proc/config.gz | grep UDMA
> CONFIG_UDMABUF=y
> ┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 
> 21, 13:03]
> └─[$] <git:(0.7.0-multipass-v0*)> cam -v
> libcamera version v0.7.1
> ┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 
> 21, 13:03]
> └─[$] <git:(0.7.0-multipass-v0*)> qcam
> [68:50:10.493478857] [438859]  INFO Camera camera_manager.cpp:340 
> libcamera v0.7.1
> [68:50:10.511134091] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
> 'ov02e10 10-0010': Unable to get rectangle 2 on pad 0/0: Inappropriate 
> ioctl for device
> [68:50:10.511201590] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:402 'ov02e10 10-0010': The PixelArraySize 
> property has been defaulted to 1928x1088
> [68:50:10.511206069] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
> 'ov02e10 10-0010': Unable to get rectangle 1 on pad 0/0: Inappropriate 
> ioctl for device
> [68:50:10.511209559] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:413 'ov02e10 10-0010': The 
> PixelArrayActiveAreas property has been defaulted to (0, 0)/1928x1088
> [68:50:10.511213778] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
> 'ov02e10 10-0010': Unable to get rectangle 0 on pad 0/0: Inappropriate 
> ioctl for device
> [68:50:10.511216590] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:421 'ov02e10 10-0010': Failed to retrieve the 
> sensor crop rectangle
> [68:50:10.511219559] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:427 'ov02e10 10-0010': The sensor kernel 
> driver needs to be fixed
> [68:50:10.511221746] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:429 'ov02e10 10-0010': See 
> Documentation/sensor_driver_requirements.rst in the libcamera sources 
> for more information
> [68:50:10.511327474] [438863]  WARN CameraSensorProperties 
> camera_sensor_properties.cpp:538 No static properties available for 
> 'ov02e10'
> [68:50:10.511330599] [438863]  WARN CameraSensorProperties 
> camera_sensor_properties.cpp:540 Please consider updating the camera 
> sensor properties database
> [68:50:10.511334089] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:617 'ov02e10 10-0010': Rotation control not 
> available, default to 0 degrees
> [68:50:10.511340912] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:502 'ov02e10 10-0010': No sensor delays found 
> in static properties. Assuming unverified defaults.
> [68:50:10.512362985] [438863]  WARN IPAProxy ipa_proxy.cpp:196 
> Configuration file 'ov02e10.yaml' not found for IPA module 'simple', 
> falling back to '/usr/share/libcamera/ipa/simple/uncalibrated.yaml'
> [68:50:10.512372828] [438863] ERROR V4L2 v4l2_subdevice.cpp:1192 
> 'ov02e10 10-0010': Unable to get rectangle 0 on pad 0/0: Inappropriate 
> ioctl for device
> [68:50:10.512377464] [438863]  WARN CameraSensor 
> camera_sensor_legacy.cpp:881 'ov02e10 10-0010': The analogue crop 
> rectangle has been defaulted to the active area size
> [68:50:10.512386578] [438863]  WARN IPASoft soft_simple.cpp:104 
> IPASoft: Failed to create camera sensor helper for ov02e10
> [68:50:10.512505275] [438863]  INFO Camera camera_manager.cpp:223 
> Adding camera '/base/soc@0/cci@ac16000/i2c-bus@1/camera@10' for 
> pipeline handler simple
> [68:50:10.548026157] [438859]  INFO Camera camera.cpp:1216 configuring 
> streams: (0) 1920x1088-ABGR8888/sRGB
> [68:50:10.548323081] [438863]  INFO IPASoft soft_simple.cpp:258 
> IPASoft: Exposure 1-2242, gain 16-248 (1)
> [68:50:10.548402247] [438863]  INFO SoftwareIsp software_isp.cpp:278 
> Input 1928x1088-GRBG-10-CSI2P stride 2416
> Zero-copy enabled
> [68:50:10.636862424] [438866]  INFO eGL egl.cpp:288 EGL: EGL_VERSION: 1.5
> [68:50:10.636899299] [438866]  INFO eGL egl.cpp:289 EGL: EGL_VENDOR: 
> Mesa Project
> [68:50:10.636902112] [438866]  INFO eGL egl.cpp:290 EGL: 
> EGL_CLIENT_APIS: OpenGL OpenGL_ES
> [68:50:10.636904768] [438866]  INFO eGL egl.cpp:291 EGL: 
> EGL_EXTENSIONS: EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sync 
> EGL_EXT_config_select_group EGL_EXT_create_context_robustness 
> EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers 
> EGL_EXT_query_reset_notification_strategy EGL_EXT_surface_compression 
> EGL_IMG_context_priority EGL_KHR_cl_event2 EGL_KHR_config_attribs 
> EGL_KHR_context_flush_control EGL_KHR_create_context 
> EGL_KHR_create_context_no_error EGL_KHR_fence_sync 
> EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace 
> EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image 
> EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image 
> EGL_KHR_image_base EGL_KHR_no_config_context EGL_KHR_reusable_sync 
> EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float 
> EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_gl_interop 
> EGL_MESA_image_dma_buf_export EGL_MESA_query_driver 
> EGL_MESA_x11_native_visual_id EGL_NV_context_priority_realtime
> [68:50:10.643064652] [438866]  INFO eGL egl.cpp:332 EGL: GL_VERSION: 
> OpenGL ES 3.2 Mesa 26.0.6-arch1.1
> [68:50:12.667202273] [438866]  INFO Benchmark benchmark.cpp:89 Debayer 
> processed 30 frames in 228802us, 7626 us/frame
> ┌─[deckard@inspiron14p-linux] - [~/Development/libcamera] - [Thu May 
> 21, 13:03]
> └─[$] <git:(0.7.0-multipass-v0*)>

Good point about the libcamera version. I debugged this on Ubuntu 26.04 
(v0.7.0+patches). I tried testing v0.7.1, but it caused a crash due to 
API changes with other parts of the subsystem.  I checked the diff of 
upstream between v0.7.0 and v0.7.1 for the dma allocator code and I 
didn't see any changes, but I wasn't looking at the software ISP changes.

This highlights that "I'm doing this wrong". I'll move to a cleaner 
rolling distro where staying current is a lot easier.

The GPUISP support looks great!

Dropping this patch as I'm not understanding the full allocator story.  
Sorry for the noise.


