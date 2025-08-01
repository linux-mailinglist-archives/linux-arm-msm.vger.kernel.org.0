Return-Path: <linux-arm-msm+bounces-67314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D4B17EA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2F4A1898FB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB8C218584;
	Fri,  1 Aug 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8XEuFnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BCB18C02E
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754038594; cv=none; b=X2crf/4U0byVZgii4+5gOOPoO9MN3aldYYIO0vq6mpkmiXHYphmBHm5DWZlhNNMH3ylRhnQVSsn+jdxasaV12KDQyIdagaeXleX6SMP0xUQjip4lpF8PfHg57qdQuyFXg+FNcl7CBy5gqx35qepYC46iw+7wxLCx9NSa8oU9BMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754038594; c=relaxed/simple;
	bh=iWJ6vmjjHeJh3zw3l0ivlWKd8QssgOEwNGy9AZi+LA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUGJMEswqnIrlhOxbrIwE5i4H/invSK81qeIt2Qjd3jAUU32gqrGGQFm6d6zYfP7p/FqZEG458lGVP4w/w6BSw9F61RsD2pueGBEf5cMkqcnHXrLgrzkJXJjbZsfe8AepBBTBIDB4ctwS78vZhCOpziFesvI7BcPBIAx+BFTijM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8XEuFnU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so1685933a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754038592; x=1754643392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyaLPE5cVFQ4yQ1ZdsM+PFkuZa1fSK3UsMR4TaaRqL4=;
        b=s8XEuFnUVTZbCkmIkjm4GFlEFk4G2qQKuyJ4BY4gU/wEUjrzBvuxVtA7txJsvkRSX2
         6zCw/2lqenhwihcUTdDlkRcnhyIE7mgqywXNlX2WxFbIAKMoS1WdAuTUM/S3TG/yEUe8
         KZbUOiqPUUJUAHEPs8ApkgBRi0MG6kgaCXYRnyvkJeMFXF+RpXhRa/gK9qcX+oKYr/ka
         Shx1RNtcEbxc+z6/i0e+F+jR+6AiTA91Te7AU3kEMnf+1eH+6LncapBF/avNXE/Sbm3B
         d3zgDSTWyuSVrmP4OX/2HkPrtwI4BdXWpYW35cBS1nnybtRz8iHCTnG61ROS5Bi0CduC
         70zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754038592; x=1754643392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyaLPE5cVFQ4yQ1ZdsM+PFkuZa1fSK3UsMR4TaaRqL4=;
        b=UN1SA5iPOmzPpSX5OJ+qqez8e5R5W+Foe3AwXFgGTOsLgLSQodvdCnKlDYAzk1t1e6
         5HHFHux/at2rI1rbnAMW6zuivy/c2et/d2ox4En6DqX9osKFQbiMaZ1zZqTY1reYyNhM
         5f6+eIIr5YGoic1pO9wlsFU+7+kahhv5VoZfFHhsWMBolSEMC0Euxs2PW0mo4jUTFM+B
         yfuR+58XbQ0yVoaP3yadZa/w6yz8OPKlLneFONJB9pptVvKaJ9GFc0cHAcWixclnyXlX
         GySoBB40dOgCj0n8a6RKnzsz6tHw+8lqVqsJOs0mD18kT5YMr85Cdh6iQa7yPM44LwFH
         5VqA==
X-Forwarded-Encrypted: i=1; AJvYcCXMt8+NRa2QG/KTIL9ul/zCGWv5oboCFdyW27icTGPa5WfWyyyTfXvK8RGw+PdjWd/Aj1m6VprxVNcNG+Ob@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLtPKJCSINX0pNvw1ZzOxBF0Kuccln6eMnHGkTNF2zpTJ+H/q
	xjpypZiCJ/TQGz2xyv8a7D7pZe8zkdSpIhQvoxCG6lkRJPhE2zhGljSjBukb1I1eoJk=
X-Gm-Gg: ASbGnctHR++wJ4PF/KYdzlBP6k/7zRAYbNFlHg6pfyv8/L0AuZzKs5rDegS/Zn7Mk0A
	ghH+1syBmLCtvHlf2ILUPkh9vyPQgmsPCxJ5JHtqvKyeZBWjo5RCMcmu3G0KAnp7Dd1bstU5JKs
	t8XA0v+v8p2zd9B5U+IshRT/OmYuC6fgs0ktNnTa/4CmL2Ryut+chjGMXEVSsIT/GOjRlSOifGv
	bcXkgkN08S9+tht2VKngwgMpRn6xdEtOMsJz9kTzjf/AxNz1pKg4s2cvU4qqQQEpsRN/FyXO8Mg
	IKhjxtUOnNSv1JjgVivtZvMR+wX+ko83IWyUeK8dqA+3Jr2XVUmvr4NDND2+34QQfTIOGPDqfMs
	1HKkdza0v44wUycfXmVPi/50=
X-Google-Smtp-Source: AGHT+IEuiwLHQsCcm9P4L0Gud/JQjIDwRrB9XRFsCWBLfZnMjNO93355PSR3Vop33rURYHmqY0i6hA==
X-Received: by 2002:a17:90b:1845:b0:31e:5cc7:133 with SMTP id 98e67ed59e1d1-31f5ddb2038mr15888994a91.11.1754038591891;
        Fri, 01 Aug 2025 01:56:31 -0700 (PDT)
Received: from localhost ([122.172.83.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-320f77d81bfsm1835353a91.12.2025.08.01.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:56:31 -0700 (PDT)
Date: Fri, 1 Aug 2025 14:26:28 +0530
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
Subject: Re: [PATCH 0/3] opp: Add bw_factor support to adjust bandwidth
 dynamically
Message-ID: <20250801085628.7gdqycsggnqxdr67@vireshk-i7>
References: <20250717-opp_pcie-v1-0-dde6f452571b@oss.qualcomm.com>
 <0dfe9025-de00-4ec2-b6ca-5ef8d9414301@oss.qualcomm.com>
 <20250801072845.ppxka4ry4dtn6j3m@vireshk-i7>
 <7bac637b-9483-4341-91c0-e31d5c2f0ea3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bac637b-9483-4341-91c0-e31d5c2f0ea3@oss.qualcomm.com>

On 01-08-25, 13:58, Krishna Chaitanya Chundru wrote:
> When ever PCIe link speed/width changes we need to update the OPP votes,
> If we use named properties approach we might not be able to change it
> dynamically without removing the OPP table first. For that reason only
> we haven't used that approach.

I am not sure I understand it fully. I thought this was a one time configuration
you were required to do at boot time based on platform's configuration.

If you need to change the performance at runtime, won't you switch to a
different OPP ?

I don't have much knowledge of how PCIe works, maybe that's why the confusion.

-- 
viresh

