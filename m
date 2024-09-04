Return-Path: <linux-arm-msm+bounces-30729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A943E96BE77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 15:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD6DD1C22498
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626E726AED;
	Wed,  4 Sep 2024 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODnadG+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8924C1DA2E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725456435; cv=none; b=eKj0T01uiZQVVDmv0cTLeEKocLcqW0PQl1KkpUT+x1rGQlwvOMGUtHaD/63VgPMALX7ionUvb90Vh4Bu72NEVRFwOPptOtZD8vl4Nt/601lBB4M/7bivZqXsygdtvplwpz5+02IrwugBl2oz/aDqhmCXostjdcDUzqAV5EDBym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725456435; c=relaxed/simple;
	bh=W2l2ceVRHS9n5UQas5i9KqqNz3GWJGVQkmoAWgh+w4c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FJAxulEdkodIZ25l5Zh4p7Xe3JMqxrk1PrECxEO+zfmuwLz7YyZAQpRD4GgC3WUhFErOdoR673HGTZSu4dQ26rZCGJZ2XAjnOfs6mV77+76PgPr4U12r11fXstAkzt0ADoTR3D26CnWo56Ywsw7rFz2iQ9rsTWmiBbwnqWu5HSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODnadG+2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f64cc05564so19816091fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725456432; x=1726061232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wPhsht4RSMG4cAcNFfFbtt+XBottqoozru65Pea+viQ=;
        b=ODnadG+2a+3y8Gplx2oVgq71/mrVgpvLN1K8JQTgSIgTDgjZ5XMNpcWKMoeAwNNzNw
         pUQSju09CRdSbkfHAWhd/LelQ4p6c3cfMjtNHtTt8pr5EA2b63OcGf6+9r0gnD/db5vk
         n++M/cLdZMrxq/bfujK6WUcz0lV+k8veqoPncNQF/Xju2IOiPy/9Oiqd7zNaXbCW4ohp
         UC3pBnDWZOGg7nVHDptwYgmmgWOECUCe7PHQv4ylAzeD197xvryuBA3B9dqEzOw4NRGx
         IZjX+qhV8lDv3O0uJs8u7jEWDmlWVyjd7MW6cDp0V9u3wvAAY+KyKDHol32SzcQdM7Kd
         t/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725456432; x=1726061232;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPhsht4RSMG4cAcNFfFbtt+XBottqoozru65Pea+viQ=;
        b=MMllGx35ldSEWEe6myOVKjlNiB5kCuCM551i3PQL33+ZWj5oZTWBw6wZDX5k+aEbPe
         Zy0FUvMRB8tO1IWKWQFNrpNV/glVskOLMFB1/ZjqgoZxTi020rt7SgJewJmbcNcOFo5f
         AAxikHartGbRrp88NdKGDfbjOYqgLvB0LIMQtVf+Hmtq4nggBmQyHHnO1syPgz87ZPMN
         cycWnzXYivzmc8umEirn3J3ET2noNYrPcJhrnrK45hl8zKNGzV2kwy1B5fnNWvye3T4c
         w7+P4RbSSAFAeGyH5kwjIHjT9YP9RE1NkFYlXL6uK9tiol2CoVvMzZ6GDefmASbsne4p
         HVyg==
X-Forwarded-Encrypted: i=1; AJvYcCUbaxx6e2t43gz18mnUWqAHsAbHeyMd39G3bq1+vzo9+6uS2EaMgOKrLGQzKvYOjrJBUkrJQr2biJfM+qie@vger.kernel.org
X-Gm-Message-State: AOJu0YxQpKK40HH4O+kXQg0HJEr/BBfXIVV3PyrN7+tqtsHhEfZlteUb
	qBDD8MpQrYXkovZbWq4uDnUIeGiC2e5bFT7HRa0jp0ardenhg0wxAZX9aKQzIfk=
X-Google-Smtp-Source: AGHT+IFUgUo5Iu1+R6NneiGoGIiNrQREOpD3FhDc+ENaWz8EYawCtNDxV3jfboUgQVd8f6m3vWeVaw==
X-Received: by 2002:a2e:d09:0:b0:2f3:c0cc:aa37 with SMTP id 38308e7fff4ca-2f64d49f306mr27046371fa.19.1725456430519;
        Wed, 04 Sep 2024 06:27:10 -0700 (PDT)
