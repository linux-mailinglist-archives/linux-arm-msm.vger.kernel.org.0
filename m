Return-Path: <linux-arm-msm+bounces-34886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9039A3703
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44DA41F22EFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93AA186613;
	Fri, 18 Oct 2024 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+NhkYs4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA07185B67;
	Fri, 18 Oct 2024 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236118; cv=none; b=azlwDGp6uvS0uBSgJGygndEAjijvnI/PfstUIppXyT2pCSYq87GzRIZVXk+Bc2vMsv9WTY5OoL0lLiMT8P1ypT/7vjrTgDRjTBiAqmph5bNBCZf+fw1ksAX8cIDRXlvDJwCSuZSQMskt3/Gz9crywPR3RkWfX6sxugiW5nrCzAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236118; c=relaxed/simple;
	bh=7mrhJWx1/Ip5zn8vZQ4ONTYWYZNli62LpOKaUfRX1N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOTvbJQLN1QwWs3cp8y1WFaoF8KccC8urILgpZVHvxkRO/FxqKZwD6rhiC6DlL1Wbc2zQCvYZgkDjtyfvoMeLdAdsm051hX63pgZpW9e00PJdsZFGdaysbkukjdgJ4bPRyMs/7MTb2YcAj41/AGGzxg9kXvH1KhkJHxIeBavnV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+NhkYs4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF88C4CEC3;
	Fri, 18 Oct 2024 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729236118;
	bh=7mrhJWx1/Ip5zn8vZQ4ONTYWYZNli62LpOKaUfRX1N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+NhkYs4XbmJUCQo0AwMkpmRufO8xiQRhM8a3FEE06swkd6wEMIqHh+W5MgokR0hV
	 SuJ+XWMqIbnG0+p4q7kgG5LTzFzuetwhH2R81DPmO1gmUTVHqLpIUJBeKQ3aXuHKGG
	 G5t2TatH8Drd8v84pNisIWx7ZAM/C0Li/W5P0mrjW+Q42agGkjjLB6BYDOv8OyRjhV
	 h8LuFINiab4ekE3UmqqJ0L5iISabzoyKUavGjRKAH8hMx1v65p9hdPICfsIPr7ae44
	 4CzgX8qxtRzc7sIA194DqQzu3/wHGCb6o4L2GCeok0OxuEGJ9tUQy2HfPY1gvJBMZ5
	 A+AfjReZ+2qCw==
Date: Fri, 18 Oct 2024 09:21:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add SAR2130P compatible
Message-ID: <uqgeolsgxysan2akv3jjazydxdvujoqhgjri75zqqkb3vjg4d6@al3guszzyinu>
References: <20241017-sar2130p-mbox-v1-1-906aa78b1358@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-mbox-v1-1-906aa78b1358@linaro.org>

On Thu, Oct 17, 2024 at 09:17:23PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the IPCC mailbox controller on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


