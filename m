Return-Path: <linux-arm-msm+bounces-66994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA8B14D1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE7BE18A2151
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F6C28E607;
	Tue, 29 Jul 2025 11:41:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mifritscher.de (mifritscher.de [188.40.170.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F421ADAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.170.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753789317; cv=none; b=jAyKX1IQ5BzsGiml8ZwZJNSc/9mckilfiZZW5PRt3n7b8UCLVeYiN6g+Afq6LApKpJ1kKZsIlJit9+/FzM1Mvu39lBSQDhfExCCu9BebWhTrMz8DT9TeYxRfdeOimn3NVq1FEIsBLgjMD5o8E6nHfX/WYv9KUVk7Ra5Ce5GQRlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753789317; c=relaxed/simple;
	bh=/SdHLnWf+qIw4+1pvu8zU+c31os7E2nQW39rqXrALsY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BmcN9DRB+PNNND4jEKuEzVeelTbtdZ1BkIEw/xxQnb1afNuSZs4F5O1r47+nLZQUfJE8av1jLQ+MCnk50Om3votcRhpyyE+57ZtEgcRffsK8IDv0wBectbpjF+lFFRFw2WSzSwWd3Cyh2CO6a66K4XB/dNX++Yn0bO7Uiz8XzjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fritscher.net; spf=pass smtp.mailfrom=fritscher.net; arc=none smtp.client-ip=188.40.170.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fritscher.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritscher.net
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mifritscher.de (Postfix) with ESMTP id C70E63B1E60;
	Tue, 29 Jul 2025 13:41:53 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mifritscher.vserverkompetenz.de
Received: from mail.mifritscher.de ([127.0.0.1])
 by localhost (mail.mifritscher.vserverkompetenz.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id RdY1xZyT56MO; Tue, 29 Jul 2025 13:41:52 +0200 (CEST)
Received: from mifritscher.de (localhost.localdomain [127.0.0.1])
	by mail.mifritscher.de (Postfix) with ESMTPA id 679883B00E0;
	Tue, 29 Jul 2025 13:41:52 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 13:41:52 +0200
From: michael@fritscher.net
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [newbie] [patch?] for mhi to get Quectel RM520N-GLAP (WWAN Modem)
 running
In-Reply-To: <ea81638c-c9eb-4a3b-9a74-a590729e1f8a@oss.qualcomm.com>
References: <8040b225-5735-4bc5-aed4-f6432bb045ee@fritscher.net>
 <ea81638c-c9eb-4a3b-9a74-a590729e1f8a@oss.qualcomm.com>
Message-ID: <4e86ee1ab2b310a19fc4d26390c3725c@fritscher.net>
X-Sender: michael@fritscher.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Am 2025-07-29 12:05, schrieb Konrad Dybcio:
> On 7/29/25 11:27 AM, Michael Fritscher wrote:
>> Good day,
>> 
>> my first email here, so a tiny introduction of myself: I'm a computer 
>> scientist and work e.g. with OpenWRT and microcontrollers. I know some 
>> basic workflows with git as well.
>> 
>> So, while getting the Quectel RM520N-GLAP (the GLAA is running ootb) I 
>> stumbled over problems. Luckily, there exists a tiny patch ( 
>> https://forum.gl-inet.com/t/how-to-installing-vanilla-openwrt-on-gl-x3000/45404/15 
>> ), which only adds a PCI Vendor/Product ID variant for this card to 
>> the mhi driver. It applies cleanly against 
>> git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git . I've 
>> tested it with current OpenWRT and can confirm that it works.
>> 
>> The big question is: How to get this patch into mainline? ;-) Should I 
>> simply send it to this list, following 
>> https://kernelnewbies.org/FirstKernelPatch ? It is also ok for me if 
>> somebody else steps in.
> 
> Hi, you'll likely want to use the b4 tool [1] which simplifies a lot
> of the boilerplate in the process.
> 
> The general idea is to:
> 
> - check out Mani's -next branch (since you're targeting it 
> specifically)
> - create a new branch based on it
> - add your commit (title and describe your changes similarly to other
>   commits in that directory)
> - make sure you sign-off on the commit
> - compile- and boot-test it, confirming everything's in order
> - send it off for review
> - respond to review comments should you get any (which is usually the
>   case) - there's a big doc describing the process in quite some detail
> 
> [1] https://b4.docs.kernel.org/en/latest/
> [2] 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
> Konrad

Hello Konrad,

thank you very much! I tried it - and hope that everything is right - at 
least the mail seems to be sent ;-)

Best regards
Michael

