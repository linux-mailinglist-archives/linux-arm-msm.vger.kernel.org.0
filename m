Return-Path: <linux-arm-msm+bounces-63417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE9AF5BB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 16:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DE344E81B4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 14:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7F630AAB6;
	Wed,  2 Jul 2025 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIVPzie0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7936030AAA2;
	Wed,  2 Jul 2025 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467944; cv=none; b=Lmjp2fUtgu8Zs9e9qzGofWQddifBkMuz2RY2Emh6Lk9AXjmC888lCzpelZLrRiu37xsh4cKiK5W926/lcayedrgrTDAJdZK6m/mE04sMi1I+6r1KWrNRrdIuoaNq62qrz0LrFj248xnxQvRGq6fHDLHObWb0hBtR1MlJv+BtJsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467944; c=relaxed/simple;
	bh=MVpi/2/2fnQ827YrHnh39S3IE0+g76KY9HjB0fDt6co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXZFN+eqMXl7b6xf9HqwINhUsct3Cxt2/df0gvLnHHWcZy0BemCbqrfF2f4bzJbGLoaljZPOhq9XL/W7HpnD8qhu7yXKYLo+LVpsVAchVZej9WJ1EcMxMmlfOXkh59+kvbCjkInwVPhBn79oUsCHVvrx2e5X2aFLv7tjDDoR2fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIVPzie0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA287C4CEED;
	Wed,  2 Jul 2025 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751467944;
	bh=MVpi/2/2fnQ827YrHnh39S3IE0+g76KY9HjB0fDt6co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIVPzie0g1QxXxVl5u8UA/5kqjPs2xIqMzvwfvS0QVxTWTmrGT63OqB48u7OKTvw5
	 9Q2qPKYWVxtLKfPx0Jgumg+G7Y8tF+8Ib6+I5Hxbrgqu84McvazwXTjpVZaiKyTNuE
	 RZVe3K66xIjGCer1I6zWHH/bxcyGDzLXyfJsV8J9t2WXBIVEHxUojXP/q2XiWz8iQ5
	 hG5OaAUXtDZ/Q+FLmKzmqBkbrcIp7QbdtM6Wr+S+c0xWvRDObWwZOHs9fCHcziGNhA
	 pKnxdYuO+KAR0VEBmVyMtQt2vndp9SQee0krjRYHmXsOKGNQgvCnC5+LOfIoqXUwgA
	 BG17hnalNHCxA==
Date: Wed, 2 Jul 2025 09:52:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: conor+dt@kernel.org, andersson@kernel.org,
	linux-mmc-owner@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH V3 1/3] dt-bindings: mmc: Add sdhci compatible for qcs8300
Message-ID: <175146791377.1660977.16811984013097391499.robh@kernel.org>
References: <20250702085927.10370-1-quic_sayalil@quicinc.com>
 <20250702085927.10370-2-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702085927.10370-2-quic_sayalil@quicinc.com>


On Wed, 02 Jul 2025 14:29:25 +0530, Sayali Lokhande wrote:
> Document the sdhci compatible for Qualcomm qcs8300
> to support function for emmc on the Soc.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring (Arm) <robh@kernel.org>




