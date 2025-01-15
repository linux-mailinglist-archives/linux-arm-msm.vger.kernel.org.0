Return-Path: <linux-arm-msm+bounces-45086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6556A11C97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 09:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 879543A1D3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 08:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F32246A08;
	Wed, 15 Jan 2025 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LrT5HDOF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A9240804
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931287; cv=none; b=EJV0r43JpZVH9e7hW08KHk4Dg4Dp6INxxRpOcbRYTzcBQPM2M3B4olOTsP8LCF23CAtUU6YasReFbMNWi7IHrX1BYx/kL0PJbZT7nLs30WMkQfVQW71naHRehxpHdTQTf88K7aWRaFO+yMS9Ez/HqwLa450nPrECFYFNoUpak8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931287; c=relaxed/simple;
	bh=crCGIrWAPm3CgX29f926SsUaDye8Py5P+Ve9r02sUzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjE1Lfcnz3O7iKT2t18YPGzl1V3Y9W6OGBiGxSYhXre6hF0afSfKWvZr8JC9LjVqLQz3fKdqzgMyGypGSr/z15/HZoNbdnjM1H9Pt/Dm177SBtv0NdyZ/Qpbk/kofZOKRidwF/CgyFLTAQyQhbsXjAKXIEd9S0lYaocwN3IvIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LrT5HDOF; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30616d71bb0so34426771fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 00:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736931283; x=1737536083; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HwOpCAY+TRPX5emjLRnKQ+6GKxHIVUBxjpEXCs0EJGE=;
        b=LrT5HDOFuJSSfkiLf1AdGHIhkhuDwx/6soxoGo+BNL9cslUtMcVZIvppf72STUTTBr
         /DWJY+wpXreAfxyja+mpRV4iv1Id8N6l97LI8uvC3d8UPwvzH+UavMtdjOSqb2nI1GfP
         WqmN64w+g5v8z770NRGZrFRwCBgQkE+LiI1uQ0XmhqdMZDDUeO+HiBTkW1a25jrg1dlL
         VawJgpmoIj9DktE5NgJxVlkci9Gyjx1476dVTwiJFXKLFf14z/osRUlMB3pPCOnd65qd
         gsvueQyQ1AIEJQ5ZXrN5EwnFSvCnq6sR9K6gTv2I5qECYYrCrxEmU061tqYmB8A9cPLN
         BLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736931283; x=1737536083;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwOpCAY+TRPX5emjLRnKQ+6GKxHIVUBxjpEXCs0EJGE=;
        b=KBJpxTSuhpR/apgErwDNReGigFopJLvnQVV6oNg5K9IpTiPgoNvGOGcGIok7fx/Zz4
         JPEXEcx3/Zbh3Sx32KWALPuLGDxAmqJlA7+4nGIcxD7LBCuPrQxDMRBUjXcdPYJqCa+E
         nfxbdqaOSxijcyH6DNcawczVL1GsRne3AEdiZwiwEv1Xk7CUXP8uThSvW1gYqThZ2atn
         0Ye/IGqUcM3GFhc7oIqRMz20TSuerhwEXbM56JWVdthyGqFqzXMn3kjJg/Ro1U1vohsu
         lASFjiLMr54WZ90G3Xoh1WA0lIVeRrzqx5B3MNJmCPuN3RxoZfVfRe9G8KkOw30Fgo8K
         I39A==
X-Forwarded-Encrypted: i=1; AJvYcCVPdjkpNKSJhRz0255ziBhffdyoRMg0IM8NdLPc77pJcsyF2grxpqc2+HVvC9ybSuF3eHLNdNIZX3Ml1/lj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq1m/nzczMj3th9+csZZ+5O+C5J6Wm05Vte+mfVEwox1Zb3hok
	KUJqkd+knKMHafxhZFs3bLHd1A8nnMAEKBurKWciDKAPNbu1iwAVQi9wM8EaAxU=
