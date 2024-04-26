Return-Path: <linux-arm-msm+bounces-18698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA3B8B3F8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45422825CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5339E747F;
	Fri, 26 Apr 2024 18:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="flOn+zDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4C57462
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 18:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714157080; cv=none; b=FK90aP6JUXeaekKVvON1bFthk7xbdbxsiADjEsXzvYCL7VLDHGuPDZrZCoHiwCHB4gtdNdE6RYkwvkc9zsn0yFV2ijb8zPWT9g5B1NOc9+yC0KmVrMaGHugy4PO2hzlSKtwym0wXUk4AVTrFau7P7USkF70rlljHCFIjUd6iygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714157080; c=relaxed/simple;
	bh=9NzQ4w51FWAejlYMZI3/n/bzbmmxcxg5XKFhWgvUvVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqE+XAoJjIeQEEtH7Tp61xz9/Q6miw41LiwyslvNL/9/OzJGV4OHI/R7epkY/9ObrLZ4tMvGMDxhY2+y6sI195UDnqElyS+sv5ii8KlhAT8oX21Iw285vpMbl4aO14MdIES4ricL2r5YfWaAxee0twGJmKiM23Lk77Q1NEeWZmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=flOn+zDy; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-de45dba15feso2951288276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 11:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714157078; x=1714761878; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rPiNWGdfnN8JZJd8dsw7Vc72DKCvCwvtvuendszQLjc=;
        b=flOn+zDyhfpqGBhkF3mK/00M+mSB8qKf6LlbWl5B1OvXnMuHVWgTERdANnJiUaSTXu
         ZnDR5H1D9oUeEsL3mX2bKbc0Q3P0oXfj3pTPQ9uyU02XaAT5zujZ5ThvPaN5VnYdsW5/
         DaF/NT1jUDl+YLwJaUvS5GAV3IsObjDO3cP/I0MUcN7pC3Cax5NV9cgOtFmymoAF+fBx
         P3hEI1bHbXk6l1hQQ9P0+rv38S60jgiQ1oUmqcz1nbZqiuKEUT2722kF3JMufGAOKJH/
         vPBWqjuKDm98D35JpEOlgA6yq7seGxiEjLbf1yR+PlfOciCKh2z40nIY3n/H/2jZc2FR
         eheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714157078; x=1714761878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPiNWGdfnN8JZJd8dsw7Vc72DKCvCwvtvuendszQLjc=;
        b=wtatRKsRchF7J/CFnPwSUMZcAAN/eyUWyra9m8Yp4g4a7OS62rMISDrYsBagXxmlkJ
         kJzO2bi4Mw+IGkO/0cDAd+ZLjAUVJ6XrV5jY9XxED/Yr3SuJ/ontX6ohRlJsTBfeQwuh
         1zjECy0mmVhdS4LGZcrNSu1apcwmkAS9ogXO8UMWPIiBbyBsGlexy9ErkaB+tNKghTXJ
         SKMLJNc5QrSgwN4/bMBe2RNxvITEraWHlzdxT5oiTmksgzfM7pivZY0eRT8IHFYQEeou
         Ypv3C5XCW/Kpuq2RHb9lZIsvyXQxdXTj2lTQseMpt4PgogO0i1PBAKLOxZl+nAcY2cmm
         ZZSg==
X-Forwarded-Encrypted: i=1; AJvYcCVlm7pjomtiaWCbK77OhVN1HHvQkwR2G93UdfULSf/UpOlld6GIK9wAbgYPq08xMgGE6U69M8x68M5sMdcOxqUxhL2Ib4oa4XtI8+f8aw==
X-Gm-Message-State: AOJu0YwIJGEhW080gphDYio/ivQgQAFXxTTXvJGfXaNLjX8rW4iGfkEL
	h8iowXTQrGW/z/czxmJwE6pqPPCYls+zZK5jIiSw+NITkbgVTpBw72NU1TWRZLbHRkx56ahV6MY
	IVXZyVc5aPvXNT0Qmbpw3xUjV33JwQaadrEpdyQ==
X-Google-Smtp-Source: AGHT+IEBZPSkhTeyZCn1Cq2ot4W4tqIxgRzfLLkcqrRXEqEgcPk4vxhJsI6qrlPc7WoB0zQEQsEX8xqSosNMUxnn03U=
X-Received: by 2002:a05:6902:2010:b0:de5:5a39:2cad with SMTP id
 dh16-20020a056902201000b00de55a392cadmr4344715ybb.27.1714157077930; Fri, 26
 Apr 2024 11:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com> <20240426-a750-raytracing-v2-5-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-5-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:44:27 +0300
Message-ID: <CAA8EJpq32gt1UJ078-O9K1LdH+8gmZGh-FaQDjmm2M-RO82TfQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> Expose the value of the software fuse to userspace.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
>  include/uapi/drm/msm_drm.h              | 1 +
>  2 files changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

