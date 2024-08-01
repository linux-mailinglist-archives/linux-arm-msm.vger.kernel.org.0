Return-Path: <linux-arm-msm+bounces-27657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DED119441D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89F431F21F31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EE113C90C;
	Thu,  1 Aug 2024 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sv+rifGd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962F31EB494;
	Thu,  1 Aug 2024 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482558; cv=none; b=OWXXDeNsIxtYFNaVSIK5+Mo8zUaKQTUYWnvAUKS4M2s9hmV2SXUFYAnHiap9U2BshCTzeMpGDfRYtY1kp3jm372CYVCN5M3pHhef86223LUYMAHYaqWfB36jfoiRyx5uneYRrxMLpnvs5ICOV2bHbuVK8sQN0072ZMhLxs+96So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482558; c=relaxed/simple;
	bh=cwZNlFkg/6uwcZmn5bSEtGCnUEUd5RzuUF0gLreCNwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNzi2DS5bFWNv2BnxBldf675ygnvQP7FZTNEqcUqAQSANMvF5CQYd81uvVTUjdePdK8B+P0GGaxxz6zbUIQ7Vu/4q2ScEyg1Nh04BJK9mC61GzUi+NT5aI/HToTuNb/TJN7ja0AqW3RaijGMQRt9odYHQ6ZtViyih1mlsSt5Y+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sv+rifGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8026DC116B1;
	Thu,  1 Aug 2024 03:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482558;
	bh=cwZNlFkg/6uwcZmn5bSEtGCnUEUd5RzuUF0gLreCNwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sv+rifGdffMkhnY2qFffaLJTiAOLVRqb4P/j9gx/xSonU9bN0O2jJNa8DJ5Egblhn
	 HhmTAfByfPx5ZYnFDLWJgN7yCV1fe9P6dxJI9OsEnstGE1uL60H7+uVA1MzLnZnDT9
	 q7OXjpCwNa+c+CQetKRHWOUZeVcXoPJnDKlhwyQF/nifcm8M2k2rFMDblP5uWu1jlA
	 mA+Bx4pcC3AxSwblGA6k0Tol+ohmM7e0iEqchtNH/6dIcPyPz/FOYN1tn3L9xl9f62
	 f8XROjy1dC7Km6SRk4r+T+XeTnlcyi6ocpCGnNSVrELwqY9rP7xjfPoYh6JeLthYCW
	 Mb5iqozqkwYpg==
From: Bjorn Andersson <andersson@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/6] Bluetooth: hci_qca: use the power sequencer for wcn7850
Date: Wed, 31 Jul 2024 22:22:34 -0500
Message-ID: <172248255231.320687.3384796233476988761.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
References: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Jul 2024 14:18:31 +0200, Bartosz Golaszewski wrote:
> The following series extend the usage of the power sequencing subsystem
> in the hci_qca driver.
> 
> The end goal is to convert the entire driver to be exclusively pwrseq-based
> and simplify it in the process. However due to a large number of users we
> need to be careful and consider every case separately.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: sm8650-qrd: use the PMU to power up bluetooth
      commit: 4e71c38244dbeb6619156b417d469771bba52b83

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

