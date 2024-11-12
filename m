Return-Path: <linux-arm-msm+bounces-37698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC69C63F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 23:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AED1282FCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 22:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A9B21A6EE;
	Tue, 12 Nov 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQrr8D9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B969C21A6E0;
	Tue, 12 Nov 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731449012; cv=none; b=pl+d4nllM0H5gAYa84NB2AC95PrJHK1pe2aDCJCiABhDdRMiOz5jJYTLJV+ghL+7/S/s4+M9+0TeN5XMDjomiZrqOx0KYPxxR3z1rz+y2GTW9wv36ALLc1O6SlNqAUSw18ogHupMsf6UYPL+DyaNMWn6RlFGRI8qc3rkJDc3C6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731449012; c=relaxed/simple;
	bh=LbSbP0PRiua8I5A7NUpgiKh8EyVozbYXD8yG9qaleYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqKfU/6axXluI+0EAHK3p7bgv4eBRlMKT0hxO3MXkaLJ01a0IIqpQMlUuFrP9o6ggV1aR2tfXbl4/lRRXm9g6jdaLZwMOxR8HxSQQsIcC9EFC9AQQlXei4VjqeFtz7VQf4/UmScylQYlWYgz2dzZ7UhwMq5yNoZO6R5YJPJqpB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQrr8D9/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616F0C4CED7;
	Tue, 12 Nov 2024 22:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731449012;
	bh=LbSbP0PRiua8I5A7NUpgiKh8EyVozbYXD8yG9qaleYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQrr8D9/ccepWOov6APxDpo8MxmxPr/DRrJz6vzNhh0BP4mBp909G6uABj/M3xpi3
	 JCNbHn1V3wJaLt73fldERN7xNf4/0KIJUJlTIfe0rovLLT6NQofCRpp1QEV5RB8axv
	 puy2Z7Nl078qmxAVVIqghlgOthIB6HrtZs0+gavGgyF9Ju0+3hg2gacWE4HWZ0adG4
	 rikBxTNlLITPYbnHYJ11viqSYutnlLOvVOzclnedYU7ZDDcrTZ94zmZ1mKGRWlYQZr
	 /t2PclcUqnX7/D/a1uYjrf+NqGHlP9ns+rGnXDAfad8BnfymFBJi5U4n6mF3aaoYKq
	 xWRSvVeBpIVhg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: remove unused data from gcc-ipq5424.c
Date: Tue, 12 Nov 2024 16:03:25 -0600
Message-ID: <173144900024.331728.6908534437712999754.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111103258.3336183-1-arnd@kernel.org>
References: <20241111103258.3336183-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Nov 2024 11:32:51 +0100, Arnd Bergmann wrote:
> The newly added driver causes a warnings when enabling -Wunused-const-variables:
> 
> drivers/clk/qcom/gcc-ipq5424.c:1064:30: error: 'ftbl_gcc_q6_axi_clk_src' defined but not used [-Werror=unused-const-variable=]
>  1064 | static const struct freq_tbl ftbl_gcc_q6_axi_clk_src[] = {
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/qcom/gcc-ipq5424.c:957:30: error: 'ftbl_gcc_qpic_clk_src' defined but not used [-Werror=unused-const-variable=]
>   957 | static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
>       |                              ^~~~~~~~~~~~~~~~~~~~~
> drivers/clk/qcom/gcc-ipq5424.c:497:30: error: 'ftbl_gcc_qupv3_2x_core_clk_src' defined but not used [-Werror=unused-const-variable=]
>   497 | static const struct freq_tbl ftbl_gcc_qupv3_2x_core_clk_src[] = {
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: remove unused data from gcc-ipq5424.c
      commit: f1f49cc505bc998d7c13e5a518d027419a21fbae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

