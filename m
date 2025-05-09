Return-Path: <linux-arm-msm+bounces-57359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3BAB0AE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 08:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B9F04A4072
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 06:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EB826F44C;
	Fri,  9 May 2025 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLhl8vlt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26078221D92
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773472; cv=none; b=dqp5X2D5Z9ry+xeVoY6Pj+N2ZRk1++62QgLEJcQkMEgNt3f4YFLx5jNa9PjfiLvaqCFxR+5C7Id31PXhoVl8yQ2B9ddVfAsb6vNSAS22hvUIeZQViaSGwY9Eh7YhJ870nUyN0H5BuTRC28JIoVrii7HEYgcFLUS5limeHFzyUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773472; c=relaxed/simple;
	bh=wiDZ4xkPtV9BOe7ADj1LbvuGPB4FiUezAyGN2IFKEzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffllgBZmWHzacPVscGW5bJFQ+zQ4SkpRxi6T9Jy89i9UlRciQeo8T8TI3ATtwk1fjbEmcxJkWWduAegndfoIhVrdbgDHvyqYs+vG0WIkYYDYRXaMEC/AAydT3uGXMCNgIDAwdnbz51AYlsL9n/W4Wk22B/KGXGrudG5zmcEdAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZLhl8vlt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso22604f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 23:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773468; x=1747378268; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=ZLhl8vltiQyAai1i+3Sn+H0oJQzhx2abSENViGQGEi/dQOBeBEIWkVmHyDe56CHdLt
         xDKK0g6GDHValO90OKLmhKsHxBC+IQkjHp1xhb8B67gRrfG//1E2UEPij8Lfzkl+ZSmd
         Ctx4cYNfzv3iaukeZn0YbhpJtLdreKmT2xXwozoLqNnEtS8QL108OPMuH7c+UGaXBK85
         qeEOFyq2mdQMZEZ4Mv6ZefuHOZtS9d0XdK9YsL9cpJjjxqloitR4iVeGiSavGywOx2TP
         DqwfefGijEOyPKlA/cjFEaNRW6SAkoeMHd5uup1+sfQ5BP6Av/+V7me1cfS0RnJ+i3nr
         2tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773468; x=1747378268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=IrtAdqtCdmaHXfq9A+nm3xoTK+JuFkIZAZGrzUzPPrw/7fpmzEpogqp6rigASSN5WC
         tqfxOxJN/BIcm61Yu/oxMO2j2SiynC260Fk8kusSJz4MoFdnySW01gqrJk92A924tpvI
         rQdTXP1C8oEckbcltOOEMbQmVQo0fwykqt32UwEvKaP3NZkWi/QLX0VbYKoygrvj5EyU
         e9GjJZYPu8UV/CMY3CSHh/3kGSklPeMxmRzWdfsE3WW9NTEiWc9XIaiBX8Fn16e0F10f
         14iZATq6NIC5bMTJyyFcrqjqZf1WsX+sZ2uADE1CJjKuwUKHEDIgFeHsoZwvBi1NraQ6
         7d3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+Lb4wO9MyRChYcPLLP7/MY4VXf6TGvMAiVXyv8l9bGncLiG6gFRzbnpzrAMhhPzJbySFA4zfKBHGaMjsH@vger.kernel.org
X-Gm-Message-State: AOJu0YzdEQ2C9p1p/nE8C0t6GZnfMakQn1fBq2DjNBYwkrhtQd+yGl79
	JYX68xPU8rb1Ta70LA31+PTnynH26SWGlY9gUwsI7HgjatiY6W44ZJEPGDruXg==
X-Gm-Gg: ASbGncs/5bRtT9b6+gE++pA/p7dA+3Rr1j4TOsZua5oziWVKUnW1L97ckweFWZvZP9D
	+MoXH3sBDMgIaWZI3Ed4Yo+kkqV5IGiUF6xPtTwlOj4u6PUzcQfLs8cXRL0d0BGTDQ6O32WvPd4
	RHuLT7F1LvXNLstsVUKZikCIu0QWcvwG+FpWFhmr2jTxFkM3sUUr69BwXSRqzlxRzY0fxg/caCl
	1aCXPpmliDN1c0bGpSPCgj8wJIvsTcmNQwJLX0PStfrQ46Zh8vySYwqgukntC9yeF/evSjZjS+M
	EgY6fKwftp7U+abR5New4TAGpjFKjh5kURCsGvGZGHkwy9EiZKsG9kh5ZJoqFJugU2sXuOP/pV/
	BeUXSviLisABWSshwxWDJv2U=
X-Google-Smtp-Source: AGHT+IEBZ+xyU+mtZq/TJ5fu+6WMLt3/ZEPH5kI6vP9q6SNWA2Tnohwr4qj0xsEIdaPCJ/e8n6vxRA==
X-Received: by 2002:a05:6000:178e:b0:391:4889:5045 with SMTP id ffacd0b85a97d-3a1f649be24mr1423812f8f.36.1746773468403;
        Thu, 08 May 2025 23:51:08 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm2214791f8f.89.2025.05.08.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:51:07 -0700 (PDT)
Date: Fri, 9 May 2025 12:21:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ethan Zhao <etzhao1900@gmail.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
Message-ID: <34nnkgbfkccvxiksjb5qaojppcvnkq4l7rchllsppy7cl4fics@4mwtb3rhko5n>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
 <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>

On Fri, May 09, 2025 at 02:11:00PM +0800, Ethan Zhao wrote:
> 
> 
> On 5/8/2025 3:10 PM, Manivannan Sadhasivam wrote:
> > A PCI device is just another peripheral in a system. So failure to
> > recover it, must not result in a kernel panic. So remove the TODO which
> > is quite misleading.
> > 
> Could you explain what the result would be if A PCI device failed to
> recovery from FATAL/NON_FATAL aer error or DPC event ? what else
> better choice we have as next step ? or just saying "failed" then
> go ahead ?
> 

If the recovery is not possible (with device,bus,host reset), then there is
nothing could be done.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

