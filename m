Return-Path: <linux-arm-msm+bounces-66095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F49B0DB62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56B84177FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BAC28AB11;
	Tue, 22 Jul 2025 13:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aua7JZUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DE51A01B9;
	Tue, 22 Jul 2025 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192131; cv=none; b=UWhqKmA4FNjlbIGKL4aCHjiZa17vsRwZTeIinJqXVWt/5PgPOnQ3R9px+g/WUElce5wL+GIuZFeSGXPCTnQ35e5Z1P0e4LEMhQDDCBODWfB1xY6DjvknB+xcBtLJeBgwxI8aULjE6jr7uYco3I3y+HRNq+0vTDUKK2mO4OokJwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192131; c=relaxed/simple;
	bh=1jvLzi+PABW8D5dB5D3oS0wH9SR2ZfgvF0LVM3mA5VI=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=TbmL3tdrqd3hv0CAghEfNqpNwKthpESHAtWSyZtptbZxIK3gMhN2cJYv0aaGfQNz8i1ABlX/uRgLkEDK8s/oOuKnWSZvoY91HN0flCcaqYSqxIs5QHkZLL/1Wzdphxrqy6LWdBY5iCVLaipM0w7XCQ+LbTrSytadjBdPdF/M3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aua7JZUA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-454f428038eso47687555e9.2;
        Tue, 22 Jul 2025 06:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753192128; x=1753796928; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ldRIZOo7b+ExrUWiM8bxC7vu6GZt+hWk+F7iitUy7Q=;
        b=Aua7JZUAejOB0fhZc2esGbTDE+WtOmLUTjM9vuNg8+SmLf8uB+dtBETdFJFsRl8CSQ
         fWNAtyhcm7MwtKND7NNdPAmNVo/P9QfFzVrPfNCm05sDG0Yyc5TPkrRMPu+JFw48fJYO
         gkIL63Kd6+HN4u6tq+IM+b9y/26YaAI9ZfcOpZI+ltx9ZCguYS6LyhAtRM9Gm6RWIDDh
         +3AsZCBeIXAFRNNn3n3JAm5QCLUjOOC9PHb8aGTMjsEhX+WRJgt/AiER5+NPc33jrsi2
         u62C1uR1BBT7NGuNBal3Th39Ff1WMXT9FEJPHw037QHBgFi+oBUSQbEcGZytTsMGHWrR
         jksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192128; x=1753796928;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ldRIZOo7b+ExrUWiM8bxC7vu6GZt+hWk+F7iitUy7Q=;
        b=EX1Q7cKHe1di/QVtylO0oNgkQPajKTxU3HurPB9qm4e4lxDAHArGRch8ILsuXRZSp1
         q0NvWL5isNOr3KIqfbpZBM82IdztcaDNAm8AnqFevz2mt418JY4OZvkUGO6OUNtFBLJ/
         kMcCbXHfSkPuWAJzS+MWtAImWAY7MbtZup50CMk73Zp1He7wxQ87NcZ2XOhMHXMvlWro
         cl8inUqAJSYRGXuHw5GtHSGf7YH0oXxu8Y1GF52+RDteV+sAMbxqutO/sNjCSEJhvRDR
         4sY7HhhEpgIPLrf31fby9W1gVj+urjDvm3rqEa9d3cvmNdl8y48eidIeTWl3k2W5/pez
         1dyw==
X-Forwarded-Encrypted: i=1; AJvYcCUImEnBc5737XxfnR1ZiTaH95tRf0y7ka9mTWZjpMsrfJT170Y3I9ifOxU+zT4TaOJygtHsSOA/MYC/mZm7bQ==@vger.kernel.org, AJvYcCUcztAvWa10n3WC5G+db81/wbkvCvWYtBivvIu6u6FkMDFw3Q8ZjVktkQ4HYNHamHZA79T+gRzMATPO@vger.kernel.org, AJvYcCUpSLM0rDLUYyFiIX+ebRXHlUIxwSgYphDvVvaOp0pseWoLCVI+FsB5KD51Lc03gp8V6jN0UTBDhgNqhbck@vger.kernel.org
X-Gm-Message-State: AOJu0YxE40wi4e2uSq16UANiriI1p+gUMtD/X9kBpX0dwUwmS5X8AztS
	8R49keNeande1ZsbdCNrVZz1zSCdsF69xZ4G3UvDHjQyhv3lB2iFFbsZ
X-Gm-Gg: ASbGncsOzg1y/Lu+mmA6RMRt43CfQOhpN4N8JLa/+s21QSJ6n9apdsevzor9WYAhJPf
	EbQ9fan3Qgpa546IM1fIjRkEtEXoLSt07QiMLVazr9HJRfmdRvG39pIXyS0stSw9lx6n1NIR4Ew
	QlxJ9+BdAVdX+vlMi/PH5jyubklHeGsbRVGX+osm9LPKrkG0fTHrU7L0wVOSiUSZw+MXq5BMdjk
	QDgKt1NA/KuUl2sPVrtLZjS8ep6NtKsrydk6MZ2MfSubaqqvkqxk4GQLT0mssLbG8SvzYmcCOfP
	oY3bgYSjrCz4yqk9HEedVP/oNF4PG5+7D8UyPbmfcxDDMkhBvubzOpc3x3QqgGiEceO4NOAuGAb
	gXXcuJT9lRzqafVsapGkj2/3hgWxk0/N0+trGYz7A22yst+uL4qrAJ0LuZwi0
X-Google-Smtp-Source: AGHT+IHOsD2HonrK3ieI5Sd51hJX0fvzUE7WJgdLvFb4OsH0yW2r6mqQo7lyaumurv4xcpwqbOBCnQ==
X-Received: by 2002:a05:600c:3496:b0:456:1b8b:b8c6 with SMTP id 5b1f17b1804b1-4562edaa066mr235088475e9.14.1753192127819;
        Tue, 22 Jul 2025 06:48:47 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45863a131aasm17025115e9.2.2025.07.22.06.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:48:47 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 14:48:46 +0100
Message-Id: <DBIMQO2CS0I3.17XLZPKPCVW2S@linaro.com>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, "Johan Hovold"
 <johan@kernel.org>, "Christopher Obbard" <christopher.obbard@linaro.org>
Cc: "Douglas Anderson" <dianders@chromium.org>, "Jessica Zhang"
 <quic_jesszhan@quicinc.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Rui
 Miguel Silva" <rui.silva@linaro.org>, "Abel Vesa" <abel.vesa@linaro.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org> <aCw9pYehCdfXXeiR@hovoldconsulting.com> <aG-QyF12rGY55gcG@hovoldconsulting.com> <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>
In-Reply-To: <d431435b-4ac0-44aa-922d-0bde126ca563@linaro.org>

Hey Neil,

On Tue Jul 22, 2025 at 2:01 PM WEST, Neil Armstrong wrote:

> On 10/07/2025 12:07, Johan Hovold wrote:
>> Hi Chris (and Neil),
>>=20
>> On Tue, May 20, 2025 at 10:30:29AM +0200, Johan Hovold wrote:
>>=20
>>> On Wed, Apr 02, 2025 at 03:36:31PM +0100, Christopher Obbard wrote:
>>>> The Snapdragon Lenovo T14s Gen6 can be bought with a number of differe=
nt
>>>> panels. This patch series adds support for the OLED model which has a
>>>> Samsung ATNA40YK20 panel.
>>>>
>>>> With this patch series the backlight of the OLED eDP panel does not
>>>> illuminate since the brightness is incorrectly read from the eDP panel
>>>> as (to be clear this is not a regression). This is fixed in [0].
>>>>
>>>> [0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-p=
anel-brightness-v6-1-84ad1cd1078a@linaro.org/
>>>
>>> It would be good to get OLED support for the T14s merged. Are you
>>> planning on sending another revision of this series?
>>=20
>> No reply for over a month. Do you intend to respin these or should
>> someone else take over?
>>=20
>> Neil, do you have the OLED version now?
>
> I'm not sure, how do I determine that ? Is there something specific in th=
e type number ?

Yes, yours is the OLED version, the exact models stated above.

Cheers,
     Rui

>
> Neil
>
>>=20
>>>> Christopher Obbard (3):
>>>>        arm64: dts: qcom: x1e80100: add epd hpd pinctrl
>>>>        arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
>>>
>>>>        arm64: dts: qcom: x1e78100-t14s-oled: add edp panel
>>>
>>> Strictly speaking you could have posted this last patch on it's own as
>>> it doesn't depend on adding the hpd pinctrl.
>>=20
>> Johan




