Return-Path: <linux-arm-msm+bounces-36346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4585E9B54F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 22:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1AB31F237B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 21:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B8A209F24;
	Tue, 29 Oct 2024 21:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bddh8TeW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C641DAC8E;
	Tue, 29 Oct 2024 21:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236972; cv=none; b=XaZ2dbT76PnTx2V4vSmyuttjk4w+qva/9VcqPsIMEDPrYzvnNOmyeFoGHdntlKQadwpVq6618+OJwdcTM1Mzwzpz+ee4oXplDprLYSw8TvweY+czRnj6u0lPUwyBmKQsbDItfrDH6qmXiLZUNfK/WkOytzKuLCb79B4+vgMUjiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236972; c=relaxed/simple;
	bh=kqiqj5w/Vbl4ym0X5ZAgwX+gC6vFA/z8wsDzbYqbOBw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNf6tkozUQFJFLFkqttFZwv7ixmeb3jPqrs+cUe5cOM1vGeeE0AvDxtl3uWeD+WMAErhpPinNK4rRBUJkx5TK36w3f9FSz5WSQoOioMp19mcmUhp9LrUPqW/hy90jbTObDJ7AufJga83X1OllueP0AdkzIj2bQWkwNUvAETvYmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bddh8TeW; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b15eadee87so432457085a.2;
        Tue, 29 Oct 2024 14:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730236970; x=1730841770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXG3uAnR8xUGDWWZqqgTv3bWvp45oe+e7aGU+Lgvdes=;
        b=bddh8TeWMfkhVssOyjrUs4ikLJyrr8YeFaNDrI110WPacTWEuHiFpBfjG0H46le1Jh
         A1FRn3lpXV1baJ5QGXXJ+SF36MVPh6LSdoeo+3Qv69t/73hzLhbl8of7t/wktl2kK9wE
         U6zhVgxYLQTMsrqoxlg2TrBaOn35mOqh7vzhur744uZxC5GDF49mMoNYF+DiZyWEu/vp
         jm9tSqe1XVDYbl4ErN+3yOPfgDtxzRHxd/6F4kM+hK8WQEZpaq4CVIyEF/5yGpB6Lg8U
         J4GxX8NctGtbaY+SMCu/DlvSP79dK71pb+VeWu5GQIuEZxNA1JT0kB7qQNaHVMA1M6i1
         F+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730236970; x=1730841770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXG3uAnR8xUGDWWZqqgTv3bWvp45oe+e7aGU+Lgvdes=;
        b=HmCpkD+pjy6vc59V7K2327LimWi7WPE6N1GeuKqhKy7YsoouJ5ga+kNWT8BTuuVUqD
         jnkBmxlgHoAgjAcEoQVUT0lASa4BOfNd0QAzrNZO4pQt19tJSz7klhK+r+yyAEVfnF1P
         0Vw2CF5jWzWFH8DhhXtkfkH706NFLHHzNuT2/fEWYqArdGhA+I4Z7c5V/+0UykTzeMur
         GTaxPMNXz+F0LoGOibhlfBCbgIe2rf/AgVsvF5QF6mlDzgFUhYLrpYj5SzjMZ4QN1WtU
         7oJBnOGdQ/PrsSXm7tGCi06zRhrlHXS5l32u7os3o/UstgTfIIWCy3mG7OAhKQUHjLtd
         VpKA==
X-Forwarded-Encrypted: i=1; AJvYcCUFbkF8OwerT3l+goSN++Rbdmj0MpKm+s/CTGI/r68C2jg+so1j4HAfsmvH2/CmxRK0p52nxoxZkkg3@vger.kernel.org, AJvYcCX3c3Vh+NK3QpaauibuBwlLrLXVbW/ObxNnz7uom9rYLDD+1RrN5F6msq1OUFOhlBoqJDXWAKsLSo6hLyW0BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgoWwplyLXUx3WSKcC9RIGkySmX/Apm4Oe4J+6LbyEiOIAPMNh
	MfEEYSRYsVHa7vQqrQ9riEJHpu4TnsPXihQMJCfO6dvUNWDwo9Wb
X-Google-Smtp-Source: AGHT+IGvPaY6eHkYtHcRujijpGZOkw5olQHZ+nTec+dmVsgZDErM8pZ7dmQgEqITB0HkJ64Bv404AQ==
X-Received: by 2002:a05:620a:4621:b0:7b1:49cb:5842 with SMTP id af79cd13be357-7b193eeb9d4mr2054633985a.15.1730236969778;
        Tue, 29 Oct 2024 14:22:49 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::98bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d32b9a2sm454857185a.82.2024.10.29.14.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 14:22:49 -0700 (PDT)
Date: Tue, 29 Oct 2024 17:22:46 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu/arm-smmu-qcom: Add SDM670 SMMU v2
Message-ID: <ZyFSJjO2fkqCwzWm@radian>
References: <20240730013820.41702-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730013820.41702-4-mailingradian@gmail.com>

On Mon, Jul 29, 2024 at 09:38:21PM -0400, Richard Acayan wrote:
> This adds the SMMU v2 for the Snapdragon 670, used for the Adreno GPU.
> 
> Richard Acayan (2):
>   dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
>   iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
>  2 files changed, 2 insertions(+)

Hi, I'm wondering if this is still being considered.

The NAK doesn't really make sense here, as there's a warning/BUG at the
bottom of the qcom SMMU driver that occurs when the compatible isn't
added:

	/*
	 * If you hit this WARN_ON() you are missing an entry in the
	 * qcom_smmu_impl_of_match[] table, and GPU per-process page-
	 * tables will be broken.
	 */
	WARN(of_device_is_compatible(np, "qcom,adreno-smmu"),
	     "Missing qcom_smmu_impl_of_match entry for: %s",
	     dev_name(smmu->dev));

DTS change for context (pending):
https://lore.kernel.org/linux-arm-msm/20240806214452.16406-10-mailingradian@gmail.com

