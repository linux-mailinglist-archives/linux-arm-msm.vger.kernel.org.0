Return-Path: <linux-arm-msm+bounces-93496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIZoKShGmGngEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:31:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4166C1674C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 587793035AB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBE7330D29;
	Fri, 20 Feb 2026 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4NHgTx+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E740A33121E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771587101; cv=none; b=JyGL1jodMtISiPThafdEzMh3Y63kdp4v3WmCmbZ2btQFrYz/0zp8ckKlYsHL2LNNf+DTkUJFPfOrGVuZ/869yuh8+NKK/X2s72q9OjJkuUWI64nRDvvoYBlVNsZihahF1bV/k27E6mCyTBlZXtqaTKkibwo2GCbdgTtaP5nzt8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771587101; c=relaxed/simple;
	bh=dL95nES1PvUKDwOE/SzRBysmIFe+L8zYNyzvl+l8sDc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=iqYEHwGcm+eDpt5ZrLqPQfGb5tVWgMEkoazzTppaQcfG5UzvjZjyYJgEbXjQuAQU3Au1G9o5iDTZMOBzWt/2ogQtE1EJLQd0ngkWBhpivvVVJ4LZNOnpxnaazuuUoHKVzfSdptqzz3wr0Ac+tvuy4A6c5XPB2V1Kq6XEv8y5i1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4NHgTx+s; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b88593aa4dcso279904166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 03:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771587097; x=1772191897; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGfuKGhv7t9katQ89dFkhDx2tsJCNlvP9HCnVuHq6Y8=;
        b=4NHgTx+s20DfwneSZjvrzDD9fpZEe4W9UVaWa3uDZd2yk7x5f4ZTJ2hrX1qyF0rwc3
         mE2i9g1k4aAN62huoSVqZQQ0r+G0luFFPtWcpI3zpUy3sCk0XoB9SbVEEucFQx1a3eRc
         Dz6UavddF+3GheXjgWPgfRWV2pfEF15PH6fVPFZMIJD8GSdjbbe0T0QISnMvY2UcFX9H
         8wwW35tTTD4Lla+gGXF8YhCQikEEAYZBtyHNLPko8J1VOThanka0vu46lcMm9DLdrou3
         YThe8BJzfkBGvXdHdirakJDZ+hY3fmjrKml4+DGyFks7S5wc1vZyjSbr6c5Pz0jZAUil
         qQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771587097; x=1772191897;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGfuKGhv7t9katQ89dFkhDx2tsJCNlvP9HCnVuHq6Y8=;
        b=c1z4+Jve3b3U5v0Dp93tzwIwilJn5yC1YgE1d6Qzp7HeSJMRhO1NU4wnZ33uHSP8s7
         edkJozvy+G2mqF57FWAsmcr5vp4BMHEErOwAudFE2AM8stwmPk3VRPwsFrgypSXC/2Cj
         UhBYCpt+gLRHMDiRhpQsEE/Vu/hYYJldkVRN2bJuuXN55nqNzKcMhrI72/Nf2t3Mt00d
         1HpSOFINd30OltYoy7PH7Q6k6hEkdQ7TYAewZmXZ2EAEZ7TGdH60Oc9wM40DV3+z1RqV
         qUeO02io2DsezTgm/2Ao9ep5eW9KQmsRYgKoC2gJNDXiPYPlUI/i2eHD1NW6xoNq02sP
         FHjA==
X-Forwarded-Encrypted: i=1; AJvYcCWLv/6TKz0bWmpdJeA7PZaeehO6Ebr1lER1Php6I3rJQws0FZSPFpGajA0yVtjlvOaAe/x9p4YKK5LQV3XP@vger.kernel.org
X-Gm-Message-State: AOJu0YzjmemVzApPtmN94fW4rgtM0MY3WbU3F6Z61BcFij2ROdeQzUOC
	njjDmJtYFVeqDqeHIq8d0XpomAAcFInpPDucV+c4g+DrKpPYT74GJjdriSmfd6N7ZSU=
