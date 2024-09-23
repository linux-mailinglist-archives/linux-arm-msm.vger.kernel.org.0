Return-Path: <linux-arm-msm+bounces-32200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A2197EAEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 13:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 799FD1C210E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 11:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03F61991AC;
	Mon, 23 Sep 2024 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJvMwk+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC6198E8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727091905; cv=none; b=mtP2GEwZ1/yJKEIoTgwFIe5l54t+uZCG6tZHOWaEMlcCDb4SONwN2S3FrAWt2l22wijSHtDIBA7JQYQ7DobeQGmou8r3RwFFd/2EovDmuTC7fjIRUifzZzTkwnqm0sJuDHedpLb9iR36wpYnHypZxT9zFAIcIAy7cBfsPzW1pXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727091905; c=relaxed/simple;
	bh=oWf1etSGThdvWeQQGh2KhdCYp3tZr3vCu5xX3HYconA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwOvXj78mBAC+CmAToOmZY0osRCYgIu5cErnCNMMSbSQazprMGhgS8BkVPnsTG2O9MT3WwIhOYoyDRQp8QUR3sljD6ctFpLmU5rIibJU6Rgpifn91lJ4iqunQ9jL8G8Byh84C7J32mAbOOlbTgrrD6gfVL4ZIa6U8w09mVlv+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJvMwk+x; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365c512b00so4816920e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727091901; x=1727696701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhnBmWAe9NUrsichqtPogCcJph5ClsF7zPozObEyXA4=;
        b=GJvMwk+x2MX6pzODrbN64H/LfXKU2PeSMlbdLttBnReJzt7e2PET+r7JEKrSfSbvyu
         JNaPDnzS9OTElED6d6gdQ7w/bR1rC7y1qAjAYU/DgEkbhieoaeB+4vWy1lBxZRqbEtjr
         ++c+Ze5BqFSUzkOxhQeoHaNpvUZsZfkH3eIQV+e23DtOJDVd3faoWMUn+YwUII3XchQB
         BuhFC4ZHnXE0u5nJOpnZ2WquHkUbLklFPewTir2+6IeeL0bbKjbVGci3rIxP2qvju4ag
         0r3POYT4hjjLs9UO3EyZX2obHUQYuAQtdqqaHY3+mQQ1a64TXUy7jQFFhEI2/SgYeHla
         dHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727091901; x=1727696701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhnBmWAe9NUrsichqtPogCcJph5ClsF7zPozObEyXA4=;
        b=esR4QW7cnmwy3N8r1R2JuA0K/srJL9MsHdlLgcOPvVT0mQklXEqlzgtaoDrl2Z6be9
         ceWFuZDwEp0/iGW2+rHQEAdJ4W45R1FDQGidqlCdMvfw9BtwRuQkZJxgGqbicvIz4iQk
         kPv5uEplg/Komam88qNQY+OlEWMf3ZELhQuU9+A3kLenjColdnvDMrFs4MHFRdKFrPgv
         3WEMlOX/xwkAM6KBLBiZVARz+P2A/VR3akKzSBfrKnhyTGNCr6ay1QZ29vkzQJSArOH0
         ozN+18hPMTRYYL/TX4GYmH+s1tH67s77AOGvFFi6RApssfrj04YeLaCH19XSDJzHPGFG
         sSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeaqIApfxD82elfwnY0/QhGGu9ii2tn3TezA5YvGLbv43k1VV/eaWK33Y/Z2+KZqUBXJDv/8VP6QjYxIWL@vger.kernel.org
X-Gm-Message-State: AOJu0YyCy3NrJuRoKMH4D1tQLoDvmhFoW/g8gYgv9nmLMeTv1QIfhaSw
	VFy7vdRqApviuE/q7nXnUteulTktQ8dP+t2mgmVBAgYyXk9peD1JwyGQJv6bSHM=
X-Google-Smtp-Source: AGHT+IHa4aqsZXTbC37KCXn5fe4mfHLWoWf0Nyyz2mtzA1/7uiKYj0/E1PRavXBv3jLrfICSOaxmpg==
X-Received: by 2002:a05:6512:a8e:b0:536:52c4:e45c with SMTP id 2adb3069b0e04-536ac2f54b4mr4462943e87.31.1727091901086;
        Mon, 23 Sep 2024 04:45:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a875bsm3259740e87.224.2024.09.23.04.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 04:44:59 -0700 (PDT)
Date: Mon, 23 Sep 2024 14:44:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
	quic_parellan@quicinc.com, quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
Message-ID: <qughwerqucheykdwxhip32n7epijn3625jxn2ls7t7nptu4tkw@ls2u7uzaoegj>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-3-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-3-quic_mukhopad@quicinc.com>

On Mon, Sep 23, 2024 at 05:01:47PM GMT, Soutrik Mukhopadhyay wrote:
> In order to support different HW versions, introduce aux_cfg array
> to move v4 specific aux configuration settings.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: Fixed review comments from Bjorn and Dmitry
> 	- Made aux_cfg array as const.
> 
> v3: Fixed review comments from Dmitry
> 	- Used a for loop to write the dp_phy_aux_cfg registers.
> 	- Pre-defined the aux_cfg size to prevent any magic numbers.
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 41 ++++++++++++-----------------
>  1 file changed, 17 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

