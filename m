Return-Path: <linux-arm-msm+bounces-43445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9991A9FCEC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3763E18836DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651FF1DDA0C;
	Thu, 26 Dec 2024 22:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBq1d8XR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4761DD9AD;
	Thu, 26 Dec 2024 22:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252765; cv=none; b=uv6Uvyy0DrfoTCtLv0IMJAXsUQuBZdmDUGTHOuvABMeSN149a5HPznBFjvQO33xnPYbioDsNXgAG7IoB7wJGKdWV6fc6P48vmiegcEyX/BVQ7UtTFSO+1ZykvF5cNsMIvalyGPb4lYptGIWAcTVNEh7SprCPSOT4QoTbWvxjP/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252765; c=relaxed/simple;
	bh=P3nkOvv5FF2QrEixNORZRjOg4L7rjdND0HLZKcMt+Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfGWFsesY3ceSPWz/otlHdySNC+4TPBvGvQXhAEXafHwmjibbpHL+W+TLoLh5s99iBkdukmnXzysUBOcW1ah0bTxS4kRe/dCrudbhZ2fepo5nUWmkKSfYpxGBg6z33HSM3K3Ya9Xva+7STHe0lGQgnwRR4ACBt8C7N7b1IwMJJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBq1d8XR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC88C4CED6;
	Thu, 26 Dec 2024 22:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252764;
	bh=P3nkOvv5FF2QrEixNORZRjOg4L7rjdND0HLZKcMt+Es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FBq1d8XRPEh4DQtA8U9rSaUzSWUASlj3ZihTSw/i1gIGzsIlBGG0W3tv0vB6k1HwG
	 8rsWnLfwXqqkYJcmBeKHVTZgFAwQGkqqxd+g/rN/XnJ8OG8dACsaCJOCVvBEmr0avk
	 gnKj4TwwgtuSh4g82R8pT9fe2iM/6dVpYnX7t6Le0ZIEkkF4GWThMRM850M4Cx0WPn
	 +3wEM+LnSo3pwvPJNav2S5cSvOqSKkTcHN/hCNhYrB20ff4QpPZ+NAdKin/sHdIVI2
	 dJzukCDmWlMtglC0y7MXp6Fhizjwm7BroCQVjHxuTi1N+sfbDY5cK9vv90rIBJKl3i
	 h5ePlBIN/iR+g==
From: Bjorn Andersson <andersson@kernel.org>
To: quic_fenglinw@quicinc.com,
	quic_tingweiz@quicinc.com,
	kernel@quicinc.com,
	quic_eberman@quicinc.com,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/3] Add SPMI bus, PMIC for qcs615 and fix reboot-modes etc.
Date: Thu, 26 Dec 2024 16:38:49 -0600
Message-ID: <173525273238.1449028.5571442458559097554.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-0-ae673596b71c@quicinc.com>
References: <20241128-adds-spmi-pmic-peripherals-for-qcs615-v5-0-ae673596b71c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 28 Nov 2024 19:55:24 +0800, Tingguo Cheng wrote:
> This patch series depends on the patch series:
> - https://lore.kernel.org/all/20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com/
> 
> Board files changed for reboot-modes moving(all dtb files keep the same):
> 1.sm8150-mtp.dts
> 2.sm8150-sony-xperia-kumano.dtsi
> 3.qru1000-idp.dts
> 4.pm8150.dtsi (remove)
> 5.sm8150-microsoft-surface-duo.dts
> 6.sm8250-xiaomi-pipa.dts
> 7.sm8250-hdk.dts
> 8.sm8250-sony-xperia-edo.dtsi
> 9.qrb5165-rb5.dts
> 10.sm8250-mtp.dts
> 11.sm8250-xiaomi-elish-common.dtsi
> 12.sm8150-hdk.dts
> 13.qdu1000-idp.dts
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: qcs615: Adds SPMI support
      commit: 27554e2bef4d70841c4d20d96c673de51edb353c
[2/3] arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals
      commit: 09cd0cb290d5a86fac28210e0387d507ddcb97b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

