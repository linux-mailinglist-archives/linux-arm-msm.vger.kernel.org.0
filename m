Return-Path: <linux-arm-msm+bounces-66879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22FB13D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30D633A2942
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FB626D4CE;
	Mon, 28 Jul 2025 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlA/eCN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0BF25DCEC;
	Mon, 28 Jul 2025 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753714082; cv=none; b=fUZa2tmfx8EGx/ry/MdUAjACbHZDr0tdI+gBVp4HkfcBGQxNjKPGiE+Lc8aSDnCSA8OhpuQ8DzZKiBzulET+VN3eue8LKmdz4KJBWT/KuVMaOL7WnJyRgXYS1BCeKZIrT98Ep+VyGPUaCZ4O0plVVi7oK0vTnZ9D5jLwYmxU984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753714082; c=relaxed/simple;
	bh=hgWX3t8Zx4JdZFwGvbI7bV4aF6BKP7D9tMePDpMpX50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4WYddjKEZk6k9YEiragM0bk3SKQyVgh04WvsyfLgiNVTua6JiOKzOK1sdHsJD0hDbwippmjXCuCnYzlgkhQtG6ICO3bpJ63KxYRHbynVlI2wccG1Np7ZcRVwJgPMpAMm6XffEGZ9oori6MYVWc89CyMhh7fJD9L0dAXOlOvMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlA/eCN9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1219EC4CEE7;
	Mon, 28 Jul 2025 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753714081;
	bh=hgWX3t8Zx4JdZFwGvbI7bV4aF6BKP7D9tMePDpMpX50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlA/eCN9Q9TlIX70BTkXsdGvML8F4MP7AWG1mf22D7WGvl8KHcwaPSCRbTswuEkTD
	 6CrWxjAFzCbgR7PCAgHIVMZ+SCZyU3WHwuWjNlSBm7C8P5iKOuWOg02O+MXIW8QCci
	 1zSPZOOCGoe5uEuZ1E6pKHrbn7w3l6hwIkukSmQMBmELwaCTNmD2fuZ6ObCUStdSTn
	 rJcT8en5dYvabQDbAXvhZl0C1zGb94HpAtoolCDSoGbMqx3q8yAtgXFlBDSvB2Wjes
	 1UQmulU9nC9U3a+uTVTmw9ViNDba6lPZ5pB3S62vm/6SjrZfw28PVxP7gERA+oxnlC
	 5By2/fFYX6qtg==
Date: Mon, 28 Jul 2025 20:17:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, quic_nitirawa@quicinc.com
Subject: Re: [PATCH] scsi: ufs: core: move some irq handling back to hardirq
 (with time limit)
Message-ID: <cywyqqkl3t2627ob7t33ibxarnhl7v4ykamox4y5ppcmrp5bpb@65bqck4w4gdh>
References: <20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org>
 <f2b85e49152b80a63b20aa5ad67dfbee1190e356.camel@linaro.org>
 <53bfd619-4066-4dcb-b3f0-d04177e05355@linaro.org>
 <766fa03c4a9a2667c8c279be932945affb798af0.camel@linaro.org>
 <4enen7mopxtx4ijl5qyrd2gnxvv3kygtlnhxpr64egckpvkja4@hjli25ndhxwc>
 <cvh6t2hy2tvoz4tnokterj6mkdgk5pug7evplux3kuigs4j5mo@s46f32cusvsx>
 <754d5c83-ba83-40d2-9309-8eafcb885b9f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <754d5c83-ba83-40d2-9309-8eafcb885b9f@linaro.org>

On Mon, Jul 28, 2025 at 04:41:41PM GMT, Neil Armstrong wrote:
> On 28/07/2025 16:39, Manivannan Sadhasivam wrote:
> > On Mon, Jul 28, 2025 at 08:06:21PM GMT, Manivannan Sadhasivam wrote:
> > > + Nitin
> > > 
> > 
> > Really added Nitin now.
> 
> BTW what about MCQ on SM8650 ? it's probably the real fix here...
> 

Only thing left for MCQ is the binding/dts change. Nitin should be able to post
it tomorrow.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

