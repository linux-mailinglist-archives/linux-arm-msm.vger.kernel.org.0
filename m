Return-Path: <linux-arm-msm+bounces-85073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E5CB65DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 16:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC50930102BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A5930F7FD;
	Thu, 11 Dec 2025 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUghXMUO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922C2B2DA;
	Thu, 11 Dec 2025 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765467702; cv=none; b=bmRLAgK1eiVyshJBO1eFt3CZ/mxF9JXk9cAZrOZSJtt9BLCKTSCZe/6hzx0mXbn8bUVzYdc1LMAWtN8WD5a2m8ljkd7oc6LEpQfbb98qpfwrnASGf3pIzoX8YD6W9mFpgGsYByBBq1V53Vn7E1pQHc4Gb7Ayfra4RL5D/TpfTe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765467702; c=relaxed/simple;
	bh=/Ij9Fjramg3/sU+Yj0yoSQgfiCyDiDbImdGGPvmGbwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QT3ZfK3Ouo3niS5xnAJNm1BBzv/fmf85OP5hJoM8g8FrrV+ngrTP5IVwQZEd+ckqLWsIGlJIA37Z0yU8+BOeftSgCIBtAoI7xpj5OlPgc56uRDVpqT2Hh1w5PkkGALQX5jOqAqUVsdzO7XQHvW6WTNGQySha6gbNYXHO2hoovXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUghXMUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EC6C4CEF7;
	Thu, 11 Dec 2025 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765467701;
	bh=/Ij9Fjramg3/sU+Yj0yoSQgfiCyDiDbImdGGPvmGbwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUghXMUOhpfs3VXuO3PrWQFC+1epwLk8YHWdLhDK2wtUhkwYNIuYxJ7edP4nh/h9R
	 iU+uHo1nDk8uLmpm2sHxWQykTgLvxK2shakJyetB2vmOYm9497+/DB+cRe8ZILC6sh
	 bNiN+2YRfDvo66qe0pZ+MmAOe6xQInJF8mBl1eJcfu5uq/OyIK9FQxnq4CwS5Wb3dE
	 ZXR5bqiQberpg3E47wynVhk336WNpwlYiTYZaOHMusf1hFFWphG5SGKr1ypFu8BFoc
	 qZ+0NP8Zo5JTeRJ8niaShxdLi4EZlOBLSzQbcyVxl1r/8dYyqvdObUlUTAmoitaV6F
	 IgP7petqUxQyQ==
Date: Thu, 11 Dec 2025 09:41:39 -0600
From: Rob Herring <robh@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
	arnd@arndb.de, gregkh@linuxfoundation.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quic_bkumar@quicinc.com,
	ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
Message-ID: <20251211154139.GA1424272-robh@kernel.org>
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
 <20251211100933.1285093-2-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211100933.1285093-2-kumari.pallavi@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 03:39:30PM +0530, Kumari Pallavi wrote:
> Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
> that differ from previous SoCs. The SID field moves within the physical
> address, and CDSP now supports a wider DMA range, requiring updated
> sid_pos and DMA mask handling in the driver.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 3f6199fc9ae6..142309e2c656 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -18,7 +18,12 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,fastrpc
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,kaanapali-fastrpc
> +          - const: qcom,fastrpc

Does the driver work at all on this platform without the changes in this 
series? If not, then it is not compatible with "qcom,fastrpc" as you 
say here.

Rob