X-Gm-Gg: ASbGncsWBsmoKLRMa++yAUw273FZunVpiByDoAFcUr3kTE+NbTZbrfcZxV4IoS3p+gz
	dbtCUk47OFkgvofG1kOLuWOvLPzPEWy/2+fgnTrOZdt7Ltz3g4fZyBGLF1VYn1mhXOBAS78DQNG
	V/TFXj/JA8HYCXWML3Wz/JSN+sKOib3u/8PYVfer6Ua3sgP3+40Uyv0+OmB0pF/7V1zsjMNoh5A
	268gLvEWPBViVLwpHcA2X4wAJRD/pT6D4gCkfzKc3d/V9CFptuwauqrPBxBnIeJ8xqbrLJP1PqC
	CjqbS6Hij40tMvfpKxKc6bGqQPVgbGoceYqU
X-Google-Smtp-Source: AGHT+IHTpJ70vtWgIUw7Pg1kOPWCf5XJS2r9IyZ+i3djI4Hu/KSN2nxwCCgeiBbZ0I8fFQbv7dMdKA==
X-Received: by 2002:a2e:a545:0:b0:300:317c:9b75 with SMTP id 38308e7fff4ca-305f45531ccmr89017481fa.12.1736931283059;
        Wed, 15 Jan 2025 00:54:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0f655bsm21199611fa.53.2025.01.15.00.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:54:41 -0800 (PST)
Date: Wed, 15 Jan 2025 10:54:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
Cc: Wasim Nazir <quic_wasimn@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, psodagud@quicinc.com
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
Message-ID: <cmgsyaipal33vuwhw5m2eskmxfv2s5ooxixmpyucln4j4t5jo3@xycvijqnzbun>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <zn4uf3mmlmt3who474hwkr44poycfqtjtidshybbg55a3hr63y@zxefqbhiwkbg>
 <d54c6706-3c6b-211c-6acb-fa3984c30c67@quicinc.com>
 <ubasbsyspn5euygihgphyw3xg4ckveytvgnjpwdiyg4pv7degr@6y44ya4gvaqj>
 <07c41571-28ca-6f9e-bcee-899bbf77f687@quicinc.com>
 <sufmykle5inyk73i3qfmy3xqq7plgfr7txiruyahc5wgvvn6uo@kytxtb5zc3tg>
 <cf2ad828-d00d-133b-f310-1688fc0ed59b@quicinc.com>
 <6zftdu5myuporxsvxlxhojnlhnfa74pjj7nvy3wmiaw7jdsuo2@3ebcpevzvtlc>
 <59d087c3-1a4a-782f-8566-313e8355216c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59d087c3-1a4a-782f-8566-313e8355216c@quicinc.com>

