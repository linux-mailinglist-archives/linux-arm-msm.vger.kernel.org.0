Return-Path: <linux-arm-msm+bounces-34706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1FF9A1D30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 10:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED8331C21213
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 08:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722651D432D;
	Thu, 17 Oct 2024 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSE6uKDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667B1D2200;
	Thu, 17 Oct 2024 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729153774; cv=none; b=onNqsL1znVfGISrp/+C8/c3VgcOEsZH1v+LfcwnvAxDwjp28edtAkMNpbTpXxa0J9OYtgMsOzxhzqG+xh94XfQ5XJ4EO211SUr1jCv7QAiQvLFsA2avLx3vgVTzfzOK3Yr1itShAV22ugJlZQPEFMZ+2KD2CY0eFZZCvw/DWtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729153774; c=relaxed/simple;
	bh=YpOCt9Wit7UQihsMyrXaLFlAKcvtO0HFe6OjBcw0sj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8IIt2H67o4bqlcaaknccnMy/TTXmDav5Gmu3jFr+cKGkBjDMTBQne0jjSabsJnD+OiWGLklh3RHUqnmfsjqtmy1qLuP5FKMAsHlToDPKTO9rWp4lYIECwz0EzYAYPNeYlBYk0S9LwwZrehtAaeGqUZxdd2joDsK6HA+2GTTUww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSE6uKDE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436D3C4CEC3;
	Thu, 17 Oct 2024 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729153774;
	bh=YpOCt9Wit7UQihsMyrXaLFlAKcvtO0HFe6OjBcw0sj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSE6uKDE/O1Nzt9Be6tmMJRzUL0FIf1VqJhRylQOc59T3QGH58Q3uKc3CtrDqNMrm
	 pVa3tzxNkCzzglLoxtyNGhZAy+O+E3K5Ac57qgUFMOAKFJYycTmX71/OhCkb47x1Tt
	 CXZzLcNk8DuHp5gC49JCPnEzNefnICM8RTjd7ZktC/vA1WDf4G3K1gGq+tyoWRLqQS
	 HhnkeTo9PtxoaYNpXGzpb1cZhtCviQv9ET01LTBsWsH2lEjrYn9BYh+bQO1JAdf8PR
	 ANQZi7Ee/Fe7CYalWMja/DIX8DD4obMBMMWIQdIr1qkuLB8F3eKxsZkqFRlPXoUkeY
	 Ces7PZNJ/eTrA==
Date: Thu, 17 Oct 2024 10:29:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH 2/3] soc: qcom: socinfo: add IPQ5424/IPQ5404 SoC ID
Message-ID: <wp4rcpfyagebqmmw7toacusvexddreln3ogyywolql57y42y56@rjweldte53lg>
References: <20241016151528.2893599-1-quic_mmanikan@quicinc.com>
 <20241016151528.2893599-3-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241016151528.2893599-3-quic_mmanikan@quicinc.com>

On Wed, Oct 16, 2024 at 08:45:27PM +0530, Manikanta Mylavarapu wrote:
> Add SoC ID for Qualcomm IPQ5424/IPQ5404.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


