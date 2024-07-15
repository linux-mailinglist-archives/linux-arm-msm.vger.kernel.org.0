Return-Path: <linux-arm-msm+bounces-26182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5549315F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D03528301A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937A918E745;
	Mon, 15 Jul 2024 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ViF5AEij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F1518D4CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721050961; cv=none; b=tp43npPOvH3vVGLs/UrtZJqX+VlYO1bg7PpZchbsieMQUGu7wdnSkqctq23g6JiUP7IuHfQ4NzemeDtLMIQJbq2NFUBBJTQfNj4E6HzusI7+gG9nUCs17STbgshVKCI1BspJnT7UEbCxHFfqqA+ws5rPkiVwYBJKml6a8/d+2NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721050961; c=relaxed/simple;
	bh=HzMPkWVhLvPMul5I88EaLUU/F4JRic0tMeYJg3OIcjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwqevo8qbtRx2ov9xoSGipxBelHKfLgFzMjL5kvcZMFKT5M5cY3VTknQgUbx/m7i9b+ZL1cvXXJI59EwLLF5mubxXEZP8bKco9r4GFSgi8PFzXFUt+vMSDUqwa/n1AzC892zXn8E9ssjQUPNBdJW2Uz05OPG83pahr7r+OIEl+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ViF5AEij; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d9306100b5so2862437b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721050956; x=1721655756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiHzmxhXegf8gKt2fPo1cHqasKjx8M8WTgWEINZ3dns=;
        b=ViF5AEijNNjO3OSZJtSd8ZVMS/AJ3+jv5BtwthuwUe/EEqsji6I9FpsJNSNUPGH+QW
         cd7D0vSKp/oXzmdD2JmuODjLrjHHlRsItDq0AABx3ncP5/S2J1rKHB6J6jSzFX8kDD7p
         714eRpO1f5Px+C+kX0fK1DC5oGG8TuG68vduY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721050956; x=1721655756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiHzmxhXegf8gKt2fPo1cHqasKjx8M8WTgWEINZ3dns=;
        b=whbsjJnL+UqFK3iNe/fv6VbZeUG1nX+0bhxIHUZPib4VyzaWqnOJFxHwZy34qOjdKu
         VYLvmN6ZurtfZ/pZvlsI97vm2lelJUaIHENp4PQnhtxGcKgJ0GhFQHLGM5oVRfAwtcLu
         Erlm5EoiW9qQi6sUTternvB7h1EEc3PKRMLhvhiPweEU7sfs1D8LROnR7YDBgt1GVOSc
         RQcX67h7ee/X6v9MotcDHMAnkZSkSXN3M4LT77Q9MA6s8bDLETXnNO55wpAOsrXx2Fuy
         4/zreXzOcYX1cLjMfcJd6HNjb2NH7fysRlbgUojGBCKX3QR2QUbhmF/DtBlYwgA4gA1R
         HVHA==
X-Forwarded-Encrypted: i=1; AJvYcCXZBhtV5bIc3YJjMafyeijOT+sXK9QJw2eZdAWsorChD7krAm/HBZ/YPmNt5rS+bx39h7zd/8CRPLKKqqCt7J8bz3v+v/WKOQ6TusvZgQ==
X-Gm-Message-State: AOJu0YzPXjf4KpMuFpNowmvkJoFZRj5GlZzbBeKj5Y9oL/ykcnO0ggK3
	J/FbSCmIjWT/AgXXDzp8l64oheYz6WSidssHYbaiM+dQ+725irLSjod8O1dOkAoN5uhb6ar4r6g
	=
X-Google-Smtp-Source: AGHT+IGgRkEZgBRj/IjWRtUu6tETzPKQUD38P7ibhiE7GrAzqe2GgqgKc/gPZXg9OOQjGT3yw+wnAA==
X-Received: by 2002:a05:6808:1b28:b0:3d9:244b:b9d3 with SMTP id 5614622812f47-3d93c00e31cmr24871632b6e.23.1721050956622;
        Mon, 15 Jul 2024 06:42:36 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160b908d5sm200907385a.5.2024.07.15.06.42.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 06:42:36 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-447f8aa87bfso580271cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:42:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8RZAv9XUIUrc1RtHIzPkISBUSBK+xR/RpXtiqIF3u7KKUs9pGfoVKJABDfl1v/wCA13pFmlmkEIjKyRcHmgJQSKb/Zj03Z0959biDwQ==
X-Received: by 2002:a05:622a:5a11:b0:447:daca:4b25 with SMTP id
 d75a77b69052e-44f5a2f9b4emr5548211cf.28.1721050954554; Mon, 15 Jul 2024
 06:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org> <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 06:42:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VG3zNVKp75r2zsKzmjC0WfZqY1xrffSQ+jcuAJm7FaQw@mail.gmail.com>
Message-ID: <CAD=FV=VG3zNVKp75r2zsKzmjC0WfZqY1xrffSQ+jcuAJm7FaQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Reviewed-by: Douglas Anderson <dianders@chromium.org>


On Mon, Jul 15, 2024 at 5:16=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> control over the DP AUX channel. While it works almost correctly with the
> generic "edp-panel" compatible, the backlight needs special handling to
> work correctly. It is similar to the existing ATNA33XC20 panel, just with
> a larger resolution and size.
>
> Add a new "samsung,atna45af01" compatible to describe this panel in the D=
T.
> Use the existing "samsung,atna33xc20" as fallback compatible since existi=
ng
> drivers should work as-is, given that resolution and size are discoverabl=
e
> through the eDP link.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml     | 8 ++=
+++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna=
33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> index 765ca155c83a..5192c93fbd67 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> @@ -14,7 +14,13 @@ allOf:
>
>  properties:
>    compatible:
> -    const: samsung,atna33xc20
> +    oneOf:
> +      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> +      - const: samsung,atna33xc20
> +      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> +      - items:
> +          - const: samsung,atna45af01
> +          - const: samsung,atna33xc20
>
>    enable-gpios: true
>    port: true
>
> --
> 2.44.1
>

