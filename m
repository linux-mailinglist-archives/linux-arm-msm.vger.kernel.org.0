Return-Path: <linux-arm-msm+bounces-69514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EDCB29D5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A35F177C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 09:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73488305E24;
	Mon, 18 Aug 2025 09:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C9W1K+cT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A414AD0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508418; cv=none; b=j9m4cRhWt27FlV0xPSVVx0DyxvP6YWwNE3ez5POCdPpuw/YVRrx/tnBydmqrIsKgCnphEj3iwtLgDnAMFw0RlE6P9b+pLS8Sagojha9Py0RE5ILPb8jGvZETBy4JsW+/2KMyCkqSDrUn0MS/Y2fMkX5ZJvOaQf7mlYWQsuez5QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508418; c=relaxed/simple;
	bh=xelw41k3pm5cV8Se8ISfXTeVZHnkMuKVO9e05eqy3No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHstDGIlgp+iHYoOlz2tZyKw1he20DYD34AidHd4Mq9H1/pGYOD3TK72q+OUgT5EwPzXWxP9Lxu2o6vmHnvgww25n6UAVaNP6apoZKOrUS+WXnm/noCxKfaKJhTOzRe2VG7SHbTG180Rr2yWMQhKdoR1bhLF44nkr4YnWO6qEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C9W1K+cT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b471738daabso3676065a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755508416; x=1756113216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ByAqf7ew0qsvJFSkObrVJcMa/hiCKQ4k7aVcvlUbpt4=;
        b=C9W1K+cT5ps42o3H9HzYBnM4SPO26FQcXEVBikx9EfxJIgbUgTjQh/A1vVVVo0ipZw
         jTt85Q9ciyP1y5VGy7QLDV7ft41Qzb4FfkkXL3slsxH1+rlgiDc7Xd++nU6RtiIoBPKI
         L6/Rzr2zHDjL3GN5WoEfYPn1SYFGiMQULulV2qc+3FERwucLibJTdVxqu9RQyaQyeyf7
         wbHN/lijD+5af2eb/dNiOcq+WDmqkixx3thL2CRhLntiTtBcNkdvGms9GTQMmAYWsuCR
         xfu1AfjnzJsrrzFuL8m3f/Sggy3ty+PKgb3TTH8tmbLWYYOWRQHDH3z5+ysD1MHb8l+3
         8ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755508416; x=1756113216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByAqf7ew0qsvJFSkObrVJcMa/hiCKQ4k7aVcvlUbpt4=;
        b=DqpOmktq6U7NRSiJJnccB/Y0w6qzP7Ls5ZxmVskellKNFKWtHfZdm/lP6ylMW3+M9j
         H8+5x/tkvah+PhSIDEsw//JtaSRpRYLt7XJCqx7UePzfSLQamtaMWkyUEHN/7to0VN2w
         NTrk3sAJZyVKv5QlDgbgbLM3/bVfyJ6o09kuUZrbTmTz8FHyqM/M0UCDB2hyhgUZWsQJ
         OuMn5lJ7m1/wmOaUjkjj/AEBm+H8K7TqOLjUroYdxl8hCNTMkkn1I/4DKDP0mYzIzK7X
         FukdnA4Zp5DCJQUEGHuhIR5z7YIfeBXFQMhB1LUGzcVKMVlQ2BYegXFCpDa+gKkcb624
         QiFg==
X-Forwarded-Encrypted: i=1; AJvYcCW8Awug5Rql2EEfSqK500dOhmBoUGpCUEaVUzXUTQwZFBMio7Rx2hU1SvLFBr2cipLriCGC9wpXcWTrYUjr@vger.kernel.org
X-Gm-Message-State: AOJu0YxgorQmQBR9QlYsbaxh2l5YrRufVQBlLSK7zx/YagP5mZCrcZ1f
	mjZZqao1frGNGVvMLEDS1xv1UYgvHLecjQkr/QWroyTng4RjjsEseaELwhkmBs+SdoA=
X-Gm-Gg: ASbGncv5wEd8VkvRWdy2I7jRYITHlUIHMvKvYlvR6dTQwLuT5HAO1+/Bfs6iLwptJs9
	jdZ+keJiwSJT1H6lh0+3kh6mbOPzqWtVRv3rbYWel2e44IS1F5vCWekL7ch/3sai7ckAuIc601h
	bZm7I1yeSFwFF4VqtgMvkYksgTe1CnNl4Gs/owOhi26bDgmpx5OAOcl+csmtI/xGGxDz6bvNnCw
	GCQaNMnpSWeJe10bCEU136H792E4hrjJKz6pU6PdaQN27To4N5FUgn3JSPhesXgwKtgKBdOu0s5
	Jhf40FiZPLwbOBOh38U4teuHWtXhqwPb3NTNTbfVYQ52AT+DGnaJMg+L1/XnaKNWsX+2sZQ0Yhf
	n8c9KfNpC0/oVVwBvKWttyad5
X-Google-Smtp-Source: AGHT+IH4KDM7M4CRQXVnB3k6j8efu5yywyMexkJLQg2z4smAorz+ZWupNwv9P9EteJCL5oCvCbiASQ==
X-Received: by 2002:a17:903:1b04:b0:240:150e:57ba with SMTP id d9443c01a7336-2446d6d33d2mr159454275ad.3.1755508416372;
        Mon, 18 Aug 2025 02:13:36 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c4d680sm7505714a91.21.2025.08.18.02.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:13:35 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:43:33 +0530
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8450: Add opp-level to
 indicate PCIe data rates
Message-ID: <20250818091333.qlbipfkg2hasdzwi@vireshk-i7>
References: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
 <20250818-opp_pcie-v2-2-071524d98967@oss.qualcomm.com>
 <20250818090240.in7frzv4pudvnl6q@vireshk-i7>
 <5f3261c3-3e44-42a5-bac7-624ce4e7041f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f3261c3-3e44-42a5-bac7-624ce4e7041f@oss.qualcomm.com>

On 18-08-25, 14:37, Krishna Chaitanya Chundru wrote:
> I tried to add the level as prefix as that will indicate the PCIe date
> rate also instead of 1, 2 to make more aligned with the PCIe
> representations. I will update this in the commit text in my next
> series.

Okay, I will let the DT maintainers confirm if that is okay or not.

-- 
viresh

