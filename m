Return-Path: <linux-arm-msm+bounces-27182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9393EC52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0947C1C2159B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFB2140394;
	Mon, 29 Jul 2024 03:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wjqq/ltT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D788140360;
	Mon, 29 Jul 2024 03:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225541; cv=none; b=Zq9q55HGnHx/kC6Cj2ZwYxUZj5ZiUXTVOytMLg8nvpqb8Ym0ehfZOWkgfKkeJmI8JPrg2rDzggd/dcIA2pvYZNSmWDp99S4NBDd8OZwU3yn64AWCgdT9/iTHE40NqE8TiPXIE5zcG0WcOat9tYgSTyRHeJVk/eTHrRyqtGw/FDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225541; c=relaxed/simple;
	bh=RMMv3zKvenq8v82/xYmA1hOhsf/+rwm6tvocMX1DsqI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5yhrDHeudjV4JqnD+d2g46bFjVEwZLOo3ozZjf/+3MfSX/2sZFE/E6/ihG6vLjvyvtyCVItfU1SyvQ1Ted4v62LxG8mQgux9Zsbiu8FoLT/CGrs+h4WUHVHvbxmo0F3+tNab6yJFmoFLSlmMaej4eZXGbBYsfPu95z2BSVwhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wjqq/ltT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21264C4AF07;
	Mon, 29 Jul 2024 03:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225541;
	bh=RMMv3zKvenq8v82/xYmA1hOhsf/+rwm6tvocMX1DsqI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Wjqq/ltTlPL6AHVLj5+IUgezbfHt3bvKLtJjG9guGFnLQo76WM9g3Yf3RuY6jV1ZU
	 o7qpfs0jzASpt8VQ+Mg/xWwiWZBbL7/77Cg0VLTUSnxkiRCB71X2uuf05pADHO2KxS
	 Txl+9dYLJfyiqwHyLBE+OzZw2mhnMzehs+jNUO1VCDBjr4SsGC+EJx7PIRRjRi+aOT
	 V38qaxTpAJG1sWUeCVgN5lVzCGMdIefUeBDohcte+EDNnNARM6NWXhK7eHnHb2p/+t
	 9IY/DOqRlHGpBo9sX1dCvjvzvoQIkrdAzO2d/ucQeHgXBOMEMtBlhc60ideuPzl5hd
	 DhZZuGHBpqpJA==
From: Bjorn Andersson <andersson@kernel.org>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konrad.dybcio@linaro.org,
	quic_wcheng@quicinc.com,
	quic_kriskura@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: Re: (subset) [PATCH v3 0/2] Fix ipq5332 usb interrupt trigger type
Date: Sun, 28 Jul 2024 22:58:26 -0500
Message-ID: <172222551326.175430.1002136487404622409.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723100151.402300-1-quic_varada@quicinc.com>
References: <20240723100151.402300-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jul 2024 15:31:49 +0530, Varadarajan Narayanan wrote:
> Trigger type is incorrectly specified as IRQ_TYPE_EDGE_BOTH
> instead of IRQ_TYPE_LEVEL_HIGH. This trigger type is not
> supported for SPIs and results in probe failure with -EINVAL.
> 
> Fix dt_binding_check/dtbs_check errors associated with usb's
> interrupts.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: ipq5332: Fix interrupt trigger type for usb
      commit: 60a76f7826b88ebf7697a56fdcd9596b23c2b616

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

