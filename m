Return-Path: <linux-arm-msm+bounces-49345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0147A448BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 902991894EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F1119DF64;
	Tue, 25 Feb 2025 17:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lskBRkid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F619CC11
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740505320; cv=none; b=IZ+yvNq7gQyqkcgf+vkQoIQPyQ2v5HFgfxbbx6yZDuspWEz82MUs872aECItgSgUPIAf6DVPrR5vdnWaY8qUVK/kvdHpnih1UzmVKu02S1E80vw6z3IDlVo071HncX2PBV0GeUqW+YFnopt16vV1Me10HEOe7N0IYH6ksXktBd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740505320; c=relaxed/simple;
	bh=70HK7HBG2n7VP/Z60nAkf4u8jZifgdcTpHsjW7quBFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOD3h6kfEpW7bNOQSw2K6GCbuXWtwfbEOo0hhC9kqA9FE1WjZaMz05aGURndulcUDDIO4fGLXC3yU5EvEF4ztPhVfcrHhwFfKNFm3QekU6RqFK52PtNKGXd/7Oni6XYG9HtvfQfu/oUHj/4ZcpMB7PShIzgKFcbaisL7Z3C0IkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lskBRkid; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30797730cbdso58413531fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740505317; x=1741110117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGyWaQIzn0tRIGg7LsrZt14gQY4q2FyEI8TrfL/lzng=;
        b=lskBRkidox4vBKQO/WemNZw4InkdhTbjvYSuTviij8WzW0Kep96MrQfQNcpBx5oMx/
         dhXo1LHQG8oFk60VZk04Twh/UlXy7E8vozcb0GRmsbLbF5fvgroPYBHK/SvDxxNma2nW
         RawP8cBhRu19xrv5iCdxIeCpVHexItJ5Amqozg+eICFbhl4UMqrGJkzt+imYp1kwgkJS
         AYQD/I7mBbl3HhVlMlb/x5GNr2ibJ5F/XnyfqE2PEjbP2KH4/Iz1qmrOaM2zuQ93vzXl
         O149qSw7jzFNzzeW8Ef1tgcL/PyJLnIlDtkCW1zfiWuWAB4IlYzzMG8VXcld2dSpgqG1
         Fi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740505317; x=1741110117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGyWaQIzn0tRIGg7LsrZt14gQY4q2FyEI8TrfL/lzng=;
        b=gwaCjfK0OMGCQWdnuKvxrqdv51rJWHdEv4LmkDBXNVFcfJsievTZKLpl9Q+6iPJfZW
         HTn4Ye5SXI4NFUt0b3Pb74NSbfkSM7ZSyqvxfZ2aravKmmTLUx5nlqci/1AotWTkCIOS
         xPFTr9T9Z3RutWsyQscmp+g3cYL5bQdGNQrK192R/QHID9ERTuJTxm858vm6lqvjfai0
         0N766ha8qVC69i/OMZDIvNFceTH+mFlwUqMurDLdrguFeVxxEI66O2hPhgwJ0oZYvbRx
         UNbvaeq0sCUtI/E4rVF3X+Jipmb9P7jx5xK06iGEPjCEODxCgu1Mnnl15F74rcyOnAHL
         01MA==
X-Gm-Message-State: AOJu0YwCJL5MvhiTyLPZJ7fNLmrU25Zv5pv6QdHdyUAREYGLFkjOkUqD
	U0MXQ3FDEJW7Bi1J2LDy8xK51hUc3VAPNQUzmzv5YhkROEXvdUvsvrYKXngNEb4=
X-Gm-Gg: ASbGncsQoNyqUTCf/rpbXhzQkkYu1V+BPxk+jzbNpVN71RpTNfmFLqN+uEygSaHNAvy
	KHSAxcMNGWZ2JP4sDvjHBALBmD0wtFTBBfRVlbJN9Q43mVASJLrRhBCIWov9h8lQr/1LtSvKRUI
	+KDrNrd80ZR/9VaRNy8nTzQRsBpqY23yCE6L7+KDg8mkHjvuI9InaX4Gt/BCWdG7q6QGRcpoWHZ
	BaaQalgttNhHBe3eDe368Eebid0m5HlpXf6nxGz8L86HF13UcOY52BbV7pa97l66+hMByuIZ+ww
	GmRRm0cYPmcJvLZvpCTK/HYHFBZ/ckRB2WkrOSdQ8qTFgumMg/MMUqbkguRbz2QcdiulKTyOySL
	lv+ISPg==
X-Google-Smtp-Source: AGHT+IHEne9NXWRmeaKHFaxNKBm56TZDZJt9JjVGVe+iGN7IpuMXMithW5dQI52NU795ttOePGE2zg==
X-Received: by 2002:a2e:9f47:0:b0:30a:45af:c18d with SMTP id 38308e7fff4ca-30b792d7e3cmr4328091fa.25.1740505317050;
        Tue, 25 Feb 2025 09:41:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ac3151sm2797611fa.68.2025.02.25.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:41:55 -0800 (PST)
Date: Tue, 25 Feb 2025 19:41:53 +0200
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
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
Message-ID: <2jsornaajavpg6srqzjuwvzt4usvmzmwqdbzw2bydgxisfsrdy@csujibqx2zi3>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-8-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-8-quic_amakhija@quicinc.com>

On Tue, Feb 25, 2025 at 05:48:20PM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 136 ++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 1 deletion(-)
> 

Missing dp-connector devices. Please add them together with the bridges.

-- 
With best wishes
Dmitry

