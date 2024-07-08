Return-Path: <linux-arm-msm+bounces-25463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D912B929E32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 10:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 942A62860BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 08:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E865D376E9;
	Mon,  8 Jul 2024 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwJId07i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F28347F4D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720426900; cv=none; b=cDhp89IIfDZT1QMIx/Zy32b37dGZXZ78sbFZg9oXYlOAQr0ZHTy0ddFMs1ku53kJceHYUYzdfhEIP31PiqFHz1wugLZ9HclHnr2yz3KuKbPacHnBz4fEedP9z98X6fGnvp+1zFSMN/TvS5r5LK1lc7NNv9X4dS7n7+oR6SU1og0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720426900; c=relaxed/simple;
	bh=SCaggQ0CUUfU5h9pyg9OnJko2Oq8BQfNedcLroqplm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6wJpSxsXQPdOmsVe16SS14f9l4hwl8P+NMwAVlAx+LgsHyqtjY5vDJo7uH3t+CNzvOhP69ismdtmlrI8cXMEcuMx2sHy/7YXgJk5zTyWpAze7rQrkk+jqOW17GTUyhLhzPI2J8oKKAd5xksRwWRkfORFmUuMSE9iYtjG/Ngm3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwJId07i; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c96f037145so2615258a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720426899; x=1721031699; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXZPF0EiRaPp+WNMg9Ilg1Dc3D4MRNMVjJ6zf7oezV8=;
        b=LwJId07is7repMCz/6Nqv5DSG+F9Zs1gpFD050MVrOPb+LJ4KSaaiC0KJyTDwxK5he
         xQwQDQx5dKrPVTJFBm+syGMtUw65Sz9wI99W679MdPEJxyqipXRmASeNpXjNxVPadA7A
         ++EOnr9pGocu/MrERLr5Xn3Q38TF5wrH9kkFnE/9ljIjswEJ0MUmpDEEQmhUy8KzER4K
         JMQSpfbsocJQRRhG/NqWKtQz6gloKkOH4Vb0IYmhCFz3hoCS2ByKQhZRx+RM321Cwyli
         gjau7jowZ4EFObNAPHBEUqFXY1DOTa8JdLOVRtM0nENVyBJ2S0KneQ97LgFPH4h0CTSR
         3xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720426899; x=1721031699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXZPF0EiRaPp+WNMg9Ilg1Dc3D4MRNMVjJ6zf7oezV8=;
        b=buTfqDnSNRzL0BAW0N+zSUNVKRYSouVs+z/Iawq/elFicafnswVUgEaf/QG8sR7z9t
         v12UUJV8JPRDJzGz+7GBRBP+/S/xKVunWG2zMLvQ0uiDdtB1gQvGezl4oI1CIJCokwcc
         3DsA/ekrG2qaZ8iyJYmtenFnVJHDhWR1v5l+wsHOBgTQFG1wf9/JJWIYyG4dYm0J/DlF
         WKef9j91dNeHfmM7TOrt9WpbhPiF7m6x5eqFeH7K9UKPIwPEiULNVucKrmUz+LLyt7iy
         1/K14lTwFsqIefFYyCk7Ac+HFVydHKv6U3TiEk1P/aTrU4Ekqft3d3chauO6hZivu5CO
         XnlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA6A5ADAJABWH6f4cJZpOtZJyx/13OJCFDMRGmHYT2Sk6PAGgdC/kDGL/iFSdzmy65H0XxfCQ9JMrYWNlnwFdLtd2pC2lYve/VrfJRBA==
X-Gm-Message-State: AOJu0YwYWiumZdx40NdQyZmwHQ2fbgWE3a8M0mQrjB1aFvHQPZx+KFWh
	Ym6D+iqRqRFzUDTXk24WU7fIF+iA1/gpHGkbn/cHwNFClE39YS56Em50fIY07w==
X-Google-Smtp-Source: AGHT+IGcBvjltU0B4lIyUPDK8bVauTgZWVD/MOH/QQNgWnUAQWyLmkMt85XiGvTLX3HisaET8hsjuQ==
X-Received: by 2002:a17:90b:4f81:b0:2c9:c613:2ea7 with SMTP id 98e67ed59e1d1-2c9c61330ccmr4724127a91.47.1720426897696;
        Mon, 08 Jul 2024 01:21:37 -0700 (PDT)
Received: from thinkpad ([120.56.193.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99aab0787sm7556864a91.55.2024.07.08.01.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 01:21:37 -0700 (PDT)
Date: Mon, 8 Jul 2024 13:51:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Murithi Borona <borona.murithi@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	duke_xinanwen@163.com
Subject: Re: [PROBLEM] bus: mhi: host: pci_generic: SDX24 Channels
Message-ID: <20240708082132.GA5745@thinkpad>
References: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCJQqFdDRz7ZyxoeDd1FLu-yjCCHy=Y1Sq2wMDFFH12G1625Q@mail.gmail.com>

+ Duke Xin (who is adding Quectel modem support these days)

On Sun, Jul 07, 2024 at 08:23:57PM +0300, Murithi Borona wrote:
> Hello,
> 
> Module: Quectel EM120R-GL
> 
> This module does not appear to work fully with the default SDX24 configuration.
> It appears to be another variant of the EM120R-GL (Also FCC-Locked by default).
> 
> Issues:
> - Debug ports are missing (AT)
> - It only works over MBIM/QMI with Qualcomm's RMNET driver.
> - In QMI mode it's really unstable and unpredictable with the QMI port
> freezing up.
> 
> Are there any missing channels in the SDX24 config or is this a hw/vendor issue.
> When using Quectel's drivers (and blacklisting mhi_pci_generic), all
> the ports are available.
> The configuration for other variants of the same module brings up the
> AT port ( with a recurring warning/error).
> 

Most likely this device is a derivative product that needs a different
configuration than EM120R-GL. Could you please share the sub-vendor/device ids?
You can just share the output of 'lspci -vmm' command.

Duke Xin: Are you aware of such derivative product?

- Mani

> >> [ 5074.472791] sequence number glitch prev=1 curr=0
> 
> 
> mhi_qcom_sdx24_info
> ==================
> 
> lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> 
> ports: mhi_hwip0 (net), mhi_swip0 (net), wwan2mbim0 (mbim), wwan2qcdm0
> (ignored), wwan2qmi0 (qmi)
> 
> 
> mhi_quectel_em1xx_info
> ===================
> 
> lspci: 0003:01:00.0 Unassigned class [ff00]: Qualcomm Technologies,
> Inc SDX24 [Snapdragon X24 4G] [17cb:0304]
> 
> ports: wwan0 (net), wwan0at0 (at), wwan0mbim0 (mbim), wwan0qcdm0 (ignored)

-- 
மணிவண்ணன் சதாசிவம்

