Return-Path: <linux-arm-msm+bounces-37968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBC89CDA20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 09:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 706F31F21B14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 08:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB4D18BBAC;
	Fri, 15 Nov 2024 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cF0jnKno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B791B18B482
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731657604; cv=none; b=oSyS8d7+aV52mtT/rJ/+QHQWVq1+BkTfDSrYY5zM58se2zyUzFsllBo8XmCr/48Tik80BhdBSq8wItlfR6pMPchr8P+P4fL18HQQRDIQqzYMvipNcfLQqzxPNa/F+d2ALewvlIajFVtgOrzPLNaqiCLN3+hy2Qb2A2X08+n1wkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731657604; c=relaxed/simple;
	bh=WM2XcKMTRtzMASGzJonfdgJeUtxp6hnEUEwU0sO1g7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JE8OSzSZx7aXGs9NRbWqJPdQD49+JdTGWdjQ17SGfVh+Si8pDiBnMDggnEVIi/ubCRDGq2FW9hR3M/ZUyY9tLN5XURZ6wiD8hYiottuKu1+o0EOoAgp1jv7GyYE8Y4v1E36qo99rg/DF5ZBcsrr3m5GpfSyvOjNj1pnMRwAPhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cF0jnKno; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53da24e9673so1514625e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 00:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731657601; x=1732262401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FbaNobGvB+49vSNUrxvHE3klAkCYrfuy1GrMPT8td8A=;
        b=cF0jnKnosXcTjHAYw43OXEcnb+h8iHRIE9OBwtRd+eORSd3f/O3tVeFZ6Nrl7jj1UY
         2lnryslGl39I9DSH8JEw2BiZe0ms8E+XbmGRYPD/1VfP3y/bMEOKQUxIb+KJHTehLOem
         Pry8eAL5Mg+qFGpjUbvJ7t3KmS/N+rzmAkIYgRyPEVpyRwVP0fLfAilGETqvX5P4Od4Z
         EqGbPSMWyhF/SnewPE6raTzn+CAch4WgWn9p+ER6x8bVav2edOcm0YnDxNLAWC3gBQoa
         BfJ2UiR11eIELSFn4CYqmhTxM6Av7b8SA4LTXovelRWts3bAvqLq5qARyTjAlCWih/V6
         PfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731657601; x=1732262401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbaNobGvB+49vSNUrxvHE3klAkCYrfuy1GrMPT8td8A=;
        b=jFX7ZY0aSosDr0MHCUIOKDVssRNjk8gxi0nCN6xxihwJ3b/U4YjL5TmYyhuQ+OPOIR
         hjiJ2L9/3RYVVT/K0dPXNrfROLXWQv+ftZ2RQSyN9CA+PQCObvnkd/1P+VfrDyGXwdHW
         fOJNECPd0C3bgUz/ty/kNkXDunfZPuKvBFPusFi/ikPgwzKbvXfjMpiP/dmwZAPIXn6q
         veH6shhVt4zlT42FCPbl98y39gIY7F/b1piHAlle6+sFESBy1U5/SCkHPjXrHEOFg3TO
         2nK3S3WG1AmAIaVmdpwXCT3fFiQq3Suqs6c2x+AT4j2XRZNAGBllsxWaDRtipY/igw1U
         h12w==
X-Gm-Message-State: AOJu0YxZYcmeYd0Oj0Myh1osO7hGQeY5Hh/eI6ullaCFQeIKRy7bnIuk
	beoyzFV5ZQud8iz16Yt0IH0MHjvV1tDOmybiHVBttELpY1Eo7n84u//6a1u+kk8=
X-Google-Smtp-Source: AGHT+IGKG+BVnDzL8MVS07U1zfzbfPB2Rj7jbqs6XD3kf5aVHBo3BGUS6sMZvAC8j5ja8q9iG+4uxQ==
X-Received: by 2002:a2e:be93:0:b0:2fb:5ac6:90f0 with SMTP id 38308e7fff4ca-2ff609a8cbbmr10031331fa.34.1731657600826;
        Fri, 15 Nov 2024 00:00:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff59890551sm4649721fa.112.2024.11.14.23.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:59:59 -0800 (PST)
Date: Fri, 15 Nov 2024 09:59:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naman Jain <quic_namajain@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 0/2] nvmem: qfprom: add Qualcomm SAR2130P support
Message-ID: <5lucyuowwaz7k5x2grlifuc7xxxppant3ysofy52xsrxdsx4zf@2tj43gglshcf>
References: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-sar2130p-nvmem-v2-0-743c1271bf2d@linaro.org>

On Sun, Oct 27, 2024 at 01:42:32AM +0300, Dmitry Baryshkov wrote:
> Pick up a fix from msm-5.x kernels and add compatible for the Qualcomm
> SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Picked up required patch from QCLinux.
> - Link to v1: https://lore.kernel.org/r/20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org

These two patches have been sent two weeks ago, but got no response from
the maintainers. Is there any reason for that? Srinivas, is the
subsystem being maintained or should we change it to 'S: Odd Fixes'?

-- 
With best wishes
Dmitry

