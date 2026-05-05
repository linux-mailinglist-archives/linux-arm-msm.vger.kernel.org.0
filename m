Return-Path: <linux-arm-msm+bounces-106031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE1kGmVn+mnwOgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 23:55:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4FB4D41FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 23:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 576773034BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 21:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F217921255A;
	Tue,  5 May 2026 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/53vS+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D844968EF
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778018080; cv=none; b=kqnTDP1SbGOmY6v6Xpmik+Oq9jI/g6yxZ5Hhc/mUZu4OV2A2miQLpNZOoTmpTjNsNHl5sueJuyxgi/CNiVVObqR+Ixp0l9fNkCj/CYo3Zg5F1coRXcrqLF0t9qjXEKveGTA8auo/Piwkyu8USYpMcHozQnwq2KQjzfLQnLC/Kg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778018080; c=relaxed/simple;
	bh=Z2huH/EQXujQCyF1M3eGhzyawOQuqd92ysZl/OTmGJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBjj5Z+4rEywAsFZ9jtzXmYypFEN+jyf49Slyp3qPy3UtccPoNDtb8722xrKU2nHIMU9/F+2k/Po+0Ok36D4jNGf5Ej1sGkq9NvE4FG+E1uTMqoHCB7RcmlEanB8JNnCXSMfZ6Jv9UdkH19TtvGQxKBi/Kaj8Vpt+CugFYJ6n28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/53vS+F; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso634194eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778018078; x=1778622878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
        b=c/53vS+FeMcLQacVv+h31lhxPSmgVWLYmYQBYDZwgntoj7qetk3qnpz5cjCvXqbHiK
         rwkk3IQbWB/DJLvj5uvOQ+DS3cdYK2g4PpInEgIqwYYnQC2wfkxCjgWEGQN2qoxEDpit
         06u+7kMtPgoAzr1Y6UQWXYiZPGjmQeBALkrxTubNDKQn2nMLLfp0DFIcf5M5yWtS1r8/
         /1DraMhRP+9Mk9YpCrEWkAHDQ6VealkMENOo2W+hiOMeAl30BqioIDqlmm5JQxxYzDnq
         KtyKGCk0579DYyhRA2Bapvoqe1tXxYMsRMKxfOrWJziYwMXslRqsOXKpt8H23KqtEEhT
         o41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778018078; x=1778622878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
        b=SCTrZla4lCnlkubsgV4VXiTDXh0mOZhq04WMab879au7vN8MB6QU62nGInT8h+il4w
         LWWgO5/PzXJGg2eYjRbIMW9N5UsjlgDxE/J7AxJfWYOaFu0qozRwFNvENaXzTgwuFz9V
         pb9CnQLWfHxV5QMXLEHQkioYCGVyK5FdktvCUKhGizZ1Oj/EBMS3RYKJfWkHNyqWwm6D
         BLbfjrR/jV07xrAuuyyJsijBw/lxdUizUkISCDBiXQymjy9CDr0s1ozTgPk5CLTegpB2
         rpkMz8L17WN9BqvpyqB6zS8S/WxwDklKY9/PIJ75N9geE0KAANOtL9SrWuNGECzScQ2e
         lekA==
X-Forwarded-Encrypted: i=1; AFNElJ/io8HSCKNSyxK2Y9LNyyFO8CHdAiM0ofg2IhyDBta4IHeN/u1UyHM7gzRMGByi0FYBnnknlXpBav5/XQ67@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41fQAt1VJzEazrH1gJ9+ejsgVOcz4GCOqcdWBn8ehseCA/L49
	3PbnISA+nGYYIybv0hgSDWEJ4SVoG+kFQoC3REDQ04uxNTDCyJahs04B
X-Gm-Gg: AeBDiesOHvpxeYI3k4fyhLs2pciLmDMwK2oJqcSt0hOGoUWBrI21yW9PSnfcW2ItREv
	IUkXhak973LMIr4ArUaSbWVosyJn3Ck8w/m8IH9UCAcFbWOXVd5/WONznxBcnle40rS4kxZ/T8+
	z4VdmDd5ushPNLLE+A4uPry8UJzWELw8RwyRcc6oNmjwEdsWVlEzAAMZrXP7eDtVZPGTxrTgcbj
	r4XSofaPlij8Eu/S8GULgn1FLT+7R0l7hBcPa/sGqD/hE9/ygVcYo+SQmKZepEja10EZ/+180i8
	XnqxuDdW6Rwf/xSZCjGYkhS+sF+3Xt+U6/xgratlrPHL0Msr1rjeb85wCjxaIPqbJJoIxgmhVyh
	AF8apPx5B4a0EluiLKx4zvLhTZf+jDLnSEQGqoLmQNaPCqb/P8uVke2x+p2BvOXwZ8MzFiWuyEv
	Uw8ANJ8Ulqcw8Xyu/ogT9bLUye/RiWEwbnPomQRV6SNzaqZiYaRzbK+Jt+MdzFBLIAgOrlUGlFE
	0U=
X-Received: by 2002:a05:693c:8110:b0:2d9:32c8:2b69 with SMTP id 5a478bee46e88-2f54a39074amr415753eec.28.1778018077853;
        Tue, 05 May 2026 14:54:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:94ef:a6f3:2c96:2d58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec763fsm722870eec.4.2026.05.05.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:54:37 -0700 (PDT)
Date: Tue, 5 May 2026 14:54:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/11] Input: support for STM FTS5
Message-ID: <afpmQKJilpgDqrpJ@google.com>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
X-Rspamd-Queue-Id: BE4FB4D41FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106031-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org,protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email]

On Thu, Apr 09, 2026 at 12:15:43AM +0200, David Heidelberg via B4 Relay wrote:
> Used on various phones. Minimal viable driver.
> 
> Includes device-tree enabling touchscreen on Pixel 3.
> 
> What is missing:
>  - switching between AP and SLPI mode (to be able to wake up phone by touch)
>  - firmware loading
>  - anything above basic touch
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied #1 through #8 (#5 with minor edits). 

Thanks.

-- 
Dmitry

