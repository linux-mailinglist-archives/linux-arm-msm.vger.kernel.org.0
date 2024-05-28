Return-Path: <linux-arm-msm+bounces-20675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E67DE8D1296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A21BD2840F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4E51804F;
	Tue, 28 May 2024 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/A9t4sv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8955C17C68;
	Tue, 28 May 2024 03:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867162; cv=none; b=QlMrzAtnuAiLKVsBezJlMpzU9VXiKLywuLp9i2n/hedZ2+TozyErX9WzhkH6u5aBkcLFv4b3z2XBgJXJzDKFqDsI1BY1bD5ZmWN5tsiTYVxMx8ZLz8f8oAX+u9JayTloO0/RwYOSqU0oco253ngjl4hwuDjOkjzBCj2Rc3gB2yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867162; c=relaxed/simple;
	bh=eiUm+kIZeIpJe6XRMZd8S8x0ZUBCyNpaGUwQxPNTbOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kitrKELcLWa+brzOcUVRFxC0tosewqgpHYxt6y1REqZcXUHI82LYxHuBrMpce/Z74nR3LdcI51MKwM+f2u+pvvEkyQoUlBvobHZiaBxEiVzaDWPkae6ZIzaUHxlNICAZMV5/cX2o7bVar8ZS7MROfMWU3RAfrdI4RzDK3oIBUwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/A9t4sv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B547C4AF09;
	Tue, 28 May 2024 03:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867162;
	bh=eiUm+kIZeIpJe6XRMZd8S8x0ZUBCyNpaGUwQxPNTbOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o/A9t4svn7HMUBzrqezXGMU7V5XdM+fXtPVZS1VatCJLNg8bMXQlPLw3cuV5Hj4gA
	 DXJfj7nl5T7RJLfMHIcIOaQb90cqRdVHLS5Ixp1N0QTkbt3zu/WIQRAE+XDdSt6+Fx
	 q1IRKr+RUZl4bi42ZqZ0k0JaoagJE8i1TaJR0nidi99D7tt8BzofOCblR1qjxdzWq2
	 fpW+cKV9DFKJ+5OIwR9J2RN4ZHFoOZE5eBX8HcsklIElgkiICEx3X+NU3KM910LSnf
	 d1KHuKj68HhnfkE88Bak44qCAlyoVIjvQedKBdfYyp/euphXSyGTy8bNkCRCnuk44r
	 g0n7QcEXiMO7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] MSM8976 MDSS/GPU/WCNSS support
Date: Mon, 27 May 2024 22:32:08 -0500
Message-ID: <171686715159.523693.17319173164690407157.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508163455.8757-1-a39.skl@gmail.com>
References: <20240508163455.8757-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 May 2024 18:34:33 +0200, Adam Skladowski wrote:
> This patch series provide support for display subsystem, gpu
> and also adds wireless connectivity subsystem support.
> 
> Changes since v3
> ================
> 1. Minor styling fixes
> 2. Converted qcom,ipc into mailbox on wcnss patch
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: msm8976: Add IOMMU nodes
      commit: 418c2ffd7df9bfc25c21172bd881b78d7569fb4d
[2/4] arm64: dts: qcom: msm8976: Add MDSS nodes
      commit: b0516dbf8e218dede2fd2837ca82dccd9cdcdafc
[3/4] arm64: dts: qcom: msm8976: Add Adreno GPU
      commit: 00e67d8e80f06bb848a3dd516d06e2f040b7d8f2
[4/4] arm64: dts: qcom: msm8976: Add WCNSS node
      commit: 45878973229a93f0f42aa048ac8c6223af010082

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

