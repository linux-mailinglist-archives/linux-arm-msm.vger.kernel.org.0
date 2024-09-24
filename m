Return-Path: <linux-arm-msm+bounces-32377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E250984EFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E0CB1C2237C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C84A15884D;
	Tue, 24 Sep 2024 23:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mj0E2UXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A813DBBE;
	Tue, 24 Sep 2024 23:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220733; cv=none; b=rf98nHuYe1jSE7ptnIsko2RIYV+6fr8I+ioNlgQiJs9z4EdKIukA5tEse0YuFOvPdBx2pA5BWZTbLiOxa69JD2PTjYkrQh/lOjV1IHBYPpD/vObU/B2+N78wKj4e1IV6mr4epAcU80Jb+iSfpomM39Sp3DSiHlbSZYxIkCq/buY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220733; c=relaxed/simple;
	bh=UfCCbpmXVcjdOqJTj14QxcQM1A7Wdxall6s6ZzSrNvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8Lv6KWQ/LWkJPr5yLKzYnq7K4gk6lemHz/Bw4mBjRGTEPI5m3ZbbSH2mqT0FdkTpguDaimUJkvZiX3rBsHZApAEk2WX6sYyy9EU940BgzHd7VkFC49J1yUwdFmRHqwbronrxv2DUyl3nuHDMbJ+J2RSmQr2eM/6fh2fVVnUfOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mj0E2UXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8227C4CEC4;
	Tue, 24 Sep 2024 23:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727220732;
	bh=UfCCbpmXVcjdOqJTj14QxcQM1A7Wdxall6s6ZzSrNvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mj0E2UXBEOoyAtl65xse+QJ63HGIPV+DAlUgsocGL/JX83+uHe6YzgJcjBblOBN9v
	 kbXMaf8P9mnfW8nmA9GKohjawwhmbkdcty4XVRLnFNCbyamgg18Hot179t9mxkzu1S
	 CjPG1PqAkLzqeRtplT8TtS+5ufpP3X9kwPfhsiz1hOB9kzc5MN2OfVvQwb5sfbIOwz
	 F3kRhPWBXgu1CSi390d14uuaUJzy2IYZ6HLGkRGTot+WGDlAmIkGkP3h6kPCp6IKnj
	 aOBk9OTyi8ZDeW89r9HmNGxApiSV4ufhjroygL9c9FxWJ9vmyp7nEvMESnXCqOJ7em
	 DGNKP0OjGLaPg==
Date: Tue, 24 Sep 2024 18:32:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Song Xue <quic_songxue@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>, kernel@quicinc.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document the QCS615
 LLCC
Message-ID: <172722073055.575740.12227678771026039526.robh@kernel.org>
References: <20240924-add_llcc_support_for_qcs615-v1-0-a9f3289760d3@quicinc.com>
 <20240924-add_llcc_support_for_qcs615-v1-1-a9f3289760d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-add_llcc_support_for_qcs615-v1-1-a9f3289760d3@quicinc.com>


On Tue, 24 Sep 2024 18:07:11 +0800, Song Xue wrote:
> Document the LLCC on the QCS615 platform.
> 
> The QCS615 platform has LLCC as the system cache controller. It
> includes 1 LLCC instance and 1 broadcast interface.
> 
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


