Return-Path: <linux-arm-msm+bounces-21567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA78FAF33
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9094BB22390
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 09:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1413144D02;
	Tue,  4 Jun 2024 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTRU5Khl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71551448E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717494420; cv=none; b=km5f+SgZxrizXLizL4uE+0BLIiaL/H8KbW4w8z0bnl1wZGKqjEVcYDSyCHqZ7XFkzAQ8giggpxk19OK8bU302O2JxGyFiCCsTCWO0UU01ZnWvcgQ8XJc+I3SGJEf02cGFZzjK26PGUZiArXFdcB20Abwgd2+HqLceiGC8naqTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717494420; c=relaxed/simple;
	bh=mWx0HO7MnYdM2GA36+DT4q83BPtn9x4BGJwJUoyDg94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mghn8T4bsKJ1y9JVNXodoNRrhlT8DnwPc/TYcZjH8iKGfd5hXy+++ZHdmiuYYnBjHOZ1/c4+NYS9MJqmpxHTG2jdtqkS5e4vjLOc80P0d6RMA+f6Pm+XJ8ZNyqGaRvNHBwVdrhcpeLF+zqGoI4HarAlLVDQkBU7IaZORu7EolRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTRU5Khl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e72224c395so47175691fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717494417; x=1718099217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=91LqZFlYL5/F2cNmD4SIK00pujZpSwxCmM3GgQD7Ylk=;
        b=DTRU5KhlxwdMUF1S+Dz1P8rnrh+QG0qfptY/yJfQYBz2PlwU1R9QcQAXU+NsoymoyR
         wgR8xzUk8Q9Y89dCE8+0Ydy1FzpAlNUqATs9m3LrlqcRhE1MzG61bWa9Eoxb8lf6GPJX
         pIc6EiVAmQgSK7WHoSl3FAV2XkymBNsRHdos/+djV3u2gkfNti66rCLy8Vf3TfrOg1PW
         LVPyA+8B3VEWuyC8mQlQxd0nUJb592oiecDsoTwFzUJk45hofF65j2Jchhva4mZena20
         FidNvvjY+AN6BpUufqL/xkDmY+ZGBCiISb+FsKjcmF5CTPfW0n1nAAnkPK5NLSfv4oWX
         1XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494417; x=1718099217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91LqZFlYL5/F2cNmD4SIK00pujZpSwxCmM3GgQD7Ylk=;
        b=Zpub1BxVrS1V2azqJpEd1SY39Qjavf6DIRQDMOW+tJpkgPLPyZmyFw4T/mJb4n7+pf
         Ulnq/1EGzsWOz7OS2/RGOBpTR/fYmgqM/4jkjDQjX930kqMrL81WfIHxW0Cyw/YvApOc
         BuxwU7Ev0rKHiEImvJmpO4V9B2Y9iEi63MRpRFFejIKzenFeAu+kRLZ8U+rykE8Xsj2B
         7lXlJRol2HNIzCjBK9Eq97MX15MuXxuKTMFCOFnzzxFAcQVqhxSfybilyF4J6mkQz2ou
         ti5QnlsbpSQLQders+q43X65bgl9rS5P7fhcG7W9ceydbV8tDQSRh1DPfcijpV3JDJp6
         y+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXH0fgjjjvAv715ngM8SlzW6KmKjkaLLK7JrAH5Z/TLLm1JKU18EaCN1XkbNXbwM/vZsY/2H22QHxatmTI6uXEKq2xpC0n/Mx85RrzDaQ==
X-Gm-Message-State: AOJu0Yw2nBriZyM82ZyvoWWDX9ak0dunZr+YV/2qFRWV/tHuqX+e6a3w
	3Yx0Z82EJU2hyv6rV6wFtkEVcGCpM7HZJgoyj/2V1C7pTWcOfX+r5gPZUhyehK3bGefYe0s1Vv7
	b
X-Google-Smtp-Source: AGHT+IGP3Av98j9yu/1Mbhl+izjyOMD6OnhkoHEAMTZcSfCVzSQLxJFI5S0RbigNCtMU2ew04uBK9Q==
X-Received: by 2002:a2e:9295:0:b0:2ea:8d54:4516 with SMTP id 38308e7fff4ca-2ea951288aamr68154601fa.27.1717494417079;
        Tue, 04 Jun 2024 02:46:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d683sm14655841fa.8.2024.06.04.02.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:46:56 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:46:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Kaehlcke <mka@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com, Doug Anderson <dianders@google.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Disable SuperSpeed
 instances in park mode
Message-ID: <tbtmtt3cjtcrnjddc37oiipdw7u7pydnp7ir3x5u3tj26whoxu@sg2b7t7dvu2g>
References: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
 <20240604060659.1449278-2-quic_kriskura@quicinc.com>
 <le5fe7b4wdpkpgxyucobepvxfvetz3ukhiib3ca3zbnm6nz2t7@sczgscf2m3ie>
 <e0b102b6-5ea5-4a86-887f-1af8754e490b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0b102b6-5ea5-4a86-887f-1af8754e490b@quicinc.com>

On Tue, Jun 04, 2024 at 01:34:44PM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 6/4/2024 1:16 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 04, 2024 at 11:36:58AM +0530, Krishna Kurapati wrote:
> > > On SC7180, in host mode, it is observed that stressing out controller
> > > results in HC died error:
> > > 
> > >   xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
> > >   xhci-hcd.12.auto: xHCI host controller not responding, assume dead
> > >   xhci-hcd.12.auto: HC died; cleaning up
> > > 
> > > And at this instant only restarting the host mode fixes it. Disable
> > > SuperSpeed instances in park mode for SC7180 to mitigate this issue.
> > 
> > Let me please repeat the question from v1:
> > 
> > Just out of curiosity, what is the park mode?
> > 
> 
> Sorry, Missed the mail in v1.
> 
> Databook doesn't give much info on this bit (SS case, commit 7ba6b09fda5e0)
> but it does in HS case (commit d21a797a3eeb2).
> 
> From the mail we received from Synopsys, they described it as follows:
> 
> "Park mode feature allows better throughput on the USB in cases where a
> single EP is active. It increases the degree of pipelining within the
> controller as long as a single EP is active."

Thank you!

> 
> Even in the current debug for this test case, Synopsys suggested us to set
> this bit to avoid the controller being dead and we are waiting for further
> answers from them.

Should these quirks be enabled for other Qualcomm platforms? If so,
which platforms should get it?

> I can update thread with more info once we get some data from Synopsys.
> 
> Regards,
> Krishna,
> 
> > > 
> > > Reported-by: Doug Anderson <dianders@google.com>
> > > Cc: <stable@vger.kernel.org>
> > > Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
> > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > ---
> > > Removed RB/TB tag from Doug as commit text was updated.
> > > 
> > >   arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > index 2b481e20ae38..cc93b5675d5d 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > @@ -3063,6 +3063,7 @@ usb_1_dwc3: usb@a600000 {
> > >   				iommus = <&apps_smmu 0x540 0>;
> > >   				snps,dis_u2_susphy_quirk;
> > >   				snps,dis_enblslpm_quirk;
> > > +				snps,parkmode-disable-ss-quirk;
> > >   				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
> > >   				phy-names = "usb2-phy", "usb3-phy";
> > >   				maximum-speed = "super-speed";
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry

