Return-Path: <linux-arm-msm+bounces-92000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP70L9C6hWmWFwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:56:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2798CFC501
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E81153005D04
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 09:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947E52FD698;
	Fri,  6 Feb 2026 09:56:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618AB2D97A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770371760; cv=none; b=i2F6F2bjiZILGmf9Xa/CescN7qaGE7Aiaq5m+VxjincNMu0v77XvYpXrQYfhdFJo4hTdIWolWymllNbWKk/MUHB8LkmSwwka9ASxl6hK5mhbG7CiCPAFsd7uk8Jcr3mwycwEC2ex/N8c5DjDxHTRWfY3zVh3BRKu4uXux9c/yBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770371760; c=relaxed/simple;
	bh=ks67mbrW8VtB8valG/0Ic4q75jghFnw4wLHJ2kUJNVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xsf9KxI24t/DNFJyQ0hETVNQ3dDpdyWFi+y5RROo20XCY8hq+tje3pkIDCThsxHfXx2LjBGrvRZeSEWGWFGbv/HlIuZPyh3P7HL2LM4gL39tS83fT56f/Jo8vhweUd1GbK0f+8HqsUtfptF3n7gND4IDIQhZ+1k+541NB6vcrHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649e456e8a2so2014596d50.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371759; x=1770976559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdgOyDhEf0Ql4u7mAeWkE+P24j2qd6iwdl54FBHXLek=;
        b=Sbalu6hj1LSX3f8cL3SiCYeD48/RWDtgbftPht5hTzVhr0CxHHrl5+MVGSuFSwqQAe
         7tF3OlLeAA7zC42LSausJnVwEiHkxnG6qJmpVjdfuqUuRY+9gUKx5GYaYZA3Zfcuqe3k
         8dt/k0lct75jVuh8qzF2YlI9k3VteMHCt8rsOnbZD3+wPTLWZg1mQDrzqAQ8aUYlah5+
         9wlPsOVi00hNJIWCHtzueGUQqBrMPaNjb1CwJGvyUcEilJ1uh7yBBoF4G3XxRTyRQjIw
         XYjhAt5PM8S3nAQzEo0gIvKxBNG33v57m4EfbpU1596TyH9E0uTr6bf3hGionUyCYitu
         s5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVR6g19pTGffbOff0qzNCtVIMLdL0ZXhYd5v77aezNL0NvxtVjRQUH5B30ZrJkqusBHXBPaSfFjSm6f/GsR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6d9+hyaF/lGtsCbqqZyxAZN8KFFQOVAXlxLz4RhTARqAM0t4R
	MfKnmbVFoLxmTbdLnthNxLoO+Yh0el4oHWORDNUAmlwYeyxyEhETa0xEkYkgbg==
X-Gm-Gg: AZuq6aI2bksG+AUQAwHObHTLTNdy2g6mFrGlsQiSxzl2vkOR1DgtBYJDhX2wqlOwtfm
	Ds4gbTz4K94oZsV9OV6kqD1PmYZ5HXVgDNCjgwWONpJHOamrEr7e0fisBqzbB3ePF+kD3qQQTnl
	fo6Evrl7zZcThDqSJ25oy93dTz+MfEWatk/Gbi/rMV7RPoziuaIEsGi47rfTQ/FB741EzDucJnQ
	vXMXW9MtEYIS5kqeuIYgGUveVjkxxzAYXwRuY9z35+CpdfWk/HE5kaxFM1Qc6H2jzTCxA7b9CfH
	LWnPyj9+mOggI0oNzUlYWms68pxVDE94rf7c+a1dj6G4yDum7h2X8DYbZ1LofAFvrtX6/ucKmES
	4Oh4GIoQPw1Y4YAY7Cwf7162AfeavKFYCqRFZnJvVe174dWjzEeyy0k/lYpyvaIT2incyfdzJ4v
	1clptJnr7aO3ISxg4fPQg4bNMUjbqhtyOGVtLy9pTxAK4iLatHo/hIS7F/
X-Received: by 2002:a05:690c:9b01:b0:794:71b7:2adb with SMTP id 00721157ae682-7952ab24f48mr39242877b3.38.1770371759384;
        Fri, 06 Feb 2026 01:55:59 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79620af902dsm5201597b3.55.2026.02.06.01.55.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:55:58 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-794baacdefcso18913117b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:55:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUc5Bw5qtANxDhBe8loRMeTQnttPlkU+Ulzfxwq/MDm+YqDI6SFVV9kER8TBUGm/WAK4oEA8594kPQseVn7@vger.kernel.org
X-Received: by 2002:a05:690c:f87:b0:78a:722f:a7c9 with SMTP id
 00721157ae682-7952ab475cemr40723177b3.47.1770371757993; Fri, 06 Feb 2026
 01:55:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com> <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
 <d398cd57-41b8-4646-834e-ff0c0b7ff749@kernel.org>
In-Reply-To: <d398cd57-41b8-4646-834e-ff0c0b7ff749@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 01:55:47 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=kH4Np32xZdp+jzaTo9TMjtLVRD+xaimuKWxdag2Whew@mail.gmail.com>
X-Gm-Features: AZwV_QhrV8RX-a6BnCE5CUXFoFNSDC6T2mgiJ6-BcH7orNDWWzI87VJPeY7_zio
Message-ID: <CAEQ9gE=kH4Np32xZdp+jzaTo9TMjtLVRD+xaimuKWxdag2Whew@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92000-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2798CFC501
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 1:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 04/02/2026 10:20, Konrad Dybcio wrote:
> > On 1/31/26 11:31 AM, Roger Shimizu wrote:
> >> ---
> >
> > [...]
> >
> >> +/ {
> >> +    model =3D "Thundercomm AI Mini PC G1 IoT";
> >> +    compatible =3D "qcom,sc7280", "qcom,qcm6490";
> >
> > You need to add a board-specific compatible here, see:
> >
> > Documentation/devicetree/bindings/arm/qcom.yaml
>
> The true problem is that this would probably fail validation, so I
> suspect this was never tested/checked.

Thanks for the review!
I did test this device-tree with the board.
If you mean some other test, please let me know in detail.

-Roger

