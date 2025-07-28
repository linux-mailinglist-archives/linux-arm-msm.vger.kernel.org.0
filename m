Return-Path: <linux-arm-msm+bounces-66875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F6BB13D61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 570A63A4F3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE23F264A7F;
	Mon, 28 Jul 2025 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRbexJ/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC22E36E6;
	Mon, 28 Jul 2025 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753713599; cv=none; b=BCZEyCJii1j5biUu9XcIHZrRThJ9yzfbrqrHU7kpY2CT0RdpwfrO0fy+FDWLoKZYq9Q2242lAFuuiGWPblj7nD2Wp1HpAx2IqiS0mKrV3gxkxuSUfyhNKhNdlnZzIoLinrk2fb3C1PHiliL7ylQPEe2NytvTsrDV9yWzixwTvno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753713599; c=relaxed/simple;
	bh=PUa5zBanQ9HQ43Rzwvde8BAW3al82mrfE0Q9RjtSTgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thvIRvLb3loi64neGAiP1AB9cenZlpJloyeIfs2Hz9YaA5KscF9A32jJtjGsfuNByM0sslqdadpGGjpYmHBSLWYa/OcUktZXmyAUNowtH0Rygq3M2nFG2nB4Lcj/QMSEhN+bOcjtg+P5pAxTW2WHo2qLuS5qO7T2UdzjwcOv0U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRbexJ/j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF01C4CEF7;
	Mon, 28 Jul 2025 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753713599;
	bh=PUa5zBanQ9HQ43Rzwvde8BAW3al82mrfE0Q9RjtSTgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRbexJ/jfp/8PjVxvkJBqQNPK9gIP/PYrB+C/kcLS8yOdAznd5nlLl1Ko4tgNI7kY
	 uAbmaumkPsbj30ABFstvuDip9L9zT5xDtsP0ac3X2yRhtWPz2XMsN2dsH5J/X+250y
	 k6uGSD8AJqDZwrRpekkENlY9IvysctA11GsWv52xxIaEhteyVVYoIUiEsAO5SrVItN
	 39aGqOs+kL8XQQfXkm7cLhIyRjNR8aDnhfAFaLyShYDHbOvvEkbUmTIRbF0fd9bBlK
	 yfftcc4XNgmE2h5Gidcbo62urM5DWE+FZ4XTRzHvl7339IXafoY9Pp2rp6LmF6S8F2
	 9FNsd23RwVwQA==
Date: Mon, 28 Jul 2025 20:09:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, quic_nitirawa@quicinc.com
Subject: Re: [PATCH] scsi: ufs: core: move some irq handling back to hardirq
 (with time limit)
Message-ID: <cvh6t2hy2tvoz4tnokterj6mkdgk5pug7evplux3kuigs4j5mo@s46f32cusvsx>
References: <20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org>
 <f2b85e49152b80a63b20aa5ad67dfbee1190e356.camel@linaro.org>
 <53bfd619-4066-4dcb-b3f0-d04177e05355@linaro.org>
 <766fa03c4a9a2667c8c279be932945affb798af0.camel@linaro.org>
 <4enen7mopxtx4ijl5qyrd2gnxvv3kygtlnhxpr64egckpvkja4@hjli25ndhxwc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4enen7mopxtx4ijl5qyrd2gnxvv3kygtlnhxpr64egckpvkja4@hjli25ndhxwc>

On Mon, Jul 28, 2025 at 08:06:21PM GMT, Manivannan Sadhasivam wrote:
> + Nitin
> 

Really added Nitin now.

> On Thu, Jul 24, 2025 at 02:38:30PM GMT, André Draszik wrote:
> > On Thu, 2025-07-24 at 13:54 +0200, Neil Armstrong wrote:
> > > On 24/07/2025 13:44, André Draszik wrote:
> > > > On Thu, 2025-07-24 at 10:54 +0100, André Draszik wrote:
> > > > > fio results on Pixel 6:
> > > > >    read / 1 job     original    after    this commit
> > > > >      min IOPS        4,653.60   2,704.40    3,902.80
> > > > >      max IOPS        6,151.80   4,847.60    6,103.40
> > > > >      avg IOPS        5,488.82   4,226.61    5,314.89
> > > > >      cpu % usr           1.85       1.72        1.97
> > > > >      cpu % sys          32.46      28.88       33.29
> > > > >      bw MB/s            21.46      16.50       20.76
> > > > > 
> > > > >    read / 8 jobs    original    after    this commit
> > > > >      min IOPS       18,207.80  11,323.00   17,911.80
> > > > >      max IOPS       25,535.80  14,477.40   24,373.60
> > > > >      avg IOPS       22,529.93  13,325.59   21,868.85
> > > > >      cpu % usr           1.70       1.41        1.67
> > > > >      cpu % sys          27.89      21.85       27.23
> > > > >      bw MB/s            88.10      52.10       84.48
> > > > > 
> > > > >    write / 1 job    original    after    this commit
> > > > >      min IOPS        6,524.20   3,136.00    5,988.40
> > > > >      max IOPS        7,303.60   5,144.40    7,232.40
> > > > >      avg IOPS        7,169.80   4,608.29    7,014.66
> > > > >      cpu % usr           2.29       2.34        2.23
> > > > >      cpu % sys          41.91      39.34       42.48
> > > > >      bw MB/s            28.02      18.00       27.42
> > > > > 
> > > > >    write / 8 jobs   original    after    this commit
> > > > >      min IOPS       12,685.40  13,783.00   12,622.40
> > > > >      max IOPS       30,814.20  22,122.00   29,636.00
> > > > >      avg IOPS       21,539.04  18,552.63   21,134.65
> > > > >      cpu % usr           2.08       1.61        2.07
> > > > >      cpu % sys          30.86      23.88       30.64
> > > > >      bw MB/s            84.18      72.54       82.62
> > > > 
> > > > Given the severe performance drop introduced by the culprit
> > > > commit, it might make sense to instead just revert it for
> > > > 6.16 now, while this patch here can mature and be properly
> > > > reviewed. At least then 6.16 will not have any performance
> > > > regression of such a scale.
> > > 
> > > The original change was designed to stop the interrupt handler
> > > to starve the system and create display artifact and cause
> > > timeouts on system controller submission. While imperfect,
> > > it would require some fine tuning for smaller controllers
> > > like on the Pixel 6 that when less queues.
> > 
> > Well, the patch has solved one problem by creating another problem.
> > I don't think that's how things are normally done. A 40% bandwidth
> > and IOPS drop is not negligible.
> > 
> > And while I am referencing Pixel 6 above as it's the only device
> > I have available to test, I suspect all < v4 controllers / devices
> > are affected in a similar way, given the nature of the change.
> > 
> 
> IMO we should just revert the offending commit for 6.16 and see how to properly
> implement it in the next release. Even with this series, we are not on par with
> the original IOPS, which is bad for everyone.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

