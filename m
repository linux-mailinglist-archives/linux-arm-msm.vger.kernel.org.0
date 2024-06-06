Return-Path: <linux-arm-msm+bounces-21841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2778C8FDD4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A832B22738
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBC41EB48;
	Thu,  6 Jun 2024 03:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLKZFW2f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C931EB35;
	Thu,  6 Jun 2024 03:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644041; cv=none; b=YOAX3ska7XqBTSItNkwWZbPxjP7ROROiTmtYCeYaNXFIlc1/0vpuAsrvEOl0hHBj7nH1TmKwca/RENDkdcxcAmmqO3vaZeQTM4nplIWF1cnY8dXJbRra+nbzc+/OD4o9g+kvxE8/DlQ6s35Ll1RYMkvb/nRTcgxzwedWKYe/iE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644041; c=relaxed/simple;
	bh=4bCkcwrQXs2pNlc2d5MDyCMUvjCFXwkNy/jkk/px+i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7x3C8vnI+CxfIpG+VkANP+VzuIbAsjwX71fCIkx+s0J9HPMz9QQfl3OMxxuJUsFyP/DKZzJo/WlUtwJu7Ed5hOmJcxo5We7l0/CL9jM8w3y7PFpNbwBUSgByq9O7VEZAK1FM667fQKAhvUtDLSVnMOP3tdgn43XHwqKcY3mkxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLKZFW2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA8FC4AF09;
	Thu,  6 Jun 2024 03:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644040;
	bh=4bCkcwrQXs2pNlc2d5MDyCMUvjCFXwkNy/jkk/px+i8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aLKZFW2fjyChZS0NrcECVHncoQW1yOl/M6QsGZuBXZpkQ8Ca23nUhwQhWYyW++oDX
	 +oR5T1Wai5wFjC1kl3U+cDZPWJvmQIh4Mr1JrV95iaMUkFex0PkGjEXLYPdRO5PNnU
	 j5UZgmYmlsU9CDSDt+ZoW/uiN4nVy7MX8brtXf235rFLOTDzjxr0lU03hksRNPyeUh
	 WOJo00D0omuEq7GjzFSS2qEaGEpdw7PPc2Dysbj9xvT1WbvlB+e9+nidpXSVhh5nZ4
	 sLSXPFEL5o2iP5Ohh+s+6/ZUhy+z3GB434HcKUyBnUOo1CNOosgHvGJgbDaZHVWmjE
	 6XUowa8eTln3g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Fix PCIe 6a reg offsets and add MHI
Date: Wed,  5 Jun 2024 22:20:27 -0500
Message-ID: <171764403338.730206.16051144400404145494.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240604-x1e80100-dts-fixes-pcie6a-v2-1-0b4d8c6256e5@linaro.org>
References: <20240604-x1e80100-dts-fixes-pcie6a-v2-1-0b4d8c6256e5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Jun 2024 18:20:24 +0300, Abel Vesa wrote:
> The actual size of the DBI region is 0xf20 and the start of the
> ELBI region is 0xf40, according to the documentation. So fix them.
> While at it, add the MHI region as well.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix PCIe 6a reg offsets and add MHI
      commit: 8e99e770f7eab8f8127098df7824373c4b4e8b5c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

