Return-Path: <linux-arm-msm+bounces-87217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DF9CEE55C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B05630019F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3502F0689;
	Fri,  2 Jan 2026 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JecgUqvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8332EDD4D;
	Fri,  2 Jan 2026 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353194; cv=none; b=WT/ZIgxHb9gzSO80nZi8IjKbuM98FcyDRrnSnFxnzD3A6Y7CKEukACC++mhnF7mvzrGtwzwqOx004oTn6zEBc4qbkkVL3D62O9oXqsON+d3TzG9cHZy0etx5C1Ueh9ksk5q+mhazq9WISwX/AYsuuBfzu8LDhAXARcL4yEGbV+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353194; c=relaxed/simple;
	bh=CSBspIjn8I+xud4qQsoEe2yu9mZ/NuQy++qx5UJVMFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSpVIy7s3VIysfjxhWA2Y/mNmjLrK1Ubp1rgLI8NL10rek2K+7gVk4KohSUcFYFIgdSVUXGuU4tTcZFZcl1G5VcazwCiI8alIRdqtHB8rWu51lXfwFup8esbbqNwvc4CQWqm5tQTZazM8C46knN2qIkFWoTfe9YFa9q6X0m8iQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JecgUqvF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EE1C116B1;
	Fri,  2 Jan 2026 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353194;
	bh=CSBspIjn8I+xud4qQsoEe2yu9mZ/NuQy++qx5UJVMFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JecgUqvF0455QsPgXg1sYhnRTw6IlfmpnMhgp62MODggrEOnidNA0CHhLC3TvpM4I
	 4aP5xbM+FCNsdHfCkMSA3MR9m+N9sLS+af9j3RvO3C5FL0Pr3kSiMyEVLP1Op4F9yK
	 pI++ElQJwZmXShtxZ+aML1vpUkyMe5pi1NneqiC3WTHluodNe8MM+rvlYeInFbyiGH
	 PogwMU5YaPdYXHzOmKWqfzq/3vNnBs4QH4iCUnbKrTbjYmmI9f/M2gYUbi7oSQEEkt
	 Mvp3hZEoGpx96gFi0dGvwKdDM30YZhyQEtomJzYfBMWIpK0H0NrYMfm7gjl8Rl8hD6
	 liPCCTTcBvIfg==
Date: Fri, 2 Jan 2026 12:26:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com, 
	andersson@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, manivannan.sadhasivam@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V2 2/4] scsi: ufs: qcom: dt-bindings: Document UFSHC
 compatible for x1e80100
Message-ID: <20260102-logical-frigatebird-of-elegance-8abd82@quoll>
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251231101951.1026163-3-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231101951.1026163-3-pradeep.pragallapati@oss.qualcomm.com>

On Wed, Dec 31, 2025 at 03:49:49PM +0530, Pradeep P V K wrote:
> Add the UFS Host Controller (UFSHC) compatible for Qualcomm x1e80100
> SoC.  Use SM8550 as a fallback since x1e80100 shares compatibility
> with SM8550 UFSHC, enabling reuse of existing support.
> 

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


Best regards,
Krzysztof


