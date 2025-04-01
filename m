Return-Path: <linux-arm-msm+bounces-52976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A3A77EE5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 17:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5B9C3A3E01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 15:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3EE20AF7B;
	Tue,  1 Apr 2025 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NroZWePt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0900204697;
	Tue,  1 Apr 2025 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521311; cv=none; b=h/0Lrd9rHGRX0QY3LY+WmPGDG+4UZj+JdALOUlz/IZ+aa8hjvO7r/1CbdvarKzJN9f6ctcyHPih+eJOxAuhVsGkWcuTJR7JPTrtkejmxi4K6J985mg289SmyE03h0y29wBhUYm1SPDYo+ipHYpTis4LxRTrusFkMRv/PhAkSOhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521311; c=relaxed/simple;
	bh=S0wNmrFMnOGNLfYa7He53esmoNMyO2xtsu3Jnghyv9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unDED2iMKT5l73gqjxQq8N4cgWeGFQZOQOsuRuGL7UTN5jnU12vSyfIAPpL3jxeONTvXbuViz7wQKfzd/mYv18eRH1G4NNcyh9FjlzWpNNNQXqehayznx5ytJK9pUZw3T8JkSG0n0CtbuPiemfRbDJ1Rn87nbwQNYbgl+cAyn3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NroZWePt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso62715635e9.3;
        Tue, 01 Apr 2025 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743521308; x=1744126108; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CwkrXFbxY9tJa/SJFvtzbpLUSiv4ZpED0g8iWcEV1uk=;
        b=NroZWePtdiesc7iTvmSPGV7AqIvNphj4Hjh5U6OVeWBVWRxWhZRklDS8+O/PceJGkJ
         O/krA+Q9K/rf2mj3jVNXHxLBM1ASMoRTEx9oJTCVTW53oz1ntYAGD+UCLvn2Aixl1aa5
         1TqSijAZxIdfUA4MNktKKSiOFvc4BiwP9cWgdf30BxbiVIIult5KZT9EMXPRQp4YF2yt
         YNA1Rc1n8mzoa7cM+GHzQn0f9bzD7Go9iRZqXW0ydz5syYMOBNnype3fb3I5PLYNB/GM
         1xjaUJR368BtLzxc1nGB3J3dl+TzgJPVdQou2EIgV1MwBKO4QBCEhx/5jE2bMGGh5yHz
         gq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521308; x=1744126108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwkrXFbxY9tJa/SJFvtzbpLUSiv4ZpED0g8iWcEV1uk=;
        b=LdpiPepmonx3/Lukdnn9ccI07eUAX08W1HLqRSsQQKb3fBN45K3x9ims16XgaFvdum
         BtDUBtU87/1Ps8Die6KBwUHQt3WvNGGeQbU/PY77Hypai0lLBdCwrWiAv0toPEImE8g2
         yQ3X43Cyjysx5kmDJdI2tSiw0AdaJH9Z+jsZBWWofNAEydNLA31iD3e6+eKYJPXOZKsw
         JW+qadBPH8HoliP5GpIcUfO+N0wN+XNgDrbLz9DRW2l7UqjPxKTrUvK8LbJESYrlNJ74
         QNutvuoBAshCUbDS1XQt8o7IDO4Op5RD8tIuOtIzwWihIJgOvKlKUGNmNxOa6qsA139F
         dY4A==
