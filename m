Return-Path: <linux-arm-msm+bounces-110019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFjNJx9PF2r7AAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:07:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB95E9EDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E72F6300D9D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 20:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E1E3B4EA1;
	Wed, 27 May 2026 20:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ldz+jpSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoktqbaI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689F33446C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912440; cv=none; b=U7RXiYQyEuezWUsWZdBiU4P5DXci3sH1d6m2RyNkigJIx2+KTM97dssXavMGL5HbnxvDWFiY6oh70D9ZH7ncAsNYOWLPxIqQfx7jZHCBFzgO+9ZjPYjecOtXDeIVvAIEsnNf8cus0aUlY8AozeGb0YdmuJyOIps+y9B1/1S0GEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912440; c=relaxed/simple;
	bh=fjrpGqBSBTKl1ijnWOQCxINJXrqtw7GaycdDQkmpm8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BB6ncN7zyVxNN+TnNZlEWE6ek+0zywCS6inHc9NT9XaRJuqbpSQzj7I4M7r5SyN3xANYWepdbdZm63DtQFbocGUWjMkwJt2U2KixIfSOFEt67wGTtnoY6ytPJgiDbwuYMwXvwq+4DLXvDPdwY1cpxWC9jBBkrjVWaxwxwGOx7YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ldz+jpSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoktqbaI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFLgVE879288
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYNjxQcCSvYU6+1FueqgSrFzwpQgaet5EeASApuehzI=; b=Ldz+jpSOyS1wu2Bc
	ueaZniAnFBvtHLlYfTZnUavp9F7iUfpZma3GFIItIaC5tWH1hGzZcyFCnk5FVM/v
	wTbvhcDtRfmC59Ed6w5sxw4onlcHcyK9qXS8xYYhQ0OG88rCmHiUyWhbjXBP6H1w
	2skDJG1miRbjPWosmBT68MDryGa+KTGDeivqN3qcm1hM+h2XwFk8VjUbqOd+vEXC
	Bjn6Gfbso4QE6+lyC3T1sWOu4k+IWtzJdHfkWUlKiNjerLYno6BkZdHaFDt+StLI
	M4tMOi9mQZ41BF8fcU6QotU73dJlojN3l2XoBV9+hyRwPJYdp4RsIm45eEsKo5E7
	1UhhtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqtr5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:07:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc6899bfb1so128657865ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779912437; x=1780517237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYNjxQcCSvYU6+1FueqgSrFzwpQgaet5EeASApuehzI=;
        b=DoktqbaIYm8WMzeMmiMQJ9kkIOZOgPuvqwQ5Bo3fmKEgWP5XnM6wLJKm+Yst2zW0fy
         7ncppeAn72MVBxQgb4LTufAw5lde56GNnleT6Abm1yAzwzi9FTOl0no/YjSKjgga0Rlr
         3wXIa6j5mvGirg3epXC+/rKaDhwNfxSc18OsrAixZg+hwqbpf9EPxleHDpsmA3Lz4CG+
         LfbYN7OttDE3hf17+YV6SCLJVZncrZogB1CYtkrHp7Ryl/ROf3xNWaQtQgkPktg1yNJn
         ex1/UwaG/rWhYOYMPp+C/XPHbokz6uRK059k/eWAb/8dGLr0SuE3vJM39hjhinuXS5Z6
         L1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912437; x=1780517237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYNjxQcCSvYU6+1FueqgSrFzwpQgaet5EeASApuehzI=;
        b=KTOliO+jQa4vf0XhMeSktHznDWsi+AHMlFISDU67JVu0bLDKNCfa2KLsZ7icmF5uJX
         mTEle10Ffs+Sf+GQvjgdNu/IbEAjhxtDLppLxstKzcvXpmW6i8iNYXIQq5TmQSbqQg/F
         Tm9gydhXi0+8/568oYKAyx4H225FIU942j+AIH3HVBAqxnlCIJbzTzr6bk0uNmzVErqU
         lK20MS+UNHAlqTNVCuaDVfzUA5TnGUvTsWjjqQU1dXISMCjz7hjxzJiGCvhVhial3E/l
         +kF4Vgmok86DEiDFTUsoac13XXF6HKYUlWB5L9Ye7Gj94xrdWYw23+jOoDWyEAuTT3xu
         MV6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/edqZEYyFEXGNo8zvuCPQWPkvdVb7MWqtNpopxWWaY+ByRyHU106HyyEhDWixudLqTmq84b8qeiEU8CZYy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1UShNUwowPvBaIbnsFC4Lx/Oe3zfwDl5MhtsemBZL7yDKFBzf
	Wfr2CPIOHUnX0Ni+q2xwL8A7x63OhBYpzhL2p7W4aEkGzTWL22l0L0TWdrpDldPTCkM5p0INz6a
	5BNFlt8711QRryw0Imbru35I6Q/UUL4IOnHmMUDusDhOTjwkNcLULCXofs7tBLrUTrf12
