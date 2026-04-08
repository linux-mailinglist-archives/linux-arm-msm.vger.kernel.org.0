Return-Path: <linux-arm-msm+bounces-102299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC2RAxwl1mklBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:51:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D53BA237
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33F49302CF00
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FF53ACF17;
	Wed,  8 Apr 2026 09:47:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936883B2FFB;
	Wed,  8 Apr 2026 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641678; cv=none; b=PABJL/jMITzVpPz2Wgnb9vNTxz3hDKDSU0VXOJuOpvyeLLfOqFpX0T0IiRhFH6K81CHUrYDJpRUZwixNKZMYeBWxs9t6AlqK7qHiRaM5rwOuP15qqTPD5oy9k0RVdeBDoHEG8sK9SfjjVkdlzFX7ocVJfl84gIsEMyFP6srJxqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641678; c=relaxed/simple;
	bh=vRMSw+D7Onb1i16x471HfuzfJfnv5P/xiwTI/8jnhsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwHrPUC4yS5aAooa2zgl6hVzoQRSluXGSvMPXfhFu9kQ3hAYm9Z3zWZmRoncjjo1+2cKRQtjgpzfoAL+ImP9Px7TXLvMP+oF79l5k6S4Xamnp3BortfkIbuV62VfS7xzD/DB5P0JR1P8kOot3KF05FAd2ZlHnRBXLQeAozB6PeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz1t1775641646t8cacc6c3
X-QQ-Originating-IP: kd0LEnltCRlYQLDfRjr10DWYXNAdnyVE8Ew3L+fbBMA=
Received: from [127.0.0.1] ( [116.234.85.158])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 08 Apr 2026 17:47:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6132987564100307657
Message-ID: <88B7BBB9133FBAD1+ccb025ea-4999-4701-bb18-c57a42cabe2f@radxa.com>
Date: Wed, 8 Apr 2026 17:47:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add
 LPASS CPU audio variant
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-12-14aca49dde3d@radxa.com>
 <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <29a7dd01-7513-4fe5-8546-d57757b3b2d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NlLCQnVI7H1D8qH6xKwhtMFs6ITZOQzlY4hX8artWFkTAtaFxTL87F3k
	NSakEXzX+wBOl6bCf8Zjl37l5mwJhFDrT1H9r22luUgJn7TXTnSXUS1h1luTTPHvTvwxEM0
	DBwz1zlQnXGpGMHywujgKZ3McqH/qUCrnyF2M540XypfGzuwLwk6WWP535VXQsI9AYMGhOw
	uQ6Nb4H7RbMndUDNijmzNQF4rfOJgsQ7KZQmWCxZfu3p2T+8CZNUF6Th0Z70Z5yzPi4aaP3
	hWl7khcApmZ3qtaVX4fEZqLMQvKVIvjBFKUZMoswSHDGCwk4BY07M7JhgzUrEreOU9VlSuX
	vAbwgEpc8xHE5MZQNf4qscd1JHtXP+NyF6MWNej3+8cFJpiZ9zy9elRNwNqsRb4Nioj8n6N
	wv83bxKvVvMvComOQqZ2Hoox8J3bCFRte9uvVD9wWA36ouLPMZx4pdQLu6/TFNOtWLXCs3e
	LInANQp76LhuRsP5EKWHeGFUgr6O1q66YpzbviqaLB7aZhNbuh0XpcQF+ahutrrXPfLSJ6e
	NmW3Ptca+gib58w0443+R2ygfE1wEoLvsYq+HnxqH+r21390p2/qbamucOC0m6i7E3czBfJ
	S/2Zu3urKC6F/D/hmFKnMRlRt8d7zn5YyFI7QpHUWlx3n//gqfZhxGW5Iq3+6zfLi9TNnr+
	sRxZX9HLuPrDBCxu9z+wT0MW2+/ewGkaLtaArGjIxxddyqIjlbXmTdWlzx6yCxcN79rC7sj
	q15sTgXaT1dbIVBEfSiPTeSX4aA82RZu+SC7dt0aTKUdQcJdn8Vka5dJ2bdMrxiQaGqwkQv
	p3sfIOaGzsOmoIaWE2CK22spB5o+2ebIOcYEwDkaO6J74CmGDQb8nGfFrV/5Gr36r1W8PT+
	N1bXaCojmTGyFSdIbLoHEIKM13tQpehqDh0vVEMdrmcGHhBt/fHtu+28byNiFS5CyzRbozE
	Q3dKxi4B+F+LZAoP01XzKba8dihD/dvWt4u6H5pV0MLFP4Xm5cIbE7J7q1WybBQt8DP+7XW
	OuTvXwe2nYJ/SuIqtVin+NNeUru2cwgPgq6HVsr9cDBbIbmH4ix/V9q48akTE=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102299-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.882];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_MUA_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid,radxa.com:url]
X-Rspamd-Queue-Id: A42D53BA237
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/2026 5:06 PM, Konrad Dybcio wrote:
> On 4/7/26 5:20 PM, Xilin Wu wrote:
>> Add a qcs6490-radxa-dragon-q6a-lpass-cpu.dts variant for debugging and
>> bring-up of the host-controlled LPASS audio path on the Radxa Dragon
>> Q6A.
>>
>> This variant enables the LPASS blocks and codec macros needed by the
>> lpass-cpu driver, wires WCD9380 playback/capture and DisplayPort audio
>> to the LPASS CDC DMA and DP interfaces, and disables remoteproc_adsp so
>> that the audio hardware is owned directly by Linux.
>>
>> This DTB is an optional configuration for systems booted with the kernel
>> running at EL2, where direct CPU access to the LPASS hardware is
>> available. It is useful for users who need low-latency and fully
>> controllable audio.
> 
> I believe on Chrome platforms it was done this way because at some point
> it was determined that they would specifically like not to use the DSP.
> 
> I think this is more of a hack than anything else.. but at the end of the
> commit message you mention low latency - is the impact actually measurable?
> 

Some of our users also specifically prefer not to use the DSP [1] :)

Based on their testing, the AudioReach/ADSP path imposes a minimum 
scheduling interval of 10 ms, which is much higher than the 0.67 ms they 
can get on a Raspberry Pi 5 with direct I2S/DMA.

Since the lpass-cpu setup works properly, I would not consider this a hack.

[1] 
https://forum.radxa.com/t/dragon-q6a-lpaif-mi2s-registers-locked-by-qualcomm-trustzone-no-direct-low-latency-audio-access-possible/30592

> Konrad
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

