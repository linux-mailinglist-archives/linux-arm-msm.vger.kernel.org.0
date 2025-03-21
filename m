Return-Path: <linux-arm-msm+bounces-52215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC31A6BEB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 16:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0564E189D9A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C5C22D4DB;
	Fri, 21 Mar 2025 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pN+Xp5gw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B040622B8C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572196; cv=none; b=pWvI3NfRKg2O9O4AppkPKuZemnvS9NWCJN9aSaH25+5qfJYPGW2f8e2OvZYp70ckbIkQrHwbbXwyU9+1CDkQBVV+vYEpuKlS9kKcpMzn94Wbw7o1GzLPOuWwcHDyCzQSRyQ5mI9Pw6W8Np+pB/HL7Te8vuucnnp9dT0vbpkkq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572196; c=relaxed/simple;
	bh=sHOyDHwMkEneP0INOZI10ERSSowktJ1Kc8KZRERfTRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJO/SecTnqGf9IkYad+4XPXBMNu4O6e8m6p0pjp+K9/QbGd+e4Czwfz3WBrSp9lAmNqjhndryBnh6BA4clh8SrhsEkQkmCkdPn8peJT5w0hZunkM3SQCdwEf1qacptgZvRTxtXu8GxCFEfZcp6yX7LLoYo9NOM2zyaQZReJ3NMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pN+Xp5gw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso2788330a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742572193; x=1743176993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vklN2GaacEXLUQOf6jBxkKBFuSQd+uRdj0tkKRVQNtk=;
        b=pN+Xp5gwvVjsxl0o8+Kfk/CLXkOflJc+zoVx3u40D/3tG0Pc+DRhze/kCpEuhtjyRI
         2AdSeJzuyuIaYT1OS8HsdK5U7dcNq9iztNgLXo/UkI4d85u7D+2E4A0hTAzd/UkrURJH
         3VtDTa/58lStRYuI1iBRpa/NXdpOc80diplIybQfhOmiNOTC+xQLiWFtNQtnjZzB0A7+
         cYOkzeHAV8n08cLjyWmCzpx6rve1YoTaXosIA1WgfFIw16x/SwpCBQlF3h+FJSvzw06A
         zDoRQ6H79V8IMiORqiPq7fCBDaS7O+mx3i2JqjxDX76AUxeo7jk1zTo0VU+CB9hITkV3
         t2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572193; x=1743176993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vklN2GaacEXLUQOf6jBxkKBFuSQd+uRdj0tkKRVQNtk=;
        b=RYKh+HCMkNF8v9P4FWuw5W8HyvKRSndQg75JLCpE/o7qsVuiOTm1t3RK+XVphf3/yX
         eSCwrWsvKFpwGQiqkcUOo8omKiSB4+tajmFlWe7n1a8Kmj+FVOVvVF97tAcYvzPX9q6S
         ngNufWUdq3I44T1U+aKJXa4WWQVVy9QH3yPmdH29oIpfHS0in+61UCvl5fBkpJntMh6e
         9CZaZyEBrDWFlRmiz7coozLQuK2aNLpLFC+olJAdaO1INftEDAs3Bi4ygAlgfcK7JIFt
         X8P/dmDP22wVmez4UrW4iUZCNvJuqqVvnGFAIz0srgAFhOQ2gdlg8yYXVi4VGkngU1KQ
         1T2A==
X-Forwarded-Encrypted: i=1; AJvYcCUjNMvLB+xuLqNiKg2ZLNAuucbciQQAVCoUgxFHF/064B0StkJrfLypT55p1GP7eyM+otA2h9MEfHQTVZ9R@vger.kernel.org
X-Gm-Message-State: AOJu0YxqnOaIrUwPdp8a7b1cK7C+xkVyIPQjcxsyf/noVoU92wMnsoQy
	qcc+B3RWYz8+gBfFGz3aBc1rSQL6csjm1hQcA/T5eWgg+belPy2rDQAmrOSSoYE=
X-Gm-Gg: ASbGncsEeHwkela+QHiwTO57kNxZB9g2kOAvPz+tJx/U0pF7ZL48k1mHkZS/XkbgIzT
	42kJptmlAumYW8jS7gAceuJM3fwiDvEIgtRFstLS60QznEWSZ33wJiDWDDnYnHGS80O0QDs+t71
	PBkH5ztKPLpXYX1NVyhRNi2gufhh87ZAGpAM9a2MSLMwTD/ufD1hatcZLtdRGQG9ysNoU16WoX3
	ihf2XBEF99ZrGHFLRBjkB+m+EsBSoI9XLhDmr0HWCRYvtEvJ/PqdtEdBNTmuo9c1Xlzf4+vcbes
	Sek8ZNy9Wd+V8ITvu2z2/XJw88K7/ypunOmDjprHTOBfcb13tA==
X-Google-Smtp-Source: AGHT+IH64Jd2L5c9Yzb2LgwV3I84SSyGpfTTprm50kscsUSR1fReJIULWFk4FLQWP6bo9iqncrYHrA==
X-Received: by 2002:a05:6402:510c:b0:5de:dfde:c8b1 with SMTP id 4fb4d7f45d1cf-5ebcd40af26mr3083965a12.4.1742572192819;
        Fri, 21 Mar 2025 08:49:52 -0700 (PDT)
Received: from linaro.org ([151.41.27.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfafc1dsm1535650a12.39.2025.03.21.08.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:49:52 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:49:50 +0100
From: Ettore Chimenti <ettore.chimenti@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Georg Gottleuber <ggo@tuxedocomputers.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wse@tuxedocomputers.com, cs@tuxedocomputers.com
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
Message-ID: <p5dxsjp2xdl5esmpxseqiy4n2xsici5fvow6wtiquhq7ixmlkt@fty3ez75y5ld>
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
 <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>
 <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
 <l77iickvroov7crzg6s2i7nq3kakqgdtbqki74stavqkiwyjfs@rv2oegbwogxi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l77iickvroov7crzg6s2i7nq3kakqgdtbqki74stavqkiwyjfs@rv2oegbwogxi>

Hi Dmitry,

On Tue, Mar 18, 2025 at 11:36:32PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 18, 2025 at 04:24:27PM +0100, Georg Gottleuber wrote:
> > Am 07.03.25 um 07:45 schrieb Dmitry Baryshkov:
> > [...]
> > >>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> > >>> new file mode 100644
> > >>> index 000000000000..86bdec4a2dd8
> > >>> --- /dev/null
> > >>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> > >>
> > >>> +&gpu {
> > >>> +       status = "okay";
> > >>> +
> > >>> +       zap-shader {
> > >>> +               firmware-name = "qcom/a740_zap.mbn";
> > >>
> > >> Are the laptop's OEM key/security fuses not blown?
> > > 
> > > Can this laptop use "qcom/x1e80100/gen70500_zap.mbn" which is already a
> > > part of linux-firmware?
> > 
> > It seems so.
> > 
> > Because there were no logs about loading zap.mbn, I activated dyndbg
> > (dyndbg="file drivers/base/firmware_loader/main.c +fmp"). See attachment
> > for dmesg output. But GUI freezes after sddm login.
> 
> Does it happen only with this ZAP or does it happen with the ZAP from
> WIndows too? Can you run some simple GPU workload, like kmscube from the
> console?
> 

It seems to work fine changing the `firmware-name` property to
"qcom/x1e80100/gen70500_zap.mbn" and updating to latest mesa on Debian
Sid (25.0.1).

Also tried with linux-firmware binary blob.

--
Best Regards,
Ettore

