Return-Path: <linux-arm-msm+bounces-21124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190498D4E60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 415281C210AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703F517C9E4;
	Thu, 30 May 2024 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEiRWGzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310F143C40;
	Thu, 30 May 2024 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717080592; cv=none; b=QD6CePrAiv0o5mF28TlZCUIrj02llQsfCe2HavoRriRctk0f61sruAbXI0CPAHpBSj6kxTjL1SktJgNU2/KmNuC4uT5lbd+W9Z3qyL/oaZOHmWMoYBvDFLzSe3G9GGaLm+iocC7KGZA1tXBdmwzEjNAkcCsAZTNDZVpBlc7YOEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717080592; c=relaxed/simple;
	bh=hi5q5eR3luXu0JMBSCQpSKn2pC1+yDtt03BNLMulJM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocHkHR0ER51wpOVJ/eC7I2XHcankHZBSeh0ATND9eKpnbGxyKTPDxFIUHvTUCrJ+v/RlD0pEMlcQRM0fI79fkANbINEVrXvXixTrtm1R4gbPggQGKyLAmF9DBzcePpLUX3bKgficagpGiNjFY6+8HLey2wPyOvckcMTtWplRkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEiRWGzA; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a673a60f544so23441766b.3;
        Thu, 30 May 2024 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717080589; x=1717685389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFZxm9XZ09eTU3EN3teoJoprrvy9B6+gk/P+tYdPxNs=;
        b=NEiRWGzAst3mqbe5+4waZhP4XK1YKIYyE83FbMHAE9sSzNM30yPyBpzTvO7x7/gp/P
         PEiAGcYm+fynaxRuEOkiSnMcarVpSqrpuwG2Z39RPa4qARsAR1lnXAFZR+qYDQdzTNYh
         yYQQ6RXV4XfPnjdCH8pT1cDDpEPZc6DtsN+kqPFkhhEu1D6TwooFI9JZuJyXju6T69N1
         ebODmnF3WuyTFI487t7wzu0pD7nL6Mw0ejwABUNm5VzJysHzOMVwyA8qGZlhBftRT81c
         GGcHaWpNNG8sVKr1WA/IFtgP13sd9NoIzbZD6SBmV8E9gARCDVSZXnIKx+koMLz5YmSf
         cxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717080589; x=1717685389;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFZxm9XZ09eTU3EN3teoJoprrvy9B6+gk/P+tYdPxNs=;
        b=VY3ZzYTVdUXV/AeUtn5rhAP6vKvieJMi1I/VfOv786W0sjg27MEabnY8HppRe3aT/V
         QOyE/2exLH/38hxUenIR/+SH0GhNrTHlBKm0WTUFnSkwAP42iovykLqp/S9Uj9+/Np53
         lsQ1FnPpMTbh9mjM1I+S8v0hrFxRmyTGVZuYkI5OdL9CVcCMmE9DXPqnxCrlL0i8a9MQ
         i5ymlFk68u6SIaAuJXLH0woE1ru4AH/tZUwJO8xpLQgfORMru06FNJZbbEUMp4e1sHOu
         jlW3SmRrz71IVEoVI1U+tnr1wKRI4jROvab7PsBhEjUxpRB3tQTpPvyq+Eh4gkoE1Jjr
         KDsA==
X-Forwarded-Encrypted: i=1; AJvYcCWsLHPNo2pX/UURUnXa9DTmZq8ynvFs9yBwZcFTMaPM2gpc66ihp1lg9dKvgokt/lix7yHvSCJzxSRoMoaP1cJCYRifGARcXLc4l/A8m+GhDjJgOW73Q/hWsv6CAeCtKUVoFYFATNXtkl+C1C7vbGoCtj9Wir1lrpoSQzurdeDJP6gIF0bsxCM=
X-Gm-Message-State: AOJu0YwPDN8C9tK02XogT2zZ+v53fT1bSYKxrw7XSJmz6RNhvGHzkyiW
	0MWg4j4RHOCL7PdFqG4ul9A6T+h/kO9UbujxQSRSq6lvMlQ/G3cu
X-Google-Smtp-Source: AGHT+IEjTFZLB1C4nSOWFYxlPMd96XW7noVUv2mE3O+pRtIwQ0MefglECcJHcYxto5VQTRAUD9SZvA==
X-Received: by 2002:a17:906:845:b0:a59:ba2b:590e with SMTP id a640c23a62f3a-a65e9100ea0mr147055766b.48.1717080588763;
        Thu, 30 May 2024 07:49:48 -0700 (PDT)
Received: from pevik ([37.48.49.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a637f1349efsm210047866b.210.2024.05.30.07.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:49:48 -0700 (PDT)
Date: Thu, 30 May 2024 16:49:45 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Alexander Reimelt <alexander.reimelt@posteo.de>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add LG G4 (h815)
Message-ID: <20240530144945.GA513050@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20240403104415.30636-1-alexander.reimelt@posteo.de>
 <20240530135922.23326-1-alexander.reimelt@posteo.de>
 <20240530135922.23326-2-alexander.reimelt@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530135922.23326-2-alexander.reimelt@posteo.de>

Hi all,

> International variant of the LG G4 from 2015.

> Signed-off-by: Alexander Reimelt <alexander.reimelt@posteo.de>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 66beaac60e1d..76aefd4aac67 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -237,6 +237,7 @@ properties:
>        - items:
>            - enum:
>                - lg,bullhead
> +              - lg,h815
>                - microsoft,talkman
>                - xiaomi,libra
>            - const: qcom,msm8992

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

