Return-Path: <linux-arm-msm+bounces-67053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7D1B1596C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A49137AB71C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 07:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3B023E33A;
	Wed, 30 Jul 2025 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jS9+vL2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2668922A4EE;
	Wed, 30 Jul 2025 07:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859759; cv=none; b=ou57CM4/uFFNhDhImrRkbMB2W1WK7p3YwfFRgC4E4X7NFyMuPQ0Q/O926uc02p/07i51PNEGB89+K7ywDZwEBNmGX0p9ABdfmjhYkviT1x6aC39VDaWR2BBAbCo21eOBKxMRXjttwakSF7AXfZzRw8GnenmQaRY2vYmFL/AwD2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859759; c=relaxed/simple;
	bh=Jb2osp3Mh4btRoO6IabTe6l8x0W/LsjmNRDdLsaEj98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTWnaxxq+ZGf/uDWTes6ZPYFVa5YGkrj1FRv2HVx4hEfHrJSr8FCfyYk5heCGQSdltE7l1KFj/sbBdYC6SN29NT9NI13PGPjis8LIPYZr3U1fcerwdxCCv6hE8An6/osfWg4qHPoMEMTU3W/Pp194PZSzUvUDl38ZW0bduXpG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jS9+vL2g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CDDC4CEE7;
	Wed, 30 Jul 2025 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753859758;
	bh=Jb2osp3Mh4btRoO6IabTe6l8x0W/LsjmNRDdLsaEj98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jS9+vL2gwjfZo1I+3ARBIrn1BU4lMN9dqp9ShXj94bOh1HTyYtu+N6TkJPY8gN6P/
	 Jnyi6n/jXPOd0bI3U7FuyrvLpXvy46/PhtxZxMcu2enPv699SlD+y0OFvvph1QYhoK
	 HUvRBxbJ062j1xU2qNB1wXeH7lf6o3GYQMO5N815jajerzsF6x9efDKD04hUT2RpzN
	 OqoSM0U/1A/0B5bUMuJJMAxeFBKOcGF8DRwnFy6e1aeY0XawbNyVu4xqf54tSbZKX5
	 QX+p0VPON7Vt9dq2dMRn3myKVmwqpQsV1jutbgOAYKfXA6P5/fs/AxrhE+Emb2K535
	 QWdDzltmRObHQ==
Date: Wed, 30 Jul 2025 09:15:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Message-ID: <20250730-mottled-anteater-of-renovation-92b2ed@kuoka>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-1-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-1-227cfe5c8ef4@oss.qualcomm.com>

On Tue, Jul 29, 2025 at 11:12:35AM +0530, Taniya Das wrote:
> Document compatible for RPMh clock controller on Glymur platform.

I do not see how my v1 comments got addressed.

Best regards,
Krzysztof


