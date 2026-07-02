Return-Path: <linux-arm-msm+bounces-116029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vt9/IAZgRmpGSAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:56:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C21CE6F7FD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:56:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ofOsqDiF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dzTUQ6kA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116029-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116029-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A1F7310EED0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151F1480DC9;
	Thu,  2 Jul 2026 12:44:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F17425CC3
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:44:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996289; cv=none; b=Y0jamfd1ZXB3V2kv+dtq0xxif6tdhxSRFi8mT/uj7VFA2IQhT5cgj9nBAM66PYNInMo2kWZ9vj9zlZIQedm3Fd1mAiagvmeBaRRLcXUuVDkSyeTwwmoSKvBQwWOzS2JRtXWe040VnnhZ8IIlX0++6N7hF4d2nUxaASa6bUbw1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996289; c=relaxed/simple;
	bh=M3vT7WHrqcyejJBhB2rh+AJHUnKETdP4JrfL0b19uc8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=r8Zn7O0wlY2wmJbrfZc7hWL4B46pR/nMi4pk3TUq7ADiDXEoH3miUFxX8Cd0XYW24rIkA8mblJeOEv9vJKZjJxFI/LYfjDgVIEfqW7BXpBbxrezygYXUg8z43ijd7waMEoC3BzwM20KR4Ticv+IgpJrz7mlI4iA2aCbJm/spPuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofOsqDiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzTUQ6kA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nOC74139519
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1ZbIlmrnZBF09IpMi+cBnqnyYuuLrnreaKCM9hEs4M=; b=ofOsqDiF5W5H4TXF
	PKVn4pHc19o2vqLMRkQmtkUMhC8SrYqHjoehuBkMHQZNpSJMDYeMzOTpFZ37c1gK
	33LcQhjatOM+TNUYG7pCnQzlJN1MApA8hjGRSog1gEuJVWMqfBg6PTXrcatth3Zi
	9x42BtelPEXrT4B6bi4Yy7TDmwgUOewYkJS7cUg+CrXRDJR8wR3aUCmJ5OUPGcD2
	nDiVhv+yfI/A3zntPheW0dQM0D0OJ+ltQJHiEG7C66tZexPu+kD7DUssgHnFuMAX
	NFA/jJFo/X6rFvqsXH7Du3dukrTrRBbMOVodRIybwT8qmHVK7eEoscilcKu5HqA6
	d6Iyog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr8n9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:44:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e59d97df1so28381185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996287; x=1783601087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1ZbIlmrnZBF09IpMi+cBnqnyYuuLrnreaKCM9hEs4M=;
        b=dzTUQ6kAGfYVLq9oXIcbTb60ynWvg62EXPBtth63LLTqoFd8i2GZMyg9EI1AT8x9HR
         TzQz6JV1mvDHXI90e0d1zuJCoI6uhhBnJDjVVdcBoDkGTONRZBnbwBhkP6qE4gfAPD5h
         dnplvLaziJQAJSROG5+U0oJ/9S7XANIFG728UZY5suC3cl/O/mA7lEGUttfWdCo/PC/C
         3aeHgo9IMqaaFMG3VKSzYCJpsTU53jWc7yVs0kxWDeoNYgy/i2JUyraFjiIliGEZeHwR
         70LKJNb7HXe8Qr2GqccfWPLq6fnvVSoqEb4UzNBucRrgCS1N8JZjmEyBfVCxmK6a09BZ
         Hv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996287; x=1783601087;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1ZbIlmrnZBF09IpMi+cBnqnyYuuLrnreaKCM9hEs4M=;
        b=dvUEuvj1C0aia4hbL+/lnQGHzp51AEYyEk0LjZk/CVpbEeluomGpp5GS1sHMLf78B8
         oaOGgKp2Qqq2ZjZuBHWCudioFACu/TTjgxBvkOD2jZp8KuufYUww191fsVcg2iPnf+fN
         S8DByXRuLUl3T/WasdVbP/hQY+Fw2krxMBcLC2HVkkMbdu+R9dPyp8x2hrKMZZ0YpGTh
         Dy9/g5dKzul18pss2Naa5BbWuamqTion0PjSv3g8SNM45KjRKbNxtcocKXBFU+ZMnHru
         KQc+2atXzDMhpGmMWr5XQQE/houuarxhl51scNmX8MldEfBWW4BjUl37Yq3unc3EkTpE
         4bww==
X-Forwarded-Encrypted: i=1; AFNElJ+3ZENgcZ+aTwH0RM5M0V1uhGS7xb+P8lVDbqX1COGbdLQJxegCTfo5Z4cl3Ghq0/xpwEhrbWPaP/d+wXlA@vger.kernel.org
X-Gm-Message-State: AOJu0YzQVmeiKalZ5kzTvd8J10xFhOAj7MHheFhjX/F7QPr2ZrbWRrYU
	n6OD/fOJOqPOFp3zYVtFTrztNy+vFR0k64s8hfzh8dn267DQRmGg6g8D5tEhn4t6pY/N8zAE2qB
	53QPyJvTnDK1WfNtL+M9LeiZTExjbi3jPHCtiHcZgFSZFdlHHbAQA6XWrI9EKwxmWz6ou
