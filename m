Return-Path: <linux-arm-msm+bounces-47623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD98A311B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB483A6BC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44A0256C95;
	Tue, 11 Feb 2025 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ITY+O7Rk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xWujQkwH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CA256C9B;
	Tue, 11 Feb 2025 16:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291845; cv=none; b=MK6p4GbCKZQmyr/cTP0piOehbiG7Rf2yAXELTYGWWIQNwnykjPeXKGk5d41Y3S9d9nME9mODPKA96GDQ5fWRtGI8b6nMmY7uzTqmqcBn6Mw4ZsTTEJNfVii3dvODtKfnhTgY3lHIwZUuzkon/HOTtatJTD2dc4B13KaQIpcqOqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291845; c=relaxed/simple;
	bh=wTcZVh+5chhB0uVWxxrfeC5Q+xm67GX08OZiBwtDuLs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mWn/SPtVZJUzyZWMjzMT8kjHm4gTDhG+sD1Wr4Oudbs6fcJ0R0bAVamTTWfjTLVk0tL40N2sERrJnce+fOHR6Yr1STDbUF/G7C6eLF8iKM2U0qJRjmXE0VogihgkUNCI4jkO/vzx7ZFNxP+6bMcuXvmw9Ek4nNucuZsMTamI8eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ITY+O7Rk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xWujQkwH; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B34B72540168;
	Tue, 11 Feb 2025 11:37:22 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 11 Feb 2025 11:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739291842;
	 x=1739378242; bh=Bs3Mg3TUHUY0bHZvGUIsNkVsC9E3+UGPys3EH2kDpDI=; b=
	ITY+O7RkUB+yfzWcAeL0JVjxC73HRbmjm0a583Fhw1PA4gktH/ub+Ijfd/a7/wJ9
	2wQkmnNd5g0luvcKA6wvxgUbXHNWcAwhEDeQGWzyMju6HlxsfhHTHaxuJDOSDOlM
	+omtHUWDfcKfv1quC/wfCL5nVe+idbMFCHeOn7Vg5boIk5inrFm0qc0DfSTtsoM9
	V0L6eczvI/P+kYVwD7YDvh2y3p48/tZH+WoYOaIA4TcjToWz8Ui9j5bA2/U4BEGU
	uDNTu3M/QTsaIB01k85kN0XQQN8mWhPBMU/pSYORBbeOSCeA/5P5ckI/ZkUArrZ3
	sUM9niKHptDZjG+opaSKQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739291842; x=
	1739378242; bh=Bs3Mg3TUHUY0bHZvGUIsNkVsC9E3+UGPys3EH2kDpDI=; b=x
	WujQkwH+H6f+LXMqePsk/Z5BgbopD4E8d/cOJgDIgRt9Wbr/2pbi2zeGPD6KQFlG
	+OoHdqjFfidkMPvLAwWtQt63fLijBIEgix7g6gm6sMo09IV42twB1Epf1d8YOJoX
	EX8kGWz6KTkDFfiV1cLxd0w8aBhroQoyTYEwn+93j6D0km67GdBUuxGoVpuvhSIH
	xNN4XiSPaXbZ8fV/ppBsgupUYa7JLKkMAVG3w5B3u0Zp/vgPaf+FMa+tmohS7PLy
	bLnOpKgHpN1PDsxJaJoPg6vm3anDinSyXbzUEyulQSY1pS0ylUhaaedQBU1acPZb
	BOSIY9fkDTv9qiBSxtlkw==
X-ME-Sender: <xms:wnyrZ9VHYcNN9-LNsveqz63E-QCIcRFpnnTvfpJio_PGORbOlKymHg>
    <xme:wnyrZ9kPR82yJ4UNEV8Ld8w3D2c19TlJM1wtth5Yaix8YI1i1YNp0ZSeCW4oxnkp8
    vsLDvtqji7lgpZ_7EE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughrghhithigsehgmhgrihhlrd
    gtohhmpdhrtghpthhtoheprghnuggvrhhsshhonheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhnrh
    grugihsggtihhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheptggrlhgvsgdrtghonhhnohhllhihsehlihhnrghrohdrohhrghdprhgtphht
    thhopehkohhnrhgrugdrugihsggtihhosehoshhsrdhquhgrlhgtohhmmhdrtghomhdprh
    gtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:wnyrZ5YN6wDxERgOOuHEG7qKRKFwuoX4kbm5pYpOUitQbiLxkaPqNA>
    <xmx:wnyrZwX5dHEkh1VwrnuKO0QjVdwdhoAayBgWVB_TWJRuaFjgYdGPYg>
    <xmx:wnyrZ3lJaIlx71dgfvJDSohrEMaiYB3UwD7RCeao2d2nS4cQIeAT_g>
    <xmx:wnyrZ9ea3F24uJY9En3D-VqabQNHxXlm57xpcUc9rdtBoKkCBn6Wug>
    <xmx:wnyrZwhl_ovSGib8iBkyME_y59gXJ1Y2ghZJnl2fPjlOhVgKx6Z70DPc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 273B32220072; Tue, 11 Feb 2025 11:37:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 17:36:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Caleb Connolly" <caleb.connolly@linaro.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>
Cc: "Dr. Git" <drgitx@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Message-Id: <03b47c1e-75a5-403f-a6a3-45a06e5e10f5@app.fastmail.com>
In-Reply-To: <22b42e2a-55f9-40c5-93a2-bd18a5ac3af9@linaro.org>
References: <20250207151706.45031-1-caleb.connolly@linaro.org>
 <85c31e1f-20bc-4e48-b179-e44ee8e1f816@oss.qualcomm.com>
 <a22afa6d-18de-4b83-ab08-6b23b9a1d927@linaro.org>
 <3dc16129-6f1a-469a-a4fa-ecbfbeff53cf@oss.qualcomm.com>
 <22b42e2a-55f9-40c5-93a2-bd18a5ac3af9@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: use guard pages
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 10, 2025, at 21:05, Caleb Connolly wrote:
> On 2/10/25 18:14, Konrad Dybcio wrote:
>> On 8.02.2025 12:49 AM, Caleb Connolly wrote:
>>> (resending from not a mobile client, oops)
>>>
>>> On 2/7/25 21:20, Konrad Dybcio wrote:
>>>> On 7.02.2025 4:17 PM, Caleb Connolly wrote:
>>>>> From: "Dr. Git" <drgitx@gmail.com>
>>>>>
>>>>> Rather than manually define the guard pages, use the
>>>>> "qcom,use-guard-pages" property for rmtfs.
>>>>>
>>>>> Signed-off-by: "Dr. Git" <drgitx@gmail.com>
>>>>
>>>> I'm not sure this ID is acceptable
>>>
>>>
>>> Linus & Greg explicitly allowed for aliases previously. Patches by "Asahi Lina" and others have been merged.
>> 
>> Correct, however the trust is put into the maintainer. Marcan et al. accepted
>> patches by ""Asahi Lina"", as they had enough confidence to put their name
>> behind said contributor not being e.g. on the sanctioned lists.
>
> Right, well please let me know your decision and how you'd like to 
> proceed if this patch is unacceptable.

This is clearly a grey area, but since you are familiar with the
patch author, and are have added your S-o-B, I don't mind taking
the patch through the SoC tree with that S-o-B chain, even if I
would not personally apply a patch from the same author without
additional information.

I would suggest that Konrad should follows the same rules
here, but of course they are free to make their own decisions.

     Arnd

