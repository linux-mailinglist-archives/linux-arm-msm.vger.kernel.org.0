Return-Path: <linux-arm-msm+bounces-98530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M9dCSrDumkGbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:22:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 900182BE1A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 722A83070784
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D43F30F53C;
	Wed, 18 Mar 2026 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXcQJ+CQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3754030E838;
	Wed, 18 Mar 2026 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847133; cv=none; b=iZ9Q/2wgVtGNql2o5x5cHk0g9MAUULZ7gXyFnk5Ux33LFDtSkMEZW/lJ5LFg52xCxCUKMyFMvDtCEOJAHdT83d+/0WWuyG3WjAgARigaRjnlw14RJ2kiwzxcGPN7nqkf6aVrUqTJPQAaD6s4rLtcb0CauR4RgGbVGoOxstZ4egc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847133; c=relaxed/simple;
	bh=v1kABP4SPzJlDc32hr91YfoLTI/cKMuwiXNSRVVhsiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5YPuNbc4K8fLi/c3KsiG8gCcOFNeMtGHDdQIBsi3o3n96L14Li0+sbuBabL6gUsxD8RgaPLMXvUV0HISMBBs9iFarAtsQ5/HgR/rhJPpeGXIGco6XRLwPts/HkdPxI+QM/J9CRUL0TNTY5fDd7Dewt7BalxHz6dpxv5BLXFkBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXcQJ+CQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BC8C2BC87;
	Wed, 18 Mar 2026 15:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773847132;
	bh=v1kABP4SPzJlDc32hr91YfoLTI/cKMuwiXNSRVVhsiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OXcQJ+CQh5mUVRQ0+FKvABIQ+X0r/fUJ1KMO/iBz3YggA+E1Nqcr0EPmlwO8yq8y0
	 pc2SaMeT1Mu1d+T1F8oTK23oT4Ptbc7LY2Qt1y0vYnG7YN+PV2qWwyu0N52OjUF2LL
	 CMK6ajZBqtqPGCJvNN5qcxoVp/+o6HSDCOMEIzZImyt+seJCDJiRnWfhhbW6cdcpbH
	 OlFEVNu56rCb/nJjaY+60dToknI07Jcb7kYhgM1YPUuW7KiBmFCu9X59X/oMI2bN/W
	 NRjjdcdfCfGgNs9sQCuD1tctgOkpBGg/S0tY68z7sujZ46hTVngtlmFwdWIKL96DC+
	 763/y2gM8VVXw==
Message-ID: <71f6a6bc-4f46-4fe1-8ea1-072d6717070d@kernel.org>
Date: Wed, 18 Mar 2026 16:18:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
 <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
 <2227a9d2-fb34-4d54-8122-c00f54009de1@oss.qualcomm.com>
 <846ae47c-8e0e-4fdb-899d-de679d013fa5@oss.qualcomm.com>
 <xofpfzgcsmjhprnnffqrwbauisbsctg7bedtri2vxtxk5zowz4@rjlmceevwesg>
 <9ea16bfe-ac9b-405c-8597-e4f398347d8f@oss.qualcomm.com>
 <oqgc2rtmtr725u723vwueew2g7oq5aro47744j445373j4pp2z@e4oaur2fggyp>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <oqgc2rtmtr725u723vwueew2g7oq5aro47744j445373j4pp2z@e4oaur2fggyp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98530-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 900182BE1A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 16:05, Dmitry Baryshkov wrote:
>>>
>>> Then please follow the internal company guidelines as outlined in the
>>> legal&marketing documents.
>>
>> That's not your task to instruct people what internal stuff should they
>> follow or not.
> 
> Well... For me it's not different from your comments telling other
> submitters to follow "internal guidelines" when submitting patches. Or
> not to follow them.

I am telling them to use go/upstream, only because they do not follow
public guidelines, so we created a streamlined version for them.

It is only convenience and all of the internal guidelines are based
purely on upstream rules. They do not introduce anything else, no new
rules, no weird copyright rewriting rules.

I understand however how my comments could be misleading and someone
might think I recommend following some corporate legal stuff. Thank you
for bringing it up.

I will indeed change my comments and say they need to read Linux kernel
docs.


> 
> I don't want to argue about the corporate guidelines. If you think they
> are incorrect, please change them.

No. You brought them. I did not want to discuss them, I did not say they
are right or wrong. You brought them as review so you must defend them.

Otherwise do not bring arguments you are not willing to discuss and
reply "please change them [corpo rules]".

> 
>>
>> Especially not implied by previous comment "Then".
>>
>>>
>>> JFYI, several other Qualcomm maintainers also enforce use of copyright
>>> headers for Qualcomm-provided patches. Konrad is not unique here.
>>
>> I already objected to one of them, so I know.
>>
>> You do understand that this is completely broken review process? As
>> every contributor, I can object to that comment with arguments (and I
>> did in the past), however you as reviewer do not bring any
>> counter-arguments for that all. You just refer "follow legal internal
>> stuff". No, this does not work for that.
>>
>> If you bring review comment you must be able to justify it, when it is
>> being discussed. You cannot refer "but legal team said".
> 
> If you want to put it that way, sure. As a Qualcomm employee you have a
> set of internal rules you have to adhere to. One of them is this

In the context of discussing code and contributions, it's none of your
business where do I work, what is my employment status and what rules my
employment or lack of that implies.

> copyright string. I'd rather not have legal department pre-review all
> our contributions. Been there (in another company), thanks, but no.

Again, nothing related here. If these are your feelings, fine, but do
not impose some rules on the community because of that. Whatever you
have with legal department, please keep for yourself.

> 
> In my opinion, the maintainers and reviewers should ensure correctness
> of the patch. Correct legal header is one of those. Consider someone

And the patch is perfectly correct. I carried over original copyrights
which is the correct thing to do.

Please bring any document from upstream Linux kernel suggesting it is
not correct.

> submitting patches which has copyright strings such as "(c) qwalkomm" or
> "(c) lunix foundacion". They would be questioned for correctness.

Patch hash perfectly correct copyright statements, carried over from
code I was using.

The rule is rather that we do not touch copyright statements.

> Likewise when somebody from Qualcomm submits a patch with "(c) QuIC",
> they were asked to change it to the current form. It doesn't concern

That's not the case here.

> non-Qualcomm employees, because they cannot change the copyright of the
> material.
> 
>>
>> Otherwise look for comments for your contributions where you are going
>> to receive review "please remove all boilerplate because my legal team
>> told me that and I am not going to provide actual arguments why".
> 
> In this case there is one. "Because I assume that you have a requirement
> to do so from your company". If I were reviewing patches for e.g.

You have no clue what are my requirements from whatever there is my
company and it is none of your business to even suggest or decide that I
have.

Don't make assumptions about other people's employment, regardless
whether the actual guess is correct or not, because my contract and my
employment is only my business.

> Mediatek driver, if I knew the guideline for the patches and if I saw
> any of the guidelines to be breached, I'd have reacted in exactly the
> same way.

Then don't. I have no clue what rules internally Mediatek has thus I
absolutely should never say that one has to follow some internal
copyright rules. Neither should you.

Of course you can comment about public community rules and guidelines
about such things, but that is not the case here or in your example from
Mediatek.

Best regards,
Krzysztof


