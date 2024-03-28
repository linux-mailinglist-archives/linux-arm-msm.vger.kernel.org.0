Return-Path: <linux-arm-msm+bounces-15576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ACE89029F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 16:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B469329354D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 15:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B9E7E772;
	Thu, 28 Mar 2024 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9xdVWOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F697EF1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711638357; cv=none; b=CaD92f3ty4FzEMnp8xI4wFCQGP7s0TNXOp/TYRvPJ80lg5NcLtjlnWhYu+FmB3jjMxzcPQjTdeCTsxddP3tE2UaArhsIp05M5kjtYLf7teA9kmqhWGUDSE4mp7PKWQ3ibL+g4w4MMF+GCkdcuzjI3LqIE2mvU6VI/iDFXkS+DLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711638357; c=relaxed/simple;
	bh=bY9wwCZdZb9djXaXbgUnbFKIvZFt0zLp4CySi2ZGwno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqdytDic7+U65fap4X/BJLxoyZ6NtsayR3uRAmYVgX51GI8Cc/AaFYi3tpLVzTyL7oEcD1E/VXHbEYWrfCMEarRg7faWauOyodVBQRrtrWLBjXluGx5OS2E0pSsJS2mxnCaa2POUs0siB4brtGqkBtarWi9x2hops5pNiUomOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9xdVWOo; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso1048972276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711638355; x=1712243155; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r7bGdWeyTZE+v/hiYTWzmpOp2yG8N9TrrPpWA0TuJjs=;
        b=S9xdVWOo4Vdw8IQVnglj9OSUHlnfe+zuDSgz2PmUvtDr/YdAo8kLpO/pPOP9mtkzXW
         GVCycX8DeVXlTJKIJbmpnaCtInIbSF5v1S7yJRvMnnncMGwdiZx25r4f5WFD8k866BZf
         C8JBkehaWtzvtTdZU9ByIOAAZ8YrIeVWquqLqlR53l7OA3v80K5fvgO66y8Kn0qhiHYR
         5N/bGNBSxr8lX8VXhDi/ffnuQnfjzn2bpZbA/WtIZKn8sw8FzGIQlZyFeAZ7M45U/IbZ
         bpaljDB7/VqWGiSiCLgSVxe+m01qQ2E98aYmgr1tJ8c1c4ETsPNXzFeMv/O33g8L7HL0
         IKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638355; x=1712243155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7bGdWeyTZE+v/hiYTWzmpOp2yG8N9TrrPpWA0TuJjs=;
        b=QZcd/lZX825brlK5PC2+WgyZsTYoHuXeEjZQakjosS3DceNvx5yYxcB5bVVF18lRkz
         +h0fVgqA8qJP5F8FY8p6qH0VQLhkOwHaWcAx1++3HzNz4rbibkJc5+z3mpFrJVRau/wz
         GigX3grElCgIz6BXRExa9xmKTU2en+81no8JGpDHbfXd1/iX9lip2YTV5CGDr6/+RwvP
         JOws8LKBgpzl/IG4lNv8cX4o5duICluCm7npzWAr89HWntkeYj4j7kEU9LUJCTPBRrQw
         LVoxqjLV9SGfXAW3/q0h4sOa+MUxuXAEaIYkFbVwUB9hiT7381CB2iTi+5bYuTBfnxT2
         T9lA==
X-Forwarded-Encrypted: i=1; AJvYcCVOTcqMQIBtD1mS1yTQraDOU/fwvlKbgCbuETTJf0w+Btk2qVYPjyVgmwqDTDB6rBWowKSwYUsaLu6LANmD1/1ftg53OmXP+6KHBQ7S5g==
X-Gm-Message-State: AOJu0YyZgDs6E2uGRnCvH5gW6AOnk9eOG9WWq1qx/GsqPuKkxlxDHQAx
	yzL9+GSUxdzEir4AAgJWkq3l3qOlUPWdpyyqmNCZ5Qdqu3GviR9dS8ZxEGrEkqKKVQmOVs/oAls
	ILA3BBT0QfL2hSnGCru0dJJLq2I++s3GURNTZ8g==
X-Google-Smtp-Source: AGHT+IH9C5vQfo3ufXXbIVDu00aw0luf0LefmXXZ7b6/7UeeM/iumG2KxhxjceuYvQ2XVMBExs8k315o2JGSuTOkAN8=
X-Received: by 2002:a25:8e0e:0:b0:dc6:54c5:285c with SMTP id
 p14-20020a258e0e000000b00dc654c5285cmr2609083ybl.0.1711638355232; Thu, 28 Mar
 2024 08:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org> <20240328111158.2074351-2-jun.nie@linaro.org>
In-Reply-To: <20240328111158.2074351-2-jun.nie@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:05:44 +0200
Message-ID: <CAA8EJpqHyg0vnKR3Ty0z-uwsPD_Bdgnn1YsTs6Lkbn4j0Q0QAA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: visionox,vtdr6130: Add
 mode property
To: Jun Nie <jun.nie@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
	daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add DSI mode property and compression mode property
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/visionox,vtdr6130.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> index d5a8295106c1..36ae94fa96ec 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> @@ -26,6 +26,14 @@ properties:
>    port: true
>    reset-gpios: true
>
> +  enforce-cmd-mode:
> +    type: boolean
> +    description: Set DSI as command mode. Video mode by default.
> +
> +  enable-dsc:
> +    type: boolean
> +    description: Enable display stream compression
> +

Bindings describe the hardware, so this is a no-go.

>  additionalProperties: false
>
>  required:
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

