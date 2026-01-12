Return-Path: <linux-arm-msm+bounces-88632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096AD155E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 22:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32A41301BDC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 21:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E78B322B72;
	Mon, 12 Jan 2026 21:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C53KFuUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26F13D51E;
	Mon, 12 Jan 2026 21:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768251684; cv=none; b=FRr3PtA3XAhhB8eWs8xtXyegDBtj6vGP9gYwFhj4W9XmdccPWePkwM/azlldnpaNEvaf7XsEHkcITQ0suKPoSzRB06mvz5/ZZhW0+u6MbAlfRZ+CKA4M2pYHXUtVTQS7Hfg/2rejBrnlWvSYoZ0+jjGB9TGJi3jwDeu2/+qJK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768251684; c=relaxed/simple;
	bh=jHIxkagKW3K+pNi/FM//oFuOr++3u2WQjjBVRRfApK8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EulBiTTJNpAZUvagjsUWehpfNsYD11u3d0PPDLlsjFxrZqSVE6rnZiZYfVLXIr/hly2eG0TRBGjRWaBRlpUCrrQ2Fa2bBis68XLvovE2pfibqmdAjArQlI9csfqC7sZ4J2N2sMvH2ITcAcLhxGRHltWgnqMPidaT53sxhDQTSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C53KFuUx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586C1C116D0;
	Mon, 12 Jan 2026 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768251684;
	bh=jHIxkagKW3K+pNi/FM//oFuOr++3u2WQjjBVRRfApK8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C53KFuUxv/Yd0m96DYncI+buMM+Iq96Ko0scJwxz2z+so/B2sr2YdvcRJmR/7ZoJr
	 b0uW0YLc7XIdeBvr75a4t8VCAjb+2PIqWjOAKEI5Yn8avKL6kKXI/+oZkeTbnvopQp
	 9cZQioKoXeWbxocUh9v3VYspgmi1cnyQUJ7YDx4pFK4l5ms4sNYZpfZVVwmVEm2wSN
	 lHk0/NuxCVTIKhpD165OIu5IqPKkK+SK9rJ8EvKIaeiJArM6zgMqQJ26Sk/hGCdTVB
	 i6G/UrmQ24BkKbPwvv5HtEKqrVdJ/5rXx8/UU7TUErHMvHdTtI+Xf67S/L8aLxZdDa
	 +xx1ZH0Wn4BRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78A81380CFD5;
	Mon, 12 Jan 2026 20:57:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v3 00/11] Bluetooth: dt-bindings: qualcomm: Split
 binding
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176825147827.1092878.7798371472359770719.git-patchwork-notify@kernel.org>
Date: Mon, 12 Jan 2026 20:57:58 +0000
References: 
 <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
In-Reply-To: 
 <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bgodavar@quicinc.com,
 quic_rjliao@quicinc.com, brgl@bgdev.pl, brgl@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 andersson@kernel.org

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sun, 11 Jan 2026 16:48:57 +0100 you wrote:
> Changes in v3:
> - Just rebase and add review tags.
> - Link to v2: https://patch.msgid.link/20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org
> 
> Changes in v2:
> - Drop in few commits the properties (supplies) from
>   qualcomm-bluetooth.yaml which are not used by devices left there,
>   instead of removing them in final patch (qcom,wcn7850-bt).
> - Fix dt_binding_check error - missing gpio.h header in the example.
> - Drop maintainers update - split into separate patch.
> - Add also Bartosz as maintainer of two bindings because he was working
>   with these in the past.
> - Link to v1: https://patch.msgid.link/20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org
> 
> [...]

Here is the summary with links:
  - [RESEND,v3,01/11] dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema
    (no matching commit)
  - [RESEND,v3,02/11] dt-bindings: bluetooth: qcom,qca9377-bt: Split to separate schema
    https://git.kernel.org/bluetooth/bluetooth-next/c/fecb6f46ab6f
  - [RESEND,v3,03/11] dt-bindings: bluetooth: qcom,qca6390-bt: Split to separate schema
    https://git.kernel.org/bluetooth/bluetooth-next/c/e41a69e668ef
  - [RESEND,v3,04/11] dt-bindings: bluetooth: qcom,wcn3950-bt: Split to separate schema
    https://git.kernel.org/bluetooth/bluetooth-next/c/439375d993c7
  - [RESEND,v3,05/11] dt-bindings: bluetooth: qcom,wcn3990-bt: Split to separate schema
    https://git.kernel.org/bluetooth/bluetooth-next/c/57507201df35
  - [RESEND,v3,06/11] dt-bindings: bluetooth: qcom,wcn6750-bt: Split to separate schema
    https://git.kernel.org/bluetooth/bluetooth-next/c/4d3a212deeea
  - [RESEND,v3,07/11] dt-bindings: bluetooth: qcom,wcn6750-bt: Deprecate old supplies
    https://git.kernel.org/bluetooth/bluetooth-next/c/74ee2b6db9f4
  - [RESEND,v3,08/11] dt-bindings: bluetooth: qcom,wcn6855-bt: Split to separate schema
    https://git.kernel.org/bluetooth/bluetooth-next/c/691c0da55562
  - [RESEND,v3,09/11] dt-bindings: bluetooth: qcom,wcn6855-bt: Deprecate old supplies
    https://git.kernel.org/bluetooth/bluetooth-next/c/9d2f4c4a4be2
  - [RESEND,v3,10/11] dt-bindings: bluetooth: qcom,wcn7850-bt: Split to separate schema
    https://git.kernel.org/bluetooth/bluetooth-next/c/0f755f17590d
  - [RESEND,v3,11/11] dt-bindings: bluetooth: qcom,wcn7850-bt: Deprecate old supplies
    https://git.kernel.org/bluetooth/bluetooth-next/c/fc1e82e745e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



