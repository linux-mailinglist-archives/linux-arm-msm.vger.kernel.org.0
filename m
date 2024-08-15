Return-Path: <linux-arm-msm+bounces-28692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33668953BDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3DCE2872FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A0B16133C;
	Thu, 15 Aug 2024 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDbkLRo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7B11607BD;
	Thu, 15 Aug 2024 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754485; cv=none; b=ZXTObcNXT/oPgrxRVeaVo8LlZr6e4+/CfZmmi24er9QjniQLOD8GA9H4nVgoY6hi7S/c40J6Dd8sDQOuqj/hRwzSe9fzrimWKQVBjinW1xJTRO97ln/GLr59UO0cW8BsJDoe20Y9RW35+T/XNFJSnadsz80YFFNaOzZJ4LYqXbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754485; c=relaxed/simple;
	bh=8hxrRKrKT4YJ3GOfIDQ3CDv7U0Fvu3zgdGXK0IGrT8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APV1BXtIio92IA9XVj2hUAaaWAXsHem5EvS0MMHYrFz4dr3WTOL64qSnfD9GT5wNzTggRAcZoOJJQXVZ5EVKpIX1tM4ugvN9elCMKFpK+221F7Zo2BkPgnp0ZH1PomQDDX6k7GoMIiiia7u0anpoMsfmyLbICMrOXMoooKbRx+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDbkLRo5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6065C4AF09;
	Thu, 15 Aug 2024 20:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754485;
	bh=8hxrRKrKT4YJ3GOfIDQ3CDv7U0Fvu3zgdGXK0IGrT8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GDbkLRo5hf3oEhk4vbljz7dOWABLeSshSbVLK8g3v+DKC/k0NqpszC58aD88Kf/+o
	 ht2PzgUhbnwIjrKNPzvdIZM2bkHQpXsfIZ6BkGn0IrgAEH8LaoWH93xA27NQwXHt1u
	 n6Mom+lJIqfrBF9KuDpBRGRCRr+N3wvtbOEfy6vyEi6jVhxMHG9PChHIQfdaX+KhWi
	 I+U+HwMh5a/LEyOKH7me+WQcfmcu89caxjjpgHb2XJZLX55ULwjI87rt+6/BY5yxp1
	 Ug99L7is/20cU/h2kO9Z5osrZ7umcM2Kin8xq3ox5XneSc0D1V1f0ABJQtb3lSyuqH
	 sV9enDEDyEkvg==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH v17] arm64: dts: qcom: sa8295p-adp: Enable the four USB Type-A ports
Date: Thu, 15 Aug 2024 15:40:38 -0500
Message-ID: <172375444803.1011236.11659183760108728325.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240707085624.3411961-1-quic_kriskura@quicinc.com>
References: <20240707085624.3411961-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 07 Jul 2024 14:26:24 +0530, Krishna Kurapati wrote:
> The multiport USB controller in the SA8295P ADP is connected to four USB
> Type-A ports. VBUS for each of these ports are provided by a
> TPS2559QWDRCTQ1 regulator, controlled from PMIC GPIOs.
> 
> Add the necessary regulators and GPIO configuration to power these.
> 
> It seems reasonable that these regulators should be referenced as vbus
> supply of usb-a-connector nodes and controlled by e.g. dwc3, but as this
> is not supported in Linux today the regulators are left always-on for
> now.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sa8295p-adp: Enable the four USB Type-A ports
      commit: b5cbd179f466f46b74ec0aa235e3ebe546135048

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

