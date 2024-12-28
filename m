Return-Path: <linux-arm-msm+bounces-43546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E40989FD9D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 11:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D8CD1883EEA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 10:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A091313B59A;
	Sat, 28 Dec 2024 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLRRjdmN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7394435952;
	Sat, 28 Dec 2024 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735380739; cv=none; b=VWu7f0rx1Wt7FEk9887hs+9Dy5G+yzsowYpqLwnd2hegKwmdixhYZWYy71CuGb/59EVzBCx6qNjpESMuMJy4OuRH8TXbL8HEPYwog3fMY9Ucmc5SrkzZiWwzY+uvljH7l2+MbRCL62OtIg69SZ3QfKrcIgwem1nZGSR42HfdIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735380739; c=relaxed/simple;
	bh=edBr7Id/A5MJc+x4re15u9kKzXTYYgwKbPkNMozVyiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVh5QlANVyL+eQK7AiRDLEwqya+no2FaE86d7QRvtptcg8yunfR1jPhnjMwP64yNslCi9XDAVOX2zBLMxGkZ7TyfsBIcLXKcyjHDkhbIxw5kz0MqhDlWgsIvmcZH3j0PHp3rlHVn0aqwrzNdsIuBHT5JWoTJTbHQ5KNDpGFv+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLRRjdmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6CBC4CED4;
	Sat, 28 Dec 2024 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735380739;
	bh=edBr7Id/A5MJc+x4re15u9kKzXTYYgwKbPkNMozVyiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLRRjdmNxBJ1bImqA+wkH5Yro5fb3d77RWS/8SA4Hzet2Jzw+VoL2y217L5cwtIBP
	 aMyMSYlQ6+wHJOL7isxZ0S2pR0pRJ4nzDwZi9Nxm5FKwHTbJfmchJ4sJc1guLYGkzw
	 ms+GAlRk3Wxu332XQf92z3zoOVn07ERLuc0VsmqpFqDq0l2REyRJ4/ryR2eal8qTZs
	 PcNL6XJ05zTjiEknhcMlt3l68yxagR/GU2Y1XPrQt2irO3GzOftQhFUxOv6H/9ApiG
	 9j7JgeRUt9BXPYaJwoTktHw5Gv/Bq5gwh8wQYhQfpZYtZ3xabfuafAOTvl8d90TZDx
	 fkQ0Lzu/nClAQ==
Date: Sat, 28 Dec 2024 11:12:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
Message-ID: <bziwt6ixfol6ajiclkz6iupmcnbaotxrfvz3n3rvjklfpasz2a@ztcmvbmwk7o5>
References: <20241227105818.28516-1-quic_pbrahma@quicinc.com>
 <20241227105818.28516-2-quic_pbrahma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227105818.28516-2-quic_pbrahma@quicinc.com>

On Fri, Dec 27, 2024 at 04:28:17PM +0530, Pratyush Brahma wrote:
> Add the compatible for Qualcomm QCS8300 GPU SMMU. Add the compatible
> in the list of clocks required by the GPU SMMU and remove it from the
> list of disallowed clocks.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I am skipping this patch due to other comments. Maybe they are not
applicable here, but three maintainers investigating simple thing is way
too much. Make it easy and obvious for us, not for you.

Best regards,
Krzysztof


