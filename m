Return-Path: <linux-arm-msm+bounces-21250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC258D5F7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09BD11F24707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B01C155A32;
	Fri, 31 May 2024 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bnKYacDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59961514F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150820; cv=none; b=jdkxno6tDfXURDKvaCb6Je0/cvdTM0XEmUXqpSj9OYXvDZcsoVAFOXk2Vmws9dwEKu3/VDH4OXNpZKV8o5wtfD8JwT1lUI6Bh502XBaxVdvWfE+tWsqubbw05LokLQXlGvhxvjKhNhGWIDrCcHwpMnrGbFYwFyjyHNSHCp6Ktb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150820; c=relaxed/simple;
	bh=oDkCy8oJ2WMeKcy9+Uh0V14y9VWvcEu1F1wyVC5z6LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gF1Z60EWAKMI6b6wFlZs2+vHsMbSWH/vDaUQANUIERtUNxq4VxCkxf5RbiEF2CTgEgLJxC1KlJfLvVR9Czd5MxZDV7tP2uiB3LifUSAi0DR7TfqCF1h8nYWvdEUyfY6juwsIYNCsalwXD4CYc1URCkdzdPmhJD5iL0Q0V08tM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bnKYacDX; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e95a60dfcdso22380391fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717150817; x=1717755617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJg6C0WVWn0Vp3XGiynuZUYf7BAqZo56bxrIXpikvkk=;
        b=bnKYacDXhez1MqTGVeWrOL+5JJaLnb9p3zFOqceh0WtJCB67KE92/KGi0vdy89MUVK
         ZmzcEDKnRN14ckXyJyTzPYQgyX2XFe3+LHsohJq/buvNOHPy/nE2XNtX/Z1JUEGvYIGS
         7oh6/5mOYKagnty2M4xgdc52j5kiBrOtH3Yq6JGMVrZ975IQNMZn+068G30/TaW6QxQB
         nZ0YNQg8x+TqoGDO147NneP/+3mS6WvNVddL8ioH9Ieh0flKvavUXII+yNHub0q6CKUd
         30jYWl8pJ/cVPBCqLflWK61ySmiwe1n/4/WyLUlwaFv5eTnfpIfWhrCZ9NSmd/xVbpIG
         jzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717150817; x=1717755617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJg6C0WVWn0Vp3XGiynuZUYf7BAqZo56bxrIXpikvkk=;
        b=YdgkIPGk+nuUCEGfZ1lsXeTulvJmgMkQowCqzj+ENOAFmgdcdREC4ZODFvc3TS8v2h
         BIVUIkfepDhR+LE/qh4xPE8aoAiqtn4mS6MmuYF2yfUlFQtdQKaBnQ0FFxDRd95DFXOw
         wcPySWUzKdHwLGIgSvBbnLas7Yeq0VjiwqoYDvE2BoaxGOMZRoZz+qPn6VzxNrRqbBLi
         iVXsnXOBTCogLjWyc/n1/u4Tl5d6P4crnV2PoZ1XHr85p4s9hQPmDfu1hlYrFo9Bcnzh
         t8TJNkcpYkhdSHfAp31K2mFJ/f8K8h91ZRnxis3+/GDg69bgHk6VlYWaWi/NsVqviT4R
         u4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVsTUR2iupcE4JaNgz5g1WMbzyNLyVZe8lY97jdYq/XNOsXgzwRZqvVMCyh6WldaLo17RXHgBu9h6xgk/UrmEBT2lgJwDAQX73LaLlMAw==
X-Gm-Message-State: AOJu0Yy7M3lwOIrWgQ2/A0zg0hwW5PgftWVNEDgVBydCsDXB8LTUJUZJ
	u26E9Le8ZZb18mNQeZ/cR7syoUWfyxqq3w0QRGugJRQYuOOgPwPUpS4iKCEDNC0=
X-Google-Smtp-Source: AGHT+IH3eDhHYffts7P6CotucZIC/1NV5s1KOoULl1yKA9WH7Y4N37DO0QUnBGhOLPU2OlwFm5r/iw==
X-Received: by 2002:a05:651c:2112:b0:2e9:8374:3820 with SMTP id 38308e7fff4ca-2ea951dfc12mr12587551fa.40.1717150817101;
        Fri, 31 May 2024 03:20:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d744sm2653711fa.28.2024.05.31.03.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:20:16 -0700 (PDT)
Date: Fri, 31 May 2024 13:20:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/8] clk: qcom: sc7280: Update the transition delay
 for GDSC
Message-ID: <3dasezpuum7jnafhciv6atfi6n2tqra3lo3q425s7f36wuoc7i@pguvou37vhpl>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-5-quic_tdas@quicinc.com>
 <3293d565-ceb6-44f1-8a47-d18e9d0083a5@linaro.org>
 <a671ba20-f000-425f-914f-54a9d65d79c7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a671ba20-f000-425f-914f-54a9d65d79c7@quicinc.com>

On Fri, May 31, 2024 at 03:00:40PM +0530, Taniya Das wrote:
> 
> 
> On 3/18/2024 1:23 PM, Krzysztof Kozlowski wrote:
> > On 18/03/2024 06:35, Taniya Das wrote:
> > > Update the GDSC default values of GDSC transition delay to avoid the
> > > issues in the GDSC FSM state.
> > 
> > What issues?
> > 
> > > 
> 
> The GDSC FSM will be stuck and the GDSC will not be able to power on/off.
> 
> I will update the patch commit text as well.
> 
> > 
> > Why none of your so called "fixes" are marked as Cc-stable? If they are
> > real fixes, they should be.
> > 
> > > Fixes: fae7617bb142 ("clk: qcom: Add video clock controller driver for SC7280")
> > > Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
> > > Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
> > > Fixes: 3e0f01d6c7e7 ("clk: qcom: Add graphics clock controller driver for SC7280")
> > 
> > No, don't combine separate fixes into one commit.
> > 
> 
> I will remove the fixes tag in the next patch.

The intent was to _split_ the commit into 4 parts.

-- 
With best wishes
Dmitry

