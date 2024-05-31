Return-Path: <linux-arm-msm+bounces-21247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D08D5F56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACF8C1C21D43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AD818EB1;
	Fri, 31 May 2024 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+OcriC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B8E142E90
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150471; cv=none; b=SiGNd/WBATRm/pJs9tbfdfZKkRkln1/uuNhlgm85TljrG5C+G96ufYGPnPNohmkxWL5IycF91+ctfuxcCTK/ceRSV4TKxI1+UMdFRQINmo8OOuzzBml27R6GbXmLmaFaXoOF/tUq21veOGoh/pGex0XE4iriObW10F+5ehL8zTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150471; c=relaxed/simple;
	bh=iW+2MwxZl0ZdbB/L3OY6W9+ruCMTC/aklGipDUgUjjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQr7TrLVkV3/VOKyeOSZVd+LerOB+tri2MHwFS/bHxfbrQCZwqlV59+4Nb0lUXa+LXf9DHJiL33LEsWfu1Y/lR6pticeI74Jm2RhaVPfqXkAbVN7Zod2jvtptAaq7cHZ+XP8u+wLnIZsxkoGvcjuD/9BN2n4ra+O+dFabpNTECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+OcriC+; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b6ccfdf28so983452e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 03:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717150468; x=1717755268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uVK4/o0nSJ5P4BKbceZnTHVyCGxP2KMHlSbj7pck3w=;
        b=A+OcriC+g3uCc6qkEGF3mwpVPegthPe9jQAt2J1frg2lR3V34L0IIRRC6XlcPM6U3p
         iHmaRszcrm0ERvsYN57R3fSdmyu/MZ2uRSKnekW6GwTrqX1D6TIU2gzeSL4o7zQnhcIT
         CoN36ysgv+zBSHb7zdzKYhe9whHyFtgTRxMs2DmwM2uIbjZlBsXNrEVFOjKNCA8UqmSU
         oNqx/aUVrR97tgyGl485FMI04k+ZoTUeO4xvg5bJIoOtUDED8FKd504+xnx1T212GoG6
         yrHaTTWh9wFOj954MWzovpuAXnobFEIYOmNA9rzUco66CDo7Ey+VlWw3ljY0u1cava81
         u8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717150468; x=1717755268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uVK4/o0nSJ5P4BKbceZnTHVyCGxP2KMHlSbj7pck3w=;
        b=PolXK1Xdz0VECe5prm6yCjGOEyCd8s9j1A6yIX7JAhtzOiFQi60R0QLE7BdSP/yn2R
         CJg4Zp9QmPLdsAOT8ZcqPN3Ir3mn4N7UU/MwNqQQBLDbceb7q+zZAndo7VA45gOMOOUv
         cZxn8img7t9HLAUq+ScME6LsxITOiVyjoOyW+rLkphcOJigeCUkv2dC+yksVMMWIlKHL
         BQotv1V3fxQ7KXzANADrreLh2U49vOB0PajzKG17EFR0Zr88UJHQu3sZvVayHCIPlpha
         2fWpzvMuFzbnXPu+hAXnamIus0NskaqORccZmhICOiNu18uxzQLVPkExDudJwttZzgYP
         s10A==
X-Forwarded-Encrypted: i=1; AJvYcCWg2hkQEMednYfkZpA5zoHU/jj2LCZ0WqrGcKOc1Dxv6fax3IRhcTwWOLHNCciLu6jA0k8QPWcNqpD2ojRr+ux7R+GruwM3vDX8K3okFw==
X-Gm-Message-State: AOJu0YxIOZxj/2x5QJ5punRo4Rd+5MuQhHzXomjJbMARoOmsIktZzyHR
	NQ5BKhVwk88mZm2lVcImhnyp6lvH9yzm1P3nGWGlzxIU7ZKSLzevHEyTnn/aS9mz8BVjkJa7CJY
	s
X-Google-Smtp-Source: AGHT+IE0yAaxrFJoVblzxTX6JlAyNNVlbaz0ZnnFmbAcZMCyW4pV0KfGoc9BHRMXY9m0sjqWYBmwqA==
X-Received: by 2002:ac2:5b51:0:b0:51a:b933:b297 with SMTP id 2adb3069b0e04-52b8955803cmr924180e87.2.1717150467919;
        Fri, 31 May 2024 03:14:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d75c20sm281646e87.166.2024.05.31.03.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:14:27 -0700 (PDT)
Date: Fri, 31 May 2024 13:14:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, quic_jkona@quicinc.com, 
	quic_imrashai@quicinc.com
Subject: Re: [PATCH v3 2/3] clk: qcom: gcc-sc7280: Update force mem core bit
 for UFS ICE clock
Message-ID: <5zsjo3dpeujggxev4rd6v6rwxupltw5hoyeeaqux6hw4yu6uzq@kbhwawpfj4nn>
References: <20240531095142.9688-1-quic_tdas@quicinc.com>
 <20240531095142.9688-3-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531095142.9688-3-quic_tdas@quicinc.com>

On Fri, May 31, 2024 at 03:21:41PM +0530, Taniya Das wrote:
> Update the force mem core bit for UFS ICE clock to force the core on signal
> to remain active during halt state of the clk. When retention bit of the
> clock is set the memories of the subsystem will retain the logic across
> power states.
> 
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sc7280.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

