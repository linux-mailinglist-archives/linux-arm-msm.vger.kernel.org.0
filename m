Return-Path: <linux-arm-msm+bounces-87950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC6CFF9FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 891AE33DC563
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6112834B198;
	Wed,  7 Jan 2026 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTpEgJXx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7+bqS7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384334B191
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810334; cv=none; b=nmlePh5GBBuB7SXH7EMfXr9o5agcDz8tWkHOvyIUhCmNDhzdayw7uko0BrisyFRBXiSeDXEdq+1AS5PzjeFnv2ExFkfBDBRfKFTHuoeWnTdsLdU/LX7XvAaZfJl4eEHKxgOQH4VvglyeeVJNs89zoOJu0pUdCpMNGPB1ZKAxl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810334; c=relaxed/simple;
	bh=vmHz7AdKXekh6B5BnPe/pPGBiGFpwRkvtASFzJtYyv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HV7T8BHy7oazsexREedDxncYuEFGgqmYbu/S00UdvOOLXOTDffBy6ng0LzcFWDcDJkCzhveXTCJpuYVYpTN0EPJH0y/RI+YVOMchYQ+N5O54B+ACEbNa1p7ZflMJtu9rrGvr444hwKoiR4vVD3vPFE6FT4kZ3IoZskPrpglvUTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTpEgJXx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7+bqS7M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HctiW2593363
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 18:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zyEta6qSo9ogUjLix7zMK7X4kwhSaxFV32Ej4UwDIGI=; b=aTpEgJXxl9iktJw2
	fDoHW5+B3jzEDw0DfJu+BqTBh8xUtatlb2uynSgTFYj46Z5JlxcoyUgrMC9Ls2wE
	vinFZhtoFeInearVCB9qnfQPSURxHnROpDG2bZY+8pzmwiPdHD0G/CCyfBk5wZAz
	5abHiMnRCdFxhfAz9gNYLufMAekPMyIusgcPIxgv5gM+cSYh4yltWbbIrpKjAiks
	/cNY4z8z+4KR8RFX7l5jJ+jZ3zMhCusRWQ8kSA3dUaBfaypdb0INohCaIa3AITGH
	5FPFkxNzzwdizIvFUxMB0DSd6M0xWsvBNd+K0xmSCUvUZZpsN7DmoFtymAgU9IhP
	z0HFZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn291p3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 18:25:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d59f0198so26600975ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767810321; x=1768415121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zyEta6qSo9ogUjLix7zMK7X4kwhSaxFV32Ej4UwDIGI=;
        b=L7+bqS7Md8ZhR3gksuTNJNv1yjZL9LDLfveY7JoarHWJTZXbQKDV6u+wNgsY2qaNQO
         LycpGqLpXpkvhzl83GXqqcsMsc1YzO0AGmOwUPydfWPYRyMPMghRXT7dbOIorLCLHMrE
         ZNEepRKcGU+qSDSGmab04VStZzRJa51kORtBWuUBXGPWrS0ZgwJi3QVi6qyRYI0tNg45
         vbY6o6CrIaiTToMgz9DtNJ+SluTeIfNJpIZyXBVdIb44hr190TDEOhxBE44nHpsKZGoK
         plHJYSGuQ1qnh9GJXhLmxlmhyKpSv8cMP6lQTMtoOmrSVWtLuHGFWiUEADf0nEu9cpt7
         w2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767810321; x=1768415121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyEta6qSo9ogUjLix7zMK7X4kwhSaxFV32Ej4UwDIGI=;
        b=dwMdioaPqwZX1WQoqW+kT4dHeQEKtTwCleJ8nb8dEeVm55/bYukazp7W0h+ffqSTJR
         rj1CI/ciJ+miFc79J21tWKOegxRxhlcxVLoXFA29uSujnWPQx4Bxu6HInP2uDe+3Y3lR
         bXvW0TxhiW4ZCNaEEXGPeuld4v7cR6rwcuffWrwQ04K0YjS8+BNGAjtzZCxF5RU926/s
         hPe+FZr8E0YnRfM2m7r7aC4MvYQdfgt2ioMMouhKIAGDNZ/IDrqAIlZpZ3loMnJ+g9sQ
         V86vawhMSSp0yF3bPgglB9KUjADe/FGdvJ7VL+l70K420d66OS2aTrmR1Q1HjJBQyFyG
         GTGw==
