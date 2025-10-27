Return-Path: <linux-arm-msm+bounces-79041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19CC11C92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80FCF5672C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7A133CE81;
	Mon, 27 Oct 2025 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdiQBZ3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BF933C52F;
	Mon, 27 Oct 2025 22:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604510; cv=none; b=V7a4h/MkST7CZwo7y3XNgUkfw1Qrjfk3WY7Zvttf3clSATSD7gEW6mK1rsnS7nfE8ZVoKLG8luJiI1GOkU2Ku+0kMbolXIoCDWWpJx3d/qRnRvtpOraqa770i7tAZPNIQXaZ7JF6fUgBIPlZRflXTFO3APpRSpGtcfp+Sa66IBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604510; c=relaxed/simple;
	bh=OLnBAU9ZShSMgLQYlNhSziv6+8MVbd4t59C0mC4ZQG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TdidHJi5iQ0NlZMo3w8xB11it1ZOqk3GASsD+4OWk7bCm0zYIKKHVQGHGjJtUAjzlIV6EK6gIcfFzfXuCGMOKvb03ZS3QeUp9XXqH92mvKwtjovuPQwOpWXde08lcmigjwrEgonqRcbQM4+fsYOYlikhRBdutluxf/zJi7sNyls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdiQBZ3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E15C113D0;
	Mon, 27 Oct 2025 22:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604508;
	bh=OLnBAU9ZShSMgLQYlNhSziv6+8MVbd4t59C0mC4ZQG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TdiQBZ3Z/x2QhdyXgS/1jkCWx6TlwLQ1l8bx8jDqgM5cuLQL1jxq3ZRrXuBvVGNyU
	 hUzcf2l8RexlSWyoxuK90MtVgRDGJE7QSSBeLURUktQYgJiXEbQZVDLqJlYrSY8UuK
	 kX5Dc6TrLoEUkFeAKp1lhIUT7dpSMyryx+eIwTsiyYw/ZWlGsb0Q9Ub6zOIiYi8910
	 /djvklGqYCUMHOEEiwPWVzQFJpnOmwDHjyS+WjUheR3DMmpls1m7Eu1ywoJk9aztsU
	 ts1bp1kJxIAe6ac/935q8YaeCmXvg01abbdgoEtLlZ8penjZKUZt5UBPtfucndOtsU
	 a9vq6Ivkyq1xA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Describe the full 'link' region of DP hosts
Date: Mon, 27 Oct 2025 17:37:02 -0500
Message-ID: <176160465213.73268.6824815295833171554.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009-topic-hamoa_dp_reg-v1-1-4c70afa5f029@oss.qualcomm.com>
References: <20251009-topic-hamoa_dp_reg-v1-1-4c70afa5f029@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Oct 2025 14:59:18 +0200, Konrad Dybcio wrote:
> The regions are larger than currently described. Rather inconveniently,
> some control registers, including some related to USB4, are in that
> left-out chunk.
> 
> Extend it to cover the entire region, as per the hw specification.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Describe the full 'link' region of DP hosts
      commit: 752c3765a952bab9b20d4fbe75ef855dff546c46

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

