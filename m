Return-Path: <linux-arm-msm+bounces-33610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0419958EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 23:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5531C21522
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 21:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967CB215F48;
	Tue,  8 Oct 2024 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ukTCt9R9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28361FA257
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728421710; cv=none; b=kpcT+8rVltjglGJcLpISSA0K9Ds/uL/aehedtzn49BXZCzPZm27gpdjryeVudDqN1/hfn0YJjfrR1h2DmJ1By/LiklivL7frB1TBf+i5HmS6gMpPHjDHLu5n5YZ3/UVGiitBFsGt+XcRhYiW2x2TgOd1r9Mw/SvyKegopu5UggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728421710; c=relaxed/simple;
	bh=MnazW0czy6QsKx0VD61wzExgH7uM2nZ2mt2atrzIfnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ozh9G42q68UDpFiS/Kze8wJdLGLZENJx7yy3GeybSg+N83xLq2IEtDDsHJ+TLusMcOHXu/6eKsOkcBJ9saj6Wv41iZbrrS8wlL/+Ue79zyzhisNQzlRB1swJt8nnqVyxtu5A1LBGa/f1AwlKsrfFQOZ/LfPZdifmw1uQ0Nu9hEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ukTCt9R9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso1002822866b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 14:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728421707; x=1729026507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sE83pFCV26DOjSccPxtuo+ZxnLJQRJXe4yNALdDcOkk=;
        b=ukTCt9R9BmfAv6zYQ+X4t29fue6HkNXpD14QAEBKt8xBlygAI/qoEnqnS2c16qI6q5
         sla7vbh1xWNam4wLCAwjcbeFqllAyLqm9ZUmrpE7pGHsU/VH1Qbrj2249LJ1NJOSKZEF
         eWZsbYtNM1GDtjakn+oFzOZSCoyCubTYaKyan9VSoTO4MwAEBNzvSDEnWKQ7b+xVA0mv
         W2TE1lxwWHHmmhERSX1p8oWQz4Yp1MubU3xYAJhQr1QPHW/9BSrwmV4ZlPbhF5pIsrG0
         M+WjLILEL99ogBApLKP25vM/buGAq5yzUFNm4loHpKqQpCDHr5jNaIyFLx/IR+3AkXDu
         WJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728421707; x=1729026507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sE83pFCV26DOjSccPxtuo+ZxnLJQRJXe4yNALdDcOkk=;
        b=ZGrm9X2JYUnmGfl1UUgYH7HmPpoBXe8QnO6YuLkw8ms38yE3E84fv879y0Ra7+aOOc
         Kaj5KCsgmU5L3LxvB6Z3u0GTr/W0zAKnB9MqntdTgTposAPYrrQpJff3GaSoKQVRV5cA
         IyXgdrjC1dj3rRu+JaBJrvRKdPgIASvZ7/osN9iGax/eg16R+yVaGsyEpuX7mSkXll0u
         hEYEWnyc5cnJTpcgSxw+oRGFeMLciWNLxjTdAeNIEJEfaf4QuqG1RZfvQL+xQKNHB3dO
         SiAYcb6iGAGsszwlHdPB8wozM+lGPc8PRTw0q9xg8nzK3JQ9OTfChFSKFgLBW+Eb4P/4
         Hj/A==
X-Forwarded-Encrypted: i=1; AJvYcCUR1TJe0uod46EvxeDDijRW6jpxcxSfjGOaGt4aFebuGvvgsGEpTaUETg7LwUslirGEC2CQus1PaLCyI4dv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+w5sL1Rs378xXOanlj20gzV+iiDGPP/PVEp63D2Ns/cF5QUwb
	3beeGyDgCI1k5XNAKRrDCCl9bn+m0ktnkojqQETtAnihfCrP08nuxom9mDPb6xm6IbyUKlY7S6j
	hrAgKlswaJGx4PSx+qxA0dv3OSUm8ReUhw5uDTw==
X-Google-Smtp-Source: AGHT+IHqVitJqVh91Dw21ceGsoCsmpbMpD1zYOyB0xs++neKXZuOILxOMEPnjGNDkBYWXx0j6dth0ALd1nftkjQkH94=
X-Received: by 2002:a17:907:c05:b0:a99:7bc0:bca9 with SMTP id
 a640c23a62f3a-a998d11f6bemr8789666b.3.1728421707232; Tue, 08 Oct 2024
 14:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003211139.9296-1-alex.vinarskis@gmail.com> <20241003211139.9296-3-alex.vinarskis@gmail.com>
In-Reply-To: <20241003211139.9296-3-alex.vinarskis@gmail.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 8 Oct 2024 23:08:16 +0200
Message-ID: <CAEvtbusLQHqa-3RKogD9CquXTyZz6UZgWjf02SnMBW4F=8cZnw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, robdclark@gmail.com, 
	peterdekraker@umito.nl, Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello Aleksandrs,

[Again in plain text]

On Thu, 3 Oct 2024 at 23:12, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Allow particular machine accessing eg. efivars.
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..2495c08a52f5 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1731,6 +1731,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
>   + any potential issues with this, only allow validated machines for now.
>   */
>  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
> +       { .compatible = "dell,xps13-9345" },
>         { .compatible = "lenovo,flex-5g" },
>         { .compatible = "lenovo,thinkpad-t14s" },
>         { .compatible = "lenovo,thinkpad-x13s", },
> --
> 2.43.0

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>

regards
Stefan Schmidt

