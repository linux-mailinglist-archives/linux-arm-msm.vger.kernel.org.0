Return-Path: <linux-arm-msm+bounces-116375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aDslDTDzR2r0hwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 19:36:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79D704AB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 19:36:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ue/qOweb";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116375-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116375-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F22A3015717
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 17:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAE630674D;
	Fri,  3 Jul 2026 17:36:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6332F39C2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 17:36:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783100205; cv=none; b=aNsOcV1CmED4DDO7DDbIpWbs+3ECV0fGlY5tbEYLbFwuEuonjPor2/UYhkanaCrRnGwJxFpS2TjbIz8ywqMh02SvCzvp3yQXPXBNOFsi7oQlQ6qyHhr07NNR7y04cosYurehUzVpY9yXGRYxLDG7H1GKeulRLlUf8yYmC2f0Ds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783100205; c=relaxed/simple;
	bh=UqIn74vDfHkpSSpIDqvrqWCVWTw6WrgqocAQXTALwIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTBz4D2/ocsVAe1uGHdFO1j+sKHHmscirOQxgYoOPHAP+fmdWUPyU5Iv3OarJb9La1/zE7s2WIh6OXLtkd/OfD4fA3rhWiweZCILm+1dR2ke/Ay6H4uNBJbjh+VCv4JV0NLCJLF6HyChlavIBOp6HZSHyphHlACEbYV7iN80O8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue/qOweb; arc=none smtp.client-ip=74.125.224.42
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664dd23829eso725927d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783100203; x=1783705003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swFOHxWnwsi80sOoNfpTLmi7to+o78mL3eziN/+vZ9o=;
        b=Ue/qOweboVu7n96wWDZ7dCNUMjEco3TT/sUysOemX9WDsblD9kFSmwOdx+v+QEbXFE
         c0FSKumm+xHoSAokBbLCN1iPVZTSiNNsajvDb0sZw6Bcpc5ncSy5p2vKKoc9cW8Qdrxv
         rx0o1m0CQMLuIeolKEa1nCCIxpc3kgReltAF5RbupglawnxcvE1WCakTOtV9eH3h8zX2
         6Rav4+4YpjaBeNK1Y0hxq+p8xfr1MegRZbDI+q3L5lCZITCZig0mnAHr7B9mp1QAnOg9
         WRCmL1Eb47mhVC3re8DV9QsV84nBbHIf1BH3alrhciBpvrDMrIRftIiPr+meygOS+aTl
         oHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783100203; x=1783705003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swFOHxWnwsi80sOoNfpTLmi7to+o78mL3eziN/+vZ9o=;
        b=R1IFu33u7pTNsJHGJpdpyB1Cz6eeBDod/fERNcmhpuAtfPoWpoLtDf9Z6w7aVRflDl
         A3Wbd1FLMAQIN2gORe1v3G7yw617L7k6rATIJHNVG69ZZzMFk9OJguJPcuV4BE2+gfaC
         Z3UwkCVyFI697yOojBQ9vYhyuDoM9lyw8RkXIvbrfC8gONkDgHmSkOCNAL4pGKClNKiT
         b51bin1xzoDRreMut29fPtlxKzjzXhKhcQ2gd94mnYZXvYoZ6w1k0CWZxcEhLPQR2ZIx
         fwOMsuYcavzzpYT8GdgRDnFpmQXvwI51CUYmtwHQujib+j+M+GaYrOVEUSgWSDmi1TtZ
         oxDA==
X-Gm-Message-State: AOJu0YyrTBRegjPvBqgAJjsfZ4pF2459q9q3M2RP0WvpXajN59pvqJlI
	kF6WaGuO79AE2v1Roc7TQCs0tOZP5Y6v18+woK620qBGdIUU89Gpz0j3
X-Gm-Gg: AfdE7ck868Rumsirw6WY0Xi6fdnit2tLryFVe1K2aeCSWa/L1Cvs7Xs1nfOUth9yqPq
	BeaKOPLnDZ4pqaJnRqnoZU/+qNK5gBw0rO+kWOtX1asX5wedhRfcErQiMzrZx74J2wNRnIiwCe8
	M88OTQUfW64u/WS9aqR2nfyBLLAlP95ru0j0LxrjrcXIRCEzeWff6/XK6AvzE8C9rtwxRvtEsAy
	pjy4F/MalQAecJzj7SsgmaAGjlAlVpVXOUSjnObEyRfw0MJNTSdrD6NH5PuAIBTPqfQUHrXlHnm
	iX9PApZN4qkwlAPOVMf3LMFJZlVkolKEnTnwi+mL7x1bL/ZbcuUyJLBBw8VEfIGkcizrEajR19m
	SBKF1u991uhWISwE5vJoX4JzJGDMOBEUvKJH6rxmGmEqHuWmTI8CBIQW8EFcqLESigGApPMQxkk
	vnvFnGU7n02XklgaQ=
X-Received: by 2002:a53:ac91:0:b0:662:f405:5d41 with SMTP id 956f58d0204a3-66652e3dd28mr53777d50.33.1783100203109;
        Fri, 03 Jul 2026 10:36:43 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6664087be45sm1050084d50.19.2026.07.03.10.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:36:42 -0700 (PDT)
Message-ID: <32510c42-5448-440b-867b-c4b7404a4dfc@gmail.com>
Date: Fri, 3 Jul 2026 20:36:37 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-116375-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B79D704AB5

>> +&apps_rsc {
>> +	pm6150-rpmh-regulators {
>> +		compatible = "qcom,pm6150-rpmh-regulators";
>> +		qcom,pmic-id = "a";
> 
> have vou verified your reg settings? incorrect ones may lead to
> hw damage
> 
The only deviation from downstream I have is in ldo5 in pm6150 where
Samsung set it to 3.3V exactly, but we can't pick such value in
mainline, because it happens to sit in between a step. So I set it to
3.304V instead.

