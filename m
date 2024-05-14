Return-Path: <linux-arm-msm+bounces-19842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E48C5826
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 16:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41CD1C21BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13D617BB24;
	Tue, 14 May 2024 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iqfhj3UE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE8144D01;
	Tue, 14 May 2024 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715697704; cv=none; b=iZaQ9CH0FWSqk2fY8WtvkFZ0NOm/FF6B+Xv+OSONfmpuaRO6vKLnke+wEiF5iQUo4sPDu8NEFS/vMMdWewIRGy1RZnQQOYmYoW14kD62uH6rn2b6Z7NJeYOuC1otWU6n4pX8Do/Dg6Jx7kx6adkQ97KmW0cFdUt6TGnWT4SS6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715697704; c=relaxed/simple;
	bh=GehxexP+mxbBsUeyRVVy+3SbM8PqCsrvHJ91hWjfIqA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4NvcVNncwWA9QCCQtEy6ZiTVJLaMMsu5GVXNcpIeiGjfOLpPmIyPSJqAkP7DS+rQWloCtPo8EbXZQT8KxgUThfd6f+MN8Cj4uX5+acusNiCJPHkAPNd/U0pF/YPfdjGaGS9ll4Ze3sUKkHecRNHCB4OCJRXr8tn8mIB8/FukGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iqfhj3UE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C890C2BD10;
	Tue, 14 May 2024 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715697704;
	bh=GehxexP+mxbBsUeyRVVy+3SbM8PqCsrvHJ91hWjfIqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Iqfhj3UEqaT3worVopO0RpiRzx1qOt7PcnJOUZJdwYY51NoMWpzrrz10bI8eUn1nE
	 TZO697fwiRdUcSL0ShUuX4BJiHAo1jQq0TRq/FObNHIFbLjiMLvVmfZYn5FzrtEBrU
	 is3PRBztwKG5b9SYgAAcmmB8ILHzSZkiWhssKTpiVufR5iO9BIpVQ1DyMa4gZA3PdP
	 qXaFXEJpjAcWPy4ocsVjT6UX56T/0E8aOImnBp/4kiaeFFeymSd7YZCyD7CERBI36d
	 8re3DAqt1YzMDNMA7pwaO2qnttWMwW5nofBKBKFr8KbM3yrksJ4WBYd8StBNExOhne
	 yRoAQLWa5LXIA==
Date: Tue, 14 May 2024 07:41:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Vinod Koul <vkoul@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Mark Ethernet devices on sa8775p as DMA-coherent
Message-ID: <20240514074142.007261f2@kernel.org>
In-Reply-To: <5z22b7vrugyxqj7h25qevyd5aj5tsofqqyxqn7mfy4dl4wk7zw@fipvp44y4kbb>
References: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
	<5z22b7vrugyxqj7h25qevyd5aj5tsofqqyxqn7mfy4dl4wk7zw@fipvp44y4kbb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 May 2024 09:21:08 -0500 Andrew Halaney wrote:
> I don't know how to figure out who takes this patch in the end based on
> the output above :)

bindings/net is usually going via netdev, but my reading of Krzysztof's
comment was that there will be a v4...

