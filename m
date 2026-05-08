Return-Path: <linux-arm-msm+bounces-106590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFseDJCU/WnWfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:45:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8424F3386
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 09:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 070DC300ADAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 07:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C0B36E49B;
	Fri,  8 May 2026 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="C7DmsEpC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D337647B
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226285; cv=none; b=YhWEkAsGOzF18Kuotdz2PnVeQEAvcBx1uQ4N42HtZSnwUWP5cFSCzAByr3XDRiwY9kMv+WjVlBags/GYwu6f6gyfk7fFCpYwwldCUoxpAWqlK1pppVdfcnkS0i3u8VmgtpjYBDd0UvpkPaK2uH45hJP+486vq3k1c9I8y/WDiYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226285; c=relaxed/simple;
	bh=o15c3ZjdEV9em/vqcb+hF02R+chYCPmBw+qeMWlaJQg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=A+aOsnFKWa/TjUfSIwDbUXdOqOJYC4w4qNtYcy1gRlY0KpJzZ04pw93QxLDGVhb0oONmgcGnEaZ0VzVhx2VBR3CrV/aldKeoeaQDmlwsxdp+Du0dS5JHp1kRaQL2lbyCH+1Z6I7VZ1Yml6srJUupkSQBCTvAqKYgilR7TVf6FwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=C7DmsEpC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bc64ad08bf9so272443066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778226282; x=1778831082; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDjfGFQB/3KLdXokArqrjAXXqhWAtauRetXWKTzWGMw=;
        b=C7DmsEpC3ahphstpJ8EZ2kF1/Wg9T5KyigmO/ZMaEPmMmlD0AojXDRCP7x5uj/txq2
         laU50Lgn4qQ/xi+DOIzKnNTGFA8nL1baQONmNWho5SZmyNzpgwL/Vwotd6fQgPV8PVad
         l+XiYzHGlbC0MjhJKZrw4YtzQxHLOCRCszCRS+j2HTNFfwofdxbCG9wNbLRVPTdyKbXx
         solHBIQuUBG15YDjiHnN5uTjcOo3kgFTrFTStmeCz0B3Z1RcFdEZ0YneBrihlGs2PnWP
         2DTNkvYhrmR48P4/u1M4JZ/wNb+yEkbUO8xGcD6c46qTbhlBLxMqnfFfQnaIfmnkUlPs
         kmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226282; x=1778831082;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDjfGFQB/3KLdXokArqrjAXXqhWAtauRetXWKTzWGMw=;
        b=juIeJPaMfKkoQM+Q/ulb6L4pVsBXH0s8x595spuABe2SCDeqfnZNuOws/fe17exxtW
         JBm+lyBaS+7GDf6sp6vagnM2GiKNGq3Cc2chFvSuNNhj3lKN49fQWm3JBHonp4nUjTkg
         sdrBGxLdCGMSO3c9XKK6BNPnogWCFLF0cT1wksnIyKh2FKZjZR/9B0gJsTi6Fr9PKiKJ
         FnYK3tooLA3bBCtLJlMx219dPnJukxkEeeBtR7lQ5uZ39UtaMjQId7ARBU75GLLarv5t
         +djTjxfV+fXJF551GCFPyzsSzwWSHsnXbThhc53sjH158IVDu3wz5yQQTtz7SMzI3M62
         vLLg==
X-Forwarded-Encrypted: i=1; AFNElJ9+Zf5NiItqJ50lldmpJVJyrVmEpngB65NrTkKZCWRopYPci67OQX+0wCF7eRYAz/KemDvouFQI/lspOFo7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ix2IWCwO6skq1zHu2y+DoXmzJyiYC3fRrNtU5h12zX32Arjq
	rwYbnvYsgvfBJ/y3EHjd0gEpOdtOkKSWR8pwefqHz4/t027f5pUQJQ19RqvPwEArwH8=
