Return-Path: <linux-arm-msm+bounces-112930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2vD0F8P+K2rVJAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:42:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B25DF6796CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:42:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=V0nEZuJJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112930-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112930-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67397300D32F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E546F35CB87;
	Fri, 12 Jun 2026 12:41:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA763DD852
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 12:41:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268063; cv=none; b=jxN6XkPZ/xkBzqCjMUftnTvpfphLQ5iVWX6nl/UTNUYxq0zEm7P+60L15LvIE/PU0DtlaNXpMQ1txAS8fLmLrIWUpXuf8EIfeADieysZbbYddi9APMCNsdVJbVHqPEeoX7DYybh0w3dXXH7/6GvXtFQWon5KZ00yDLMDE0rCBns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268063; c=relaxed/simple;
	bh=Ju5wslSRsvwhk5WsIoCvEoMVc/9GYY2hK7MaGnkp3m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhIocw9KZHb2faHg8WjEvLyOSHpPSqlG83ZhVX/RfVjoT/WSXavyqDrFs+MA9SOv//Mg7aoZLq15pWuFxRx6w2pYArxNMeeBgjYcyTXl+ZfCIxPTMLgWl7WT/IbdjjIfm61T3aEZvUV4BWjCBYdrilaZuR2wJlIKcXncxWm4hwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0nEZuJJ; arc=none smtp.client-ip=209.85.208.172
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-396745b9abfso245371fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781268061; x=1781872861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6qY4NpZ30oPzo9/fz3bRiZ7Tbc8aHKKwIffAI9M1Bw=;
        b=V0nEZuJJPBZEVohcRey7+kwB5rD/pDgVhUguGCMEZIPSJGhaY4KORyBlbr/uXtBasC
         Yq6nggKWLrKq579Es9QD6Rws9rEqvDDHz1UsfSnZJUzgGsibIV2RxA8sW1ReB3diKDGD
         LM5knXJheYf47JplRUpNG7UV/gKhEE41qOncd7VJef8rNGSZJMYjNaK/QkWvlpq+Ur60
         c4xTT7KsjSEtM8Q9hKNnW2Oj4c298HP7i1oMLyg2u30U5xjcjwMfGl1Nw2TEK8Vtf8Zn
         MfOYFixdfYzK++oJVmtoL3UGbm/RjGTsVrdl95qDApisCkWYWQbhvQFrdUZdmYq68T2w
         +jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268061; x=1781872861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6qY4NpZ30oPzo9/fz3bRiZ7Tbc8aHKKwIffAI9M1Bw=;
        b=GnNWUe0o9vO/hsoTiyomLMBetbrJ0d/8tLRX20TLVPmTMSV/doDMxt15Slf0joShi2
         Rz3RGIAunVZUgFvAOVXMhaz1TDQSum6RrCsa3x+lgZahRpUrIkHCwTkypWlQsIzb7FOu
         dySkdBqcdRwb2Q9nE6B3lnr7Zy1wyDs6tY0mhmSqplE57j7Ek9xb1vhWCVK37LTzdV9S
         JcFWVz7ChUmSJNSna9hRLph5fOOYDEKKyNpbyANFvE1Rm5vROykdE3+SXqI62czjIpNM
         yeqtVNMENb8M+pahoU1qAIPk80+DDJ2nf5uK3bDvhHqcDBZyTpZK0rC+beSzlA+tre36
         VAAg==
X-Gm-Message-State: AOJu0Yx7Do2NlBr/t1v7jjDEmOoh9AnBqPArqWPeVZTz25wglwhymVkT
	XuTtqaFYMdMzwkFNt4h4Ic2eOTErlkSHIFTEKeS8J8gdW7yxqMW6hv9HqiqFM5ugvMU=
X-Gm-Gg: Acq92OEJHOnDYaE4CmPC66LoFaSh9DMzDc6ZsHjogxJgeZ83Zt8dGzOvwARSiQwmW+t
	i2MA291KkDyFI+PbHUiGJij1ZO+5lsKjkQG8o7+6u+CJ7cOx0ODG1fzQnTo8bTbZgLjvTw/fFYQ
	aWXiaaZd6/bFF8Q5jpmUMxffEhNOe0TnCZ5io8MGpdVxrZDXyJ1aXdzPno8IviyfO77hvcB1HQG
	f2XiWSGLxKNI/M2iE+AJiw5GDoOjwTl2Djkkpc2mgpPabbG1AZo1zrvQ6KMV5orBDnSxJbCCJVP
	tym5MMqEv1wSJY2FWQGg/7vnmvDZxUDddEaJPSaxe6smv38a9TccDX7aNmp0+sV1XOTu+25a+jH
	gvuXTqIm4odJDg+0S5TvuAVqMAUhmuZmWztTs9XbKfbaPUCQGz5CMmVXU3bkIoIM5NyA7NXU4r1
	BK7JNI6FrNu67NjriVhBnRPY95zLknt3mgdrCD/fHz/21gbD0FFLPD8WuPIyCxnDYNtl4VEpvjl
	BoBGw==
X-Received: by 2002:a05:651c:984:b0:393:5904:7411 with SMTP id 38308e7fff4ca-3992b069ea4mr3516121fa.3.1781268060501;
        Fri, 12 Jun 2026 05:41:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29aefsm5863241fa.1.2026.06.12.05.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:41:00 -0700 (PDT)
Message-ID: <b1d23af2-a431-4d42-86ae-77bc4e528768@linaro.org>
Date: Fri, 12 Jun 2026 15:40:59 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
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
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112930-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B25DF6796CA

On 5/17/26 20:33, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

