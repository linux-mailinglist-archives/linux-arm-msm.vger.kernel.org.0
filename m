Return-Path: <linux-arm-msm+bounces-35196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6C9A6101
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BED1FB24C32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEE91E47C2;
	Mon, 21 Oct 2024 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fW8qPxjG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jABelndI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F146C1E47BD;
	Mon, 21 Oct 2024 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504912; cv=none; b=mLFj/YwiOKOMkmTg0jXuWJI7RbbNtcRCMQORZ4Z6Cp61BaSMDE/QLv4O9teles6qH+nN5CpyqKWL8RgIgDqJZp7A1EraWqGZEV08fFowcN4m61y+sPOnlXL7tjV8Q5rprbdi+Mk+5xJGSQHXst/EbXY1a7+J/SXbD4nBma7/Ydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504912; c=relaxed/simple;
	bh=MoTOl9y90sIoORVxCJbn2v1vz4mCgEMa1EHPh5uYnDk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Z7Zdj6RPsLNyILp54basGQUHSbiCpK1aFeGyxsI6XIjNl8o2ut4vBTfcQW+RzOLS3DmXwDZsOmf70+2TNnATS+JRkMO5QZw/H1Xa9669EqYCgu8HE5F6v1Ga2U5mxSkMU2rLtMKrFMvU6KNOU2rCXMQDVU1MMImtKaeKWb0ZpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fW8qPxjG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jABelndI; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 16752114014E;
	Mon, 21 Oct 2024 06:01:49 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 21 Oct 2024 06:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729504909;
	 x=1729591309; bh=PsU+reKmiMH+6dEqfODUv58RE75ILNro4ASwJ7hVYxU=; b=
	fW8qPxjG7VpETcQZqSN8x7slQpdpGZSXj/1i0G+iYnzS65RSdZDu6nZKZPCwUA5D
	ojXmy4onqcjAyxlTVJWvzsQlwrpSU2ec1WElDzalvD5hSrKR/FqaxWfmoa+FjFIn
	8qHR8WUVFURK9guGsh+p/m8xI/jJhtpx4CndtTxPGbI1JP/93O+zMEWLiVuuKMXq
	KT4PnTiqc/FHg3PTyXM4rNfgPAnyISRYqGIZkaHr12QwQFAM143HuiRU/sS7U1Pv
	m/3/ucIdtZ930Tt8EplH01vxQIITKJQ4VQMsxSetNWPkzXl3dS2TwpsF2q2VZdPI
	B1YWt/SPaAIF/LJoP+jidg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729504909; x=
	1729591309; bh=PsU+reKmiMH+6dEqfODUv58RE75ILNro4ASwJ7hVYxU=; b=j
	ABelndIinU4Ip3zsU2JLWu9OK82+lIcLkoK5GjsL5/jsw1zKkhfVn87BBhhcQ0sY
	YcSo0fbRVJ+zy0dv7SdcLIZ06MvtdZyaLXBXLPdCL5vLh8GCmnxwstvBHB/hZ076
	veSSNj5kIpJdAMv5lAQLfcieGl8N8xmZ6f3drRv5X+ij2fjGyRovySrqe/gWazf2
	tdAyMRPLsmAXMgOMBIhkoMj/cLZIww0lTO4sr8yLe/LQW6wJoDzQ51W+yC//+/5V
	+DASU2O1z+aCWeUy7pcg8CV1qDymURDlSP8IyaaFKL/j5Rk9s7wLbCiRp9Wyg6gE
	Ho/1rOjSmtDbZfNnGvSEw==
X-ME-Sender: <xms:jCYWZyUjmgpQ2rFm9PI5WmhydfRMwhu9juI9XhP6D2OsvcwxWs82Ow>
    <xme:jCYWZ-lQRsM5NJjNwLZ6fQUj_ZKsDF8ejCoV8ENmeVk7Eeo3xjeixatFiPkVVt-V6
    OQy4SUeKpBMchwfMrc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehledgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
    hhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehr
    ohgsuggtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtih
    htthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepnhguvghsrghulhhnihgvrhhssehgohhoghhlvgdrtghomhdprh
    gtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrggu
    higstghioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:jCYWZ2Yhzu2akfZrZXSayTsw8WmZoV4vH5mcPhNJLxFvmlBalUAOIg>
    <xmx:jCYWZ5VIsfWAmVcaWQKxstu8OQDdUJtPWNuBN-ZbW147Cqn0LKlIYA>
    <xmx:jCYWZ8mJUT9n2g6iT5Vrxtvhy6sC4Z0m9JF6HpeMyAeerDFjgYSkqw>
    <xmx:jCYWZ-fctAsd8clqYV3sdEV6qpUbmzALG6BHgPI5dZp61ACP49y5VQ>
    <xmx:jSYWZ7cl9AYBzFKgb6f7YxD93SOgWHmFu6zwK5_rHqop8fDSx6LV_fYq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A3942220072; Mon, 21 Oct 2024 06:01:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 21 Oct 2024 10:01:27 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Akhil P Oommen" <quic_akhilpo@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Rob Clark" <robdclark@gmail.com>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Nathan Chancellor" <nathan@kernel.org>, "Sean Paul" <sean@poorly.run>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <cb728358-ac32-4b37-a954-967f338385e2@app.fastmail.com>
In-Reply-To: <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
 <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
 <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 21, 2024, at 09:25, Akhil P Oommen wrote:
> On Sat, Oct 19, 2024 at 04:14:13PM +0300, Dmitry Baryshkov wrote:
>> On Sat, Oct 19, 2024 at 03:01:46PM +0530, Akhil P Oommen wrote:
>> > On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
>> > > From: Arnd Bergmann <arnd@arndb.de>
>> > > 
>> > > Clang-19 and above sometimes end up with multiple copies of the large
>> > > a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>> > > a6xx_hfi_send_bw_table() calls a number of device specific functions to
>> > > fill the structure, but these create another copy of the structure on
>> > > the stack which gets copied to the first.
>> > > 
>> > > If the functions get inlined, that busts the warning limit:
>> > > 
>> > > drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
>> > 
>> > Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?
>> 
>> Kernel stacks are expected to be space limited, so 1024 is a logical
>> limit for a single function.
>
> Thanks for the clarification. I think it is better to move this table to
> struct a6xx_gmu which is required anyway when we implement dynamic generation
> of bw table. Also, we can skip initializing it in subsequent gpu wake ups.
>
> Arnd, do you think that would be sufficient? I can send that patch if you
> want help.

Yes, that should work. I actually tried first to turn the model
specific data into static const structures but that ended up 
not working because some of them have a couple of dynamically
computed values. I think that would have been even nicer.

      Arnd

