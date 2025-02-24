Return-Path: <linux-arm-msm+bounces-49184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19864A426E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 16:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 714683B12D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 15:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C442625EFA5;
	Mon, 24 Feb 2025 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wA3C80XP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0C225EF8F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740411932; cv=none; b=tTkZLunki8Q2X7+S4H63DnC3wN6PiTKhW7ujnZDAgLYirhcbdLq2C+nvp1stjN1MMzJfcDrcWfos42SzybMn+huZ9AXuCsnNiY9G31wKdrMCBsc8p1YFJB2YbSC5Stqyg0Y1MgTFAW9KC2UivoNZsihDqWVrN+qDHfF7vpvz+mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740411932; c=relaxed/simple;
	bh=2mTtDZAkc00WaJmrF+GsEd2qg3IRRa89CS9NdfbbNJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YleGa0F+ntaEiHp7GwHmsknglKjdcu1GdX+1VmfyHf9gUOE0LO1XuHMVAm2XUYmszeAI3MTa1qjSUv4Jcga3u4PupJV9ktkPvKwZtiYczIVn7yFCV5vXjwrjnDCIcw2EXEVA8JPycBFeCwc/WaU+63EbBXL3FtqWnLCEDVEwAgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wA3C80XP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54838cd334cso3482452e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740411929; x=1741016729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wOiNvYc++Zm34fMpFoIDUhcKtWpkYIPTfUzhG4djg7M=;
        b=wA3C80XP1CIPLPSCpBl7N8OLpilRCL/nkj1Vdh0WGEc2v3TV0Znna/nAgENu2S9Zo2
         DXNC3gFUT0rf4Eh/YMykLd4+OyBEFqCSfVISvUEPXWGMr0PIF+N9GSFNz90FOz/NJL1s
         yIKpatb/+AVaxBq+GYZkdM7lP52lnYbY2asbNfoC+GIouqQ67g+AL8i95jGvdIJlWmCE
         S6ammNNwAaaiG3p/0I1Maq0M0ARS4V/DR7ETMNnuMYno+UqR6WZSZ4InnYy6k4HHux/W
         NSl7rUW23cl0C7Wn6gjHGlY+C+jlqlzS9/n0getk0zz8l066YR2FtBEwPye8XlE9rlwV
         3sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740411929; x=1741016729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOiNvYc++Zm34fMpFoIDUhcKtWpkYIPTfUzhG4djg7M=;
        b=uN1KT3B1Duunrzib6W61omOycTQco2e+A8DBZ7pWwtPYKRyh8N66RE9uvuc78S4xUe
         mUXddK0ocRdWCV734AVAsJuBMuXU0O691hx5pcf49AB1qxkIwOxaCK+s4/JtuJfK6C2Y
         8+jcszR1MWrDdmM3HoGSGvTGt3eL6ArtsQNdHde04NCM8f4KC8s63Cuun/e/M3RmnyqV
         LstSWxWS8KPsLW2OpjFAndoYexIwvPTfXzPC6arW0fNdjG+T4WunZeYpDUcJn1xGW0B+
         nVVqrchZVX8qFNOiaApwiHP5OCIgPyMyAfVbssRIXcDQI6MBJFamILI/vcHGB0Y9SYhR
         cWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+A2nIuA/JrnPnD2xWFxotqcyCqR3W64HhkVugf7PmxxkyazrpNE9lcm7sB6g0pTCB6YVhebHrhMgE/hwb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4sZ8V+2J0wbaVMhmyxB4B10dOVXVvN8kNgwWOtrDAZXtqAUti
	sJ1yGVRFvz/w4b4w4/Vg2GmnMYZbGZwek2avXrRPQxRM3HUgfoNRzIqvNBEDn30=
