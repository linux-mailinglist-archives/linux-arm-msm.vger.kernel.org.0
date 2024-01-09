Return-Path: <linux-arm-msm+bounces-6733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B80D8283F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 11:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDC151F240F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 10:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B463360AC;
	Tue,  9 Jan 2024 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gR8WJl1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3C5360A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dbed729a4f2so1966804276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704796015; x=1705400815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kgqGlkcMY7u56Ey8Ssan/W4yPE2JFQtM3N3GgOR/j04=;
        b=gR8WJl1J//qv9if6koihIbit0Zd7NxTDX7R0irdnFoqdnSsM5W4AYuMSN/Q1P+Lq9k
         vc/6hEtrPhFqo9ZNhdcH2Zm/QJ1vQFQOiOU87J6V14C2vYYdc53AZt2Q7JXBnrBUC5Cm
         FtbqfYYhpdiRIioTF7l2TbUMNd0uz3azs+u7705vmcZ8wqCAcE5DlMTzMZ1FVH8PBtPV
         nf6oN/wvRmysmK+WpdAgfi2AdzAx1SFcz+WA46hi5WCMIz3JsYjGXCQyc44AkhJsoMLH
         1k1VKlpdkFSer1fVr9XSWFbLjya6Hjux4gYI28JqoQzhLn1gtFsuLRS1ZpsFcbBoHt9D
         HCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704796015; x=1705400815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgqGlkcMY7u56Ey8Ssan/W4yPE2JFQtM3N3GgOR/j04=;
        b=HSBoygn6Ys7LUs9tN5akIkCHoAeni2SWdt52dIQe8cG4H7/PrI6OpDzYh90Kk6CwUp
         T6RdHPVI3/22O5UovipVJru/dqqHgJ6c563lIXwZktwqXRd+R8L00zMNNYf0WHGGgRh2
         pnbd3ckepH4N0Gk3bAuQK+D3gL85Gw5JnLr14aLWL9Vr7ESOZibPYGdxYehd/oEishsh
         p3p4nAbqT7CxW86VQ0wwSWO8OQp1FdG0Y73lhzsuSND9k0MqBBgxR7MW1N2ZZhUOtVzr
         czfFFWg3dX2hqrwfKxqHwl1krb+T3NFMO6BU/VFVCSaQsWt/vhADjTqAem1O/rwValn4
         f7QA==
X-Gm-Message-State: AOJu0YxB3H3v5asSbQnqXgGjBfT8HJIhbM02dOTCucmBm9kEexvYXkmk
	pc/thfwgJ8Z1XYK1pH2+jVecRoILtYPKP2QkLOC8q3lQQSTlaA==
X-Google-Smtp-Source: AGHT+IEQcZ6P9lXrBSBQ98idjcrgG87Zex/N/4zJ2/Drg8bOifKzxnfvcNAyWLYxJMhEyMuLNyRozZ9WLgS7M5DCWzc=
X-Received: by 2002:a25:fe10:0:b0:dbe:ab5b:c659 with SMTP id
 k16-20020a25fe10000000b00dbeab5bc659mr2117007ybe.37.1704796014777; Tue, 09
 Jan 2024 02:26:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105-fp4-thermals-v1-0-f95875a536b7@fairphone.com>
 <20240105-fp4-thermals-v1-2-f95875a536b7@fairphone.com> <18dc5f88-6590-4e2d-948f-fd77f4713f8b@linaro.org>
In-Reply-To: <18dc5f88-6590-4e2d-948f-fd77f4713f8b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jan 2024 12:26:43 +0200
Message-ID: <CAA8EJpp5ZwJUJbbt7YG=1aAdGoScA+PTEf==7gJk3RUP2yu8uw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L thermals
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jan 2024 at 12:10, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 1/5/24 15:54, Luca Weiss wrote:
> > Configure the thermals for the PA_THERM1, MSM_THERM, PA_THERM0,
> > RFC_CAM_THERM, CAM_FLASH_THERM and QUIET_THERM thermistors connected to
> > PM6150L.
> >
> > Due to hardware constraints we can only register 4 zones with
> > pm6150l_adc_tm, the other 2 we can register via generic-adc-thermal.
>
> Ugh.. so the ADC can support more inputs than the ADC_TM that was
> designed to ship alongside it can?

Yes. ADC_TM can support monitoring of 8 channels in total.

>
> And that's why the "generic-adc-thermal"-provided zones need to
> be polled?
>
> >
> > The trip points can really only be considered as placeholders, more
> > configuration with cooling etc. can be added later.
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> [...]
>
> I've read the sentence above, but..
> > +             sdm-skin-thermal {
> > +                     polling-delay-passive = <1000>;
> > +                     polling-delay = <5000>;
> > +                     thermal-sensors = <&msm_therm_sensor>;
> > +
> > +                     trips {
> > +                             active-config0 {
> > +                                     temperature = <125000>;
> > +                                     hysteresis = <1000>;
> > +                                     type = "passive";
>
> I don't fancy burnt fingers for dinner!
>
> Konrad
>


-- 
With best wishes
Dmitry

