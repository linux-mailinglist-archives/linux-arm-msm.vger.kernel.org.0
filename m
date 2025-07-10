Return-Path: <linux-arm-msm+bounces-64337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2DAFFEB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CACF1C806EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 10:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643CD2D5433;
	Thu, 10 Jul 2025 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNdY50vl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3978D28F508;
	Thu, 10 Jul 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142033; cv=none; b=VkslMnQnLlfwc8douhgHxvltodX8OHB+tG+XKUWNfDgOzNjB7Kcx7hHm+TEnrxh2TDLvXmjy7cI271r+yljkOSaLaQ5lfyHmgmzDhv47ud1/RUrHu+BktYdmSKV+etz6TU7SalLbJlBeLrRusZuoYtQ1BvMeNexNLCG0Mnr9F1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142033; c=relaxed/simple;
	bh=kTfBtHQVaqOAbu7HaUkw0dQpJOXNcnY0mNBZzC7M93g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqBWp90K3TGhZRS3d/afEoQyw7FTLjwDqTR9XQuErwzygWPpvje8ek2ZHMkEEN0XWVMiwy7ZFxNai5CAfQEPXLrO5YNMM8KYHsDt3VDCfZlA3eSP1LUfNdRMpeE5fxNwdGjtXR9AnDTbtFxTuVe6zXe4JvKe5MVAbBsij8AwfZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNdY50vl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E8FC4CEE3;
	Thu, 10 Jul 2025 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752142032;
	bh=kTfBtHQVaqOAbu7HaUkw0dQpJOXNcnY0mNBZzC7M93g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNdY50vlmF0c3atPR0wpveOpaNYxBV09YlwyUysx8+WWxAzCTJ6C4H25qZHs6+vPz
	 fQFnAPMh4qh9tsq8v4xcCdX7bkFwq+8QmtyQlczn71+bRGiZPS7D6SN/c+uW5JQbkq
	 6U6PQz966SOHuYgvna7pN128BUKoWV26N3haXFPcvWNwPtnNcIfyv2euWSK64EK4/P
	 suUv78F8cyyLf0JxlDmKu0+pUzOjMPKabsggu0IF0J8lmmaHECpLgOt4bZvnvxESgp
	 nT1jiX+TFZ69Ct8gMbpXu+HI1eYaKUCnuvIdTS/AJ6IoDlKLOJTFVrHGW5WfrNbriR
	 TtZxnGmteDWjw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uZoBE-0000000082t-3BZ0;
	Thu, 10 Jul 2025 12:07:05 +0200
Date: Thu, 10 Jul 2025 12:07:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Message-ID: <aG-QyF12rGY55gcG@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <aCw9pYehCdfXXeiR@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCw9pYehCdfXXeiR@hovoldconsulting.com>

Hi Chris (and Neil),

On Tue, May 20, 2025 at 10:30:29AM +0200, Johan Hovold wrote:

> On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
> > The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
> > panels. This patch series adds support for the OLED model which has a
> > Samsung ATNA40YK20 panel.
> > 
> > With this patch series the backlight of the OLED eDP panel does not
> > illuminate since the brightness is incorrectly read from the eDP panel
> > as (to be clear this is not a regression). This is fixed in [0].
> > 
> > [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/
> 
> It would be good to get OLED support for the T14s merged. Are you
> planning on sending another revision of this series?

No reply for over a month. Do you intend to respin these or should
someone else take over?

Neil, do you have the OLED version now?

> > Christopher Obbard (3):
> >       arm64: dts: qcom: x1e80100: add epd hpd pinctrl
> >       arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
> 
> >       arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
> 
> Strictly speaking you could have posted this last patch on it's own as
> it doesn't depend on adding the hpd pinctrl.

Johan