X-Gm-Gg: ASbGncsSozDUartLvii2wmnE0ZY8deNSOgl+nDrShMsz2DmvEz1ZKX9lwyODHDyqRI8
	mgWiz9cSZoFO0NgXnVpO/cSsEK9DSE7uzjOXoG7aN+Tjq9GDNAk8y3H2+WjGj7El41yLVeFWAIf
	osK9TPWeg+xF/dljl2cVwe8ImpKGvRcZMgeM2xS6wMGQYxuyfoTR9HLd0iuYZIQclal7pDq78IG
	F4Hr1zjQFChPC7r1sByNQUm1Qs782+tm+rxDesBS2X2VPnKH662WJprLA+ZSU7m8rODxyYZABPz
	Y09aTQP30RDlDpK1OKlGN+0Uwhivc0kJgexZIIi+vC1aLyaHBEODtI8EeyGdR9RnCE96AzNEF/6
	rElmgOg==
X-Google-Smtp-Source: AGHT+IGwY3q58ljOK6c0ToO8Ip0U2GajA279X5o7qJCOYPYRMwKT1ywz49vgLpLFCtOjKmpLe+ox1g==
X-Received: by 2002:a05:6512:308b:b0:540:1b07:e033 with SMTP id 2adb3069b0e04-54838f79748mr5921069e87.45.1740411928851;
        Mon, 24 Feb 2025 07:45:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54619e7bc2esm2609050e87.244.2025.02.24.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 07:45:27 -0800 (PST)
Date: Mon, 24 Feb 2025 17:45:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, robh@kernel.org, krzk+dt@kernel.org, quic_srichara@quicinc.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: nvmem: Add compatible for IPQ5018
Message-ID: <3lmf24l3retmjcbmzkn7ezqxd7no2dbuwm2apy5vlwgaq7ipnh@ggscdxkgirke>
References: <20250224061224.3342-1-george.moussalem@outlook.com>
 <DS7PR19MB8883591F0D2E21E62025D2D69DC02@DS7PR19MB8883.namprd19.prod.outlook.com>
 <2fcb52a3-7ef2-465f-b460-2f7b565a188e@kernel.org>
 <zygiknq3pldkcdonekzamn2uprnjyc5dip57i75p7uahftekxr@2lqgo3wa6zhf>
 <739acd33-9ce8-40db-a219-26b8ca241d73@kernel.org>
 <DS7PR19MB88839DD16140E0C883257D679DC02@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB88839DD16140E0C883257D679DC02@DS7PR19MB8883.namprd19.prod.outlook.com>

On Mon, Feb 24, 2025 at 05:58:39PM +0400, George Moussalem wrote:
> On 2/24/25 17:49, Krzysztof Kozlowski wrote:
> 
> > On 24/02/2025 14:42, Dmitry Baryshkov wrote:
> >> On Mon, Feb 24, 2025 at 10:19:35AM +0100, Krzysztof Kozlowski wrote:
> >>> On 24/02/2025 07:12, George Moussalem wrote:
> >>>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> >>>>
> >>>> Document the QFPROM block found on IPQ5018
> >>>>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> >>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> >>> You can send the patches to yourself and see whether they are properly
> >>> threaded.
> >> I don't think outlook world understands the concept of threading.
> 
> using git send-email from an @outlook.com address. But I've figured out the issue:
> git send-email --thread
> this sets In-reply-to and References tags

It does that by default. The usual way is to have your cover letter as
0000-foo-bar.patch and then use git send-email 00*. This way it picks up
the cover letter as the first patch and everything else goes as reponses
to it.

OR you can use a tool which does that for you. We usually recommend b4
tool, it wraps ardoung git-send-email and it can help a lot.

> 
> > True, but note that outlook.com is just provider and you can use
> > whatever email client with it. mutt/neomutt, Thunderbird, claws, Kmail etc.
> 
> correct, not sending from outlook, but git send-email. Was missing the --thread option
> 
> > Best regards,
> > Krzysztof
> 
> Best regards,
> George
> 

-- 
With best wishes
Dmitry

