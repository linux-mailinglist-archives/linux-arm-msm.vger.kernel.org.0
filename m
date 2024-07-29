Return-Path: <linux-arm-msm+bounces-27170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8849693EC2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F98F2821FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8114312D75A;
	Mon, 29 Jul 2024 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUStXZeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E758624A;
	Mon, 29 Jul 2024 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225528; cv=none; b=nF19zVqGV1GjUH6P38sNB2cZxfZWVbng0PGF5gkk6t3cxZGrT0sq+to9y9phwrRNFDR3gtwwQXGb+HU3Df/0/jQ9jqpJQZEy94Mmkc5cLHJOwGhgpHLgQ1ZD9GWdOUhWRvxrlyDOY8SuD2L5ZYvW9KV9vvWJlSO2+Q/pv3ff5Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225528; c=relaxed/simple;
	bh=y2adRdsVH2V35+BMeHSTmcOBu70kyv4OJRVjx/WOfRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uX0+i8u0TNpt1dJ7cl7NC+nrBb0NJboaWRTkSlcqeB3hmFEbTocVY7nlWEW10JHW0p5FYJu7Mrzr+Abbjeu31MfK64NneonKiHOlzwLycD6ePtpXXoINxQJkFGrh/tmCof6HNx9WAlht65DKm6v2SwaCcD03CGwxt51D1+6gEMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUStXZeA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62502C4AF09;
	Mon, 29 Jul 2024 03:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225528;
	bh=y2adRdsVH2V35+BMeHSTmcOBu70kyv4OJRVjx/WOfRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SUStXZeAEDDKNeoTr/qPaFCc7IpobPR0sPJJ4CayuZftSYD3ObvaSNjCtjdTidDkp
	 GqQu2WjxxnpwH6kJhuzNGLlzuq0AK9n883P9hvjlLbiYtrPSet7jEMA/cc0Dz/dsAo
	 1Ctkh4waxnONoaA/filTLmtkd7Gie1ic3M0e8qCqFJE+Lu+aNfLl2sWFE6hmCQxb/8
	 3/YhIcSi+jbjyvGOqgLNfxgpOluiDAgvCal1GkXe+ptr/GYAOpSPYe+TVcCIAMyLnW
	 sa8tZPypvdk+TyH+Nl7zBhJS/ob4zYYNkLUGtO0blBPtmKs3M3Am0YzhIkU+LInmsi
	 eebWCahqcu0kA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: (subset) [PATCH 0/3] ThinkPad T14s Gen 6 support
Date: Sun, 28 Jul 2024 22:58:14 -0500
Message-ID: <172222551321.175430.17493901039813561000.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Jul 2024 22:16:35 +0200, Konrad Dybcio wrote:
> As good as the other X1 laptops
> 
> See this page for more hw info:
> 
> https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> 
> 
> [...]

Applied, thanks!

[2/3] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s
      commit: e6b5a4c3ae3b883cb13be2e1cd9fbf364928173e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

