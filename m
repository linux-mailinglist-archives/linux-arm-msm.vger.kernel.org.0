Return-Path: <linux-arm-msm+bounces-91210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJF+IrW1e2neHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 20:32:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD08B401B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 20:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE6E43004DFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 19:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FBC30BF79;
	Thu, 29 Jan 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWVVVJd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272D2D46B3;
	Thu, 29 Jan 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715122; cv=none; b=XI6QuXHoKAT3YY970Dz+hEXRqGtyY/0fXZ6Z90HxoMhjwF7LrHTZlUkqtLHImwGozyAPOsHNkGF5i3AtQk+TESDHjkwxyVb8TbJqgFDF1uwIxxiKoBHfQU7S7KZZIFhnTfM6RCs/zk1UldnI9H4+cHyHQ+5nJVlIQqEP8kAxuCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715122; c=relaxed/simple;
	bh=+afXvXUiUrGnXFfdDqtAMfkE/vdSboOihJX6gkigv6M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qayAHBATQGjD/p8xdg2gM2Gf6OzDbpDj7H/ObXLp5K5FQiwkyhcqHywOFcUPuvsOMi702G4rmfjyNJDosuebw5NuXRiu7VeAG6c3GREw0J/TvU0jQeFNF+lEXrnRj9W41EGbqbB21p58uj0xhTu2qxnCWOKHma6/SFJdyPE2PMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWVVVJd3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37599C4CEF7;
	Thu, 29 Jan 2026 19:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769715122;
	bh=+afXvXUiUrGnXFfdDqtAMfkE/vdSboOihJX6gkigv6M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VWVVVJd3vy51QjUbs15jezgc+M60SoerF9LjzTPt8CR9bHtku0CAvZb4ybxDHFik2
	 cEkKyU8wdpWO4+UqWA3G4ME4K/JGipl8s3GyfZzNe+N+xMpErhgmcprfIKSU6Fic9f
	 dWA4nCVClDJqtnJ8gZt7sDgQBm7kx9OsXsnrUrhFbguzHXrXdUGUc8jFYqQPfFAm9G
	 3tAh68gq6NkNWuWANyePQV+laaP+kkex48VJI7qoj2lTl+hYUzxfxraT8P08+j/2j1
	 8JM/bOYeGTSJ/bpw5DYwC5PRzpcxS0FOuEgX/i39pe3Hzz2mU3L3Cd8KgInMNev6NM
	 lQTFXfwv+DT6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4ED25380CED5;
	Thu, 29 Jan 2026 19:31:56 +0000 (UTC)
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
 <176971511510.3002804.2692229697653539128.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 19:31:55 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91210-lists,linux-arm-msm=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,kernel.org,quicinc.com,bgdev.pl,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url,intel.com:email]
X-Rspamd-Queue-Id: EDD08B401B
X-Rspamd-Action: no action

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
    https://git.kernel.org/bluetooth/bluetooth-next/c/68f3769ce016
  - [RESEND,v3,02/11] dt-bindings: bluetooth: qcom,qca9377-bt: Split to separate schema
    (no matching commit)
  - [RESEND,v3,03/11] dt-bindings: bluetooth: qcom,qca6390-bt: Split to separate schema
    (no matching commit)
  - [RESEND,v3,04/11] dt-bindings: bluetooth: qcom,wcn3950-bt: Split to separate schema
    (no matching commit)
  - [RESEND,v3,05/11] dt-bindings: bluetooth: qcom,wcn3990-bt: Split to separate schema
    (no matching commit)
  - [RESEND,v3,06/11] dt-bindings: bluetooth: qcom,wcn6750-bt: Split to separate schema
    (no matching commit)
  - [RESEND,v3,07/11] dt-bindings: bluetooth: qcom,wcn6750-bt: Deprecate old supplies
    (no matching commit)
  - [RESEND,v3,08/11] dt-bindings: bluetooth: qcom,wcn6855-bt: Split to separate schema
    (no matching commit)
  - [RESEND,v3,09/11] dt-bindings: bluetooth: qcom,wcn6855-bt: Deprecate old supplies
    (no matching commit)
  - [RESEND,v3,10/11] dt-bindings: bluetooth: qcom,wcn7850-bt: Split to separate schema
    (no matching commit)
  - [RESEND,v3,11/11] dt-bindings: bluetooth: qcom,wcn7850-bt: Deprecate old supplies
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