Received: from [127.0.0.1] (85-76-36-142-nat.elisa-mobile.fi. [85.76.36.142])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f660d96cdasm709781fa.96.2024.09.04.06.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 06:27:09 -0700 (PDT)
Date: Wed, 04 Sep 2024 16:27:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
User-Agent: K-9 Mail for Android
In-Reply-To: <ZthVTC8dt1kSdjMb@hovoldconsulting.com>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org> <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org> <Zqet8iInnDhnxkT9@hovoldconsulting.com> <ZqiyLvP0gkBnuekL@hovoldconsulting.com> <oj4qv5wdxymsgpuy4col2w5gabn6k5blybf2fmrckydjo6sftd@eppcqaqwjn5b> <60aa6833-7e08-4986-93e7-4790a8eb8568@quicinc.com> <CAA8EJpopAYp3Y6cW8B+2cVM=_oAnWeOqS6zygc4o7b+r9Lj1ZQ@mail.gmail.com> <02e3c217-490d-4051-8fb8-6bfcf322e27d@quicinc.com> <ZsbomSG6DXTfYxXZ@hovoldconsulting.com> <ZthVTC8dt1kSdjMb@hovoldconsulting.com>
Message-ID: <A06D652E-BBAC-4D27-9A6D-507DB8F8B153@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 4 September 2024 15:40:44 EEST, Johan Hovold <johan@kernel=2Eorg> wrote:
>On Thu, Aug 22, 2024 at 09:28:26AM +0200, Johan Hovold wrote:
>> On Tue, Jul 30, 2024 at 11:04:58PM -0700, Chris Lew wrote:
>>=20
>> > GLINK has a concept that is called "intents"=2E An intent is an objec=
t=20
>> > that signifies that a remote channel is ready to receive a packet=20
>> > through GLINK=2E Intents can be pre-emptively queued, or they can be=
=20
>> > requested by the sending entity=2E GLINK will not try to send or it w=
ill=20
>> > block until there is an intent available=2E
>> >=20
>> > Intents are exchanged with GLINK_CMD_INTENT packets=2E When Linux rec=
eives=20
>> > one of these packets we add it to an idr "riids"=2E
>> >=20
>> > Example sending call:
>> >      pmic_glink_send() --> rpmsg_send() --> qcom_glink_send() -->=20
>> > __qcom_glink_send() --> qcom_glink_request_intent()
>> >=20
>> > In __qcom_glink_send(), we check if there are any available intents i=
n=20
>> > "riids", if there aren't any intents we request an intent through=20
>> > qcom_glink_request_intent()=2E This sends a GLINK_CMD_RX_INTENT_REQ p=
acket=20
>> > to the remote and waits for a GLINK_CMD_RX_INTENT_REQ_ACK packet in=
=20
>> > return=2E This ack packet will have a field that says whether the int=
ent=20
>> > has been granted or not=2E When linux gets this ack packet, we will w=
ake=20
>> > up the thread waiting in qcom_glink_request_intent()=2E
>> >=20
>> > The ECANCELED comes from qcom_glink_request_intent() when we receive =
a=20
>> > GLINK_CMD_RX_INTENT_REQ_ACK that has granted =3D=3D false=2E
>> >=20
>> > On the firmware, when a glink channel is registered they can optional=
ly=20
>> > fill in a handler for GLINK_CMD_RX_INTENT_REQ packets=2E If this hand=
ler=20
>> > is not configured, then a default one will be used where all=20
>> > GLINK_CMD_RX_INTENT_REQ packets will be responded with=20
>> > GLINK_CMD_RX_INTENT_REQ_ACK and granted =3D=3D false=2E If a channel =
is=20
>> > implemented this way, then the only thing Linux can do is wait and re=
try=20
>> > until the remote queues the intents on its own accord=2E
>> >=20
>> > This would be my current guess as to what's happening based on this n=
ot=20
>> > being consistent and only seen every couple of reboots=2E A stop path=
=20
>> > problem sounds like it should happen every time, and we should also s=
ee=20
>> > the remoteproc prints related to powering down the adsp=2E The above =
race=20
>> > should be applicable to all platforms but depends on the speed of the=
=20
>> > ADSP vs the CPU=2E
>>=20
>> Thanks for the above=2E This indeed seems to match what I'm seeing as I
>> also reported here [1]:
>>=20
>> [    9=2E539415]  30000000=2Eremoteproc:glink-edge: qcom_glink_handle_i=
ntent_req_ack - cid =3D 9, granted =3D 0
>> [    9=2E561750] qcom_battmgr=2Epmic_glink_power_supply pmic_glink=2Epo=
wer-supply=2E0: failed to request power notifications
>>=20
>> [    9=2E448945]  30000000=2Eremoteproc:glink-edge: qcom_glink_handle_i=
ntent_req_ack - cid =3D 9, granted =3D 0
>> [    9=2E461267] pmic_glink_altmode=2Epmic_glink_altmode pmic_glink=2Ea=
ltmode=2E0: failed to send altmode request: 0x10 (-125)
>> [    9=2E469241] qcom,apr 30000000=2Eremoteproc:glink-edge=2Eadsp_apps=
=2E-1=2E-1: Adding APR/GPR dev: gprsvc:service:2:1
>> [    9=2E478968] pmic_glink_altmode=2Epmic_glink_altmode pmic_glink=2Ea=
ltmode=2E0: failed to request altmode notifications: -125
>>=20
>> I assume we do not want to have every client driver implement a retry
>> loop for the first communication with the remote end, so can this be
>> handled by the pmic_glink driver somehow? For example, by not forwardin=
g
>> state changes until some generic request has gone through?
>
>Has there been any progress on this issue? It's already been five weeks
>since my initial report and we're closing in on the merge window for
>6=2E12=2E

I have been on vacation for 3 weeks=2E If I can reproduce it on the hardwa=
re I have access to, I will work on it during the next few days=2E

> If this isn't resolved soon, I'll send patch to disable the
>in-kernel pd-mapper by marking it as broken=2E
>
>> And what about the audio service errors:
>>=20
>> 	[   14=2E565059] PDR: avs/audio get domain list txn wait failed: -110
>>	[   14=2E571943] PDR: service lookup for avs/audio failed: -110
>>=20
>> Does this seem to be a separate (but related) issue or just a different
>> symptom?
>
>I can confirm that the audio breakage is also related to the in-kernel
>pd-mapper=2E I hit it after 30 reboots with the in-kernel pd-mapper, but
>have not seen it with the user space service (e=2Eg=2E after 100+ reboots=
)=2E
>
>> [1] https://lore=2Ekernel=2Eorg/lkml/ZsRGV4hplvidpYji@hovoldconsulting=
=2Ecom/
>
>Johan


