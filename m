Return-Path: <linux-arm-msm+bounces-87008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE77CEA647
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 19:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99653301AD25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 18:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F167832B999;
	Tue, 30 Dec 2025 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INGXdWZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59D7322B80;
	Tue, 30 Dec 2025 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117895; cv=none; b=Q4K0HWbl33M1dpP5fr9JAx8yh26w3R+UapnzhsaJQYXo8tT/VISjHF7KZnOOqVipqzn8Cgc7f0C1ElG33qoJMWTublHVsTjWPd1LtG8+E9cqP5C321UGJBjJ6dYkHI6TctPQxqJHib/Pw9SpzJwAgAJAlTlD1biCWWnpnqRQ9a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117895; c=relaxed/simple;
	bh=VcKayWb5mg1L/mnJNMElunLhTh/iwhg8mNBNtczbUUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYBSJhBiJX0NISVgjXq8f+JZLqndhXcnY61nvDmhgavl128PvsGzxl5owTGddehsCItqBVoQ4LKhUoqBGw4f4Ok3W/fQa40yvUutXBhAkJRHOrJTNBcqGCe+1BrcSgeNyUTdWvGdWHQ8zcH6OYA/oY9zZND8V6W+0YHz7GRogL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INGXdWZb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCA3C4CEFB;
	Tue, 30 Dec 2025 18:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117895;
	bh=VcKayWb5mg1L/mnJNMElunLhTh/iwhg8mNBNtczbUUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INGXdWZbbjTw2YB7NVF3s2WJeYoe73mcnuCvQ3DlxaPXElE5pTw324mF/J/1l9poY
	 0qSKavlYe0/IiHHz3tU03EEcdVs3hcXlfW0sHl1PYviyXcPyYXfQ6G48W1u42GL65T
	 NuFzSIdlQoEYPIOgVva1jj61LcYwe/BYcd6Lt1B6KHKmXd1vbTPgDlFdYWZoyqMu/W
	 WtcEqxX0hiu+1jqSAyd3fauPIQMMeScwJpbjtZjVeCqhS15dFDE7bM0+M7mRTUCT8v
	 Y9M3fNIGBvUs7WcfxyImPjWOVQ9LOUieam0BOWL1K3nE0JktRAhcEanrWRHpKonJjy
	 n9oIelHAVtswQ==
Date: Tue, 30 Dec 2025 12:04:54 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on
 qcom,sdm845-slpi-pas
Message-ID: <176711789341.880563.12050439267648455160.robh@kernel.org>
References: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>


On Mon, 29 Dec 2025 16:26:59 +0100, Krzysztof Kozlowski wrote:
> One SDM845 board uses cx-supply, which is not allowed by the bindings,
> as reported by dtbs_check:
> 
>   sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
> 
> The SDM845 SLPI binding already allows lcx and lmx domains, thus the
> cx-supply seems like a fake name for something else, e.g. some
> enable pin.  The qcom_q6v5_pas.c driver parses cx-supply, so it is an
> established ABI, therefore document it for this device only.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


