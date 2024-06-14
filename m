Return-Path: <linux-arm-msm+bounces-22753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0179909440
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29501F2119D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00755186E57;
	Fri, 14 Jun 2024 22:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzrzyEjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A2186E50;
	Fri, 14 Jun 2024 22:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405339; cv=none; b=olFffoW0bSeNabr2//GrxkgcNdSOEnlOVQo51pyhg3ISypIbIdWKENoYvSeAqk5ZaJUKYdmqnRl896Zy442q650zkly+2UtIAtw2icWg936poUBcq0xiORLgh6JaX7HP9aLhBaLbI/6cPl7ncfbHXsy7JjCFTsWj26dJr0qOCDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405339; c=relaxed/simple;
	bh=UB2dyq2YKXi+CwfD4VFvpLWhniVpGZGbq09DF5P2wbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JKi3R/87zzMa5kdUKpJ3ZZXAGweN7dSNNYbHvZF8LjtBhjswMCoCh8JcRitGpxbeg1h/4eVPSJ0kaxGs74FkwDXHMrxmddYKEWxq84B0kUplN6OGNQhyG8SSjwjleLbRH2vkOm0OxWBkhq1QQJeRm9cnM6ayWBs74Tt+4jvKVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzrzyEjt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C20C2BD10;
	Fri, 14 Jun 2024 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718405339;
	bh=UB2dyq2YKXi+CwfD4VFvpLWhniVpGZGbq09DF5P2wbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HzrzyEjtTELe122vYtu7ZuY7R5yFv9Q4+hohAQZzKb19Un0DuhGfnGhIRBioqaTXK
	 pDzCVddIEQXlRUOkIC4lP2NISbEsAGhScXS9bMjEDQ33SgHv7DfmVF3/JMh2MrzRJv
	 NNXY14PqAz8IOAWv0IdFZn4dcLMAn69uG0MnQuDtebs3TDo4rawgapTpUa4gpsAV29
	 OueL1arucQ6BgmDwc//EVeZ2LbuEA620ATQ18S6pUQGSYSvuI0ZZ1qWIn5sutdkmMj
	 ZlNhjPuMIQzPa/BY1OZ5HzocZ1vBvpNd0Q2t/WUnOLtkvxC/g4O8DbmoFsosnZj6ON
	 WegJHN1KT6XEw==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	regressions@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink: disable UCSI on sc8280xp
Date: Fri, 14 Jun 2024 17:48:49 -0500
Message-ID: <171840533353.102487.16743739137970732641.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240608114529.23060-1-johan+linaro@kernel.org>
References: <20240608114529.23060-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 08 Jun 2024 13:45:29 +0200, Johan Hovold wrote:
> Disconnecting an external display triggers a hypervisor reset on the
> Lenovo ThinkPad X13s since 6.10-rc1 which enabled UCSI. Disable it again
> until the regression has been fixed properly.
> 
> 

Applied, thanks!

[1/1] soc: qcom: pmic_glink: disable UCSI on sc8280xp
      commit: ad3dd9592b2a1d2f9e6ffeedfd81602f91f1ba09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

