Return-Path: <linux-arm-msm+bounces-45662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7129FA179D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5BD87A1474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556011BD9E1;
	Tue, 21 Jan 2025 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWP4SHI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B11B4220
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737450257; cv=none; b=O+U/rErC0rGZCX7EXJnRI7vh0s/JMFm99fxj+G1f5CqOKRLKFwywiEu0qqHRdQlN8p1fv0NSammWLQ2xcWvQK79ZYcRHnK8PrraYp0nbniKx+5BR/wYrf9HFUTcX5N5Kj58W2HltIUHreQHOwEGNzfJchJDVnJD6IjSL7355+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737450257; c=relaxed/simple;
	bh=XwVdkJ0HT0hM/KIl8vIxKEXw+1hsQ3Gq1c+crROmjnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JBFMxSDiB6tuWIR85VyVLpPupn7z0IXU1B2jMMmVSxSFTE6ZaumYG/HcumCIlK3tJI2RXuxfAaj2N7gFEzls4PGNve3K9MjNgXLgprJLntHdWi9jQcEfLf8EKOkWFnYKdBrML/p66T0yHgpb3WsbfHR26u0NcAUUI9bxgJMNMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWP4SHI4; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e4a6b978283so10646966276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 01:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737450254; x=1738055054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TRZ/7QvY6hrDbStw9BfjbdwJZJ42Wh88+/2ZYHdzGQs=;
        b=XWP4SHI4n1KMXD2QXy7MxmdGtfs/slvVfIejFISFg9KLhJDqQjO835YwfLmMwws9ki
         U9z1195i/k0jeDYwtQbCfwaIMh+ufK93LaHiHq3reLKzxhT77ILDcuWNdNSRAHM7DPxW
         srJ5K55EEaRd1ftMXSQ38qOHIh6RwXZHBh1xVFa0tHdtVQ7BOm/HqG68iFUhxxLLE3wP
         OEmo9bZ+yzImGpaR6Mrmp3cwxwY5IHZp0JnLPx56KbffP3J3w5kit0Ew1DmbpBOkgmne
         U5f2PfLF+V+STpmWLAvuG0va5VYr+WlyvKsV8tTwkeI6ssGO2izPfLONI7932vfP4ieU
         ElEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737450254; x=1738055054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRZ/7QvY6hrDbStw9BfjbdwJZJ42Wh88+/2ZYHdzGQs=;
        b=YVaa5HUtae6jfh0w+opuDX7uKBmMJ89qrwVccKFyZT0dCvN2IxHXAR+xPAizPXpCoo
         TamxkKJ7oXCs8fdmx2Ny511eE2XGwgEDVESZQOfS5Cq1svnSodNeIroea4Ez2x/li0/7
         zul6+J259MGjzlKC8taqVfYExIZ6fDq8N66CQ0IZlvBgA9w1QF7sHBxnW1+SdoWsCTNb
         65Mth0RUGwAh75gOgiC2C//Z/pO0m5ZKM37TTbLOd+40HLi8sF8qX72XYTnCm3yPX3iu
         PrAuhaz37cBKH/w9M8UE9OUZNrPqanSnYoh6hPLilsSWpIDlyKyLGqaIKqLrMG/8FUcv
         h3hg==
X-Forwarded-Encrypted: i=1; AJvYcCVYijajRLoXvWbXRehO0KVsJPnnIuC2F8eF50DxYOLFEDatBxTsx9RctGGmp/y/wt82nppFjAc9CuCrXb4M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+adHyXub82VSl2H3n5afJJBqB0COZArlWY07GIKBc6j2DX+bl
	ffueKqfdH25gie6lpdCR7Tjlxv3qkR5CYPm7yFiru7giN+qajvKii+cPyXbzorIeZl9TnG4cj2p
	SEbbXWlPCyHcRMSPQZT7esh8DpVjMs0G8nIQ77w==
X-Gm-Gg: ASbGncvfo4lScgClSgzx+xYCmKSfJjfJYq/TwzQTM9HNyZWtm4D81W7lCtVpQ9iWcyN
	ZqWN1AXkk1AKez+4+U4zXjbXBlRF5tXS1oau/Ln6azgsn3FCml4TBAerP9XUsT+vIZQ==
X-Google-Smtp-Source: AGHT+IFoHnJ8l+eLZ41NWp1MLHPBCOOYwtFmi7V7spFBaYo1FbiwAoxMsckJztOB4VIjiozcDUteo3hH6psVJeLHtaM=
X-Received: by 2002:a05:690c:6602:b0:6f0:3f7:ab1e with SMTP id
 00721157ae682-6f6c9b4cbc2mr209039717b3.16.1737450253743; Tue, 21 Jan 2025
 01:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120140006.655463-1-amadeus@jmu.edu.cn> <20250120140006.655463-5-amadeus@jmu.edu.cn>
In-Reply-To: <20250120140006.655463-5-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jan 2025 11:04:02 +0200
X-Gm-Features: AbW1kvaqAo6FggkPbLLX4WSITapjTkIJC6qfk1nn9joPTOdmHxvm-qRWqv7CaB4
Message-ID: <CAA8EJppBVScb2YRkBcYEoDm1Len8RknAHyfOWCkti5d7MrSxzg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: ipq6018: rename aliases of
 mp5496 regulator
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jan 2025 at 16:00, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Change the aliases of mp5496 regulator from ipq6018 to mp5496.

s/aliases/labels/

>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>


-- 
With best wishes
Dmitry

