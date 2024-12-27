Return-Path: <linux-arm-msm+bounces-43457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3129FD019
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 002517A11D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4ABC13EFF3;
	Fri, 27 Dec 2024 04:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7TfDKVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9667B13D619;
	Fri, 27 Dec 2024 04:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272936; cv=none; b=l9KOcVPn2WU8y5oLE2B/ilWh4K4dvfgG1Y4Rur8yHEsMOMOfGGO4sRQTlY1T0neozXI7UwWp/U9gZrgXbpbNe3pVf3ronCCFqIMyKtaSElxyumw4eu5HBSiKuNSBWiZGPBpkS2H1i3VSnLFVA4H6LJSfrzUrtBQcoLCxciv8bjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272936; c=relaxed/simple;
	bh=ZfWu6w+vrXxfe7CBtjKg2t8Fj4AFezfNBWRzXcvDc10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nqq6LhTmK3vELWmWbM7+J5yZsc2jRsB0DDEe7W7ml683LDj/vMJ0tyWDOfW4CzS+sGvd3YnvkjxOnNIrY8vhWEPvAUF+JMJEMRPMoXtY84CwBj2Wmi+vAtYlOqfyIEqXTrLbkrk5VbyXeo67R5QP2SQUewxNgGpXDDlp9mXtTlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7TfDKVa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D7BC4CED7;
	Fri, 27 Dec 2024 04:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735272936;
	bh=ZfWu6w+vrXxfe7CBtjKg2t8Fj4AFezfNBWRzXcvDc10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7TfDKVavROI6BPXeojVvh5106RfBgC/GG4rjzZwfTeScfZ8capPzj4FS9nFx+xK2
	 boywo7Att62SOiwQ4Hklb2D7/ZQj7e5Gx9Y4gZIkbj3/k1tiOuaC30xhE9uja80/jH
	 RM4BaHp3eacD9pYp8r/jIfP/iKCw8Zs4KwSmn4FpoOJvjNt+v93Pu7FdZadssWIcJq
	 pqYKvfLGiT9glzYMCyaNCtgClmTDbbAHQpvt7pUhrPIOm48k9nXdKEgoTsl/KSM0yB
	 NM8WjQQTpkVuuSJfP8E8PNrSZkHaF4J6E/7BWECd/ZDJfB84rMhHVCFInxB7KVXHrn
	 ZJxnTbezincmg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
Date: Thu, 26 Dec 2024 22:15:24 -0600
Message-ID: <173527291949.1467503.10901425014648174293.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>
References: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 26 Oct 2024 12:58:13 +0200, Konrad Dybcio wrote:
> Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
> required, as the GCC driver defines and instantiates a bunch of GDSCs.
> 
> Add the missing dependency.
> 
> 

Applied, thanks!

[1/1] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
      commit: 1474149c4209943b37a2c01b82f07ba39465e5fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

