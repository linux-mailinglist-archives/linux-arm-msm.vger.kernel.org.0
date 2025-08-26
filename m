Return-Path: <linux-arm-msm+bounces-70798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD4FB3533E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 07:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBA8F1B27FBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 05:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BC02EAB7E;
	Tue, 26 Aug 2025 05:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFrwg4aT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B1C2EA72A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756185662; cv=none; b=PzILDLcb3RioGkV2TGv4KO8BCMdZvMinq9xJe7qfRPBBS6OwtDhkkgV8BosijQ7m/24dFROutBtsas/2BLLbEo33nyJNz8fmps7vfrbaIZ0H9zs9T/0qJH4VbuaMV6pJhnjmZf0X5t6SiIoKcrUB5yATinzHStao9wF1uMfjaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756185662; c=relaxed/simple;
	bh=aIPBcehRTHMhS7LOo60VzOIm/87AhQ2tPcpYJepNTtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZF7ebi7ptWRmgZDngs58oQrXwG04aIOkeOmC+nLTX8lTXWQirS12KXBg37tgsYT420rga0aMkH5jRsEuEl6Oq0jH27jxiDRBi9rESqdGACNyuXyhnA6OSmAtpf8FO3qwbrUHUhh+nKBsm/hRHG2rYJvFbK742m0WyGVvYEGc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFrwg4aT; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b482fd89b0eso4206564a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756185660; x=1756790460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQkGqssK21pQr0XMzzCAObXVWJZEVAYglXp51ZgH4lk=;
        b=xFrwg4aTcXQXaEzsr4tHJrjJ+j91Pi77+H/C1zcA/SIthiaWoj85wZEVqgDMbwHgmJ
         IppXzB4DBR1JbQmww+nNvvIWEDvBrIUTQAW3Wj9u6mAa8f7omodTPmOGQXLx16ZgiGht
         /PxJj6mqrT8TQRQBmeMnIH/id7IMrBiKFuvV4LS9Ps0GvPt5mGWWWXXIyJRoMtDrcP6M
         dKSvQ3c+1Vj4qNJBze0VMAZVZBL01Hf0UjfK6E97XTAtVk7YVq/a4dJL3NptTA+zQcuK
         payJpvAB4Z3MKLaAKnxlUqcqLrAB1kk+FDuAFC3VjGft/wO1IvTe9SLzUyyUaA3IyhM8
         JHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756185660; x=1756790460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQkGqssK21pQr0XMzzCAObXVWJZEVAYglXp51ZgH4lk=;
        b=bdx+IvOiOln2TCTHVtdDrxKmBidANkX5+OUdKBiCS/Ye9NWOrRtgDvgigLMaPpBkjc
         oQYhdauSwr9JJtRiXuewW240UAFwespuoLvdB7F7d4mDKLG2Gq85QbmIJ/HSLlvzbGLn
         2GT+OztnrmxAx5iphvzzdvBYGtwabOWSKlgO1goNfB6253jO1nOr0LylQD3qcfkzo3k2
         LJF9hgiZho2MMYMnK6trJAH2/kRzyiOC3KgUtwXmd8iCmny5XL4EZkNIe6KpxoJ+n7hR
         Esr/b16csJPqtfZcQuQHq9v7/oUt8D64eB/A8ETDYkjwingeM+Xs28SWbVihrAI2+F3T
         BGfA==
X-Forwarded-Encrypted: i=1; AJvYcCWyesooJExfG7Zaqzc2Ul6+k8FeTKH80xANS6mJgzOfxdWN+k4G2VmlXBpSSL5tRiG7v1UCmc6J/vjGDuJJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkk6lftTtzH4nH2L/+iMj8iY0KKIpz/cDPB7W5qtfp/DCOIKa
	PJRyAPKTs7GwA8nmZJBaehQQwhX4XZgNLjB4tF4bNt+9CpotqOgEhOF0oU72KwYQXA8=
X-Gm-Gg: ASbGnctAYRZ65cmGZISwkiq5yApPCuv7GGnIVasjthVtaseQHeInmeG0AIjebhlQTni
	vCxhN/1eXGAM1fqVYqDDBlqgcIqDxnI73oi4zUZ3QWyPrtixZzCcvSBEqPOBmwYmrhLd94uDUvm
	OvVusHdHBBMVjhTac+1jP50NOAJ0//yIUwgoeHMmN260Pi7CpkgJPLqC6CAw73vKIJ6gLxLnSCf
	loDaKKuqe/tNhZGnIOBF82mTl8SYa0D+Me4OnzFdBDNyNmnQ28I9O+H6iWT/jUEYZRB16ZOXbjC
	5X/Z3B9Zf102l3WrZCpqGg/+9pNhXB1EgPl7rwh14K7eNMuiH0J5g8izD0xt6T+mFGYHKsFrFrU
	pvQRNlPfLL5D6IiHp0ajgw9F4
X-Google-Smtp-Source: AGHT+IHe5l009rsfaROaNNzxh1bua4+CVjBZVITdGInBHZIhPXAoVt/QHjtqxorzaIQf91LXagZQuQ==
X-Received: by 2002:a17:903:41cc:b0:246:b351:36a3 with SMTP id d9443c01a7336-246b3513841mr85148925ad.48.1756185660468;
        Mon, 25 Aug 2025 22:21:00 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779feesm84022375ad.34.2025.08.25.22.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 22:20:59 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:50:57 +0530
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
Message-ID: <20250826052057.lkfvc5njhape56me@vireshk-i7>
References: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
 <aKyS0RGZX4bxbjDj@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKyS0RGZX4bxbjDj@hu-wasimn-hyd.qualcomm.com>

On 25-08-25, 22:14, Wasim Nazir wrote:
> Patch 2/7 is applied in linux-next (20250825) as commit
> b5323835f050 (OPP: Reorganize _opp_table_find_key()) which is causing
> regression on my board (lemans-evk (arm64)).
> Reverting the change is resolving the issue.
> 
> Kernel log:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000016
> ...
> Call trace:
>  _read_bw+0x0/0x10 (P)
>  _find_key+0xb8/0x194
>  dev_pm_opp_find_bw_floor+0x54/0x8c
>  bwmon_intr_thread+0x84/0x284 [icc_bwmon]
>  irq_thread_fn+0x2c/0xa8
>  irq_thread+0x174/0x334
>  kthread+0x134/0x208
>  ret_from_fork+0x10/0x20

Hmm, this happened because it is possible for the `opp` to be invalid
(error) even if `_compare_floor()` returned true, if the target key is
lower than the lowest freq of the table.

Dropped the patch for now anyway.

-- 
viresh

