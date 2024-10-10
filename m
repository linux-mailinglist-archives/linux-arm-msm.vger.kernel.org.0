Return-Path: <linux-arm-msm+bounces-33777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B77997D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB3C01F24B19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092BD1A08B8;
	Thu, 10 Oct 2024 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5jdsjv2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E019DF5F;
	Thu, 10 Oct 2024 06:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728541018; cv=none; b=UojtjdBE5rmJpOi1S3vLgrXvzfSjskXm4xd5E/eF7xM//IPJafgHLbZ86F4c9rOLrL8jRv6XUAFZ+IzKZpFY9EfDOAm1umcycoXzihDtbuoQ76jV0nlrem44UUn7Yl92B19OuKSJHNHcn+h+VMv/v+yT6JUvD0wi3+g2oEL/Ckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728541018; c=relaxed/simple;
	bh=e5F2DTXQNsdHHOUBjf9FaoLLhBCkokFPX/3P71omnGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au0k+9QuuZR+Bt/sycPNUs4d4V0iQ6syyb0xt6/b9T3aIttH7pOMDqUTct5azTIvMTra9pUGlTzhNB6EdtNUJ+s29yAp74weCs3zvqfeM8xuhyUFoIvTKWtIKibvPvbRKr/cS1YZwpVIokVZeFe/aJq8qcnBQI7PO5+gFIgQZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5jdsjv2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE7AC4CEC5;
	Thu, 10 Oct 2024 06:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728541018;
	bh=e5F2DTXQNsdHHOUBjf9FaoLLhBCkokFPX/3P71omnGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5jdsjv2QLn/NoTvOJ73W0/U661F4m2JQ2RVV4925WXrKUK5cjfEUYFF2KLRV0fR6
	 2dUshvF4lBpb6vjCG8v7T+048aCuMhiipKQfjophBh5Rus/4PO3p1NFQgwOjCbCO9z
	 Zx3rGTqzIhO02pOVzXXKdoz8f1yLVLACnRoZV6SvuaVhYnvtfiMz3KDn6+G5awmVoE
	 Bt+zJ2qt34RQgdmGoQyy0pkNl3O2lZREp6tZYEgLc212EHMVX/wOdPg2xE0yyFikze
	 ExRvhp2P0fAkPc0KZbHhTEVpiPk5bghYmMRIq4l2PIDmMvyl+l7CuMIYCIEVFn7fP3
	 blTFkR/XLUHSg==
Date: Thu, 10 Oct 2024 08:16:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: add qcs8300-ride Rev 2
Message-ID: <znm4hf6pjalknristwhp7kuxyxjt7dchwq42bpubcoxaof6ksx@gxvcxt6joauo>
References: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
 <20241010-dts_qcs8300-v1-1-bf5acf05830b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241010-dts_qcs8300-v1-1-bf5acf05830b@quicinc.com>

On Thu, Oct 10, 2024 at 10:57:15AM +0800, Yijie Yang wrote:
> Document the compatible for revision 2 of the qcs8300-ride board.

What are the differences? That's what you have commit msg for.

Best regards,
Krzysztof


