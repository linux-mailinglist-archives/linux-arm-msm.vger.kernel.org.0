Return-Path: <linux-arm-msm+bounces-11902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6A785C325
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 18:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20CF51C20A66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 17:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA4777643;
	Tue, 20 Feb 2024 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blNdQetg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43BB76C98;
	Tue, 20 Feb 2024 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708451868; cv=none; b=jCb7Muc12GjJJJp4KSj1dB0UslQoL12UIuWA0gcR4kOZo2ymxcAkqGKTOLqqI5mmVqmYPpC32s5N2Mg0Nv+ZhSs0YHpgfgEsJjA4jUH1i8dLGvVmZTPTC1nnO6y/aR9TXbstt1Px8G6WwRsMXoaNI57Pnvd32iljeVdn4Z8yzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708451868; c=relaxed/simple;
	bh=8q9W3SBiK3mymIu4dCwTPCec/vRjsF4nmEK/7H3USs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BX4yVu4PUOATT0BuwiyHOSCiMT6/gUDGGRHXH8sZaqLGWknLybf8kE6nTrgE6ao8988dVIJZviAwGrUzjyuD++CuVC1yZlJ7Mr6iZqlrfhpTnlt022nErXpYGDMwBk55UkmOYG/Zb0wnFUiNBjcJKUbq3RHO0zRwbHI5pRVp6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blNdQetg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9F7C433F1;
	Tue, 20 Feb 2024 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708451867;
	bh=8q9W3SBiK3mymIu4dCwTPCec/vRjsF4nmEK/7H3USs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=blNdQetgFJ3Qq2EnaO28wLqmomewUPrIredj7lMOb/a7pRH9diwxZAQ54PloSFtEU
	 QPrflNbc6141OFhJS3GMVP1BbSCZ2K2RjgWkLXU3RFkGTblFD5mjeSd15mntKpYmMm
	 YgqGkJXO40otXuhe3Hq6IIi9KUEf8trWIaM0U2/8gW2ZM1vQLMmp7YtJFDdofjvU9L
	 NswMBxkEkuXsSgnIymG5oZR2Mt3r0CN2Ts+Ijy9ZXOTd00mxH3zYnmmMHDKwOhP+l5
	 lgfrYG162a0eAn5eQX+iYwpCcMQ0hNVGB9blw7kbN8EZ1r0I51668ik/g833FyelGF
	 ZefxsdTOroRrw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: fix USB PHY configuration
Date: Tue, 20 Feb 2024 11:57:38 -0600
Message-ID: <170845186089.159943.6090659606720475098.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
References: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Feb 2024 19:31:04 +0200, Dmitry Baryshkov wrote:
> The patch adding Type-C support for sm6115 was misapplied. All the
> orientation switch configuration ended up at the UFS PHY node instead of
> the USB PHY node. Move the data bits to the correct place.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6115: fix USB PHY configuration
      commit: f176168bcb95bd1fdd32f5a794e68b7a36ac8740

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

