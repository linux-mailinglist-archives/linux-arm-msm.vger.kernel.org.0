Return-Path: <linux-arm-msm+bounces-23512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F553911B1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A991280D45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A5916D4F3;
	Fri, 21 Jun 2024 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXwYC0M6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCDE16D4E8;
	Fri, 21 Jun 2024 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950304; cv=none; b=Iinv0abbu1utB7Y3hIJ9kQJGiemWbYFukyvC4J+DIajGuM1TFSNDBBb01XiJFlFW+kDt4A3YOGvaRWv37GmAAiYH0udxe/IQodpsasp3EpDfEuLsf32X+C/QJhJNdefPHO6KvH85OTLgF7vdjnnTE6uUwxLWhiajO4xM+lSzUmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950304; c=relaxed/simple;
	bh=9/VAdNtFSFHza6lYbJgLX57zw99VzG9352qUO24IWOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2WtzMbeBo6F+UrwoqWdz+8KOHxMFRTFBonHAjZ8urJ0Lbjl+6Yqz2Bipr45WzfaUwsvcIsuJE5K1cuDTmNXN2gwSetXOqhSaMBQn1LyJFkR0QF6298E5K8aVDBLRwoE9IXpo6HdEggMThatwOb3/nx6UGkI2my1ooBZc1sYg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXwYC0M6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37A3C4AF0A;
	Fri, 21 Jun 2024 06:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950303;
	bh=9/VAdNtFSFHza6lYbJgLX57zw99VzG9352qUO24IWOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FXwYC0M63ovs5psNA1nl2D+XJKYYQhRavwreWkG6F8VvnAR9QtL/a1a9k6z5WmFJw
	 rjst/cOG/8d7lz4SUjk7G21wI6M6HaYuzZR+yJSVnfPyPtbmgEZFhlOrxZmP7bewLb
	 nEQbu4m/xuc9hRCRand3ogV8fXeqBCGwr30kYL/fM6MUUzlah+bnl05uE2evZkKcvx
	 NNtSrl/7PTLwELpFjJQxwxzFG5KfYoWl5i42N+8CeDCIfUX3to1q/nptSswcU0tIf7
	 /zuXKd0UDG5oyEAr/WFeqnMMvb4YpHeaF0XwZgwn/ZDp517XPPMje0KIV5eL/z1T4l
	 oTAQAdXrx6kdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64: dts: qcom: qdu1000: fix usb interrupts properties
Date: Fri, 21 Jun 2024 01:11:25 -0500
Message-ID: <171895028811.12506.10681719894217760161.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617115624.29875-1-quic_kbajaj@quicinc.com>
References: <20240617115624.29875-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Jun 2024 17:26:24 +0530, Komal Bajaj wrote:
> Update the usb interrupts properties to fix the following
> bindings check errors:
> usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
>         from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
> 	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
>         from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qdu1000: fix usb interrupts properties
      commit: 38b55ddb4a9f364b68cb1db174cadfae7cf4696e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

