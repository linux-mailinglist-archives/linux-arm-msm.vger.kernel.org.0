Return-Path: <linux-arm-msm+bounces-61045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9BAAD666B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA1753AD797
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88871F7910;
	Thu, 12 Jun 2025 04:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fz3HgwJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F01F582F;
	Thu, 12 Jun 2025 04:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700858; cv=none; b=auUlDb80wDr83oq++Iz91huINh/JNCsvbB97gfGmOVsukM5/LBIIy626gWgVl8LL6CMrLNZZ55iq1qQLdTHe//UMHOSNB9FLywMzs+J9F3coEOVl06zUg8CsQrO5L7wqIHfb0NKSgueppiEW3y0iWlU0IE8w1++c4DoMTPXyLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700858; c=relaxed/simple;
	bh=RVH6pdk8kg08pnsSb/u/BpAoPWRLJstnPfSnLVhBu3g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqK3Qqcdf6RupeG7WBA4+R5H+nIWsI8FUya76ZKJV0G1JEYqrxyHm6Bhev4FWNBgsF3C/cWQ9yfSbbjNEr9rf5ZQVr+evk3ywyHsujAnwXkw3svfmXuUJX1I0a5/rRCtStKpaIPRIEyylin+VMGrK5Jw2Jxc+kBaeJX/lB6QUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fz3HgwJf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1107C4CEF4;
	Thu, 12 Jun 2025 04:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700858;
	bh=RVH6pdk8kg08pnsSb/u/BpAoPWRLJstnPfSnLVhBu3g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fz3HgwJfRmbP5W95/P9os9xkzHGq1WFJijsEk9SxGKOBCFwLc7/bhUlwN7Rdwgztd
	 5PaQM+gerayPb1Xn08Wl1F1v1sDvyHVhGzu5OFRjWte0In5ABXHOTpjL2razDR7GF1
	 M7P3VX/VSvF8/2aKp6ZBOqfH/b7FprEei2n37tNMQlsVGTWNG8HklKXN19VXuDpokH
	 sV8EeoPW25HUps8fxybyTMQlOMphCrc0TBnF6xzplAKjwjQloPtgrWXXmF5zdtFn8O
	 YwpXQrmQWDf0O8OpCMfvsWkwKRZ9F3K21GspSukmq7gTwLDbJKXL+NB02+XdRPAcYK
	 GMBNbHN12CtfQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom: Align wifi node name with bindings
Date: Wed, 11 Jun 2025 23:00:38 -0500
Message-ID: <174970084181.547582.1484951567557967500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424084713.105080-1-krzysztof.kozlowski@linaro.org>
References: <20250424084713.105080-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 10:47:13 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   qcom-msm8974-lge-nexus5-hammerhead.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: Align wifi node name with bindings
      commit: 25dcfe4042aaa96b3792ffaa933314a4bbebab98

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

