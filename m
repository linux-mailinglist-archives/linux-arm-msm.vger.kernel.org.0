Return-Path: <linux-arm-msm+bounces-113459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YT5IDbGcMWrVoAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:57:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCA36949C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:57:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DYZT6pTt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S00ZPaoQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113459-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113459-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58BD3326F82B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1641F47CC7E;
	Tue, 16 Jun 2026 18:52:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E647B435
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 18:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635970; cv=none; b=nVGnVHQncWwsq07Z0P/S4naYBU+/0ASkBEUIc2+2LJDus0ZZDSFIiTzFCmiJlHrACAs2VUf5IbXDTysxdFnIfDmdvL6KvI5+7u/G8vZxQmzXAswlAjkqLiFMdDR/OUem5mUTGwU32nQa21X5vPqaJGSRXuxPFrnAl7rbSxKOhHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635970; c=relaxed/simple;
	bh=71YRGNfb6pVliDbZc+wyDG8P1MQuklaHbOzojhZ8seQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MA8jw/euAVFk0QMglVUVeDEunoxtpSgrt/xFJuTGwHZuAb9EzmP9AwwgVOLW6nFx7ODSK6+WpLbq1qCBdLMwYe/hqzbDPosXSkBmV5hxM79p1ihb2SmoMIEES1xyWhin458kqZLUj9FWzggKiQ0cUfcTXd3FO+oABYL+bBcIIUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYZT6pTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S00ZPaoQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOKo71376132
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 18:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9RsvBKT8pQ+ENjTfA/wlzxT+pVsKeuMFCetpo/hRJo=; b=DYZT6pTty40HzhEk
	yW777nxpkYDPpXF8OF+GlsG4zgmgwlsJeaeOoFzyCERsDbr5wT6cSHOViFnA0UtU
	D5+WY7cN/3U4fZvCjBajMWUtN58OZqwczKCJ9yRNjSFSV0YT37vQn5NC4zFvNbp/
	kdKHZtLGqz7AgKJOKaM9F3JkjMHgebq6VhZFrkzgKLBk/9NIh0b49orWSoNwxePN
	fjiiYLjO/jzPtyxyAD+kEutyIcG4wbLrISKhEuAJvaCsEjMAY/JGnSrmIoD+Qmng
	NeO1CHwnw+up8U2p/DkKEM3h4yw5j3c/tGdFZs6cQchGN6WxmaGU42TyNPrfEtUS
	rqQHjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xsaxe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 18:52:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915c1997732so973367785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781635965; x=1782240765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9RsvBKT8pQ+ENjTfA/wlzxT+pVsKeuMFCetpo/hRJo=;
        b=S00ZPaoQ2N9J3EAUQgJrN32Ewew4pKa3QdyG44f8DvRiMKh13txpKDPaVLvrVA/9wp
         cAswfmNiwzFohvqOoNGx20So/NHfgylt+lKC+JO3v8lZC8uzacUnWsl0u7xAfBqjBw4L
         3RCl9Y1Jm4cCTwklhxQ3bvYS5jCC6FEsyhkJRHliYzYpY2Rn9iyQE3KowRg/vORDJoye
         Q8t6OCxyS74ABiqFYEaROfrSkMEOok+ViQH4oVohkFbsp2yshrIZXSf4bUC07PD9TeF7
         ogOrEePYAWRRXjVHS85XDsRLscUcyuO/zflnAnsHpUNBiZhLaWwZx6aShMmtNqWcFSRx
         sdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781635965; x=1782240765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9RsvBKT8pQ+ENjTfA/wlzxT+pVsKeuMFCetpo/hRJo=;
        b=a8hqv83H9NR3RbD4WqnR+XUsQurU9F5clN86HqgiTkFwhAO6xJZ7HbUpjvN6n2nmC+
         euEB0FT/tbB+l38yNxY2wyyS7DKzFQ387DI33cC0/3POHra7WvZogSu7cxalXIEXuOam
         oD5p6jHVF8WHDmBQKX0qbnP7xCZMQonCnx7aqs7KVrZd9nCw58nVwc8fhbyA7cYn+zw7
         q49XB+PnMPPW1sXQleFUEf7KO/5x0r2IzxMYKmEa675zyLwjj26mCYmz4az63dRbynPB
         ttB+LT2MZw1YxoNN4qZvIC+7a//5CzboJYmaECiQ6fwcwOpLxqIkz0FukKmNc0oGIODg
         gjdA==
