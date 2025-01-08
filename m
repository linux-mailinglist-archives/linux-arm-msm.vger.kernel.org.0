Return-Path: <linux-arm-msm+bounces-44306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC5A05269
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8D411889983
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE461A0BED;
	Wed,  8 Jan 2025 04:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzI3BaZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1341A08A3;
	Wed,  8 Jan 2025 04:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736312061; cv=none; b=oLisKAA8M85VBy1FfRFY98Gg0gyKNM7cZRN+FxiOPXpbUL2G3un9pMWY23YFMOthlw94vpo+QQHRUrCU8y56SNI2aJ/Er1iDHQfnTKDN6CjCE0eXW2Hau2SELGRCvigKwN1E6tiT4xTFnsco/8w/cmdWuwQJ73JuVY7ki8GiuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736312061; c=relaxed/simple;
	bh=OyhohNFbvFv5c5PX/ptJTjyFtvVLPm0YUVoIISObS2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2Dy13ZaIFn7EDejNuK6YBXTIBZnPBmjaWs9m2AKW/yDgOuLTPXlIdNHaeUXUKVwN+Ysvm+BZsb1gu8gezUGzwhCPh4qr2uY+D2ZEttD07gmdnQXa/inkDtj7SD/sYw6khsGCEOn6F2idFwCM0Ti1tORecb8J750ZO6m5dk/SZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzI3BaZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E692C4CEE0;
	Wed,  8 Jan 2025 04:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736312060;
	bh=OyhohNFbvFv5c5PX/ptJTjyFtvVLPm0YUVoIISObS2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzI3BaZc9W0PtxaJZ9AtFBQrlsCyrk5Lkr+YvIjLPn7VKw78Y4IfNxDNyGobTtsO6
	 sG/Ihab9e8/pmNpl1fUUzTYvVCOVobq8KmN4BdEwEFspPa2o+yrUeLYjJ3zyvSBWRJ
	 h9n4bh0bJ1yZiknkSdcm3xN5DpBBLSyak8HZ3+uFLa+WcdJGIYSBXafRfx50ZpuUvK
	 uI3qtoOav9hiEu2/UEf21mgjynXg9U3ToZjZ3SLzNUaQ/r+8T5y4sIwlx9nKQAJkrM
	 Y/lrq02Dmh/WXP4Bj3YrAgVTodUrt92H+dM7uQqDqYhFWHeW+KBoLM06Lb8HzaP85H
	 Hrii8KdrpHIEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH v4 0/2] Add Devicetree support for USB controllers on QCS8300
Date: Tue,  7 Jan 2025 22:54:14 -0600
Message-ID: <173631205046.113795.2001854293543091473.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241114055152.1562116-1-quic_kriskura@quicinc.com>
References: <20241114055152.1562116-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Nov 2024 11:21:50 +0530, Krishna Kurapati wrote:
> This series aims at enabling USB on QCS8300 which has 2 USB controllers.
> The primary controller is SuperSpeed capable and secondary one is
> High Speed only capable. Both the High Speed Phys are Femto phys and the
> SuperSpeed Phy is a QMP Uni Phy.
> 
> Base DT Support has been added for both controllers while only one has
> been enabled on Ride Platform. The primary controller has been configured
> in device mode. The secondary controller will be enabled in host mode post
> addition of SPMI Node which allows control over PMIC Gpios for providing
> vbus to connected peripherals.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: Add support for usb nodes on QCS8300
      commit: ceb39e1ea327a96cdd9fcc54c65664f0659cd9b7
[2/2] arm64: dts: qcom: Enable USB controllers for QCS8300
      commit: 46ee6177b76736b49b1f34bec1244e4996fd199c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

