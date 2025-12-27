Return-Path: <linux-arm-msm+bounces-86692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792ECDF8A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 12:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42F1430057C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 11:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0012D640D;
	Sat, 27 Dec 2025 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFjEEbTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13CB665;
	Sat, 27 Dec 2025 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766834050; cv=none; b=RB367V1k6dVy7EP6I1qsd04m4pdn8oo8dEc0TrMUGUjzdTfdBAbvS3n2BE8rVp27pOcAQNg4DqNtRZl0D74nwRs0Bkuad67ZqZfZXUHivk1Zdh5XzseKFXInar4v+0iaqyyck4igb/wQ1SfD1u6sG8usowZhnijarEP7W8AmAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766834050; c=relaxed/simple;
	bh=mocl3Iyc9eOq9L9HNTr6fpoKCle434F+Ha6YaspgZR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXfu7Fb5ADvXfXrhU6m+BgCBockgc/qYw14iZlQXS/S9+jh7JB3+9ZD/ICIUdao78ZyUGDB3bFCLBxMBP/6GTYGfsO82tLTAHK1zz1ZZb1svfEA19i/OFj0snCkePW2IKysF32kREZHJagSo5YtP1/JoN3jLC9Eiw1s+9Pt9unc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFjEEbTC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA11C4CEF1;
	Sat, 27 Dec 2025 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766834049;
	bh=mocl3Iyc9eOq9L9HNTr6fpoKCle434F+Ha6YaspgZR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFjEEbTChgw/DVH76cGOszGm5HZmxn033HuXVGQ1J8+OMAxQBttmDPJ80FrvxX8T/
	 3Z76TEl/U9Ftxu4gL6kOiZ5KqkRpovmBT3aTyj0X6YivEaB02Xx9z/yb+y3ZJ+8myU
	 MO1K5ZyRePsIo8I3mfFW7+NYdSoaTpcYrH6fBwIOMc24JHa3vrng4nn2n6bFkTR1bq
	 K4D+75scV7HbjA6m5imB7TQD/Rb3GS/ztzGaVphsgj4jzyYZqcNiuB8E9vgbDnOYQu
	 ez0Qk2wshz/4dkWPuKbkN8vrv3yNYIKLmgZcRWaZ7+7pQUsuYuXo8NV0AyAyqJ4Eyg
	 0QE1tFUwnEU0g==
Date: Sat, 27 Dec 2025 12:14:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 3/5] dt-bindings: display: msm: document DSI
 controller and phy on QCS8300
Message-ID: <20251227-vigilant-nebulous-crane-9c5a8b@quoll>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
 <20251225152134.2577701-4-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251225152134.2577701-4-quic_amakhija@quicinc.com>

On Thu, Dec 25, 2025 at 08:51:32PM +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on QCS8300 platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>

So you are going to ignore me? If so, I am dropping your patches from
DT patchwork.

Best regards,
Krzysztof


