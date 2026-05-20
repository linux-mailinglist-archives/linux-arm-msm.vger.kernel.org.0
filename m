Return-Path: <linux-arm-msm+bounces-108877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ImODKQiDmr26QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 23:07:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50159A7B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 23:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9377C346B783
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FB33043B2;
	Wed, 20 May 2026 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDKVKoac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CE30171A;
	Wed, 20 May 2026 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304314; cv=none; b=QFDpKLC2wfMBh8NnK0pGGlcyWnRXA94BhdfeC7PIaCFe3W4TrfjTusPWVtez2BEoWcefx/rqIu8WbWUpDaT0MTb36NxEtRvWuj4DB+kUlkraOaTltja83Htkevhxy6fMUqejJvHD5g1teOAo4InTwCPogG7qPnt1c7fr8akgYlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304314; c=relaxed/simple;
	bh=1gjmZnzivqiCxHu37Bh80PjtMiVwmRgqFFHcVkXQg0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6cPtbwcJBcyvLIFYwMbWgAufDeBbWpTCMx8xaX4EX7rX52dEaow8qeL6X2RIb7kex8f7KUaUv9NFC61mBHOJQ8ADeV3LdmGH1yHzVZP8ex0KommfprrbOCwpmtdPTI6Qv+tIlJXIXWeGMgKcBk8gTvWSppXqn+gLCQKqdn4zwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDKVKoac; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D51D1F000E9;
	Wed, 20 May 2026 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779304313;
	bh=8titQ4xI+bSeVt8cltQ23geRCHfQ95u1E9xRfpfnQJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DDKVKoacRRCrnMLrn4jM2CQLgLqbhHjom1+hze5r5uI2gxudgdzZlSCJU0t3iVAiL
	 7zGzwAWW7j5RwxFpA1njUusbV5LRcUBoEw7RfDZZeD4wGBg+Gb0oNOqp1ivvXgi13P
	 /QFaZ7rcVRg7r5qgX7eS9rn8mTgtMMchImB90AY8+Xg5nkaKJXta4LoPALiTaZTR9B
	 Siuc4x04nW4L70HMYsuuzUS45x2Jp9bo/FZkU1NN2yFTwzOLWDZD79C0LVG5ebu99o
	 yxxb3Bjf70gNqNEUzwbBPNoghnLpfFxJpyzjZw5rg1rTgRDwAj0I7P8sSRZbXyqUN6
	 f79C+HUX6qQWA==
Message-ID: <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
Date: Wed, 20 May 2026 22:11:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rajendra Nayak
 <quic_rjendra@quicinc.com>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
 <20260423-thick-beneficial-capuchin-e4aaad@quoll>
 <99830e85-5837-4ed5-8f89-fea5d3e632f8@kernel.org>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <99830e85-5837-4ed5-8f89-fea5d3e632f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108877-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[djakov@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,krzk.eu:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4C50159A7B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 9:51 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 10:38, Krzysztof Kozlowski wrote:
>> On Wed, Apr 22, 2026 at 02:05:11AM +0000, Raviteja Laggyshetty wrote:
>>> Some interconnect nodes on X1E80100 have QoS registers located inside
>>> a block whose interface is clock-gated. For those nodes, driver
>>> must enable the corresponding clock(s) before accessing the
>>> registers. Add the 'clocks' property so the driver can obtain
>>> and enable the required clock(s).
>>>
>>> Only interconnects that have clock-gated QoS register interface
>>> use this property; it is not applicable to all interconnect nodes.
>>>
>>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>> ---
>>>   .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
>>>   1 file changed, 62 insertions(+)
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> And unreviewed as it breaks users:
> https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
> 

I will just drop these patches for now, i have put them in a separate branch anyway.

Thanks,
Georgi


