Return-Path: <linux-arm-msm+bounces-39123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7819D8B2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 18:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DECF02857A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 17:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897721B4F08;
	Mon, 25 Nov 2024 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DlVg3I0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13031B392F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555164; cv=none; b=rI487TYXK8UdAO6RAqa55/Z2KFSap1VoaK5dXkCJLA7wQK4XTMz51HM+0a3y3kAKSF0aOXxYp9Awy21I3ygoAJ13qbGycCsyJjPOUBk6vn9zxTcxuzsgjCBhluZM/R9ob36iWWAA3KSdtSnVO8mvObwQMALb7XAM/hm9GkF5dTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555164; c=relaxed/simple;
	bh=TiUNDOaFRB1I0ZknfKQ4oNwpmZSuTLCus9pbIcS9U6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjtRvz39eBTGuybHMbJ4z/SFFGX+FsPozX3iWwpmQT37EHbc0jez+6WK3pMVbBtoOdk1Ug/Zdz2RPiJiUNfZnNROZpG0avrtkL3DOrOOPaIDcLUVrrIA4Qc7E5TC/fKFLhzKxYZUBiKf4TOONhRFfXnAhgBryH33DAZ1nkc95AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DlVg3I0Q; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffc1f72a5bso13523051fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 09:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732555160; x=1733159960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMzxcC5wsaZiCOOJDSmAWDv3eoVe+TCnixOaVa1nGDY=;
        b=DlVg3I0Q7r/tQ+nxeJtCIKJwAJXjiIZXp7efCGp2LnkNxJOR+2/Td3aw+UkTfGXrEN
         0zgjkGifp+VwtFMNkQRIA0BargQCWnVj8/6oc+FJzJYh/NN8u/S7aebUwOlzNdn9Kf1d
         p3IRVhp1YkUcNC3K1/26ViE1t4fXdH1Pc7Ljo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732555160; x=1733159960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMzxcC5wsaZiCOOJDSmAWDv3eoVe+TCnixOaVa1nGDY=;
        b=HNXdSwI9dOhJR5vX8RABRLWEVGnCDoYb1t1m9rj1WLh2m++ZoLVa6IV4nta8IP0MUx
         bYin3udIBswHvJscJGpY4rIi/OZBYL0p40e+w2GCPabFiSR5N+D8AdFScN5jTUDSlVL9
         gKbV4IdoD0O0fvxnpXJW2fDGqrSr3NrVZhchbzOaISb6jbOU94YmCEyCwNwQV42no83L
         WYY0PAFn9nZh63O8TfaolHw2XmRpfgVmabtotSnhoUwUwws/yF3ZeEVjSq+Kmy0eck/j
         bhshE30oI6Nn1hE7MdmWSKRz75z82hTjQDTwBiiAc2IMTRaA4dXjikePYONMvWVmmTcz
         bP1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHn11bO6JFj+VdLefaelcZ2nsO9vyhZrWBISOEM2cCT50BtUNTW5iLt/j4KeurIrmoiNqu++1PWkhA86VT@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOOgT7uj5y6hz0v5z0hXlfhJjw8Sr167zQUoqlErKerXpO+5s
	94vAq2tyJMQVOShZsLav9C2DgFlo+guzTmqO3MAeMaMgMzjoMLOeiFSpqx5sLmprbIRexbCCB9k
	=
X-Gm-Gg: ASbGncutI8k/2iqzEL5FtTgUK2Z/UntwV9Bokk0rAkhHf6VGWtfo2F2eG3zPwzLD/T2
	doNFVJvqFrPxoMN+2tsPW1OMqiQjpchWkZxLrZGGVaD5aX+yijKcQeNkRCiDm+TdZtYeccfoQFG
	R06NhQnR7sgbzzmJAQgXi67lxDMHBafvltBk6TLlHXxuxvw7U+godkFgRtWJ7y0JJHgZ07OrfWa
	TlzSmgfmicJwye5BpD0Rk3QX2PTAnassRg4uf4VtDbmxmgBWxvLXwPzBYfp+12SCG0t9TSmkRYz
	RWKlKP+KjtkfaA==
X-Google-Smtp-Source: AGHT+IH/KYBsF+8Bg7v04WAtVL5YLq3o7ilyRKrcXfYpI31hVo4X0sRhqQ2WralrtuZJYdOw8PeCgw==
X-Received: by 2002:a05:651c:4ca:b0:2fb:3d1d:dd94 with SMTP id 38308e7fff4ca-2ffcc2c6153mr625621fa.14.1732555159670;
        Mon, 25 Nov 2024 09:19:19 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d1713esm16052061fa.8.2024.11.25.09.19.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 09:19:18 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dd668c5easo3264642e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 09:19:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnTF6L1NVhVJIpPjcJhvLNgqLW+QoV00lZFM2FDCWygHA18o9sEYiRCI8BEJISFmMBkR2OW6T4KbF7/2dj@vger.kernel.org
X-Received: by 2002:a05:6512:b8e:b0:53d:ced5:e9f3 with SMTP id
 2adb3069b0e04-53de884971dmr59574e87.25.1732555157694; Mon, 25 Nov 2024
 09:19:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com> <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
In-Reply-To: <20241124-asus_qcom_display-v3-1-002b723b1920@hotmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Nov 2024 09:19:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XjWT16wC_cpnC-Y5=eSvnj7rXY1z2ENyWZQYDawmjs8g@mail.gmail.com>
Message-ID: <CAD=FV=XjWT16wC_cpnC-Y5=eSvnj7rXY1z2ENyWZQYDawmjs8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: samsung,atna56ac03:
 Document ATNA56AC03
To: maud_spierings@hotmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 24, 2024 at 2:01=E2=80=AFAM Maud Spierings via B4 Relay
<devnull+maud_spierings.hotmail.com@kernel.org> wrote:
>
> From: Maud Spierings <maud_spierings@hotmail.com>
>
> The Samsung ATNA56AC03 panel is an AMOLED eDP panel.
> It is similar to the ATNA33xc20 except it is larger and has a different
> resolution.
>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml =
| 2 ++
>  1 file changed, 2 insertions(+)

Pushed just this patch to drm-misc-next:

[1/4] dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03
      commit: b1fe820d03e2e1b89315faf99f1065bdb4146a8f

-Doug