On Wed, Jan 15, 2025 at 12:46:50AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> 
> Hi Dmitry,
> 
> Sorry, I was busy with some other priority tasks.
> 
> On 1/10/2025 5:24 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 08, 2025 at 09:38:19PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> > > Hi Dmitry,
> > > 
> > > 
> > > On 1/8/2025 6:16 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Jan 08, 2025 at 05:57:06PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> > > > > Hi Dmitry,
> > > > > 
> > > > > 
> > > > > On 1/3/2025 11:21 AM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Dec 31, 2024 at 05:31:41PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> > > > > > > Hi Dmitry,
> > > > > > > 
> > > > > > > On 12/30/2024 9:10 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Sun, Dec 29, 2024 at 08:53:32PM +0530, Wasim Nazir wrote:
> > > > > > > > > From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
> > > > > > > > > 
> > > > > > > > > In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
> > > > > > > > > does corrective action for each subsystem based on sensor violation
> > > > > > > > > to comply safety standards. But as QCS9075 is non-safe SoC it
> > > > > > > > > requires conventional thermal mitigation to control thermal for
> > > > > > > > > different subsystems.
> > > > > > > > > 
> > > > > > > > > The cpu frequency throttling for different cpu tsens is enabled in
> > > > > > > > > hardware as first defense for cpu thermal control. But QCS9075 SoC
> > > > > > > > > has higher ambient specification. During high ambient condition, even
> > > > > > > > > lowest frequency with multi cores can slowly build heat over the time
> > > > > > > > > and it can lead to thermal run-away situations. This patch restrict
> > > > > > > > > cpu cores during this scenario helps further thermal control and
> > > > > > > > > avoids thermal critical violation.
> > > > > > > > > 
> > > > > > > > > Add cpu idle injection cooling bindings for cpu tsens thermal zones
> > > > > > > > > as a mitigation for cpu subsystem prior to thermal shutdown.
> > > > > > > > > 
> > > > > > > > > Add cpu frequency cooling devices that will be used by userspace
> > > > > > > > > thermal governor to mitigate skin thermal management.
> > > > > > > > Does anything prevent us from having this config as a part of the basic
> > > > > > > > sa8775p.dtsi setup? If HW is present in the base version but it is not
> > > > > > > > accessible for whatever reason, please move it the base device config
> > > > > > > > and use status "disabled" or "reserved" to the respective board files.
> > > > > > > Sure,  I will move idle injection node for each cpu to sa8775p.dtsi and keep
> > > > > > > it disabled state. #cooling cells property for CPU, still wanted to keep it
> > > > > > > in board files as we don't want to enable any cooling device in base DT.
> > > > > > "we don't want" is not a proper justification. So, no.
> > > > > As noted in the commit, thermal cooling mitigation is only necessary for
> > > > > non-safe SoCs. Adding this cooling cell property to the CPU node in the base
> > > > > DT (sa8775p.dtsi), which is shared by both safe and non-safe SoCs, would
> > > > > violate the requirements for safe SoCs. Therefore, we will include it only
> > > > > in non-safe SoC boards.
> > > > "is only necessary" is fine. It means that it is an optional part which
> > > > is going to be unused / ignored / duplicate functionality on the "safe"
> > > > SoCs. What kind of requirement is going to be violated in this way?
> > >  From the perspective of a safe SoC, any software mitigation that compromises
> > > the safety subsystem’s compliance should not be allowed. Enabling the
> > > cooling device also opens up the sysfs interface for userspace, which we may
> > > not fully control.
> > THere are a lot of interfaces exported to the userspace.
> > 
> > > Userspace apps or partner apps might inadvertently use
> > > it. Therefore, we believe it is better not to expose such an interface, as
> > > it is not required for that SoC and helps to avoid opening up an interface
> > > that could potentially lead to a safety failure.
> > How can thermal mitigation interface lead to safety failure? Userspace
> > can possibly lower trip points, but it can not override existing
> > firmware-based mitigation.
> Both firmware and software passive mitigations (CPU/GPU) are not permitted
> for Safe SoC.

Not permitted by whom?

> As mentioned in the commit, it is the responsibility of the
> safety subsystem to take corrective action for high temperatures. One of the
> safety requirements (not a functional requirement) for Safe SoC is to avoid
> scaling of CPUs and bus DCVS, as this could impact safety-critical
> workloads. Therefore, Safe SoC will operate at maximum frequency with the
> performance governor. Enabling a cooling device for the CPU would expose the
> cooling device sysfs interface, allowing userspace to request different
> cooling states via the cooling device cur_state sysfs, which could
> potentially lower the frequency and violate the safety requirement.

So, you disable thermal mitigation controls, but your description allows
userspace to change the CPUfreq governor through sysfs. Isn't that also
unsafe?

> > And if there is a known problem with the interface, it should be fixed
> > instead.
> 
> There is no interface issue, as it is not required and can be disabled for
> Safe SoC. This approach has already been used for commercializing the
> SA8775P, and we do not want to disrupt it now. Therefore, we believe it is
> better not to add cpu cooling cell property (CPU cooling device) in sa8775p
> base dtsi.

Okay, assuming  SA8775P may not have any thermal-related properties,
what is the issue with having them for the IoT-related QCS9100 device?

So, you have an alternative proposal: rename sa8775p.dtsi to
qcs9100.dtsi, defining a full set of thermal properties there and add
sa8775p.dtsi which includes qcs9100.dtsi and just removes thermal and
cpufreq nodes. Doing it in any other way, especially by including a
random SoC-related include defeats the logic of the DTSI files.

> 
> Best Regards,
> 
> Manaf
> 
> > 
> > > Best Regards,
> > > 
> > > Manaf
> > > 

-- 
With best wishes
Dmitry

