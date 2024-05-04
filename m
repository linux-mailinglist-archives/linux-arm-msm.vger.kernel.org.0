Return-Path: <linux-arm-msm+bounces-19205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC728BBB13
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 14:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6F0B1C2101B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 12:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF03208C4;
	Sat,  4 May 2024 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ekw6rmWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44122EEF;
	Sat,  4 May 2024 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714824874; cv=none; b=FAq+cn7Li20nsxGEdHfo9Ip8liQfpjD12GKMZcBnOosJe1mJkAwaauD1InH71l5cHjPwPXYCtdt5prqEtwef0YfNEwPuFdLQfpTdCA1KGQ7IY/f+U6rS+z8GOj0866q07tPcKMCuOzD1Ob+jNo1+Q3MNRZyAa82gXzoP/sroL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714824874; c=relaxed/simple;
	bh=z88eMv/xF/Ek+JdWis3jLwaa6vsfEHEFdguAMsCL0PY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L5MwSA6IEi2+rT+GOLCGn+JqRD/7xZvLo1ZHh8ZMnWVZuK4bDgR6Ddu483N5BTVF8zaSKGWsoabttIgOe6khwCn0qtdhcqd3045GZPOWhSd1YHY4lK9hfU6K9bF6jqnumlOdSZQUuTmE66dWEgB6TpOPk34PiIu8Ygu3WHg1m0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ekw6rmWk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F0EC2BBFC;
	Sat,  4 May 2024 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714824874;
	bh=z88eMv/xF/Ek+JdWis3jLwaa6vsfEHEFdguAMsCL0PY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ekw6rmWkVJcy+BVOEnGIME5WWM9XQ1+ivRfRk9l+kM543RgR1zxGCHUjkxhKDAQsb
	 I3KN1NTzRXGqwGAvBO80EeJi9e1JytcPJVIETMPOZSwuLN2YPULbukE3TtP8xzCHlE
	 cfuUp02pdiy16N1JKxZdBKuz1GGDQCwiVtghJiD6x74VNVtCnfHhj46ikHV+bkQ8ik
	 nH1ekHHUJNfN7qCZxCn6DfFr98qAVG/0v2s9HpIiD2z7yFyJovZOirKtjkFax+t1AR
	 seuwz5mU0OZUC5MJC4hREwV9P0ai9zs04q3LfKS1SCKjsovYim69i57nXycvQr6wUG
	 Cln8UMr1B/6og==
From: Vinod Koul <vkoul@kernel.org>
To: andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, konrad.dybcio@linaro.org, 
 manivannan.sadhasivam@linaro.org, Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com, 
 quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com, 
 quic_krichai@quicinc.com, quic_vbadigan@quicinc.com, 
 quic_schintav@quicinc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Qiang Yu <quic_qianyu@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <1714494089-7917-1-git-send-email-quic_msarkar@quicinc.com>
References: <1714494089-7917-1-git-send-email-quic_msarkar@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/2] arm64: qcom: sa8775p: add support for
 x4 EP PCIe controller
Message-Id: <171482486317.28322.7019120026005248383.b4-ty@kernel.org>
Date: Sat, 04 May 2024 17:44:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 30 Apr 2024 21:51:25 +0530, Mrinmay Sarkar wrote:
> This series updates PHY and add EP PCIe node in dtsi file for
> ep pcie1 controller that supports gen4 and x4 lane width.
> 
> Dependency for Patch 2
> ----------------------
> 
> Depends on:
> https://lore.kernel.org/all/1714492540-15419-1-git-send-email-quic_msarkar@quicinc.com/
> 
> [...]

Applied, thanks!

[1/2] phy: qcom-qmp-pcie: add x4 lane EP support for sa8775p
      commit: 82b7487b8eb93e82ace92866560de3d4952555db

Best regards,
-- 
~Vinod