X-Forwarded-Encrypted: i=1; AJvYcCXDcABxzAdWXpumSSh7MZ05EBy1IHOMQeywBAtOJXo8AJ5tZt1OD1oArEK1glm/8WslE0AOXcRT0sOmnuYS@vger.kernel.org
X-Gm-Message-State: AOJu0YzZI9P7Ju9e7PQZl4YgDwjsrrohVR32lwZAfhKoH3mWEc9dJZ3G
	57FqS3aOt01X3bhSvm8gdZ1iUwD6rjytVU0yqAqxQ0DrJF2BOslEFBDWnavPp8KjjZVX5ScVjb6
	kxmwH8lqT6wCuOFTpWARooP6bvCaOM1D9mnMGvPWZTNo2RgWeFhTIXq+UEn9Kp8m+6W6a
X-Gm-Gg: AY/fxX6NKTQJDckrYJZfmSkdvP2Fek3CBNJ4q0AtDii7/TzzewwgxsYSKIVdEkOkapq
	RBqQdYAp1xM2ord5QXfaS+22NS0DBF2Pj8RODes78q/FA7ya26ZxI61DJhjuFBEAzckAvOEWi6M
	l1xSsVga1GldDuz9VmqexiOm/mCXQ1D2MgeP8IEaQhmaww6+Yr/bGt8buTVmLEEH2rMX8dLY9Rn
	hPp9qNp5iLWYhI3/AyYr8ywsExKfKJ7V/jUX5MY426RK+5FTNEn+5UrbZWZAOB+MvRvZDuOWjLx
	dLrKYq4r0njBfTODmX8XFH2X+MZGxCPBE/+1TWZXYSIL8ZCSrYN7jlVi5TwX3V64Yl52ed4lJm/
	CiksPDU19uWN70tX2RrvwHmlcwczn8n6jFVf+q6JcGS5Uu5hFXA==
X-Received: by 2002:a17:902:db11:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a3ee4c2efbmr33516525ad.47.1767810321466;
        Wed, 07 Jan 2026 10:25:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfHrr8KjmgskM6tzkI1fufrRVJjhzck7KWftUvD8noNaTImoMFpsm27QF6u/kaeY+q/8yS6Q==
X-Received: by 2002:a17:902:db11:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a3ee4c2efbmr33516275ad.47.1767810320858;
        Wed, 07 Jan 2026 10:25:20 -0800 (PST)
