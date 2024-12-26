Return-Path: <linux-arm-msm+bounces-43383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B409FCCA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48CB81883387
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207EA1D4359;
	Thu, 26 Dec 2024 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvUAuaMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F191D4339;
	Thu, 26 Dec 2024 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237638; cv=none; b=AMo4bSN8TX9WCp9SNK+B7+fxE/DCuSAnR15VwAxAzAWE1hGmcCgSvP2UHIRES7tGVVeyZae/MbpQpZd6oyjun295kUVLL/g8SUZYFKZfJP49AsIqjIIK6MAnVRblCUEZxPbFX8dDAr6bp6N1A1QV9XYV2zRl1Gfiq8su5YjaUTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237638; c=relaxed/simple;
	bh=UNhdKr0AqLpY7vZQ/PhZ2AlxazV5nIlqtjE8DRlXn5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UzIL2VpIsnMhag/Xn/2yGFO3uCKnNlFhzHmwi/45ZjQLO8n4pgJe8oPhwfa68lvigiGDL3p0G7fonX1jI6v1HK/jI24SsAVfBibPne+ge98YPBDMK8Q9FyoitYR4iUEYtwx3488f0fwEWZx3uVOayyOgV6rHUWohO2Sd+AhHuCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvUAuaMs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2022FC4CED1;
	Thu, 26 Dec 2024 18:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237637;
	bh=UNhdKr0AqLpY7vZQ/PhZ2AlxazV5nIlqtjE8DRlXn5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bvUAuaMsFBgZsdZvpn53fAr2pu1ggQnYLTFeUF+ifNqZMaPKwsFPQVKMWdk0px0dU
	 a9WamXcy80UDvS70CT9mxncrAMJTjgxYvr15FIj8iwu+j+B5AA+ihcVoG/n0HRmBGS
	 XHKXv8fdsd6cCCF8OnPXJnEJIwjKsErNyG2pxZfzIM4XoEhfeOmh9p3ABpCM7WYqKL
	 HrZuJrGHDZjkjr04WjtK1JODWoNkgEzn8SHKXu4qKrnXqGFK/8Fxsx/ecelBtVQuP0
	 DN3LaBEhMasvmmiZ198rVV3V1wxa9KtlDMHZfnRk7ucNyO1RGHogcNztDNDWD7oPvg
	 ZJ40biTU65xaA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Alex Elder <elder@kernel.org>
Subject: Re: [RFC PATCH] arm64: dts: qcom: sm8350-hdk: enable IPA
Date: Thu, 26 Dec 2024 12:26:36 -0600
Message-ID: <173523761396.1412574.6823147509441353405.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20230310203438.1585701-1-dmitry.baryshkov@linaro.org>
References: <20230310203438.1585701-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Mar 2023 22:34:38 +0200, Dmitry Baryshkov wrote:
> Although the HDK has no radio, the IPA part is still perfectly usable
> (altough it doesn't register any real networking devices). Enable it to
> make it possible to test IPA on this platform.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350-hdk: enable IPA
      commit: cc47b123159dbad9c8a7e977e977e410de090418

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

