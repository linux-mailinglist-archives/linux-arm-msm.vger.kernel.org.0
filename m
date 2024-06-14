Return-Path: <linux-arm-msm+bounces-22757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DD590944D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094341F220D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A5118C343;
	Fri, 14 Jun 2024 22:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/1a2xCz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410E18C336;
	Fri, 14 Jun 2024 22:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405345; cv=none; b=Q7tWoU2tyvKmXSju00hyqMpOWJos8zYC5rZqm0onzI5OON5hS24KdqCfO0sqqpjzSBgMQ81qrNUszFV0p0eHywzxy9W/vmQ/7PPJMzUtLRtx6Qzy49K6p3SjsHriyJwE4uIl85e6iybzH35wdmNQPq8jRgz6VXB27F0/nG0yi8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405345; c=relaxed/simple;
	bh=3x0A6IXTx7w+U/WBtw0hVd1YOtvguUSUYd5y5/Us4wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pT+bPsKQGqGE4NHHevso0gtTWpMnBOu1wsEFfQH1UrLuLhtZFLQCgbY3fqf1WxyydDPcP2lySyPbc8dFdXlsb3W6kqoEBWFAzBwcgS7kwM2tIYX8wlXXxG7ixGuYgF/G1Mjod+aZN03r706ufoMV0iPT6Yd6hSkcGsovY7T6R6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/1a2xCz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96EEC4AF1D;
	Fri, 14 Jun 2024 22:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718405344;
	bh=3x0A6IXTx7w+U/WBtw0hVd1YOtvguUSUYd5y5/Us4wU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/1a2xCzywgbIyv1kdWzsOZkaHssAJeJtKsAlctOPbnfZwmcA/0iRokERAGOR2g0k
	 llNoGfFZlS0Qx+JBYk1Nmq/u0SD61C1F85uZnFfQ40Ta1Jm0X2F2papYBs0wAtDrRv
	 FxESPab5bqCSeOXV2rIK5+XyKQKJhWzgjlvmxRi7+ZCExqw1muVrnAV2RdLA3bulPN
	 C+G+7IgqsaEEowrxr5YnUF4ZL8Y0hP28KMCoQ7oSFQGv25xFmn7l5Hxv4W9cZMttRA
	 WfXvXq6r0ppl2mGrxkqAagJ9GbqKc7uKIhXLBF8uMDfOAbWqOT8iGtISdOq+OWgb0o
	 f/dtUAWPEmWoA==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Support mailbox interface in qcom,smsm driver
Date: Fri, 14 Jun 2024 17:48:53 -0500
Message-ID: <171840533352.102487.9576671528001022676.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606-smsm-mbox-v2-0-8abe6b5f01da@z3ntu.xyz>
References: <20240606-smsm-mbox-v2-0-8abe6b5f01da@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Jun 2024 21:18:31 +0200, Luca Weiss wrote:
> Take a shot at converting the last driver that requires direct
> "qcom,ipc*" syscon references in devicetree by allowing the smsm driver
> to use the mailbox interface to achieve the same effect.
> 
> Still not sure if the devicetree bindings are the prettiest but they're
> functional.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soc: qcom,smsm: Allow specifying mboxes instead of qcom,ipc
      commit: 5e66abcf1e250f032ecb18a7ecfac5287298ed8e
[2/2] soc: qcom: smsm: Support using mailbox interface
      commit: 75287992f58a74271a083fef0356bc81d629f671

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

