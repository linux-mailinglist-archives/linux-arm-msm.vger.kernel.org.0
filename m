Return-Path: <linux-arm-msm+bounces-56170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A8AA1BB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 21:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80443986DBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 19:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457F125F7B3;
	Tue, 29 Apr 2025 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/gTLNeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384E22F3B0;
	Tue, 29 Apr 2025 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956698; cv=none; b=lYlVhHdsmrno9djs7Y1hknMTWAB6ug6rUNvoqjG2MMfqk0j86MD4xYZrNTkV5WNKij/HVOPaI22sS1t7nHCLS/Ht59Q1zLRiZXYOxgsImiRGFG2TC0G2z8ZCHAZe3vNSKS1Ob4d8iUzHoqMbwVwFb+/qRWUL3ZM0brh/XtLUg0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956698; c=relaxed/simple;
	bh=mjC87Yc/+AsckBGuGnpkjGI8z/kzCyty5isq4btuaEs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=g57VvhjoBWjFs86esIuUMt3celtvIqN1YD4ZcIyf24gPmTrvzQI16ypExMSCMt1xQTRkVpZlKcKbPDl3AEIgw88MWjIk+xRnvjGtc8qrNrEb6VtcRyjkb5FW9N75Y4M6geS5QPt3POvsMifa5fSQbubtbyBDcnOB2NT0c2C7pcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/gTLNeM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6E3C4CEE9;
	Tue, 29 Apr 2025 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745956697;
	bh=mjC87Yc/+AsckBGuGnpkjGI8z/kzCyty5isq4btuaEs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=I/gTLNeMntoaq0xnLQhQWGxERErjnKu+0wyGVPY5wKg29uS234DSMBcSuwaBvAuzc
	 NuA/RFpkeZgAn+SQJ0p3lY9gyoaReKLBhP75n+FaZAFrl2PxcWVfYmeJllAf0S3fcH
	 8tMpkLKvbpQwh3OdutYSLvgYkNMReQMdYNOEijPZCzqKM5KLddukqaVJH2ry70rpyc
	 2avQJBQSH8bL83bDzZwoPKtWEtN+n47Knij+Wd9l20QBcHIizdhWSCgPJbPvm2fluM
	 YEv5UaNYXOjr1t/xf/jo/SqccBFIc8aHVOM5lmxYp2p3j3APqxUa+RpR+DrqjRAAHG
	 S8LfMjfA4oG7Q==
Message-ID: <ece226eb37c3a7c6d37798798332ea70@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250411-qcom_ipq5424_cmnpll-v2-2-7252c192e078@quicinc.com>
References: <20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com> <20250411-qcom_ipq5424_cmnpll-v2-2-7252c192e078@quicinc.com>
Subject: Re: [PATCH v2 2/4] clk: qcom: cmnpll: Add IPQ5424 SoC support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, Luo Jie <quic_luoj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Tue, 29 Apr 2025 12:58:14 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Luo Jie (2025-04-11 05:58:11)
> The CMN PLL in IPQ5424 SoC supplies the fixed clock to NSS at 300 MHZ
> and to PPE at 375 MHZ. Other output clocks from CMN PLL on this SoC,
> and their rates are same as IPQ9574.
>=20
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

