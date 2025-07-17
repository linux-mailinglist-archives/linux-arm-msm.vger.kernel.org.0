Return-Path: <linux-arm-msm+bounces-65351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C18B083DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ABCB4A8633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3A121507F;
	Thu, 17 Jul 2025 04:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNtWBlir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A7214A6A;
	Thu, 17 Jul 2025 04:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726684; cv=none; b=FjspDlVVAiaUhKpd6g6Vm+fxeVqbFlh6Y2DTc1Zpj4jJn2LOT8jzbc4oRO5mSe5B/8nnyg7tmjGHrjCzh09AFofPpam1juk4iXhbvHXhfMPZYqz+sT0sMP/scufLyDvJp6+7TXcDIAeNUwdX6HJtNDxds8nwpkC0DZ/H5b1prLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726684; c=relaxed/simple;
	bh=OLNcyRBsmvv1570wOR+hb8QrNgW9ZwVyUXZaiBQ2xhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tvfG1PU4a18b5gKepqBN4zEMKvIkSz2zUjuV2NfGaAS2P31HrMUM8gPqeSYMiJXKYdYJMKEasALBpAg6G5Ms+NT/z+YJZY1pFKtX6QzJIpdwaHiLeWbbwKC5EjFWx/zTnXNq1q0MoKoDYvQdlkUGE0Ovp59vBOAhdIU34FbtGHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNtWBlir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF52C4CEF5;
	Thu, 17 Jul 2025 04:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726684;
	bh=OLNcyRBsmvv1570wOR+hb8QrNgW9ZwVyUXZaiBQ2xhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uNtWBlirLWMpCVbvMt8iQsV5s1XjboLugjFt5EPfvu3ZHYyxRzcvFoKrdJxwSiiMv
	 4N4hkfGqCbwyXHtVUskPyM9TyISs6AEOZpDy/hhCMQOJIWZQbXeH0ze4fUEDtgriI+
	 eJzUIjecCcdZRX/zJYqe1zOcJRIHATgbdY61A/kzGTJCNCRjouvST9dY7gJF1jDdKs
	 jgkczd1er5xHY+gqKRWJ8HCteOQ6kqVMHGVMOPORQga0d0nzUj9zg5ip8FUVYdlIKX
	 UA/F/+ycnIxMi4FwzPbPPVRVBD/n1F5TKT9ksQ46Jt7fTD2uAFRXN/g2Nr7H54oo6W
	 ebZE+1nK4hb5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Anthony Ruhier <aruhier@mailbox.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add Bluetooth support
Date: Wed, 16 Jul 2025 23:30:57 -0500
Message-ID: <175272667117.130869.8700418579027773890.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624-slim7x-bt-v3-1-7ada18058419@oldschoolsolutions.biz>
References: <20250624-slim7x-bt-v3-1-7ada18058419@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 24 Jun 2025 08:46:00 +0200, Jens Glathe wrote:
> To enable Bluetooth pwrseq appears to be required for the WCN7850.
> Add the nodes from QCP, add the TODO hint for vreg_wcn_0p95 and
> vreg_wcn_1p9
> Add uart14 for the BT interface.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add Bluetooth support
      commit: e57e7084b87bf2534078e04f9ddf377d85d55c13

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

