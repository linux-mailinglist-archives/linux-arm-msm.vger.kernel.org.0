Return-Path: <linux-arm-msm+bounces-47641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB49A31782
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 22:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 798C73A331F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 21:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5FA266F18;
	Tue, 11 Feb 2025 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SuTXjTZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D817266F08
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739308792; cv=none; b=HZh2VCIqlpcbBSmrfW1z/thNNqdzDUAV9iG05/e3KCq7a8FWQN7hSHaqR5Qu1K0GeWi2ltUkAOg9nLXPhGDZa+agrsf1OBjU7k03OYUgQJOirKRQVdoy9nIVgrLcfVukdOt8WKm95LOUytJEAC7FVpOGWwLqMTgHWZjmAdKSfoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739308792; c=relaxed/simple;
	bh=v+NotQmkypHRHE+nHTFJOTzrbxnNJ6Og8Bo7qTcrXqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+DCQmBNlbM6IHCbNa2ktO+ZryxnkhOGjFcZnHu7okGXkswUQkaX/rr2fGp/kYjig+mhd2OcURTEyGzu4ai093ucT35ssg6Q0l2SbDO5Y+K+ITZPK0pIGuef0WWhTkFDY0pvq8j9wpxkP+Z03wPH28cvdq0Lq7pMaajRwUSyFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SuTXjTZ1; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f6715734d9so53900927b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739308789; x=1739913589; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8vMpnOzz24XlelaJjtEfRnOqqAth0NeggjrcIGJFxfY=;
        b=SuTXjTZ19A00FUPjfW5OIYpo1Pj7eXvnzezX2PSBJxCZFMy3+xCG+hWTjB2jaEIDpp
         r1yomxBrNYd9IoPPc573d51xwZSGdEHbMvAHDMCw7RfK13I/BObzcJIoy2n75sXqpNaM
         rq1gakYpbMsWWRVB0K3XKyMbl18OZDuNSZgiGThJsLH63GB7eyz+7nF9ynT1GX+x96d4
         e5Qihpk/If7a0cWz2lTQy7yHbFLmS7phf/SbiTVUlrWVReoVlWTBxmutO3hhnPVBF+6F
         TqqFHR2art6vHV1f6BHNGY0t4rm2RVQReGSXdSkfsgB6IaXy1Z0Yd5pN0r7KmEswCkkD
         3HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739308789; x=1739913589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vMpnOzz24XlelaJjtEfRnOqqAth0NeggjrcIGJFxfY=;
        b=V09tnqqydyRds+cT7rgvVlmgRkaA/mz/3uRUwhSZUI5fA1noUYZEDnJ68C8OKT7si4
         3WoEmpLgmec6+5Bu5gi2KnatAJXbSSZFz8NhobCPmcUT6gdB40BGDyl5cmSm9vJUSKyd
         VglkpU+KRSIw1jaofsR6VUltQjH81zVg31IbyK6dUxV58yzGpkxwviDJQPMUTfpS6JgW
         Ek08zBzQ+79xgUoTT3ToEu8VdX8ICH9qdvx7aHtm6kPxpUnyCHorauvePMQyRWlsW1Os
         DcdUt1sFHeR9m7KdhxiJbqi59gykjrg5vTQzV8+F4oKFFYXiQe/I/tMocDVAkptT9daR
         2q+A==
X-Forwarded-Encrypted: i=1; AJvYcCXDs/W2I50g9ssFHKXqr+WVJJ7sCBt6ggYoClbdxu2LEifS+fbr+au1m1bnDL9JHMhYUYQx2SP4DoDoWOyg@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxZBRtnwXSdNf4+T36lXdmufw02KWV1ZBvrh/SDgzgXaeSUV1
	dJCligsX+bKvBUTMgZbtOJ1JOwRtxGCw03KBrc6hrTJ8OHydjhlrRYF6JerE537TusGoTBzBhyq
	cPVXMLfeQd2EaaONVoQKGBWY+mAbbxRhp367pFw==
X-Gm-Gg: ASbGncvWu2XOfKSlbmlrP4QZS+sdXq9WnYJv9rK9QeDmkRapLxLX2d/Qv5/w/UURJsZ
	4FNr/qF4sISvZprBjZO9C7vyrAEdXqTOZXCLoNVIAtTZHw1NIIufRwYBpS2me7SblyhovIpmXiT
	btLD0ZzOq+fVPAreNJUeQHF/ozXNhw
X-Google-Smtp-Source: AGHT+IH9PQWCcTuU3a/WUrp8QtPQgxzfoa0eG9D03GuXuge0++Qcj4dBm/Lk+WFXHD1fsOGrWKTo04Qt3z/nEYlknZk=
X-Received: by 2002:a05:690c:638a:b0:6f9:88ba:aa5d with SMTP id
 00721157ae682-6fb1f194f3dmr12585947b3.9.1739308789048; Tue, 11 Feb 2025
 13:19:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org> <20250207-rb1-bt-v4-6-d810fc8c94a9@linaro.org>
 <6e5bb2f7-a23b-4fab-914b-e67911eaf408@oss.qualcomm.com>
In-Reply-To: <6e5bb2f7-a23b-4fab-914b-e67911eaf408@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 11 Feb 2025 23:19:37 +0200
X-Gm-Features: AWEUYZlP4_dHB7Swwx_XD496R58hsBttKN3cXZEWV8-yu1YbBT4qWLOogarYxpE
Message-ID: <CAA8EJpq504V48qqSX0mzxCffUkq_xpu_UE+qubB46A7zon=0iw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 16:52, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7.02.2025 9:41 PM, Dmitry Baryshkov wrote:
> > Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
> > has been merged to linux-firmware and should be available in the next
> > release.
> >
> > Bluetooth: hci0: setting up wcn399x
> > Bluetooth: hci0: QCA Product ID   :0x0000000f
> > Bluetooth: hci0: QCA SOC Version  :0x40070120
> > Bluetooth: hci0: QCA ROM Version  :0x00000102
> > Bluetooth: hci0: QCA Patch Version:0x00000001
> > Bluetooth: hci0: QCA controller version 0x01200102
> > Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
> > Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
> > Bluetooth: hci0: QCA setup on UART is completed
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> [...]
>
> > +&uart3 {
> > +     /delete-property/ interrupts;
> > +     interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> > +                           <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
> > +     pinctrl-0 = <&uart3_default>;
> > +     pinctrl-1 = <&uart3_sleep>;
> > +     pinctrl-names = "default", "sleep";
> > +
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             compatible = "qcom,wcn3950-bt";
> > +
> > +             vddio-supply = <&pm4125_l15>;
> > +             vddxo-supply = <&pm4125_l13>;
> > +             vddrf-supply = <&pm4125_l10>;
> > +             vddch0-supply = <&pm4125_l22>;
> > +             enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
> > +             max-speed = <3200000>;
>
> I suppose we don't need a power sequencer for this smaller,
> tightly-integrated-via-snoc chip?

We can (and should) have it in a longer term. Currently none of
wcm39xx chips have a powerseq implementation.

-- 
With best wishes
Dmitry

