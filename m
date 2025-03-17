Return-Path: <linux-arm-msm+bounces-51558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA8A63C40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B56F27A2DE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D419191F98;
	Mon, 17 Mar 2025 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoCjcoAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BF18FDBE;
	Mon, 17 Mar 2025 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180171; cv=none; b=oa6GzbE7xemVFcilUJ+CICeAoY8/Xlvha+Hrq2J36zSGqk7yHYXdtURWIHjw97bMaVYqdTdtesDboGjkOI1l7E8Fh06ziPKJieYTGAjHsm+kclwAIEsDFm33UUwq85PkifB6E4UYtgqeDvtFjZ8gZgeiv1bmVtnGV1RZ9qnpyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180171; c=relaxed/simple;
	bh=D2fkRbI277A80Ux7pQDLiCyDcn6KhZHFS1KjeGwKYeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hP4xUCjTMSsrVxu9Knk8NMCFldSYoDpVxn3n4cTthDR97XjbsH6L8ux9r/2F/3PyjPqYjPR+c1Sj5csIlL4C+kqSvFk5Cw//zsSkhAva9MIrjdinTKs2cMEJunaCHc7RXy0RzNX6Mkb/lIIo+JmTqPficc/SA/5M2X/4dqsN7Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoCjcoAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD78C4CEDD;
	Mon, 17 Mar 2025 02:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180170;
	bh=D2fkRbI277A80Ux7pQDLiCyDcn6KhZHFS1KjeGwKYeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eoCjcoANstE59I6oJhGmRItwntiraoArpbVxWhGOi8lp6g4OqeqSBVrgi1quq3qEr
	 u+/SwK49GLvfVuXIzUouhUXJnTPRaw/usX/HpCuZzZe89zersLpC+fGE4FTrphfHG+
	 YG9qvVPJCfu6HNSka29hY3rzwittQrJr3uEiV3GBiYO3HLvM3SSl/QzLgZ7F8u94Hm
	 LuLVBizp8OgOwM3GnwWFhVj9drTBmAoxQEh8Ftf8XWznFC43pbi4EySyJqvol9ypjd
	 TI6zTXAUQhmpFPmzJncyDbKF0kgwr5HNGg0RC8+GPvapj102zywSVmjVes11uHsXdQ
	 kJ6hKp16k3/1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: x1e: mark l12b and l15b always-on
Date: Sun, 16 Mar 2025 21:55:50 -0500
Message-ID: <174218015888.1913428.16011130503144961754.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314145440.11371-1-johan+linaro@kernel.org>
References: <20250314145440.11371-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Mar 2025 15:54:32 +0100, Johan Hovold wrote:
> The l12b and l15b supplies are used by components that are not (fully)
> described (and some never will be) and must never be disabled.
> 
> Mark the regulators as always-on to prevent them from being disabled,
> for example, when consumers probe defer or suspend.
> 
> Note that there are likely votes from other processors for these rpmh
> regulators (at least for l15b) but the OS should not rely on that in any
> case.
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: x1e80100-crd: mark l12b and l15b always-on
      commit: abf89bc4bb09c16a53d693b09ea85225cf57ff39
[2/8] arm64: dts: qcom: x1e78100-t14s: mark l12b and l15b always-on
      commit: 673fa129e558c5f1196adb27d97ac90ddfe4f19c
[3/8] arm64: dts: qcom: x1e001de-devkit: mark l12b and l15b always-on
      commit: 7d328cc134f7db1e062f616a30cffe96fbc43abb
[4/8] arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on
      commit: 63169c07d74031c5e10a9f91229dabade880cf0f
[5/8] arm64: dts: qcom: x1e80100-hp-x14: mark l12b and l15b always-on
      commit: 3ab4e212a41c46668adf93c8d10d0d3d6de8f0e4
[6/8] arm64: dts: qcom: x1e80100-yoga-slim7x: mark l12b and l15b always-on
      commit: f43a71dc6d8d8378af587675eec77c06e0298c79
[7/8] arm64: dts: qcom: x1e80100-qcp: mark l12b and l15b always-on
      commit: ff6ba96378367133b66587bd3ee9f068a39ff3a9
[8/8] arm64: dts: qcom: x1e78100-t14s: fix missing HID supplies
      commit: 55e52d055393f11ba0193975d3db87af36f4b273

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