X-Gm-Gg: Acq92OFRTS2qSlC4/V87na3FPRjPKACUA7sdfDNq/BKcfxvczBrZYC/IEAvVOEEzrrx
	Hf8phFebnWT/ONbsVHb7ai55HyI5wUgvNX6N8G8OFxixRnOZHz/uq+wjjY71GR3ZSOwILfWMPyB
	/WpAEdnhptCa+kNskSoxT8cnGAolEpu7hGEFqffyPb86LZOCfNM88wLE3t8tBPIsXSWLRqi9w6/
	hRMCrZPAr0pfa3nPT8wt0+VoZ2jJB/5w+Edk+owd+MiWgcNL4Ygln0Hd4Z3yqoRp30TtWmXaHPO
	vrUk8fejqh6sT2OXicMw/o62RnHGGb0wKjlixgLL9TFtw9bsLIkq5BwA44BlKUULD92z9xPHM9h
	xHNpyhqEtrU5P2CTHDlir1YOziFymdHH3P52pWgg05gZWcR3RYX8/
X-Received: by 2002:a17:903:46cb:b0:2bc:f3c5:ff0a with SMTP id d9443c01a7336-2beb060dda9mr261787095ad.30.1779912437399;
        Wed, 27 May 2026 13:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:46cb:b0:2bc:f3c5:ff0a with SMTP id d9443c01a7336-2beb060dda9mr261786325ad.30.1779912436658;
        Wed, 27 May 2026 13:07:16 -0700 (PDT)
Received: from [192.168.1.5] ([59.94.127.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5900b8bsm158088605ad.76.2026.05.27.13.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 13:07:16 -0700 (PDT)
Message-ID: <25812e14-d691-4e15-8fd9-82cacc203eee@oss.qualcomm.com>
Date: Thu, 28 May 2026 01:37:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
 <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
 <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
 <9a999b51-8131-4032-82c3-72d7eccbd222@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9a999b51-8131-4032-82c3-72d7eccbd222@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDIwMSBTYWx0ZWRfXx6V+QtrtYRLT
 HX6kVThGbTthhz4p5l571SFA3bvTm26sG4CwOHJ2NH7+P8bXPEBFhSuGUQjKZyIcCFY3Igynmc4
 9aadxkyC4piAZ4GZ1ahMIBCfmgFrUBjhl81uTKURbeA1OyBouFHmffqCU1s20G9+VbLRdfx2lFJ
 C8TbqwHI1AE3uI7AAsfjrCkGgyEMH297nVccu26PD4f0dZzkU3KMXJZG2iQcLldiFNQL7MfUrrn
 iUSWoxbVqzHJ3PeatOI3kWImSxmJZXCoq6x94Y6oIyz6EOy0v7cm8hyfLvJgDGy6dMRi16LnQTD
 AdSjZ86AzXS1w0/n+PObpfaSSgtfogdWQmDY7j15CVOHvNmFtdEMfddxsyTo4Sz4+IKwVcdl/uV
 81UKOOXrIfXDfEneDThIvO6h3x4JtpLYZyTjPYMg5AuiOc1sdIlX6gSJFcsv0J5u5K3Gth9L4K6
 k8A5ySJLyTX2hZvEM0Q==
X-Proofpoint-GUID: ThHzYzJnL5tPzvUPbXS4CnNi5Cz2FXyu
X-Proofpoint-ORIG-GUID: ThHzYzJnL5tPzvUPbXS4CnNi5Cz2FXyu
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a174ef6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=WNRV5uGD5AkuWIfm3QAnlQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=U9EV9gB3usZ6apLK0C4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270201
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-110019-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FFB95E9EDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/2026 3:11 PM, Konrad Dybcio wrote:
> On 5/22/26 11:39 AM, Konrad Dybcio wrote:
>> On 5/20/26 9:38 PM, Akhil P Oommen wrote:
>>> On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
>>>> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>>>>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>>>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>>>>> the A8x family.
>>>>>>
>>>>>> This series is marked as RFC because it depends on a few other in review
>>>>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>>>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>>>>
>>>>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>>>>> review and has been applied.
>>>>>>
>>>>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>>>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>>>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>>>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>>>>
>>>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>>>
>>>>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>
>>>>> For the rest of the patches that doesn't have my R-b tag in this series.
>>>>
>>>> Unfortunately patchwork doesn't capture tags from the responses to the
>>>> cover letter. I'd kindly ask to spam the list with individual r-b's.
>>>>
>>>>
>>>
>>> There will be another rev to remove the RFC tag which will hopefully
>>> have my R-b tag. ;)
>>
>> Do we have a resolution on whether the proposed fuse values
>> are OK for this platform?
> 
> Ref:
> 
> https://lore.kernel.org/all/oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me/
> 
> Konrad

Yeah. this looks fine to me.

-Akhil.


