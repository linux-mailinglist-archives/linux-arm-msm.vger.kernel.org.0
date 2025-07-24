Return-Path: <linux-arm-msm+bounces-66621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C4B111B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 21:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC01F1CE7EEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 19:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E602ED85C;
	Thu, 24 Jul 2025 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jeg8Ev4V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9EA264F85;
	Thu, 24 Jul 2025 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753385462; cv=none; b=Rofv7F7QX/Fx7Mn/cibWDEdUHbJt9qRjTGXWxBF1xubZSlRppfT/hjl+NPMfvmjVRF4W+sCEWOaWQj1QV4tXc1D3pGtBuKNeYJ2ha+HmVbzspdJMkKdnKHxhNHefc7OeGul+xuHV/Xczsz+7TJ2d1kBaHWwrYeFMMUG6ibV62Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753385462; c=relaxed/simple;
	bh=llWCtncnUYPpfYL+/ouKjYeXwgpe1VXhI/ECsEkGnPA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fs9IHFBI2/6SEBD+dZ9q3/pHbiwNQwMRYAYyrDpbz+otzIj5fyN+Wv7ikDO/40N9Gnqd85gT8yxIRSTySeel0uJhuvGsKfuwYIeRgqhnKX4qDcFqIlWcO6cLkQLxqZC9FHsJ4Lo1iQ83PSWE9+yLTCH+q08FuHQGz9KAKRC2XNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jeg8Ev4V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E25C4CEED;
	Thu, 24 Jul 2025 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753385461;
	bh=llWCtncnUYPpfYL+/ouKjYeXwgpe1VXhI/ECsEkGnPA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Jeg8Ev4VXAtRUWVLz1+vcC7SfpxLoIo46YXA7pc+5L4ILaf4lBE7zzwHWMbE7vlpy
	 r99LXanFOZbGDCWI1CN+SwTLe+53du6ElYE9fAaDVKG+I0HuwZJizEj7bMz1eTIsIP
	 netARHNnqG1D4Cidyj574nVcMYlKz0h9UMqxZxAA2Xxm7jc8vekKKLO71ktPy3buGy
	 z3Bz+b2Vlmx7KcOYp3oj++vl5/kr89g/mzE98UN3sU8KAiUE0gme5evPTZ6VzMIV+9
	 baoQWCjCshjLz8IW8gbIm9Unxyr+3ZtibQvJY9kJbkjZ0Mdb+y17CzlSEbb29/I8Ik
	 m/mewzbkmJLrw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250630232617.3699954-1-robh@kernel.org>
References: <20250630232617.3699954-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert qcom,krait-cc to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Thu, 24 Jul 2025 12:31:00 -0700
Message-ID: <175338546037.3513.3329830699030075457@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-06-30 16:26:16)
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

