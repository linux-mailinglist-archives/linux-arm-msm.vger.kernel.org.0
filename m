Return-Path: <linux-arm-msm+bounces-40525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11EA9E59BB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CFF1615FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 15:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE9621882B;
	Thu,  5 Dec 2024 15:32:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B656E1DA10C;
	Thu,  5 Dec 2024 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733412729; cv=none; b=a4jStvM9ZBeCwOOWLkWZiCqH2Ujqu4xQ5RGlCRdp5VjzMATFYV23101JLqU7L/5IgW7P+MSYkWwn4G3nkWz53/VsRA/MGg5fQPmsaCiUlkMh38GP8yROiMBpk09dgO3KIviDrOCwpvoxIQUXoorw7u1ZPkz9B4l5OtYEQvFxHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733412729; c=relaxed/simple;
	bh=fNGRTFyLlHhgN4Pb4CFh4ptW94/MwZGUclyDetcRdgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dutw9xUalKxPkhE/ZPNvsQPc1KX6VBD8gBZ3Z8JzK5/eVjiWGr6RdwjlTxtPzXdg9hA/MdBt525OwBmDTs07FF6K9IL0pdZcaqzyGmCLqvQLzGFUG6VDDSugn3OtQIsjWk+05Cawye/w9b7hCwjn8SP7d3Z+hWWzd3R3tMGPqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 025411063;
	Thu,  5 Dec 2024 07:32:35 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CB383F71E;
	Thu,  5 Dec 2024 07:32:05 -0800 (PST)
Date: Thu, 5 Dec 2024 15:32:02 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <andersson@kernel.org>,
	<konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
	<quic_kshivnan@quicinc.com>, <arm-scmi@vger.kernel.org>
Subject: Re: [PATCH V5 1/2] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Message-ID: <Z1HHciQfWL-l79YR@bogus>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
 <20241115011515.1313447-2-quic_sibis@quicinc.com>
 <Z1BBirNWH1eaSKtr@pluto>
 <73a16eb4-e590-92db-ee24-cc4f42a9de01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73a16eb4-e590-92db-ee24-cc4f42a9de01@quicinc.com>

On Thu, Dec 05, 2024 at 04:37:28PM +0530, Sibi Sankar wrote:
> 
> 
> On 12/4/24 17:18, Cristian Marussi wrote:
> > On Fri, Nov 15, 2024 at 06:45:14AM +0530, Sibi Sankar wrote:
> > > Add QCOM System Control Management Interface (SCMI) Generic Vendor
> > > Extensions Protocol documentation.
> > > 
> > > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > > ---
> > > 
> > > v4:
> > > * Update the protol attributes doc with more information. [Cristian]
> > > 
> > >   .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 ++++++++++++++++++
> > >   1 file changed, 211 insertions(+)
> > >   create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> > > new file mode 100644
> > > index 000000000000..141bc932e30f
> > > --- /dev/null
> > > +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> > > @@ -0,0 +1,211 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +.. include:: <isonum.txt>
> > > +
> > > +===============================================================================
> > > +QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
> > > +===============================================================================
> > > +
> > > +:Copyright: |copy| 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > +
> > > +:Author: Sibi Sankar <quic_sibis@quicinc.com>
> > > +
> > > +SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
> > > +==================================================================================
> > > +
> > > +This protocol is intended as a generic way of exposing a number of Qualcomm
> > > +SoC specific features through a mixture of pre-determined algorithm string and
> > > +param_id pairs hosted on the SCMI controller. It implements an interface compliant
> > > +with the Arm SCMI Specification with additional vendor specific commands as
> > > +detailed below.
> > > +
> > > +Commands:
> > > +_________
> > > +
> > > +PROTOCOL_VERSION
> > > +~~~~~~~~~~~~~~~~
> > > +
> > > +message_id: 0x0
> > > +protocol_id: 0x80
> > > +
> > > ++---------------+--------------------------------------------------------------+
> > > +|Return values                                                                 |
> > > ++---------------+--------------------------------------------------------------+
> > > +|Name           |Description                                                   |
> > > ++---------------+--------------------------------------------------------------+
> > > +|int32 status   |See ARM SCMI Specification for status code definitions.       |
> > > ++---------------+--------------------------------------------------------------+
> > > +|uint32 version |For this revision of the specification, this value must be    |
> > > +|               |0x10000.                                                      |
> > > ++---------------+--------------------------------------------------------------+
> > > +
> > > +PROTOCOL_ATTRIBUTES
> > > +~~~~~~~~~~~~~~~~~~~
> > > +
> > > +message_id: 0x1
> > > +protocol_id: 0x80
> > > +
> > > ++---------------+--------------------------------------------------------------+
> > > +|Return values                                                                 |
> > > ++------------------+-----------------------------------------------------------+
> > > +|Name              |Description                                                |
> > > ++------------------+-----------------------------------------------------------+
> > > +|int32 status      |See ARM SCMI Specification for status code definitions.    |
> > > ++------------------+-----------------------------------------------------------+
> > > +|uint32 attributes |Bits[31:16] Reserved, must be to 0.                        |
> > > +|                  |Bits[15:8] Number of agents in the system                  |
> > > +|                  |Bits[7:0] Number of vendor protocols in the system         |
> > > ++------------------+-----------------------------------------------------------+
> > 
> > Thanks of clarifing this....may I ask why number of agents is reported
> > here too given that it is already exposed by Base protocol ?
> > 
> > Not really arguing about this so much, but you will end up having to maintain this
> > on 2 different protocols fw side...or are they not 'agents' in the SCMI meaning ?
> > 
> > Anyway, I'm fine with it, even though you dont seem to use this
> > anywhere.
> 
> We don't use it anywhere and it looks like it was just put together
> so that this protocol is compliant to the spec :|

Interesting, I need to dig and check if that is needed to be compliant.
Even if it is required, please add a text to say it must match what std.
BASE protocol response(IOW it just can't be random here as you don't use
it anymore). We may decide to match and warn if required at all.

-- 
Regards,
Sudeep

