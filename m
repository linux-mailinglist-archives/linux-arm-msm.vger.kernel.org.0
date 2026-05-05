Return-Path: <linux-arm-msm+bounces-106009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aTgBC1w++mngLAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 21:00:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 964BD4D2FA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 21:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A70D4302AD32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 18:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEA33E95A3;
	Tue,  5 May 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4NCLeUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D393CCFA8
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007058; cv=none; b=eFQdhla2dOTh+ik4QB1QGz3Yok7/SZW5O3wgWmg8pDM2P8s/NRNAtrt5owgenoClPgUrZHEk19TS/HCBTTUYNVa+nuC/o5n8/Za4Xs5EZtWqiYBa8qhNXq09+KctQlF8tgKNQm4uo2OC1uKwwDjAqkviGR7Zx5j6+ltDxS9j/xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007058; c=relaxed/simple;
	bh=v8iGX/lK8aQ2P7nXaRjT3kEbed4ilCzF/7HTS4aXDT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDcbQasCqGtBynlj/iLjv8Ss+pFDMilQTp41UeurxenwfHQDOTgI6ty8pNRuaN0r4dRi34/rs8z+q7l+PxIBZT/8ngnhCeW3GYlK3LNfrRE6r2Ezl9bOXBBvbFpIP2RkbFbzP7BE5JFe1t39iZKT8BcjPfNj+/SZMQeRpr7xXKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4NCLeUN; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e9653b53cso4622451fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778007056; x=1778611856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWfIK+4R3Bk95cHMFqzFQqOhwZinnDbYjtH4XgP9PxA=;
        b=i4NCLeUNUHr0E0M+OteFwvdviHFXUnCieUEXLc7fp4Y3I/hZK0Rml77Oi4TIW3j+l9
         lTp9/O8Nox4tvn/RV5mCbkrasbXsiAEKEvFW1jjAForIpFfPxv/SbdwxnmPsCQIt6dcp
         0UWH4REYIL53UT014m85NV/BO4spok40cjv335Ycd/64yAqbYLy6t2vTEhycLuShNGht
         rlNqZhXBR755+3ww2ftkC2+ej/RmNfwECpTYFIq1MUTrOBrTB5ussG9orij9Dak+e9oM
         0gDnFiEFeaeoCa8cmnRvm6GUDoCGgilWbnnRTg1K/+e6H6tkea0q0bZHaONcJlQFcdmv
         KG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778007056; x=1778611856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWfIK+4R3Bk95cHMFqzFQqOhwZinnDbYjtH4XgP9PxA=;
        b=LRmZ8QoJlLSzyM2vO0vfcPo6dnnhccgvFsd1cvSYlSs/tCwsMVedsWANt5BJOKFCAp
         PuLZ6Yskd6g5WIaFBQlxZOlXqlB5Yh/qgScwtYkcnMM8qypIs6wKidU4CCFstP4w0fy8
         0pvcPt9xJLL9cr2I535mTxFgZ7dinCOJ+xt7BuES3imusYkbdp8Yg49orsHLC1FUpnF2
         es4Vx02Imhh7ZdDOXs9FRy0E8kpsXm/f1ypb0fndTpb4Kx3aUzvOIEmDnurR0duUIX2J
         IlPG3ITQK1J14r/68Zy23/a6LssCNJrAxPp2PvQFFuFiGgDq5juKYCHxfAkty3Q8nwI+
         3IfA==
X-Forwarded-Encrypted: i=1; AFNElJ8J9UJJCYK0CFmJORlTmFh5pjcIRQGQSJ5z6q0fVgsKhWO79lCZAeoIyrH0PXEoVJs0IN3cf5K29ZH70xrq@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5MT3YTGm95j0RV5HplHeRHoEQX2AjtXLrUjLTFkiro/ws6B7
	4cjX+EAEezzVcDaXyXJvU0JjCiDeAgnxMsmnMeqZPA+Qe7012i+9XBG/5vuV2BT61XVDo0ct1g1
	ev7W1
X-Gm-Gg: AeBDieuXn6I6gPbNC4pda443AyBvu4sIPhFK5RB30i1MYhv4ltKNwOlSQ+s5blnaXON
	2Hk0GP7VcDs3YQvQkmjl6Ag4lYNAk9DrCzltoMGLgZRMT+VEyk+MFJNG6EHUih+qvN9hIgoAOtb
	1snZ2CGq5KGbmen/SiWI0NUFvcp0QG4PdeN4+NRHzWH6O2CPJU/xBh263Y+81QcOXQdh3KtM2Ap
	YG6Ysr5abCo9pMEJa5CC4uzOQUwdwSoJYDzTIBTAdKE7/BQ125iiCQyCzkCgz+R00Sr5VXXbOTq
	ZpFkJ2zBijpkO7hjaNU7vgPIryyhkmUXV3FjHByuKCvrQauLqFqaTDjkU4ufAHX6uJIWbqkP43t
	1kwCrrIDmjSWumCNrAQlr5kZSq6cEbA6CaYf/0rypEuzINVNeaXNdxslDaXh2TXfG0Gz3z9X0kT
	c7EfA9qy2OGvEPhyKMD4D6ESUVFGzAhAIqAYWiQOUCQOU19oRtKUxOpiGUjpyJkrnQoNTJgo7j0
	nmn+jwCybWQOEAb
X-Received: by 2002:a05:651c:4103:b0:393:c17d:9cfa with SMTP id 38308e7fff4ca-393c435d22cmr388041fa.5.1778007055403;
        Tue, 05 May 2026 11:50:55 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936135e578sm45101711fa.38.2026.05.05.11.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:50:55 -0700 (PDT)
Message-ID: <eaff3bd9-0b75-409c-bc5a-5013f9ce1495@linaro.org>
Date: Tue, 5 May 2026 21:50:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Kepplinger-Novakovic <martink@posteo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
 <c26246c1-0f90-499f-ba32-34159baa5dfb@linaro.org>
 <CAH2e8h4Y-x_4BAcgjytNj_NxZKnF1=y9GuaUnWdjzJ-MQLyCng@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAH2e8h4Y-x_4BAcgjytNj_NxZKnF1=y9GuaUnWdjzJ-MQLyCng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 964BD4D2FA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106009-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_SPAM(0.00)[0.151];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[]

On 5/2/26 15:48, Pengyu Luo wrote:
> On Thu, Apr 30, 2026 at 6:49 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> On 4/25/26 13:52, Pengyu Luo wrote:
>>> Hi846 is found on my Gaokun3, descripting it.
>>
>> To the best of my knowledege there is no 'descripting' word.
>>
>> Say it simpler like
>>
>>          Describe Hi846 camera sensor found on Gaokun3.
>>
> 
> Ack
> 

...

>>> +&camss {
>>> +     vdda-phy-supply = <&vreg_l6b>;
>>> +     vdda-pll-supply = <&vreg_l3b>;
>>> +
>>> +     status = "okay";
>>> +
>>> +     ports {
>>> +             port@3 {
>>> +                     csiphy3_ep: endpoint@0 {
>>> +                             reg = <0>;
>>> +
>>> +                             clock-lanes = <7>;
>>
>> Please remove 'clock-lanes' property from above.
>>
> 
> Is it unused? I saw it on some devices and v4l2 related source file.
> 

It is unused, and its selected value here is bogus.

-- 
Best wishes,
Vladimir

