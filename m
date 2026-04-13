Return-Path: <linux-arm-msm+bounces-102979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGpqF34X3WmXZwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:19:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A583EE9C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85E5B3021733
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 16:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0335C2C21C4;
	Mon, 13 Apr 2026 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4LeMJ90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25D226E6F3;
	Mon, 13 Apr 2026 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096533; cv=none; b=LHKo5lXiNsIL/9qdSwP6IZSLFwvAQybJcltGbowx89A90+5tMtDaMRB7nIuSv7scXIi261Q0xXl2Hm7/aeEXAvs9y3J87QkbWlAOYjogCAdN5o2TmxKhGtwhKpOnmCASxB7381D8z0gF4wmUFYPVfMQgCb4bbK9Frz7Pc39cUc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096533; c=relaxed/simple;
	bh=OgAFjZ0sSZ6PN2bYz/YPopqq8d5scdkfHFJT5oZSN9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMgcgBpSzZjTnFrW/H0qv64/bzLgspdxDlBSxWlj88Z7s9+vGnvVJaq+FkoYl3ktZ9pCWi70UfD6AqRFjD4vl5a46C0pvF18x+leM8ZlYaB8mRVbIm+13nG12iE5lY9vi3DfOZ/Jvp5dF4r95Jqdw2HoUjTo8krXejrUkv/CFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4LeMJ90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A62C2BCAF;
	Mon, 13 Apr 2026 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776096533;
	bh=OgAFjZ0sSZ6PN2bYz/YPopqq8d5scdkfHFJT5oZSN9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X4LeMJ90FATjSX48b6gTm3NiWMUCSaLU7BJw25dlIPP1OEl6C9hzmaYVogoYqFCLP
	 QhgWH7AjU9rIX7lE4Zl6Xb0lVoLCFm84QhbNendGmNhtZpxVr4BazPUWbXV+rGgrlT
	 8dIC6EEPOlE5t8yy49HQszSEwKVhMsHLBZv1vUq0AglETywHV1xi0r18qqI38mWfit
	 l9b2taxD+t025I0O5ZSwW2ByE+9mYBLvocEpvi9v+yFVURpBZAvExMbOZrtfXXuBqj
	 H2uNj8lnk/bJbUqz3O+qrjFIPP4EZmzwQqKYTqvC+v9ybLn1EE55L2VpbnbmRfZ0MY
	 Fqgm1gxTDbiTg==
Message-ID: <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
Date: Mon, 13 Apr 2026 18:08:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
 <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8A583EE9C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/04/2026 16:34, Shawn Guo wrote:
> On Mon, Apr 13, 2026 at 03:30:28PM +0200, Krzysztof Kozlowski wrote:
>> On 13/04/2026 15:10, Shawn Guo wrote:
>>> On Mon, Apr 13, 2026 at 02:40:18PM +0200, Krzysztof Kozlowski wrote:
>>>>>> Please organize your patchset correctly.
>>>>>
>>>>> Are you asking for a big series that consists of all the new bindings
>>>>> used by Nord DTS and DTS itself?  Unless this big series gets applied as
>>>>> one-go, there are still chances that bindings get into a kernel release
>>>>> without any users, e.g. subsystem maintainers pick up bindgins being
>>>>> reviewed, but DTS requires more iterations and thus misses the release.
>>>>
>>>> Please follow existing rules, communicated multiple times on the mailing
>>>> list. Qualcomm also has internal guideline clarifying this.
>>>>
>>>> Below are some upstream discussion clarifying this:
>>>> https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c
>>>> https://lore.kernel.org/all/49258645-d4d8-44a5-a4fc-b403c926a5d1@kernel.org/
>>>>
>>>> And how to do it:
>>>> https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org/
>>>
>>> That's what I'm trying to do, posting bindings in prior to DTS, so that
>>
>> Hm? Nothing above claimed that. I am sorry, but which rule either
>> communicated publicly or privately encouraged or even allowed that?
>>
>>> when posting DTS, either bindings is already merged or we can refer to
>>> lore link of bindings.
>>>
>>> I still need to understand you comment "Bindings come with the user".
>>> Are you saying that bindings and DTS in different series should be posted
>>> at the same time to show bindings has an user?
>>
>> I am saying that you cannot post bindings alone where there is no user.
>> Why do want even such binding? I see no point in having it in the
>> kernel, unless you speak about very specific exception, but then please
>> clarify that exception and why it applies to this work.
> 
> I think I'm getting what the requirement is now, but still not sure what
> the point of the requirement is.
> 
> - Posting bindings and DTS at the same time doesn't guarantee they get
>   into the same release.  It can often happen that bindings are merged

No one claimed it will guarantee that and no one even suggested that.
Submitting patches even describes this...

>   alone into a release.  So it doesn't really help to avoid situation of
>   there is bindings in-tree with no users.

That was not the comment from me, either. When I say there is no user, I
mean no user at all. Nowhere in ecosystem considered usptream, including
mailing list.

> 
> - From what I can see, there are always DTS patches coming after bindings
>   changes, sooner or later.  No one would be bothered to submit a bindings
>   if the DTS using the bindings is only kept out of tree.

I would be bothered. I don't want to maintain unused (unused as in
upstream) ABI. I don't care about such ABI for downstream users and no
one in upstream should spend any precious cycles on reviewing something
which serves no upstream purposes.

> 
> In short, there will be Nord DTS using the binding coming, and I do not

Maybe there will, maybe there will not.

> think posting them at the same time should be a requirement.

Well, it is a requirement as I explained previously, said that
*multiple* times on the mailing list, documented expectations in
mentioned/linked email threads. It's also documented in submitting
patches in DT (although not with that strong wording).

Best regards,
Krzysztof

