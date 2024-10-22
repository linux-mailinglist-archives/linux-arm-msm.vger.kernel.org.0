Return-Path: <linux-arm-msm+bounces-35390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 687489A9F82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3407B20F7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D399185E53;
	Tue, 22 Oct 2024 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfLthD2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33724161302
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729591412; cv=none; b=ZdRcFzEQ2XrKJ3nLyXkQBK3waSPoft9kK0GZQydPtLl38mEOEB29V16N6DjcXAPFieBS8av6UlqeTk0be/lOEmJF+oCb/76uzpkIjbLzPh95/gFW+C1kgSidJag8ChO9scfgiLt8xGcrLYx3g0LmFnTWRvgdr3c/G62Ozk1smW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729591412; c=relaxed/simple;
	bh=IGILfBDE0CezQVcLjxVcRJDLFwM0+yfsxlRm5nnZnzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9w2fwSJNDLoWX17FD1JRmES87dbVM2tWTUubDZedzKI/N+QOhX9MLWWLoG2Xb5FEs6ANkMosyJtuz6ZYd8RCfvTGnBsWBgDb++oS3jZjcbVQCnrrQmlGyYqQk3P2VGaUuCxPVEpswUBTxPdeMTmUf7YBzwnpKQScP+ixg6lW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfLthD2z; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539eb97f26aso6182609e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 03:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729591409; x=1730196209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GI4/LkGxcsUK9/hDOFEhANPseX87tbNMgbhU6aHNzkA=;
        b=LfLthD2zh+64GGsTwGC/9A505b3xzcG5x106VhyKRNXBakJYbx2dyE8qGtCOngpiwg
         PZ8ymKdPUjoXIbjmlzFJy4vlxY/Cpon0maLVVSzLm4dXviYL3BK/Bx2P22QcO2RHW9EP
         fxfqJeDytsqYCYPmScm7Ti+IzlVZbpKXVLixkjRVTbCVktie0+PtCR1UBhw8IFwkggsn
         mte13wng9Kf6n6zaF1WTunDg1F7bKHGTSVM9r1+fYWOXYrZCn9P/D055/yDe8zmp29Jv
         UIY/EtUx4d0Tyl87s6WwF/e5EMUcb7RT8vuMQo1zwx7lKOCOwUIjfdyRJf0DKGqYCVvp
         msIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729591409; x=1730196209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI4/LkGxcsUK9/hDOFEhANPseX87tbNMgbhU6aHNzkA=;
        b=txnsuM9qEa0r9TCcwcQfglRD7pvcj9S+k57+LxlstuUf4lZ88tMe5WlNdT6JCu64Ug
         PsJyEPdlxHO17r05TyU0VAH7TcJvXg3HsgNCWhqNehZBjiUK+U+88w/z+iTqUBK4aN/y
         jVDWD6V6E4avxsPM/zt9iWppDDfzMm8Hu16WXhwg8yecFDQ0qC6c0AkwNAacwc4oiZ1m
         5oyIGtABKvfEV0f4SBki1+/h5CO19GXWbmLEBUk1Z8ZoY2OvKLH5sV+VW5h5TnRZ5X1Y
         fnlRUA6Vg8byIAkl+Hf1AhvLIm9maU1PS56zTRkPP4GR5SGVCbFeoYeNT32Tjp471SK/
         yawg==
X-Forwarded-Encrypted: i=1; AJvYcCXV5Mq1xDq3Ou5kNQB4SikkisSRfua/0JNxYIh38OvOx8DzoxuXdzBWiPS8qKCn99eomc2o4UAKIASrwD8o@vger.kernel.org
X-Gm-Message-State: AOJu0YycBg/m7wWXdk4Lxm6FPlUmcJvpNmz3KNovmK/+F0UyupiWfohT
	XrU0CKF8FoMx8Z0j2rbSD8UqRX2NgyDXBfsKEIUT3BrqK4ZAjFZdLwiuHE7uOyA=
X-Google-Smtp-Source: AGHT+IFz3rZOvoE9ylpsIjgCKYyYmWJxRMIY7UD0EDD55zi55LEeWZR7eNB+ipF5qamEN5rH4o2eMg==
X-Received: by 2002:a05:6512:308a:b0:539:f8cb:f5e3 with SMTP id 2adb3069b0e04-53b12c36b16mr1626839e87.48.1729591409337;
        Tue, 22 Oct 2024 03:03:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e58aesm720962e87.28.2024.10.22.03.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:03:28 -0700 (PDT)
Date: Tue, 22 Oct 2024 13:03:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable sa8775p clock controllers
Message-ID: <glhmky5r3rd44hmnxgtgeelqp426fdsh7w2fqpuusz2ek6eauw@sfptftzsilix>
References: <20241022-defconfig_sa8775p_clock_controllers-v1-1-cb399b0342c8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-defconfig_sa8775p_clock_controllers-v1-1-cb399b0342c8@quicinc.com>

On Tue, Oct 22, 2024 at 01:36:38PM +0530, Taniya Das wrote:
> Enable the SA8775P video, camera and display clock controllers to enable
> the video, camera and display functionalities on Qualcomm QCS9100.

Please mention the board / device rather than a platform.

> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)

-- 
With best wishes
Dmitry

