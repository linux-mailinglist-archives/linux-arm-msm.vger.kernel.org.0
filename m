Return-Path: <linux-arm-msm+bounces-43448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74A9FCED4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F8061881900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17481DE3C2;
	Thu, 26 Dec 2024 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ekl8ufQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F11DE3B8;
	Thu, 26 Dec 2024 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252769; cv=none; b=D1R8NHcYDDSfEBgeI1IMUzpbC6852TUViNJSeeOpLz84Mg9zaAm4nsUqfjTW7uuGupLF4GXkXwKLtF3N0/S1DqFT6UIbYKYFOuxjPcKUlKkl1O/74bRhsVmlmFItJOP/uUZGwHd1usMimVFqow4mRM/psqlHS6D6R1se2TGaA6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252769; c=relaxed/simple;
	bh=fy9QH0hsLTOOSJQ+vKZ2cS2i9bK8tTv7hQlrwofaSqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUSMi/kp3jDouVuWScf7gMbKWEQz+/KzJKkWMWjYjXlfVKHnLaPyiDFLV75IHF6vf03icXbM5GrsyJ+k5MXCEIU8n2ju1a2w/QMS55l/BIx5JHph7V003kNwFhRrvoiNif/6tsWbwoq5uhWTOTNIUhbjtkZTNp94fm55iB2lFrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ekl8ufQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DC4C4CEDC;
	Thu, 26 Dec 2024 22:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252769;
	bh=fy9QH0hsLTOOSJQ+vKZ2cS2i9bK8tTv7hQlrwofaSqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ekl8ufQrCAkoDRSUBXUcVQDnjAACYRLDAaXy+tPFxWDmeWjVZ3wOvkzy25ZdOTc1B
	 Ckb3q3+HEsX+Vj0adSvQxZY3HPaTNC2r2v1VvShxB3hwUgO7G7Kg8nFFOJgKr0IZga
	 vm46GsYs6KTok1pKWZUdCN6tysyVeMHnANQhwmlAjhCT8nyKwxnP3m8pnppXLNySiw
	 vsiQjaIU/aXdSbz+sPaActJqz3suq5xW2l4/Oc/8U2h6NqQzBkWxEZUc1Xeuqk0kLq
	 oYC9UMqkDRJpPHN9m/1GGLjTvG3mqK12avFjl+5GyzpWTh6hS0XYvbJpc1x1xnK9Yr
	 6sAvjYpRLQ8IQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Marc Zyngier <maz@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/8] arm64: dts: qcom: x1e*: Fix USB QMP PHY supplies
Date: Thu, 26 Dec 2024 16:38:53 -0600
Message-ID: <173525273256.1449028.785335331299537501.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Dec 2024 10:07:31 +0100, Stephan Gerhold wrote:
> On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
> (i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
> are actually powered by &vreg_l2j_1p2.
> 
> Since most X1E device trees just mirror the power supplies from the
> x1e80100-crd device tree, this series fixes up all the X1E boards with
> the same change.
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: x1e001de-devkit: Fix USB QMP PHY supplies
      commit: 21aceb8153dfb5560655e01192304db670959c88
[2/8] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix USB QMP PHY supplies
      commit: 6efc01b75f819a2988aa9392f93a4d6501871525
[3/8] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix USB QMP PHY supplies
      commit: bf5e9aa844ca74e9c202d8de2ce7390d24ec38a4
[4/8] arm64: dts: qcom: x1e80100-crd: Fix USB QMP PHY supplies
      commit: 789209dd08124da448bfa7524b21049a04d98f83
[5/8] arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB QMP PHY supplies
      commit: 26a1b22aaf0c6f5128f8d0242caf3d983d5a2836
[6/8] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix USB QMP PHY supplies
      commit: 6ba8e1b8242d27dd83ed4ce58a104c709e72f45f
[7/8] arm64: dts: qcom: x1e80100-microsoft-romulus: Fix USB QMP PHY supplies
      commit: c0562f51b177d49829a378b5aeda73f78c60d0fc
[8/8] arm64: dts: qcom: x1e80100-qcp: Fix USB QMP PHY supplies
      commit: 4861ba7cf5a49969dee258dda2bf8d4e819135d1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

