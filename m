Return-Path: <linux-arm-msm+bounces-63180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BBAEF4A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13AD53B4646
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E06C26CE09;
	Tue,  1 Jul 2025 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="w9r/QnrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23425F973
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364733; cv=none; b=Gu+slsv3zA6FqD+SuM0BMo7MdPc1XRFUXp+uvO/PPUVKslKgflR/WRNoDv+tZMdkeUIC1tOjO9gTtwHvA02eUIKZfRKUKfd6U85ZLvrzkp71g/eZgRPox0DgeeI5eMgfYOw1K5X5JHy6kNBHIRkjdZ8kRgEpD6EUjyVSS130+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364733; c=relaxed/simple;
	bh=i677gT0Lf3VOXIYNP0ybjGzvserOJM9ohhVxqFpKZ6E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Buu0dTJN2HBFL1L5a69r3em4XraKKNLKxgiOWLJ2F5Z130NmCacajb+5vwdMxUTTWC5sa6fYpMcyEHG0/jVg3+9P8vztb18bmKZR2badnx71KEz9JJl3SsGNZ+5w7XWA7Oz3rtklV2d7Fo/pJ8AG6uz7EZG2yBuBwi5h4nNaKzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=w9r/QnrV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso6063965a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 03:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751364729; x=1751969529; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjxelGecQDmUYdn9tTQMoWPi1qncMiGAW8E3PTy6vq0=;
        b=w9r/QnrVmsbsmnnURN3/QeO5+tn0+XiaG1bYujOBcgAqQYRp9eACKe175ZWAjxqUwh
         YeDGANvUir+nNPvLiHyYF46AUqUSA82w9t6q4HEN9Wx2gvzKRGKtT8d2nooAKkem8bCY
         RjImig16k3/KyAWbM1gtV7P6jq2CzIbM38XIhX3WPraSTakCboYXrwUwV5xKmkHysrQY
         FOgWipuxmD5d3zfBhb6LtAkpq4znR6mjTLTqizTLTKIFGQqzWhCWzHt0KbjfFqskQvc3
         pN7IAcg1kR8lYVZYdy3WUmfOstIsNA504sIFEN+gPfSB2C+rQWGSxy32txBpNMnJeCL1
         1YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364729; x=1751969529;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjxelGecQDmUYdn9tTQMoWPi1qncMiGAW8E3PTy6vq0=;
        b=KO2sAPXbWaaSr5/CrNPXpo0m+lIc+z5d0dlBBT66ws2/4wqA0mS5R66JI3GSlCzW9W
         Wy4xpRyz19/NZjtkvYe41tOqdM6wdBj02XR512wv3L7pZ+9PZKXpSc9GBJlIu3V66FcF
         kA1n/fyg8EoyGWZgMUmUcIwM9QZur8PmzBTuFXmSueqxnrFEoFb/i4QtTBZTUiXfaWxz
         Fa7YHfQEVTyINBmByrzaJxwIlG5rMMyTgvBFbP2t+BBUP2QnVvTEbLvfcDrrjyfoUQgB
         yYbu3UeczNgeMhTFO/jVLfLlz6stalDzdR/3mWhwBjkaaZb1Fp0DKOIp8ghxUHTVmv9/
         9TBA==
X-Forwarded-Encrypted: i=1; AJvYcCVfYy/2aygcpX5H7ul+ClXwDYBLyADfeAutNnXLPOjuhX4qoFXe+5rkl2mkywB5Ph3gFdND1Rq35lXHSt9h@vger.kernel.org
X-Gm-Message-State: AOJu0YyoY1olcAcO7DSsVZ2OT4iZ/GEr+DkKZpE42i3h0ec7UkjmlWxC
	eQxjNSPRt0fLC6auihpsQOmjinfWfYkmWq4nBAWBSAn/GUqhY26qR5QKJ9Yqudxlrz8=
X-Gm-Gg: ASbGnctVNQSDx6fFvhD2qGcws9kmPOfAj4qiZFylDkzMmZanTPrpqNCuUa5yorXc8IM
	jUrFJ4wRDF8/q6C6+xg/O/UVaZPR/+O26cqRfrOb0rjmolcvzwZPphZHWnQt2R6C/Glpa1/yDhT
	dtNpEFmC/4EaTk4RdPgTLXZrqQHl0sRz/Rfni8y57qSmgxOvr3Y44ltwyvsnIt2K8AWIFP1facu
	yPlZPBcVNGcM6iCezIqCV5IAllXULBUAC2OEfSHgCOpDT66qcyo0yd6rxmX4XrtD8fQrQl0Cfun
	v9BIE91e2Kk+NZ2smEQsXubGHWYgJqGSDhZoJyIT5ZGNDOl04eZICMAJ/R9Xw3y8rWOuThhPWcI
	Vei1sTvcgFoVKDlPoUn7AZ4kqwKec0b4orjGAk0e+NRr9+QwlyLVQzYyS9/Plcud4PO7g4u4=
X-Google-Smtp-Source: AGHT+IGcTClS0HlsuLDMWhbFrqidSZrUXl02eHSOq8Iap1JzeM2KzxLgijD6DBQiU8k1adtKZOCVWA==
X-Received: by 2002:a17:906:c10d:b0:ae3:63b2:dfb4 with SMTP id a640c23a62f3a-ae363b2e17emr1568424866b.27.1751364728984;
        Tue, 01 Jul 2025 03:12:08 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659e12sm832466866b.40.2025.07.01.03.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 12:12:07 +0200
Message-Id: <DB0MZCUM41RA.7Z6461I531VD@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8350-pas:
 document SM7635 MPSS & WPSS
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
 <20250627-sm7635-remoteprocs-v2-1-0fa518f8bf6d@fairphone.com>
 <20250701-melodic-courageous-mussel-0bed22@krzk-bin>
In-Reply-To: <20250701-melodic-courageous-mussel-0bed22@krzk-bin>

Hi Krzysztof,

On Tue Jul 1, 2025 at 10:12 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Jun 27, 2025 at 08:55:42AM +0200, Luca Weiss wrote:
>> @@ -91,6 +93,7 @@ allOf:
>>        properties:
>>          compatible:
>>            enum:
>> +            - qcom,sm7635-mpss-pas
>>              - qcom,sm8350-mpss-pas
>>              - qcom,sm8450-mpss-pas
>>      then:
>> @@ -142,6 +145,22 @@ allOf:
>>              - const: cx
>>              - const: mxc
>> =20
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sm7635-wpss-pas
>
> Everything fits better sm6350 and no need for new if:then: entry, at
> least it looks like.

True, that seems to work fine as well. I can add it to the
qcom,sm6350-pas.yaml bindings instead of sm8350 in the next version.

To be honest, I don't quite understand what the concept behind the
different PAS bindings are, when an SoC should get a new .yaml file, and
when to add to an existing one.

Regards
Luca

>
> Best regards,
> Krzysztof


