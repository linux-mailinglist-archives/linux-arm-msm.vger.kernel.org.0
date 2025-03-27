Return-Path: <linux-arm-msm+bounces-52649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87447A73348
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66C447A686E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0B5215782;
	Thu, 27 Mar 2025 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ETwnPzJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67C215196
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081643; cv=none; b=eMpl+rPR+/7RWMHzkktU0V2BkQpkA/rSHy1HzLnzhmSR0gxpnbKwWBe0tzafYYNct9vTZW19ADkrE1h+jPzIh3Xe2KHn0cca2ttv8t/2NdY/RWPQq9snopKfHdyhcUKqcB/L7Qj2Vl8iEPyUsMxu1b8R0ZdlR9hSWj3oWX52xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081643; c=relaxed/simple;
	bh=VAC3jQYsjcnCVrZPAH4JIcMHqf1bqzRC+I0sVF5JOrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfbTVAtuKsotXsAXETcnT9Lf0aOVdGoK2tOZhu/zRCaLjEsAHfLjtdaDWI9Ft4s8fvQAZNtDhICeQZtyLunfzx1NmcK1X717F3nkoIZyIID1F31PMiec5DoihiR8ZDugnE/4NdESvxdORFqhornK5M7UF2ZxyNbXCldXSvu78hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ETwnPzJe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso9158935e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743081640; x=1743686440; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VAC3jQYsjcnCVrZPAH4JIcMHqf1bqzRC+I0sVF5JOrQ=;
        b=ETwnPzJebUhQSnpmL8nYgyp+8ZngjFOqQN61z7BX5cBWAsA4+a8CevIS4++y95u391
         RSnp4i56dPfb7m0euFbFTJUiYMGuVGs3Lp0OgQkQzIF/z5wvdHbm60x9VMJQ4S33oOVA
         WoSkCKkB68Y203K5dN28Ep8Icz6vKj+5HmenxUuVM68W2Zf4C6ztkw1VL4q3ovItUHqk
         4yYGSKrfwQ4OmK/1qpKYd6iS71/GJaGikvITVv//62zg5Gvl5grACwk6rmXYieGgXSbg
         wg42ROMLWszGM9gK6Wyv06s1m6yQBIGvQ/NWB4kHC0VCVTk053k7wrAzZQxVi96NmXj8
         JofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081640; x=1743686440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAC3jQYsjcnCVrZPAH4JIcMHqf1bqzRC+I0sVF5JOrQ=;
        b=M+lvZuZHmdi2cWVh1Ku2k5txfg8KF+HtYcbZ+u+XRHPHHID2WrW/o9QZ+aaDvdfA/U
         LEc063Vcb3e6mudTESKNlg362rIPw63WxkdrEbfiSNnD7dKlktjq4fNCpdAw1Ta8QE/u
         iQIfEncu4NBsKYBvX4/TSvcO2zObKcDZAAWF/gYbj0NcQhVX9R2P0sJS7Q5jCJSgmOtA
         hA8g+srcCWJi2oRmO3SJNjJJuZl9JMIGjXvxEXFZ53CMZO4QQeOev6TwUrsVWojJ4gnE
         RGdY0Ou7iSv8r5+e7FhGTo//Na750lgAcFAqgleR44ahS196fn+n5npwfke9hSEBBwbI
         doQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMf7795kMQFK4ncBMN+WnqsIjoINfBQ3ujlQuod7cbuJfF6FGfIW1u3DEFBBfUcYRee0i89APKofWR5f/M@vger.kernel.org
X-Gm-Message-State: AOJu0YyycyfWQszxpOsF6Ji0KFiVJAVFeo/zeYl240VnhdTGT1n0VQzd
	cfkO37IH278j/4bTcITiI0yg60IrFFFWK2VpXPBog6qTYHSL+wWOb+ubHl7dasVm6YeBDJFOpeN
	N02td2buXbHcBYwZemkkxsZlyhIyxc4SiHECPew==
X-Gm-Gg: ASbGnctwC6W3xyxCV6/TMBqwChYloKh1TN7ydvUZRuuBtnExmtVnsyELxfYrFJ81xDg
	NgWEEjufrQbxssvI8UiTc48mxwNJgS/VZKEv22TvO4/Qj7uFM0HSuDFF0ivpr5GbTbiAXe4JP8S
	CfaaZv4brm1yPekcq3EGc2E8h8FnjOKUj4yqUoHgRM/z5e46Gg2X5pyXSu/4dZR/gmRJSRtw==
X-Google-Smtp-Source: AGHT+IG3iVxfp4ue+UFXysXvz6DKi4QxLJqDrwxZD58TmfbCfjnNN1Hj7KqR62wJRNud2cz8gFthkm8XWf3losuWT5Q=
X-Received: by 2002:a05:600c:4e12:b0:43c:e8a5:87a with SMTP id
 5b1f17b1804b1-43d84fba8afmr37682355e9.16.1743081640372; Thu, 27 Mar 2025
 06:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org> <Z+UDlXFKbmxCECp9@linaro.org>
In-Reply-To: <Z+UDlXFKbmxCECp9@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 13:20:29 +0000
X-Gm-Features: AQ5f1Jrcx5M9VC1f4LvGyufiYg8Yl8JGFp1ql4ekPmK5Li1CNGcCqmgS2hBtMTc
Message-ID: <CACr-zFBRC1ZGTqX_RDERk3k52hJ=kunN6Lw6Qs-5djttfTJ3ZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abel,

On Thu, 27 Mar 2025 at 07:51, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-03-25 19:21:27, Christopher Obbard wrote:
> > The eDP panel has an HPD GPIO. Describe it in the devicetree.
> >
> > Unfortunately I cannot test this on the non-OLED model since I
> > only have access to the model with OLED (which also uses the
> > HPD GPIO).
> >
> > I believe this could be split into two patches; one adding the
> > pinctrl node and one adding the hpd gpio to the T14s devicetree.
> > But I will wait for your comments on this ;-).
>
> You should definitely drop these two paragraphs entirely from the commit
> message. Maybe add them to the cover letter.

Of course; I will do so in v3.
But hey, it made you both reply, so in a way my comment did work ;-).

Cheers!

Chris

