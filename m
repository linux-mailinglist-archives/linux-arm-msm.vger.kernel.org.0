Return-Path: <linux-arm-msm+bounces-78732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAD0C066D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 15:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF4511AA0CEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 13:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B37A31B13A;
	Fri, 24 Oct 2025 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLUIc9EV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6631327F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311691; cv=none; b=AZpkUB+Q0DmBUUCE/U81psI3nQwR8NEc2IlM0XlsbKTqGxf1rcZNxC0Qhn9uS/FnjiBbZHyJp5gmBG66maOsunhKeI+Q7LziYtO2REypz9QN9T41P/zd0NMalyB6RSpDS4Vr/1tbfqqmA0+B6sdm9MLDUGrvJDTsqppanowHwbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311691; c=relaxed/simple;
	bh=B/J4fSXBxYjahTVHd6bJx8SmdiExewV6JSag7qLfJVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIgOB5imoa42ud9srmjOrIzL1fbWA5b8b03hX/SZo8hHIbl9afWsxbCxWemh1IwuKWbuw/sj/D3fdHMyyQHN5QZPGLNOefrxX8K0iNVMKjTFbndFSwI77KBgvFjoUrV+RD1ibAWSUOAAMfzph9U2OcGDCmi1MSOw11f8pkZ8LBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLUIc9EV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471b80b994bso29096755e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761311687; x=1761916487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aw3s/Ngv5fWq93/LfGGZRypt+nWW9NzGjLCsQdxHVyo=;
        b=iLUIc9EVHB8CPOYr/8Aosec0lmNS9mPRCPjto2946ZJMD9XWMeJW4r0Q7fu367bnlt
         wi+Y/ZM2XORF1mmNd+77e1RrmYO3gAkyGooMaT8PSUQ1M+ih0phuEaCBGjUvSLgX9VwU
         pWQrdjwYepfXQ+MBuzvKo6zw8+aAKFyKLgZ3w0xGkt2/Z64CT2J+9Cst5RMewwFCgQt1
         79ibxE/AGJQbg/9HWrODN+bM0djG6udhapUO4bUK0INXeDH1J1KA18dSEV8uEDNew7vu
         tcsqbUT7N3cbXaMBgOagia2fysdhyqiGTkX65G/T6Zv0BytNPU/J9T1TC+7c0qZa0xG6
         WNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761311687; x=1761916487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aw3s/Ngv5fWq93/LfGGZRypt+nWW9NzGjLCsQdxHVyo=;
        b=rqBx+X3tjZEzOhYouBD7LuFEfbffvgdhN9lT6xEySrJzpuX3l5Csbl/U9U1gSeydxk
         80S5SshklfonuJQFWdUZfp2Y/a0MYthe35WfMVEP3/DJwpBQ+ygsvy4nfmGAu50bXdpI
         +jOnkV0cHiEL7iEwzuDEq2TjSSABgtAKb1kSHZFbh8u0N9lw3mfI1vXWXMsf9bgspKP+
         gsRcRjTtrfHILu4+LwAslQZoCQLrMNT/r00vVPvk9OitdW8IiIYQ9K2AidXt/HeLV497
         xDWpKSU5kyfDz6Xqhtd9MSs9tFhrWptf+ycylqGq9yGA6Q8nQIzskkDpq4dKv/dZvilP
         Z+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUE5vqmIVZzJ5BPDmKG+1ks2N1pKgy3/HTlYusS6R/w4wxaOgfPmivQGyfXSbMwYhfnMTVVqH7b/XJwHJPL@vger.kernel.org
X-Gm-Message-State: AOJu0YzsbP7hfbWXxCeLTQSeEjkSP57QjDrlwe9sRgyALr4pTaSb3koM
	7t1N4L7sEh0LmZ31JZq4Uq94bDdlun/hrc1+uOEqLZPMIWlg7Tkg8M7k60JnzpU+7Vw=
X-Gm-Gg: ASbGncuvUEcuIEBKm8Wu2+9VDWRi7M9kfbzkaN2oOzYH6hQqancmTHqOik2kBi7SI6q
	9QA79rJubdN9RYKtTTYISEPLUkktoqQqhTfne0QICbVeSt8jmsNwBhSJUkupEN8pJBAc5ZqkhKm
	LujlBVZijAY0jb55FKz0nRN/AuOi9elRJeAwMBe4M7ZFQ3HHaVxYiSZdkTepXXgfhL1x4KY+VoN
	GaYMdJJRS5Jhf3taByNRX1W0BwWCsOKZegGoyFGaXA6nQMD/Aa599Rv58sEJXkI2jjBHIU/DK1w
	6lCMR/QdQST5iePmsYoJ+rq3vl5MrF1aCmcbxl6QM5+bTmsHGFo4X7s+RkF/IrqeXmeLRG1r8Dp
	DGRBEk1tgMz+rq0qVBuUQBpDb4dvSy+RvB5ILhv4hoSdrD6sGqof3k9ow293bAyS42UeMvNmZpb
	/nzNNnSUQ=
X-Google-Smtp-Source: AGHT+IG173mHKY9AS/3Xa7nR0RgEEWZWPFN6mBkCz/tfbOlzz/oOa+s0Yjnu+DHdEWhOrllzlsrkKA==
X-Received: by 2002:a05:600c:6291:b0:471:a43:123f with SMTP id 5b1f17b1804b1-471178a6882mr222738315e9.9.1761311687001;
        Fri, 24 Oct 2025 06:14:47 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427ed3fsm175699395e9.1.2025.10.24.06.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 06:14:45 -0700 (PDT)
Date: Fri, 24 Oct 2025 16:14:44 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Shazad Hussain <quic_shazhuss@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100: Add missing quirk for HS
 only USB controller
Message-ID: <a2cjvvt36jcnmbmsgf22a6b6p52aoejpvwbo4phsd5gc6xclba@havatemgahmd>
References: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
 <20251024105019.2220832-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024105019.2220832-2-krishna.kurapati@oss.qualcomm.com>

On 25-10-24 16:20:18, Krishna Kurapati wrote:
> The PIPE clock is provided by the USB3 PHY, which is predictably not
> connected to the HS-only controller. Add "qcom,select-utmi-as-pipe-clk"
> quirk to  HS only USB controller to disable pipe clock requirement.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

