Return-Path: <linux-arm-msm+bounces-102198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOOxLu8j1WlF1gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:34:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B93943B1184
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 730F43063838
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060C63BC676;
	Tue,  7 Apr 2026 15:22:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AFF371CF7;
	Tue,  7 Apr 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575359; cv=none; b=N8yNN1QIootkFfcs2QWq36Lx+4rEoT4ll1Cx1NmUDPf83Wx++o5kJUf0nmEglXBZ6nR507FPl9GqifD8/QhdNHPfJnnvOvpR83ircf827371jvRHGMTva1pN5AHh4L7B3/pPuw0pGcDR2EAKoKcpKb37kBlOAaOUmuzMUotBPMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575359; c=relaxed/simple;
	bh=knKVOI6U71qaymZDGg5rCkNH2h3DJ1z6t+6jjVa1MSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwrrDjxf5hwdggWYMSzBaNzuuTtA3pMMKDCbT5W75FOEaKh39Uth/p8BlHmwBiuWNqDKcQXrtL5+pUQoaJ5WLLPbvRxqoypQl1AlBKqMhrOIcbWyT5rjbHsjoCHN+hbZATj8sOWe1UOGUi1rFg6z2XmYVyjbLEKTGGK3KLufPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz16t1775575341t63f59720
X-QQ-Originating-IP: 6yZcCTzaiUziuNg30c2HWoO5ayfcwe6znXUb7/usZt0=
Received: from [127.0.0.1] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:22:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15274376702589257556
Message-ID: <6B50CEBA165F1731+1380aab5-da45-4ce2-ae66-3d92015c1a21@radxa.com>
Date: Tue, 7 Apr 2026 23:22:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Andriy Sharandakov <ash.ashway@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
 <56b5bacc-7214-41aa-b969-4f622afcd9f9@oss.qualcomm.com>
 <103424579111FE76+93c3daf1-4bce-440b-9048-74edb833031e@radxa.com>
 <cc8ba407-1d44-419d-9171-b6911f673772@oss.qualcomm.com>
 <9f04ae8e-e15a-414f-a436-987d02d31cdd@gmail.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <9f04ae8e-e15a-414f-a436-987d02d31cdd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OKKHiI6c9SH3TL/0m7PbPb419A7vEICcxHGKXTIILwnpEfcgGhSEmRjF
	Uz2ink4zT3rxJ/++eRepP6vsdnFGZ0xLR9LFRAatpryvoQ/M2pd0tuZBw4/+iyUnu7Iqten
	xtpRJwRkiJm61ArS3zTs9delrtsw3G6Cv+Nt/kCmRkBbdBrI5+TAsM5Oam+uH9jZwi7Ve5k
	0ERswNhVeX9DT50q3KlN5vNRansyyuSmd1NPmYkwqdE0e4c0bvnoUBriAoMLmdraiJUn1BE
	BpQiafo39IiAjqHy4M5/Y/9Z3rRfQBlm+vllnb7/aGWHsFYleV3iQ+bhpwbumQamtQ4ACPr
	M4kGnVBduJz2NeJOVbPQ+yZxGz7ORAbByUEFHS3VRpbGYgjoYwztehONKbHycllNqRW+PLE
	PbTbluVUTQ5vOJnIEYzaJR20ELzzR6lREksF5rlNKtdLcuzR6kUb3a79UDY9kYsGQaGzcB6
	6d38uZ/ayzu99mqsbfFwDAVg00R+R4kFIuTChmFlhYIz42ImHpxV2m15wMgGEnTMGCxWbNa
	nK48DBWA8CqH4i1h3IxZiFtBZgdc1+jxoN852kFRsQlFQzq1QqLyGEGx1+ph1uApedbsh7v
	2MIGY4t3WBoVJzRdci/1It6DUc16RTzS45iasSXhZHAVrCHQ0K6YJDyxeqlvaByTMeemErJ
	uFHuuyfbN4HhBZ8+3N827RFapKc/0uHPsjDJY3APYCwj2ZMZEGfrEDUc419+Oned+rUJu8D
	wh32CYRieIErErgrzYHbw8a+ZwFe02bJhnLTukCFVrVeyQU9U/TWn6NupFGdlOlF52GjvFo
	Ue78PxbPov3oFZiICnHSbUVq6akQJ6iYHBiFO87tUFLzO55EF1+JNwpsD7bfzDJM0HhbvnH
	eUPVHuMF4LM7H83P46aySDrCPx6gJaXngvOwzzNfq0JvohEjJ8eTvJHAqNqUBB2qxe8bP1u
	1zM3j8YGRHEuOS4D12WJu25a/Yp0Dqs+vrdAuZZ6ONMA9iEg4WmDAX+STW0nDXeTSkRnvjt
	vx5+Ab6LEHN7wbScKIa8MiMqwWTh20J5rltg1gSortbZ/5JWukAHJfoJgpqk8=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
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
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102198-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.867];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_MUA_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,radxa.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B93943B1184
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 6:16 PM, Andriy Sharandakov wrote:
> On 12.09.2025 11:15, Konrad Dybcio wrote:
>> On 9/12/25 11:04 AM, Xilin Wu wrote:
>>> On 2025/9/12 16:56:04, Konrad Dybcio wrote:
>>>> On 9/12/25 10:03 AM, Xilin Wu wrote:
>>>>> Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single 
>>>>> board
>>>>> computer, based on the Qualcomm QCS6490 platform.
>>>>>
>>>>> The board ships with a modified version of the Qualcomm Linux boot
>>>>> firmware, which is stored on the onboard SPI NOR flash. This allows
>>>>> booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
>>>>> supports replaceable UFS 3.1/eMMC modules for easy user upgrades.
>>>>>
>>>>> The board schematic is available at [1].
>>>>>
>>>>> Features enabled and working:
>>>>>
>>>>> - USB-A 3.0 port (depends on [2])
>>>>> - Three USB-A 2.0 ports
>>>>> - RTL8111K Ethernet connected to PCIe0
>>>>> - UFS 3.1 module (depends on [3])
>>>>> - eMMC module
>>>>> - SD card
>>>>> - M.2 M-Key 2230 PCIe 3.0 x2
>>>>> - HDMI 2.0 port including audio (depends on [2])
>>>>> - Configurable I2C/SPI/UART from 40-Pin GPIO (depends on [4])
>>>>> - Headphone jack
>>>>> - Onboard thermal sensors
>>>>> - QSPI controller for updating boot firmware
>>>>> - ADSP remoteproc (Type-C and charging features disabled in firmware)
>>>>> - CDSP remoteproc (for AI applications using QNN)
>>>>> - Venus video encode and decode accelerator
>>>>
>>>> You have a number of features that depend on several other series, and
>>>> as Krzysztof pointed out this is difficult to merge/review.. Could you
>>>> please create a "linux-next/master-ready" version of this series and
>>>> separate the changes for which the dependencies are unmet, putting them
>>>> at the end? This way we can take at least some of your diff.
>>>>
>>>> If you still want review on them, you can also send them as [PATCH DNM]
>>>> or so
>>>>
>>>> Konrad
>>>>
>>>
>>> Thanks for the suggestion. I think I can separate the changes that 
>>> have unmet dependencies, and mark them as DNM. Can I send the new 
>>> series now, or am I supposed to wait for a few days?
>>
>> Since we can't do much with this one, please apply Krzysztof's review
>> comments and tags and feel free to resend
>>
>> Konrad
> 
> Xilin,
> 
> The prerequisite for the "USB-A 3.0 port (depends on [2])" feature has 
> been added - https://github.com/torvalds/linux/commit/ 
> f842daf740114a8783be566219db34c6a0f1d02c
> 
> Could you please check and resend the USB 3.0 port feature?
> 
> Thanks.
> 
> Best regards,
> Andriy
> 
> 

Hi Andriy,

Thanks for reminding me. A new series has been sent just now.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>


