Return-Path: <linux-arm-msm+bounces-31861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4697A6FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AD5A282CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DABD15B963;
	Mon, 16 Sep 2024 17:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRwpHaor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430533BBE3;
	Mon, 16 Sep 2024 17:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726508656; cv=none; b=g3wUvQoEwaVxU9LHdWa5UiszVk7WX6d90MoK7RvfyyKtt6DL3NBiW1Zm0ErLDXJEIGNYPTNDkmifNXvSq1nElYEERaZIEjF/oGk0quohBDXF/YVG62PdqAngVpVkocyOK2Vr4BKkPf6E3rUchYM68aUlS2WVp1op4vvSLrMMpbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726508656; c=relaxed/simple;
	bh=ADymnq/FgyjIQybsM5bqTj0G7cM+ICgypacPLY8w43s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leJV6gLESNb/zjMaHYR8rufCIAYsrID8R9H1IfROfyaj6b+wAKgD0uDqMWEOLoJ4YDrKuiQhrJHk3kfhLBfkRlYlBkWfVjHKCOfTiksz5AelZq+dpzS1VnmUr+Qm3y1J+O7jQMWrvxKqhF76T5VZ5VkMsvYURDoNnybtrUbzToM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRwpHaor; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973C7C4CEC4;
	Mon, 16 Sep 2024 17:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726508655;
	bh=ADymnq/FgyjIQybsM5bqTj0G7cM+ICgypacPLY8w43s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRwpHaorFbSHo5p/jXw6D5h274ynkJQ5+AB3h23GCptQb7SRAKjnxwWQiM27r/N8P
	 GMZLv55vxjhZ0WywWj8f8YJbXKSXsl9vDNGo3A1dEMbHwiXVvX2qWofSmjb66oOMX6
	 DULSQNBJopw3+UKgu+Vz36YPLoQGKcLt436vgaCxo8KuPytw9FHKmKjVCUbbYQqFsE
	 tc991W2jPM7OHJU5k80dGvycKKrQ/iqzu5Gu9Aojinmn5YlMHXpScaGCV6p0l+WCPG
	 KieZ5kNyq8cmxW70hGdy0oKngfLvJOFWkHI3p2mwDdPzbG9fvsnYgdRwtEJxwSyPgE
	 WAh7zT1i0+ISA==
Date: Mon, 16 Sep 2024 12:44:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add compatible for QCS615
Message-ID: <172650865415.863438.12271291958389950791.robh@kernel.org>
References: <20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com>


On Thu, 12 Sep 2024 10:54:41 +0800, Lijuan Gao wrote:
> Document compatible for QFPROM used on QCS615. It's compatible
> with generic QFPROM fallback.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
> Document QFPROM compatible for Qualcomm QCS615. It provides access
> functions for QFPROM data to rest of the drivers via nvmem interface.
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


