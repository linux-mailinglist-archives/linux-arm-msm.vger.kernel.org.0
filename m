Return-Path: <linux-arm-msm+bounces-83217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C1C843CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 246124E111E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F852DE71A;
	Tue, 25 Nov 2025 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVFwqhoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1E62D7392;
	Tue, 25 Nov 2025 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063105; cv=none; b=u0RXtdKEgtutCr6GjZpgQfdqtWbGj7FwjOUT/SYwQYz3V0ZSJvrzLjXOfHP9RD675nzl5+/2CBwsy0/IiJdYbS6Rw5OVsczjxkQFaU00IYRppLX0qbQRLkUMlJNRoKaXPF1pk3DFDsi9vHOjdVGWqS6nI09LGzDO4aCtBQZb5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063105; c=relaxed/simple;
	bh=MZAN5MusJR8MW2VtWuKYEncrkiYUQ8s8U0XJPZLuuWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqQXy7moCK/37m6E6UQKqOADsGROJ+dghC42a12bQTWii2C1btnHraH2cTL/uNS2F6VaQtq9s3yl+Bnl89ZYwfbsbEnJ9o6GVs7+FEua+L8suibiRRr+zDYKay82KxbA/+RTf0rjRMfU5SQrC7CCjNZeGqFQU/x2mCigSrxe8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVFwqhoG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4AEC4CEF1;
	Tue, 25 Nov 2025 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764063105;
	bh=MZAN5MusJR8MW2VtWuKYEncrkiYUQ8s8U0XJPZLuuWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVFwqhoG328pUOqsbYeq1VrAiETx99D54Mcgq/GABAKleR3H+25gInKKGBLzXrkHh
	 1Jc+e1sSVPbsKOHWEWzfqHMU69K4XHx3H5dRSRWPtn9lu3DI39K3c2MUjPkytwPauu
	 UJRnzwEGnKl2T0h1MZD0lj0192I7frTlvzkLJHveL1t4O+2sU0iHhRg3Wqd1/DIu3G
	 NNSsENQ2UrANXdX7R+xS1cvs8oOU8x0lsOEhpmipvAafUl2P/YE0T3fIk+VeKuXNWz
	 8PafN333EGwUjJjtHu899vtMzvY62RxNpR7fQEMU6lhHZW915r0HJYbSEIUpoZzwmM
	 fFEAwdZGtbzZQ==
Date: Tue, 25 Nov 2025 10:31:42 +0100
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
Subject: Re: [PATCH v3 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
Message-ID: <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-2-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125013302.3835909-2-quic_amakhija@quicinc.com>

On Tue, Nov 25, 2025 at 07:02:58AM +0530, Ayushi Makhija wrote:
> Document the DSI PHY on the QCS8300 Platform.

Explain the hardware, so your diff would be justified. Instead of
stating obvious or copying the subject, say something useful. Why this
is compatible with different platforms?

Best regards,
Krzysztof


