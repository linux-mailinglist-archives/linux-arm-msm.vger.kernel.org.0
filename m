Return-Path: <linux-arm-msm+bounces-20898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7028D2E84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 09:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC171C22571
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 07:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659D7167DAB;
	Wed, 29 May 2024 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXmzgQLN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28F916729D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968445; cv=none; b=UyrNyMePzHAicrlAanoLp/m3efdgoyw++uoENDvsp9nq5fuwWlaw+YEKn3WCS1XCgSux4TB1jZk23iGsCdZXoCFt9kmSKV6kyRm450hAu/dNc6YGutp+9IUpEqzCCrYrzcZinXk2gfMtFFHwrQj5lkK2gLNafZwpoSNTYhPhLxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968445; c=relaxed/simple;
	bh=Kq75PX3R0lwU8jkUE+730+MzES2MK6LfrzI3HXbTdic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnZQTMBzLdiiQVKqBjvhv9jWOpcYmEintkULhJe3A1gedgWoj0Onb4QHhBD2A4kO4W2ws9AZpVokw2HNDdbXf3OLgzXnWrIfQxWxjuRqou9Qu+C9DKT4I46sQw9CnqgavZ621E05Uz19VXmHWp9XmygL6e3uQ7QUrHBbC53nm50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cXmzgQLN; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df7c1a7d745so513539276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 00:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968443; x=1717573243; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qi3rq/lKfkTKHCFllxIMfEiNIgwb77QXH8sn4XLhppg=;
        b=cXmzgQLN+TZjCNGfO3XylDs6ogpLcAFtR0AzNJ802+aOO5gSNJRNPDxrYnHgt0AVUN
         k+tLVxMhNpZft7XEjGw8X4hB1D/sf7D+C+eOvNp6il5ABnO6VMZkPH7hQ1yz+qGz76o8
         ajjLmm+SxjJRXcI0Y4tnylhTAB8xaE0Ia6JMf5UxA7Mj/NG74d0QlcUQxRVaOSMZ63Qy
         6s4FyVAAYhoE/2JcR9oJoi9yvLbVXTwf9gByKNcUeMXOiEZ9E5jj6oKqTsK9fvfGmRQT
         HW6trY4WKkFWG9zVhALnOCMH9nYl1AU1zxwX4bX6G/1CuoM788bQ0s9W4FHSfzze4emn
         pIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968443; x=1717573243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi3rq/lKfkTKHCFllxIMfEiNIgwb77QXH8sn4XLhppg=;
        b=azJ9bOe6j+yogrccwYSB2OcN/oky0OrPsaPa6AbwjiscSyj8tswTtrC2eDJtlw882t
         nBf4ggbNUzFd/H3BmUbF3voMUOqxqKyOVWaLdQZpz/PpnkPrUBgKKEBjAqnED/vkrOOi
         YU6RHa2vblpL3doz1Tsm3bfzH1WE6HycG/y3GdU4qPPlOCSIqqEwOw0hUa0q/S8/q6Z7
         INfRs/jtYniH9hX7OwdG68/cfUBoPTtou51wlh1N7SDE3uhcbrwEnX7mjrgDRLzxf1kv
         y+ZG4AWg5UCI/ibttDpFiisznjgrnoEQo9XtPc4RyGU/QpesrmjPvbj5Dh65C2+HuFtL
         3U4g==
X-Forwarded-Encrypted: i=1; AJvYcCW/Rka+vYAyl/TsqahSpQ17FQG16sUfSckN2FqZwN249mnYHCzZv2h40lpoS7/vlqsoOBZ/EhFb4N8QYKt3OmAbubdKulTMwaB+whYZKg==
X-Gm-Message-State: AOJu0Yyx4UNQ7xIcQmVnhkTdWnChQ9ruoTewCLv7cnzoukgZ1eINo+wb
	++44l9gupa4unqL2n5xWMCIrqmN1K414a0JPbIPQNvwi8Y4igR9O97Y4NQK26wItKB2gdpp3dwD
	wXlcvoNQhiZWG7vNrK1jfoK/alz97MAq+lSdCmw==
X-Google-Smtp-Source: AGHT+IFvNvlDRb0RRyGJLPid0eBANNAt5GYyAHLtB+VTyIBGbkRANVmJBbGXYfdU28+FTfNGN7gmsi891v5NwqN4/Ys=
X-Received: by 2002:a25:4bc2:0:b0:de6:162f:c71c with SMTP id
 3f1490d57ef6-dfa4649391emr876301276.18.1716968442860; Wed, 29 May 2024
 00:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
 <20240528-qcom-gdscs-v1-5-03cf1b102a4f@linaro.org> <a893eb89-1956-4ba2-84cc-e9b64b87524a@kernel.org>
In-Reply-To: <a893eb89-1956-4ba2-84cc-e9b64b87524a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 10:40:31 +0300
Message-ID: <CAA8EJprwQ0N_PfPjTHFppZ2SdQVCXxPrZmVZ0B8+gybm_75toA@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: clock: qcom,gcc-nopd.yaml: force node name
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Robert Marko <robimarko@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 May 2024 at 10:39, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/05/2024 22:43, Dmitry Baryshkov wrote:
> > Force GCC device nodes to have the name 'clock-controller'. Several
> > platforms used 'gcc' here.
>
> Well, only ones coming from Qualcomm being downstream-based:
>
> Author: Varadarajan Narayanan <quic_varada@quicinc.com>
> Date:   Thu Jun 29 11:48:33 2017 +0530
>
> Author: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Date:   Sun Jan 19 18:43:20 2020 +0530
>
> (and there was also older with node name qcom,gcc, so clearly copy-paste
> from downstream sources)
>
> yet still we do not enforce names in individual schemas. You add it now
> and next month turns out there is a power-reset-clock-controller which
> could use gcc.yaml, but cannot because of node name enforcement.

Ok, please ignore this patch, I'll drop it from the next iteration

-- 
With best wishes
Dmitry

