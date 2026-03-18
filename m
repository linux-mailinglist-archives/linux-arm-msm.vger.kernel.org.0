Return-Path: <linux-arm-msm+bounces-98382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDDKC2p3ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:59:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B82B98EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36D493052464
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5A237881C;
	Wed, 18 Mar 2026 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mecomediagroup.de header.i=@mecomediagroup.de header.b="aHOo9jQh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D293AE6F8;
	Wed, 18 Mar 2026 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827821; cv=none; b=AvLMOf84r02k40dsYnwKib/aV1adwqD7V4Ah5M0iDdvKZb46J9TL4H/FVo6/01ocl0fzUWzSVjSNKhb7IjFqlSpyGv+pvoifdgSu8wiq828xF8WjAtkKnRMNsD0oMe5G4ubmiTSA1nEAwgYrdRknpOtIN500TNRD5Nz5LMhC+BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827821; c=relaxed/simple;
	bh=g1x0s7T64Tdy8dyNmPlIkdrD35PpU5AfYBNjl1snPJI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lhnDBfr1FbSU0+WiG3XVWwdgy+3rpXLruc8zPdDzqCmF6brM4aPUIRk8rdfB4jhb1cpLWqltU5E9nWVCkMGptavY5xGqypOn8MTwmIVUXjJCzL1F9XgpGRpUOSWMe+bNuV4216tKJUKbQ2OkobFIKhPDzoaVjb8rvs7pOpJpz9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mecomediagroup.de; spf=pass smtp.mailfrom=mecomediagroup.de; dkim=pass (2048-bit key) header.d=mecomediagroup.de header.i=@mecomediagroup.de header.b=aHOo9jQh; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mecomediagroup.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mecomediagroup.de
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fbPNM48RXz3wgp;
	Wed, 18 Mar 2026 10:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mecomediagroup.de;
	s=key2; t=1773827763;
	bh=g1x0s7T64Tdy8dyNmPlIkdrD35PpU5AfYBNjl1snPJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aHOo9jQhWdiz8XybGRys15NSycB/XmheYFOk5zTJ+OLgAkpvLnw9tF34sRXooh/Uw
	 cX2lS/WGlA8aIM7+fJ1dz7rppvosePzA8j0q9eZSe6tAbuvRU6l++uGok7Blxz5oVF
	 zpj6llvKl69vVXF3cfkNGoy6guVyLmsTv32hFmutvDZWUp9FGlnhAj3M0TXhtoJYlE
	 yb4MDQiurtK52Uf7hlYeytsDCgcHUu/Dqlnub7uR7QLqytZR9Vb1WkHDuj67S39KRV
	 el3ux3PxbZxvjb3pZYlFSLPGytLDvuioS4y2wYeo1ZDJcbIPUGGT9MEBpzbMUqAMWs
	 RVM0P6apoYg4A==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fbPNM3Q3Bz3wdk;
	Wed, 18 Mar 2026 10:56:03 +0100 (CET)
Received: from mxe95c.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fbPNL4MVRz8svH;
	Wed, 18 Mar 2026 10:56:02 +0100 (CET)
Received: from webmail01.netcup.net (unknown [46.38.249.153])
	by mxe95c.netcup.net (Postfix) with ESMTPA id AA0A080CC2;
	Wed, 18 Mar 2026 10:56:01 +0100 (CET)
Authentication-Results: mxe95c;
        spf=pass (sender IP is 46.38.249.153) smtp.mailfrom=mecid@mecomediagroup.de smtp.helo=webmail01.netcup.net
Received-SPF: pass (mxe95c: connection is authenticated)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 10:55:57 +0100
From: mecid@mecomediagroup.de
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add qcs9075-radxa-airbox-q900
In-Reply-To: <52854742-b458-42db-881f-bef8eac3dab5@kernel.org>
References: <20260318083621.470826-1-mecid@mecomediagroup.de>
 <20260318083621.470826-2-mecid@mecomediagroup.de>
 <52854742-b458-42db-881f-bef8eac3dab5@kernel.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <50edee17750812609f7b8de795aaa221@mecomediagroup.de>
X-Sender: mecid@mecomediagroup.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177382776201.1783819.6154477896774710283@mxe95c.netcup.net>
X-NC-CID: r3DTgHUZom/cw4M5r+oxK7aUXy8FV6pZsomCBIHT3Y89aLyG8yH/
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mecomediagroup.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mecomediagroup.de:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[mecomediagroup.de:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98382-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-msm.github.io:url,mecomediagroup.de:dkim,mecomediagroup.de:email,mecomediagroup.de:mid];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mecid@mecomediagroup.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E30B82B98EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-18 09:51, Krzysztof Kozlowski wrote:
> On 18/03/2026 09:36, Mecid Urganci wrote:
>> Add device tree binding for the Radxa AirBox Q900 board based on
>> the Qualcomm QCS9075 SoC.
> 
> What is QCS9075? It's the first time this compatible appears and the
> only other reference is socinfo commit which told nothing.
> 
>> 
>> Signed-off-by: Mecid Urganci <mecid@mecomediagroup.de>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml 
>> b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 8c3df8efaa4d..2c492f4d784a 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -909,6 +909,12 @@ properties:
>>                - qcom,sa8775p-ride-r3
>>            - const: qcom,sa8775p
>> 
>> +      - items:
>> +          - enum:
>> +              - radxa,airbox-q900
>> +          - const: qcom,qcs9075
>> +          - const: qcom,sa8775p
> 
> Why qcs9075 is compatible with sa8775p?

Thank you for your feedback.

Yes from public information it is the same SoC without the automotive 
security features. Should I remove the qcs9075 reference and only keep 
qcom,sa8775p?

Here it is listed as part of lemans:
https://linux-msm.github.io/mainline-status/soc/lemans

Best regards,
Mecid Urganci

> 
>> +
>>        - items:
>>            - enum:
>>                - qcom,lemans-evk
> 
> 
> Best regards,
> Krzysztof

