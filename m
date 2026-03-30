Return-Path: <linux-arm-msm+bounces-100768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG1nNyZZymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:06:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50C359E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95E19305F18A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53A93C3BEA;
	Mon, 30 Mar 2026 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI1svWKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fl/8zFck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81473C277F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868463; cv=none; b=KzuUJIkc0deCq2OlKDAgrYw3hR9+DJAJSmbtIBpPkga5rdr05P+Slj/ne6cM+eTHXLMUURjO+EdZyXAHfLYCr0m8Dkux0jPYU3vAc8oDN5Qj4ry3M3Q9nTnnUq7izjiqxNT1rDFRvw123oXtOA7rIn8prBino/7nJQDwY+F4Gds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868463; c=relaxed/simple;
	bh=ARUVX+Cz/NcKZ51ywPohYIei3R+mpwx9bHsCMmPwDWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hyne8RTaOEI8Sj91EAp8IMZt/8MgqhkkLHJqVI6tLrgF5c4qWXtq8/eDvxyOX5Ss6UDaAYONCFDwAebFHPF3A8LaMgudScgeBqlJKijanN6nJKQzKdxnErkw6CPRjVjD/FPx7PC9MTw1e7e/N7ayhLEFMmT3mbYX+N/A2hYDatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI1svWKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fl/8zFck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U797MH1088844
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeRVAsSMkhzdHJKHnccV+fvO1GvVVfjQQqXJHoRadb8=; b=TI1svWKZ2e6f6EBC
	m8B2CZZpIX0Srh9Uop7eBAg2IuTrQnsk2WTtdWhbr3xlgBkG1XTC+GNk/pi5+WtT
	alYsfr4B9yyQUev+R9nnmqbbk9aQHsJE8BTzb/HCktz2UCT29y2Y2TdL+VeGuinz
	yDfy2cwaAzM8GtmD3DcnIrSlUs25qEtPp7PF/jcZYm5A6NZqrjc+AYx5yYphVCyn
	U2jcV3X8QnVZicWbxwSgjOschcxj+rJus0ljoP7TN+2CC77K57QnqLgx0MS9Vcu1
	b42qvM8uy1gt4N9/wClwhXzYg0bdqn15kouBslbJ7IvDTmMQtbD9/l+XV53fmz4S
	mZXVDA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67715t3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:01:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so13923476d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774868460; x=1775473260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EeRVAsSMkhzdHJKHnccV+fvO1GvVVfjQQqXJHoRadb8=;
        b=fl/8zFckIpGFWZUveE3jIUOKFYVqMlHfod7wc7GIgc5kkUrCT726z/3dTCzUSaDfVu
         x6IMOqL4i0p0wtxUw9gzEcMncc9Uzurn8jQBCBfBa3gvZ+TXY4LamUaw/JMY2N1r00+7
         M3141GdvMl5AUm4NdyQyBu5btZx7CJj/JUoiaqZVvUb797dkn8RtdBIbd2tcP5I9+Fg7
         H/XvmarJGwYr81GRuAIl82rH5VGHisi1A2kVHYXxEzR6pXa0LnyUFfy+uRf4E8HgJm5Q
         37aC8WOQRtEgt4lA9kFBqSQBTGXAVzQzJV+UOiWElFZ/mtZl3TYwBDOWrIjpZSqLY3Yo
         fq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868460; x=1775473260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeRVAsSMkhzdHJKHnccV+fvO1GvVVfjQQqXJHoRadb8=;
        b=Qh+ZEmFKV6BXJHcQ/kMB+xf2+6I/QeyOkh3eRvPcsxiGIqbA8zRtYFRTI9Vd/HghE7
         SbYuf8TOiTQKUMqLVXctLpgfLZ/CM4PInpEGbIY+kbDEtdHGaeWCgitwLf51ThYG6pKT
         1JY2lvBHVu9C8EZvJBepq09+ZFuMINZO8Z3HJfwat6TGS3Fg0j20kRyikCF004hOyPfQ
         GU9lZA9n0o0kEBJZOJ3PnFYh9sPuP0kXcG/ZGwQ1Igsw+fddL1uxEEpk6gv8RWAISHn9
         zw14UE1l0X8SR6a57LvGK414vzkIN2WVE3rIX29B8E+vAae28AMJIxKcr4g9Cz+0oHFw
         Z7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVZL/tTR79p6Fd9hcPmZaJ86BrukrDznV74+Rq74Mei3XA74eADJohxiK+eK7jEMvhHP/YPmghY6h0SdACw@vger.kernel.org
X-Gm-Message-State: AOJu0YxIVxz6z/CMOhhqmAx4ajmInY6Mdk52hyn3RqReOR3yiipAcNYu
	a/4sylyhXJHRpHEKOi1XRkA2fk0hCxcN5MjhJ0DTMfdcndhSEIX6ba/fKge45W6mGNlILogRC84
	+EsExiX5t/4sgMoxJf8115p81eJTNv5kyC4yxEWgL15fQvKO0KVFsBtjSapzlYkYcqeBC
