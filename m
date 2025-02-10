Return-Path: <linux-arm-msm+bounces-47427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8FEA2EEAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 14:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5622A18840EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 13:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCEF230981;
	Mon, 10 Feb 2025 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tf2Tutfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DD022FF20;
	Mon, 10 Feb 2025 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195249; cv=none; b=qwz9P7oaFZDySO9HpdoDEeA+88mjI/Sr/0NGXx11YlP72nPwNrVxzKt8/BMALqp5b1dJQIDpY7RkzP2SEk+4UnBgGalOCSw1l92urWVknzv3Bx/R2WOY6VZhShDxUQajw0JOYzG0UG7x0dnw8i0AZkz9pIEwoyMucjQ6xm5a5oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195249; c=relaxed/simple;
	bh=GQIg/qzTkdQt12XkEzoqVOvjfLXCEHK3wkZK2PhNg1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieTjPiSPv9+B09NbC7pp8xIKMrtBgOEyjz2uazIfdt3T5BIWMJK0sPwgHVgP111ZmnGYOnUwqYkv32iR/vs9794KE+PVTm47bhcjbVXK9W7MZdnNr11KpBxiD489jUEj5vR3fUwuXVFRgv3gGlSNR2kcFupkFoU9h7T8pmv3K0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tf2Tutfz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1E6C4CED1;
	Mon, 10 Feb 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739195248;
	bh=GQIg/qzTkdQt12XkEzoqVOvjfLXCEHK3wkZK2PhNg1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tf2Tutfz+qg+Uazg4hu74ykNZqF9v7tZfIiTps68lSnloHakqUV7/NDEV7oHPecTA
	 kvlGEynA5YMQda9POZ6yZ6wvZPaHj2k5cWiMtsbPIz+s03HRVHUxhN6lHgMmQMrGcF
	 3MCpTR22toIUmJCN0qlGjbUZS8kQV+j3CKYcwdP9pfUmSokMuI2xOxXlpzOT/1W8F2
	 pHZW/UlPNARPmERYGTPARe/mKjvxv6rPpqJVtdvPMw7ApoGzhcBpt5TiuTA68FeS63
	 ABymp8UOKj3WE31htwjwRCsYpL4tQnTGeHkBu/STlRwSz2OWzejvDsZbqLqeJZnaPM
	 OXR/0Y3dLR3pg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thU8M-000000003zl-0CKj;
	Mon, 10 Feb 2025 14:47:34 +0100
Date: Mon, 10 Feb 2025 14:47:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Yushan Li <quic_yushli@quicinc.com>
Subject: Re: [PATCH RESEND v5] arm64: dts: qcom: Add coresight nodes for
 x1e80100
Message-ID: <Z6oDdq-qAJPf9-ef@hovoldconsulting.com>
References: <20241205054904.535465-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205054904.535465-1-quic_jiegan@quicinc.com>

On Thu, Dec 05, 2024 at 01:49:03PM +0800, Jie Gan wrote:
> Add following coresight components for x1e80100 platform.
> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> TPDM, TPDA and TMC ETF.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Yushan Li <quic_yushli@quicinc.com>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

This patch is now in 6.14-rc1 and results in the logs being spammed with
200+ messages about cyclic dependencies. I'd expect something like this
to at least be mentioned in the commit message:

[    0.250732] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.250854] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.250881] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000
[    0.251011] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.251128] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/funnel@10045000
[    0.251155] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
[    0.251184] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.251251] /soc@0/funnel@10042000: Fixed dependency cycle(s) with /soc@0/funnel@10045000
[    0.251329] /soc@0/funnel@10042000: Fixed dependency cycle(s) with /soc@0/funnel@10c2c000
[    0.251359] /soc@0/funnel@10042000: Fixed dependency cycle(s) with /soc@0/funnel@10ac5000
[    0.251388] /soc@0/funnel@10042000: Fixed dependency cycle(s) with /soc@0/funnel@10cc5000
[    0.251449] /soc@0/funnel@10045000: Fixed dependency cycle(s) with /soc@0/funnel@10b04000
[    0.251538] /soc@0/funnel@10045000: Fixed dependency cycle(s) with /soc@0/funnel@10042000
[    0.251571] /soc@0/funnel@10045000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
...
[    0.301268] /soc@0/tpda@10d12000: Fixed dependency cycle(s) with /soc@0/tpdm@10d08000
[    0.301462] /soc@0/tpda@10d12000: Fixed dependency cycle(s) with /soc@0/funnel@10d13000
[    0.301520] /soc@0/funnel@10d04000: Fixed dependency cycle(s) with /soc@0/funnel@10d13000
[    0.301582] /soc@0/funnel@10d13000: Fixed dependency cycle(s) with /soc@0/funnel@10d04000
[    0.301639] /soc@0/funnel@10d13000: Fixed dependency cycle(s) with /soc@0/tpda@10d12000

[    0.317624] Callback from call_rcu_tasks() invoked.

Has anyone looked into what is causing this and if anything can be done
about it?

This is taking a fair amount of time to process and print.

Johan

