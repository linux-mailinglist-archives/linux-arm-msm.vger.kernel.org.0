Return-Path: <linux-arm-msm+bounces-25430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EAE92957C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52CF21C20AA4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0483813D887;
	Sat,  6 Jul 2024 22:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xwkswe08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D167C13D296;
	Sat,  6 Jul 2024 22:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303298; cv=none; b=MCSRfAfkE3kcFnlE7zYceFfniEBJK4nRIxkxNsU6/OWhxfKYa551SJt9TngB3JG4rWjx2DUdaDPmLpNsT29+86LXfbcOrijRxjsb7mXhs/c5q0ic/ULjMw9VUqLgSgTMB/281XNGukbLH8pFUOQYZPbJ6R7Vnn/I0HPuzLj8OD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303298; c=relaxed/simple;
	bh=FYpNCc5arCt1g+0MD+FvOZhE/8zpWtdKkwh1Qa7t6Mc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJ+FyyvQepAmqaxIN3bzs77JHcy5SKVykjz3xriIjp0X0R76bogJFWWIi2jA+0lBt6+pkQrr8CQqlYhPifz9hENDsKWtsSmTdrGQyvjTv3gnPre5BE+cxBjUaASx+1OQNlC/i6+9L56dqCLTKdngv0ux7KUvRGFypEC6RirRfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xwkswe08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99D1C4AF13;
	Sat,  6 Jul 2024 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303298;
	bh=FYpNCc5arCt1g+0MD+FvOZhE/8zpWtdKkwh1Qa7t6Mc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xwkswe08ZVhyhYzCsb7Vybksc3Uz9Xqq0HuksDfKYMqi/geFnD+aXte8P7p+hN+ho
	 rvj3MoGQL35ZM++UsXYtax54WGPNPFOJdfSW7u/Ex3QIG8Me4z1B3zgtrljxEvldCQ
	 xc7LyHmoQl+Sr3R8if80hw08pCO4dynpX9pouWhJAjrM3dW7u0+wTBNO8BPg3tqJ36
	 u5gwe6dKioJm5I++FiElfTsqE0QWUKQiXjzU9CMFS8WeVQnhmqQ2e/cZxbU4nVtepL
	 bneQ4ftViwK2hdxnK7syGajfWpZ3NhWAnFDU8o0Zz7LMoGY9lG7cAu5AYyGBCOCj5W
	 jdfI72k2fifwg==
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] firmware: qcom: tzmem: simplify returning pointer without cleanup
Date: Sat,  6 Jul 2024 17:01:21 -0500
Message-ID: <172030328797.28909.17449397962431804730.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703083046.95811-1-krzysztof.kozlowski@linaro.org>
References: <20240703083046.95811-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jul 2024 10:30:46 +0200, Krzysztof Kozlowski wrote:
> Use 'return_ptr' helper for returning a pointer without cleanup for
> shorter code.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: tzmem: simplify returning pointer without cleanup
      commit: d99b680b4a9a33d0c47a68a4c1a45775023426ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