X-Gm-Gg: Acq92OHf5wlwHiaA7FQWkvNs0WF1XEkVhSaA462D0ojk5csXfbyiGCmAUA0JYkGK7e3
	0hw2Uw2sBLb8kt/nX2Uaf8wfdMR004gOZaZ/6vgQtpjWFH1AoCcdoaa3PQu2B4t1NPwvnLYisWM
	6ovouLdatXaS6ccfS6+Gjg0crTFDVXYHhRs9hk+WI9VC7JIZ8m4ygWtHI+nxX/DFy9H6J80KR2B
	enXpyxxZCCo/546OjMMaQbmWiNEerlawTTfWcGjcP/BJoQwD6CLc23PJB1xv6M53oDH4HdSQBmn
	HJym43CE+TsCX5wE36sD/nnVy9QhB9b9CuESManpKJZx5pQIDXpM2ZSGSX6nj8HfP4fIK67/mS7
	AAXoaW8m68w0INgngtLqMq1GEcFTy8Cs4cJIIoaqV1T7hfrnLd3zhKIQ3s0k5QlR1IuHJTBEtFR
	0r+cnhtDJF35AOSY8UObvL79Ao9Kb10+Ndmnai+ibjahxy+dnCS+jGxo7Tot1r8o6nr03b
X-Received: by 2002:a17:906:c394:b0:bc5:cff4:8e3c with SMTP id a640c23a62f3a-bc5cff4af34mr446060566b.40.1778226282237;
        Fri, 08 May 2026 00:44:42 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac43581bfsm42651566b.46.2026.05.08.00.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 09:44:41 +0200
Message-Id: <DID4LW3GMLDV.338VDV2L2IPL@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Novatek NT37705
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Conor Dooley" <conor@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
 <20260501-yogurt-wise-2a2884e3ec59@spud>
 <DI9XL1VYYTY7.19IRSM8VIDO53@fairphone.com>
 <a2444df4-abf1-4b56-8556-7efb238bc677@kernel.org>
 <DIAJCURQ37FA.1CNEKX6QM6ZO8@fairphone.com>
 <dd7ebb25-014c-4983-ae31-6a6cbd24e628@kernel.org>
In-Reply-To: <dd7ebb25-014c-4983-ae31-6a6cbd24e628@kernel.org>
X-Rspamd-Queue-Id: 3B8424F3386
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106590-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Krzysztof,

On Tue May 5, 2026 at 9:25 AM CEST, Krzysztof Kozlowski wrote:
> On 05/05/2026 08:40, Luca Weiss wrote:
>>>>>> +  compatible:
>>>>>> +    contains:
>>>>>> +      const: boe,bj631jhm-t71-d900
>>>>>
>>>>> Compatible doesn't match the filename, nor does the commit message ma=
tch
>>>>> what you've got here. Sounds like you're missing a fallback to
>>>>> $filename.
>>>>
>>>> The last times I was upstreaming panel drivers (Feb 2024 and June 2025=
),
>>>> this was the requested way of doing things.
>>>
>>> So this was requested that time and is requested now. What is here
>>> uncertain?
>>>
>>>>
>>>> Compatible being the company and model number making the actual panel
>>>> assembly (driver IC + touchscreen + glass etc), while the rest being
>>>> named after the driver IC manufacturer & number.
>>>
>>> So exactly what was asked for...
>>=20
>> I don't quite understand what is asked for now, that's my issue.
>>=20
>> 1. Change the filename to boe,bj631jhm-t71-d900.yaml and leave the rest
>>    as-is.
>>=20
>> 2. Add a fallback compatible for novatek,nt37705. IIRC last time it was
>>    argued that a "generic" nt37705 driver will never be correct for a
>>    specific panel since it's missing a bunch of panel-specific init. So
>>    that's why there should not be a fallback to nt37705.
>
> To my limited knowledge the (2) with fallback describing the specific IC
> is preferred, because that compatible although not currently usable is
> still specific and describes actual IC used. I imagine that such
> fallback still could be useful to some SW implementation to determine
> the IC and act based on that.
>
> If you have sources of other preference, please share, but I just gave
> same review to Neil for his ayaneo,wt0600-2k panels.

I found the discussion from 2024 for the Fairphone 4 panel:

https://lore.kernel.org/lkml/f9164049-6529-42c1-a35a-e91132c823b9@linaro.or=
g/

(quoting)

'''
  Not sure if "himax,hx83112a" is needed here, the "djn,9a-3r063-1102b"
  is enough to know the IC is hx83112a.

  I don't think you'll ever find a "djn,9a-3r063-1102b" with another
  controller IC ?

  And "himax,hx83112a" alone as fallback is not enough to describe the
  panel hardware, so I think it should be dropped.
'''

With Konrad replying "+1" to that.

Regards
Luca

