Return-Path: <linux-arm-msm+bounces-94644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEQNLAteo2myBQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:28:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6C1C91AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CDA9301916B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 21:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA02931715F;
	Sat, 28 Feb 2026 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="inrtWo1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B45317150
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 21:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772314119; cv=none; b=ra/kyn7k5rHJG1dAQQy2NQCCrn+SZyER7c3f3s2v0D5BYar0eC+AHv03el3C9eTtJvRASPCueRhV0blw58TN6pkz1K1Dfo6DxGUWGuV6Dg+q4zhJHjCLeBK1+u3w+iq6KO5xGaqT55pH+3jgq9aS9oyVrPFEGHfQwHEmZcViybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772314119; c=relaxed/simple;
	bh=JHfkwcQgJSlz2GM0sgnpNaNxj1ZXE/S9TRi/hKsJgrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1heyNxxmNDOFq3x7Ai19BNOUbNjKUTzvGyWSSfkLDa4ML7amRhGyWGKlGISBYImAzf6oOYfYJSCaZudFYtusXVt3pyaGuVnpFg0fWc4MYAOLZkG2VzbLZnA9lRh2RFcceZ9AO2bU1WmB3b6ye5D5V70aj+lTSjCAICgZStAzjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=inrtWo1o; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <ad2c1f24-d205-4fb8-a79c-b955c0d08d40@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772314102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2drmw23LMhAgqnFvPZArzH0QWWWznsj4GGf5ZiSEOsg=;
	b=inrtWo1ogxteJXPqsWDrYMM3i44qox2INfkGkt0RqUdMGn9W2FQe87It27cRrU/p2IspfU
	uj3iT56Bouh/7gJ9tCykH1XFiVZEHHtZvXN/JA9xgGLwK1moFpPItdNZmCFapakhmOgPYU
	ufUHMOe2EtsNlHQcwfNYXW/KXastyHjbK44eVlXrqPGX4kfQHJxyEe/wvBKZj/lDbk+mA0
	KMffRQKyV+6ozSeDIRTFFGEkhWVM98Ej9uiFh6M0zaMvenmmLEFkOLkgZm+G63QSIyVcXh
	P8snT4+pm0uVcQXB6iNWEmDqzm0pX6FCdGPOFdoiwUt8WCHLnmmL6l6DZ4vcMg==
Date: Sat, 28 Feb 2026 18:28:13 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Fix DTBO boot failure
To: Aaron Kling <webgeek1234@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kumar Sharma <quic_vksharma@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
References: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com>
 <d4faaf8d-1517-4187-8801-a2dd52d8dde3@kernel.org>
 <CALHNRZ9k3yxXb9OfYXMSfEwyYKU8Rrrrjb-hPqLgU90X9YBP8g@mail.gmail.com>
 <487e4605-0a21-48d6-8b77-9ce2799ad212@kernel.org>
 <CALHNRZ8sqCpUMyCFP99b7nHu2onojZ0EY6YGQZ9RMP0kH8jWzw@mail.gmail.com>
 <gd7puun6xy5bh4q73mqc5ooza2kzla3rtov6d2723zc6tw7qwi@gxbsnloi2qcw>
 <CALHNRZ87j=j5LEMA=P=D73vOz1C-p+BDKcXV2bH7rcPDtAx9JQ@mail.gmail.com>
 <dczz4uvcq4hc6p3zb6xnrsgmfeomwliagwhf36tewdz4z6mndp@afbxzhjziiwv>
 <CALHNRZ9eT+mEqaAbj0-My4DriKWP+WPy4M21caXhOJPQuuVNhA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <CALHNRZ9eT+mEqaAbj0-My4DriKWP+WPy4M21caXhOJPQuuVNhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94644-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: 56A6C1C91AC
X-Rspamd-Action: no action


On 2/16/26 11:27 PM, Aaron Kling wrote:
> On Fri, Feb 13, 2026 at 10:02 PM Bjorn Andersson <andersson@kernel.org> wrote:
>> On Fri, Feb 13, 2026 at 04:50:25PM -0600, Aaron Kling wrote:
>>> On Fri, Feb 13, 2026 at 2:34 PM Bjorn Andersson <andersson@kernel.org> wrote:
>>>> On Wed, Feb 11, 2026 at 09:10:39AM -0600, Aaron Kling wrote:
>>>>> On Mon, Feb 9, 2026 at 1:51 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
[…]
>>>>> My use case here is an open source Android rom. I would like to think
>>>>> that android would be a supported use case. Not necessarily a driving
>>>>> force for decisions, but at least supported. And I'm using the
>>>>> standard boot image v4 setup with dtb on vendor_boot and dtbo's on the
>>>>> dedicated partition. This isn't some weird and wacko setup, it's what
>>>>> the vast majority of devices this soc is used in are designed for.
>>>> Android isn't a weird and wacko setup; but I'm guessing that the
>>>> proposed changes aren't related to running Android, nor are they related
>>>> to dependencies of the overlays, but it rather relate to some
>>>> runtime-generated overlay that ABL wants to apply?
>>> I honestly can't say what the underlying cause is. A couple of us have
>>> looked at the public abl source and weren't able to find what causes
>>> this issue. We just know that this issue happens when abl tries to
>>> apply a dtbo off the dtbo partition. So yes, in technicality this is
>>> not an android specific issue. I mention android because having a dtbo
>>> is generally expected in the aosp setup. In my specific use case, I
>>> have four devices from the same odm, where it's simple to split the
>>> common part into a dts, then the device specific parts into dtso's,
>>> allowing for a single software build to support all four devices.
>>> Requiring everything to be baked into a dts would require separate
>>> vendor_boot images per device, and thus completely separate build
>>> targets.
[…]
>> Sounds like it, but I don't know what it is that ABL is expecting to be
>> able to insert. [0] seems to mostly say "I added this and then it works"
>> :(

What everyone (well, postmarketOS community at least) has been doing 
when running mainline kernels on ABL devices is `fastboot erase 
dtbo`(*). Which is why we don't have any DTBO target nodes anywhere 
upstream.

If you want to intentionally use ABL DTBO, and you're absolutely sure 
you **don't** reference these nodes in the DTBOs you're making, then 
indeed it might be some "runtime overlay" coming from ABL code.. but 
have you tried adding these nodes in the DTBOs themselves?

Wait, also, what is the build process for your DTBOs? Could there be 
some weird Android build thing that inserts references to these nodes? 
Have you tried decompiling them with dtc and looking at the resulting dts?

Also have you looked into intermediate bootloaders as an alternative? 
postmarketOS uses lk2nd on ancient devices and U-Boot on modern ones; 
these bootloaders can dynamically choose (or even modify) a DTB based on 
runtime detection (like ABL cmdline). Might be hard/strange to fit that 
into the Android world but well, that's Android's fault :)


(*) except on some old SoCs where we need a "blank" dtbo that just has 
qcom,board-id! https://github.com/barni2000/dtbo-lk2nd (cursed)

~val