X-Gm-Gg: AZuq6aK8Uxa4JuD+SQzHjzGepbsj7firjHoJMVmqoCgue3NrULaZcnhKLpCugydm3eo
	U71VbBcSRjDM5STXnNObk0T6Ml5NRDrRKSDn1DqjVn22OGgQVpgKNeKQcQuJKkiyjEywbPHdcq5
	pbrD37PBxGlWzHErfhMCnjT/HoI7Y/J6W3h01xpiXgz7Y1NFAimauYmxcqli20oIAN3xSeO5xTf
	s8Gu1QUSSDGGYffRIKOwZAwPdmwaTYOHS/S3Veay2XsNtcU2jeHx+CNh2eUwR0dwu1OlU3JBLdp
	kaRqWkIbvjya/BQ9LOvUFQG0jJElKv7JzB3HckMDAQc1pkZjTsmnReZqfptmPSiNMqjuD7Vk4jw
	OO/gd2B7TiS8DIGYExgsx/XiNfH8m31VG1sEiJtjzuQVSLXb4K8jTfoNjuN1v7O3GO6qKmuAnxv
	Y49a4Kc95rAK8Gw7Lo3sXqBFWYH9LPp0QOGYtw/8wAgNzWAAphORVJKoBzpYCbB1wyEmpn
X-Received: by 2002:a17:907:728c:b0:b8e:8874:8384 with SMTP id a640c23a62f3a-b9072e1eb1cmr91962966b.4.1771587096917;
        Fri, 20 Feb 2026 03:31:36 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766531asm666569166b.50.2026.02.20.03.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 03:31:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 12:31:36 +0100
Message-Id: <DGJR7OIPI2ZS.ZTJ1IJWB3Z61@fairphone.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Laxman Dewangan"
 <ldewangan@nvidia.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Jens
 Reidel" <adrian@mainlining.org>, "Casey Connolly"
 <casey.connolly@linaro.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] thermal/drivers/generic-adc: Allow probe without
 TZ registration
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-3-fe34ed4ea851@fairphone.com>
 <aZg8ZqckhGbvkdel@smile.fi.intel.com>
In-Reply-To: <aZg8ZqckhGbvkdel@smile.fi.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93496-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4166C1674C0
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 11:50 AM CET, Andy Shevchenko wrote:
> On Fri, Feb 20, 2026 at 10:19:07AM +0100, Luca Weiss wrote:
>> If the devicetree node is not referenced in a zone under /thermal-zones,
>> devm_thermal_of_zone_register will fail with -ENODEV.
>
> devm_thermal_of_zone_register()

Ack

>
>> Since the driver is now also registering as an IIO device[0], allow the
>> probe to continue without the thermal zone.
>
> Isn't it dangerous?

Why? The idea is that generic-adc-thermal is the middleman to convert
from one IIO input to one IIO output, and is purely informational, so
that user space can get some temperature value to display somewhere.

How thermal management will be hooked up in the future to charger
drivers is a bit out of scope here I'd say. There's not even any cooling
support in the power supply core anymore, that was ripped out a while
ago if I'm not mistaken.

>
>> We also can't use gadc_thermal_get_temp anymore because we haven't
>
> gadc_thermal_get_temp()

Ack

>
>> necessarily initialized tz_dev.
>
>> [0] commit 3762f5851ac5 ("thermal/drivers/thermal-generic-adc: Add tempe=
rature sensor channel")
>
> You can make it a Link tag:
>
> Link: https://git.kernel.org/torvalds/c/3762f5851ac5 [0]

Ack

>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> ...
>
>>  	if (IS_ERR(gti->tz_dev)) {
>>  		ret =3D PTR_ERR(gti->tz_dev);
>> -		if (ret !=3D -EPROBE_DEFER)
>> -			dev_err(dev,
>> -				"Thermal zone sensor register failed: %d\n",
>> -				ret);
>> -		return ret;
>> -	}
>> +		if (ret =3D=3D -EPROBE_DEFER)
>> +			return ret;
>
> I believe it's better to return all possible errors. If you see the
> similarities with regulator APIs, then use an explicit check for -ENODEV.

Sure, will update this.

Regards
Luca

>
>> -	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
>> +		dev_info(dev, "Thermal zone sensor register failed: %d\n",
>> +			 ret);
>> +	} else {
>> +		devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
>> +	}


