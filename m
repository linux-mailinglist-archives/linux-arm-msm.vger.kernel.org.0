Return-Path: <linux-arm-msm+bounces-57557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498AAAB2C1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7266116F824
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFAE265CA5;
	Sun, 11 May 2025 23:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfCdJBMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6FE26563B;
	Sun, 11 May 2025 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004519; cv=none; b=alkNGQT/wlDiKmyX4zH4hTrx3q6CXRkEWrM2cXF3qnnEbndxmY50dOgzJoqehjnxTQ/HpfWjGx+9WrNETiPLZ7OFpuPqdlFm0dtUfVCDkxGAOC0DV3hz1klv2U2gZW8HLQM1eFfIJXMpRkncc1LX/y5sev7YfW7e9NU1u1ud1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004519; c=relaxed/simple;
	bh=OrlTbezY7R929zOZeJLr287u/Dj+7atyX4EBOKwXORA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMo1+GxYGpQxz2MoJt9k1ZMegUIDZYGYJvdKPuBHMZsxVxmlW9pOQy7Heoe8lrRtcdr9gowERsAYOlB9tEodbQmG4NqiP4qJlFzoBWa0Sgx0VhQW1lq03wIVagF/rBceW8SkFC1307AX/yj7cGTLdY/kYqK+x+OIy2vTv1aX5xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfCdJBMk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C92C4CEEF;
	Sun, 11 May 2025 23:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004518;
	bh=OrlTbezY7R929zOZeJLr287u/Dj+7atyX4EBOKwXORA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WfCdJBMkKC9j804C8cKF4VuKfWTDOqTRLlzOtWBTdSZhgBIJhhdrsLit93Rk+8t+o
	 oZ+o82tZtvbS4ggu82qy5dLXGrccou7hdu3kevB/RU2DAO91l8lkCaEi4i9h+DtxT+
	 jyKEfRhCjnSkZBO7PbMlUQn2u4OlYaFztUqJKgybPaRlz4ARF22RHhr1Xt5e95aPQF
	 Q6YYWdj9c/w47032Bo3bNA4CuM0cCtYyPdt+NimZG87n8mgngfBFO1fmM3QPNRabeK
	 cAw58nnkQjLYfSc4yQbNm3+eqh8uDq1oYb599ieBcqE3LNdaSLsGCSi8Qguyndo0nH
	 56nn9OzO4NEcg==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Felix Kaechele <felix@kaechele.ca>
Subject: Re: [PATCH] arm64: dts: qcom: msm8953: Add uart_5
Date: Sun, 11 May 2025 18:01:38 -0500
Message-ID: <174700447983.10930.6205889036798876842.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406-msm8953-uart_5-v1-1-7e4841674137@lucaweiss.eu>
References: <20250406-msm8953-uart_5-v1-1-7e4841674137@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Apr 2025 15:52:02 +0200, Luca Weiss wrote:
> Add the node and pinctrl for uart_5 found on the MSM8953 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8953: Add uart_5
      commit: b7bc69b90736a281490d535c6786b6c23c1b22e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

