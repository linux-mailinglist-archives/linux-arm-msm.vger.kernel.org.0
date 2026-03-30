Return-Path: <linux-arm-msm+bounces-100769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGnoLQdcymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:18:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD735A16B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D643308F5A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84A12C08A2;
	Mon, 30 Mar 2026 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5hrkdmh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixRJCRUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0293B6C19
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868508; cv=none; b=BCvLVavFKMsPXrAtxT+697XAQSq0+V9mlC+52BRNc3bjPQxwMoKRU+6aoX4RQktIyd9QHHcY4gTAN9VOoDK/4M/3q9RpJq3eSik4MF5rl19LJjB2XuzgJ+nYTiUOgqUUIzxCMKftGcA4BR+5PGP6hJzLWt9cQdNhcNPeAEppZcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868508; c=relaxed/simple;
	bh=JFh+xNnoKLCdx3iWAbtKukgzFgVO0o+uzr7hE2HnhXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rI1YdizzoVg86MsP+6v1oSEL1/YYBQWGJo07a5rp3+IRB6aKvPabXv8teb86ndzQ9zURxxRxaPZVnYxRnh8kuaXtO644WuPLkarz1Q+ENzDarFtSpnGmvycs+xZVL57H49bXlyNV5yuO9p3/CWyJPry4NPhsx+B4ERg4KkpNaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5hrkdmh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixRJCRUB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGuMt3176220
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLbhdNcu5UWnfkVoa3B7Nk2/0oy/YJznAwccPowiRbU=; b=A5hrkdmhuSnQl46N
	ZPNv0tcHe092Cmwp+RzU9avGWmGtHIVmPEt8zDjfrJWSv9jNwZ/vAu9YQF7St9GR
	8hSn3/K7C9fdiiD0BBmvxNvYH6QKkNbpzqrRdKS2Z7HxwnghLYuGiUzTFQ8MQ0LV
	HAMTtT6zT4k1N+yZcYhcNw0RFfMBxKJr0zi6zSDEiR4csGMkBlMjvaOpyv8Gotvy
	MIg+LDNFqiFF9bqYy7w6AxnvVcVes/MvKAIgWp7PNnZN6SjE7vm2EqJOpEQF+Tbe
	/X9hbHC9CGXnI+eed+TLo/yOVUSv8lLxZvFfnW5yVtGIfYG4N05DfJwG0FV6+Z/2
	PcBCxg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h04gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56cdfc9dbc9so244240e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774868500; x=1775473300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NLbhdNcu5UWnfkVoa3B7Nk2/0oy/YJznAwccPowiRbU=;
        b=ixRJCRUB3t3xvmfOnhRrg8jk4nvVZC1h9WGkQzvbmfZ153YGGjjZxTyNHUGjC7BpyS
         tlew5no+UJfGfIg7tZs1zNgNZTkDeKPc+1aZQ817CVIZ1u5iphwniPRUXCUuXKOcVTJy
         eQWggL6vaH9JxKrDZUuvwecao0zvSQyMNSpxjIhZbDftRM7CionElmdQABcn+Di6v0gW
         nAGx417bWbpnkYF/CsdWXbj2/NKvs67UMIiu2z31ILqNTItXtNHHxvu4kCUnMLebiBvs
         ADGBJe9ZRA5mu9sPzbKcIDoUI7tDhe9Z6oubOTvvDOkxo/m27+GUO5WGr5NfY/BISFsz
         hQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868500; x=1775473300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLbhdNcu5UWnfkVoa3B7Nk2/0oy/YJznAwccPowiRbU=;
        b=I2OAnw9YytwrY2kNgInUhIwZUXk0G2rhEDUnYWTFUDh9MRBbtRicJ5N+puiO3Udzg9
         EIE1vlvIZ2YVSzELoNYtakeW6xqBY/Tsu3F3etSI+8fQA9nwG91VBpblCPH+r1wMqF2c
         vQAdIucNinGnpazAnJ+TXmC24dBKL0+/sd4zv/h4zDgA0Cnmy/OBPPQrLlNbwKSw6t7i
         P5pm9AS1wc71zuw0NoV/b5v/g5jhnaLnNqPHEUgCm9Z75hHJ3NT6CWrboNF3kblc7ZSw
         KkMHo32xp759vaeu48xXmmvK3bZ75LhQcxDdgoGWejbYVXVIytboH4o/49xmQ979EE9B
         epaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVujFfIeLVS+Q3RyJ2fthw0DEbTvo5syOooAkZtNiEB5EakeA1noyB73k8x0KZqD6fC2iGyiuRIfBX4YGL@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBumATaQfLIjfsKCFTUReSYHX2gErcICS3BsSrrIFHhV7lDnz
	qBEAR4GeX6UA6VUx6A/Ctv7H+JzL7nIi5osa3MqGK8RPmMqzgsIFx/c7KztwYtyInRV8Pc9XAvN
	5rEzmHGO9tzXS/Ngt6fKgztQZlJrJNDZYYNlymuxwVz6Feo0cE1Pf7LSYgJlVbBUId5ey