X-Forwarded-Encrypted: i=1; AFNElJ8oVwCaOMPsUZktoAFG6ix5WzEm2h5YgANrnY7SaCNAD+OLBTlYw39gsC8P9uVetjWlnbw+zUkLjIm6kHEy@vger.kernel.org
X-Gm-Message-State: AOJu0YxiK9u4e7MVkLf/Zdk/ErUGZL+n7eReq4Dp83VCOfHFw1FgNISe
	39TOpIXJqOBSNE08yx/pPhSpplnmfuW4E4ojdc977UMlg/MrQajOxjwjZ1uF4gU0c8SqN3s86Nw
	/zrlObxnNs8E5aEhMHkw3MHwCAtHNZwEkSCFxIpZ5wg5CsW17xuXP+4OU68EtgCjLtJin
X-Gm-Gg: Acq92OGIaRZ6uh2/sbilBV250L5hRN/WajO0eQPaZJJ3D7cOQVFXS+C26FZtcljQ9Hb
	8XQaHmO1feI5/BTiNs6Xz92EmsLUpBBDKuXwiWqkymg7uGmQME+TbK3iPhnfFNFOF8J+lDS/0fS
	pY1dLPrW0D9X9LQtgUYxkylIVMZVMiP7nSoC80eSKs7RQQFkaSBiYabpSuOtMzxWm5LQOLp02Ei
	hIy1imu6QjWGbxKZ0F9qPqSYhfZtESSiUq/gwncpKib0HhK8v+kv99RLaDvECQQF1v/xt9MpkOI
	Ln0SyQ0fgy+Z4FS1kfzU+vofF2RpVdPcJQ3dSnvPCcGpp8odGJQn6yOUcAj0aRlD8sBd695ejO/
	B7BsAtVq+/haSBwjeqZ+dE0Ot/xWaIT7zQ2wwkzDCDZZkC/qA
X-Received: by 2002:a05:620a:2981:b0:916:10f6:780f with SMTP id af79cd13be357-91d8d0b99e5mr159569985a.27.1781635965555;
        Tue, 16 Jun 2026 11:52:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2981:b0:916:10f6:780f with SMTP id af79cd13be357-91d8d0b99e5mr159564085a.27.1781635965003;
        Tue, 16 Jun 2026 11:52:45 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-461eaa0d1c7sm3642568f8f.7.2026.06.16.11.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 11:52:44 -0700 (PDT)
Message-ID: <3287ae19-508d-47eb-abf9-259867e7d044@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 19:52:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-1-18bb19c5ca22@linaro.org>
 <937aed10-9ec6-4ca4-bc60-db892121a416@kernel.org>
 <a5a957d0-a40c-424e-9d6d-622a4f624343@linaro.org>
 <05e15363-d49e-4a7b-82b3-0f07537b5366@kernel.org>
 <16d2e8e8-91bc-437d-8225-eb6eedb4bd8a@linaro.org>
 <f18fa22c-131c-409c-9c8b-3153e2272b89@kernel.org>
 <a35d7f95-c158-46d1-b136-b901dcfbf101@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <a35d7f95-c158-46d1-b136-b901dcfbf101@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P1pIp-S61eOZVC_P4GxcVZXfvh_nPYZb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE5MiBTYWx0ZWRfX4DBrgAQtoSAU
 cAOgqaZCswR0c+EX4A1+wSQxKtYKg5hYzCW5+CYTKEUUreA3Q3sQYMxrIQl/vTxSNvFPu5AkXo5
 rfXA7n/MxLPMpU2bOzSViQ/EV45CYCH+CdM0hCx+fLwdlbMEz8D7BxJen0FyMmbb9n+HTgzipAx
 nvZnQuPqFYoV2MdgqcznHfMD45qyNX4gswJ9lP6kfnV9ofzWGxj6EIzaH0fPgKCsbyz7E6sTVPd
 1EX4rk+bWcV9RPNA2fP3ZTDTZMB1pcyR0JTshYjLeIKmiZaQDeVzyswZY1kuj0qGv73EyvsMzQT
 LNy4InqCuyGYnlmBKwt3vLFvOfPoqqzfOSUwQvbksR+HEuSvll0V3DYUMJgM+WL1UtVKPhy4PY1
 cdxFVelgIxEypzBKTpQiX88HrLB9M1ndftrKSVfgFB4Upqo/An6UEIqQ2prUYE/e556FWeDQTo3
 jqCZZHHOamAWriM+mfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE5MiBTYWx0ZWRfX9I+YhdCOzCaW
 By8vgmLFgUTLKKGF8NyCEJ8V4bNGyyQQi4fkwmAWW+K/pOKwYbswZoxtXC+l216n4/zkR3bGGNC
 rb2Y9zkaq+BKl3A0HArlhZC1LuDylGg=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a319b7e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KEe7bkdQAAAA:20 a=EUspDBNiAAAA:8 a=G2-bsJ9txPRm7R4i2XwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: P1pIp-S61eOZVC_P4GxcVZXfvh_nPYZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160192
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113459-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFCA36949C9



