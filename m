Return-Path: <linux-arm-msm+bounces-35790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFA9AF971
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC031F23373
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8773F1BF2B;
	Fri, 25 Oct 2024 06:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrp8aMSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2009F193072
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836070; cv=none; b=QKi68P4ZjJjT0F2hprrwjHvFFBXg+V3qRTUpe/Jd+1AwEMOQn4wMTKqFvQkdPim1jW+jIz5kn9orqAHALbJ/I4pvtvASdeM1KztMV4twl8wGsRaaitRvF+aYmmjvurfWDDckDYo8Mw2BIbt/9H0wUAedKhGMOMg+izjvgvZg/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836070; c=relaxed/simple;
	bh=omnBjWQwRF01YZ6k+b7scYVbF9/6UmTExb9NoEKObQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCRw/WJJqrVLcJ8GdIXldSOSZJEzBZKJsbefPUYl61i1qGnFcsEAUC0iMoB4oBWAmpfHDyxz+pVaGM2HOCnvSUKvAZ2aR1tP+p+g6/6Qr7AT2KKscwYB1lY507M6lDqliYGjW0XohxlisCZYxT8HPrUTLSoi4dJfZPfOzNhQP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrp8aMSM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f58c68c5so3058775e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729836066; x=1730440866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjbBsCeAyf+Le8MeXbzRgLV61MN2s8vLHiDSyQGZHGc=;
        b=wrp8aMSM8Qm3wfK0NW4K8nDONF1O5k1/NZqT1Pg3S+VRi70QskllLt/V7RtRcsbCt+
         c9gHkoACkhsYr4c3JhVqT0Qj4WNBSJz0gpMz6FzV1B8TlgpVj1IBaf338KZzRvg05y9+
         6yoavrNoTSO+dGkByj27EOrOaXY85H0d8MmN+owidou26iOwoPrnKlD54NCq7z8a1F46
         T+L/WPUlC4BpTBGuM5aHwFZjb7k2Q7BkKpjmCTpMvx052I/LBmeGbfC22fcxDd8DO8Ea
         5iibFOvBZg2PBLM8ydKOy3Km9o7hrKMXgDlFnM50xzRT0pXOe2s3xBrM4ww3tlAewn1Z
         vNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729836066; x=1730440866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjbBsCeAyf+Le8MeXbzRgLV61MN2s8vLHiDSyQGZHGc=;
        b=euvb/2XPohoGfGH9ittKXcTOPc5bbFZnneMHXhwnH+ou01AfqTmuiGKtdJNT9i7nq8
         PLXf9iAzJEdhDwUtdTSBQsIxX4D63SALwxZRmjNgC6WwH2uqRhb65bxdLdyHwqWW1wYc
         B97EUJHcQHINJofkZVs5E4Ygh8ChbbcPfQbCYybY7EYXTH9aXj4sUhXmxrtbAlyOaaye
         pckAe6U9XPz5RS00FvP8HyKm/NB9SqlHGFH6/R93o/BQ/VTie/EZSpAoqto4vBIHuCDi
         3Xk4pbQa6ZgCVKr9BXugPNYDnhWDlJEFrER8TNLitCDRpxsP6VIFgyEnBJ8W+04+jgLK
         nk0A==
X-Forwarded-Encrypted: i=1; AJvYcCX1Z1PQelAfeNizXy46BUTZL/JZE+pbUWp6B2sE67DBJFZNhYStVaGIcwbjuCd13B2oaiglGU9omu2MPstC@vger.kernel.org
X-Gm-Message-State: AOJu0YzZvw7y5CuLio1RX3OGNbsnjC1yTGrHLE6TGy4VVwlhg1aSWc4x
	UlX4k5TuDYS8WY3KL8MFQ+fibYnu5kPw6Y+FPx6VoKCIuWfRrrGfC26a2F0URrC0fEnhPhl9r/S
	D