Received: from [192.168.0.109] ([183.82.31.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c5ce06sm56105135ad.44.2026.01.07.10.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 10:25:20 -0800 (PST)
Message-ID: <21468f66-56df-43ea-99c2-7257d8d6bb7c@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 23:55:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, mr.nuke.me@gmail.com,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        varadarajan.narayanan@oss.qualcomm.com
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
 <12223416.nUPlyArG6x@nukework.gtech>
 <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
 <7f6754a4-4a3b-4b6f-9220-a1790a9ba393@gmail.com>
 <f9adaaa2-1672-4246-8139-93f9c220530a@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <f9adaaa2-1672-4246-8139-93f9c220530a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hD8ZYCzPyddf4qXDocnAiYgUNOgCnQWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NSBTYWx0ZWRfX0n0iYeCijIhl
 4Z6ZwXel0/fLS7wS5ZCW/uOnWNSsRu/rjwc0jxxSSN0Y8DqyWH645JhFkg06TFFiNXYQvRZVip+
 HnmNYcHKuhXlTcxhAkIY1laDWhoNumOZNxr7tQrdymhM+0p98C7EdBBvuIEWDZ9FDwIdVLTWfm+
 BRm0AGTIxquW9l/jggfHoB9uDcMp7Lih92+AnfIdoB/qnK1Pi3fM/KYKtMTxKZ2U7IFdnfkkWbB
 uc0zZaDlOhSOar60K1FTvffQWKCOVer2xktqoQIkP+xIF4TPo6DtYc61Es5xhMH+aAcgCZFK7H+
 DnMUDpjrsTS5TiptGdQ5TUadtlkGcLu6O9B65r2eZPYQMvoxXPJfhKcedsEvkwIqT2LwZCv7hpi
 Mtiq+h6RUbAPJ/qZjwAYITwiSsbqtt55fgK3tfzbmT5e2EWrjxBS2QmymFUoohsBAsXw9RiyruA
 eb3Imm0R0ZjkVPxm7pQ==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695ea512 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=V6Ol1F/91haf34TWKFX4Fg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=-gmn0QAXPwOg_dpREwIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hD8ZYCzPyddf4qXDocnAiYgUNOgCnQWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070145



On 1/7/2026 6:56 PM, Konrad Dybcio wrote:
> On 1/5/26 5:09 PM, mr.nuke.me@gmail.com wrote:
>>
>>
>> On 12/29/25 6:35 AM, Konrad Dybcio wrote:
>>> On 12/23/25 9:21 PM, Alex G. wrote:
>>>> On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
>>>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>>>> Q6 based firmware loading is also present on IPQ9574, when coupled
>>>>>> with a wifi-6 device, such as QCN5024. Populate driver data for
>>>>>> IPQ9574 with values from the downstream 5.4 kerrnel.
>>>>>>
>>>>>> Add the new sequences for the WCSS reset and stop. The downstream
>>>>>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
>>>>>> using with the "q6v5" driver because all other parts of the driver
>>>>>> can be seamlessly reused.
>>>>>>
>>>>>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
>>>>>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
>>>>>> register. The second set of clocks, "clks" should only be enabled
>>>>>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
>>>>>> tries to start the remoteproc will hang.
>>>>>>
>>>>>> The downstream kernel had a funny comment, "Pray god and wait for
>>>>>> reset to complete", which I decided to keep for entertainment value.
>>>>>>
>>>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>>>>>>
>>>>>>       struct clk *qdsp6ss_xo_cbcr;
>>>>>>       struct clk *qdsp6ss_core_gfmux;
>>>>>>       struct clk *lcc_bcr_sleep;
>>>>>>
>>>>>> +    struct clk_bulk_data *clks;
>>>>>> +    /* clocks that must be started before the Q6 is booted */
>>>>>> +    struct clk_bulk_data *q6_clks;
>>>>>
>>>>> "pre_boot_clks" or something along those lines?
>>>>
>>>> I like "pre_boot_clocks".
>>>>
>>>>> In general i'm not super stoked to see another platform where manual and
>>>>> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
>>>>>
>>>>> Are you sure your firmware doesn't allow you to just do a simple
>>>>> qcom_scm_pas_auth_and_reset() like in the multipd series?
>>>>
>>>> I am approaching this from the perspective of an aftermarket OS, like OpenWRT.
>>>> I don't know if the firmware will do the right thing. I can mitigate this for
>>>> OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver
>>>> and firmware together. I can't do that for bootloader-loaded firmware, so I try
>>>> to depend on it as little as possible. I hope that native remoterproc loading
>>>> for IPQ9574 will be allowed.
>>>
>>> These are two parallel questions. I didn't even know that the bootloader
>>> preloaded firmware on these platforms (are you sure that's the case?)
>>>
>>> qcom_scm_pas_auth_and_reset() is usually preceded by qcom_mdt_pas_init() +
>>> qcom_mdt_load_no_init() where *you* supply the loadable firmware for the
>>> remote processor.
>>
>> What I mean is that the init sequence is implemented in the trustzone firmware which is loaded at boot time. Irrespective of what Q6 and M3 firmware I supply, if trustzone doesn't cooperate, I can't start the remoteproc. I don't have that problem when the init sequence is implemented in the kernel.
> 
> The TZ will always "cooperate" in the sense that if you supply a valid set of
> loadable firmware files and allocate a chunk of memory, it will power up the
> remote processors. I wouldn't imagine any software release would have ever
> been approved with this not working (given the SCM call is marked available).
> 
> It may also be that you have something else in mind, but I didn't quite catch
> your concern.
> 
>>> The init sequence provided by this interface will be at worst identical to
>>> what you're proposing here (except abstracted out), and at best containing
>>> some fixes and/or workarounds that may be necessary.
>>
>> I think this portrays the TZ path as somehow superior. That's not how things work in my use casee.
> 
> Indeed the sequence baked into the TZ is generally to be considered
> authoritative.
> 
>> The bootloader/FW versions depends on when and who made the device. So while the newest TZ from upstream may have the latest fixes, I have no guarantee that they will be present on a given device at runtime. The best solution I found to get consistent behavior across devices is to do these sequences from the kernel. Is there something incomplete in my init sequence that I can fix?
> 
> Because of the complexity of these systems, it's absolutely not inconceivable
> that a fix/workaround is only necessary/desired when coupled with a specific
> TZ (or other proprietary component, such as RPMh) firmware version (because
> many HW settings are co-dependent).
> 
> I can not answer your last question.
> 
>>  > Please try using PAS and see if that works.
>>
>> I found the v6 of the multipd series [1]. It needed some minor adjustments to compile. I went as far as loading the Q6 firmware and starting the remoteproc without error. I did not test any further.
> 
> Please give it a shot.
> 
> Bjorn, Vignesh, do we see the multipd series going anywhere? It's been
> last posted in 2023..

Hi Konrad,

multipd series was dropped and replaced with WCSS secure PIL driver [1] which is
currently in v9. I see that except the actual driver itself, patch 3/6 in
the above series,  other patches in this series has a R-b tag.

Once this gets reviewed, it should enable secure PIL loading using the TZ interface
for WCSS remoteprocs in IPQ5018/IPQ5332/IPQ9574.

[1] https://lore.kernel.org/linux-remoteproc/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/T/#t

> 
> Konrad


