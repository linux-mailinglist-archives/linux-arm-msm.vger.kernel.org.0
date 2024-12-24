Return-Path: <linux-arm-msm+bounces-43262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C69FBF9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 16:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1471885556
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 15:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C011D90AC;
	Tue, 24 Dec 2024 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEaOpFsL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512491BCA1B;
	Tue, 24 Dec 2024 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735053924; cv=none; b=Ab5YIeijmKOkqK0E8yCQii1lLEyxJxf5tNTkN+mv/bSIibOFEOJC0eNg2K2CmhKUDoUmMTEppDvO2nRbfsf7uFEGS2W9sSQlLb9rg69zKHd1Xz9O5QEtG0pLCYbCM3FvXVR/kRhZRUgkOxFeNR0Q2lnl9Jw9OTL19QHH0DwYFVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735053924; c=relaxed/simple;
	bh=eAoc1WrWVjV6886T/Tb4CISeYk4DmpFuUmKCpQzlQ6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oyf/xCBezdn04C4G2oZqvu/aKEyD97qDlJN0uaO067SskgWLPmwXNdvsPdOi4HuMDKPH8Tw0gXYUlEavYCosexso30umW0O7jc6A2GD0/AAhzW4qsXwFnosL1+fiT/uXaCldP5wjjbaqef1LThVw264ZFK4wva8j2TaNELf9JIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEaOpFsL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F246AC4CED4;
	Tue, 24 Dec 2024 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735053923;
	bh=eAoc1WrWVjV6886T/Tb4CISeYk4DmpFuUmKCpQzlQ6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JEaOpFsL1wq2v4cvnXvegIGm0PM34eOfw/YDSi2yWrk0aNBP2Y8s0EntWFoSZj9Dj
	 V+JC/J9HJjN0fC+rTLfw3SVgDu2Q1k3wchu1gDd8q7j21/HWrXYM6UKpJyZzFPVbW9
	 mXjByYfv25n/HapdFfeKoJIN1C+DY+Aqav4OjwegZbLbepN0K8zvoXpYRCImCD2W9M
	 ePGHnr/hOvB0y6horXswpen84P4yMmiTAs0jL4gDqWF9uIl3+HpTcEwd4e++LFAjil
	 S4bRlsnnvixB58Ur54EKoXlvJ/xI3D4x6kINnqRBGgTiSgyA/uK5oX8jGLoGWBX5Dh
	 KWJx04Ch1BFXA==
From: Vinod Koul <vkoul@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, quic_ppratap@quicinc.com, 
 quic_jackp@quicinc.com
In-Reply-To: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Add support for USB controllers on
 QCS615
Message-Id: <173505391861.950293.11120368190852109172.b4-ty@kernel.org>
Date: Tue, 24 Dec 2024 20:55:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 24 Dec 2024 14:16:18 +0530, Krishna Kurapati wrote:
> This series aims at enabling USB on QCS615 which has 2 USB controllers.
> The primary controller is SuperSpeed capable and secondary one is
> High Speed only capable. The High Speed Phy is a QUSB2 phy and the
> SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.
> 
> Link to v1:
> https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/
> 
> [...]

Applied, thanks!

[2/3] phy: qcom-qusb2: Add support for QCS615
      commit: 8adbf20e05025f588d68fb5b0fbbdab4e9a6f97e

Best regards,
-- 
~Vinod



