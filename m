Return-Path: <linux-arm-msm+bounces-16262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE31896D9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 13:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A01061C21CBA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 11:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527631411FA;
	Wed,  3 Apr 2024 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4aKXYUK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4AD43AB4
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712142300; cv=none; b=PlaWss7xeD+xw4JHSjd+qSL4egqBEdApIutHgikfaibh6SQhDO3otRdqBS2iLFn2Ob7/BRfV6zttbcwn47KeF9F9ZCdHQ39sfADgLsHjkUb8pkZj9fvV2xlF2mpFtssthmOxJ/98pwu3hh1gXkv0guScusis2pdXuRiCOsIfGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712142300; c=relaxed/simple;
	bh=qAXDnAQ20/ngldFN/9GzwB90qcvOX2UPkxSdCsBXvdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ge7Lc5AXrUfvlzWl5kohoxfauYgWmOr317HtCx/+SjHWlKPpR8CzykgsDMtwB8CuZ0QC4WNUppvxeLfgxrPuGj07pkqsvGLQRV54S9tgD6/w7VUXZLnTz/m7F0BdVS/vJJyOl8rj3j4Tx86I6890Cm+JHLIRNSa3mr2wWRU2lIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4aKXYUK; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso4040060276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712142297; x=1712747097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5/oaXGaDXSfCFWNRLUlqUFokKx3b3oa0E7IyM+4V0U=;
        b=U4aKXYUKDOHk18ss2xfkB6ISdDfnhaV9M7b/qOQlpjYaUxCQ8Z9xdxnEbE8ISrklqE
         o1AvkV02jyN6pFhV4Rk/eNEuMRJBijGolfPUFqN+HeNZlYTURFiBVmntK/eAFviWFH/H
         lxCjbd8gmovR/rvPJKEaB9+FCtT6xN6bwRFBlBWIw96Ixlo4Gb8glBQycRfp5J1zFPT0
         BguljZeFh/83ZRPbLTR7ihxEwpku+mGY7H8afma2zt0A6SEHUtgCfWeThJqM7jSDi2nK
         +zjDXZ6PhpttoqJHowhzxgAW90fsovNJ7H1UZL+HR4B9hbPmMV9cjC+6gMgz8v0Dhy9M
         O2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712142297; x=1712747097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5/oaXGaDXSfCFWNRLUlqUFokKx3b3oa0E7IyM+4V0U=;
        b=AdbG4TiMrfeHPlx25MVQh2oYH/RbsZzO6Wjz30bK+wnjfPgkjVR4WisVzzF815gi/q
         5KQgyCwb24tmpFnZhiZqtMRA7GlGNHl4kQU4JDudc2aZMuka/NwERdb6u7TCMFzZBOFM
         HZSmvg/fczJauCsHZWtbhAsqqFWBdglMDkCWunLHCtc7fYopazAHzz30UmAjtD5a+XVj
         oBpcQHSEZQ/E3NYUN9gn1v5ECR2E76v8/WFgOAhni2HteW6O9dHKIfknWKctJr2L3yP2
         oFitk6eW96xAYIQdQTOY/na7rOWSDxym24ymWD5Xm90zcn4GBNxxuiWreeye3nw63xXC
         ydzA==
X-Forwarded-Encrypted: i=1; AJvYcCXMa+6h82e2SyxNcnJ5Z7srsesQZBJK5Qj9Cs6UMraH/aPSkHBsGsK6RtFDEQy2IBEPgeKBQMwEYaxEjHP7eQAZqzrWwAs1LeoIsYp/Ng==
X-Gm-Message-State: AOJu0Yz7AVoslEjUtznbgUvAUqnCSpXqPAHDNvMdaOWt4LteSlhmEpg4
	c2qS41Pewx6O/DyTu6frGU3G0W19MY9emdDusdjWK6aL6Ui57N7qcVm9QBEIl9Ku2kQ+HdA1WB0
	5JQ1Jus1SeHlWrDSmQICcOGthMFQ9gS3H+PgQSw==
X-Google-Smtp-Source: AGHT+IE12sfKk+/XM1kPq4dc8JVlzR2lCkXFu/Nv2FXb7Fs+ZLOsbaq4fFXjYhjHFZTi4dzZn/QBvEeU9aiC510tGYo=
X-Received: by 2002:a25:3c42:0:b0:dc2:234d:214d with SMTP id
 j63-20020a253c42000000b00dc2234d214dmr8359198yba.40.1712142296721; Wed, 03
 Apr 2024 04:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403104220.1092431-1-quic_varada@quicinc.com> <20240403104220.1092431-3-quic_varada@quicinc.com>
In-Reply-To: <20240403104220.1092431-3-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 14:04:45 +0300
Message-ID: <CAA8EJpox3EmmV9o6HqRJkTwDHTwAYQ8kaiJr1PacGnwLPSweQQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] interconnect: icc-clk: Add devm_icc_clk_register
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	djakov@kernel.org, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 13:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Wrap icc_clk_register to create devm_icc_clk_register to be
> able to release the resources properly.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v7: Simplify devm_icc_clk_register implementation as suggested in review
> v5: Introduced devm_icc_clk_register
> ---
>  drivers/interconnect/icc-clk.c   | 18 ++++++++++++++++++
>  include/linux/interconnect-clk.h |  2 ++
>  2 files changed, 20 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

