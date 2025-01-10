Return-Path: <linux-arm-msm+bounces-44743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08848A0936A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C3CD16B14E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 14:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333A42101B5;
	Fri, 10 Jan 2025 14:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiwYv5ji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD052101A9;
	Fri, 10 Jan 2025 14:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736519221; cv=none; b=UrSuPf/YvylQTCV/Kc2+mwwtyizy3NiPIaYE/OZn5qMpalmu3tvpMaAKmjG0KuPwU7XxMfLms8e068ymf++AMoHIjizGlIDhqDaniPpXOtNRPpJD+CDxDlt3lMe6bIlFKj1u4EvrCPu4X+70a9qSsVLQe4+tLdIErHFLWPTPBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736519221; c=relaxed/simple;
	bh=OPC+yg9FBpWb/X52k+8z4z8ODDxQlLKKuUSgwfZapXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uaaeKK3LECCYcl+GxaYVGKY2dBWr8XPoylxJ3CTyyyh915GRaZwfhP0qaRoP/g5H5LPcvHBFva6A6PyBIPGtt8yMgXNAzGAl0KVDa3Fr5MHMByHQDtL1v8mhCvunlAoWDUnBDmq1TqsJqPxD+z9PWduLwvfCF/R9D4f6XpfrJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiwYv5ji; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2163bd70069so35635975ad.0;
        Fri, 10 Jan 2025 06:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736519219; x=1737124019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwkldYtsnRI2uxbAB2Qhl5fxTuU35YkpoPwwrZ8CVIU=;
        b=jiwYv5jijrDS2/ADmiprTzFbJWn6kpMEmrQSvZT2zpdysxitytx4jWqOO7FVlaG6Ei
         w2hS18G0HPnTVzrDhDc3R10vj4b5FuJp2DCTfub53n9+ZPg4h5Bk8crfScu0ZffXNCTA
         /fnF7BME4k7xoHbM6eLmquvdyF4npjdahCgOukBcXkJN+jrNiFLCQiAXX5iUr1aO2dSV
         gCJ58f5yb5bbp2GyJR2ASEV1gO4Rjb5yOO2lkilBPADbhk4OyQby10gyyB31ANv4hmz6
         hkefryTsdqwvX5fM0MB2MwDylJDjFpaftPV8TgCMTNkm91Wig3+AJ/1vJm3vo6M28okb
         Ju9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736519219; x=1737124019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwkldYtsnRI2uxbAB2Qhl5fxTuU35YkpoPwwrZ8CVIU=;
        b=W+m5+7EfybK2l/joBkJMakw20ruttRD3TIYJ59rF9ahp+YlZLCIIttK8zsrZCjzNk5
         gQCyLHN/JzrgIcyqB/LkCGionnAto4KRXQkekdIJG5Dhx/M9Z2DZy1r8bUIWItMnJciB
         F0L8mdJtcvNPcl/17Nky9WdjIhkL7mo/+NXUHDtxgXgCHdXXA52Khe+86b6m54DZwCmv
         +xbD+kisfYsyUV95j7pXL04kWYJn4ZspMcW1fK/SHZLITd/RmU/TUyZSW9E0mopskAjo
         zHokGT3Oi1pNhJkf+nKFjqN2gXXwAM6FhjeLtAhfB5U2u79SM5NdNs5i4CqW/G4PA2iJ
         4UBw==
X-Forwarded-Encrypted: i=1; AJvYcCVUTYYKcrO0+V5iVzasaUk7IFqhEKJXNlE3WB0h9HUG66rF0aWRtHzpkSvjM2jbArNv5Llb6m1jO6rlmEaaAQ==@vger.kernel.org, AJvYcCVu4KYpnL6RrukukFiesbu9ro5H5qzz06ubGEtjQKEoaWqMqpXU+eePlI1VhgGRes53y4kpoyZTFoG8@vger.kernel.org, AJvYcCWNtBulT2KAiMa+JVm5knAgSDSd75yF58v33Oc0Upni1UZtV5gE5QLbWpTkaxjQiA1HWXdRCgy7+ADcDJbG@vger.kernel.org
X-Gm-Message-State: AOJu0YwV38aqKWDFl40PAZ/6jzTeI0dw7Tzrqi/9tTUsrCwnDfIAmJEj
	HgXPDAAvzpTdVh13vAA9ubgr/7zMtf8kDJqohbRKJwz+C+wYSAVJs6Yknou6GDMIcA==
