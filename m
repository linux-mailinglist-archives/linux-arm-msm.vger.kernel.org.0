Return-Path: <linux-arm-msm+bounces-83218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D018AC843E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7B52234E268
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155B42E092E;
	Tue, 25 Nov 2025 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoPGKc+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68F2E03F5;
	Tue, 25 Nov 2025 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063204; cv=none; b=kk8uWhgooQzKgJbCVQASRhaVttYRnQH8dE990C37C/ECAd5KZRjiwIQ2A1J+jOBSKGklnI+RKyKV302ukKoFUQ1CK1aox8FIGVgRGDG51uYp0iKTxLZu5nebIHriSpnmWj0anLwa0/9FbAwJX9iO8XTWzWQZIrdDvEVq7ODtKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063204; c=relaxed/simple;
	bh=pGhsmOcrkvPA6u1+azfwJ62zcu/PYOCnqEKaM8TXPUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvYVV072lEWXN0xlcYLzr+B5Y7ZMFg8ktxcggvuVhlHNN2jh42ZY8IauGlehDvGzjms9N5skT+qBwKNiujUdfpiDuLN6bweowX6jMzhooFZuFbP1ThKMMBCmAyG1qVtGviVTcgSKVqJtQ9rI/cQSXZ5QjTAyZpWFKIvo4/i5Eco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoPGKc+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D9DC4CEF1;
	Tue, 25 Nov 2025 09:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764063203;
	bh=pGhsmOcrkvPA6u1+azfwJ62zcu/PYOCnqEKaM8TXPUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoPGKc+wd8yWEVmVLfjC5Co7rsKEGsX7bbr4PgEML8eZewwVdj2ceHiuH7WIHvzp6
	 NE71tg+HT/t2ICyBIZFSlq0/WEmko1/PBIGfNM4FAiybwC6wTAGPsZ+VJryL5UX6OC
	 0tGJWGYvzRp703ZwD4nzOv84JmdM7UP83zZExwX7v+cNzh7eSAwM897Tb8GPk95UZa
	 4MDQbx2uy2VmunxOGoqGexQ+s/pQmMY8+LdNVbmqYUVlkBEJpTHjfb5KrOWhGibASF
	 G0tbEiaRTxZmLed2RY1I7i2TX9mzdgXsz3C1gyuP5s9kZzIDBF7Yyl1aWTJUr1ox1e
	 G9fXtWIGMIryg==
Date: Tue, 25 Nov 2025 10:33:20 +0100
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
Subject: Re: [PATCH v3 3/5] dt-bindings: display: msm: document DSI
 controller and phy on QCS8300
Message-ID: <20251125-obedient-literate-newt-e7f6ce@kuoka>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-4-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125013302.3835909-4-quic_amakhija@quicinc.com>

On Tue, Nov 25, 2025 at 07:03:00AM +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on QCS8300 platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        | 102 +++++++++++++++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


