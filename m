Return-Path: <linux-arm-msm+bounces-49341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E34A447D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0CE17A08E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE02719993B;
	Tue, 25 Feb 2025 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5HEA/P3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35ED194147
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503697; cv=none; b=QLscYW2h7MMjgGPKyzr+0HBomdzr07ihS8QYhAzj81Vlho5LfabxIAGf0rOZ3g1x2cnVnuaBEvzhD/4ssY9PPllE4ZTiLO8/vVeGQ/BSpAQKHgBaYOg+PxozMC+hteHzF60FQB8X0ebo5R3GfqO/Y7OLbDLFWbvPuwtlwqgX7hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503697; c=relaxed/simple;
	bh=jIu3Rpw1Xfn7e1gbxAcLbkp/beSC/XjwOVnR7tMlyDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApDBi+ZQMEHEpxBHfOanItY88FxNWRivlwLsHcP6Yw2N9AUfyIa7gKU2Fcw6rdXUzX5qA2zikR6dNe8OBjfOcrVemaHM5q8O/HYZzhVrbcFZ7jTMmbqZWsxnaxXv6RMpdNSaXXd8/t/I6DkGL4QI7IEfTe1AHK8Q/9b1FW7qn/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5HEA/P3; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30918c29da2so62701711fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740503693; x=1741108493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+dODZ+7MTPPBH6S67MBivWnFKuk0Orcv5ZDM65vBwrU=;
        b=a5HEA/P3EGo8ijezskDUs0+Xo74Tl4X5pShqCfJtmnzL5UgFapbcbDt5Qb2x35cQBO
         fzTvcKk+8SncWqko/oIHF5K/fqLcjxxX8KzHs8XH1LSibIHsSiGY98oBVthvED/QDzDd
         00wdgLkYV1+0vl2qDGTQqQls37k+Nm3iSZfJK++xuW+AWv/BAdpXa1YKTfJayWxFUmMy
         yPZL8De+zfgA+gGG17lWspfNcdWVGIfIKgJ4n1CgzmWgaXUkWmdb29HVr5sjNrHKKwdj
         OV9VFrYrJa4AMj4uIyvd2TbtqLy6dp2d2uHe9i+RqhrmO3Zs7rffQk/MAy1BdyichASK
         xTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503693; x=1741108493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dODZ+7MTPPBH6S67MBivWnFKuk0Orcv5ZDM65vBwrU=;
        b=SM9lRhDldfYTnxBCf7TzBnVJ4KNaq65mdGnznRR3JbJ4ns2lL5rpoJHyUtS8dZHRqi
         f3NKVTruCqzRFDlpxSb3MxKtCf8VQzTy9jJzNGRg1srQpp2em0f0WIt1huHvVa0lf2px
         RoOVz980+fD7+oMUmjgzj44TykpC8o13Hr9olI3VW5PELBqL6NEXSlqDpUYboMqKfPmy
         r/unWs0jzTrCiSqQOTnhAsu8wyjcK743NDGgFG+S+92P9HQc9f0T+onAivKK/YLvZhPA
         AtyrNb96HmR9JGqdtgJ6Ba8OSK0As1Wbh7WZGI32djqryy99drPRE7EgIYxdgyiEgxBP
         /HBQ==
X-Gm-Message-State: AOJu0YwXUmVKB3LbVHoIUj/n8VuqcNvLLBL/dTlmVp+CpY9F0zQTEtPe
	+rdsWPe4ip5yr6htc1dqfq62jm6i1pD9fRtNdaNt6I0xRruGIQnC2EmUBYYpocM=
X-Gm-Gg: ASbGncvH+Ewpas7sU+Hgw7iLl9MbneuvSFzgNHiZzfbNnDi9a3288ljzh1Vsx4pglEl
	B6SNteY1Hbv7ppAeYbx3/nwKVgC9RIa+K7nOwxC4Mu5kaAJnfbhy0mDpc3HsutojZ/cjVhBlsXO
	2Kw3OynyTLQ16movjC9PsC49G4fgQTOz07FNwuNa9pTvreJwX2PXJsyd5SLhW5zi9Z3EGXdQolR
	Icq7VpgGhZbw2gqYHwYpzpOL1nhT3q1/txIdwWpG8163CzHnaWxZzC074SXLESsLtDMJlZOG3ny
	u1JC0W6Ubp7xzMXE70YC1+Ph+GeTIGfdwELYWh1SygJf3e0H/ej3fz5DoC5msp8ulP7WDwPCApT
	UAq68HQ==
X-Google-Smtp-Source: AGHT+IG2JNWtG5t9NbVNuoQ9NN6EnQTrfMLDjiH8gZ0sx1WPbonGS4f2ipr94i56nk1lp01l/rVSZw==
X-Received: by 2002:a05:6512:3d16:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-548510d2891mr1850229e87.22.1740503691782;
        Tue, 25 Feb 2025 09:14:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b237bsm233549e87.4.2025.02.25.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:14:51 -0800 (PST)
Date: Tue, 25 Feb 2025 19:14:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
	andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
Message-ID: <jrlpgcg4f4p76muibh4hypdjag2fl7ex55bspxhkjya6dyqjin@gcsrrrtoggcg>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-5-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-5-quic_amakhija@quicinc.com>

On Tue, Feb 25, 2025 at 05:48:17PM +0530, Ayushi Makhija wrote:
> The SA8775P SoC uses the 5nm (v4.2) DSI PHY driver with
> different enable regulator load.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 27 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

