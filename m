Return-Path: <linux-arm-msm+bounces-20511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A564A8CF7C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60DD4281551
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D64013AA59;
	Mon, 27 May 2024 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugbx5FMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359D013AA32;
	Mon, 27 May 2024 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778872; cv=none; b=RnsI49zSZiuMD/gdQvbckyrafkFc9cTPHAlAbMfGqUcFlxFHNM54swsdDd2PiHHD5x4dui/IiOWKlwaibAhUaA3L1HD8OLTdRJgmmyYxYNoxwG1L+C2+xcQ0epurUszLEbrDe860UAYouNbj93o8Z4cCH7Nn2WooHKYPOlA2Qhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778872; c=relaxed/simple;
	bh=0tz6/uvwUUhjXvGEC7sYYq4bUxljcmR+Y2q5XSsXGYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWMT86Uc2/Jlqq8FMZWdNK7IpgbuF/UIIKvO0rwLlYXTpYviITNVkDLrYLoLlrsjXFU2Rg5qeTmlSbbuBtXMHakw1Tu+oxvSCrd5P3ofslybTV3IE5FbWJzWzOqYLtYjwY6vyL+WEIaTQDkyNkzv9F/lyDInwU+j6hZmU1HPSTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugbx5FMn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E19DC32782;
	Mon, 27 May 2024 03:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778872;
	bh=0tz6/uvwUUhjXvGEC7sYYq4bUxljcmR+Y2q5XSsXGYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ugbx5FMnbGJo/mdKN4HKv/9wtTYblvnhiWnKbyrq3ktVnbs8BPboPLP7xFkgACd/U
	 +GLsXv3D0qfu2ntVG7CFXHZceMwFIL9hRRgtHpht16GhovQ/XNvffjmdOYo9no8eUY
	 HC96vw0zz4sx9s8F2skkQ+akmuFZ+HX2eMJ2+FPUCeAh0JlUDC/L7fTeAnQaO3nGDO
	 +Q8jzsJ/4pcI19cQAjkzl6mvtQck0vmIqmTXy/FMjrHSdUUOJ8lO0L5z2MW9hxS8Pe
	 Vw3uG2xDbNB/YYwvWEn9Q7g6RNN51D/bvCLd5L9f60NnCs8Bli9dCmDzc/dsj0N2vL
	 pG3aXtK8/nfVg==
From: Bjorn Andersson <andersson@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	konrad.dybcio@linaro.org,
	manivannan.sadhasivam@linaro.org,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: quic_shazhuss@quicinc.com,
	quic_nitegupt@quicinc.com,
	quic_ramkri@quicinc.com,
	quic_nayiluri@quicinc.com,
	quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com,
	quic_schintav@quicinc.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Qiang Yu <quic_qianyu@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/2] arm64: qcom: sa8775p: add support for x4 EP PCIe controller
Date: Sun, 26 May 2024 22:00:37 -0500
Message-ID: <171677884212.490947.2007243918185473785.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <1714494089-7917-1-git-send-email-quic_msarkar@quicinc.com>
References: <1714494089-7917-1-git-send-email-quic_msarkar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Apr 2024 21:51:25 +0530, Mrinmay Sarkar wrote:
> This series updates PHY and add EP PCIe node in dtsi file for
> ep pcie1 controller that supports gen4 and x4 lane width.
> 
> Dependency for Patch 2
> ----------------------
> 
> Depends on:
> https://lore.kernel.org/all/1714492540-15419-1-git-send-email-quic_msarkar@quicinc.com/
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sa8775p: Add ep pcie1 controller node
      commit: c5f5de8434ec35d8ccd5b3a746df3afb37bfefeb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

