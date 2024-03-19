Return-Path: <linux-arm-msm+bounces-14451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510EF87F5C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 03:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D720AB21E2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 02:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3AD7FBCD;
	Tue, 19 Mar 2024 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEF3tECZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397B7FBC4;
	Tue, 19 Mar 2024 02:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710816552; cv=none; b=HgFJZ8XzjpcUvOO4f+xyZRoe4nmqIc1qq/KtrrMEtbHjAXWL/BRBqtIDKtUfNmEK7VUky1P3NS3L5P7wAVCKSc8oDuboiyz4qE8vondnf1G5ULfWAp4RXxufw8uoecrOJHwLIK2P0byVA2zxIfaMFgIShckCJFkDf7BeJ0gIEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710816552; c=relaxed/simple;
	bh=6IEeWe8fAl6Qfo90w/86AbAPtb+pIixFMGMT5D84h9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbUVxIwOZvpayCbUAFPzpKWBCzaDsH7iX4Y6Km0gS/scVRxw4wD6yuXFiUD69m5Ns0aG2sQTYNGyrPEYedhwvqIgF9/yvedQj1DhraNSk6NEpBeHw/ZAfEUcyy3XDyMGiCE6GQP3H2E5cDRiqpUGxxbi5xDD7glar3IBQ0JyC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEF3tECZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDEAC43394;
	Tue, 19 Mar 2024 02:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710816551;
	bh=6IEeWe8fAl6Qfo90w/86AbAPtb+pIixFMGMT5D84h9w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tEF3tECZ0dAeyJujgyOOwdeXsb3wHpw6pf172VsJcTJsZm1pdtYnQlceKvDimwART
	 5Cs/2k4Z1USVSkud8Em2/pOWX3ZYC4BhXkNlMPZX35qC2DJeGufs2ajgSgKrju+gBY
	 JYvOm3dds9pEc+gFZFPoFOed/p4t/UQGX4XByBCIgNgAXqgKTrlkJ09S4ajqRVHmpj
	 Y86y1P4PFkP5OFDMw2qExEw09oWn7eXwdd3huaCEQNb36mk8dGxnQxj9SsBazJD+rc
	 2hLyCejKhpBp8A/J+UcFZZI6PReY49LA6kOq7vEULX4UCOBKuC4hC4OqcBSF7Ka0XM
	 /5ELioEiZ+OKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] drm/panel: Pixel 3a Panel
Date: Mon, 18 Mar 2024 21:48:41 -0500
Message-ID: <171081652646.198276.4591986979489107944.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209001639.387374-6-mailingradian@gmail.com>
References: <20240209001639.387374-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Feb 2024 19:16:41 -0500, Richard Acayan wrote:
> This adds support for the AMS559NK06 panel with the S6E3FA7 display
> controller and enables the display subsystem on the Pixel 3a.
> 
> Richard Acayan (3):
>   dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
>   drm/panel: add samsung s6e3fa7 panel driver
>   arm64: dts: qcom: sdm670-google-sargo: add panel
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sdm670-google-sargo: add panel
      commit: 232490b925272d54dd91847a183bdbc2deec904b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