X-Gm-Gg: ATEYQzw31i0gMRLh9CcGpXZhkcu7L4nEecXblVQyEFJSb1Ca9fSQJHXtvQNj52z8Hw/
	Ug90Mjd66LnFt1liv/hcOFUQHowwBH26BN2999hZ6xAGzhbjzsyaVA9qPfHEvVi3ZpA5ZpreLnk
	+cqPaBKbtxLExEBRxeZpCNYI1wUHOvqmhk5/Tl12vcsmOXSsWsYPSbBdA1Q6G4v53ue6nIm9am+
	gECBHY437aUkLSy1qH8Ry4X98i5ehdy3HzZlLzZiE1go2afHZDYnzYvWRBU+Z6DAGIVgXtqMv9G
	Mn4/70nkmQN8p2XcKpeHMHqwO9Tr6B/iu2m2avWrb32UG++Qt0+vq7Cmaf74/9yo9K+FPJoKUKT
	WxB9NTuZIqQXhb4FL5rSl/o5m9RV4A+3MKWbled3E1MKsBPJpy0hw82JreX9v6GS7cjyihDQ7Dg
	bQJt0=
X-Received: by 2002:a05:6102:750:b0:5df:af0f:309b with SMTP id ada2fe7eead31-604f928b9b3mr1466260137.5.1774868499458;
        Mon, 30 Mar 2026 04:01:39 -0700 (PDT)
X-Received: by 2002:a05:6102:750:b0:5df:af0f:309b with SMTP id ada2fe7eead31-604f928b9b3mr1466242137.5.1774868498817;
        Mon, 30 Mar 2026 04:01:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d81sm284138466b.12.2026.03.30.04.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:01:37 -0700 (PDT)
Message-ID: <801f089f-7d3d-460d-890e-b0b170bd3ec9@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
 <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
 <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
 <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NiBTYWx0ZWRfXy1rM2E80LK1K
 j6XTzrgFStXjmsVmeciN+dyACUt5aXwFo+pxLrRJxljdlKIO25hZgGxh/jAIFiFpdrodVxy++82
 L8Rl1svHIYVuR3LEKFbqkcpy2HjlWp+ui19pAt6Yo3UPabLDtqXBku73gYZE0Hov2O9JpWx0cuo
 cge3TwPqFHW21g3csT6/32h5uIxtbAVPNIJG75zdruNqmHz+F0X7gWULr7Ki7M8UBIauRZ2G4/Q
 xz7at01pq9K9z+f+tV31oTBI9DF6wTxqJRUB4c5krYMOhwfp6Ka4UN0d52HwaHU7IGIIwpdfD/O
 PuUAZmtKooHYOFoCEp3d6ns+1mZpYfv07ITiXxlD22SjYeP+m1RKD7ipEUqo9i7HViU5+RP58di
 tvthV2Q8Ceg6hVjGR4Exwzr/Eq8a0loW8vTBBdCaLEkMOYrpiCfRSMR+c8QCjA8zYFMPoHqSDIS
 9NQljWTmMlXA8hB4LZQ==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca5814 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=5tAmg9hwAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=g9K1X23dYJYEkdOYvrIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: x--4JMBVE8mJkPubcCEPAkJQbSRXiO9W
X-Proofpoint-ORIG-GUID: x--4JMBVE8mJkPubcCEPAkJQbSRXiO9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-100769-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sobir.in:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDAD735A16B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 1:00 PM, Konrad Dybcio wrote:
> On 3/27/26 10:26 PM, Aaron Kling wrote:
>> On Tue, Mar 24, 2026 at 7:36 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
>>>> From: Teguh Sobirin <teguh@sobir.in>
>>>>
>>>> This contains everything common between the AYN QCS8550 devices. It will
>>>> be included by device specific dts'.
>>>>
>>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +     sound {
>>>> +             compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
>>>> +             pinctrl-0 = <&lpi_i2s3_active>;
>>>> +             pinctrl-names = "default";
>>>> +
>>>> +             model = "AYN-Odin2";
>>>
>>> Is this enough of a distinction? Do you need to make any changes to the
>>> one with a HDMI bridge to get HDMI audio?
>>
>> After this quesstion, I tried to verify hdmi and am unable to even get
>> the connector to come up. The lt8912b driver complains that the
>> connector doesn't support edid read. Which per the current connector
>> node is correct, none of the devices list a ddc node. I am trying to
>> investigate this further, but vendor source release unfortunately
>> appears to be missing pieces related to this. And no other current
>> qcom device uses this bridge to take a guess at which controller the
>> ddc is on.
> 
> Go through the I2C buses that are enabled on the vendor kernel and try
> inspecting them with toos like i2cdetect
> 
>>
>> On a related note, I'm not sure hdmi is covered in the audio topology.
> 
> Since this is a DSI bridge, I'd imagine it needs a separate connection
> to the SoC's sound hardware. We've had similar occurences in the past,
> e.g. this on the SM8250 RB5 board (qrb5165-rb5.dts):
> 
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm/sm8250/HDMI.conf
> 
> Maybe +Dmitry could help you out

(mentions work better when you actually add the people you intended to
- fixing that)

> 
> Konrad
> 
>> What I'm using is here [0]. This is in a fork of the topology repo
>> with aosp build rules added. Speakers work, headphones out and in
>> work. DP works only with the pending q6dsp fixups series, which I
>> should probably narrow down and ask for a 6.18 backport for. The ucm
>> config [1] I'm basing tests on doesn't handle the built-in mic and I
>> haven't been able to figure that out yet, so that's also unknown.
>>
>> Aaron
>>
>> [0] https://github.com/LineageOS/android_hardware_qcom_audioreach-topology/blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
>> [1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93e9560e8d9e08a024cc84c8055bb7eb9

