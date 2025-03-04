Return-Path: <linux-arm-msm+bounces-50099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53654A4D255
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77CC71894C24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D328D1F03D2;
	Tue,  4 Mar 2025 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgrtQo6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A504E1EB5E9;
	Tue,  4 Mar 2025 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741061359; cv=none; b=okSDJVg5jgv14wk/cUYlFMGYx8rq+WhGo+WsIYQBKdzzFVPi/tXfPbozkTJ/rOa3mP0eDndzexdMYkOSXnnKZz1akS2TXb5b6vq28KDN8auSZq+EGqh4fY9QEWwpUag1ykTeMZ1ygJs9X15rd/qq0QIJtxUkuarH8VS/G6rAYBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741061359; c=relaxed/simple;
	bh=1pDPnmgTFER/8SyBfOk7Hf5EB34ZaWQZ5KiYj7jhFhE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qy18YJUbZ/tcCwGDJ6N84IMvXlio1S8tDlZFibpZhln9W9gfHP9YAkJyEkmi9UkwTCn15++23oURteLJ8EmNurgsCSXOBH09g47dpUf2qUrWTc0a7EgQlUf6aTbsTDw+I5EfL1gXzH9UvoMRkqvczD0fMT3BKulyvB0AQzmFYBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgrtQo6S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DFFC4CEEC;
	Tue,  4 Mar 2025 04:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741061359;
	bh=1pDPnmgTFER/8SyBfOk7Hf5EB34ZaWQZ5KiYj7jhFhE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kgrtQo6SJCpCqV9K1g5jayKcYuhxM5rKmKK/0uLbOVWHn1e3L4SgsILKbUR9zwo2+
	 fyawiMmQvg2ocHH/RJkdURTpJLKGdhRBcovFViJXZTD+DvTWghVsIlA/EmobQm2VcS
	 tuShmVhFHz3KoVipLMSPiB+GGjY7jA7QNOzWlDNTXMU/rQV61DThE0TD7GEP5aKEm9
	 4WHcP4b1JaCMqfDd6jQLqmXKFqisM/YEi8EaY/SR8ttPkn67dEXdMeJwwYasgwUc7I
	 27bO6PaRmQW6NAd0E/54wF9OseLBNB2Q2JiuWl35DGtCQqJ29c+CQK4DBD1pKKrMlr
	 HML27e0fBnc+w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect qcom,ath12k-calibration-variant
Date: Mon,  3 Mar 2025 22:09:14 -0600
Message-ID: <174106135203.690218.15993293117970636357.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Feb 2025 10:30:51 +0100, Krzysztof Kozlowski wrote:
> There is no such property as qcom,ath12k-calibration-variant: neither in
> the bindings nor in the driver.  See dtbs_check:
> 
>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect qcom,ath12k-calibration-variant
      commit: fb03174d17ec98e939dac81e29b372c9b568fca9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

