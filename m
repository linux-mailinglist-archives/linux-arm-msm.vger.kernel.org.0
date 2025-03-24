Return-Path: <linux-arm-msm+bounces-52370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF41A6E0AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 18:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A745618903C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB905263C78;
	Mon, 24 Mar 2025 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvG7V7Y+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8910F1;
	Mon, 24 Mar 2025 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742836573; cv=none; b=siUWLXBCCLcN4xBsM5YqjmYYCTsFGJM+ck0F/qrMtMJsdRRlluKFAdB+RhYK2HYUVx3VhC83h9PYVk4u2bvfHIMldFLHDCDzJ9XsYPssrXBMBfH/zRWFSo9yvFah7scJsw80vP6joN3sSUsbc70J4TcwBFRRHEYRKxnxv3w2Izk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742836573; c=relaxed/simple;
	bh=AkOY3OgFCEWlwpwEncqQoSIVnZQVS9uLbLd0AE0qH4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSR4P+D0o5wJ9m0mTFoy5QoRT9VVAXH4Xw78BMNdb2pbWfWMxSQOUwoWuVKHy1vIumZTitAQlcp74661yjWtOqbdsRcj2GBbE3ZQAiyHA7/sWEY3Eo46HradJdgAz0aqEENQ6enyQ+y9PJN2vknovagZoKgzUh3xLMPMBQVPkW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvG7V7Y+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B746FC4CEDD;
	Mon, 24 Mar 2025 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742836573;
	bh=AkOY3OgFCEWlwpwEncqQoSIVnZQVS9uLbLd0AE0qH4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvG7V7Y++6F/Yg+Z4O0LkLrO+Vmc7bRjut7Be4IkF7qQ0jCGnz3CLcK013XWzKE13
	 vK9eHYlC30m0bSLozm50RTSbqObGZFqBsw124e3f/M6K63E8SlyfBgHz0YaPDJJ4dU
	 p7dziWaYyuUBf/1ynZgdjyURfPIqv+TA0tZFMjJMZTaSGA4roLQKKp7oIt13waM/xr
	 SLkiUPLI3Yi1pqcYJri8F4VtH67RSEvvf9YrTHYLLdSpHTlgcyZycb3usGXSlOoAij
	 Pq71bQnTS1H9Ia9xxMPXNaio1k6uSbzxldcCM1TKqNN9PlThriXmmfaDiNl90vmKjb
	 ED2G1zpRPe/ug==
Date: Mon, 24 Mar 2025 12:16:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: add SM6350 QCOM video clock
 bindings
Message-ID: <174283657138.689866.626962804194568549.robh@kernel.org>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-2-cc22386433f4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-sm6350-videocc-v2-2-cc22386433f4@fairphone.com>


On Mon, 24 Mar 2025 09:41:02 +0100, Luca Weiss wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add device tree bindings for video clock controller for SM6350 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 ++++++++++++++++
>  include/dt-bindings/clock/qcom,sm6350-videocc.h    | 27 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


