Return-Path: <linux-arm-msm+bounces-19340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA38BE532
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDC828C872
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 14:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311D215FA93;
	Tue,  7 May 2024 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTUH648e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0033415FA8E;
	Tue,  7 May 2024 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090787; cv=none; b=mSseUZ7BkL5SQmkmrQevHbF3AgaGivOXwKE9teRgQt8oDuZzqyclCC9NjA2MnUF52xH2JQAdQsXVRfOqgknRiQJvAet5ea3k+D0dCPpUreLHxVa73gDR8k3awN8puILXAKKUe2ZBRXg1KRNAyKidshTrHW6IPCp0ozUN+csAG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090787; c=relaxed/simple;
	bh=I2rFv9BkMXtN9nVY7EagmlfId9Bt/y/xkBCocO+8sVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OW4WyQf59CmWB6k7r2C6buglLo3fb26kOcU6/VjZykn/H4n4kpNUBRQgnUkQYSHsZqfT8OUmNBmx/WRLmP4wvB8kBh0HNlOwagFFiyoYKsuBss+KwcH+re2ZaJZJ8eNoaZIWdThxEpjKLlPmKpzWFmP7ZR5VwInJDiODxvw1Los=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTUH648e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45B4C3277B;
	Tue,  7 May 2024 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715090786;
	bh=I2rFv9BkMXtN9nVY7EagmlfId9Bt/y/xkBCocO+8sVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CTUH648ejcGmeEAmek93vhucXcmqrHGMfOw0NNw/dSpDY/64bvrJFBiyZ7zibYpF9
	 LTGRonnqMTm49Fl6zZEzNDM0RzoN5guEhPfbScEnXeb/yn6jwBnZbvua86upSKd76B
	 fIUOhLo3gvy6RU90WY0KBp1LShYZ27h/SmwdWwI2sDDJqFvMpHB+JB2RGjacjKunMm
	 wUq5KrbEug/Sqe9I171CzdsROZPtOjGZoaEJiFVQkStn8fkbzffUGIrMFcwyBIkR7i
	 7FJES6t/Xr6N0+lkbSshszVgHjRxZ5A4zmzqSiZQN/ildvGFGIlxLCgg40V4BGSw5T
	 8cCERJhnkfKGA==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix up qcom,halt-regs definition in various schemas
Date: Tue,  7 May 2024 07:11:22 -0700
Message-ID: <171509107957.2289022.7925415725950914195.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240407-qcom-halt-regs-fixup-v1-0-a0ea4e2c178e@z3ntu.xyz>
References: <20240407-qcom-halt-regs-fixup-v1-0-a0ea4e2c178e@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 07 Apr 2024 11:58:29 +0200, Luca Weiss wrote:
> The original motivation is that a bunch of other schemas fail to
> validate qcom,halt-regs, for example like in the following examples:
> 
> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: qcom,halt-regs:0: [20] is too short
>         from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8916-mss-pil.yaml#
> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: remoteproc@2080000: qcom,halt-regs:0: [82] is too short
>         from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8996-mss-pil.yaml#
> arch/arm64/boot/dts/qcom/apq8039-t2.dtb: remoteproc@4080000: qcom,halt-regs:0: [32] is too short
>         from schema $id: http://devicetree.org/schemas/remoteproc/qcom,msm8916-mss-pil.yaml#
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: remoteproc: qcom,qcs404-cdsp-pil: Fix qcom,halt-regs definition
      commit: a0bcbce661216b9d9d00fb652b35f35da77b2287
[2/3] dt-bindings: remoteproc: qcom,sc7280-wpss-pil: Fix qcom,halt-regs definition
      commit: 16e204e958096d649aa1617433f31995a9c60809
[3/3] dt-bindings: remoteproc: qcom,sdm845-adsp-pil: Fix qcom,halt-regs definition
      commit: 4d5ba6ead1dc9fa298d727e92db40cd98564d1ac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

