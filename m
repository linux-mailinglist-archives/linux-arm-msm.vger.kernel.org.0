Return-Path: <linux-arm-msm+bounces-70501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D3AB32D29
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71E981B66FA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B4122DFA3;
	Sun, 24 Aug 2025 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZsm0boY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06591E834E;
	Sun, 24 Aug 2025 02:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004171; cv=none; b=PEIYra8hfWWiMzBmHY9naE+IOPK+pbe5c1DnFqV9R5C5XlK6rAcl2pmWipm5Mtj4kzjQzpHgboou+6L+6Gr/BYGduHYBUpQsBV6blN08xsjEtQS0thTDlpxju9xQcQYRHJsLRACuBlC+Hgzobblc/KrXCDeMFi46T6d+Tw2HSZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004171; c=relaxed/simple;
	bh=4kGtVLcKFFPEl7NMLob1LNGrRz2CyAz56jiAgp5ZBmc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKd843LrG99nd1pIBQ3Svn1XnCeSq/9iTs+e0CSbzKme5Qj2TT9Kse+yztETycRzTibZvFFRE5WeKOArgNT2IY1gI1KtCMxCGuJATOhjyRh4OeukR0upnX7CCwwxTeUudD55KMQy/XJUEhXGffP0rGq9gVOUG4c+zT/29lp5dAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZsm0boY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1FCC4CEE7;
	Sun, 24 Aug 2025 02:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004171;
	bh=4kGtVLcKFFPEl7NMLob1LNGrRz2CyAz56jiAgp5ZBmc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GZsm0boYhqucbmOZrQmrBWdsUf+cCK1dAlsHlthPxeVQJ/rn5i2xEGo29JJ09OPUQ
	 IBfqFi2Jd3uRleErlAqd1AsEplCj5gGensEDa/rGWgYeUOioSZWlcbtEpBzNmllGs6
	 lcw0XyUsksSqJju+S3L062Hj9Wd2mAUTA9lKEAqTQnj/+M/f882nKgJ90zyv/uBKzx
	 2cLIRDCs039E7Wsy3aNE1kzAh30Y5Pc59Im/cI1fgCpXlHAvCdnA/PuroMT/bJTMYV
	 FBeCdNM6X5scLyOS+54DmyauuQDZNu3Ed6AwAXrBZSUgH1Xym9pPyY7x265shQgX0l
	 9ed8DCk6R2xeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Add speaker Soundwire port mapping
Date: Sat, 23 Aug 2025 21:55:44 -0500
Message-ID: <175600415287.952266.12481885317656431450.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250820141233.216713-2-krzysztof.kozlowski@linaro.org>
References: <20250820141233.216713-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 Aug 2025 16:12:34 +0200, Krzysztof Kozlowski wrote:
> Add appropriate mappings of Soundwire ports of WSA883x speaker
> to correctly map the Speaker ports to the WSA macro ports.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750-mtp: Add speaker Soundwire port mapping
      commit: 013632a410873d2ac538deb981780407917b2200

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

