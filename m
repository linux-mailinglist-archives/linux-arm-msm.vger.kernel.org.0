Return-Path: <linux-arm-msm+bounces-30333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8E9966F0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 05:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BAA91C21DA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 03:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC5514A0B8;
	Sat, 31 Aug 2024 03:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGJrIQfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A0A149DFD;
	Sat, 31 Aug 2024 03:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725074339; cv=none; b=vD13xooomVA0e23M2STUOj4auiW03OUfzEZBLySznepdsS1p9PC3of3bJdHq5vJgeo5uMX0QQEvB5hY37wYJrLHXbyRsta1vKdyXl5n0fX9xy7UE2g8EiElTAy1PRrOWspGT2OBnBZmyl1sWl+4udd7jBzJ5Ve15rAdlQoNwZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725074339; c=relaxed/simple;
	bh=6GDq4O8JisAvvgleto+qPvuk9YLTFutjBjf+WZY5Vr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g3Z+/kgdheK4JwYKnBLLBFCNHDS3vgwEkARJvBZArSGKGHVBr+lCGzsFQrxEsJJ38mGnPtc18rP8wpjlBQCZmAqTNoFou1wxpaDnYZO6ZVz7CHXGvO0WesC1TEEvW5qIGRjEVvSQ0KQsK4iHnVSe6bsDeoFPKs3fhUr9xfiMr/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGJrIQfF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5B6C4CEC4;
	Sat, 31 Aug 2024 03:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725074339;
	bh=6GDq4O8JisAvvgleto+qPvuk9YLTFutjBjf+WZY5Vr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tGJrIQfFTlhqPKSaEDM4PhzybFhVsNCfH5cBtTlbuOuLrKwnljEbNt7IPg7T3LX3G
	 LXc1n1l3yKZiNoXsINrH4zPic+AdOklC/SPN2zdtBYcxG3clfVS0YiOM/10mO+06dr
	 70OPXi6vGSk5e08PsigMIoYd1TLysD/lzQbWAlk/yjX9dmgAfUOTh1YuqY7ZcxvvfB
	 KhhuiD7//5tPXwLqCksZOdYxPSY9l7F3JxjZeB2Av+LnBPxkBdK8Cbgv7xUXzwr7Ji
	 lL05soWdwA+LT3r72t5IKEXo1PB9r1akpCAz3hst3z8ZzXfvuisnmH7ZBZYdeXwKfW
	 MxjAADf4kFuug==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 0/2] ThinkPad T14s Gen 6 support
Date: Fri, 30 Aug 2024 22:18:39 -0500
Message-ID: <172507431831.12792.2576325909388945717.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828-topic-t14s_upstream-v2-0-49faea18de84@quicinc.com>
References: <20240828-topic-t14s_upstream-v2-0-49faea18de84@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 28 Aug 2024 23:31:59 +0200, Konrad Dybcio wrote:
> As good as the other X1 laptops
> 
> See this page for more hw info:
> 
> https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s Gen 6
      commit: 7ad660f9991d3f9029b55c112e728ef43170d402
[2/2] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
      commit: 7d1cbe2f49854a9a5f723e3932da7da1b7e3c7b8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

