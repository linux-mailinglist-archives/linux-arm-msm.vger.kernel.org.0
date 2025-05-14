Return-Path: <linux-arm-msm+bounces-57811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC4AB65CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 10:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D7B07B6FFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 08:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885CA21B9C6;
	Wed, 14 May 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amf7OeNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC11F0996;
	Wed, 14 May 2025 08:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210634; cv=none; b=FMDos9omPzN9o4GHQ3QVmY3qzafwefWuRv4zXsG+BXgp4GoAjTz9y5IcctOVWoOTsVX2ChG/TXs3WxRKLs1hqzQO5MKZlVG6pRk3qY1xiS5hDqXM01zq/TcU0/0LNQ7g8uB398JspAjNWCESp6M2XvweDfaRMQ/LVe3+v8jyXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210634; c=relaxed/simple;
	bh=JE7c7dHTC0wr4G3gxjd9IM4XsXNvb/SXQbeYFeLqSs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSacEaYC6w9XloDTo3F7U1SWgQJJ8Db+vlzw8vcnN0w5xyys+AAMAq+iml4Eg3n5gB4JjvEPhVxh0czppn3+E3QEuzLBxhvqmmXzovPTuNTlfAn1o3MWdtQGflbge4ODBjom58Oe4bo/xIqUVyVQ7qp6LXfLCmZ8BJ9vSjOoNHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amf7OeNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47568C4CEE9;
	Wed, 14 May 2025 08:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210633;
	bh=JE7c7dHTC0wr4G3gxjd9IM4XsXNvb/SXQbeYFeLqSs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amf7OeNo0hIwVItoRs3D9pZfvv9/aE2gKUXY+sSCakfmnnMKSE7QkJzfGSZgK89vD
	 9HTOpwes1qZbonfw+mN4XCi7B9j/CveB4Gz/M+wmhbPfB6Kf5YXSJQkvngeqzpPDlf
	 UYL4RBhVA2XKajMojcEMOTNYPPagj5UNxTB9em1FJJ0RkqqB21wno070xuJnccboM7
	 aOS0fq2sFCoiDvh5uWEWNNU6QoMmdcR+A2YyfV0GQYR8buSUxHyR54rWTsKXd+GrH1
	 ckb0yNNDyY82Ig0zHX1PJJ8pPN25IIUjK/z8NdVfAJ/a4VZOgBytgynVCTEhkXk07b
	 WrVAXfXpG3BVw==
Date: Wed, 14 May 2025 09:17:11 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY schema
 for CSIPHY IPs
Message-ID: <aCRRh2ipYD8vYtBJ@vaman>
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>

On 13-05-25, 17:39, Vladimir Zapolskiy wrote:
> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
> MIPI C-/D-PHY interfaces on Qualcomm SoCs.

This should come with driver support as well. pls post driver as well
with it

-- 
~Vinod

