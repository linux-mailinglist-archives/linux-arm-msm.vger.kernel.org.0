Return-Path: <linux-arm-msm+bounces-25431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C992957D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80D1281E88
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739BF13DBBF;
	Sat,  6 Jul 2024 22:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LD2XJkTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789913DB8C;
	Sat,  6 Jul 2024 22:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303299; cv=none; b=X0PahOuEyI2rWW+ci8e5Bif5xRukobh2moGQUjZ4bkAACKiHJEH4M9uOf+JpdDCevcnPQ6b3IflNb1t+UWFWwhqbdeZnsoOR2bp49CTGLwvvWwuwwX08308YtMuUMaeqVS4LpeTCalVmDqGiaa5Akuh4VawUX+VZ26OYFotzQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303299; c=relaxed/simple;
	bh=BkR0xezcBGuIdODhkBqUAuMIdlzzFqTiL5LXfmmN5xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V2Mz73R0UvHXdtgFk8N4v4X1KgCgAoVYwcqEgGiglfmycz8K9SdJcZt0FoaMpVDCKMmF9L0KSwvae83DHY9jhiZ7+9Q6ZBTEK9mS4CAg4+ybpVKYF/U1jAQj1+FF0PTQC43AVdoJdLDkc/krKReDJ6haUpXVA0j4YFo+gblIIiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LD2XJkTP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97771C4AF0C;
	Sat,  6 Jul 2024 22:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303299;
	bh=BkR0xezcBGuIdODhkBqUAuMIdlzzFqTiL5LXfmmN5xI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LD2XJkTPgUyJGp3A8Pfl31TEZtx9vuNwXaTav3x7AYHJUm9nN3ICiQgOkVNfEZDAY
	 S5AQWrHA4FozFU/IpMMY8T+jadAMyLgLjYES7q2/qGG3SIHbMpHILiXxxqzcLJjew8
	 Sa/8WR+tfsGEuE7C3j3/Gufz+CDR+8yht0Om/yJOOBBZAj3PHe9284n2P2abQiqzL2
	 RTPLHEMNgEsXVzJ/Z04bH3wI88COmLeBMJNEq88SN2tmX97//ThOZj4za8RyJcWsHN
	 ta10T0H4LD7szAnAWS98bhCnDEEKX9x8lgUlr3gIkMaMiSLBnAMKSZkDzE8LOgpCLE
	 o4r8WambJSIeA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add PM6350 PMIC
Date: Sat,  6 Jul 2024 17:01:22 -0500
Message-ID: <172030328796.28909.15332957935146792645.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703-socinfo-pm6350-v1-1-e12369af3ed6@fairphone.com>
References: <20240703-socinfo-pm6350-v1-1-e12369af3ed6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jul 2024 09:01:03 +0200, Luca Weiss wrote:
> Add the ID for the PM6350 PMIC found on e.g. SM7225 Fairphone 4.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Add PM6350 PMIC
      commit: 6e697467c4d1f07839ad934dea322fea6a460e4e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

