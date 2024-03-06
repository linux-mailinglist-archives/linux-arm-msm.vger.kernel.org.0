Return-Path: <linux-arm-msm+bounces-13498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B79873942
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 15:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8B82B241B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 14:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CBE1339A5;
	Wed,  6 Mar 2024 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSkA855X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D15DF1D
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735644; cv=none; b=W14hWUr1pbgsuim2JD4KKVfUEQSOfjNsUgJCA93QyaXDAux5ng9BaIW78o1Uut3YaCtWcJBfRTBPqinoex+2b357kXybWi9RZgwLWpEt4/yiZNiJ2kPLCHExUuZAwEkG2Tju+qgIPCpxOavpxmis+xYeQ+5kELK0AAIfIIclZio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735644; c=relaxed/simple;
	bh=8tF4zD/DoI86F4TEW60dAFkd+rSLr7rAvtLQ/qAsILk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yqv6VuV1dWZ+M+Plb6Yur46xiaV0R64CXqOWjvmA4VZ+sI84aQAfu14ulFJQdZ+RFG56+BOhYjZhLV0Xb2+S68l45dXysxSxx0Hv7XMLyHE2VxNn4zJdzsJtk3tRzDP7BfPo3NNvwfmYtELuvATEaK0L2ODKDLc2+tKD//iZ0yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSkA855X; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-607e54b6cf5so7468117b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 06:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709735641; x=1710340441; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5tl54IW/dapOkOzvX7dqtIh+kMyPuZW30xDY6G/Oi0o=;
        b=PSkA855XL4A0GL67pXZ4S/KbAGXYnAg/I7O5FqXn1opXfPhgZD9Cw0WhPe4fIH28QH
         OcovXW42kkwbIVnKiJfTi7HGp8rwKZe1wSLeGjfsmjI51TYkYoMMYURZ8bI89b9xIC/K
         Y+IeHl3LwALxiI+7sUwRxnCUZu9H2tHjsBfEyfDCQAdbnhNI/SWEGEn0Am1eGrUjdN76
         er2VaoMSfL5FrpkPFCGmYYECSqE9wprniwDh2P0Ni+HzIpnLoSdrj44YfAzMz3VcroB0
         29Q25Ats+5+9ZjZ00/+i6X/mdzga4WnLtSJYTvuAhX4/ECUqT1Kot4NE5vX8Zu6xQHCq
         eqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709735641; x=1710340441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tl54IW/dapOkOzvX7dqtIh+kMyPuZW30xDY6G/Oi0o=;
        b=dloFMYR0ZzOLao4fOfR7UMFTJEHAD8L4We6/IAQ6XCaOa89ZQeSoii4h2PdoJ8KZZO
         rdFS92ursxF9txSeZAuJP1FR2uEoEEysHYfqy3jThzC25l31z8f6JVRM1gM4GgRyuCwK
         mXC90IgbhpMz6ugtt/MjCnNamjKD/wMT4yzKGWr+xjVVigE6QqY6CgLj7AODd6sNbLvu
         I8IO/2YVfPGYo/f2ETVfnbkcOlH//pukcncWtspcHwa7j6pAdP7J9jOZWaUl6RYYEdAl
         oDLWfOx/XaEioWR64zAdtf2k6GnknJ8m4fkprQQkJ3eGkt8n19kY7EQegKOaWBXGibCA
         al1A==
X-Forwarded-Encrypted: i=1; AJvYcCUPY4HuikWUahIYY/1kF5N6T3dK58kTQ92DfBPgG/SbGMj5gTq+fKJQQsIZ8OxbygCrnNlARKdjLPWLogin60YZa8uCURTh6H53bGxWXg==
X-Gm-Message-State: AOJu0Yylq+zNBicEjOmlkwCKawnGbKITJi/PdT1tS1OWMP36wYYs843N
	RlLpjgv/vHUssQ77CYpxYTFNyQeRl52VPiKhtV3KiuTKug/hyGvMnmcuavbyuGdLJWhNW9wFI/g
	RRi0nqZXHCgsO6W85+89mMr2BkigKsg4dqaODHw==
X-Google-Smtp-Source: AGHT+IG4i73vV9M5abPrhNjNK5qY0fZKQ4WxRD7jBvhda00ztOvVyjpmvTLYxgEXds3PfBdMC0x8iFWhYyA8g+/tSyI=
X-Received: by 2002:a81:c809:0:b0:609:e710:3a32 with SMTP id
 n9-20020a81c809000000b00609e7103a32mr39066ywi.12.1709735641619; Wed, 06 Mar
 2024 06:34:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306140306.876188-1-amadeus@jmu.edu.cn> <20240306140306.876188-2-amadeus@jmu.edu.cn>
In-Reply-To: <20240306140306.876188-2-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 16:33:50 +0200
Message-ID: <CAA8EJpreeGWfstEKEFiHM_RJCZbYYdo0H=fY0GqPPtZM-7ZUhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 16:04, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Some IPQ6000 SoCs have CPU frequencies up to 1.2GHz,
> so add this frequency.

How is it "some"? You are enabling this opp for all IPQ6000 SoC instances.

>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)



-- 
With best wishes
Dmitry

