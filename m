Return-Path: <linux-arm-msm+bounces-93209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHPsJU2tlGl7GQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:02:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C46BA14EDCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3B93300B8D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80592BD031;
	Tue, 17 Feb 2026 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="fNWPonfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9235372B59
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771351281; cv=none; b=DyUwGiagiZhLBW3Abg2wA26P99hmIvzl/M7N5+4pGRnLTJTaZxlyIOUVPs/rxexpYOtVPRGzE1PlCFaVJLec4unUHtEPvXfF3EwHodJzSlCoKzY2AEycKls9Y1efRE59bSaPqG3Ht86tGOZ15V0bDdfo4eI2eX4kxo9yPWCgp0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771351281; c=relaxed/simple;
	bh=yo7VpR7y2IWG6CuidAdMoCeu5zTOZrbNb5c7C6ANnvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEiOGFwl6gVKl8lJmhV7UbP5DYi6DaZqm85jEWCLdrzHHwdSiMHddE67BLgUompuoekamFiKPJmkwJ+GX3tDXey8E27oicQFRbS7PWVRNDzBTGuLAEi8pp5cnZkNdmNHE9nQOSYohEAMTZHJzo25lV3Z1J0wyY/76Hjwt5whu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=fNWPonfh; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d1890f7ee4so2657171a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1771351278; x=1771956078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7kdTF2Cckub7dO3x1Hq31N4AgYFSFS+VW8IKBBKDHI=;
        b=fNWPonfhTbwPC0obmOgax4GPc8OzoshhngF0ukfvZPG7NtMG45n++27OEsMXzA86PW
         jKJg42kAvnpAmvsXHsBmV7t7H1JOTgXxi6ViriMkjjE+5M2eJvsW6Vf99WYwHGC1el55
         FdbJx5GO/hA8qhzBEP8YCez4hL1bFae6u0ApQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771351278; x=1771956078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7kdTF2Cckub7dO3x1Hq31N4AgYFSFS+VW8IKBBKDHI=;
        b=PoSXPJls4Szpd/vMMuibsnuVgyPPnUxXGz73/5mWtpPF1cJMKUxrQg9EBOKN6dDzK8
         5HnxEC3hC9WlHJAUYIvjfo4XivTh49mLwrextt0478ubQat/poVGZcr4Sq2wpGUn0D4g
         vi9ihm/XI5Ovd4vZrqt879guAbOKwfqaqbf2y6kr8P4x0XTrLH7PSSbL8NJCl7WQb3Rq
         hHdUyo1BXZQsTypBQ8d3n+69IdiNeDC6PTem1fmiwoKAdTwuKMxpERrSSRCc8iV97Sva
         KmprBZBfWPLlhum5o0rGClYruldDVTdg6hBA8KUuNVJw8W9dYeQ/4EJipsfor7BkQ6A0
         BaTw==
X-Forwarded-Encrypted: i=1; AJvYcCU1p0BafA/McKln8l0OpcTGcEXDdoxKi5BA0rvmgCJ8O66C8X3spWnIGcy3ed/n7iP/6Lr5VaD45F+QNRmA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1XdVQQtc1MkRIZ8VhIi/2/JJE4rVlodH574KhvC9hFxngGrWf
	KBpCRh5oz9hca2b3x9UVofvtSHo8sLPTzrtxzyqPQ/06CyuV1Fuw4i36Y/3PaAbghQ==
X-Gm-Gg: AZuq6aIFwqQH7LXvhofTK2NxrKLGH93nEfA+05TlZaFWUkZzk3Nc3vupOGlEgA/MA2V
	KNmhI/GNUG7x1o3uiWg2C2+40xgQfRf/bv1Pe0xxMGM33Vu7FPbU0Lm5G8j1xS2anM9VXboryEi
	bBUqEW4CdPdeYXORGlPVwGWO48jW9z4Uu3HTC2BxSZncU1dMUgXTK2ceqLAWH1Jc2+gyR8ZIr9B
	jOUOPS58Ntkk+qC4bE5auvqem/NyFziqR3e6/QGGR/SEXU8KpYP3g3/0UiSi34UsTSkKJGrW9MM
	TmNmK1PorC2IGHxAXgI8aAMhqLhSLLXfupzppoeUQcHDrrscyx7W4Ahc53ZVihBn9ryFA0uPgdI
	hfbUHGD9nB2ZkeRDhwdlzyT05sck7+Yogh5hTG17FecJDxLZgB6RQJe99/U3YX6AfsDX6gWGDgd
	fX1egZkv7KZs5pLK6wBgbhgvu7E2HaWagCIxGTZTxKUBniDRAv2mlrwCOZAqC0puNnzZA8
X-Received: by 2002:a05:6830:348a:b0:7bc:f443:fa3c with SMTP id 46e09a7af769-7d4c31c488emr8662896a34.25.1771351277518;
        Tue, 17 Feb 2026 10:01:17 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d4a771bcebsm16698857a34.25.2026.02.17.10.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 10:01:16 -0800 (PST)
Message-ID: <6160ac44-dba3-400c-96cf-ec03393cc141@ieee.org>
Date: Tue, 17 Feb 2026 12:01:14 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables subnode
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com>
 <20260217-topic-ipa_imem-v3-1-d6d8ed1dfb67@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260217-topic-ipa_imem-v3-1-d6d8ed1dfb67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,reject];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93209-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ieee.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@ieee.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C46BA14EDCC
X-Rspamd-Action: no action

On 2/17/26 7:30 AM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The IP Accelerator hardware/firmware owns a sizeable region within the
> IMEM, named 'modem-tables', containing various packet processing
> configuration data.
> 
> It's not actually accessed by the OS, although we have to IOMMU-map it
> with the IPA device, so that presumably the firmware can act upon it.
> 
> Allow it as a subnode of IMEM.

OK so you'll define a "modem-tables@" property in the SRAM node,
whose phandle will then be referred to by the "sram" property
in the IPA node.

That sounds good to me.  Thanks Konrad.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/sram/qcom,imem.yaml | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> index 6a627c57ae2f..c63026904061 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> @@ -67,6 +67,20 @@ properties:
>       $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
>   
>   patternProperties:
> +  "^modem-tables@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Region containing packet processing configuration for the IP Accelerator.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>     "^pil-reloc@[0-9a-f]+$":
>       $ref: /schemas/remoteproc/qcom,pil-info.yaml#
>       description: Peripheral image loader relocation region
> 


