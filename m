Return-Path: <linux-arm-msm+bounces-50198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E815A4E1B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E733D172E37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDDF25FA0A;
	Tue,  4 Mar 2025 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXDwVUdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015FF23A9AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099278; cv=pass; b=H/bCNJfc/h/MvhrBEEFfrhVjTR3B9EUL8xXipjw0GD1/5PIoEOpjVc5LCNT130PvbJxNwr3pEn0F48eSEKbPn/rN3Sl/gUZIOkmzBcrqAqVnkgnXTqFrsskXRqNivlgUV2lxeagfcCFB7b+RqWJ2xBPeXQnGEoquO0RjobwdBUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099278; c=relaxed/simple;
	bh=DhfNdV/O+uocDkBJFYE83PtsNs9K9z/PTwLsOVi9J/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pynFPxMRY0U8kmCB7LBIgHNSDhvUyLCvNJCxrjMIE34rFTM4Vz5bS+chI1Dc02MAGD53JTeL8hrQCaX9iwdspBn+Fp5xD/INggRvVOXnIDZH6en3PrnJOQ5PlSr9jdWaaYG6BayRDIUZFKs3O5VJpRhTFzyZYTKmk0CsU7cBLa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXDwVUdr; arc=none smtp.client-ip=209.85.208.177; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 3AE5740F1CE2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:41:15 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dcX6MHLzFxJ3
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 17:39:40 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id B0C7042723; Tue,  4 Mar 2025 17:39:39 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXDwVUdr
X-Envelope-From: <linux-kernel+bounces-541752-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXDwVUdr
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 26FDB41E1E
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:03:42 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw1.itu.edu.tr (Postfix) with SMTP id AF1383063EFC
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:03:41 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83A803A9F53
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8BA21148C;
	Mon,  3 Mar 2025 13:03:16 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8495288D2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006992; cv=none; b=JW5CenFoqcfRai+YlI4wgYjlMC/kr6c1/Uos7yPFn3IAf7t/MnQjWKpCnKiILBtwUYfcIukEtjczLt6djK33l88gIgJWpLRH7HE9Z6nuYGw5g00F95X2kJIiBcUFbnmaXLEHqolAJXncY4o8z7pW7JK6hrDs+n/fe/jPf9wL2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006992; c=relaxed/simple;
	bh=DhfNdV/O+uocDkBJFYE83PtsNs9K9z/PTwLsOVi9J/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPI7RUxV5vv1Op/BuDUa/ZWC/PEK2mlHsJgj67HvTLI8QI9JlGfZa2JQQFnioi4QcIylSqTYEU/CuhqTRuSSlyKFNzdcd4zzu2MV1jKQLOmBW2EUk7eAHZfp7ikCceGn3Ovb0qlYYmHV4Q33wzjN4j7olOVDtTg94Y8vKgZqx10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXDwVUdr; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bb2fdbb09so12803181fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 05:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741006989; x=1741611789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DuRt7sNsxjnBZpSJFW4wxc/r2PcIDt/KOhq8Vg4VK/w=;
        b=DXDwVUdrSsk322dDuE/L5lNxzKO0jvB87EdzYcRP5Vd11T20vU0VTNeKiuqCLMLeL2
         k2ruho4K1IWjXKIsxt9x1yrt07HeD0ScVdLkhON6ws9VS5OToCBdMcHkCkNpbIoaPlur
         VAU2fxn5X7+SCLtZOLjCLTVVXgR9wzsx0+ftg97sMR0XNnMZvEHzDlJxqNn6AHaW/Ako
         Ba9SvliI4uKdVzlICirU+0fIrfURpTQJXhsNGE+d/S8PBErEDZfNEUAifm9cfI6ds+fh
         3puE4q7FZIilXLMLa3zS1GNjQCIgE8/RkIvI/MGIHuwHp5L8j0i47qqcyKQELgSFEpmA
         M28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741006989; x=1741611789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuRt7sNsxjnBZpSJFW4wxc/r2PcIDt/KOhq8Vg4VK/w=;
        b=mVfXdJAZk7k/MeC9xtHdDiwFqnFylveYH81ang1dZAhJqgUwi3CuhuAMY05olG2usX
         iUgTa2qH1ZLuFF//kT5ne1B6n+ga0ZRAflQ1Izo+jE76S2D9Qq5xQLQCDSUgSgZARoPp
         xpAjREmJHL9MqBl+Vnmzw6Fy/njXNRZNOR3BAImtL+pySimTZ92nGnELR076pWO9SdM3
         trrDzLefs0fxo+J42ECwbDhU49Tz2qTN2FXDALMmCoAXxirD9bx9y7a2/kAS9Zs1BjpI
         BIgqfNdr4ii75BqZzPHz+mQdYzHxxxN5XzWIO4YN62QM5k1g/Nww9S/g3BM8UavOZLAL
         ENdw==
