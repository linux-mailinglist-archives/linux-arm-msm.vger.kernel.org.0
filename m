Return-Path: <linux-arm-msm+bounces-43425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB729FCE86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63A6318825BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C97E185E53;
	Thu, 26 Dec 2024 22:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeVWeNtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490133E1;
	Thu, 26 Dec 2024 22:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252738; cv=none; b=ZEuwW/j6PfwETFp8zmEPgyDEUsYvjMyhGzbgQgw3MBxZpIoNvINCZHgZVk1DA6b7P55kw5ZYCeuign49I0gvVB5X3yuVHVnx+59KlsyUIWTLDNKnBdHwdTi/B0sHkEpSIhBKesDYTWuyz7uIl1r0ydgknbcFFLfYNSceXwY5qGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252738; c=relaxed/simple;
	bh=KtrFqv7ddjx1GFSBKKOFQ8TT6MuhRzthj/sQ+DSwVew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBURcFZozf4dX5AVO7l+rWzt8mK3YjGQz7l3HEOluY427SdaqXj9sgeGjU1L2+XvmzCYdM2h8ASE0hGhPt9SZWdbDp+W5nOI5DqY6hZVuVQ5DrCz3rVHvOgJh6aQDh+9/FWKFX2OcmZIWqnwBB/D+lgT3JMVstbpAJ+I0nrArFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeVWeNtM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55BDC4CED1;
	Thu, 26 Dec 2024 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252737;
	bh=KtrFqv7ddjx1GFSBKKOFQ8TT6MuhRzthj/sQ+DSwVew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TeVWeNtM7N4wjsrL2K4k9xzJDZugXyrIMIRVr8LVZZDtPgeXeRi2HcfP+VM0B4AQT
	 e4TEBG+jDYYA66HVZjZ0MdebRWYI6ha3+59ANhSdebKdAlnioX2OROS0FNLVBS4lDF
	 eLllvAA5DAM7FPFT7Danmw7bmrqoL84jdHCRe+wzSMjbk9r7FH8pucHe68oxhYTsb4
	 zXI7pNhXf218mD51/kz9O7zz6WX9rTJkpxnngAEHT5VUlBnjEkXyZQaoxZhGNf9rwJ
	 mdhoEBiz8s9k90aBHLjfIsrgN5ghn/9pBhFocw8hpI2gc+ODN8xKTKUm3d0Bx/Alrd
	 3yuJnfO9GsfkA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: x1e80100: qcp/t14s: Enable USB multi-port controller related ports
Date: Thu, 26 Dec 2024 16:38:29 -0600
Message-ID: <173525273249.1449028.7213519160088430287.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-0-7360ed65c769@linaro.org>
References: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-0-7360ed65c769@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Dec 2024 11:23:16 +0200, Abel Vesa wrote:
> Both QCP and T14s have 2 NXP PTN3222 eUSB-to-USB2 redrivers used to level-shift
> between the USB multi-port controller High-Speed PHY eUSB2 and the USB
> Type-A ports connected to it. The QCP has a 3rd instance of this
> redriver but is connected to the USB2S controller.
> 
> Describe the redrivers used for the USB multi-port and enable each pair
> of PHYS and controller in order to enable USB support on those 2 Type-A ports
> on each board.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e78100-t14s: Enable support for both Type-A USB ports
      commit: ffbf3a8be76613d83c41de40312235cb7cb2cbe4
[2/2] arm64: dts: qcom: x1e78100-qcp: Enable Type-A USB ports labeled 3 and 4/6
      commit: 9f53c3611960a97d2b71825477e96fd8c2fbb050

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

