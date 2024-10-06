Return-Path: <linux-arm-msm+bounces-33299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BB99218F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 23:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2314D2812DA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91C518B487;
	Sun,  6 Oct 2024 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5nMTpAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101C318A6BA
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 21:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248876; cv=none; b=DKeM8t4eM/jMEPY3bW8AV8k/PoHtk6eXlsiDY63r4IHZBe5LrNU2n5rl8TksOgixPnpEu71w86CA2H46TM2tT6d8m1nWbLIjL0u8/doEkIbURVVrVK+9J2kidC+6mrZPDhjLAEiGaduw4bZOSVxFk8pTJTUH4g+QYT8dmPlhlYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248876; c=relaxed/simple;
	bh=ZmEHLsPsF/N6ibvDSVVq/66rE5RN7QBCRfoTpzPD//E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mflww7d4O7nTkz1n/cR/wUYlSGheMdgqpS8sPJANHxVUf9OICsmwwgGUOyU7hTIQyOh5QVUaR1GPSShPjQPsddqhMg48zkvAFCS48VsD2UE+YndCYBSxu1eMCgXLGrsCRfmrkLxiSu7cgQogq5cs1OWgT3HYQcD73X0IwrJ7z5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5nMTpAB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53995380bb3so4294283e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728248873; x=1728853673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Szw/D0bhQP/xtWqJOCA8PUzQroqabxhhElDsr640PI=;
        b=t5nMTpABdnd0ANto0f+s4DYsYy55O1o+LZitz9gcKKxOYmZpHdF0WLfbXBsO8XDDgo
         5pdttAbOtj7FS49WX8loWsfuYZzN7f15Y1SXfJrcLFPJOf9d2+whu+6Bn0rFkzaLy6ja
         Uo+2bMLk3KFHbcm63sS3mhMzuu5Ao8DYUWxutaiVKWv81y+q8aoEnflZkKuwSg6F+3Tx
         DxhLJRlpFgVFX/5oXeqyRDreZBquZSqlSG7AWvKOaGrpx+djtsassLLpdtYkY1B5iQt6
         Tpl2adGgYQG1s4JQiML/B1AM7o35qd2pWofERyQ+nC9z8GG/bl/8Qb5yOiNOw3dKDkHs
         116g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728248873; x=1728853673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Szw/D0bhQP/xtWqJOCA8PUzQroqabxhhElDsr640PI=;
        b=s7i6J+isGuT9eJdoFLtZJPBfvFREIm1Hkha/ItL/NH8NZ6bQXH4i+JFis7lcRoO04R
         zCqzXLWlMp5Wnt3aWiog3aPXV5SulK2DeuVxvnankPc9XtOFY6IpotCVlzSBGUk3MI33
         2R5xKPKfMApu+SyXmmuiFOU7ok4L3ND59ujaeUs8b/7ALI5IHNTzg9b4IqZD9fEwa5jd
         LwoR2AmPdD54u73TF0g24xVCHes93X+rwsM6FUQROxvhN3HMP4Jwe5+Bslvvp2vaJ21S
         iSusl/Tm7SMLmjyLf+iPWGDLpOteDkMKJ9bW4IKitTW67FZ4JPozCRhkzjs/rOhfDQsk
         0jCw==
X-Forwarded-Encrypted: i=1; AJvYcCW7tB8KfgyQhqE5CBDt4ALk46T9x7UqIypvQ6Vp1ooENH703duTNHvCzMt1J7ozesIVOoidTD5Rj2/beRpy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5wXTrD0rEz0GF4vA50oSNiOBYkZdluYGhRGdPkpm0xwzVDlGS
	dhloxLTV7idkKvSZqFrkB9ABboPsHDxsqRwcPmvjmJs++1mjJiPFX80c/j2ipFs=
X-Google-Smtp-Source: AGHT+IGNLcBHRM2Z/UXd6g9I6VwOvjvFpOD+yzP2cMKHxtpf6x5Xa2qcpwJRnTWlA6Rteu81F+BJow==
X-Received: by 2002:a05:6512:234d:b0:536:14a1:d660 with SMTP id 2adb3069b0e04-539ab85c035mr5226217e87.6.1728248873103;
        Sun, 06 Oct 2024 14:07:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff286f6sm617883e87.293.2024.10.06.14.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 14:07:52 -0700 (PDT)
Date: Mon, 7 Oct 2024 00:07:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, 
	Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH v2 2/4] pmdomain: qcom: rpmhpd: Add qcs8300 power domains
Message-ID: <dy2kuyx23oraslo5cqc3a2udkxaafwyuugdkzcadwyel2mjyen@xrlus5lq4ygi>
References: <20240927-add_qcs615_qcs8300_powerdomains_driver_support-v2-0-18c030ad7b68@quicinc.com>
 <20240927-add_qcs615_qcs8300_powerdomains_driver_support-v2-2-18c030ad7b68@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-add_qcs615_qcs8300_powerdomains_driver_support-v2-2-18c030ad7b68@quicinc.com>

On Fri, Sep 27, 2024 at 07:59:14PM GMT, Tingguo Cheng wrote:
> Add support for the power domains exposed by RPMh on the qcs8300
> platform. MMCX depends on CX, so mark CX as the parent of MMCX.
> 
> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

