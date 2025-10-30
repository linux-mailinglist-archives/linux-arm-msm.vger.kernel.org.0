Return-Path: <linux-arm-msm+bounces-79712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAABC2124A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 834B84EB2B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40EA3683A6;
	Thu, 30 Oct 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct7JntvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEBB3683A2;
	Thu, 30 Oct 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841364; cv=none; b=bJeZ+jsMi9SWshpDR+m1I/7UsuL0zm2m4j2QQk/vgBFACTyEY/XDMZc+QX8MRARnyTCzWTzX1M4ui7jJov+m0LHnPD4MZcxbnTaSFI7rO0hE9ASNbBrHHtZcT5erYAx4xbjj56ADlwuRMC3CLxvv5Ra3rx4+JmL7TV6LhDQGIWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841364; c=relaxed/simple;
	bh=JqS1ZW4S5Haq6ALsyCIjkbD/TJhiOlff5QxS8NnAljY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FSu45hqBwVp/Z9LLxpGcm9K5mdOd9v8LRqCGLvGlprGyl5+G/c0gTR7JkX4WCDUJmnuYa0QGBrkRHf+HBue5oGlBJzAbkAkV22WqOX9n4FafhqWrBsuGGgHfqRB7xarUKyQRF9lk9uxKVjbeWuKYT4aAdYMIAgm/9Xlkbhux+Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct7JntvS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0892CC4CEF8;
	Thu, 30 Oct 2025 16:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841364;
	bh=JqS1ZW4S5Haq6ALsyCIjkbD/TJhiOlff5QxS8NnAljY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ct7JntvSPMu0qunI64+t32HqAJUxtx3f5xyY32BtkjhJ0vk+6lyvtDYd2AMIVl6Qm
	 GxXYyAQyaTapaeSVgz3b909mImg2Fuy94d5VSlFbFphOL4VNwZek87rzLXI9vhnX+U
	 a1zf+WxLJmEKfYOiXOiaFLp1NWKRXoaVO4eAo1NiZuzd+733TH6vF6P/vD8x32Nrtf
	 nsG3IAjInfVXQtOiNmzcKu5QxEPCSt1R8Rz2hKfsw3jK9pXVRCzDoj9jrozl7uyXwZ
	 EU/DvVdHOO6aeZfopodi2Td7OEee8ZvoGQlrLi/apFH5lYhlpFvQxrlvlyU5jZlLoR
	 GCka6r2z60LyA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Fix camss register prop ordering
Date: Thu, 30 Oct 2025 11:25:37 -0500
Message-ID: <176184154202.475875.1354439924572755859.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918155456.1158691-1-loic.poulain@oss.qualcomm.com>
References: <20250918155456.1158691-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Sep 2025 17:54:56 +0200, Loic Poulain wrote:
> The qcm2290 CAMSS node has been applied from the V4 series, but a later
> version changed the order of the register property, fix it to prevent
> dtb check error.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm2290: Fix camss register prop ordering
      commit: 67445dc8a8060309eeb7aebbc41fa0e58302fc09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

