Return-Path: <linux-arm-msm+bounces-112929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hU9bEjb9K2poJAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:36:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918A679603
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:36:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=UruNWSys;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112929-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112929-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AE21312BD07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EAF3BB9FC;
	Fri, 12 Jun 2026 12:36:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BF738D3F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 12:36:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781267763; cv=none; b=eZbI9v/YRx0LewX0xC9oP/YBwA0TEqhcl6zm1xb1eRRn2sqcudvfGrqZ+SCJO/MxpMJgVivDtG9dffy7MZ+5MLo6obG6Ytn/QaW0em6M/tg5n1Rfg+4kolAdaU/ishvNKBJqep5vYHbm+QjNJvm64eibT6M2TXaPvGlC3iJeNR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781267763; c=relaxed/simple;
	bh=vD5qLfyk0vIHFZ/ccv/arbsN9b2IE5ZmgWlrJOudNf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TsakzdW0Uv8I524RO1Y25t4qnXm7W+adGRQOOuTYbxg5Cc6jN/S4XDQmFTJrKSGKIfLY0OwCCFviNqoQKUaGhMzy08LV+9JQ615mDcboToAl1rBaJXY1PKYE08MRzikrZb6jLwhKBzkcbmSniPZbsgHERY+a1v+ky2721cjwhEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UruNWSys; arc=none smtp.client-ip=209.85.167.54
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa679cc2c9so130201e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781267761; x=1781872561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK4UXsAg+++fA1AFGdqbhoeWfRkIvD32qkyOSrFCeU8=;
        b=UruNWSyso72GgRwUer/d0IA52/3FDaRa+oq9piPJsQ68nVSYkcwMrvn46DSAytoRIM
         gurvHitgdp24aLpDDlPHzN6oo9Cm2pSmfOMq95ByO8gH3VGAd33EPEPqamFiUR7wxgXs
         qTlSdxLIaqA4KaIdaGA8RMwdC4FrNFM1v+whZPs5ag2Ake0KgQVzSDVLY8KoA6ojkZHT
         WnjHhOn1c03yEJLgdmjeT7rLkYFpPTnQc+dcHyNJPfyOxvI3bCpW/zYLLp9ZpQEer7Yk
         Uwuqz5L1k8ITCxENu9qbBNEICa4B/vwKfnPgplOm17M+DoyM8nEHecqmjuzsm1anhJ0o
         n0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781267761; x=1781872561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rK4UXsAg+++fA1AFGdqbhoeWfRkIvD32qkyOSrFCeU8=;
        b=aARtqA/txLTL67qk84z2SlUABJrHqVhQImLbUUVm/fegyOzRYumiTt+iBFEEdoibG9
         dc0PEX5N3EOfCLSMPHDwN4JmyvIr/MIoKxwk76Ac1k9P6/6gbmrc4+eL7OUJlE9a+zDF
         LRHVg/zOso0m5o/UeUzBoFb1SEKCQW2/psU3VeILg7qHcWpxNZso1DyC21yHh35t/ZSJ
         vLS47s2qiYS9ytZDoThmpy07Q+leLm5z/cOSqw1pUBn5K7yKYhUQFnubZmCDIYnzMPrg
         7OJ15du99VCN1gBxCXzhrKiFIlKngWL73LQnc8XCpt4RMmHNuK+FaE+KFXZTfkL3/iKN
         zvgg==
X-Gm-Message-State: AOJu0Yweubg5SafOrnt9b9Q7ikOywCXPLR4prDO0hbeU2CMyrDsOib6K
	Nv0qvQeHSctEs4WXwrhoFfq+K5kKbNYLjn/jq56JYQBYwNGjYZ2EE8ISpbzGRFeN/To=
X-Gm-Gg: Acq92OGZj1ShITJuuUVEamDtXCfx5TfiRkFp4p7gcNu4+anTYMWvcbytWv0WbTrbnae
	LO837AS3tN9BNZrx541AvR7o/6y2tT2gUWORQ3SQaPxhoG8oI4jkLSSx7wNz7TBfvnT2pWJ7GpA
	JnlOGfP8jiAacYCPmU8UfTNvO95KDH5Up/HhIrUUjFFI8KVVzSAwcJsEgyTZgGmRsHRB2oAQR2Y
	shCd/g4/gZm7aVPTBv5nAMn3LH3l/W+yzYoXIeJ3UMPMmNLd9K4apX21DIfWI5d39crAyxpqVkQ
	b1eoehoZoY71EWRrHq6kVNj0uhx9oL2g7EKEiitm57xEAY9IABEOcrjCMgs7AukC4P6GxQ+pt7a
	ITSCQ1pmIekwpSGECdf6qwnp9jaZkkO7oGwvF/TpOYxHkyFQa8qldbP9FNpcYsTX9AWB5BDHZAJ
	cpjdbwG6vU00vyP4uP5FoGVtie8O3//EZWzAVN+LeUk4jsuHyZFUMlHv3G86DwobHG33qiWqCW8
	Z/ZFF1E1+VpRemB
X-Received: by 2002:a05:6512:3f18:b0:5aa:6a2b:d457 with SMTP id 2adb3069b0e04-5ad2db5ddbcmr403229e87.4.1781267760523;
        Fri, 12 Jun 2026 05:36:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7328sm509490e87.45.2026.06.12.05.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:35:59 -0700 (PDT)
Message-ID: <802246ec-a020-4d98-a50c-edbf89f2c24e@linaro.org>
Date: Fri, 12 Jun 2026 15:35:59 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: qcom: Add Glymur camera clock
 controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-1-9d00acffdbf7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260517-glymur_camcc-v4-1-9d00acffdbf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112929-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9918A679603

On 5/17/26 20:33, Jagadeesh Kona wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm Glymur SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

