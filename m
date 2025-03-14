Return-Path: <linux-arm-msm+bounces-51500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B8A61BCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1983E17BAA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39AA21B180;
	Fri, 14 Mar 2025 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSgEBaN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5724B219A7C;
	Fri, 14 Mar 2025 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982522; cv=none; b=k0tw2VSmSgGaaNfSnAMb5BT8XJXYVS73qWZGEDuh+2dbZAI9Up8fePVTkrHKMaU1ppjJQ9y1tr3KOQw1NdSr1u9WMfoxYokMGXHqeeJwqkCUJAVag+aUg3LLQ+8c9FACJMzjqtiAk82Ayg9QZeW6nLuItsZFhkL3fRcVe/MXab0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982522; c=relaxed/simple;
	bh=L/wNrfJujNo0e7Nq92yVylYHZ64YwSHHEk2YnsPk8kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Junx+OtsayhVAiA71mLuaEorcR3vd+oT5S4R52IlzqDe6gFRKXsUbM89/iOM8qDLuI6ryxjhLHntQu+PPz9EE2lD9r6K3DVadT444Od0qFyDVVtT2qvHMutllDjD2aDuxFcHQ89ZEK5qsJzmmgolC1K/56dJRcHh+s7wMsYWe1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSgEBaN9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A608C4CEE3;
	Fri, 14 Mar 2025 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982522;
	bh=L/wNrfJujNo0e7Nq92yVylYHZ64YwSHHEk2YnsPk8kE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSgEBaN9xKsnGqAq4Nk0fTXBAf90ToyjqS+gHV+Wn4rKcGCyTUbXa+rQCC3Ikj7Qv
	 vqm5kXuFIHdhAynsyaGDfYOpxxdUuUY4TUs1xG9ZBp10I4GDzRje51sNCgB6Xy4qbi
	 5r/5B79IXZOn/zgFWmdgMTEvU5cJWLXusWUsC9DWTtq3OslftDM85G/+a/1e9FKM3S
	 5FUhyob0Fa5IJMER4VLi5l+NLbLRsxmFGM3IqDs7jtwIzwahKXOH2eyF8PxCFrP9Ys
	 Rbgid0gfIGEjij3kVwzziN3cGP167a+mv5EyBIa69+pX7VMBpBxPyipRa7eFSFK2nf
	 KDZGTNVsnmsYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v5 0/4] Update LPASS Audio clock driver for QCM6490 board
Date: Fri, 14 Mar 2025 15:01:14 -0500
Message-ID: <174198247876.1604753.8724721598084629596.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
References: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Feb 2025 15:04:53 +0530, Taniya Das wrote:
> This series updates the low pass audio clock controller driver for reset
> functionality. The patches are split from the below series.
> https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/
> 
> The QCM6490 board requires only the reset functionality from the LPASS
> subsystem. Thus separate out the driver probe to provide the same on the
> QCM6490 boards.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom: Add compatible for QCM6490 boards
      commit: c16e576b8aea9fe985ee9e368ea5fd37eae47b2f
[2/4] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490
      commit: cdbbc480f4146cb659af97f4020601fde5fb65a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

