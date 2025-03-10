Return-Path: <linux-arm-msm+bounces-50874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D27A5A484
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54BFC7A8693
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 20:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CE91DFE36;
	Mon, 10 Mar 2025 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUbspcSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3C1DF26E;
	Mon, 10 Mar 2025 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741637598; cv=none; b=qLFOky6wEVjKQ/cR1IDNhQfJiBmO+33HpabrPSkZ166MoqmaB+nJ7yHouB1Dkx6DIqv9wT87m6RLw+INDW95vPlomAyVb4tViXsZx2+Q9RayLjiIaOEH48i0V1/yk95XOf05klvqlJmoGOGtY4VSaGMf+tifOu+W9WX197OY5Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741637598; c=relaxed/simple;
	bh=skL/rmRnGlTYtLxJfB+8Va0I/aLt0qqNr1QIB94k4zA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LtIZartR370N9l3OdG1+d1nNAm6V4qau3A9IxDkRY6DPtpCG+Uyk9b0c3EEjeHJK7m3S3SCotA+j5OwiQIXxTyFFbZHFN7lJXCplCJqZO3XAoTLhc6eo+bEsBEE8nlV8eYA9XFack3sLugaTTaymWVTrYBZblB8T0fQwnpHWAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUbspcSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB18CC4CEE5;
	Mon, 10 Mar 2025 20:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741637597;
	bh=skL/rmRnGlTYtLxJfB+8Va0I/aLt0qqNr1QIB94k4zA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MUbspcSL8izya5Txqem6UzQ0RohAzVbiMswB/9dclgoaizYep+/AhqSoNCyFAKCYw
	 vr78DxMOZpiu8naV2kZe4Lg0jbxYK8VpfLcPx1M1Rd5T9/TBn7QLRf3B1yUjDQIbNP
	 tfxti8eua5b8sE2dupaWA030/7dU/ENyCvvplvn7yx+shK6lzaZv4p6JglaYOaa78j
	 DY6VYGK/Xt2iv8+JL7e2yodE5LaXWZwnVG3rSoH9osij88+Z7v1jQ3H+ycwKZPuZEg
	 Gl5/rqXEWP1oKdQdPitQpu301Dy+wOuGBRmZlAfyPA2OGnWwcQCqjCo9e8cGC4AHqt
	 9hdVBJh0YHfeQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20250310110359.210990-1-krishna.kurapati@oss.qualcomm.com>
References: <20250310110359.210990-1-krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v4] phy: qcom: qmp-usbc: Add qmp configuration for
 QCS615
Message-Id: <174163759448.467704.16738286875495669175.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 01:43:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 10 Mar 2025 16:33:59 +0530, Krishna Kurapati wrote:
> Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
> 
> 

Applied, thanks!

[1/1] phy: qcom: qmp-usbc: Add qmp configuration for QCS615
      commit: e45cc62c23428eefbae18a9b4d88d10749741bdd

Best regards,
-- 
~Vinod



