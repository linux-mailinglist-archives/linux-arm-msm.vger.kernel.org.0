Return-Path: <linux-arm-msm+bounces-33307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689DF9923BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA2DAB20F4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 04:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C95312E1D1;
	Mon,  7 Oct 2024 04:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJLWc1hf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567822AD05
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 04:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728276934; cv=none; b=EtslvG2qTPCtT+neSlaFpO+sQ5EeJrjKt9zIeK2XUc0G2GzkgKxHe//YPhHwaIauNUMiPfxL5KYdigzWoTLKi1nmwJnda6Qv3dcgDbfNfL/vRWZYp9o9bPqPz5Slm9HbayaZH0bfNr3zyVTaPbjnePff0pXM6C6LBdqDroZT46c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728276934; c=relaxed/simple;
	bh=Y2bda3mGfiwGlrzgQPpEpMIie5Ls/ev+55m5OE+yNF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcQmk+z9DwPBweYqiqnYE8xETqrfYeyNz+f4EMOW5v25IMNiVDYO98QHq3qcXd6OI7t2HH3GqAkKlQ3vea66T5THVHjdC3OTtMN+uBuc8Zaa4V/xb9gZ+BqctpQH/IBXshIXDtf3XsjuV/JtCJUvJNo2d7i5ha3rGxiR79ldo0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJLWc1hf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fada911953so47471461fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 21:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728276929; x=1728881729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6xcwrBoXuHmz7DbARIgYbfXwaKZHrTi0jMKEdF4o40=;
        b=VJLWc1hfsmjBxsO0V14wicVv3UxLtIZNwxetwIBLFIZcb4HS5HzzZPFuhd4nqF2OHY
         Ctk/8ERi0/diPo4Br1S5cNbStpEXPfPQyKspW3FRGe86acHAirPwxYz6X8DWeKVePkoi
         OGOm/r2JCFbPW43XeJUC8OP6F7TJ5l1PjBYodpAQGrYNdhUPBO3X+qoygTiUaiTk3l9j
         we1dpRQqb/ZduyeZ87nwfQhmyid2+9ZSvbWq9x/cTRV0TDbZaGuvHkROSmDuw6J0C5eL
         6vwN6eG8IYmBIC6TZUFnOpl3uf69BXqphLhaJ5NW1BKVQvt9v0UuF+HuhHFmN6VofHPr
         Cdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728276929; x=1728881729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6xcwrBoXuHmz7DbARIgYbfXwaKZHrTi0jMKEdF4o40=;
        b=v5sbKoG5XTDFgtLZkh+pf6P7FTkBUiUtNPPAAEUy+bcS9T0++OZFQXui0mkhYIzWGk
         iEaXIoyACLgdh3otI3RA5Az3sEHJtRlQ6wjHOQPleDW6Hnyj9RocZHQXQUojKx65kdLj
         4zT2TeXBPvBTCvOGzRnQ1OrafEK3m7fO80Okv7hfvvqtRKAe52NZuDF0Yot15/eNZphP
         AyP9wF+IBENId1ONqc2dG8IusX24om28tW9LuDV5oXAdcOF3KzSvywbhqOWEExZPSZjJ
         rUhkxORHowxonjmStY89v0mZnHZkWkPNtKLVBYyrchqrhr42+956UA5zipHjGQoXxiQA
         CiKg==
X-Forwarded-Encrypted: i=1; AJvYcCWDVojHUuvgLh6moKuaEa1ADVpP3FAl7PdpDdWobzD6A6WzqykQ2NGqzRU38aJWW2pnuaPHSFiBKBJ9WOD+@vger.kernel.org
X-Gm-Message-State: AOJu0YzRA68+cwow5gxxIdMOsHRvWETXopULyQzbc2wE3F0z4UdtL72F
	d/K1vopjQ0VkaIQfEI2Y1Oi7o9sHsrMo2ySIkoptrkizthDygWlnF6jvzelrBHM=
X-Google-Smtp-Source: AGHT+IGXMAuGqMtBvrWsmOq7ynzzo7ewDWrA4vrd6ryejLcyARqvVHqB/yG3diLj17MPbt7U0IKkfA==
X-Received: by 2002:a05:6512:b90:b0:539:93e8:7ed8 with SMTP id 2adb3069b0e04-539a626a412mr4461045e87.15.1728276929284;
        Sun, 06 Oct 2024 21:55:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d168sm705946e87.142.2024.10.06.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 21:55:28 -0700 (PDT)
Date: Mon, 7 Oct 2024 07:55:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH 2/3]  arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Message-ID: <nxkw7osy3cpd2ts7jeidknd6mgt4wfjaf5pzabzy54aiza5mij@dpbznolilbnf>
References: <20240929112908.99612-1-lujianhua000@gmail.com>
 <20240929112908.99612-2-lujianhua000@gmail.com>
 <p75ivby5ajlmnvebqkn3mq7t5xh6awewjwkwpa5rjiqv2ijijl@aqemqgxveu55>
 <ZwNODSqKNJmkY-l2@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwNODSqKNJmkY-l2@localhost.localdomain>

On Mon, Oct 07, 2024 at 10:57:17AM GMT, Jianhua Lu wrote:
> On Mon, Oct 07, 2024 at 12:02:34AM +0300, Dmitry Baryshkov wrote:
> > On Sun, Sep 29, 2024 at 07:29:07PM GMT, Jianhua Lu wrote:
> > > Add wifi node and this wifi module is connected to pice port.
> > 
> > Could you please add ath11k probe messages to the log? We might need to
> > add an additional node with the calibration variant.
> > 
> Hi, Dmitry. Do you mean that I should add ath11k probe message to the commit message?
> The following is ath11k probe message:
> [   10.285469] ath11k_pci 0000:01:00.0: Adding to iommu group 12
> [   10.285637] ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
> [   10.285699] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [   10.286003] ath11k_pci 0000:01:00.0: MSI vectors: 32
> [   10.286023] ath11k_pci 0000:01:00.0: qca6390 hw2.0
> [   10.652407] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
> [   10.652429] ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> 
> I'm not sure if it's necessary to add calibration variant because wifi
> works normally on this board without adding calibration variant.

Added ath11k ML and corresponding maintainers to cc. Please cc them in
future revisions of this patchset. If you were to send the next
iteration of the series, please include the quoted log into the commit
message.

The board_id 0xff most likely requires calibration variant. Please
consider adding one and submitting board.elf following the process
specified at [1].

[1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

-- 
With best wishes
Dmitry

