Return-Path: <linux-arm-msm+bounces-63488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D849AF6B59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 09:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 131441727EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 07:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D5A227574;
	Thu,  3 Jul 2025 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh3DuRXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B905E2F32;
	Thu,  3 Jul 2025 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527250; cv=none; b=HbN3jG6PE/2v79tZyPPTbo9rxMktp5SHDTo8tpilEYGoYF3GWXA0qX79idnEtajubsyVuPECfs7cMgXNVKTI+xwH1PAL/lwuNuJj3wUXa3uXYKAcHnQ8FCJKj5MhkCNhRKn+V+berAePXXI/WbyB3ZFscQZj6ssta28FCa4CYEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527250; c=relaxed/simple;
	bh=pOwg1+ep1s42O2vvKzmecAXJEbVajSNurh827rc4U1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c72xI0xI2mOD8A13als88nJe5GXivBbdXj+9/fS+Grfjkzga4CoebTUfcuSStEcOd6O1a5u7rPR0MxkIPYhub1oxRONg84QVB923LBJp/zi3a+t0cykyhsCOj5kUc5PvWx2THPCfholqyzmqGyX5mtow4nUnVUpakpB3996q3vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh3DuRXA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C576DC4CEE3;
	Thu,  3 Jul 2025 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751527250;
	bh=pOwg1+ep1s42O2vvKzmecAXJEbVajSNurh827rc4U1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh3DuRXAa0hNLQAoS+jUbMCEUDffVxNs6KV6YVJpd6COmZt/Ylbl6iJRbXIlzS6xh
	 1uPh7+1wSfAO9VUO03HTBFCDpU10Hdg9hJuyMvoLpd/oaHiP01ebt+SkFQZY5rTXUL
	 SpyXwB1ZffEzqtRbPGI6NdURaG7R07VvOX7LkPAWycG+STpJY4w9L4k9/JcOaZiJPo
	 9H+PY5aDa80eogZatyBjSZt/mqlvZSFjOD6GNGjzW5npcCR67wAdfHoDB4ht6+dFut
	 X8G8tA9CXAg6sYsRr3KxUcExMaWmVROo9khmN0uSKX+okcbQL5kPOl8Bz22fz3jwwf
	 QjElgvglicWCw==
Date: Thu, 3 Jul 2025 09:20:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, quic_kuiw@quicinc.com, 
	ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Message-ID: <20250703-qualified-roaring-gaur-c7c2b7@krzk-bin>
References: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
 <20250702025341.1473332-2-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702025341.1473332-2-quic_lxu5@quicinc.com>

On Wed, Jul 02, 2025 at 08:23:38AM +0530, Ling Xu wrote:
> There are some products which support GDSP remoteprocs. GDSP is General
> Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
> and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
> fastrpc domains.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


