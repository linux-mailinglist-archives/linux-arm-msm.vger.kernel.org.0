Return-Path: <linux-arm-msm+bounces-70013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F2CB2E749
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C0EA22A41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 21:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EB9311C24;
	Wed, 20 Aug 2025 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNVR02gm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74172D4812;
	Wed, 20 Aug 2025 21:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724496; cv=none; b=jt5VS20c4yA2wBR/EGXK5S4IoBLVDsDWcm1ogpbPRR1WjlR9SRzCEnzMyqm3T2p52m421B2HeT8BZP94WAWlN2VVbiVskqbsg4vk5IZdt/MUdATbaYfaBICuxM2OMIiDoxaSr3g90mlYJz6zLHTA2yGVV18zL7JN60yf8JKc2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724496; c=relaxed/simple;
	bh=StGvUfTdSYF28wFzDLpQyjMqzG15fyrbohiBaILm+5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6dAIR6ZthblNIg3xLHNB5JmUp5L6e+AqNkTQs85a2SfXsvaY5zWOcWgfaB20fjOYJGWxG4+sbavT279JA85Si84E5gqwSBjPmrVfA8Op7HffsTbLgg/yMEybVFV/uqEqPfa8AONEAJIQIEFr5AMPaIVvMcuadSikfSKkU4bY2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNVR02gm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D36C4CEE7;
	Wed, 20 Aug 2025 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755724496;
	bh=StGvUfTdSYF28wFzDLpQyjMqzG15fyrbohiBaILm+5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNVR02gmhMStVHXeLJSmaMv2euRc1M21Bus7XPQQ4tKWksKhOEYwhOcutrMHvkFYs
	 B45W9H6ATVEdaWA8EcCMxh4y0bY0cuvX3u1zVTRLxZxRVpUZPXBe1kEvUVE7zTnQ/o
	 HiUJxCrskBzuWGFfEV5K4jwxenfIJZFUrE7OnEH8m9CFgKfVYQTVEuaQAXQ+Uplv9+
	 CNIzbbYDDGxeeCPWF4eTNBPMRu3EJqSxgfZl6okDj6zg+BpClg2KKEWcCRQgJAEQPw
	 ufII38amPBGYvW1WHwTf85H5CzNrII22ejhwsy6wvg1TkeT6WIjBMHJvo+iRczt84f
	 AnZDdUvL/lq/g==
Date: Wed, 20 Aug 2025 16:14:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eric =?iso-8859-1?Q?Gon=E7alves?= <ghatto404@gmail.com>
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: document r8q board binding
Message-ID: <175572449449.1124582.9121877496040488320.robh@kernel.org>
References: <20250815151426.32023-1-ghatto404@gmail.com>
 <20250815151426.32023-2-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250815151426.32023-2-ghatto404@gmail.com>


On Fri, 15 Aug 2025 15:14:25 +0000, Eric Gonçalves wrote:
> Add binding for the Samsung Galaxy S20 FE 4G/5G (SM-G980/SM-G981B) board,
>  codenamed R8Q,
> which is based on the Qualcomm Snapdragon 865 SoC.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


