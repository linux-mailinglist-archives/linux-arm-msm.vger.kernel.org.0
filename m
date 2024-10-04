Return-Path: <linux-arm-msm+bounces-33131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04672990537
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 653AEB233C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 14:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7381F2141AA;
	Fri,  4 Oct 2024 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rkz73g/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE7E2101B0
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050584; cv=none; b=fnhI8iaEqYElUz8KiezI1fOjQ+pvDAPsLEBQ4PkByVB1sCTXgyRrLoylCOeIhrdPMYTPr5nKiZNw/7MEsxnHJe0VD8kUJN+UaPSVdZvHZl0piN5LyyflY9TZjpzC/Ahvw3+YzdKL6LP+tD4gnnhjYH7OMxU+jjr8R9QL7i3HrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050584; c=relaxed/simple;
	bh=8Z5LddFwZKIemlr/TdgLpEWQcSrNFAmlrDgUkTpKh24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCk4e2RQbKBga8aflZbbb3ZxzTCuuUpbU7FyEeGWJAY3lU5wDeS7AleLxXIKl0CIIU3LR+yE8P05zl0UZagwQprOeGT9IIACJJ4UPOsdd3U3wUb+6JZT2FOL1/DvG8VfKOGKUHBZgEuFnzUWfE2KdhYUWLegHa225srN/+m/924=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rkz73g/f; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb3c6c353so3439345e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728050581; x=1728655381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i+W0UPcMEUofL0GGlPfd7SpsVs7uF/Pb41LRoiyF420=;
        b=Rkz73g/fIH5cVMvXPi+Q38zQU+brBVZz6nVVVV7KYzRFRHZPglNPqPDM/T/1i5GeAc
         vVPfcJr2Vo93c5yckk4lLsNNRhXFIrSt1LQwdIV8K6yAw8DlXcBLRmAhG1TI31/8Aqd1
         xpz8PxkfrHIkgsE5RhGBSRXisa5S7OBM9IvYoBn6+cpVRthO8VBqrzHJhgmF68AzQS6x
         CpzamKEaQaHj/gqjLXCe9c6htBbXjjvhP+PxbbTcUhnYXYqdrGL1WyY0wD36iwJogzDC
         GakGjYgqQOT2g6gcA0kTO29WiVD5aNrxY4HgAnsqEDhz7iA3vede/C1x1NIOOAdtnVHZ
         tQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050581; x=1728655381;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+W0UPcMEUofL0GGlPfd7SpsVs7uF/Pb41LRoiyF420=;
        b=kLpGOAnUrcsZtvfBGaXPTrb6a4kfXyRWdBiD+Whi0LyYkiVPA9SK02eIjCxWhY/lEk
         eSRF0OQbLFApHIJbVmf3KmSQ+7A84F0gbewx1HLFv6y1WxpGj9dvUKw1Gx8J4VNd6wVh
         EoZ3WAHuoy4Z9o790g1RSr6HwOX3leZMkRQ0aVNDSu2eaEB7Z7Darcd5NLv3KEkJg61R
         HivbSJYR/LRO8QoHllvmtOElN/0lNGY5lebDfLTScpCTUt2UXWFp4UhAcMJwLr4w9+5Z
         d/a2mL4GR0O20DQXyDU9GBeuYkD/Ywo+MeHGt6SZecyMvfvtJJv2L0S/oAquiOrIlTjH
         ZquA==
X-Forwarded-Encrypted: i=1; AJvYcCXkdMjPtS+j2gA87Q9I3J2SEvkORPrEwwe1XlIkiq1018qvfXkvxyKvS9ZXYuvyEKIKRWeyonTQN7EzFaH2@vger.kernel.org
X-Gm-Message-State: AOJu0YwQhYim6ZGVVCrbbG6DSVS67ycsV2CKhFkRTbMgQfB701oQFvh6
	ppk5vs869Tor7n0a9fKrPOOX1fIbccb1UOl6ShXSOwZLSGk4iT41WioGb9Kj9Ek=
X-Google-Smtp-Source: AGHT+IHMYtl2nBgLbFLufrWZfLcFV65YNtkPQLP5BGhMO6MK5Y7lAZPaJbtx2Uha/T4JpCR6JEPpSA==
X-Received: by 2002:a05:600c:4fc8:b0:42c:baba:13cb with SMTP id 5b1f17b1804b1-42f85aa360fmr10305185e9.2.1728050580906;
        Fri, 04 Oct 2024 07:03:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a1f74fsm16530345e9.2.2024.10.04.07.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 07:02:57 -0700 (PDT)
Message-ID: <9e744cc1-9c27-4172-aacc-8599079f5570@linaro.org>
Date: Fri, 4 Oct 2024 16:02:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
To: Andrew Lunn <andrew@lunn.ch>,
 "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>
Cc: netdev@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, Jacob Keller
 <jacob.e.keller@intel.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vsmuthu@qti.qualcomm.com,
 arastogi@qti.qualcomm.com, linchen@qti.qualcomm.com, john@phrozen.org,
 Luo Jie <quic_luoj@quicinc.com>, Pavithra R <quic_pavir@quicinc.com>,
 "Suruchi Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
 "Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <febe6776-53dc-454d-83b0-601540e45f78@lunn.ch>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <febe6776-53dc-454d-83b0-601540e45f78@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2024 20:42, Andrew Lunn wrote:
>> Agree that switchdev is the right model for this device. We were
>> planning to enable base Ethernet functionality using regular
>> (non-switchdev) netdevice representation for the ports initially,
>> without offload support. As the next step, L2/VLAN offload support using
>> switchdev will be enabled on top. Hope this phased approach is fine.
> 
> Since it is not a DSA switch, yes, a phased approach should be O.K.
> 
>>>> 3) PCS driver patch series:
>>>>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
>>>>         be enabled in drivers/net/pcs/
>>>> 	Dependent on NSS CC patch series (2).
>>>
>>> I assume this dependency is pure at runtime? So the code will build
>>> without the NSS CC patch series?
>>
>> The MII Rx/Tx clocks are supplied from the NSS clock controller to the
>> PCS's MII channels. To represent this in the DTS, the PCS node in the
>> DTS is configured with the MII Rx/Tx clock that it consumes, using
>> macros for clocks which are exported from the NSS CC driver in a header

Huh? How is this anyhow related to the point discussed here? That's DTS.
You *CANNOT* send DTS to net-next/net.

>> file. So, there will be a compile-time dependency for the dtbindings/DTS
>> on the NSS CC patch series. We will clearly call out this dependency in
>> the cover letter of the PCS driver. Hope that this approach is ok.
> 
> Since there is a compile time dependency, you might want to ask for
> the clock patches to be put into a stable branch which can be merged
> into netdev.
> 
> Or you need to wait a kernel cycle.

Sorry guys, but this is not accurate. There is no such dependency, but
what's more: there cannot be such dependency.

If there is such dependency and above cross-tree merging is needed, then
it is a clear NAK from me, because patchset is utterly broken.

Upstreaming SoCs have clear rules, already documented in the kernel, in
various emails and in Qualcomm internal guideline (I think, if it is not
in your internal guideline, then please update because we keep repeating
it once per month to you guys).

Best regards,
Krzysztof


