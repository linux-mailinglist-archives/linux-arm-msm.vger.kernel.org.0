Return-Path: <linux-arm-msm+bounces-92261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKKfARTWiWn7CAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:41:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257AB10EE0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33EA300CC27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B16136EA98;
	Mon,  9 Feb 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMI75chK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD941CEADB
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636357; cv=none; b=FgXU0b63hw0ZOIbGLI1czNodqYmVSS82RG8FKKQiso9tyYAj23E6gcvztv+XTX/w9xwyEXxYfHyyXH1uTeeZS8W9PbQnhpII9Xe15y/n97tgP3i9fV6wH87GU+MSaPcXv5LjieFZ9hywRNIYvEzsdwHN85sl+ysSdAdkiJxI4Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636357; c=relaxed/simple;
	bh=04N/0A+BfnpRyNElBUEeVBI3HIJAHdzkZSaHOq+Qbf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Th2Br3zlFERXg3iyD9+EJh124pCPQyW4bacxVKza/k5BuO0u4xjb0jM2Y+SzY8gM0/ArXOJmYh6DFInzOdxP+lp2RVbyjfT/R0Mw1es2UbrnTMxsingIflyQ5NNXMxZlCd2Rwo/lYInzyMO43946vVOjYp2o+mBgrh/R/wLucAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMI75chK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7d98c1879so24832075ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770636356; x=1771241156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=taZpZ0oWLGP6Au0CiSuaC2iygIHIhUD2iwTBS1mdzoA=;
        b=aMI75chK9t1F2JQLZnpErX4bWNUVpjFvGV/0mFI/ZGjgqxWSIBd/8LN+OT+m03yD13
         xnKAd7BDDC5uF2bGMeEqYbJDn/vfw2klTEfEzHhkMQmoJQmiDlnU2wsb3VWCbicQgne4
         Dw48VfSIcE8QdKzNd1OAYJ7eZ3p45dC9M/3qyim21uh2KZlJn4yhb0rV2dKQ5FeH+oWI
         UprXaW9/mTv924usN/nLJNSEuO9ll16N1F47JBf+lZkXIjOFwKZ0atV2fEHDGW5wLSw7
         OYKlUkpCxwfvgtsBD+MpsfgeXj8DpHLB3wgJVdtng5UAYMATXgnRwBBJXWvrG/VG9WuQ
         AdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636356; x=1771241156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taZpZ0oWLGP6Au0CiSuaC2iygIHIhUD2iwTBS1mdzoA=;
        b=Sd/yTQzaLg5oeL9kwbo817jdmdT+KckAzXr4bR+3U09gIcp/M6BYhU5K0bTyEXhaTq
         egLWopP/XaCTG09k3slUVAkgA5ekbVj1c5Bqc7fcGcUWF0Br9ZZbjOv5zImnRBX5eIfA
         ssPDQiPX1Ucl3KG24hWy9+CXz7P6T9U9Tcmm6osiWy16DCRypwlmBtYkZzrVY334I/fk
         7mMpAu2ktPz6tlWrfg+qScKTYcJJj+MHyj3fnHRpS+Zzg0Bs7BLMxQPOfmFWs/WILK8j
         2+1H1pSn+uSlhpWFSiOHCYwUOhg805N+Y7Xf03Iuj7yWpq4xIAt656eLb7V3IBgb5A8X
         M2SA==
X-Forwarded-Encrypted: i=1; AJvYcCXTAm5P6ep3Ki26R2GSdHIXmHnE4vDPz07W8JBGCN+VO2kpoYuWUDkBtJ4gk5kz8rJEBn8/ddZz2DH8f9vb@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHMW85lROEWIEKi/m1uRl7mbQm+4H8Bue/mKmWDtM4mx0oKaW
	E7yjkdUsSU4Ib4CN36ouxvstd4uCZh2dvCB/4wKMyQGdkjgVDff5g6X0
X-Gm-Gg: AZuq6aKLnahHfMru75HJuRuifmd6ZsJi8MmYU3SjigRhfTU9WKPlnUW0h2/QtaTZIIh
	fejgshanfrFto3B+3hG3yB9CsoK7lwB1btrm54PnVjxnT6Mg2Q0YG+6gPFIKxMM8MI2vVcuIDs5
	WRJJKuy4VcvsqB3zxNKLBYDsu1Tg9BiYdgMkIeNCfpXYR4uBuPRWEa/wrOzaBg3YqljvXUpjWbw
	MX6CSVfJfN344tEzc5C+tOvl7onBQbUr56BdLqpLq6oTvqeTxfT6iz3CM6XbfdKU/gF7aF+zdKq
	7S9Eu/ok13UtuTidns2v6dQVPruMvhnZpIYM3P84o+zusMutaZ25+HGft5dy8JSexeNgpwszk4v
	JjJpUZmwZkrjglnNaj2gs1kavknb5PsmDO9oMsLhhEvx1Z6QcUaeoPZiJ2a4pJuHk6pa+r4cwuZ
	yvv8PyCvMOrgOeub3ySwwnSYWG0V0HNUqu0A==
X-Received: by 2002:a17:902:c945:b0:2a9:30d4:2af3 with SMTP id d9443c01a7336-2a951937e91mr93409705ad.49.1770636356365;
        Mon, 09 Feb 2026 03:25:56 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aaf2f8472esm25460445ad.5.2026.02.09.03.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 03:25:55 -0800 (PST)
Message-ID: <317e9030-849a-4a54-a4e6-75fc93b78935@gmail.com>
Date: Mon, 9 Feb 2026 16:56:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
 <20260114100043.1310164-4-tessolveupstream@gmail.com>
 <169f7c2b-51cb-468d-a492-3b880ef1bd2e@oss.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <169f7c2b-51cb-468d-a492-3b880ef1bd2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92261-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 257AB10EE0B
X-Rspamd-Action: no action



On 28-01-2026 17:29, Konrad Dybcio wrote:
> On 1/14/26 11:00 AM, Sudarshan Shetty wrote:
>> Add the device tree for the QCS615-based Talos EVK platform. The
>> platform is composed of a System-on-Module following the SMARC
>> standard, and a Carrier Board.
>>
>> The Carrier Board supports several display configurations, HDMI and
>> LVDS. Both configurations use the same base hardware, with the display
>> selection controlled by a DIP switch.
>>
>> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
>> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
>> can describe the HDMI display configurations.
>>
>> The initial device tree includes support for:
>> - CPU and memory
>> - UART
>> - GPIOs
>> - Regulators
>> - PMIC
>> - Early console
>> - AT24MAC602 EEPROM
>> - MCP2515 SPI to CAN
>> - ADV7535 DSI-to-HDMI bridge
>> - DisplayPort interface
>> - SN65DSI84ZXHR DSI-to-LVDS bridge
>> - Wi-Fi/BT
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
> 
> [...]
> 
>> +	wifi_reg_en_pins_state: wifi-reg-en-pins-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		output-high;
>> +		bias-pull-up;
>> +	};
>> +
>> +	wlan_en_state: wlan-en-state {
>> +		pins = "gpio84";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
> 
> The output-low/high properties should be unnecessary since the
> drivers that requests the connected GPIOs control their state
> 
> otherwise, I think it's time to finally close in on this..
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>

Sure, will take care in the next patch.
Thank you.
 
> Konrad


