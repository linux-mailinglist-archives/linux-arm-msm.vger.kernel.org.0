Return-Path: <linux-arm-msm+bounces-70836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC7BB356CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A8C63B9969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74ED82F9985;
	Tue, 26 Aug 2025 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SR/wCl6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2EB2F6164
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756196826; cv=none; b=EVZ0cW13EPCQeiKRniTkRsLpt/5JjsJdNrg2ErJrT+/iQfKzIzDnu48AsxImOeoZqh9FScJe4gpKXSpcFcO/j/x5FtvL1YvcCEDlV82NIV2mnoRaMouWqxnefw6ZX8XHdzfZqQzmaVD2HJ+EhxuAfpzpk6MnSTtugMIPXPgXraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756196826; c=relaxed/simple;
	bh=CmOw9MM62MUmPOH9GRufRxbgMIWxnIxG8qJRDX5brlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKXDrXE/+Enl26ECkL3x8K6jy+rpczySzaM043EKahc9DtL8aUhGArucd6wU0KhJNyPqYXMe0WS4PLZSfHWyOyTWYvuNqNkYbBRa+mPYU6BKvCjbsAPMUx8MwzAwtUGigNZF1zdoEF+tmtBMmrlYqkbF3KZ3dQIo7fVC/H69oxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SR/wCl6v; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2487a60d649so1067085ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756196824; x=1756801624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VltlVNdXca1d/9EeoyeMXnoTiPVWJrYRgV1MAzlI0fQ=;
        b=SR/wCl6v2M7KXdsxchwPb1r6tpsOusoiJk7yPEzIw4pcdR3K/2NdcMpyNyrYgSdSB/
         Hf0j5sHxXtLBwI+4aZqOUqLjv2fKE5WJ6YnUi2Y2aEs/SzzeupKP+eLD2c+Cuz8+ODDb
         EP/Ki4RqhGkzLtBPURANsVXZ3mF1eHN3oVchtlVmJudKiP7yC/JE9IK3aQR7/EbgvSBY
         v5PUnDdVVBtcZQv376MXELz/9LklRqvm1CUK1IfSy2IqnUxQYkbmwaREKns9G6B920G7
         FWyCg1SaTAa7wE4IzctfZadTn8Rap6qGLQ/v4Y6wn5oFsS7k9CChQpUkb5BWe4zQf9Cu
         gb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756196824; x=1756801624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VltlVNdXca1d/9EeoyeMXnoTiPVWJrYRgV1MAzlI0fQ=;
        b=nscU2uDa1/dpg69UiTGwHTierYCl5t1gWKOHhpXTMVIy5gQl5OXK0rmgG6eh++un4Z
         TVu/V6hR6hkDlYVbt6BTMazRilHNjCdTuysPzyiODtMBJBqsrKwo9Bd9U4oOH+IRr/cM
         5ccrwEz74L4yPhOzU2DkuYaFOJQ7DHhLfSLT1jeZ+LSwYJckInW98t+1d67psqUOdcVl
         ET6rm5nJDtoo1Mskw4rsZdHU91+7LddCfjTuOQS8Y8B5gp3m74foOgvP3mwOPf5RE9aT
         SN97FxixFCcn0rjvKqi+fJV6YYAl2OKMK/L7y0Wl1O/6pHZBS/UUyytgtTA+Q7TFAl6L
         yeTw==
X-Forwarded-Encrypted: i=1; AJvYcCUYg36GXz/eMiCjmcwWdjt74JTQ9aPk8W7KPDFzIQpRd1VzWiSb7Z1qGGKTlmGYiFnoSLWVhaQWKm6ffZgt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp9vCa4dMZl6HFrqvAozbX04RKrtiRw1x8wAP43RuQpDdqehCc
	zWubgB/85osNiTSWMJG23U7bmNnFdkFX3NYHEvv66QOuazDj+JXmNqxgxg/Vx8bUS8E=
X-Gm-Gg: ASbGncu2zfF0qExunqazqp+yqhWbJJ1L5bu9DuQLOdGckX0HGzabs1PKTGXJ4ClWk+N
	ly+IXpZd1QHfjIsU0Nx0FUVzU4rz/VXQGs/Pa4bGd56C+vKpGDSJhlqHGg84sROoxOTly5yfTlB
	D9fb9S+qQL1Qf56t++VzEAH44Buw1BptDwQEGJdfCWfDR0l31IFZ8GDmuov4zFjterqRSpRxHnK
	W7+Z6P0sfGAvsDasDGKXED8EVuRDH7QBFhpL4oGVVUlYfRfNLy1pRRxd5DXiMfjhZP4lqzdIaoZ
	VjC2N9ak9MmZQGwZR70qcrSFGjcg14WdJtubl7lBolLPhpB03HCi08iKYlTwtWw6r3+VqHavXgw
	/rjRKUuB+0d+bSsPrZNCIwZYR
X-Google-Smtp-Source: AGHT+IECSU/SDSD+0Cr5TrycnubLdgbitEMB4/KAzano/y2obaZMbKPJEOdIDdWn74RnHNtuJKk8kA==
X-Received: by 2002:a17:903:1b65:b0:246:b1fd:2968 with SMTP id d9443c01a7336-246b1fd2ab8mr81877715ad.9.1756196824113;
        Tue, 26 Aug 2025 01:27:04 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466887fc8dsm89224405ad.122.2025.08.26.01.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 01:27:03 -0700 (PDT)
Date: Tue, 26 Aug 2025 13:57:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
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
Subject: Re: [PATCH v4 0/7] OPP: Add support to find OPP for a set of keys
Message-ID: <20250826082701.tv56zzg2hdavy6lq@vireshk-i7>
References: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
 <aKyS0RGZX4bxbjDj@hu-wasimn-hyd.qualcomm.com>
 <20250826052057.lkfvc5njhape56me@vireshk-i7>
 <20250826053606.zktmwgfdwymizv6k@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826053606.zktmwgfdwymizv6k@vireshk-i7>

On 26-08-25, 11:06, Viresh Kumar wrote:
> Can you help me testing this over your failing branch please ?
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 81fb7dd7f323..5b24255733b5 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -554,10 +554,10 @@ static struct dev_pm_opp *_opp_table_find_key(struct opp_table *opp_table,
>         list_for_each_entry(temp_opp, &opp_table->opp_list, node) {
>                 if (temp_opp->available == available) {
>                         if (compare(&opp, temp_opp, read(temp_opp, index), *key)) {
> -                               *key = read(opp, index);
> -
> -                               /* Increment the reference count of OPP */
> -                               dev_pm_opp_get(opp);
> +                               if (!IS_ERR(opp)) {
> +                                       *key = read(opp, index);
> +                                       dev_pm_opp_get(opp);
> +                               }

There are other issues too, dropping the patch. Thanks.

-- 
viresh

