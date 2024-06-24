Return-Path: <linux-arm-msm+bounces-23936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44437914996
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006522812ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FD913B7BC;
	Mon, 24 Jun 2024 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cP4mIub4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDC13BC1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231285; cv=none; b=Z5YxUm0CizXmGT0v+VfU+yKbAnhmn+iN/UgGVKPq/oaKSMIpKB3Naw/eyhxZJkxXpGUwUoFMh/xSiMB12pMnNzW0bfD98fG1LtBhPB1AcuQghyrF6N6OzIpraBXXSEcLZu7Xd18GD9bU9YKotUPdj1zHMsl//r7yjgqCQ+ehSbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231285; c=relaxed/simple;
	bh=Gxw2i4Bpr72gUzRUH2vzyv7nhpA9aEHobxKpIugQ5rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJLSaA1Tu/V6ngjlDSstsjD8FWSakl9OCuJvISPlQCRrIxHjw2wcifdBdCWYGjvlfI7WbWcK8+OuVvSJ1SuwiFW8K/XrT8w7U54ErteWBFAClGADlahZ4F01WxjOgpVDBb10HE0lAWXWNWz+K992ZW/7WYQq5UvMZ/C/5NSKbfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cP4mIub4; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-643efaf0786so10416567b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719231282; x=1719836082; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O6E+NAhE24Vj48sHTkPAWal2XlcL94IcwqY5bFeQzKs=;
        b=cP4mIub408806pBH2sxYcAfwmuOH1nSgoD0fY8zlYItZ5JEgpMnXAT1AS0lK89Z9OR
         vcIU672cAgxYBedP4URuGMzu57+V7V+uYL62BvD6KU82IYws4OiA0fve1D9q32u/UhvM
         EDu03/BhW6UUQiHPko38SJLPcvmiNx9Ccf6oScquWR8LG0q7i1EHrBpK9kFWm3pkOflC
         WjsLkzzELnpX+lAbz5mzzNZL1V2aQQIWF4rREs6U7Omy323C3i3duNOllrWJHrBOOaxp
         XkOzPmNiO6Mr1oH2nTfeSSLLa8z1J58/p8v5ZzFlvgrgD5AlXhPD662i5lt6POcBL7SR
         fwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719231282; x=1719836082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6E+NAhE24Vj48sHTkPAWal2XlcL94IcwqY5bFeQzKs=;
        b=C3f86NQUi4lIcYTHeKHysIUsO8v1uXUQPC6xolslBDBcW8cUfY8VBG+777QpE0webK
         oqlD8JjWKIswGSUagW/JBIcrLpgtKy4n/FqaGKZPbLeU3w/jShqYud6ABNh7kRx8ANEx
         mMelQBu5qFQ8SSTfyjGh2IUwlUtOrhqsRDK3ZNSad53ftXrV9jz3/lk9sow79lAKlBC1
         o30/4woG1yjsU+jp/Kms7emLtNPtvpRDBajwHlWkgfQR1CkDprBUWBAzpK801dvDJRLm
         OxN7NhPffujSDt5Nz5eOVZUUqphADzDvyAkhpdedqMY/Rwxf78Cz6EehGVU5AodR5B4q
         9Ovw==
X-Forwarded-Encrypted: i=1; AJvYcCXvWL/z5FwNAoDr4blXl6SYZZySA+imeXpZmRM9HWVo8HM3op7R5eqod7FU47D/0ni49qPcLS3bdhLjl+DqviC/H6bWg9XWZfTjzNDt3Q==
X-Gm-Message-State: AOJu0Yyz/Ktd/uMzJKvDtXcx4afxlnlcpuwDBwMVQmO8OPhbkSmZiULK
	iBUyObZtnjnuUR0GpKpqImlC0Qpm4JdACf+p926G9RJ3SgzBWt4z5yf5kTkUbqBdJzZ0jy8FsQO
	7XSvRC7PD2BbOI4rS6kqvJ51O6PtrzqO0rp0l6w==
X-Google-Smtp-Source: AGHT+IGQBENYbZC777XGeY3LRTT13xLRxI3cxE38AzllJFwU6q6lBrNDEero0nGMghNsKnGC0bcbVv2XlJykDr+2mZA=
X-Received: by 2002:a81:a803:0:b0:632:7161:d16c with SMTP id
 00721157ae682-643409d7f16mr38317587b3.28.1719231282038; Mon, 24 Jun 2024
 05:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624120849.2550621-2-caleb.connolly@linaro.org>
In-Reply-To: <20240624120849.2550621-2-caleb.connolly@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 15:14:29 +0300
Message-ID: <CAA8EJpp-qCFtPiSVe-+UbYB2BDKH5U3=x+qS_Xb1zn=Pesxmxw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: add resets for sdhc_1
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 15:09, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> These are documented and supported everywhere, but not described in DT.
> Add them.
>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