X-Gm-Gg: AfdE7ckds0ec5drztyCreiF6kd9rdA526Md7aTarTbE7/gaGDHnhJuijXgussb9OLz6
	t725BXUxbb3ZfWqLslz23+2JbmCRJiyEk13ppsgaQa7sJz8biIHdhn9cgVclro3WlZ4mL+3tRXp
	ZR/QhNTCx2TuFJmdBKjgikphjkCBRT8sqvEGx0a5TEZIyKxwwr2GLnGcgNNm52LNnDglTr0bJpy
	GwdAsc9BqlZPtqL0VfG6JrUkyFdAZvQeORE/X0tIdNBEPTyZW92BywIUzu9pDaTeO8mfJ2/mYfM
	yMtT0MfylQ7+hI4Bwd1b9zcKR/UMJQnH/rXI0zPlvHvNfTDtoYf1XZcRjVwcoNCqbzYxNQWPjzr
	JAJbmwdt2HbYmyFjRmCMg1FEQqoiaUp0RtMU=
X-Received: by 2002:a05:622a:14d1:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c26b42202mr46905721cf.11.1782996287020;
        Thu, 02 Jul 2026 05:44:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c26b42202mr46905361cf.11.1782996286440;
        Thu, 02 Jul 2026 05:44:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ace16064sm936580a12.2.2026.07.02.05.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:44:45 -0700 (PDT)
Message-ID: <6fbc4521-15d3-40c7-89b3-ee15ad673ff8@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:44:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
 <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
 <c3922558-dead-48b9-a49c-7d0d6a2dde7c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c3922558-dead-48b9-a49c-7d0d6a2dde7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dKx22wj93IyPUoUkkEkrwZ5gTb-3ptfz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX3ktpMLvTpY5J
 ZaQN7ydBD0SMEkFMEIy2RGK/zjZ2dWZI21Nagmzm+nkoTN23wjSt7lx+MxBzjkScs6wHakMXEKM
 ZmtG65EEJNpjvg9PCG5325+8xJQxXUI=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a465d40 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wzztfOLjYvU_j_VJg8EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dKx22wj93IyPUoUkkEkrwZ5gTb-3ptfz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXxTh0+OysAPpV
 JmK4rj5BRgd2PLT4Dy93xxV0cfYBP+BYax0FoKOMxLNeCsLjXzTfv2SSwHB5VW7Ie8sIjFxSdf9
 ze+sYqlBQTpQIZ5M/0IVlkc+jQOoqYsKgQBRPH8/JrYa9NUgrnUnNGsNhot/gdUpQOLXMjQfQrp
 QdVeGrof7FNxDuHyJ+TLPI2VynP1rjE1jR6+QyFpcllU8ZrKoGv8VmK5vaSW272PcX4aPYZe7Wj
 vQxxTD9XcjuoF2joS/ijg++faRShXxbiAkJcIunAlLOAPoNOOV7umepJ2B5FbcGQc+3YxbVemz1
 6zfxYNedBFwR0ip98KY5nnTTX8WTgy2JE7EF7l8goedtHUtOG+PW8vMzFo+zTOSJV0OINkV2sVk
 MhO0EHDoQ7WbpTGF0ONNqo/eLa0ysgYg5PElN5cRsziSOENXTKfuPyt5yr7YzRnsSsrP/9RbHcp
 OGCHNLq6Jr1L4AKtOdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116029-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:mukesh.savaliya@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C21CE6F7FD9

On 7/2/26 2:39 PM, Konrad Dybcio wrote:
> On 6/30/26 12:06 PM, Pengyu Luo wrote:
>> On Tue, Jun 30, 2026 at 5:52 PM Mukesh Savaliya
>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>>>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>>
>>>>> Hi Pengyu,
>>>>>
>>>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>>>> also support GSI mode, which is highly preferred for certain
>>>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>>>
>>>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>>>> the controller into GSI mode during initialization.
>>>>> Why to force ? You can directly configure in GSI mode. Note there are
>>>>> some configuration done prior to Linux bootup too.
>>>>
>>>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>>>> impossible for a normal user like me to generate one with GSI
>>>> preferred.
>>>>
>>> If firmware doesn't program in GSI, you can't have this working in GSI
>>> mode, its going to fail (and work with fallback). if it's programmed in
>>> GSI, anyway this will run in GSI mode. So why to add extra things
>>> without any usage ?
>>>
>>
>> What I can confirm is that fifo is not disabled on my device, and gsi
>> is definitely enabled (under windows, check the register
>> SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
>> works well.
> 
> What's the value of se->base + SE_DMA_IF_EN (+0x2004) on this SE?

I'm sorry, I read the first sentence only..

I think the enabling of DMA and the disabling of FIFO are technically
disjoint operations, but shouldn't be. The programming guide mentions that
FIFO_DISABLE=1 is set to prevent malicious software from snooping the data
from the RX FIFO while the SE is operated through the GSI.

Mukesh, would it make sense to make to rework the checks this way:

if (dma_enabled)
	prefer GSI, try SE DMA otherwise
else if (fifo_disabled)
	return error, misconfigured SE
else
	fifo mode

?

Konrad

