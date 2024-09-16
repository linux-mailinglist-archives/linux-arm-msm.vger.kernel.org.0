Return-Path: <linux-arm-msm+bounces-31860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83697A6F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2D71C21536
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D5415D5B6;
	Mon, 16 Sep 2024 17:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0I1Qrfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F7143C63;
	Mon, 16 Sep 2024 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726508632; cv=none; b=XUSx1reCiNLWDumxkTKTG2GWTyNicsYRN1ufQnwTf+7DhShs30PtJ9ycHJE9Bx2pgm1bTcLyisrnqSUdIjTUZCsuiU1MZDMwE3ckeVN9uo1mfaJ3g3ZoZc+tMCsBS+/O5IpQWfkAqu3DeaC7MrP0ZgNBavD1AS5BViQ0RLNchUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726508632; c=relaxed/simple;
	bh=GkUDrhC1sW63xJI+foxBz2bpiv/vzeTyW9Vu7KXtKwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDJ7vQeJYHbkjV/hmh3V0DwetrMiD6SZkBQaOuDNZF1LbV+r/BgH4mX2shDTU7JQqcfqvVT4g6w5H9ClkY4IreVscjce7STGWxsZJVgvxIQM93kZWFBKf2EX/lgfPzjy6EPZZvjThwjmvVbx7PrRcD2DBU6IGpvTnQyNI79VCHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0I1Qrfc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33289C4CECE;
	Mon, 16 Sep 2024 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726508632;
	bh=GkUDrhC1sW63xJI+foxBz2bpiv/vzeTyW9Vu7KXtKwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0I1QrfcNQX7v42MPtHBCWp0AizuFHXDs9IjwV9TE57vr9dvsnrSM0CkOVsGulAY9
	 3xFWYz/fBfH9diCbWacGyuyNrP8jrEwZir5e1QCuNRVvEzrIARCV+Nb36SsYAVMWZe
	 etoz50gvS+ADa5NSbkg2Y3FQwF1aykLLRDsLF7EyAIJo3s37FW0gxgQgPKlMeCo1l7
	 1H2qt5l8NPs547OkCmMzSbrQIAMg1kC5WHyVvZCaRWmVwZ4Gk49a8ifdv5djdqYZ3G
	 u/y+uK3Z207XjDEa2MMn+EnkFEctJNvc4iPQuWDLKktU8Q7fLUcEFYnxGZhV9ud/V8
	 W4Z0NO3OMbb4w==
Date: Mon, 16 Sep 2024 12:43:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for qcs615
Message-ID: <172650863037.862784.2672999371502748509.robh@kernel.org>
References: <20240912-add_tcsr_compatible_for_qcs615-v1-1-5b85dd4d42ad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-add_tcsr_compatible_for_qcs615-v1-1-5b85dd4d42ad@quicinc.com>


On Thu, 12 Sep 2024 10:50:39 +0800, Lijuan Gao wrote:
> Document the qcom,qcs615-tcsr compatible.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
> Document the qcom,qcs615-tcsr compatible, tcsr will provide various
> control and status functions for their peripherals.
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


