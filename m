Return-Path: <linux-arm-msm+bounces-80102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44016C2B993
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 13:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24D5B4E5D48
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 12:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B4D30AD0C;
	Mon,  3 Nov 2025 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zC9ft3RB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9930ACE6
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172235; cv=none; b=BP346NDqmVSEO9YWjnErFmLMaRxNhIYoAh0gJBy3TUTHNUFJhyPipLbjH542ivb09ls7i2/UY3qIaovRG9aU9swlzknrNLANofTwgIKTeaUDLpoyNB4Ov8psUfiOOI01UEj6mM1s5tyX5ubuojrt9RncnADjhyDLacvOvZh6xng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172235; c=relaxed/simple;
	bh=N6dzLqWRKXo3vdjPNtp4WU0RNAGv8JDAOdUXXVowYMU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=foIeBkdA+tCjDJbt1PIrg3jgd/jowjb3M878GRkKWxCOhWXD+nX5Z4S/IcJUrxS2zzcbr1xDvNTBhE7Iro5eTUg3r4ycNfMBuwS8fxWnbtUNK11bLYTI+TRquiGiigZ89qrIaGrOeQQop566lgNVbv2KEm6Vg8oicALQe55FkzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zC9ft3RB; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso836045266b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 04:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762172232; x=1762777032; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNjT7Aiq5Dh6jiEB8sw52p14qgaFnxeV2nRWidKXfx4=;
        b=zC9ft3RBWag/V+c4hsCUTEoIz0cffEe3V3R2CDajBFXXkVe2pm0bDhvl7lNKRLQIrq
         spwO0fb0gLqktktSW3Mh1iTK/dS6rW582Ewl8JrbaSsAbE0syaRN+BM4SJp0d2g6ZlLq
         2xl+67Dod/VLo51R1ncoCrhoCyaCRxsNbFAlqi0CnOKodq4xLsNlEfAxteq87mULbxPU
         OzIf1wYjaaRE6AXA8Ery/wcNRvedXLjPlxS/Fue98UAVeo91zmq+yjk4bVAFzLufeF01
         WdoES5CFbHlIhtxgm/lAyDMnTYR2zJHlSk4unA+ElbdgpUT9OlSj9GjCQu6AGxZbG15Q
         jMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172232; x=1762777032;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aNjT7Aiq5Dh6jiEB8sw52p14qgaFnxeV2nRWidKXfx4=;
        b=g370hQQ31KYBXTuLbKWgWLDqlj0JRXTCve7PjG5drj+uuNxzcZrqsYt2c8iE0X2Ud0
         u9YV9xUnJ2OGIFs5nLWef2ze0G1Pj4PajLkhOEkFNRhU6T4qWTuXNX5HVbFhJWt+lNP+
         nknObe4jQvhtnLbjDf5kg4popOwGS5HPCUotFVT71dC6l0t59KlyvGKhWPCUQUidXeUk
         xhjXerIFPUGZGzC7XPqysC7RrlDTFAWzUpESxi3Dh3kFGfIxoKm9uB9JsgHf/tURUCg5
         FShIr8rdOryLdiyrm3y5GLS+4UlZVngAIbP58FGHQcyAsLo+q2MvNy8kg+xALAEKDcCU
         8UqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Dgma6pOvmkmni514ArzhDaL6fz9ILgPDDuIbxAtpvn3JG+w+Vj6mhmqkAwOMYcvS630NNPoFEYxIXWVI@vger.kernel.org
X-Gm-Message-State: AOJu0Yya1CLtOjkkAbLSgOkqM0B6vG2LG5DZ3mcumcDqTp0yrc26BJBf
	sSuGq2fODJMg6Kprq+DqIAjO/F/IfczFRNz7KqW8DnNrfKbmYGjN0UgLwQJTt4gXZRE=
X-Gm-Gg: ASbGncsB5ECiBkdmtDg8+E5vb5HjQhn9J4wVpVj3WT20dKS3a0OwwT6hx/SrJIlI9ZP
	6P90PKlljkClLedi16xQPW+gXp5rBsM+i+mTUs7d4Bqj8N2np0zkKZQg8sCbCYHZyHBmZBkwF99
	jAvi7LjeC3LZW8RZFP6C0eZ+DdTnA7nwfPWStEHQdmGlC+ctaHxbO+e+o7AZU9WOy2+cFJCx61+
	TQhkFskYe8J/3g8F0ZwXc2xuQ6lsLvKqdpm4dFb8A8GCJees54KpWCqie4gu1XtLxmkKbbPWpmp
	IxoF8Sx3biUjesSZmb2J+oOg1MsjQMKeD/XmsW5s+x6BjOeQlNuYOG873VER0UQYHHcjMicD9Na
	WVXeCBQyvBUQ/GXdNBHJLXJ+PwFoiR1pR+5V1SJXeEe9WDTSjgS5gZ2Hk2E8qUt63n3DDo9s++6
	BTsxAc2mrmAjulq4frWJOwk4vctOyfO5EdXkhQIa3G5KYzljArOZ5mrJm2
X-Google-Smtp-Source: AGHT+IEKZUv1KyQWAizLeoG+U9udqAbGU47hQIHv4aHNYJKhylIq0YUcjZYxg94xX07JT/Vlq4yG1g==
X-Received: by 2002:a17:906:f5a9:b0:b6d:519f:2389 with SMTP id a640c23a62f3a-b707083253dmr1286167366b.52.1762172231791;
        Mon, 03 Nov 2025 04:17:11 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70bedcec19sm332233966b.7.2025.11.03.04.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:17:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Nov 2025 13:17:11 +0100
Message-Id: <DDZ1X799V2KV.269J9YL1AGCIF@fairphone.com>
Subject: Re: [PATCH v3 0/7] Various dt-bindings for Milos and The Fairphone
 (Gen. 6) addition
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert
 Xu" <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
 <c93afd94-9d94-42fb-a312-df6e26bb2bc8@oss.qualcomm.com>
In-Reply-To: <c93afd94-9d94-42fb-a312-df6e26bb2bc8@oss.qualcomm.com>

On Mon Nov 3, 2025 at 1:14 PM CET, Konrad Dybcio wrote:
> On 9/5/25 12:40 PM, Luca Weiss wrote:
>> Document various bits of the Milos SoC in the dt-bindings, which don't
>> really need any other changes.
>>=20
>> Then we can add the dtsi for the Milos SoC and finally add a dts for
>> the newly announced The Fairphone (Gen. 6) smartphone.
>>=20
>> Dependencies:
>> * The dt-bindings should not have any dependencies on any other patches.
>> * The qcom dts bits depend on most other Milos patchsets I have sent in
>>   conjuction with this one. The exact ones are specified in the b4 deps.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> FWIW this looks good.. where are we with regards to the dependencies?
>
> Are we waiting for anything else than the PMIV0104 (as part of glymur/
> kaanapali)?

Hi,

From my side, I'm not aware of any patches that have any unresolved
comments, so I'm essentially just waiting for the correct maintainers to
pick up the variety of dt-bindings patches in this series, and the
PMIV0104 and PM7550 series.

Any advice to make this actually proceed would be appreciated since most
have been waiting for quite a while.

Regards
Luca

>
> Konrad


