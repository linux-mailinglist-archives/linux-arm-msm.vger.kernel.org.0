Return-Path: <linux-arm-msm+bounces-77690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6314BE6C20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A86418889DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 06:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE2031197E;
	Fri, 17 Oct 2025 06:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uc+OZZt6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F447310782
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760683556; cv=none; b=NkgCsAJCeZ4OFA/mr5u2iRy5Z7tcmSF1CVhdgSpXspxANTPQZM6aJAxklUchCkBDSal3Q1cc3lGwfHCx+lcPDfEJybEFlJyak2bYKQFQHAehiPi4agk8NmHKO6nEzswMs0KGn/ELJ5NoIfgKp5xHubBMUj3H+wiVzZ4+Vizd+Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760683556; c=relaxed/simple;
	bh=Y8VoXhImxF1w1dbi0lgAcXI04oMk6uKN2d6iSlSdjTk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=InBFv5TNEHSyCKgIVsPwjEW6GG+Ne+38D39PKsovLEgzffBSJMey2WKD8txmrvMNvMXSLQHPqCvf6P9T2p+t0UgqvCi3ufcWtf0KlGWOO6dcQLmKlAG3UTF1NRjgvbviYsGQU2mclcL1vJwYaqIoPgYkI6RdmHjLPNgBJsf9/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uc+OZZt6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso947225e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760683552; x=1761288352; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxXwBRH3OdLI6ivv4eNJ4mVtVC/UotONZ6PQtTD+YIs=;
        b=uc+OZZt6bbuvCyutKKMIvPG3rVkJ2GIgOy5aVU3oE7vOzD4iXxA9OBh6ERxTy7Z306
         6oMQlEyYtTEcY6RMqDgtMo0KBk3c7SQTGcZx4O0PkbSbZeh5Lj/f3ET5DX448msxCLIp
         fIlPrD5ofd6qLa8I0I+vilTBnCF6OpGa0Pl41MZmELHLG7WEb/gGLSGT8UEnJme0OREz
         80XFbD/F4+ZGdgeRXqyWNQ5v06bb+q2uI1hguEZdJvA61akneZyY8cIbE8y0ftpS1EN7
         SnggNWsBVgZtWXUFnaDcjnY0DoAazpF6WIC8i6pZmE0i3wcCaWHfoyazoFoaHC8e1dX2
         g7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760683552; x=1761288352;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxXwBRH3OdLI6ivv4eNJ4mVtVC/UotONZ6PQtTD+YIs=;
        b=PS8zRDpV+OeUpNiKN/8g0j7ABBrPsX48q08AvGWZNWsOa43NNCkhq3nBFjaV+pBVou
         HZFIWrxWt1oMjarxVJ+vHmqMGNNse3pytJgIJZmqx1WPKm8gkZuhml+UEbayZu14jLE1
         625A0zJOqAn1BQwM2z8WN9AOavSPvKudBuKk6WI+5ipFfW+t3p0HvL4kxZBQtCCJsxje
         wiDDxBE3aU2TE4vdtnkSuOkdN5LuDmk6ac/3ZRhqWNYQt1wAQgJR4MwkiY9qmAsRmhSz
         LX/wkde88R49+ffUI10l0Ua6htEH1lqGeMkYKPQx6llPLpSaiVdyMlgnt6IKPAzNbKIK
         WkLg==
X-Gm-Message-State: AOJu0YziyHO3QbewHcEyCSXXv2AIYCOlFaIFD4Qfqhjdrj9MeFqaF4zc
	0qdmMst6aoJ7Yp53ehDHiZuudeEeI086No84H+OWZRYrxhwWXJ7STC48iQyKQRZRSPc=
X-Gm-Gg: ASbGncsDOR5q2qS5PPRDorPdHka9uO0I2KjzL/WVMq1nVAgdJoEit4humldGAMoh/k2
	uCyy620c4kePrzyAov1vIc5u4WMz+Dhp8DrAvpk8YMHsXxD4BO9mZCNo6R9NVhLNO1v10O3qY6l
	jNpStF4ZDOUL/HDUSx0dgqgplzy4WwadA4V4Ny4epIcWXs2W90iH/XUSN62qks4BgrzHxB9MkeK
	+LX5eDZXIdaswoAvWdPkEbhLucRTyBqtOajk1/XEZ65a2o15AOsLyZYD0sTpyuvV9CfrPvN6VJz
	VdK7w3tkiL919kSP3c+bCeoQ81xs3vO4m6mCF+JbKobDXXm1jr5XWZcfDZQ/FSTP6TqBU8yJQad
	n8yl4kLHRfG53cIeNk1rz2DYjnBeraRAFo67RsVdPg0PzDJcfskA6JGx6cUDYd7gEBuKqpLHVOP
	m01BSK
X-Google-Smtp-Source: AGHT+IGkGQlk9WZP2Ulpn4AcpV8f96nPE/t/dP3omgDpA/THfd4k+GylVoGgGF64mCc4wmfibWovUA==
X-Received: by 2002:a05:600c:1551:b0:46e:2801:84aa with SMTP id 5b1f17b1804b1-471177b143emr18469735e9.0.1760683551674;
        Thu, 16 Oct 2025 23:45:51 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:6426:9b9b:6d3d:1da8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c91sm63630395e9.11.2025.10.16.23.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 23:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 07:45:50 +0100
Message-Id: <DDKE88TY46WS.1XKHP5I1S3CF6@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <srini@kernel.org>,
 <krzysztof.kozlowski@linaro.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for audio blocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, <lee@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <sboyd@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251017061314.644783-1-alexey.klimov@linaro.org>
 <2e4e0ad1-a030-4933-8bc9-7b9782234a15@kernel.org>
In-Reply-To: <2e4e0ad1-a030-4933-8bc9-7b9782234a15@kernel.org>

On Fri Oct 17, 2025 at 7:25 AM BST, Krzysztof Kozlowski wrote:
> On 17/10/2025 08:13, Alexey Klimov wrote:
>> If/when pm4125 audio codec will be added to a device tree file, then dtb=
s
>> check will emit messages that pmic audio-codec@f000 doesn't match any
>> of the regexes: '^pinctrl-[0-9]+$'.
>
>
> Future errors because of present mistakes are not a reason to do
> something. This makes no sense because there is no DTBs with that
> compatible, so drop this sentence. We never document compatibles,
> because in the future they will be errors (if I get it right?).

Ok. I can hold it off till it will be started to be used then.

>> Add the compatibles for two possible audio codecs so the devicetree for
>> such audio blocks of PMIC can be validated properly while also
>> removing reference to qcom,pm8916-wcd-analog-codec schema file.
>
> And that's now incomplete. You add new device here and because preferred
> and sufficient is to list compatibles, you change existing audio codec
> child schema reference into just list of compatibles.

So the way I understand this is that commit description is incomplete.
I can change it to your liking, okay.
FWIW, "add new device here" is said as
"Add the compatibles for two possible audio codecs" and removal of
child schema reference is also mentioned as "while also                    =
                   =20
removing reference to qcom,pm8916-wcd-analog-codec schema file".
But I can change it, okay.

>> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
>
>
> I don't think I suggested this patch. What's more, it wasn't here at v4.

The original idea was to fix the warning or error emitted by dtbs check
but now the whole body os the change is your suggestion. Now it seems
it was not even needed at that point earlier which is a new finding.
Your prefference -- drop it or keep it.

>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey

