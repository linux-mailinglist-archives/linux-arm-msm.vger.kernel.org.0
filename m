Return-Path: <linux-arm-msm+bounces-87464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236CCF4091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59DDB302BB80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8971A2874E0;
	Mon,  5 Jan 2026 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUAsESDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B0728688C;
	Mon,  5 Jan 2026 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622076; cv=none; b=tXgZWgXOiSJ+O5U64thZFIKrIiXlb3tsC3QTHHcCi0xejDTy2sZVfWOvAvGFGcRdbUNaJqNOAtjV7tW9r1UYik1RRpoo6gGKODpsWMqmURO8QkchUy/ufTCTcVj6atketoOXiXykyh6RKTORSRs5Bf0P5wV0g1i+ZPVVAv+4rWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622076; c=relaxed/simple;
	bh=KKwzmj9H2BnD78UzVWO6VmD+bqtcS1yCsoqh3DJz1CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CmHg9mldqPh/YIqAax/nytJ2Js0S//33+9B/bnAF2qNoVK1KTDpVQhVrknSQiqkd67k3Eiy15ZmkT3O5fc7ULyjYTMR/ddlsl6f4nhoLLMzA7dXcAF6SKDQxyGc9pln6dxXBkAzE2CNJB/m1b3+pBVPOygbh6yyHloHpz/sCbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUAsESDl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAFDC116D0;
	Mon,  5 Jan 2026 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622076;
	bh=KKwzmj9H2BnD78UzVWO6VmD+bqtcS1yCsoqh3DJz1CQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kUAsESDlrplXhP55fEBIPVKwvLy1ck6EkXVVwgQ7csYGms0wYpNhhCi81siqHY5dG
	 m2oxyMjPI/RS1vD/0RPdFEfQhBxQ3DVjFAQfMcWvdxSdXRfQYcI7bbjSxI6wrsaVBR
	 bf3jct7ZLWo5C279kxa3T/c/1YPWHLdX6U/SXutczVqjrqrkY9LUkWlaQwGktjGF2j
	 RxTcuiCxmCYH6wcuMWeyZ8K7guHzxjWflSERy9yGVzYcylQuF/WRmVWyzLOHIavUxt
	 0ON/sB8KMLQDZK9tvI6v3tCKbmtr2e3JXdjXmvvfX1z4/wsVymDUHNvDaFm1mSxhwN
	 VA/XTC+eTaHNw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] MSM8917/MSM837: Add missing MDSS reset
Date: Mon,  5 Jan 2026 08:07:11 -0600
Message-ID: <176762206412.2923194.13671718596625242836.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Nov 2025 18:17:51 +0100, Barnabás Czémán wrote:
> Add missing MDSS reset can be found on MSM8917 and MSM8937.
> 
> 

Applied, thanks!

[3/4] arm64: dts: qcom: msm8917: add reset for display subsystem
      commit: 2ffe611f896857ef542e60f9e1b3bc1869faabdd
[4/4] arm64: dts: qcom: msm8937: add reset for display subsystem
      commit: 3ad80ba51eb931c7fcba0bec5b1c9ca5f6d99cea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