X-Gm-Gg: ASbGncss9FFkFcLqg+7qVboBtK3MqF+1qCSk7uzCqOPDVYPaEi4l1ts/fWwHaDJHIju
	KegvMcbqVKNa5Fb+6c0ypMk/1oYnkp0ctDdzCxQNgROn7HAZy8GaYELZxc/Vs1gqu9DLXrAjIsm
	pY/ggZ+B5Cb8nWlHo8MuhbKPQxG0XuMRtBUvw0THQaP2aQ+znTS5/aA+T/cDuSb0zn4MrKX3y6H
	noX+eWzRBQSDi+fTIPlmaY00XxuJQnkjz0xACPDSsRFPbpZq+bmam0=
X-Google-Smtp-Source: AGHT+IFp5BkEGYbwBqUZXm370jPDvf4t12qAjDreAbp2iAHT8rGDrJru5tWyj21B/bhgYXKFUTBBTw==
X-Received: by 2002:a05:6a20:6a11:b0:1dc:790e:3bd0 with SMTP id adf61e73a8af0-1e88cfa6af5mr17754032637.15.1736519218833;
        Fri, 10 Jan 2025 06:26:58 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a318e055feesm2957074a12.30.2025.01.10.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 06:26:58 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: correct usb phy power supply
Date: Fri, 10 Jan 2025 22:25:30 +0800
Message-ID: <20250110142531.194629-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <2e240422-b964-42ce-b537-413b1d8ae07d@oss.qualcomm.com>
References: <2e240422-b964-42ce-b537-413b1d8ae07d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Jan 10, 2025 at 8:28 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 10.01.2025 10:23 AM, Pengyu Luo wrote:
> > On this platform, according to dsdt tables, usb{0,1} phy consume the
> > following regulators. usb2 phy should be corrected also, usb2 in dsdt
> > is a little complicated, so correct usb{0,1} only for now.
> >
> >       usb0    usb1    voltage consumer
> > hsphy:
> >       l1c     l1c     1.8v    vdda18-supply
> >       l9d     l4b     0.912v  vdda-pll-supply
> >       l7d     l13c    3.072v  vdda33-supply
> > qmpphy:
> >       l4d     l3b     1.2v    vdda-phy-supply
> >       l6d     l6b     0.88v   vdda-pll-supply
>
> Looking at the CRD schematics, it should instead be:
>
> USB0    USB1    VOLT            NAME
> L1B     L8D     0.9ish          PHY
> L4D     L4D     1.2             PLL
>
> I'm hoping I'm reading those right, it's not super obvious
>

Yes, right.

Yours is correspond to usb2 qmpphy(internal usb)

this is from sc8280xp-crd:

&usb_2_qmpphy0 {
        vdda-phy-supply = <&vreg_l1b>;
        vdda-pll-supply = <&vreg_l4d>;

        status = "okay";
};

&usb_2_qmpphy1 {
        vdda-phy-supply = <&vreg_l8d>;
        vdda-pll-supply = <&vreg_l4d>;

        status = "okay";
};

I had checked many dsdt tables of sc8280xp-based devices, they are

Name (LPCC, Package (0x07)
{
...
Package (0x08)
{
	"\\_SB.URS0.USB0",
	...
	"PPP_RESOURCE_ID_LDO1_C" // 1.8v
	...
	"PPP_RESOURCE_ID_LDO9_D" // 0.912v
	...
	"PPP_RESOURCE_ID_LDO7_D" // 3.072v
	...
	"PPP_RESOURCE_ID_LDO4_D" // 1.2v
	...
	"PPP_RESOURCE_ID_LDO6_D" // 0.88v
	...
}
...
Package (0x08)
{
	"\\_SB.URS1.USB1",
	...
	"PPP_RESOURCE_ID_LDO1_C" // 1.8v
	...
	"PPP_RESOURCE_ID_LDO4_B" // 0.912v
	...
	"PPP_RESOURCE_ID_LDO13_C" // 3.072v
	...
	"PPP_RESOURCE_ID_LDO3_B" // 1.2v
	...
	"PPP_RESOURCE_ID_LDO6_B" // 0.88v
	...
}
...
}

On many platforms, such as sm8350-hdk, sc8180x-primus, x1e80100-crd, which
also support qmp phy, their PHY consumes a 1.2v vreg, their PLL consumes a
0.88v(approx) vreg. So I wirite this patch.

> Konrad
>

Best wishes,
Pengyu

