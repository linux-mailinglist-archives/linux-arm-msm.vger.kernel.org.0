Return-Path: <linux-arm-msm+bounces-109137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJJYEEFSD2qpJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:43:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9BE5AB32B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 20:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15F713040B22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87BC3C4542;
	Thu, 21 May 2026 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWWQQyNE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375A83D75B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386377; cv=none; b=NkMzLx5+2VopxW+t8qvrsxN6Yz0LMnSM9EsScu++iNBf6IqoXrlNzT3zYmUN8Eu0yefyVre5dRXt5J33RNq+nu5oY2RZngo33w8+I/tNX/cdxmjS7sEI6ooG5iBv1SyI170qdE+SHVN4miHaTMigZWyapzKDCa/clnX0dTxpdEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386377; c=relaxed/simple;
	bh=qO+RN+GFg/xy2QDrX07JnnPFA9T4NFRlva6393jHk3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+Awhs9OEXInKOk5RrsMk5m4VEwfOVo04NK8Fu7TMU65oXogTq/oIGzUUWSjisnhsghMDAY0eN2zlEgtGS03jJIVyOMn/9/Hr22os1oDO56/juo4RAQuQ0TaAVGssjdVbBBqaOaTdERiQ6gFZke4OgmBxgvKGDb220cRg6/mHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWWQQyNE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-449de065cb3so6053785f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386372; x=1779991172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CByRJY1ZmIfy6w9D1VtZFOKx1JNNuMZVWudWcvdfISQ=;
        b=gWWQQyNEs6mgk0eCTbTXvfHr+qoY3LpaPqjis3MpZoykSaMLVFYImeMMe/4aTD1wZl
         wjZRUvkLe9blydy8xoYmk6hoUW8i/uXQ23D9pBx8GKGLYUGh/hlsf6jQtLc6sF2RiwfW
         8OCb4M69JuTIaeQABkH2iDMyunm0LDo6oOqA+KWR6jrKh9oiDk/VZM6Tb5ynBT6VZ3Mt
         Vfu6yTuCS/U/FK6kx4abMfHHwwblPgueB0hpevzDNqCViaLHEjZyyTimRsmQcBHB6aL6
         Fxe7wcEtXHynUkCsJf0wG+KKMS0UFgunGeYqK2GIN2uMfB2lwNLBAL7MJOtdI6a7MqA8
         kPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386372; x=1779991172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CByRJY1ZmIfy6w9D1VtZFOKx1JNNuMZVWudWcvdfISQ=;
        b=PdCmR1g+dp+pMLgKUPdra5b0Kk7Wipo3CfruRcz91kGbtRuSrii7Mqzv7od+jHq7sR
         GOxE/EKsWxhPQetmwI2ishbO1V1QY/w/J8IJSv9+kckzHTT7MqOeNq/II+ffL5cxSy/8
         lGT5RrffsFwPNjnmQaJ8il86nU4nC4Od0C+RNZom2vvCgBKr72bwa/qWo0K5D2byVooq
         2xeFzkmRPTTAfKvj4rOlNREq/Lax2cgUNIIHWwMUVBp25blZA9PazQaYpURRSjgeEBNt
         HNIxWXBn4fr118hc59aqCFrKdpfl/K0FBI9GDhm/21iSYF0FkNkv+rgytMvIvm3dRiIa
         F/7A==
X-Forwarded-Encrypted: i=1; AFNElJ9XGPq/fRmBCrBKuie8Eb9aov7jFZKF4+yYy2kRF1BQ3ZIi6lSthwjLkDM7J3CXrKpp+lcppb9Qm0R5KDDd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8V2BbKZabFD0SWh0AHmhCRlHc37AGdeizkYJ7iNEEEW72lbcq
	0p91tcBSftt1IyLMOTiUoLvBB/Jl3I9PGtzYxQc/3kWyadP1OC/EB7k=
X-Gm-Gg: Acq92OGFuTAx19nAU82wORdJ/HKUgFiT71KFEXblnhvu2P8RHKVJyVyTEJPyHJEhucx
	r+9mOEgNK6X3T4V3v3Opo898A2jqZvmtlMuy82TmUGXeJWX29RkLE9PO118ydJHBXW+ptTvToi9
	/z5tLG0lKWr6KTVvEXoe8CCijN+azlDBh7oT5zFq3w4Hj/qMbaweghExszkcxk43h3ow/uF2Tzm
	G9+HMBKL0pEBns0j7KFBdyKF3hjWZCw94ET5fmvbqyJgb8jlNCcqxYP2lnN0EkAPmmnDeQdZMPf
	QboFNe3n/WrkDY8qu3DcQIIEZGYuWFiSK1xczoiRrDGPo2ToIByTmspJWtFuKPPWqsb70acuuxb
	qQLbxnMdvCHuz7lZGwxxnlOs9JL6rrgSW+11L2D32XmNFWwaeY6HqOoPOChXRWVhmG9z0xZK/xk
	JoJPaB7aGT8YrwHmjRckE68oj5OSa7DUp4wSh24cmRNjG/IUJV6i4IvWGjfbpdETALtKc/KtjXL
	aWM8ARcfWqjNcFf3ptM3m3K7dY9Z71hPFwyoaGOXGn+OXoUYlTiO7pF636WaA4umTlWYQ==
X-Received: by 2002:a05:6000:402b:b0:45e:73eb:2a75 with SMTP id ffacd0b85a97d-45ea3ae7658mr6591102f8f.16.1779386371837;
        Thu, 21 May 2026 10:59:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92f622sm4635686f8f.24.2026.05.21.10.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 10:59:31 -0700 (PDT)
Message-ID: <ec040a0f-9ee9-4a26-8dcf-3ae5c5aa72cb@gmail.com>
Date: Thu, 21 May 2026 19:59:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP
 alt mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-5-9df52552bf87@gmail.com>
 <990a0d6b-ef5c-4d7b-ab63-e75c37825397@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <990a0d6b-ef5c-4d7b-ab63-e75c37825397@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109137-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oldschoolsolutions.biz:email]
X-Rspamd-Queue-Id: 3C9BE5AB32B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 10:53, Konrad Dybcio wrote:
> On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
>> same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
>> working on the Surface Pro 9 5G.
>>
>> Investigation [1] by Jens on the Windows Dev Kit (WDK2023), the other
>> sc8280xp-based "blackrock" model from Microsoft, found a reference
>> to GPIO 100 in the DSDT in addition to 101. Switching to GPIO 100
>> fixed the issue on blackrock, as it does on arcata to enable
>> external screen when using the left-side top USB-C port.
>>
>> [1] https://lore.kernel.org/all/20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz/
>>
>> Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>> Fixes: f6231a2eefd4 ("arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G")
> 
> Fixes should go before your sign-off

Sure, I will change this in v2.

> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Thank you,
Jérôme

