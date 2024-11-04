Return-Path: <linux-arm-msm+bounces-36967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 565129BBA33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 17:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DC341F2244A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 16:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9611C2DA4;
	Mon,  4 Nov 2024 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUfTB2vv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BF142AA6;
	Mon,  4 Nov 2024 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737193; cv=none; b=GuEjyu3mvzwaPrIsyo7QsgMPXymPabVbrlrlWAwXcuKErdnTN3m0mlR3W0VwNlT6azWEMIG9foRFRHaomu0sNCfJ4wZzljluSkzSPFsZneFWhkqj/P1Ygab4IvPByrehAame+UFq5ScZJzcA14OIl1xS5YZI1w79+yj2O4fVaKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737193; c=relaxed/simple;
	bh=DXOrN7Qat5xsjGc+y7PGlfGGMhhuz39fBqnNJVF2MZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6e6wf/b7M2IDuqm0JatAMv0ZQ57WYqocCWatqC6KQXHmadzLxoqKtMhLeUHtax/zAflAb9mF9cs0nQXfRtWsG/UGXBZ7nd0BnhVBAwkFuRoRbp7Y+T/+Xwc6eDhENGt3AT1VH+XQQ2QdXR1m9iVO5yM8QKV+PNMw5Dj7k/nhDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUfTB2vv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F70DC4CECE;
	Mon,  4 Nov 2024 16:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730737192;
	bh=DXOrN7Qat5xsjGc+y7PGlfGGMhhuz39fBqnNJVF2MZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUfTB2vvlo6tGQzjTfqVQguVCEEquylrSvGItWBBiWL6xKnwtAlXHzBQS33T7qCr4
	 pMUAylL2VFtHqrmcH8Jgcn5Bn8Yt75Hl+eL1Rz+7vIR1Hbs5vpCKvzGgGW71jZUVn4
	 9nrsBe5J0630IHS/ak2YVu+mERe8uz6lBHa6L1UmLpQC0dEnb7wBONuZE2J02A7xPf
	 VyZuGP568XikffCY7aZS8vwgrpUpr51VrZ4SsvcnfAYZuRtYttGNs8nq5rcaXslPFM
	 SbuHgK+1LY1g+RQ7A0bKSypkAeFB1ZCEBnNYnSlXXGxNCDzYH8BIvXq5P700Y0J9EJ
	 UTBFKzQHjcp+g==
Date: Mon, 4 Nov 2024 10:19:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	conor@kernel.org, linux-kernel@vger.kernel.org,
	konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: cache: qcom,llcc: Add IPQ5424
 compatible
Message-ID: <173073719041.380640.10202387939372853981.robh@kernel.org>
References: <20241104073840.3686674-1-quic_varada@quicinc.com>
 <20241104073840.3686674-2-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104073840.3686674-2-quic_varada@quicinc.com>


On Mon, 04 Nov 2024 13:08:38 +0530, Varadarajan Narayanan wrote:
> Document the Last Level Cache Controller on IPQ5424. The
> 'broadcast' register space is present only in chipsets that have
> multiple instances of LLCC IP. Since IPQ5424 has only one
> instance, both the LLCC and LLCC_BROADCAST points to the same
> register space.
> 
> Hence, allow only '1' reg & reg-names entry for IPQ5424.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