X-Forwarded-Encrypted: i=1; AJvYcCVNRjC8EZAIV85N75gPJVudnGexI/nC29RN4D0KOjIB0MM+US8vZjhpZTWiskCHl9nIaSehCGkppd0TjIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZUSIb1iSa9dT4iPTqunGGv2WkUwxT16k7LeiN0NkbmCTsWPo9
	EeJyreJ8Cjfb40aRDNJhfYwynifaWttpiRGUDngWc8vjcpo86CVVlDVxZgkyQOw=
X-Gm-Gg: ASbGnctAJF4YMtEGnlIBqeil5a70Wmb8M0kTKXbrMdXQZqvJxtrEe/PSFnSu522D/uf
	B+7VS/FoRLnUHRMKhJQA423n5rMpADd64ZcCMUot6DomE2Xg6Tma1FvucF9x7bxtynNWscm9c/S
	IEIJUrSReEviNtpsz91ptnvhZcqGW1y/CZVSjwsuM89N1BrBsGg16gt86zqEzUA3tgHbFgEivfI
	bUw8hCT+JyGdpuaQzJrceH+xs0OaMwIyxHmO4Oo0nGl2KvRpvEByg50jl/ytZNcMGtS7vzeL7Xn
	6UEWNSvIwI/lNmsnY/cn4Vy17l1HbQofgRg28EKMZZfvQLAxwPR2u+67rNTPyPoWOZv3CMNHrU+
	yRJxSyryQJUAWGMNdue6IUcmI
X-Google-Smtp-Source: AGHT+IF1PolbJR152vR5fP4sMo4m1QykoHvieTbCTpVgWNk/bMvUDzzFZWCKpBvAuMT571N86KTxyA==
X-Received: by 2002:a2e:bc18:0:b0:30b:b7c3:ea71 with SMTP id 38308e7fff4ca-30bb7c3ef87mr18110021fa.15.1741006988806;
        Mon, 03 Mar 2025 05:03:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bba62b892sm3743161fa.66.2025.03.03.05.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:03:08 -0800 (PST)
Date: Mon, 3 Mar 2025 15:03:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH V3 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
Message-ID: <5xjtb4cifjjagkeifpkgx4y5cb7mwrocv7sxq3lh4lhadtw2bn@umtwhw7eqkhe>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-2-quic_srichara@quicinc.com>
 <velvqajyhrdaipmqmsduv3l3dsv56sy4rfukwm2hrdvh47hgqx@7sbnrgkzsn67>
 <1a22a637-c3f1-49b3-adf5-3e952c7d336a@quicinc.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a22a637-c3f1-49b3-adf5-3e952c7d336a@quicinc.com>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dcX6MHLzFxJ3
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741703988.70917@d5I67gZJiqBtf7pMWIOWog
X-ITU-MailScanner-SpamCheck: not spam

