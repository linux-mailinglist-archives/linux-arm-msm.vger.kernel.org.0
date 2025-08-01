Return-Path: <linux-arm-msm+bounces-67308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09244B17E4A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3966E585085
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD94213E90;
	Fri,  1 Aug 2025 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkRQWuZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639451F582B;
	Fri,  1 Aug 2025 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036911; cv=none; b=FpRSaFwXdOKhDlMkYQecl9WykQNOIUvmxyZuhGLkN+6J3I/1WlZXrHISu9pBIMCgLMf+XciFEDFj7gzS58JIxidnWhdJxW0tOVhlaWKzaNln8DyeP1Ko2YWZc9SlqnUvDNLbpBIt5dA9ck46/Z+SOejrAxo4fH3vtLaNCqu6ehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036911; c=relaxed/simple;
	bh=s25N135ltq8WJ9a34RrqVPJNf9H23yF9f209W/13UaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhEO9LcrFrkHC/ogb6unTNltFtAmiRV2EjGvYvBD2db4EzRL5CRgh++kIwKHRVUAcJFS+Hgd6FmpYwxZWgqwrXNGq3UvyousA9sMr6DxVHJK4F8q1355pwTDxJvS6EZ7kqgnhMz0T34ZlDrj5rba4XMwkj11EtBc81/hzr6IMjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkRQWuZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A2CC4CEE7;
	Fri,  1 Aug 2025 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754036910;
	bh=s25N135ltq8WJ9a34RrqVPJNf9H23yF9f209W/13UaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkRQWuZhZlYXZgh6pr7x/S8HuTitA8yKt1xaWBxX9QkuqKYAQaFJBjRBV8Aj8xx57
	 lqcjvB4n8kdTB/rVkZUhBZUP6pM+aIfupQGxNfpfyKR/ql8Ijd01PXHRgOKQX46ybu
	 Ct83DkGH48842gSN7fETTyiUnjPZE1OawxYjTqGiakOhMM7lwu5iqAjvZLYXWv6JNm
	 noR08dmc53rnx1H1pp0fnNmrHjfkc7P7xwwt4naH6Fme339ttLeZw1l3Nw6F6epXEg
	 ZXvW0urTL/ULSGj0DDf+TsYUNpvkGRFpZkVmZZOb/jvj+DiuA6JlrDgSXmStW434X6
	 MdgZ1PYaln/xw==
Date: Fri, 1 Aug 2025 13:58:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Message-ID: <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>

On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
> > Add optional limit-hs-gear and limit-rate properties to the UFS node to
> > support automotive use cases that require limiting the maximum Tx/Rx HS
> > gear and rate due to hardware constraints.
> 
> What hardware constraints? This needs to be clearly documented.
> 

Ram, both Krzysztof and I asked this question, but you never bothered to reply,
but keep on responding to other comments. This won't help you to get this series
merged in any form.

Please address *all* review comments before posting next iteration.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

