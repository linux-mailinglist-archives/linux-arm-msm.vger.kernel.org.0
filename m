Return-Path: <linux-arm-msm+bounces-54549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F43A90AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 20:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734203AB1C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 18:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F8521B9E5;
	Wed, 16 Apr 2025 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncsjjROD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C8921B9C0;
	Wed, 16 Apr 2025 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827052; cv=none; b=N7XWOv3h22xB++uYi+sWulnMw3x1MNZgAE9B72R4DDda3QYDYwxKtzewtXtsCVr9lWBq26/Cva6W0FtIe1n38O1zL2Ipfle04WMmW7MWo9xbLyUV0TTx5GmignPYGnRsDgCQ/m3AIoc3k4eYhg2hEGlxjOXSH+CIyEZsaSRc58o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827052; c=relaxed/simple;
	bh=Q/28xL6BGiBlpOVuJPhIofxxaTn4yp+EsJtZrDg6Bqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJ4jP5aepw1bnKXveJonHB4Uhq7+k5ZxEA2jf1iRy5MS6IrVGFEsARYXsu+5gfT9NfM082Nnb9FGBOdCS44/GBTNrWNxqVl210T/o9Y5WhbaddoOfSvfTBD26sxqdash8WEMIGvMOuby7HwgU3mnwqUAqFr983ewRX6vCp1ixVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncsjjROD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7EFC4CEF1;
	Wed, 16 Apr 2025 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827051;
	bh=Q/28xL6BGiBlpOVuJPhIofxxaTn4yp+EsJtZrDg6Bqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ncsjjRODTrC72Zrrch3aBapKr4c4HpZFs6PETJtsuhwXMuNPCPYHgpg6euCzvz/q3
	 3SyGhhj6gt9iFterc6zrE+sc08/g9YowUN8SSzDdAmLXhHCgLEDAUZ0mNeXsVFuo5F
	 CKjov/4rZbx0fa9HiwXPc3jWhsATNRhIqpCXGv4kb4kYHFCwFSLRoU7Kue85jwa8Qy
	 5+OdFHRx+kJ6mkbI9cJWwimz8u2qF+a1kwaTF1huFxIZkDZSD5YYBykvnc4WNIqT7i
	 ij9P5P7T1A3HdrtnGGRr03PUX/pFd3BBNb7WcsLWAmWI1iM/k6255ot3yRhSt3H4TL
	 CHt4rabvhVH6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH RFC v3 0/3] arm64: dts: qcom: sm8750: Add modem
Date: Wed, 16 Apr 2025 13:10:42 -0500
Message-ID: <174482704423.446874.8797832957320511040.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
References: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Feb 2025 17:33:04 +0100, Krzysztof Kozlowski wrote:
> RFC because modem on MTP8750 crashes after booting for unknown reasons.
> 
> Changes in v3:
> - Split modem to separate patchset and series
> - Link to v2: https://lore.kernel.org/r/20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org
> 
> Changes in v2 (from previous patchset - combined CDSP and modem):
> - Fix CDSP and MPSS PAS address space range.
> - Re-order nodes for correct placement.
> - Rb tags.
> - Link to v1: https://lore.kernel.org/r/20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8750: Add Modem / MPSS
      commit: 104790b0699462dcf208a7d0290fc7a7fe44cc54
[2/3] arm64: dts: qcom: sm8750-mtp: Enable modem
      commit: 9facd1c15b9362f280dd2c27e08cc1942eacd1cf
[3/3] arm64: dts: qcom: sm8750-qrd: Enable modem
      commit: ddf4c3840a3cfea3a037f778ad9223b9337e0bc5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

