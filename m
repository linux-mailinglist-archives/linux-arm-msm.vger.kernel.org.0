Return-Path: <linux-arm-msm+bounces-19847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB798C5955
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 18:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8A1528327A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 16:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89557180A63;
	Tue, 14 May 2024 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHDVHmG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6471802DA;
	Tue, 14 May 2024 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715702743; cv=none; b=MtbKIuyYJABDBkD0CPkWwVLSmWauEfd1WMfFzLxqY6/tCPLZLjxXa1isuhaaQQ3IdcCEAaDYV9gI+tjeYv/T/igXpOCkuEnlDBs/2beKSH2GbSCe8i+k8CReNkSX7jWHY/sZxBQfxvKDQK6H6FOHZcj742JyLhgP3uv7GRyvWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715702743; c=relaxed/simple;
	bh=LfGt458gqrTD2D6sed2pnE/rrA3M/QxlgfGJjFdJSoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PCXqzvAx2RFKmtTuwWn/IyQiVp2d6UDHRELL2vxU3TYgSYF8y4GZEXY4oW6whPXNd1KDSDBQ+DuqUzCEXddh8Dy8JtWWdTwQjJO65NI4YOu8o99Nh6mM4/WDH9sLJK9ntt26mZ/b6gWsZFon6vEy8rabbux9v4QYNT019CW5XJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHDVHmG8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08658C32782;
	Tue, 14 May 2024 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715702742;
	bh=LfGt458gqrTD2D6sed2pnE/rrA3M/QxlgfGJjFdJSoQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rHDVHmG8SjF+sNWVPOJKydsySYuwXNwEH9HmnXvFo/VogF7YLEJiGXzMpU23/l91z
	 j7Pw7LDYG8pnk358DCzlcZVmGf/V4DXz+vOZgDPw1rF4i6I7loeWhknq5NPQwLIB6g
	 e6CEw/zVuh+lBbQL264z45g5/DpCJukl+hrO7h0UeAIMKVMOKlpN166KbQRIR8hnWH
	 tB9/EhaKmVL7k8UHcAJ1zSowaie/DQQqQnngY+7y52tlTbaHtLpA/WTxNA5dRFMJrE
	 5iV9c9qnGQ++rleBsmLWD40KJLg0Oy+dbpokWFVbd0zMO6sAZgjo8DEkGt8OYdyaVH
	 dwAByV8+AfdIw==
Date: Tue, 14 May 2024 09:05:40 -0700
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
Message-ID: <20240514090540.23b79539@kernel.org>
In-Reply-To: <3werahgyztwoznysqijjk5nz25fexx7r2yas6osw4qqbb4k27c@euv6wu47seuv>
References: <20240507-mark_ethernet_devices_dma_coherent-v3-0-dbe70d0fa971@quicinc.com>
	<5z22b7vrugyxqj7h25qevyd5aj5tsofqqyxqn7mfy4dl4wk7zw@fipvp44y4kbb>
	<20240514074142.007261f2@kernel.org>
	<3werahgyztwoznysqijjk5nz25fexx7r2yas6osw4qqbb4k27c@euv6wu47seuv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 May 2024 10:11:35 -0500 Andrew Halaney wrote:
> But ignoring that, let me know if there's a good way to know who really
> picks things up outside of experience contributing. It's Sagar's first
> submission upstream, etc, so I've been fielding some first time
> contribution questions and realized I didn't have a good answer to that
> other than troll through lkml or the git log and see who picked those up
> in the past!

I'm not sure how well define it is to be honest. MAINTAINERS is focused
a bit too much on CCing people rather than code flow. Which hurts us in
more than one way. I _think_ the right way to find the responsible tree
is to do an longest prefix match on the path in MAINTAINERS, looking
just at the entries which have a T: attribute. (Q: attribute for that
entry may also be useful.) In practice I myself usually look at:

	git log --format=committer -- $path

where:

[pretty]
	committer = %<(20)%cn %cs  %<(47,trunc)%s

