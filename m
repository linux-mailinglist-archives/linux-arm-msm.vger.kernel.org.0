Return-Path: <linux-arm-msm+bounces-56215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62687AA4666
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11DCB1B63C52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 09:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D570F219302;
	Wed, 30 Apr 2025 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjjGTNbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C920C488;
	Wed, 30 Apr 2025 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004067; cv=none; b=u8tSJKq14rir14I7Owgz+5JdAdvER49kPger/Wip/x/Hz6XZXQG9prcvC1lNF8DcexdQyDQ3MOMSIUvnoMnwx/NBXjCnrnQCrc3GuQD6KgKbnW/8NuG/7iWEJoe+XgHgyYJ9r9RND4jZIRJdhDuiIsbyYniN8iz7/yicQk/JrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004067; c=relaxed/simple;
	bh=JTFm4bna49JCkHZqj/tyafzK8uqLqlQp4ByNOAyKIx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJC/W+g7AhApMMDW6NE+xuWX0jOrWf+nSzARxWGcK1N+EWXNh79MYvRLDoJrFnvl1qz9YcvBaJk/dw7BqfB+An1GcoslXWVdlhJdY3D/CFvmMR4UKUTFkPQ9+P9GJQykUDra0edm+D4Pdh18QJsdRX444veNP/lPRt5vBKFM/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjjGTNbE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E02C4CEE9;
	Wed, 30 Apr 2025 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746004065;
	bh=JTFm4bna49JCkHZqj/tyafzK8uqLqlQp4ByNOAyKIx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjjGTNbErxWGCzhEbbOuEOlUu5zqXJuNMw/05gI1660HBi1a31QLPK7BIJ8hxUO8o
	 ploriJYljhQqnr2B+QsvmcXgWlFEneGl4+NfEdHev/LWoNMVayw5YiQOAqKTAoY3dN
	 XteJ9zb30s8qSRBuaUbXHU54xyez0vni90ByktrS+Tm3ZLw4CGxe4yijNpP9IiZMF6
	 NAW62V1NU8VJ4a+Rii0DWNVcJisTp30uleC71K9kb0keYDEOthBLc+SztpC8Q/7kkm
	 wQQqQJv+l3UGh9GhjHxEFY/ITALVAayIM6STJUCyErKOK0qAV8iw6wUNVlEUmY4bqL
	 vEWHKXtmnF1xg==
Date: Wed, 30 Apr 2025 10:07:38 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Message-ID: <20250430090738.GE1567507@google.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>

On Fri, 25 Apr 2025, Dmitry Baryshkov wrote:

> For some reason Lee has mis-squashed two commits, picking up one chunk
> from the first patch and one chunk from the second one. Rather than
> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> Add qcom,apq8064-mmss-sfpb").

Ah yes.  Looks like I took patch 5 before patch 4, then fudged the
conflict resolution.  No need to submit a revert, I have removed the
patch.

> Fixes: 2c8de7df7418 ("dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 71741f06d2fddd2d4fb6b69c1cfd2d449ce73f64..c6bbb19c3e3e2245b4a823df06e7f361da311000 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -98,7 +98,6 @@ select:
>            - mstar,msc313-pmsleep
>            - nuvoton,ma35d1-sys
>            - nuvoton,wpcm450-shm
> -          - qcom,apq8064-mmss-sfpb
>            - rockchip,px30-qos
>            - rockchip,rk3036-qos
>            - rockchip,rk3066-qos
> @@ -202,7 +201,6 @@ properties:
>            - mstar,msc313-pmsleep
>            - nuvoton,ma35d1-sys
>            - nuvoton,wpcm450-shm
> -          - qcom,apq8064-sps-sic
>            - rockchip,px30-qos
>            - rockchip,rk3036-qos
>            - rockchip,rk3066-qos
> 
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