On Mon, Mar 03, 2025 at 12:51:44PM +0530, Sricharan Ramabadhran wrote:
> 
> 
> On 2/28/2025 11:36 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 28, 2025 at 10:23:55AM +0530, Sricharan R wrote:
> > > From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > > 
> > > TMEL SS provides different kinds of services like secureboot, remote image
> > 
> > What is TMEL SS? What is Q6, etc? Please provide a definition on the
> > first usagem both in the commit message and in the bindings text. And in
> > the cover letter. Also, in some places you use TME-L instead of TMEL.
> > Please settle on one of those, unless there is a difference between
> > them,
> > 
> ok, both are same, will expand and fix same in all places
> 
> > > authentication, key management, crypto, OEM provisioning etc. This patch
> > > adds support for remote image authentication. Support for rest of the
> > > services can be added.
> > > 
> > > The QMP mailbox is the primary means of communication between TMEL SS and
> > > other subsystem on the SoC. A dedicated pair of inbound and outbound
> > > mailboxes is implemented for each subsystem/external execution environment
> > > which needs to communicate with TMEL for security services. The inbound
> > > mailboxes are used to send IPC requests to TMEL, which are then processed
> > > by TMEL firmware and accordingly the responses are sent back via outbound
> > > mailboxes.
> > > 
> > > It is an IPC transport protocol which is light weight and supports a subset
> > > of API's. It handles link initialization, negotiation, establishment and
> > > communication across client(CPU/BTSS/AUDIOSS) and server(TMEL SS).
> > > 
> > >     -----------------------------------------------       ---------------------------------------------------
> > >    |                                              |       |                                                 |
> > >    |                 SOC  CLIENT                  | SOC   |                TMEL  SS                         |
> > >    |                                              | AHB   |                                                 |
> > >    |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
> > >    |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
> > >    |     | CPU    |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
> > >    |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
> > >    |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
> > >    |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
> > >    |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
> > >    |                                              |       |                                                 |
> > >     -----------------------------------------------       --------------------------------------------------
> > > 
> > > This binding describes the component responsible for communication between
> > > the TMEL server based subsystems (Q6) and the TMEL client
> > > (CPU/BTSS/AUDIOSS), used for security services like secure image
> > > authentication, enable/disable efuses, crypto services. Each client in the
> > > SoC has its own block of message RAM and IRQ for communication with the
> > > TMEL SS.
> > > 
> > > Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > > ---
> > > #V3:
> > 
> > Creative. Where are the previous changelogs?
> > 
> ok, will add
> 
> > > ---
> > >          Fixed wrappings.
> > >          Made mailbox-cells as a required property and changed value to '1'.
> > >          Fixed to use compatible as filename.
> > >          Renamed compatible as per Krzystof's comments.
> > >          Dropped unused label.
> > > 
> > >      Following tests were done and no issues.
> > > 
> > >         *)  Checkpatch
> > >         *)  Codespell
> > >         *)  Sparse
> > >         *)  kerneldoc check
> > >         *)  Kernel lock debugging
> > >         *)  dt_binding_check and dtbs_check
> > > 
> > >   .../bindings/mailbox/qcom,ipq5424-tmel.yaml   | 62 +++++++++++++++++++
> > >   1 file changed, 62 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
> > > new file mode 100644
> > > index 000000000000..2e3c79add405
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
> > > @@ -0,0 +1,62 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mailbox/qcom,ipq5424-tmel.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm TMEL IPCC channel
> > > +
> > > +maintainers:
> > > +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > > +
> > > +description:
> > > +  TMEL SS provides different kinds of services like secureboot, remote image authentication,
> > > +  key management, crypto, OEM provisioning etc. This patch adds support for remote image
> > > +  authentication. Support for rest of the services can be added.
> > > +
> > > +  The QMP mailbox is the primary means of communication between TMEL SS and other subsystem on
> > > +  the SoC. A dedicated pair of inbound and outbound mailboxes is implemented for each
> > > +  subsystem/external execution environment which needs to communicate with TMEL for security
> > > +  services. The inbound mailboxes are used to send IPC requests to TMEL, which are then processed
> > 
> > This string is 100 chars long. What is the recommended wrapping
> > boundary?
> > 
> I kept it as 100 and checkpatch did not throw any warnings.

"The preferred limit on the length of a single line is 80 columns."

Documentation/process/coding-style.rst

> 
> Regards,
>  Sricharan
> 

-- 
With best wishes
Dmitry


