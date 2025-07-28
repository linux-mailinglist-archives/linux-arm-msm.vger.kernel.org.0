Return-Path: <linux-arm-msm+bounces-66819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7CB13771
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B871895789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB02236A7C;
	Mon, 28 Jul 2025 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hnRqEenl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97C22F74B
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753694694; cv=none; b=PUaESuO4bdFN9i2d//UkstMNSzWe5agELGenklaqG8pRdvx1iTde2Zrvez7rcEMAvzhRNKHQAOBiJ1ec4nl2TWlLjj3Chdzwnhn8VhvxVTojvOluGNqDnnp4fCrxAigMuBunJWzYmWf5yfLKFg3syTvWFTWdR7CpaOQ23A7gvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753694694; c=relaxed/simple;
	bh=p7SaI3KRq9+LTs81Ai4ENBC/+OQ8Fyl2MN4HlWaQG8E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=T4USV6fz9ipFQ/lBVqQmY0q4qTwasosrbRflvty8jL2pi13V0fHkb/yqKTaR++oGPTJQTcSwt1jqb5KOSWtkzZiUGMiVjmMYBhbozV/SDkXUaZMQqAiueEpLp/5/fz4h0+2FK7IXydiHgF1eC4bc97oOA6wz4vJg+g1vqtoF3LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hnRqEenl; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so819635066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753694690; x=1754299490; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7SaI3KRq9+LTs81Ai4ENBC/+OQ8Fyl2MN4HlWaQG8E=;
        b=hnRqEenl351V0jKU5o0FexJPeykocfKZRvqd3XPdnk3WxuWZwK00bVDgumZlsDIuYA
         qZBZjSv6nK4+/lxPc5uQC+3mJo0azz2pQMt8MS2MFmThRbPXSOiBQPBSJRH0R+rcay62
         2hLXp2wTfLHQxL+CJMqWzNRo/90jUrmwlLVfMC0kIEOtDk5qQT3p13mJEG6WW6ZT6NhT
         sbjSd7OUW5whJBGK3H09wQLtbxRJ+cMOhjckpcwt9x5oogSr9YA1k51d7HI1EHDDDz+S
         GuZtAeqhdxjNnC0H6GqZbWsheZ00/JaiyAubXrB6KWTN72i7o6MQ14blYwMBf1V650sC
         mBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753694690; x=1754299490;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p7SaI3KRq9+LTs81Ai4ENBC/+OQ8Fyl2MN4HlWaQG8E=;
        b=ROhOFfTcsdaScXgFcjoP4q2yGu8J+OljlpPD/z2eDpLBKwNyhnCtg2iXuC06whEFzs
         ++oHD2gq1eRq7VforrTAHfgI7GtCoAFklJSPj8FNNwo7Dvz4Rm0vy20fmSUhr9xR/LwQ
         7lHXHkHPDsH+Bq8bz0qOC5f8UCafTLgRwVyCrMRDop63KR2703ZGkxXIIipfPw1gAToB
         JlNJqJ0tsi0tHL0l0dsrSMaYk9z7a+LR0OAB67aGvg6kVX0ylaUoiufwoJoIDEEf3MRZ
         CU4+LgR3wwpuwAHmSJh1NmiUQJuMUp4jt/01SvgMnsYOWWIEjhifG10LnDgg1F/+DExg
         Jf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqMG8QTe8azp085HBc5w3cQfdE4MeXVG9va3jqoZQuk5hIsMDFw1UTQz5/tRMvDSEpqJ1HLaqIgejrWyjs@vger.kernel.org
X-Gm-Message-State: AOJu0YyMm2WSJeQn1k0dY5l4eZq6pQrFdFmmfDFq+QosLF3yqKnBUuRN
	DsssHcIPi3o/lgcE62iimkijK/7TkBH649sJsCdnTk0gkv1M137XsaKsss1vPqAe8i0=
X-Gm-Gg: ASbGncvLIG5EoL+hC31W+MOzxJQmXLyIq5RM3mLVOXEIZ+3wLYs2AjIjwMa9UrfQSQc
	l23m6xVhjadZjTkc9GwexQpOFSN7DMTkhnYyQczQAovAm8i1brPaPYXmzhiW1lLMtWS7IlDkq06
	/OutqKdBXlRIxT+Gw1zugrojpnosXIBBkfpwi2VfthLyIJBotNJm3KJwt19+QRmTfMS92w69+aF
	cHTEc+rm6YtlWzfKg4p9P2QnqWYhahxnIRI2RT1B/XRj1UhJdXzlzD3EfE1VKvDmSXOkx+FjPDF
	KrQIOwqpZljrbBVK6aX9D0Hyij+XSjS1OTCU1T/CXPTi/GrusF9JbNhhOp3E7wG0FWy6uy8QCj0
	t8OPe2rzjx9boeNBjpdyiu5RzrPqkx7VbIvqg5OxhSH7jxEjrGOJ4La+X1qJ/E40chuI=
X-Google-Smtp-Source: AGHT+IGk6lrYnsZId9mCE/cRiQIVZNKCJUyZ+AEWNPRvXM5N0BY5nsGMSTWyTaZBxtJaa8J1biPu9w==
X-Received: by 2002:a17:907:e2c5:b0:af2:4429:206b with SMTP id a640c23a62f3a-af6190f8b0amr1131320966b.33.1753694690008;
        Mon, 28 Jul 2025 02:24:50 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635afd811sm384349466b.136.2025.07.28.02.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 02:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Jul 2025 11:24:49 +0200
Message-Id: <DBNKVU7OQHNL.12Z6O3PI6SHGU@fairphone.com>
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Cc: <srinivas.kandagatla@oss.qualcomm.com>, <srini@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
 <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
In-Reply-To: <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>

Hi all,

On Thu Jul 24, 2025 at 4:24 PM CEST, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 03:31:50PM +0200, Konrad Dybcio wrote:
>> On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
>> > From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> >=20
>> > Qcom Slimbus controller driver is totally unused and dead code, there =
is
>> > no point in keeping this driver in the kernel without users.
>> >=20
>> > This patch removes the driver along with device tree bindings.
>> >=20
>> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.c=
om>
>> > ---
>>=20
>> I *thiiink* this is apq806x code, with 8974 adopting the new hw.
>>=20
>> +Dmitry, does you computer history museum require this driver?
>
> I never had time to try enabling audio on IFC6410 nor Nexus 7. But if
> the driver would be actually useable there, I'd prefer to keep it.

FWIW on the WIP msm8974 audio branch (from years ago, unfortunately), I
don't see "qcom,slim" compatible being used, also with no change to
drivers/slimbus/qcom-ctrl.c.

That branch is using the compatible "qcom,slim-ngd-v1.5.0" for MSM8974.

So at least for my museum collection, it's not needed.

Regards
Luca

