Return-Path: <linux-arm-msm+bounces-67927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEB8B1C88E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99EA18C342B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3B628FABC;
	Wed,  6 Aug 2025 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Gw1k75gR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F19E28F53F
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493637; cv=none; b=VCBp2CwwSyAQ1q5VF1Ac0DqS6yr6Frt/kGeJWskxD4+kxwQOKjzFO2VauMS3hPC14hy/csnEIA1xXNrXViCrVygl5+vN6dMHp5nN9ar6jxBaX4hlk7ABAxTAz+yfDxUZUZp21G+8sk+dsB/yDFzpjmGnMPbI3WMHyByWZtotjv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493637; c=relaxed/simple;
	bh=THJ4mY6JP9KzINol5ozU48RD2OdXbU6gAFvUJe70Dtg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YnrBQ/ox56zvl4pXpxYsQZVGyhTzdJGll+MWl+22PgT8x0NSj5TNcWofkc8OOKPz8MRcJpJetqRWKnPNHasLzobxi9bfRJpMpraGcq5CkRDDuQ7Woy3hc0UJiS1oPMQoR5CDuK8HviNk6eCIboV4vC43NaLPMP8G5bKstc93yi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Gw1k75gR; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-61557997574so10259743a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754493633; x=1755098433; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Zzi1nGGRA6XzeMW1fYOZMZYBNySqK5zZKNEMrIG1tQ=;
        b=Gw1k75gRHdeOS4nYwMld9weI1h/fRv528ATi+0VeTQygCopcVpUzRD3YbZWV/MM5Kc
         axvmf9/IrkqDXgUE281bOM2dRociS+cdlxeSAr1f+pzd8YkRWxDMjIrU/15LSGcVpQ2l
         mDx3x6wUsrwwPY/lGMPZ5oWlaA/BPjKiKrTR+PJW/p3qTBCrxrYSSWVhV6w+8DgWl846
         5snG8TQwQam9sKzWxxeXWR3h1zs7BJ+nw0GUjutSWK6DcafCDF6bXwQ74gESJmBmIIed
         GoaeOp+lZTrQwMnEc4EsQ9Lg7EixKjrWjbJWnO8sbrQmhg83tZdv4guM0C6ECtvXaMeH
         tFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493633; x=1755098433;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Zzi1nGGRA6XzeMW1fYOZMZYBNySqK5zZKNEMrIG1tQ=;
        b=HhuyZBbUPe1V32t5u1nErJ40Hzv+5mavi5deqt6JBYYeQZu6RoMBi/J+CCmEq9CLPU
         wbPpAl04uy+5VhkKArIuZEdMdDWDgmdEvV1fngBQb1LgK/++ECD/V8B8N7bnZ7vmYDL/
         SscIuSNN17H2APIPNdM9flWU8V0hsYngKZ7HlNWi1oriSkNb5PUKKTEdnINnKDws7yjX
         /fvDiUKvCt4CzljVF9esg8lDyxqV0x7Df8k+8P3zYnPKFQKCWGx4IAcdiiBF3JMZ4rHl
         lQOUJnWtuGpxoz2Tw+q5PzS/BEY5IuiUfHgsh+wG7ZnzCjlP1Ad0I1D40drL33IqKtNB
         tooQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx97ouXGJ6QeQnx4ghfV7jOwwkhSuvH7A+GL4E/eGrRn05k+/tncIRHngbBbBf9j4ZfSBNsY+QanKrF9bd@vger.kernel.org
X-Gm-Message-State: AOJu0YxRbKDaPZyiilkLbyl1RQhlqQ/WQ/sGYx26kQ4WKE2zvkhZdk1M
	Xot9rhf3B7r9dSgSDfk079LfaC7S+c01ifILQD3PUbjIJPEtgGO8O3R2o3weucF6WE4=
X-Gm-Gg: ASbGnctbb06U0vs1vamg+HpSBMDSnVYy/VRiUuaxMSEMgSFAP3qhLU8Vex2tNQohrDg
	dCg6sF6wDVs4gsIFFry3Q2k4FaQZ8rCzSUQO6UJvg10xmVHPqscbhZ84OjrGIykgaQS9pSLpGkQ
	OOsLcr/6/Duq5KSaTJUYIfxdY+kJzwaJ1NKmptRCFdi59l+ubclOqtHv3oDswCbyDzC3tU/Ys3B
	OZjwkWs71Afpz0dXsOUZ/I4mGpInmy90cpHqv+sjr4X9yW0ZiK1foQ5xq9BC+jPfLfhyJEPznNv
	BygpWuYBKufySh6onetqJRKBxevdm4bpuhwmV+fJOPt6d+apa7F2ZjnlPGzbTK2IeytIdiviW5t
	I23lRLTi8M0qWwLrA1gt0A5w5QAiz+ShLCCpnpqVzVBrn2aYi3o5xVhjrG4J83sKHaI4=
X-Google-Smtp-Source: AGHT+IG3qV4kZGqVo4ZddiejaabwSclW0B+23L/UCpPE6bS90enQp5m3ugBwQEPInkFSiN2kcHunLA==
X-Received: by 2002:a17:906:c10b:b0:af9:71c2:9c3 with SMTP id a640c23a62f3a-af99034427amr353234866b.35.1754493633472;
        Wed, 06 Aug 2025 08:20:33 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23bedcsm1118814066b.120.2025.08.06.08.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 17:20:32 +0200
Message-Id: <DBVG33X1DW3S.R29ELIG25SN3@fairphone.com>
Cc: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Griffin
 Kroah-Hartman" <griffin.kroah@fairphone.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
 <20250806-aw86927-v1-3-23d8a6d0f2b2@fairphone.com>
 <581aaa8f-9e08-475e-ad23-3369fa05e53e@oss.qualcomm.com>
In-Reply-To: <581aaa8f-9e08-475e-ad23-3369fa05e53e@oss.qualcomm.com>

On Wed Aug 6, 2025 at 5:13 PM CEST, Konrad Dybcio wrote:
> On 8/6/25 5:10 PM, Griffin Kroah-Hartman wrote:
>> Add the required node for haptic playback (Awinic AW86927).
>>=20
>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 18 +++++++++++++++=
++-
>>  1 file changed, 17 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/a=
rm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index 4c6cb4a644e2..9576efdf1e8d 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -866,7 +866,16 @@ ocp96011_sbu_mux: endpoint {
>>  		};
>>  	};
>> =20
>> -	/* AW86927FCR haptics @ 5a */
>> +	vibrator@5a {
>> +		compatible =3D "awinic,aw86927";
>
> I noticed the suffix is absent in the compatible - does it matter
> for discerning the particular chip and other variants?
> Anyway, so long as you and the bindings folks agree on it:

According to the datasheet, the main name is AW86927, while the part
number of this particular one is AW86927FCR.

I'm not aware of any other variants of the 86927 though. At least for
some audio chip from Awinic there seems to be different variants with
the same number with a different suffix that have a different amount of
pins, but I really don't know 100%.

https://www.awinic.com/en/search/all?titleSearch=3DAW86927

At least I don't find any non-FCR variants here.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


