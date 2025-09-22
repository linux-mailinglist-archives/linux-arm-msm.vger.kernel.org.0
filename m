Return-Path: <linux-arm-msm+bounces-74462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A783FB92868
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 19:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC30A19057B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 18:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D6B316911;
	Mon, 22 Sep 2025 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADj9m18s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673AF316902;
	Mon, 22 Sep 2025 17:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758563985; cv=none; b=NfUtMkPjC2cFFK/zg3BVm58WAfHiwM9TC5GZWm/XrE+6El7l6k2qfCI+m9wwgsEMRtS5HOcZ08U+iPX1mRkw86OVsd+L0PbyESbabRPHanNMgFw1KG2NHd0uthi4a61va98+jxhDfVfCFXkf3Koro3X1gl61Yr9JftD69Pd/h04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758563985; c=relaxed/simple;
	bh=fJUUurrcgN6ixpFW10YhsUfI4eXPPj1wQsga8UFRrG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6plW9BGS9zPd22bE+0OcsZMAgwoQ14Psj3wL3bhz2iTRvUCVqSAW6ALRPHVjq+ceq1Aq0ME+mTRz7sLxlAr51jWfR+oLodA/zx6FgEFY7rH6yhw6mhQ0GUY95u+wFR2T3ZNpm0erPZOTXXWI66ct2udGzhWqZk5f+3hquINFbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADj9m18s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5457C4CEF0;
	Mon, 22 Sep 2025 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758563985;
	bh=fJUUurrcgN6ixpFW10YhsUfI4eXPPj1wQsga8UFRrG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADj9m18syemd+rLSFrmAS2lXaeAA2Zy9fFJ64DM8rsXHv+qTaqa8gJnoyv/J57obx
	 GHwlo+PS2FG4sOPvoI6iSVnbSUS0NSDjENf64DS39hM8osp4DZodZ0ViDeoFnpHJ3w
	 DGs8lXdcT7b98e7n3QtTWqGED6pYibfgAth91DQWHv7dluXYFkasG1e4QSvUULuftM
	 hyZYhlYtYxZsv7fEK41aS9MzQMMmDWva2LPSHjTl2Ra96uxXiEHBOgogQE7Bn7eojf
	 Pr1uFtGeJsz99Xb2h6Uq6aPegp6R0bVQV+p0u5lMs4z7EfN9YXISPj4BISgdgkYODW
	 GM9Mec4PRUItw==
Date: Mon, 22 Sep 2025 12:59:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, konradybcio@kernel.org,
	quic_gurus@quicinc.com, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org, robimarko@gmail.com
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document Glymur scm
Message-ID: <175856388250.539663.6638962275159268200.robh@kernel.org>
References: <20250918141738.2524269-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918141738.2524269-1-pankaj.patil@oss.qualcomm.com>


On Thu, 18 Sep 2025 19:47:38 +0530, Pankaj Patil wrote:
> Document the SCM compatible for Qualcomm Glymur SoC.
> Secure Channel Manager(SCM) is used to communicate
> with secure firmware.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

