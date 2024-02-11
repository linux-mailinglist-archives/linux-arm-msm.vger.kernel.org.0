Return-Path: <linux-arm-msm+bounces-10558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C238508AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 11:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 554A6B20EDF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 10:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CF75A0F9;
	Sun, 11 Feb 2024 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="EFG7ifem";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="Be65dXFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932325A0EA;
	Sun, 11 Feb 2024 10:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707648162; cv=pass; b=ZDEa/uCLPKWzSWRHxPdCIwZvzkKSu7FWnTERcw1VYVKUlJF60KqCdbPs36/N5BjYADkf2sXFWXR6HKY5Ih1ICGdcF9wOe6QbcPRMNoGsGrulcvr5yTi/SYooENE5CbyUKQnJRiYHqoYUBuWNXnoFMFZkf83KMX/Ms9j5nwD2w5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707648162; c=relaxed/simple;
	bh=Aow+bMPgcsYV6lYBWt4fQDjz0mXtrZrFqP55lUoOulA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANCj0w7CmrnWuO2mozZKm7FdSLGgsZU9Gjn4aND8R29J/TPoaBYam684TfsJrLjNv3exER0JxXg+O8uvep3SOF4JwnC+npJrPaf3xh9oizYRaTEcPj5AXw8EEwRhMizPVeZvVaoywEdL5LIv3OHZ5OebuHBEd2Gkurdx1+lySNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=EFG7ifem; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=Be65dXFe; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1707647793; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JuiFGOjsu0wZDGu9fesMgV4rgQDEPf8KREeof5sSVk3KGzeO0bL311Y54QjzSXx65N
    EAADxCQ3XUYLfJOEyeIzIbbOk/4M84pT/CumwBPsplmg+Qgc1KfEAy4s4rYb1OofDnES
    h+FSPAxRkzbB5z6O2f7YjRXWdhO4MaxgAhoBiVmIOFBAdztVqdUN8iVhfYgNel+9aw9E
    +MPOY76Z2nCfeidK7OtJOLES7Rr51K0aq4utNbDlKdLNwAmLcZZQ4NDr0nkGtNSai30U
    TvZVrKszQk3ZbV+xOzUFLWq81gYRNPnxiq70U9dwKEJMkpFJ1XUNBbFGyGUj344djLXZ
    6iEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1707647793;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=q2f3LZgzQJXMe1Tijial+M7v6Ms5A+7r4K4NtKlVbys=;
    b=iEKNNNc/cxYuODR6W9RIG32/ASRbjF76JtT6KNdHopZB+fATCVkhUiEnSmUMQFcBbN
    OO5vDRo3CuaQ0un/xF3s+A6fUyrPT1S0nlCAbMorxOl5adJBv9KVPllU0pKsAtgKbePE
    TpbgVuMPvbeLRfjYWAZonKCxlSvm6Q/MlqPo6x252cEsjB1Qn8ytlruZlBFRsM9VVFtu
    K/xh3CPKh/XRSYdgQ9iQkpT5ZhX9v8tf7+xQZLE38D5AMPgwrlB8YmuP/ncVo2UeqFe5
    X2NK+kwTebZCW/EF9rZ1AMUBOR3dZlV5hmIOXf/Zrd7uJIzBq3/1SL69t/2avTc2dUjl
    e8OA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1707647793;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=q2f3LZgzQJXMe1Tijial+M7v6Ms5A+7r4K4NtKlVbys=;
    b=EFG7ifemRoqC2v/43keSCGGmM15Qn3X2ZIwyTNuNJ3h0enDoWVmqf/W+EwmaislaNh
    Q/DU9I1l91Us58/l/SozATl4ZxnGm7khxbYyV40G4VizJUhRqetv74yrdMY0bxxcBWj3
    v9S5IwW0UX0zADskgNTpCuaNkuRJY3ITTXOOlXU40aNxWDHt+Fl1WreGXTJggaxenrRz
    15F6CP2S369FAfHzzZ1tA0Eg46/ZuBNNnKD2GvIy9VZqbsd7Vqq/J/MDgrQ4296DXOZN
    J4DPCNbNDpcP7o61FSn+P9+HOiDBv4WduKqi8C0jaxJN+Bzr9wWaGbnJ+GeiVJLWj0bO
    tBLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1707647793;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=q2f3LZgzQJXMe1Tijial+M7v6Ms5A+7r4K4NtKlVbys=;
    b=Be65dXFej5YtVTCJ60WNiXtApYFED5iu9NEf40n9delluouWz1BTkC41gKvirAKwPg
    iWonG+YFcis9dsX+bvAg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8Z/h"
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.11.2 DYNA|AUTH)
    with ESMTPSA id ze34f101BAaXwwD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 11 Feb 2024 11:36:33 +0100 (CET)
Date: Sun, 11 Feb 2024 11:36:26 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: drop the superfluous device
 compatibility schema
Message-ID: <ZcijFk9GcgtVoXoV@gerhold.net>
References: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>
Content-Transfer-Encoding: 7bit

On Sun, Feb 04, 2024 at 06:56:35PM +0200, Dmitry Baryshkov wrote:
> The idea impressed in the commit b32e592d3c28 ("devicetree: bindings:
> Document qcom board compatible format") never got actually adopted. As
> can be seen from the existing board DT files, no device actually used
> the PMIC / foundry / version parts of the compatible string. Drop this
> compatibility string description to avoid possible confusion and keep
> just the generic terms and the SoC list.
> 
> Fixes: b32e592d3c28 ("devicetree: bindings: Document qcom board compatible format")

FWIW: It's not correct that no device uses the version parts of the
compatible string. There are actually two boards documented in qcom.yaml
that follow this scheme:

  compatible = "qcom,msm8916-mtp", "qcom,msm8916-mtp/1", "qcom,msm8916";
  compatible = "longcheer,l8150", "qcom,msm8916-v1-qrd/9-v1", "qcom,msm8916";

I don't think anyone is actively relying on those, though. I guess we
can just ignore them or even remove them.

Thanks,
Stephan

