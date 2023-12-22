Return-Path: <linux-arm-msm+bounces-5843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E680A81C442
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 05:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 827CD1F25DC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 04:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C7C53AA;
	Fri, 22 Dec 2023 04:41:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3F8F40;
	Fri, 22 Dec 2023 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rGXLX-00DhXn-VZ; Fri, 22 Dec 2023 12:41:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 Dec 2023 12:41:26 +0800
Date: Fri, 22 Dec 2023 12:41:26 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Om Prakash Singh <quic_omprsing@quicinc.com>
Cc: neil.armstrong@linaro.org, konrad.dybcio@linaro.org, agross@kernel.org,
	andersson@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
	robh+dt@kernel.org, vkoul@kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: crypto: qcom-qce: document the
 SC7280 crypto engine
Message-ID: <ZYUTdjxTd3380Xg4@gondor.apana.org.au>
References: <20231214103600.2613988-1-quic_omprsing@quicinc.com>
 <20231214103600.2613988-2-quic_omprsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214103600.2613988-2-quic_omprsing@quicinc.com>

On Thu, Dec 14, 2023 at 04:05:59PM +0530, Om Prakash Singh wrote:
> Document the crypto engine on the SM7280 Platform.
> 
> Signed-off-by: Om Prakash Singh <quic_omprsing@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in V3:
> 	No change in this patch
> 
> Changes in V2:
> 	No change in this patch
> 
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

