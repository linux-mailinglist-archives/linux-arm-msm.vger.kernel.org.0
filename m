Return-Path: <linux-arm-msm+bounces-8704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02283F89C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 18:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D911FB21F8F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 17:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD582E632;
	Sun, 28 Jan 2024 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJuJWqnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B22E62A;
	Sun, 28 Jan 2024 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706463960; cv=none; b=gDEVO4InvAy6ouqIjkiBYa87xR3DfARmHZ2L+xZAEyN6tH9s3LTLi77nWXN2cBu/E3UuFz67MisNzQd5HCSA0d6bIDs8C3cRSauHUcPKPw5QdgoRvwmB1ZDwVoLQlMEgUCzbPXbVMVvBo3HY7aV3NPsSpZIyJ+9igpTe8DLJb5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706463960; c=relaxed/simple;
	bh=xTh5SY11YWdAQd5IVfMwXU0lWi8sPe1OWN8yV3lCLLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqKVmRY2AB30QkDBRGjsPj8BcW2i4bXt3Igad4Zerrmk6fiDd+yIkPc36tfodcPTyvGNItomrjxD19mbsjcO4swhNZExcOMb6L6KSPMhwYhzlAtoa/tZ3fW73GHeblXJhOGBi1VGkiByZ++y7Taz9f4o/1FLFgaeH/fHBDdEnYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJuJWqnO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C81C43394;
	Sun, 28 Jan 2024 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706463960;
	bh=xTh5SY11YWdAQd5IVfMwXU0lWi8sPe1OWN8yV3lCLLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HJuJWqnO5QUF26xnXyZ8LcOr1uF/XVpgQg5AnYBPkE9Y4Q5emV+M24+z3zADg7R2B
	 A62a8j0vkRU0KmSHlfnb5gK/+xiFt4BU155sQ1jjgzVIrkFSnSHircfquiIZSkgt2a
	 lvp8p36Qt2tm6X5wglvlxcRn29ITX9UcQInoO+VLv/fIYXaIrS8+uCIZj5XFG+W5Zo
	 i9Q8dAF0SYyBdtfKAAog5thTWsIMeEZY+JAGzppucqVqrvo8oYOEXbMK+jQcbznw7E
	 HFi9qU0M2TYt2beyVVoA5Ql3tIHki0fqRVwB1Yd4A/TNUXNTOWn8+WsoNn4vesbcC/
	 rwOhzKxEvM8FA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] soc: qcom: rename rename PM2250 to PM4125
Date: Sun, 28 Jan 2024 11:45:43 -0600
Message-ID: <170646395047.64610.18282202025310532362.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128-pm2250-pm4125-rename-v2-0-d51987e9f83a@linaro.org>
References: <20240128-pm2250-pm4125-rename-v2-0-d51987e9f83a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 28 Jan 2024 03:32:43 +0200, Dmitry Baryshkov wrote:
> It seems, the only actual mentions of PM2250 can be found are related to
> the Qualcomm RB1 platform. However even RB1 schematics use PM4125 as a
> PMIC name. Rename PM2250 to PM4125 to follow the documentation.
> 
> Note, this doesn't change the compatible strings. There was a previous
> argument regarding renaming of compat strings.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: rename PM2250 to PM4125
      commit: b11d508ded3e5528da07a4aab81bb49c3e66727e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

