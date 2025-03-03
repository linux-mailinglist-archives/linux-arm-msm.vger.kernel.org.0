Return-Path: <linux-arm-msm+bounces-50003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5FCA4C12A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 14:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C407B169C01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 13:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CE72101A0;
	Mon,  3 Mar 2025 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXDwVUdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117286323
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006993; cv=none; b=MfteHkd8uMp+h3HaiiOYAp1bzrJaQik6qhCjQG3CK+wbP5LKXEJeICWVcGG0/XyRXbE0CmGICBUGiUS83uK+YVW5UweFqbgtbtQmPUCpZ5UC59Mw+bVBDcgDmuqtEgoEnTMl62eU4oVEQPIBuUOpbK0jLk+d2EAgu83cGc0s+kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006993; c=relaxed/simple;
	bh=DhfNdV/O+uocDkBJFYE83PtsNs9K9z/PTwLsOVi9J/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mv8vAVSvjf9ua9Kb5+oD9ka0hSDNakGdMXovP2pwETf/Dc5LxhscUQwAwntdYGdDNvnsS81WU7olOT9RKCXfFqnsnP9YdFJD3bS7mvX1a2NZ7htTk9aHua6mGPUuIJUyPVpyEj/kBVm6bLrKxAHLDFz8JfwjV23tMVR9zBazRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXDwVUdr; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bb2fdbb09so12803171fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 05:03:10 -0800 (PST)
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
        b=Rden+41ADFWG+BW9P84YdGIMgLJSgDVmduFwTndZKJZyBMV/Kiyn9pSy2OejQd1b9+
         vMvGeSuai9GuDD9wlXUu3IbW4+6dnFFHF4ekELWtK8r185vL0u57CfBEWgTID9RkFfZL
         fQlJ1KkmY8ZSN3rw7puFzXXqxaASXXwh3TwDLWNLJKuzOLxMpozuX8lbWAPpagqX1kjX
         cKiQp22yfPe+UGXZ8z8hBZeUR9URhkAY26M4fnCmd98l1zv0X9ZSKM0kmzoxdfa8GqmT
         YNUzvfFv/r4ssow+cshJfwgU4EoY6rbhW0xzlzpKI9q6xuJX5fG+WXoezgQjOTQtPYWH
         y8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIaaVFqnUw8/lQdsbHzss3tvYO5KthonkXLmz2Ugp60XkaYYY3Iy+tQJsEzrnaq0W5/Fuz9hsmK36njjW2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1s5RCfyYZfNT04T89ldu3SD2XvcIna/io1hxNzIiVdeKP//TB
	eyI08bSZLPyz2qTYYLgkfmIacL2cBI6RRZkXUzfbriNLH3HTtOp7//XCl2h1GPU=
X-Gm-Gg: ASbGncu6ft58wf94GeR66LcUfBCeEaWzg4Ywgj+eZc6FrUzXjTbrxD5bKLSJpDU0g17
	AEboXwJdED7xkSQLXgH7OR5SFd0n9WWaE/Jw6co+4/WoTDqL8B1cX9ytH7/km6zKeDHfpKfAIP1
	t1vUE7Ywv8+8AL1UGXZaKP3ndQRR/DqERz8KmN9CQEMcyfYwQEchsd6AZ6xw5ZabXcv/bXb4a2s
	l++2eQ8eZ5cW8n5+JJB8F9juKm8JQa/G6acIU9B49B5Qss/Zv/NfxBgJ6OEUMIJ2grOL+B2uTBn
	gB0iPbE0M0Usn39mopHH3PkjdChK1QilfpivwdlzAJumSveQ0t1yC5bE2XfFaXc5ouTZVo8mmav
	mS+d6LDwPm7XQIRia62+TUh6x
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
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a22a637-c3f1-49b3-adf5-3e952c7d336a@quicinc.com>

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

