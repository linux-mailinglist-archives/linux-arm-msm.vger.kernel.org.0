Return-Path: <linux-arm-msm+bounces-96282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AUGKxjgrmmoJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:58:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1E623B1F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BC7B309BE81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FA238F921;
	Mon,  9 Mar 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mSgrWjJx";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="W/XFR62A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74EB640;
	Mon,  9 Mar 2026 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068187; cv=none; b=ewXCz8PIvu9eTaKgacKs5SX3eBBFy5DObpIzm3qZ2NsjCPNE/SGX7WyYy9C/9Af/vjZedm7t+xCI3sQcEOO2+BYmv/HmWtdtqrBKK4BZ6qhzxDpvb1DtqFRtDyAJabSwVbILHwHl+lsKzUMGSvZPk97pk0doYt7al0rvwe8vHd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068187; c=relaxed/simple;
	bh=impKTJh+cSmem+zA5mu3xSmaTtftYOxYZY8V+TnLTnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ck8vBg1ZnlIZSskmufU3xtYTcJt1Xftnsot+m0NJY004SbitSubPn1VU+LSB1Ip7djROSRhPCVL9txWOk+4TH/0OqJ2OEgRqjEkMJCwOgxFqGdwnLqlKsSdVVb6yLrqFvuJ5zBltpJYIZQLOjbynsULcH1Qq8H4tQ59wjmBfobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mSgrWjJx; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=W/XFR62A; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1773068177; bh=fXzAYn+9vMlRoiSurRFd61k
	Cji2qbGOUuMHcdClO+LA=; b=mSgrWjJx3RRSSBz8IqR7ktJyFCz7J+QslUSdFuXyOuxdlnD2/f
	vH4c3sALsjhJ/yE7Ddew0JEk4XqxKSroDMomiguyG3PgFXIXLul73tMIFL7FiD7WHpGEPL4LL/B
	GEqk10M6OpmOyKUF8GuqqOeKwIB6SnP4iz3OITIazmTk2xvWPcUTTiNaDUHXqSXQ9WJOl9tuydx
	eJsE53uX9O1K6p/9SJSpD88lHtDnO3YOfeEfNE2pGu7+fT0NHHKdbGW5tAkrZg4xSqNFPOfrLpS
	u7zo4Jjnp2A9dQBicoZOYo79XCkwZyhDDjkKACGTh+4yZpgs3sWXeWeQo5M+Btu3KQg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1773068177; bh=fXzAYn+9vMlRoiSurRFd61k
	Cji2qbGOUuMHcdClO+LA=; b=W/XFR62A25pWO95OvjIty7jHwNG+1sOkuFVOtfnDKMaCnLvbLY
	VDbT/IObaf4xFLTMTsRBbRVe7qKiVOPSWwDg==;
Message-ID: <386d5f66-1f22-42dc-9696-05b1e54d7577@mainlining.org>
Date: Mon, 9 Mar 2026 15:56:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: document the Fillmore
 Global Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-1-976d9a6bebe7@mainlining.org>
 <20260309-quirky-heavy-armadillo-9f92bc@quoll>
Content-Language: en-US
From: Aelin Reidel <aelin@mainlining.org>
In-Reply-To: <20260309-quirky-heavy-armadillo-9f92bc@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4D1E623B1F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96282-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Action: no action

On 3/9/26 8:38 AM, Krzysztof Kozlowski wrote:
> On Sun, Mar 08, 2026 at 01:39:27AM +0100, Aelin Reidel wrote:
>> Add bindings documentation for the Fillmore (e.g. SM7450) Global Clock
>> Controller.
>>
>> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
>> ---
>>  .../bindings/clock/qcom,fillmore-gcc.yaml          |  60 +++++++
>>  include/dt-bindings/clock/qcom,fillmore-gcc.h      | 195 +++++++++++++++++++++
>>  2 files changed, 255 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..0eb12a52968edc7961681f0e965b4d6da0858b9c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,fillmore-gcc.yaml
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,fillmore-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on Fillmore
>> +
>> +maintainers:
>> +  - Aelin Reidel <aelin@mainlining.org>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and power
>> +  domains on Fillmore.
>> +
>> +  See also: include/dt-bindings/clock/qcom,fillmore-gcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,fillmore-gcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Sleep clock source
>> +      - description: PCIE 0 Pipe clock source
> 
> Aer you sure there is no PCIE 1? Because I would be dissapointed if it
> is being added later. With PCIE 1 clock this would be basically Milos
> GCC.
> 
> Best regards,
> Krzysztof

Yes, there is no PCIE 1. Fillmore has only PCIE 0, which is used for WiFi/BT
and is Gen 3 1-lane.

Best regards,
Aelin

