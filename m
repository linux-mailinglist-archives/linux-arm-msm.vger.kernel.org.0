Return-Path: <linux-arm-msm+bounces-86762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56FCE57F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 23:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 088653002A66
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 22:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BB8272E7C;
	Sun, 28 Dec 2025 22:31:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C163121256C
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766961077; cv=none; b=CX2pVyVbAY8VLP4hUr++AUbgiMu7IXwFRlCSmNZQYtBGfXWr7m2F6jN+C0u0Wy/meHrX1P2dajy2497OHzYv+CQd5TZ2DwUr0VGZnf324bHzHgbLQcwi8awYOGEAEq0BWqtCYiIfT37ssYi3T0yLQ59KTsfc4AmmXtEOHNstP3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766961077; c=relaxed/simple;
	bh=788XqJ5dVAenHvJ78SGTaFTWedi+61qLAlv+c8nO2zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sffMoXCPw72bd8AGngREty426AxMb2wHf0GnoxrCBq0/r5RiEjLqm5xZjT9CVJXwNtRCAS7vL0eIWz/pXFvtGo2HfNKzUqPDgQyors5YU4P5yhK9O+1y23qYSriR9tVt7+iB0VqYZpjF03iCcc2DYl0R2L53DJINBO5sENEq+hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A542A1FA79;
	Sun, 28 Dec 2025 23:31:06 +0100 (CET)
Date: Sun, 28 Dec 2025 23:31:05 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC
Message-ID: <aVGufYAmikItGgYi@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
 <20251222-godlike-mongoose-of-valor-3eeee0@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-godlike-mongoose-of-valor-3eeee0@quoll>

On 2025-12-22 09:33:04, Krzysztof Kozlowski wrote:
> On Mon, Dec 22, 2025 at 12:32:12AM +0100, Marijn Suijten wrote:
> > Document the Samsung SOFEF03-M Display-Driver-IC and 1080x2520@120Hz DSI
> > command-mode panels found in the Sony Xperia 5 II and Sony Xperia 5 III.
> > It requires Display Stream Compression 1.1 which allows the panels to be
> > driven at 120Hz, even though a 60Hz mode is available too.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Your patchset has multiple white space warnings. Apply and see...

I am sorry for missing this.  I've asked b4 upstream to include diff --check
validation in their prep --check pass as I did not save + reapply my own series
before sending with this workflow.

- Marijn

