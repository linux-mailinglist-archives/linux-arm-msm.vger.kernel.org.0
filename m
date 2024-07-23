Return-Path: <linux-arm-msm+bounces-26926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E593A8A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 23:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC361C22335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 21:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373601448CD;
	Tue, 23 Jul 2024 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqJvdDdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0483C13DDDB;
	Tue, 23 Jul 2024 21:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721769938; cv=none; b=UI3cI69u5idG0mXwahSN5/knoEGg8BqZnQ6cY+n4DYJrjSg8cAQTH78DGKfX+8maykK0DH6Jj8gvanwBI/0ldecZha9SoyHeEWqQhDesjmOF/7iut+yXqYxFg3w4j/0SUcMcQ/QYizZqxOMeOSV/EkrrwiPI3u1EMOpCGLB583g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721769938; c=relaxed/simple;
	bh=eYT6xMzAX8gcrlTaDVXVrz5u37+vK6FlBeXrlV2yLIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKg65+4q/wDORUiWOLWTUriAtyN41XCCtLPo98GhFN5GArMzrqcNM2StUG9/9ddXbqZmxeiX/iS+oE7QBK/A1pnMA25MRntMvxhwR2+Mph85+Ow9Qq/czBooB0GfpiydYGb/17ifXL25dIy+18XfBXUOpc3z/Wffno+X/jCybgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqJvdDdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54590C4AF0A;
	Tue, 23 Jul 2024 21:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721769937;
	bh=eYT6xMzAX8gcrlTaDVXVrz5u37+vK6FlBeXrlV2yLIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqJvdDdUJDJ/N4+v0K4DykC09Qn5MvXWOYET57v+3KXEcaHSu8jQZSMVuzfFiQWhY
	 V1XU7ioa6DkUjJVBxQc2oc6vwfa+cUTzP0CdCvNnlHJ33FASWwXtFFw0qM8QdqMFAI
	 fgVcHpIPmRnHamwj+Od9a+ySOtdUXY77sanxBNfIPaw9pxO6loxlwOxPf1wGoNB+IN
	 UCnDpLF6+7ksd9upyynm+rMTtq/DV8Uy3DGIC/hSH8VYG/Iq5/JXyIVfODxZBvOiNG
	 lprhNY9n1BEUy+NFhLTYphQ3xPvt7ump2dWA36+e9AyDvSjxY/M88MeOdcundCC/H7
	 kP/zhZ25w2oLQ==
Date: Tue, 23 Jul 2024 16:25:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
	quic_kriskura@quicinc.com, conor+dt@kernel.org,
	linux-usb@vger.kernel.org, andersson@kernel.org,
	devicetree@vger.kernel.org, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Update ipq5332
 interrupt info
Message-ID: <172176993521.1129772.4265722303661810586.robh@kernel.org>
References: <20240723100151.402300-1-quic_varada@quicinc.com>
 <20240723100151.402300-2-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723100151.402300-2-quic_varada@quicinc.com>


On Tue, 23 Jul 2024 15:31:50 +0530, Varadarajan Narayanan wrote:
> IPQ5332 has only three interrupts. Update the constraints
> to fix the following dt_binding_check errors.
> 
> 	interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
> 
> Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v3: In the previous version, the hunk got mixed up while rebasing.
>     Fix that
> 
> v2: Fix patch version numbering. Incorrectly marked the first version as v0
>     Add interrupts and interrupt-names for ipq5332 instead of clubbing it with
>     qcom,x1e80100-dwc3
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


