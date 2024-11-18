Return-Path: <linux-arm-msm+bounces-38226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983499D110A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E242283112
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 12:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E06E1993B9;
	Mon, 18 Nov 2024 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QowslvRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F506198A33
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731934571; cv=none; b=Hs+orgp+x33qSzliZ36C+iue5LMGTAc620e8HeJySVMwWHekELt5se3/wQ2ilO+iLfF97P7zr6TXv9s8nCmlhZss3eQEF0e/C+/gjz/VwrsNKIB9qc9acAvD/VazmmwiG5zHY1YjLoP2yKY4nowBwyYn3XD4dHNxCNi0OHkPPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731934571; c=relaxed/simple;
	bh=GeWAFYEO669F+1bbu0zR8yfp+pZj13YEcoliIrUfJzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzO5FRcsdqc1iCymLaDPW+ic+YeFjenCk8qZKBB2ZmnhwktpWH96ScPKAVI5qrxKP0XwLxXtQYrsY+NjOK4NEHwfcZO/cdM0DpMT2deNljnczn83t7uIK7bfiLc97DyX5fIi/7vLd0/AGbEGUNeJzCCxsxNWHUO3d1fQo5xrC+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QowslvRV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f1292a9bso4850345e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 04:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731934568; x=1732539368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAqwMGBkTmHKZ4CNoWBz4QXL8qsRGD9BwJ8T1sZ1LU8=;
        b=QowslvRVYHIVzOIctggEZqu/EQzBnqzrAC0R1WBT/Oaa/WRvODHeupezsjz/VlC+mU
         es0NDSZ0n7OLA18On4OMFa7RwqJj8O3wdjhYmKzAgxZAUpumiwFX8SXEsfau2ziiqWc2
         sWI47f3x38ojxkHr39NztTpz6Y1MaS2ewHT1SeLvokVjSuo1VXhFMRzzkaZVeb1BUMnd
         R/nHlcE6ey173ZHpB8gC19dS5gHDUE52cpRcTp66ynMIXNZYHLZBcCO/PhxMxiXRpMZt
         L9AtQq3qRCwJhPnG2NmQBMCWwnJxnFf6BLfpNa9+WqqbDmbpahP/xtoRtJHv+1mZj3mQ
         s7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731934568; x=1732539368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAqwMGBkTmHKZ4CNoWBz4QXL8qsRGD9BwJ8T1sZ1LU8=;
        b=Lu2QzKvEQraoJmV/hOxllah62NYVVpAGVK4gxUef5fwyJ7qRZyhX+lFdtu+h0yqBZI
         4yzW5LbDCFmVDRoUp6/C+GJsyE7RJni5cfdF9XAVlVwrCyTAc5cQO7KpR6Kbgl1YajyE
         fGl8RjOp4zpnAmf47Y7ctPXVARuv5ki63G+M57IbodCamt3xVYcHO8sm5Cc5d5FpqorC
         u4tP8fxK1MVXbzdAFK63vEeyqKblVJl2yg9i3Ksqv5lDr/H9Cd+m5Fz7j1praKhi1mK8
         fXhI3x1V6QJlyE0NYXkXwCtGyO5j389nC0zbtymLlB55rKeFbN1LvYC0CbWAqzD/gu1b
         Hv0g==
X-Forwarded-Encrypted: i=1; AJvYcCUkeRuDIw9OBNzhzpDDA+hw//GPujswTb4lm6dkJ4djvrhyDdORvfkrTOa3VtaKlrTF/5tSP/ZH9NZlXg5B@vger.kernel.org
X-Gm-Message-State: AOJu0YxdzNgqJTTUU0Jau6aU3L6+m2BPBVqPXx4DoorvWwYD8F/uZEiI
	okVwX89lnZddUWza3OyLOAXPHcm3igpxkzrhnew9SicgTTg82jYgVGrPhJPPURU=
X-Google-Smtp-Source: AGHT+IE1rwlqvuyY2O92e5DgZac5q8JPauzE9y+A00EL2MXWGS+FvI+OvGI5kWfZ80rMTLt0Z01AUQ==
X-Received: by 2002:a05:6512:398e:b0:53c:7652:6c7a with SMTP id 2adb3069b0e04-53dab298aedmr3661459e87.8.1731934567633;
        Mon, 18 Nov 2024 04:56:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6548e40sm1594497e87.258.2024.11.18.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 04:56:06 -0800 (PST)
Date: Mon, 18 Nov 2024 14:56:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	andersson@kernel.org, konradybcio@kernel.org, mantas@8devices.com, 
	manivannan.sadhasivam@linaro.org, abel.vesa@linaro.org, quic_kriskura@quicinc.com, 
	quic_rohiagar@quicinc.com, quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add USB controller and phy
 nodes for IPQ5424
Message-ID: <q3twp57aiwvsj2wimvszp7ecr5s4ldacxghzzepmxzcasgy5a4@nnqvq6tgruaa>
References: <20241118052839.382431-1-quic_varada@quicinc.com>
 <20241118052839.382431-7-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118052839.382431-7-quic_varada@quicinc.com>

On Mon, Nov 18, 2024 at 10:58:39AM +0530, Varadarajan Narayanan wrote:
> The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
> can connect to either of USB2.0 or USB3.0 phy and operate in the
> respective mode.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4: Fix regulator names to match with other Qualcomm DT files
> 
> v3: Regulator node names, labels and 'regulator-name' changed per review suggestions
>     Stray newline removed
> 
> v2: Add dm/dp_hs_phy_irq to usb3@8a00000 node
>     Add u1/u2-entry quirks to usb@8a00000 node
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  66 ++++++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 159 ++++++++++++++++++++
>  2 files changed, 225 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