X-Gm-Gg: ATEYQzwh0OfDpFVSPi6yvFbnemIrL6zGz5J7HwPO36qUy5EEFvh1tDFpPa3I7dMp3U0
	LRYvdk8KmUBkdkW5niu1JCdaab1RBZx8WSFNfzSubqQ5/IIunTR93f/GQ3ErkEW71/jfJKbZva7
	E/GPuD0C6VjafwSmna/R4IO3aOCC59VyhHuTxRnrmFyuXwYx0IJ+c6FhpHMELaWCtiKFyD9sjDh
	1TzUWVKFmWC6gdocT9gbSGBrUsUNiv14kAhoirLhl6vDicJJnGlmheIljuGsD95yedyp+72r/D+
	fWYBCPcy1f8Qi0bwpLrMfEe2W19jL/w6jpNWZ2xVp24fYSd0rT9QsBtc8GrgQ96pXzYUryrhouy
	4Nur342mlWTaloG+HIVq3AuCmSirWo3ceI5M7sHi2nvVISqyKgpXwuvKgr5omqn/6TVWIjfKQiF
	Jypr8=
X-Received: by 2002:ac8:5a04:0:b0:509:a3c:e390 with SMTP id d75a77b69052e-50ba3932f17mr122293431cf.4.1774868459841;
        Mon, 30 Mar 2026 04:00:59 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:509:a3c:e390 with SMTP id d75a77b69052e-50ba3932f17mr122292391cf.4.1774868458967;
        Mon, 30 Mar 2026 04:00:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae7416dsm278302266b.28.2026.03.30.04.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:00:58 -0700 (PDT)
Message-ID: <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:00:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RChRDennuzTX7p5pexrEG-cGZS19-fg_
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca57ed cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=5tAmg9hwAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=2ZCcOxo-1ny99ew3dTEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: RChRDennuzTX7p5pexrEG-cGZS19-fg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NiBTYWx0ZWRfXwpwS8vMjJowo
 0uZDG1NKXQ+NyVue4K64HhSVOK7Z965uWc1/hUeL4Ls6e0E/1SjDonClREUBn27Mh19rUetQYkO
 1r6NmH7xXBTQu1g4zPlA3IV3lFIFFBKa1cPxSCLjRb21kY8ZTe2+CNe8R7TGv5Zb6fQxMZFJ1SE
 tZeuJju/AZ1xunRk1rKeLCdqsSWRHqrkG2ScU2L1SUGj20k0PTx/q+bltglGGdK0GyP5IgF5/Xc
 omWgl6MxMAFGjbqhS6ZlooPyMRO4qhZZfg5vYyaDnQ4xeKnWl5vjBZastdr7aVLu+NoYgJhoHGJ
 jLZBgFmekJJYxKMBU1kqqNgKFm5mP+6Bj+V4VGOsGaYHB+iO24zgB5kEtdEUc+o+Xv06gOMp27G
 ZNUd8Kjj9QErB4/IogiY+gIA0h1LLqhvDVgmE/fnwvopt+FcdCYGLmfqOwjgUEJbH/Yocp59utn
 DNKXuOYyAYmuHN50Odw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-100768-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sobir.in:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A50C359E9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 10:26 PM, Aaron Kling wrote:
> On Tue, Mar 24, 2026 at 7:36 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> This contains everything common between the AYN QCS8550 devices. It will
>>> be included by device specific dts'.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +     sound {
>>> +             compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
>>> +             pinctrl-0 = <&lpi_i2s3_active>;
>>> +             pinctrl-names = "default";
>>> +
>>> +             model = "AYN-Odin2";
>>
>> Is this enough of a distinction? Do you need to make any changes to the
>> one with a HDMI bridge to get HDMI audio?
> 
> After this quesstion, I tried to verify hdmi and am unable to even get
> the connector to come up. The lt8912b driver complains that the
> connector doesn't support edid read. Which per the current connector
> node is correct, none of the devices list a ddc node. I am trying to
> investigate this further, but vendor source release unfortunately
> appears to be missing pieces related to this. And no other current
> qcom device uses this bridge to take a guess at which controller the
> ddc is on.

Go through the I2C buses that are enabled on the vendor kernel and try
inspecting them with toos like i2cdetect

> 
> On a related note, I'm not sure hdmi is covered in the audio topology.

Since this is a DSI bridge, I'd imagine it needs a separate connection
to the SoC's sound hardware. We've had similar occurences in the past,
e.g. this on the SM8250 RB5 board (qrb5165-rb5.dts):

https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm/sm8250/HDMI.conf

Maybe +Dmitry could help you out

Konrad

> What I'm using is here [0]. This is in a fork of the topology repo
> with aosp build rules added. Speakers work, headphones out and in
> work. DP works only with the pending q6dsp fixups series, which I
> should probably narrow down and ask for a 6.18 backport for. The ucm
> config [1] I'm basing tests on doesn't handle the built-in mic and I
> haven't been able to figure that out yet, so that's also unknown.
> 
> Aaron
> 
> [0] https://github.com/LineageOS/android_hardware_qcom_audioreach-topology/blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
> [1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93e9560e8d9e08a024cc84c8055bb7eb9

