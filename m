Return-Path: <linux-arm-msm+bounces-77431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDA7BDF239
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9CF3A4E7D4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFC724E4A1;
	Wed, 15 Oct 2025 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnSAVYbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFDD17B50F;
	Wed, 15 Oct 2025 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539432; cv=none; b=nhQJSmAO0X7v1BFoyZRMQW767WYmf9UVgH2LOg/lvbJzR2m7az3lhvQQvM4rVSTheuGO5MbMsUyaEqlT0/lzdkM26i4KtdF8k+vOL13+MicBy0fJHlPIYFctwbXPrlzsbsbPD1QTFPUtXL42yCOhK0gJf8vyqnPCtvZX1X2hXtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539432; c=relaxed/simple;
	bh=BdVewfzADni3rA+uLXMhw0FIoVYxSlv8WO8HdhDGEeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMJKoSYMNT8wntGNxSjbyQbMUGL6AJyK1BQoPQ3wMryelCuOPC2DOd/iomaSSnqBtqw89EJ3GLJOAc5D3Dk0IgcvORu3szq2qyAs3gpPxrVxfgVhagFhSW7dt5NthB9ObGFJApxuRGG2t5VwXYeha6iLGxhgcMlDSCc5q8JqI1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnSAVYbX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AFDC4CEF8;
	Wed, 15 Oct 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760539431;
	bh=BdVewfzADni3rA+uLXMhw0FIoVYxSlv8WO8HdhDGEeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnSAVYbX0pa/TbdwnqgAHLNi46jSc10fCqckm8meRRNlXCmzpes/MSgltOMJe09Ug
	 JxdyInJGKhLHxSlIgFJYP5d1DMa/AN+TmOb6ZU2mngBuBTa4kiL0a7IlbiS/i8S+En
	 /g4iXr3ZZjsFXgBInBqjDkI8vQ+S34EDoT113jIB013olFZ4zSjfvHAcPKJhj9WFs4
	 m4yFWLccda0qiXQeUmNJq6scITEXvAsc57cu+xGApgTtwsq6T+ZXd60XHE0JrriWE+
	 DDvL41D7J1pPoPbzucyHLUzWqhosGqSBeUrK2nvYQ0B3z5PDNtoU2YzTocZjSKawIk
	 hvNZK+1DARCAA==
Date: Wed, 15 Oct 2025 09:43:49 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, robin.clark@oss.qualcomm.com,
	lumag@kernel.org, abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com, sean@poorly.run,
	marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org,
	quic_mahap@quicinc.com, andersson@kernel.org,
	konradybcio@kernel.org, mani@kernel.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	vkoul@kernel.org, kishon@kernel.org,
	cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <20251015144349.GA3302193-robh@kernel.org>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
 <xofvrsdi2s37qefp2fr6av67c5nokvlw3jm6w3nznphm3x223f@yyatwo5cur6u>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xofvrsdi2s37qefp2fr6av67c5nokvlw3jm6w3nznphm3x223f@yyatwo5cur6u>

On Mon, Oct 13, 2025 at 03:37:47PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> > Add edp reference clock for sa8775p edp phy.
> 
> eDP, PHY.
> 
> I'd probably ask to squash both DT binding patches together, but this
> might cause cross-subsystem merge issues. I'll leave this to DT
> maintainers discretion, whether to require a non-warning-adding patch or
> two patches with warnings in the middle of the series.

One patch.

Rob


