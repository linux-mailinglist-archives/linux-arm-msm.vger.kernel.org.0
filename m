Return-Path: <linux-arm-msm+bounces-79567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33163C1E8E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EC51188EEA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C702A2F7AC6;
	Thu, 30 Oct 2025 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2/pAB6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881EB2F5A37;
	Thu, 30 Oct 2025 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761805629; cv=none; b=iI02nDeWMR8fGck4fwf0rkpcdgUK/Ifkc14fl0cg33vKEzIl30GzTONT6M04Ms1RYjJI26vYSUlS7pjFNd2rx7tJuxmq2dX8TW59zmakJgBgR/ne0qXTlVvQsu9dfoT3U+OSPDRKUDIoZnMe75RxH6r4YR1dnvKIB1jWJUBkq6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761805629; c=relaxed/simple;
	bh=ddfNnykgmJ0hUtZDbj1dfRzSULSdSUeOsfYbwkEMGG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/lHMI8W3x2gdJ6ufWgAAf+D6+5WJzHKLmgvycRWw6BHjAdr7Ytx+aiv8EK9ZYLuZ1HDwByFLVoQa18ephfWDzxBlPYFqt7MBTi/xQv+96hjHO/PtcXd+LtbRU6NMWwduzVBdIC3unWxslfQ5fL0bv6ixTchRzwhnEqhRL32e8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2/pAB6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59615C4CEF1;
	Thu, 30 Oct 2025 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761805626;
	bh=ddfNnykgmJ0hUtZDbj1dfRzSULSdSUeOsfYbwkEMGG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2/pAB6xSxUbfLzXaXcC0ZhD1Kk+2KvdwJI/0Powh3TllWaT0GfxSjieKPA83BOYX
	 Mgp+XtRQvz9NjYzUInWW+pW+ouUHEldXx3e4QlkwIGNvg7f3rGf6c7wcFLSbkJDat9
	 73TEfC+I7yua11ypVDbvhfXB8zM9UJv5osh3VlMQRcyGQmwm4CQsAnoY0oaBQ7VX47
	 0Zkkp9d7fTFlZyl/PzZ54u8bPagjY9MgTCiWOfL6xNyFa6/Quv1oTa7l6WJoti6K/7
	 kb+rtq0R1anzSlSS0KM8O+2fJrpIDRHNK2T7lZL3vgfyZTwasE6jbKBRjBWekrCn2t
	 yCEdxtRoDIVnw==
Date: Thu, 30 Oct 2025 07:27:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
Message-ID: <20251030-venomous-apricot-falcon-b3fd64@kuoka>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 01:05:41AM -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states" and "qcom,smem-state-names" properties and
> add conditions for the "interrupts" and "interrupt-names" properties
> in the pas-common.

"extend" and "add conditions" but your patch:


> -  interrupts:
> -    minItems: 5
> -    items:
> -      - description: Watchdog interrupt
> -      - description: Fatal interrupt
> -      - description: Ready interrupt
> -      - description: Handover interrupt
> -      - description: Stop acknowledge interrupt
> -      - description: Shutdown acknowledge interrupt
> -
> -  interrupt-names:
> -    minItems: 5
> -    items:
> -      - const: wdog
> -      - const: fatal
> -      - const: ready
> -      - const: handover
> -      - const: stop-ack
> -      - const: shutdown-ack

...removes them. So no interrupts anymore :/

That looks surprising if not wrong. You cannot remove properties when
you want to add grow them. See writing schema as well.

Best regards,
Krzysztof