On 6/16/26 4:12 PM, Neil Armstrong wrote:
> On 6/16/26 16:59, Srinivas Kandagatla wrote:
>>
>>
>> On 6/15/26 2:54 PM, Neil Armstrong wrote:
>>> On 6/15/26 11:36, Srinivas Kandagatla wrote:
>>>> On 6/15/26 10:31 AM, Neil Armstrong wrote:
>>>>> On 6/15/26 10:38, Srinivas Kandagatla wrote:
>>>>>>
>>>>>>
>>>>>> On 6/10/26 8:41 AM, Neil Armstrong wrote:
>>>>>>> The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
>>>>>>> of 2 WSA speakers connected on the WSA2 lines.
>>>>>>>
>>>>>>> But the Audioreach DSP only handles WSA2 in pair with the WSA
>>>>>>> interface by using the upper bits of the active_channels_mask
>>>>>>> for WSA2 and the lower bits for WSA:
>>>>>>>
>>>>>>> /-------------------------------------------------\
>>>>>>> | Bits  |     3    |     2    |   1     |     0   |
>>>>>>> |-------------------------------------------------|
>>>>>>> | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
>>>>>>> \-------------------------------------------------/
>>>>>>>
>>>>>> No, this is not totally correct, if the setup only has WSA2, then
>>>>>> channel 0 and 1 should be WSA2 channels.
>>>>>>
>>>>>> What is the backend dai id that is in DT, it should be
>>>>>>
>>>>>>       sound-dai = <&q6apmbedai WSA2_CODEC_DMA_RX_0>;
>>>>>>
> 
> Yeah 0xC0 for active_channels_mask and channel_mapping =
> { PCM_CHANNEL_FL, PCM_CHANNEL_FR };
> 
> I tried to keep the leading 0, but since the channel_mapping table is
> allocated with
> the size of the num_channels parameter, you can ony have 2 entries.
> 
>>
>>  From DSP docs:
>> https://github.com/AudioReach/audioreach-engine/blob/master/fwk/api/
>> modules/media_fmt_api_basic.h#L780
>>
>> Channel[i] mapping describes channel i. Each element i of the array
>> describes channel i inside the buffer where i is less than num_channels.
>> An unused channel is set to 0.
>>
>>
>> So unused channels should be set to zero, but the patch padding the
>> channels starting form zero.
> 
> My understanding in my trial and error is that the DSP will map each
> entry of the channel_mapping to the active_channels_mask bits in order
> so you can have a non linear active_channels_mask like b10101010 which
> has 4 channels active and pass a channel_mapping table with 4 entries.
> 

You are correct, I was mis-interpreting some of the comments from
modules/media_fmt_api_basic.h specially the channel map comment.

Also confirmed this internally so we are good,

I tested this on T14s,

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini


> The is what I implemented here, and it gives a lot of flexibility on how
> to connect speakers to the interface.
> 
> Neil