X-Forwarded-Encrypted: i=1; AJvYcCUoJhlNDQfMYnPxL4ZQdw80mkG4mztSb2qKgwW4LmRB3JUBKNRFq9PSC9YbnorYBpWRvNqz0rhLaWwY@vger.kernel.org, AJvYcCVH+JIvVEr4+0rvWw2bfKTKg7Btepq/Ovn9bAiHhzSbpu1LnafbldiqWLuL6WkRBI+sOLebO5oqHbvbFhb6@vger.kernel.org, AJvYcCVKZK8lwaFd65Zvyb8Nry/+7ydb8GXYP7vfmnslqNI/EGkSR8U5lrFGE2T2MlvkvSskP49hTEyd0ADZ1wRYig==@vger.kernel.org, AJvYcCXFoY4Qu7i/Pe3YRDV/ufPqX9ZeXA0TZK0hyVHdK6Mh5OGZBRj7AB9dT8YscgSstcpN9GvVOXYYWrSO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9//YLQhb5b6n+oxC8fHr5YvrhZcLDsyVcnZkSsLgZGm5eV8zc
	30GPvJv2qhOfbYB5o3LVLnCHdvakm0NH6ZRnB4L0dB5daZai9E/d0T2INqZhBhmbtOrxvi/aByR
	zMLo1s+6NSGkGyDoyjuKwmtH5zQ==
X-Gm-Gg: ASbGncvzOPCy67RqZsRGIP2GIaUSmbvhFx4A6Ncphzue2yk6Gmj/OqXeEDVup7Qc/G/
	gb3mXPYXJdzW7hS2FS6wq5Ob/2Brb5ymfIu2g3d0WIV9a50YWSEDyi90H7I+6UBXUqwJMdPpXhd
	8eKsZugnqfR8PEx+AJKIFqO/a9dw==
X-Google-Smtp-Source: AGHT+IEPnkPYOVsLjM0/D6jFK2fUmZp7y3cmh6hjueZw4RVtZlgrxL1cG97I3ZeJMCbAxoRmRubRUlSKQOonL9Qrc2U=
X-Received: by 2002:a05:600c:198f:b0:43c:fb8e:aec0 with SMTP id
 5b1f17b1804b1-43db61dffcamr94542855e9.1.1743521307598; Tue, 01 Apr 2025
 08:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-2-alex.vinarskis@gmail.com> <219c03ee-4440-4452-94c8-f8b32c147db5@oss.qualcomm.com>
In-Reply-To: <219c03ee-4440-4452-94c8-f8b32c147db5@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 1 Apr 2025 17:28:16 +0200
X-Gm-Features: AQ5f1JrZEAJkqM3stGST93HbqddBgjzyizVAm53x83M-sCMI_F59tRpWGl3eYnU
Message-ID: <CAMcHhXrMYoeK2PP1UNLkuFX+vya7fMxtDnxzJEmvEVibMPYKPw@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] arm64: dts: qcom: move pcie6a type change from
 X1P42100 to X1P42100-crd
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 12:19, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/31/25 11:53 PM, Aleksandrs Vinarskis wrote:
> > It appears at least on some devices (Asus Zenbook A14, x1-26-100) change
> > of pcie6a_phy's compatible breaks the controller. Move compatible change
> > from generic x1p42100.dtsi to CRD's specific x1p42100-crd.dts instead.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1p42100-crd.dts | 4 ++++
> >  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 4 ----
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > index cf07860a63e9..a2a212b31556 100644
> > --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > @@ -15,3 +15,7 @@ / {
> >       model = "Qualcomm Technologies, Inc. X1P42100 CRD";
> >       compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
> >  };
> > +
> > +&pcie6a_phy {
> > +     compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > index 27f479010bc3..4424a8708d39 100644
> > --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > @@ -37,10 +37,6 @@ &pcie3 {
> >       num-lanes = <4>;
> >  };
> >
> > -&pcie6a_phy {
> > -     compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
> > -};
>
>
> This is not correct. The hardware is different in all SoCs, not just the
> ones put in the CRD.
>
> You're probably missing this change [1], please test it out and leave a t-b
> if it's confirmed working for you.

Thanks for the pointer, with the missing peace it indeed works now!
Left t-b. Will drop this change on re-spin later today.

Thanks for the review,
Alex

>
> Konrad
>
> [1] https://lore.kernel.org/linux-arm-msm/4c7059a0-46a0-424d-9068-60894c6cec1c@quicinc.com/T/#m9675593a62b2334ab2afd4269da6938464a03fa6

