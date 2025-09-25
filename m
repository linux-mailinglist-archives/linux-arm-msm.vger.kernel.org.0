Return-Path: <linux-arm-msm+bounces-74858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CDB9D0E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF0B14282DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3832DD5F6;
	Thu, 25 Sep 2025 01:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqR8No3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B22E146585
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758764922; cv=none; b=IVmbO7Dh8v5zkSi8axWz6Rt2TVnykdpCXhsRfeWVT51/oxT2WyXx9fXM1Gs/g8uATn9Xgf17SZkvPClB3JNT9VMQ/mjsvdNhjHcBuw7iy0dApwLK1k9V2g9YLvf4LUxqDKEuzMxPL1IaaCmeGJup2yrqYIu4fElebTp65kABGlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758764922; c=relaxed/simple;
	bh=uEUbW/mjkf27/zieH5Tmr65ZhNxzaLqkETnngeAI3wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDmKap/uBs9MUIF/vueAc3oL7GT3BREp7GcCiKw9PuNlVNFETW77J1qIRbjdCszBt4nxQW3itFRnBLpfRCod25zCQZ6nI8tS8jWUAKBEFHjQMQk7z0MxTj+8rAyScpBMyeEVqrOyhAXFIxeh274BNPZKVzleZWkRijpLg9ekfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqR8No3T; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso420841a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758764921; x=1759369721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=92Nb9Hz7Lb8YkzmP9hK2qw/+fYd5FK/gCyFQmOrz6p0=;
        b=LqR8No3TbjOyjqzBRWXFMTNL6/f39NfAiF3W51CcNYJr/5uh3JZ8nUBXl2QWBwnf/V
         J4OoAe8v7AKU+ZkY/8WgytGfH0TQBxwCZ8fqSX7ZrzEml3NLrge4hPn0GCY03x21I5ZW
         RMvzV6aIKRqi4diJsYjrW8o8iMDn1vwRZx9q88mSsqOIBo6xJvnDsgaXaaBmafw9cgG5
         TDu+jHzhIyd98OWJWZqLkiaWzYbbcdrhBOu7E7QOuLBwscvLFJtGwRn+CDcIdC/VVTJG
         ccXoXiJ4JVXFSkU1NkiMVqIsN92tai/W+kPFiqrjiL80NL/yq8nJt9WHYRP8f+lf0V0I
         7xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758764921; x=1759369721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92Nb9Hz7Lb8YkzmP9hK2qw/+fYd5FK/gCyFQmOrz6p0=;
        b=jrvWR/uexui2PjTYRj7xi/9XrVYQA5p8op4ifsrlH5ymhfNwzujbNzKw3EJTQm0s25
         O+D27pElNNd5R9DqncI9v9WigxXb/OZzo/YhjxFMlTV7h/Za+8fumRhSHURHwvs8StF3
         tR+9sEYA/+uKCeg2dbukQgRxv36ia+NL4zh65ghSsUf2x32Cy2pBd2DlnqWekowoSmaH
         xvFC1Z+19pwAlBPNqsTAA+nInOYOPndbjeehNZJj6IwlQi3SL1S0gNGYJWa32TgEOEiM
         7/qVUUICz0i9ONfjDnOxZXIUexv8y3HyaDSwZh3psJxyqlFZsFFWc0wk5iF7YkG9u6CI
         ntqA==
X-Forwarded-Encrypted: i=1; AJvYcCUG2M2P9P8mq2C3wiLiM/+IfahU5eWMNJpwa1aklk++PN6beNxDW0fQhu6iRgHjouAPaRP+hPuaZZ6ybIZV@vger.kernel.org
X-Gm-Message-State: AOJu0YyEFL0fmZLwbxkYvi0vvJFJj8NLKJjTypRUUIsiPjqmmPC+SPn4
	Tp5RgByw73B0lUwgN0CSeyh0aKKc9EHT4YC8hrVF5K8l/V2LfpvrApMrKKiT2P8vqS9W34XG7fM
	HkfnPWO/Ur97ttdF4J6v6OFlxMw6kXo4nOie9
X-Gm-Gg: ASbGncs2x+bgvmmysYB6lre0NgCGr4/2zJVg59WbBcv0D7v1bQJhEIfgiXB21uR7eqi
	jNfhk8oFtgaBKgFMMp+avm6zrx3VDAOBNG7OOu8P/1CFbNS1LjixpmgRvJPfwF/2mJmdHULLKht
	JzxJvuKqqrA1tThhW3V5P0QfOzj3PFpnFbHDn37tEGDgB1D/IXrYLmuSxSQRg5FOTYM5ZGk+mnK
	26KU3G3S6ZAjXOWtgDjBnDuQL86LxXsRUA/
X-Google-Smtp-Source: AGHT+IHlr77UrCorEUgxFRe4ac3Y2vFO6kT+vJ+nz73+ggbDyv6X1qfmeKHKY7Txps+jnwxbGEp0cfwSFTBAAzeUavY=
X-Received: by 2002:a17:902:c943:b0:269:9a7a:9a43 with SMTP id
 d9443c01a7336-27ed49dfb05mr20608725ad.10.1758764920643; Wed, 24 Sep 2025
 18:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com> <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Date: Thu, 25 Sep 2025 10:48:28 +0900
X-Gm-Features: AS18NWACOefzDF4H_XC4HoeQYmeAv41arytX6EqlbAzLDXMVdDJrGEZAY9f_SCE
Message-ID: <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>
> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
> interrupt.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index be9e2a0bc060..031fdf36a66c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -35,6 +35,9 @@ properties:
>        - items:
>            - const: qcom,sm8750-cdsp-pas
>            - const: qcom,sm8650-cdsp-pas
> +      - items:
> +          - const: qcom,kaanapali-cdsp-pas
> +          - const: qcom,sm8550-cdsp-pas


This time maybe without HTML:

This looks wrong. This is not compatible with SM8550.

