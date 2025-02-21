Return-Path: <linux-arm-msm+bounces-48880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA2A3F412
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 13:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 104093BD562
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 12:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A2F209F5D;
	Fri, 21 Feb 2025 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZZ5wLf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD4155336;
	Fri, 21 Feb 2025 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740140358; cv=none; b=oE2BPHbV2HGnkcDaWUfY1V1zp72GUAY1F7CVLykkfMZDPhzAmXbUfIhicdowpx7UXxVo/VQJlOGGqTmVl+egFT51YW0tOkS9mH3jhrDSr2XPqgDC00rkAjdMWwE1DoaA9tYa2DQGnl2z+p2+CJu3yl3YxL+M0cqHHxCT2TfDwIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740140358; c=relaxed/simple;
	bh=U0KNTaFUX+p6z2lVUkCdSpbxBvvlCxp+c7WOKr3+c8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOE/M23Fa9SkRhPUWTC880DBA7qjXrZm1hlKMVI9aE74A4GRkMCXLAjGWwNh/jy4wL3Ktrwd1zDk0Z/K8CKqVJ41O0b6FYs1eGiDwHuKNoZMrda6PhdhZ/heXLtkJ75dASKX//Io8CorFkngaSCQJYVMkwgbKcwGBbx5q2t5YWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZZ5wLf5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810A3C4CED6;
	Fri, 21 Feb 2025 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740140358;
	bh=U0KNTaFUX+p6z2lVUkCdSpbxBvvlCxp+c7WOKr3+c8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZZ5wLf5VtHPf8ZqzyS32bZ3e0tK1MDH84+jLF1+fXonbYfSETFUwNgz+NAZUn/S0
	 RgeREfRdgPEvaFDFzQ8qKqZN0uXh6dKbnL2hQ7g2AnmbViNhzORic3NtPyTBqeQSjT
	 Pus32lE/bxfMzTE118OJGAgwG0BnLlKcfiwmf9eO2aNNdXpsXbxOg99LLvTHbSJs3Z
	 cfAcWNViw8WESGB708v54Ey3fZVL6c+r1PcxzMOY1OKlHmq2vBQCIHOXg55V2bBNwa
	 L7TH4wpQvmrg84s24EXbEobUxeBTVOK4X7johFfDLQiW+8+gBgC0xW0CZLJa7CD0Dg
	 /6y0PN8IGR1bA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tlS09-000000007ck-27ZI;
	Fri, 21 Feb 2025 13:19:29 +0100
Date: Fri, 21 Feb 2025 13:19:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v5 0/4] arm64: dts: qcom: x1e80100: crd/t14s:
 Enable Parade Type-C retimers
Message-ID: <Z7hvUZiza6DWHZnp@hovoldconsulting.com>
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
 <Z7hGbEUsQU_MUL5t@hovoldconsulting.com>
 <Z7hKXNOwHlLLNtNx@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7hKXNOwHlLLNtNx@linaro.org>

On Fri, Feb 21, 2025 at 11:41:48AM +0200, Abel Vesa wrote:
> On 25-02-21 10:25:00, Johan Hovold wrote:
> > On Thu, Feb 20, 2025 at 07:42:29PM +0200, Abel Vesa wrote:

> > > Abel Vesa (4):
> > >       arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
> > >       arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
> > >       arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
> > >       arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
> > 
> > It looks like you've addressed all the comments I had on v1 (except for
> 
> Oh, sorry, missed that one.
> 
> Let me respin.

I don't think you need to respin over just that. And that extra newline
has already been copy-pasted into two more dts in mainline since (yeah,
it's odd to see the original patch go in after the copies). We can just
take a pass at cleaning this up at some later point.

Johan

