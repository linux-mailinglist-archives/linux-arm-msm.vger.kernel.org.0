Return-Path: <linux-arm-msm+bounces-69508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420CBB29CF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 769071963326
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A021E30C34E;
	Mon, 18 Aug 2025 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="joLgrfFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030DD30BF7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507467; cv=none; b=EpTEEmnOCbk7u45aZZpYxHJMbK7ZSeNx/IeuVZfLivBsfjFpqfin9K4DrbNnvmXRAdRWW0oGZwNcCgOrxUjdgj0wOQIJOx1vnASd3+FYsbcs/l20T3YMsMIRUTqYO6ngX+BEt8ToU9tOiADhi8eCBba+6tGgOhDzXRb4pN6HUrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507467; c=relaxed/simple;
	bh=U8a6I0ZFus0vFy7ECIXwDx8gidXc8/GABtP4Ugbvj3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHMzqhcECwNOQtd+yeAa5SwfvHSPjxK4cDMZxlOU0vEljxrkGsCmeqeDm0CklZjmLJDGEDF27G1yZd1dZZrUpzGrF6/jP8BbbbxnKSKD/fzuHlq2jRU7QGPtKBRr6TSHT1d52eozSJs4riB3WtnyCEzIygQGE0DSD0Fdm0BJFao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=joLgrfFF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-244580523a0so32678985ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755507465; x=1756112265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qe8G70eom6/4JetV7QH5UUKrtlBYh00PHg/YyriqGHk=;
        b=joLgrfFFDMF16c+OlfLqbc5LYzBoGzeW35Vcb+Ih/6SmgZvK9rQ4GB3Igx7zk1SRSa
         7Cqb/mOpzGIfuC7Url08iHGhfnTCVeYaKIP1OhAjkwPwiTfnr3phCpTazRTH8UCGXQpR
         yik3oTCKDfUpW2MvVykzbXPiZmo4vtPkRIJlPSXA7paAFCztpx3TMFZ6n2+Se6oyFUIo
         3GGczL2lrkSXMpMfRc78QdGFIewHmM9F84mgpkuS80Vu6ob6/8wfSRgTJS9L12OU3SfF
         yOa6SBNYgxZk2Meg/9pL29vhWKK/P+gqydI47mS0dVdbN8tmZBHo59Cz6gQe02qDHJR/
         7zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507465; x=1756112265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe8G70eom6/4JetV7QH5UUKrtlBYh00PHg/YyriqGHk=;
        b=tbJ1F9OMN3tQ9BBkPFQNALKMSAzA4jv+qJnBkhPxzReW3uP3lep9rxTprUKbeXT214
         U1AnUGzpWO46fkMSBwhYtbJBrm7uiLQ5lW7PiO+bHaPIAHVJBTT1jc7PhlMDPgpI6kFU
         bbMmiYfZUD/a7xLvZH1TL+bnLaxQnpNY2gaOFCAhMEMp9eoPXV1fbVbCgU5dXIDSgdJw
         u2ouA/vqTlX+2Gux/OCXyXS22rk2kQh6IkO7emnTFQGYAcJueNXXGWls27KODqnfH7y0
         1rrEcEVMhPuBBXGzGm0wXUP2JM7i99V2iMQ1r4TAagfse5JT+Hq+nFLoL6w2UZeGM1m2
         qI7w==
X-Forwarded-Encrypted: i=1; AJvYcCVLiu4+SS7el2B0B3P39cXvRoxjvKTczx8Z7rrpNC3C1aYBdVxiDvxrWSnI3/SwYP3OYhEubKIIf9AnDqs1@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxDIVxhPoViA9X64uv88efEubkw6z36rhzsmizNbyoPLVJbu+
	tD1HIUuW1pKujANV+/Qk4dBsJfTew9JhGINhnzhseYigM/NMmgvcYmx2W+knzqoACUU=
X-Gm-Gg: ASbGncuiNTnzD6tZNo9jWWeL0x/XWZrrbhGwnSw3uPnGczWOVf4WaQmBrWuJO1EhlsM
	MpTgKLNtJqIjtiVz5KZiS7KRxKrX6QjJrM2BXJaezrq/qymR8CR01F+oiHFpuSB2StzYEDPRa0R
	rRXZDqx/8LrilMBijOTnwPrfdUqX504cJiqeOwxew1kXIy/vL4HJS+xS6C1KJoapgb9rfiqm74E
	52V4rjrWyuDwq+O3ueZAkpKoRtMbVYvP3GG+ozVRSHdsfklGlXxBC7ACN2P8RfKBN8lyvw0q4vd
	2huEF/bF09b3nn6ozvYEXGB5fsds/VkJpY6DRhCJKCbLM8zm63k1IlTz0yK0m6fmrqY4WnB+PiU
	IMgc1ordf+MOvpsfadwZuNZ5U
X-Google-Smtp-Source: AGHT+IGpOHn1sY/HqKXMp8oqym8EA0mZNqXhfzJusUYFoebvw0MYrgm3dTzw/LGlv+S50fD/of1ijQ==
X-Received: by 2002:a17:903:228a:b0:234:a139:1206 with SMTP id d9443c01a7336-2446d916185mr159740845ad.40.1755507462625;
        Mon, 18 Aug 2025 01:57:42 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0dc22sm74615795ad.66.2025.08.18.01.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:57:42 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:27:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] PM/OPP: Support to match OPP based on both
 frequency and level.
Message-ID: <20250818085740.czv5lpbktpmj7cit@vireshk-i7>
References: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
 <20250818-opp_pcie-v2-1-071524d98967@oss.qualcomm.com>
 <20250818085517.dj2nk4jeex263hvj@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818085517.dj2nk4jeex263hvj@vireshk-i7>

On 18-08-25, 14:25, Viresh Kumar wrote:

Also subject should be: "OPP: Add support to find OPP for a set of
keys" or something on those lines (I was more looking for the OPP:
prefix).

-- 
viresh

