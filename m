Return-Path: <linux-arm-msm+bounces-34711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10A9A1E15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB0801C20CC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99DF1D88C2;
	Thu, 17 Oct 2024 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwkrYWTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9244C97;
	Thu, 17 Oct 2024 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156733; cv=none; b=EtGdYjw1MB2tr2X+hcnMzl0dhrpjs43G22UJ+IyZfOF6H0+M+A8uqa7maYGacaB//7vV/psUNVvCocmPHSnDmvj8kNfFXMyO4hlbfAGlsCSD5nTXJh280nsxdJwMEeKVv2XuRVVjTnupeivdGc4q3uuehkMO/8I4/Rpde/07j9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156733; c=relaxed/simple;
	bh=tV3efZQI4OFaUYHYWz700zx7CRJQ2GV1PCnE/moNRlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0yJ2cDip+BlAvOAJ2K3eGxDE2YssoTJLjZ6ZyK/HiFRJ+z8VRMyDHNPyzs0nzREbakyWw9zFXCBDURl4xWRO9YbwUWVhR1RU/VwaRkUG6bXYwADQvLd2RQBJ78AHDhYoB8CgqD6sim/Ty20HFKzDVJmK2WhJdOtMC/m2YOFhfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwkrYWTt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD03C4CEC3;
	Thu, 17 Oct 2024 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729156733;
	bh=tV3efZQI4OFaUYHYWz700zx7CRJQ2GV1PCnE/moNRlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwkrYWTt1nQVtftMfLOOKbct0Oi6k6oT1DV/jbjZ6WIbtQ8oVrC7oOcruZ0ZfgkzN
	 Dr3SX3iFVtcCO2aybnaacDIN923DwSefLT/d5LgwqX/0ibgdNRZB/ORZy8wq4n5Swz
	 t6hH+M+oQmuQBA5eMzrLUj58dErkB3U1K469TZc6+xEkg3LS2Nqknp55JhvT05qqog
	 hYEsOFlUtb0k/wL/E1kyYxugf05Z2nSfYpZie+jYMA2jl+XmfubKcELNZ1LqP0tuJo
	 KMHTprhtaRH+Mhy+zuizafBj3W8/crmO8aYGH/MuC3QISqt3h1mXzXalOQoQ8ubsg7
	 RJrmE/WdqpqLA==
Date: Thu, 17 Oct 2024 11:18:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyle Deng <quic_chunkaid@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com, quic_taozhan@quicinc.com, 
	quic_jiegan@quicinc.com
Subject: Re: [PATCH 2/3] dt-bindings: aoss: qcom: Document the qcs615 AOSS_QMP
Message-ID: <u7y2eu6t4ljk42rigfgxylpzpog2ygbwcou7e6jalnfqsqxsfy@ifezf2435be4>
References: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
 <20241017025313.2028120-3-quic_chunkaid@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017025313.2028120-3-quic_chunkaid@quicinc.com>

On Thu, Oct 17, 2024 at 10:53:12AM +0800, Kyle Deng wrote:
> Document the Always-On Subsystem Qualcomm Message Potocol(AOSS_QMP)

typo: Protocol

> on the Qualcomm qcs615 platform.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>

Best regards,
Krzysztof


