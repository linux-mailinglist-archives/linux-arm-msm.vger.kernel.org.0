Return-Path: <linux-arm-msm+bounces-57512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBDAB217E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 08:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 136711687A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 06:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE96E1DC9B0;
	Sat, 10 May 2025 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJjYFr+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ACC1E102D
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 May 2025 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858063; cv=none; b=RCwYJKHoCNlGz7JyuUWQ0cvwJZhWOxs+tMb9L7PQ5KBbOgFOqRkt1SHW8DIZJbdAmtRui/INtCQ4pC6L5ZjN/z8wTKAJqjSSxwj8Ok6uPS9dKGxoH8wunlan48LOV0QrTAZZcEr7E/+y82ARHx9xKfH/H89EeIgrPbTJECH8Yhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858063; c=relaxed/simple;
	bh=G7abpqL8RvpRlWD+zvtJLyi96mYVrRAzZ2niGWVpHIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8+HDlmeTzZjp4plpZLfSq3chr7DB20FLAWOqJG1V9z+HgxkRb4TCK4hVTBAPFpGHXiUg22c1m0A1Lmydbby9gLbxOjs+iF6GMPqu6cGD6ZL+aFZJ9vsK0+zWzsQu/b2m9ecHcuWGzr1Dy1yPSXGiw2lYx8yXInF2NjV4D1j0F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJjYFr+J; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b9625735so1373269f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746858060; x=1747462860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I+RgFtK+DYsqfK+/OY/0o6c1VEud7Ds1bft4JaN/wS0=;
        b=yJjYFr+JTBeCBhcKr6FzN7C0L7dYoN8kPjjIK0h0QN5CaOrTKz2WiYSrNBwZ+j436Y
         WyO5EaRp1Bbo56BzpHbXpatq0zQ3phK+okEqK8hn/XBrBQlNs90e/QBWHRWvQelYGk0D
         4qJS3ZSABFr4wWffyC9XxYn9irgB/ZNRZXsu64caXAScJpSJMzGSgO6/BFQ2Teuvk3SK
         a2Nx6WnlHOYrzL/7a+3sEKf4ORHhr5VZtET61AXL3I5Lb8PJhsXByCgOiM2v/YDm4C2D
         WvwrO3EISOXVpUQa+s5M9REKVfjAh1WmCSoA6IZX2KDFx+Kc10ScWHC/2sKpS8f8Ao7c
         Cvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746858060; x=1747462860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+RgFtK+DYsqfK+/OY/0o6c1VEud7Ds1bft4JaN/wS0=;
        b=WNlxAFpYJTB5nI4bHHZFy0yD6GYgViJUcyduqTaWEMRwoMiU02t4eMRI0fp4c+2fnM
         LWEIs9rv78q2C2E6CZOW5R/TNvG0atspQn/xqXDK48Y3Pyi5yrUusLr3n7okTIuyl7VY
         pD7D1Hf02E89zsOqtWQYue8PzLovMlI341nk870m4EVqpQdZPngiUVCSScxGeqYy0T0+
         nerF6R8KUms9Uy1DMX0EMsvLTj8r+G9bsCIlpoC3GCYZ2dPWov1QoL6cNizXWyxn8eG1
         FVhBPfEc7CNDwTidYzdVKBkJw0ETdjesbvVt2I76JlTXL1Gr3fnBckcDE3QPTxxuGGy4
         1UNg==
X-Forwarded-Encrypted: i=1; AJvYcCUT4ObxBlhlPK5whaBRci2Yg8RHG/NS6NEqGXxITLPOX8WqFFIAcmw3mwbFvJ+hdq2376v7WwT25Yu0rBVY@vger.kernel.org
X-Gm-Message-State: AOJu0YwkEAi/fImZXhbz/3IPh5yfa4D/yoE5Gh8IEUCEpwf5iqyE8Bta
	3843yFpJ6MbsHNugIhTCjppimbYgGz6mLQxGIe1GBCxqN4vcQRFvF6DNmC/3nw==
X-Gm-Gg: ASbGncsXXWZCwDZYG5CU6a/j/Sm/HcJK3UDGvVfGhVP6pNhk2DqpiaKGWzVGXiR5ZkT
	ftVldoMncP6vnocGaEUeA3HiCgm6YgvsKVezhEbC31+p0XQytm9HtX8IQ6ElLqKm85+Y9zH1k3T
	rp/dSQwqs6cNxi08JsHJXkOg5gkhOr2ZmKfZQ5kenTh/XukebHY9DDrnJ1mow+4qI9NpEhurddE
	J/NbuQxC/9Pl1GG+LDm64bu22EHqcryOwTGwtuqVTQ8oa7fofK2I7llD+LmHR2puzXeJdTQUM0d
	Jq9/g2y0OSwmWirENbZ97k0oLPwZDrEvAaIm0reFGky3BGlqtJhwF9YcpzAyF3Anwlcwsqg6TlX
	L2JaCLtFHrcFJb/O7XBEu01T3mWN5aIImxA==
X-Google-Smtp-Source: AGHT+IG6eqkQasSCxgXWl2HJjaQcUoIhzrtFbVjbO5iMI91GFHnIhLWlBtSGS6/Nh1kUl6LsJ3qWIQ==
X-Received: by 2002:a05:6000:2ab:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-3a1f643eaf6mr5487308f8f.33.1746858060057;
        Fri, 09 May 2025 23:21:00 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfc9sm5377930f8f.5.2025.05.09.23.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 23:20:59 -0700 (PDT)
Date: Sat, 10 May 2025 11:50:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Add debugfs support for exposing PTM context
Message-ID: <fehrphcqvg5nyusktj7qdxnvve2pt3rj7r7sz6p6r5qenpfq4x@r6a6fqmx5zqg>
References: <20250505-pcie-ptm-v4-1-02d26d51400b@linaro.org>
 <20250505183714.GA990024@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505183714.GA990024@bhelgaas>

On Mon, May 05, 2025 at 01:37:14PM -0500, Bjorn Helgaas wrote:
> On Mon, May 05, 2025 at 07:54:39PM +0530, Manivannan Sadhasivam wrote:
> > Precision Time Management (PTM) mechanism defined in PCIe spec r6.0,
> > sec 6.21 allows precise coordination of timing information across multiple
> > components in a PCIe hierarchy with independent local time clocks.
> > 
> > PCI core already supports enabling PTM in the root port and endpoint
> > devices through PTM Extended Capability registers. But the PTM context
> > supported by the PTM capable components such as Root Complex (RC) and
> > Endpoint (EP) controllers were not exposed as of now.
> 
> IIUC, the PCIe spec defines the PTM link protocol in terms of these
> timestamps, but it does not provide any visibility of them to
> software, so any visibility is device-specific.  I think it's worth
> mentioning something to this effect.
> 

Added this info while applying the series, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

