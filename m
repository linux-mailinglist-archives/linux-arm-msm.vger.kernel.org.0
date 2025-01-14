Return-Path: <linux-arm-msm+bounces-44984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F1A10388
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0594D7A0F73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C915B1ADC85;
	Tue, 14 Jan 2025 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/lgBs5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E7A1ADC7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848855; cv=none; b=Kn/CIacik/Ohjs9tLG7LdQjJTZylE+BjcXFVWw2QisNCFLt/ewZTzOhD0Q1T+47Z4QHXgKRzcXojPjdK9VnBe6GrRJxFFt0cFf6RwgHZ1SVc6PA7wKx7/pX+oydlxew6L7SECQZJUpBO5oXRaSfm46awwcbMiOKNuyAcWzBr3Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848855; c=relaxed/simple;
	bh=5/oBX5wS5AUsq1akJWa2ZkpU8wSF2cM7vmiX/8uBBas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3iaaI01EsgKBGjN8VkWRH9jEmPuVCo+KgFjpMG/TYXpkk5WTxsjxyefZfAcFNIBMcvoUySimbR3+dx1FK+89fyDXiLYmsJSZI5QoIxDfuldFBRpkKXfJXkhjCw1HNS4wJbUzVsLhD5SUlraU4JVCNypRX+j3XNTOyGbljSWBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z/lgBs5r; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so7675897276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 02:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736848853; x=1737453653; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zWOy0FR11Ww9vPXXYRtiZR0MXnoxIhe7Rlp3oaSMe0o=;
        b=Z/lgBs5rIvf/lkBJ7xAtfp62gAtRh1eZbAhYDeYLZBB4XthLnLH5NnwiPu6/a1jpGa
         3pVAQCgaDRVkc4iBQOGVtJy9n0MbrAzz6dmUhymL1Ejb8GAYt9Nq8hpeiBREsnZqunk8
         0Ka8ia8vhDp1NB+d4vM6IMJwIpNf9azL7Kz45olpVuz1sreXv1RLaN5vJIxf6RgKLO5R
         Ssi7YD4N1veSZgOOuDTjw3eJ6pIiJciiGXrpdkUktD7gfnt7JYVmAmTETvM8/hzBdZ0t
         8dPr5+r/ANIkrC8ePGqxObviiPfR3/QFblWjGsFle46FmNO8BY3ANV1WYAeq38cK6zrH
         OFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848853; x=1737453653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWOy0FR11Ww9vPXXYRtiZR0MXnoxIhe7Rlp3oaSMe0o=;
        b=WVLnS/0N0uRYjR0YUUM4R7s5M487bH1Hq6VXhh1K6vAYPYTljEnvkf7ENqQmnrkFaN
         DBziPS3gDqPL/esw62yIMMiGcYfgswWmJlzg/BzGcF+yltuxgNNsMdySYOH7F8Pb3EgZ
         lB2fQAWcu4mCzieW5crGrjNGhE+2R8d8zLyq4sNKicvF+T4vaq6f+BxsgInOrKSSFIX+
         AtCB7KIfO3tfP4x7mqyTQ8IK8MB8J1ssHpxF36/73lNTXIUq3LLQwDWEFqiFEukAsKWc
         hRIumAKpWMRiMWTwAev2awX/U9qMF3Hu4kVKZFgmDKE9XXoEW8GiK89UXEXOwLJEGl5g
         WTlw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Y6p1XMrsKzhOVqNOOFqNiHBsml70kEY8NhomCJXaZYXIjsb/o4S2e7IPORLWFFnVpGuIopx2bxvnJTZw@vger.kernel.org
X-Gm-Message-State: AOJu0YyFiOWAZvDc3BRF63lKGvDA3RfGhcBOdMC4aPO+FQ6Bx5NUTTh4
	CzqdO/RnCNt6iJVCg+KFC6D33Jy1zc2y9vL3m3GRjgaps/AZM/NNd+hxzhxIzn5lp00PhbtnHAm
	A2HvGW4sGxjpk48ZFjwawoKNMVMotAGqkMpvz3GXS07p4hyr195s=
X-Gm-Gg: ASbGncvs99JouEIQ0kC0sEB8iS1RsrMqXx/jryjoOIxPethv19InWwAjb1+1bxEsV7P
	AZAua02Dj7e2Rc+j/k+Od/86dxD0CArEcW2M663B3gNgMyLs2lE7axmZ9Nd32qPqiCEv3sw==
X-Google-Smtp-Source: AGHT+IF4wP/wzyfnOnwOTA26chuSzZpOuq04s/LPV2Ds23nxlvigRRrAhav3w7FnByCkwW8F4IVHPh28usUdiKj24SY=
X-Received: by 2002:a25:1ec4:0:b0:e38:a031:bbd3 with SMTP id
 3f1490d57ef6-e54ee212481mr14127208276.39.1736848853117; Tue, 14 Jan 2025
 02:00:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com> <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
In-Reply-To: <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jan 2025 12:00:42 +0200
X-Gm-Features: AbW1kvbmJDFUCdKe5fDxImchUIrbs_EWdal_GJUHhskaFb5gnzYKEg5u3ybPka8
Message-ID: <CAA8EJppUEB-c5LbWN5dJoRh+6+nNFH3G9h_uwbuTo=B8kp_9oA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 09:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Jan 13, 2025 at 04:03:10PM +0800, Yongxing Mou wrote:
> > +patternProperties:
> > +  "^display-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,qcs8300-dpu
> > +          - const: qcom,sa8775p-dpu
> > +
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,qcs8300-dp
> > +          - const: qcom,sm8650-dp
>
> Parts of qcs8300 display are compatible with sa8775p, other parts with
> sm8650. That's odd or even not correct. Assuming it is actually correct,
> it deserves explanation in commit msg.

It seems to be correct. These are two different IP blocks with
different modifications. QCS8300's DP configuration matches the SM8650
([1]), though the DPU is the same as the one on the SA8775P platform.

[1] https://lore.kernel.org/dri-devel/411626da-7563-48fb-ac7c-94f06e73e4b8@quicinc.com/


-- 
With best wishes
Dmitry

