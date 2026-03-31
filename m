Return-Path: <linux-arm-msm+bounces-101034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GES3Huimy2nJJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:50:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C435536852C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA7FC30B460A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052EA3A7843;
	Tue, 31 Mar 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrdgJe1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947683A7F72
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953885; cv=none; b=SS0SiVbcb+XYJ3hdS/zVqtmdMGi9h2+S5JtSKJQy6C+0AGDylHobnje5ZcCnNO4gm3pieUc6wd1wt7k8/ZF+FUvdqCVdtWYidHjMwdleoFbwlS4rxilqZT81FjAtJX9cfilxq3dWg71T5NJndNWZyXZFEooixk5w+N01/7Mq81s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953885; c=relaxed/simple;
	bh=Kx9R5TN1HIio6tDkgZf+A60NKDGQ+/JEVT66L35t3JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DuxcF//Obi/c7rcKF54oKYN5VY7NRx38SeKRYVaA7iwE2VRJBdULfqGpA/MAuk5scyJsW3BwV4QfgucRZ3e1vZI1iBbxP+axkvemt9w8OK4EKE1HTmNfk6SL9Vi58Sm4e2DN6S7Vn3Bbp4X6UD1wrM7o2L2yeUFNsDhBtGJPZAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrdgJe1+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a277d9c5b2so831893e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774953883; x=1775558683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=;
        b=RrdgJe1+dHqHGm+kPyHQYM6ELxtg5EoBxN9vkfVn1aLCEqDuR/77OVtJvKL1vYkjU2
         uf4Qgra9c3qAzAhVNVB9c9F/jM/kSkTDtJ3qKFZncOd/RYvq8Yee6/afWi+VnmwHr2ci
         ZBSa7HbqVL535Qs1m8t7ENlH9cymOhDDZnyTNIH/xpNssFxPmGYMMP9vIGzjbxuZeZGf
         qtlA1g0VvYKoJDL5czlI0Dj1aB+nFqI9iIzkJ3FR05afZpUj3jKQJr8053WKG5rhBb+X
         +ospjeiUMeOU+mE4oVSsvakA21qwFbehCzImIbpErT+LyX6aM3PTWVa2q/D6D31No2FA
         91QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953883; x=1775558683;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=;
        b=KyMOpsLYQsH9rRliWRW4iACutWaMiJDI25x4cOJuDqWvwBWCMtUj3/1FvQeZQC/KPd
         +lq5Osxwb88qLe9OkjlmYaoC0yqR8iljahrXt4Eh/wAnd35y1GAasp3l1J78X5b9c0n9
         rirZAj8Pnq5xWGWTC7ajMYeHhR/GwSi0ahg0demlxAN4JmgrsJf7IwzYEy3JoTHUp26g
         Yb9KhC9PtqSbpqCOMhM/fHPs29iQYFn6u1kS5SazrK063i1k+uH18IEuJg/Z5WggKRn2
         un0Zzg6aNiTRR9LUq2akkqSB4DbA79nn72dfGW2p+AM79L6VI75ET49FkXDROKdb60C5
         KtNw==
X-Forwarded-Encrypted: i=1; AJvYcCXd5YJSl3PqsMPXLgERUTmrYGLlcXoYD+tXt4AffV8LwY/dojJJoaKe91Y75zm9D23qidZKPUu6OdaWqSHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSsFoYzid2dQqKFWa7DMMkf3tmcLOJZHypKw4N8ZjwwTMbC3e
	fC2tMb2IIbHX0DGaazrPdevwdl31bWbKNPa+2BJY6x32mXgMVb+mQRORClnJ0ANgQ+o=
X-Gm-Gg: ATEYQzzgt8y6OtK5jZfBsdICVvjOafvt8CjJViHBl6/4emVYPeHZr2RwxINVDnEH8dv
	52NBO/Q11fOLciv3fA1hvVsV8vK66Aj39ujPHqQTuq/PpioGbu1Lo9MXGZVrTb0T23M1v+0uGML
	/fjVh1AqAcwLS36pCHjDSlBRO7lwp+YAOnKrdyfU3FY/13DMHJ5MLPVQzcT7UfnwwckTLpId6jx
	Pv5tCLrLuCHpMAlD34l2IjXiYKOb58lbXCkdxD1xXKpJmcvZctPNmOZ4TnjBAEGpQ7anKlK1i8I
	V4t/H0rK1j3TeRWHCrxrED581eRiZTAUJAWRIut99ui96cjiwbu4yjsTRmqJMaaXS0kow6f0UNS
	qh9qeMAHKvviySZyJzxF14XyvD198wtJVpg4b6G4ILYIaixIwTSVl5qGR5ac5OeN6waXVS6xJJN
	cR1Qi1W3UJ/B3BdSjJT+MsMx4rMjen1eQVIJ9LzgGMDBnzILGWOXe9rMglpdsyj9Ms7Kq2KfiRc
	v7y9Q==
X-Received: by 2002:a05:6512:3b89:b0:5a2:b53b:a457 with SMTP id 2adb3069b0e04-5a2b53ba55bmr1795381e87.3.1774953882760;
        Tue, 31 Mar 2026 03:44:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403f69sm2330915e87.29.2026.03.31.03.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:44:42 -0700 (PDT)
Message-ID: <ebc7630e-c87f-4c17-a743-05e0639d5093@linaro.org>
Date: Tue, 31 Mar 2026 13:44:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Constify list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101034-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C435536852C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:17, Krzysztof Kozlowski wrote:
> The static array 'xxx_critical_cbcrs' contains probe match-like data and
> is not modified: neither by the driver defining it nor by common.c code
> using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

