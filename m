Return-Path: <linux-arm-msm+bounces-65398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A0B08661
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 09:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BBEA188FE89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 07:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16622163B2;
	Thu, 17 Jul 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GCNZBWW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A221799F
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736808; cv=none; b=nx72CPLP1r703gsVtOuyJt5umz/Ll7VteJdIV23quVTz2VbyC9FH6x7qHLtjnEAZwBj+6fLCYOc+iVz3/XGMv41o5n5Mt1RU0whGkjBlRHqr9Py3yOB+Y/6zLYhoVF/7WQpxxp5W82R8kYJqEsA39J0XdLywdrUtgwdTe3NhA54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736808; c=relaxed/simple;
	bh=1aZeis3vma/ediM1poNKu6JuGfB4CaNR4b2CAxnOIck=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=OSTEYO8idIgdf0OuzVrQFmKo+ObekUeKCynQGMQr/f3nE19Ec1hA9osp6uP0+s8UMbKCQkhI8K/yMd9IetT4Y1w8D19JKiB5ithKDaeX2/bZoaQxI9SApHDrWuWVnYXDRfH5tKkgHPsqOlN/yiQQIb1ZIKYyIxhmzmCbQZffNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GCNZBWW0; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so1242456a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752736805; x=1753341605; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds0KxRVsVnCi5GTnUrpIjwbuU2zKD6tXzYfIxeDgpac=;
        b=GCNZBWW0UIEi/Tde8UD5c03KWqNPqmCEdasTU+f/XNIGCV6uMCI/69L99gyXhoVp/w
         iRVwRv/SZ3dLQVimlgxm9tRJzObiTGIY+AjmEuAkV8Q0+KpTK7aBJ6zcGOyWmykr0sH0
         r/YVRZsMABhNlI6Ic34F0QKDILB/OIyW3YEcdgHmQH1t/cdTtM9X5uLWcyYUdeIsp3wW
         aoqzH6hSQ0LjAGAXuQJlKTbjzAj2F10i0Lpl/5lNMM/u7Hp/5ClJWcd0bDw1CKYKd57K
         dCJmClD8+KMgvxt4HJA5k6ZWfUFvX4lWwKsJX6ZlS8SJANCsiZRMSXOBHpw4UF8HalEi
         6XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752736805; x=1753341605;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ds0KxRVsVnCi5GTnUrpIjwbuU2zKD6tXzYfIxeDgpac=;
        b=ISj1x+4Y5jNqqKTYlkyTDrxTiStfhgPKQCi+Am9mGRRVttb6INmORIpzfy2SL6Vc0O
         p966N48i7cfuw3G6OFx0Hgtr0oHMVi2QWgTUSFvtbl1vK6hCBm0bRLNuS4Ada7wFl0SY
         gm8EQ3EdimBlUMfsf4SLZeI7Jh5Z7BAt4YyyIAt/p3du6gFz9eE8ZkbH/3He8uh1BbXS
         pWjEN52A766GIPnY4DPuSJS95jL9H6BYg79wz30tQZJdLBcqqqxoKgiTO0MOfoJAPm1W
         nWBo8XiHV0c21V7wIREnBmlX1fJJJFc7dQkkJH0iOfNG4CR+IOIfFpyiYvMMCj8OQiHB
         v5pw==
X-Forwarded-Encrypted: i=1; AJvYcCWN4fg+iYnb0vpRc0UpUcz5mRxPixkStu6kAaj/CEt2fIdiAcaENSpkSXF/OxEnbyR2F8cGqobEc/1fjFJz@vger.kernel.org
X-Gm-Message-State: AOJu0YwAtcOt/oBxnLQwA0qzxvWFLNd0zarL7W9pYYfOF/S2ZwKiG3i7
	jb/IcSuyp8xMfbTzMXv+0hAHIxDBMd2xZ1jzV+0pOVM74NdpsuJ6Q0gQPp+/KS0OPMA=
X-Gm-Gg: ASbGncs85BjljEdFFUud6DlOBmcZb6c4nva0Hw/9UpKb80DPd+i/6d0dKiRPgVZ0uGR
	DUGBdS18eQZ9+2QHt/Wt5L9uDOtGboM77MTDZd4uT5avDit/naZenueUTxIRJUo5nPyqI7j97m+
	e2E3nbpRa81HFdmxrFQibaP9DtLtHlhg7mctF30G9f9jTIYNr0DNwoWf1wcfVR/ET0EQtNmMTrr
	ods5UJKRxgZu+QPx4ZxWmmT3UnIacyEhJyBTcnsyR8DPjlOPgZjTDTD2j9C6LQMcZsJDOL0S+Ae
	e1yipHQRf1L6C5K3SiCfWGnE9oUrOv+5fLyeSM8aIRlGCUX8zRghNQXhCfKmTqw6r3toQEH5/5a
	rPVFCBjpFr0YWYZpzVylMHNthK1ZIGF2koWxSnDxvJwatbpYg2K7PIhT6
X-Google-Smtp-Source: AGHT+IG2hDv2K216WzVbMCe0wIlm1Ij0bAYvzV4KV/5gVYFra+yeIkTw2eBkNA6ZcZTCjmFQQ8r8DA==
X-Received: by 2002:a05:6402:5243:b0:5f3:26bb:8858 with SMTP id 4fb4d7f45d1cf-61285bf5095mr5097862a12.34.1752736805170;
        Thu, 17 Jul 2025 00:20:05 -0700 (PDT)
Received: from localhost (212095005146.public.telering.at. [212.95.5.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611ee1716fcsm8066563a12.7.2025.07.17.00.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 00:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 09:20:03 +0200
Message-Id: <DBE5CBN6IUD7.B03MK0X9PDFS@fairphone.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,milos-pas:
 Document remoteprocs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: <devicetree@vger.kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
 <20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com>
 <175210021011.3927964.2963774922041119366.robh@kernel.org>
In-Reply-To: <175210021011.3927964.2963774922041119366.robh@kernel.org>

On Thu Jul 10, 2025 at 12:30 AM CEST, Rob Herring (Arm) wrote:
>
> On Wed, 09 Jul 2025 13:13:07 +0200, Luca Weiss wrote:
>> Document the bindings for the ADSP, CDSP, MPSS and WPSS PAS on the Milos
>> (e.g. SM7635) SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../bindings/remoteproc/qcom,milos-pas.yaml        | 201 ++++++++++++++=
+++++++
>>  1 file changed, 201 insertions(+)
>>=20
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.example.dts:2=
0:18: fatal error: dt-bindings/interconnect/qcom,milos-rpmh.h: No such file=
 or directory
>    20 |         #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I forgot to mark the milos interconnect series to be a dependency of
this.

If a resend is necessary, I can add it in v4.

Regards
Luca

> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/binding=
s/remoteproc/qcom,milos-pas.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_bin=
ding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202507=
09-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.