X-Google-Smtp-Source: AGHT+IGW0DGFqF4GXZuZDbx8GIO1iTPAdVwiNcEj3OF5vaunDtCPGMMbC7oqaGNUsFQF9eF0TfXlpQ==
X-Received: by 2002:a05:6512:1282:b0:533:4785:82ab with SMTP id 2adb3069b0e04-53b1a315e50mr8487448e87.1.1729836065876;
        Thu, 24 Oct 2024 23:01:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1df2dcsm63515e87.243.2024.10.24.23.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:01:04 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:01:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
Message-ID: <ig3m3sgmnkgfmwrlglundhqif6rygzl7uh7rzoemrz3yxgvfpc@35a323mw2wbt>
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
 <20241024002514.92290-3-quic_miaoqing@quicinc.com>
 <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
 <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com>

On Fri, Oct 25, 2024 at 10:56:02AM +0800, Miaoqing Pan wrote:
> 
> 
> On 10/25/2024 3:39 AM, Dmitry Baryshkov wrote:
> > On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
> > > QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
> > > IPA, thermal, RAM size and etc, so new firmware files used. This change
> > > allows board DT files to override the subdir of the firmware directory
> > > used to lookup the amss.bin and m3.bin.
> > 
> > I have slight concerns regarding the _board_ DT files overriding the
> > subdir. This opens a can of worms, allowing per-board firmware sets,
> > which (as far as I understand) is far from being what driver maintainers
> > would like to see. This was required for ath10k-snoc devices, since
> > firmware for those platforms is signed by the vendor keys and it is
> > limited to a particular SoC or SoC family. For ath11k-pci there is no
> > such limitation.
> > 
> > Would it be possible to use PCI subvendor / subdev to identify affected
> > cards? PCI Revision? Any other way to identify the device?  Please
> > provide lspci -nnvv for the affected device kind. Is there a way to
> > identify the RF part somehow?
> 
> It's rather difficult, for WCN685x, there are multiple evolved subseries for
> customized products. e.g.
> 
> QCA6698AQ/hw2.1
> QCA2066/hw2.1
> WCN6855/hw2.0/hw2.1
> WCN6856/hw2.1
> 
> They have the same PCIe ID (17cb:1103), the commit 5dc9d1a55e95 ("wifi:
> ath11k: add support for QCA2066") reads TCSR_SOC_HW_SUB_VER to enumerate all
> QCA2066 cards, it lacks of flexibility, as the list will become longer and
> longer. But it's the only choice for QCA2066, as it's customized for X86
> platform which without DT files.

I guess, this is closer to Kalle's expectations: being able to detect
the hardware instead of adding DT properties.

> So for MSM those have DT file platforms, like SA8775P-RIDE/QCS8300-RIDE both
> attached to QCA6698AQ, we can specify the correct firmware to
> 'ath11k/WCN6855/hw2.1/qca6698aq', so it's not per-board firmware, it depends
> on the type of the products(x86 windows, IoT products or AUTO).

No-no-no and no. The firmware used must not be specific to the product
type.  This is what everybody here is trying to avoid. Please try
following the QCA2066 approach instead. And note that it could use new
TLD as it perfectly shows itself as a different hardware kind.

> 0000:01:00.0 Network controller [0280]: Qualcomm QCNFA765 Wireless Network
> Adapter [17cb:1103] (rev 01)
> 	Subsystem: Qualcomm QCNFA765 Wireless Network Adapter [17cb:0108]
> 	Device tree node: /sys/firmware/devicetree/base/pci@1c00000/pcie@0/wifi@0
> 
> 
> > 
> > Could you possibly clarify, how this situation is handled in Windows
> > world?
> 
> X86 platforms use standard m.2 PCIe card, and it will only use the default
> main firmware files, as they without DT files.

So QCA6698AQ cannot appear on an M.2 PCIe card?

> 
> > 
> > > 
> > > For example:
> > > 
> > > - ath11k/WCN6855/hw2.1/amss.bin,
> > >    ath11k/WCN6855/hw2.1/m3.bin: main firmware files, used by default
> > > 
> > > - ath11k/WCN6855/hw2.1/qca6698aq/amss.bin,
> > >    ath11k/WCN6855/hw2.1/qca6698aq/m3.bin
> > 

-- 
With best wishes
Dmitry

