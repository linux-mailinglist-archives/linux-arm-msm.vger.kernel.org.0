Return-Path: <linux-arm-msm+bounces-53214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A8A7BAB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 12:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3183D3B5916
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 10:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2E91B0F30;
	Fri,  4 Apr 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVfTof0e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3419DF66;
	Fri,  4 Apr 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762411; cv=none; b=Z5XE3lnVhMATbktlP2NDmLSlxW4KIgSasGqMr9+y+LnMiYnrkCDV/bEcJ6NveeZGRuiNH3bJ4bq1CSUdqtOp5y8TfdTTDghDKCmrjNgr+uMNbRFHrmwASkxOpSvP4KqGTo0IXwkbfrTSKC9qsGsgccDHa5tTYSxsT6yr4k+JYww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762411; c=relaxed/simple;
	bh=iMvpEdWCXh8noS82R10F1JMjxg/DwcuVVpUxdK7Pqd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFQbyXH4B7WehkyboO9vo9DE00TeYH8jsYPzPGTnWY/FlHX+sluWHZ82N+gMwb2bykVBJzyKPq6cweKMyIrzL9V0VEg4Bkc9fe2b3IkuNF4kPjJWfZav7kBi+86AC/Hy5xeNteRQUE/0YXvB/Y1RTiJwSDfRS1F4qWeOwjiZsoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVfTof0e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DEBC4CEDD;
	Fri,  4 Apr 2025 10:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743762410;
	bh=iMvpEdWCXh8noS82R10F1JMjxg/DwcuVVpUxdK7Pqd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVfTof0etD6OFGBEJ4EcVsnCNAZF80HIaW4BRIy8QdRdCFjRMnqQLPwtGAtwTG9A9
	 OhneocRni33aGBta0TsaQQASrAufBwtpImQL/tu8JqT1R09NKmdbZj5P1QTV+oCPrb
	 kJk0X1SAHgvXZZW4TnLfI71+Gbwe7O5nnEV24nATX5uSqZjnLr1yriaQWrGzfiJ1VT
	 KM6mNkzQRxIjLSiH+RIwtTOqj6JvEqyBUaxRxZhS0P+WF7gc3Zgw7hi4EHiDvFZ5Kt
	 O/p0++s9Ek3/NkLVsVLEkS8dRkBKmQ1UmCwPKkVwRV+RL6vxtp0/5ipQIEtMcbWjJY
	 jHDe97eReRXYQ==
Date: Fri, 4 Apr 2025 12:26:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Message-ID: <20250404-rugged-terrestrial-foxhound-fcf36b@shite>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403134644.3935983-2-quic_msavaliy@quicinc.com>

On Thu, Apr 03, 2025 at 07:16:42PM GMT, Mukesh Kumar Savaliya wrote:
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  compatible:
> +    - qcom,geni-i3c
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se

Drop, not that useful.

Best regards,
Krzysztof


