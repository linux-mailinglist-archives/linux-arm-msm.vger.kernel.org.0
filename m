Return-Path: <linux-arm-msm+bounces-110618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MV8KS+eHWpucgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 16:58:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71FC621421
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 16:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 902DD300250E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 14:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4673CB8FD;
	Mon,  1 Jun 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLSd/+xL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AB43A5E9E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325928; cv=none; b=npPxCYmvlrdRvjTzVhOd16/mqO6yaNNM3ogwIkuaNt6mR5sYF+y8jUFltJXnGtHtdsLwiGOo2J/M6oRFQijcfn59uAxvi9P0NDeZ1v7C9azw8cG99GacBenj9upsaRhRuqTCsPbiIKkfnkFUdOONBDbI6NLq6eMqSEPftv1Z4/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325928; c=relaxed/simple;
	bh=rqBnj7fgbdJlTrVFKmmoGA6nL2axLMyCnfR2JX+G2hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/x3TvAF63iEKSK3kGjG7VXp2oT2lBM+48L2Rao2z0LcMREso6lG01tG/Z991TCU3NtdX2iChEyJeDkIkq2eaERSxA3BxL/kVeJHs518mKX+goD/B+Uz77I3zbAbrKWhpd/1H4n0+/on49dmPCZjAcY+EKJgXGi8717aZ8snByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLSd/+xL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49041e84237so83949265e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780325925; x=1780930725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=;
        b=uLSd/+xL4an32vfrEaURSqZ5jxrxDf+Je5BlMeEWRtFjYbPTxG3qwo2molySdmCNar
         ySHXibbXz8tiHssk9PIHOyolAOy7OU2eiCfdWIsZImKYw8tjwJsPOMkcYc5SW8psaEXM
         OQ75ak3pmVXlznsgExz+mhv6sxxqgnzcHHkLiWQuRzqvG2X/T/BpGPlMgvWlq8Arl3oe
         rMnHBO3SIkoLsLSTlVjsavPkJOH78fF/VYBvRQJGgLob1NulcMXFXTN9IRhw39sL7ucH
         KOROkYsY1v4+pI3CTdoUJcsn/pewlnaOYjs5MQsu/2ewKhZMzppKraLeS4Rw2U3N8LBf
         R8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325925; x=1780930725;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=;
        b=ri73fapcrNLC/tQd4k2Yeqk23aiHNzpjWjBxC2YREKWjjM3ZRW0LBNjGeDTCGC8abC
         ZjgN557fdsAT+s98UMgUPTtvDGHrBBWUnKYgsezNuIkeopgiM9xNkxXO3vAH1vGGJ4OO
         nsG2pRBF/a6TDU7ixen/bqUP74lZVO56+swucJJvKIv59MNhwKaTlt6Kyjcgjy2UY6F3
         DsICJtkjdO9jiqrXfcs/ywE5Eq+UysOIrqSustofrOAh9stdqZUu9OSbS0oksKiDA+ng
         JtmpmiAQqWFhnPFVkzfazrp0AjRfb0AwlHE3avdqoyb0dyDz8taZh+HhqDBOm+l2/0Bm
         jweA==
X-Forwarded-Encrypted: i=1; AFNElJ89QbBQ966EN3xCk/gZdKuj6PeitaAAfJiudwcRXk46sNra1zM85xIZlq05F47iXfjKlvrNvF8w0Y0ZxOuo@vger.kernel.org
X-Gm-Message-State: AOJu0YzekcskfRTeOMftRuhnJr7MH7fPBq5iKqkqDx5fgc0I59CAf65R
	2J85uQVDCC3BsIZqD8e+MoUyhS5cUgCGb/MFbChvDfKQ0ta3wJgUWInZCoORU1vzAyM=
X-Gm-Gg: Acq92OFY3rgLztAWf5UtH2mKn2kYtJ5wvBSnDR3O1/NQREnGaefM0HZCSBtFkKTfkkS
	WobqpXrYtmqXj9eHM7IuW9Nyn/E3UdbJfBaQDTB6bNgcRcpjZwg6pEODs7iJkVCsy4kdngDcDDS
	MKldqRH5OX9Yx87Uu615jUeWJfPTbmXDnpaA0W7JVESKJ3th90CesXOU6qH409qNxC9TVtctOKL
	amzzK+UyrvLMvnh9kI9EGR2RE4jXA2FlmOKoyry4ft+RBUUDT3jDD3NhrzDUxm4vEBgXmaIZz3w
	FCfcMjl98W/Qye6KYJQynpSpn3Ui1OuygcJ4AKB2JQBJeQ06DWT/gGMWgFlbx+HK7W6tvh8gStv
	iO3BOrzAa4jsxwwFsng6jaI7WrTZGXWUJVNpSoxYq4juDjl1N3LhigXaOfKnFdFn5GNXk0Zzqj8
	X1Al1as0YY2vmOmPlSZ9XdjYZrtYca4+VLsDnZdCiOgt6/qQ==
X-Received: by 2002:a05:600c:564a:b0:490:53b0:9e5a with SMTP id 5b1f17b1804b1-4909c11c15cmr174298335e9.5.1780325925446;
        Mon, 01 Jun 2026 07:58:45 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm25172652f8f.0.2026.06.01.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:58:45 -0700 (PDT)
Message-ID: <2d7430bc-1bb5-47ff-95c7-c5c4d880cdf2@linaro.org>
Date: Mon, 1 Jun 2026 15:58:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
 <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
 <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-110618-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: A71FC621421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 15:27, Loic Poulain wrote:
>> Yes I think CDM should be a standalone block and BTW use standard DMA
>> APIs with its own IOMMU entry.
> Interesting, so CDM should be a dedicated subnode as well, and not
> part of the OPE?
> Then, If we want to use it from OPE at some point we would need some
> 'cdm' phandle in OPE node.

Your question makes me think again.

CAMSS:
- IFE/CDM
- IFE Lite/CDM

HFI/BPS/IPE
- BPS/CDM
- IPE/CDM

OPE:
- OPE/CDM

I believe those are the mappings of the various SIDs too.

Come to think of it there is every reason to model the CDM block as

cdm-ife0@ {
     iommus = <IFE0_SID>;
};

cdm-ope0@ {
     iommus = <etc>;
}

And then do use the dma engine API to shift data. I don't see why the 
IFE, OPE or BPS needs to map the IOMMUs and if you are using the BPS via 
HFI you'd simply leave the cdm-bps@ {} disabled in your dtsi anyway.

We should excise CDM IOMMUs unless/until we come to implement CDMs as 
standalone nodes.

I'm open to being corrected of course :)
---
bod

