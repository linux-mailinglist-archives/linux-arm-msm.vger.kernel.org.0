Return-Path: <linux-arm-msm+bounces-62094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAFAE4760
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF48C1887BA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314562749D8;
	Mon, 23 Jun 2025 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kh/8uP1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDF26E6F9;
	Mon, 23 Jun 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690233; cv=none; b=M9kq4mNGOoncNPL9sBDrurT3c2GtluCbKg8fVNqUvDbhMYqOWqWILa9ixWp2pOOxsi10ni0wycFASHfu3mJ3hh5Obdjxx4dArOytuFRmhNvCrCEgImB9AbuURDvgaA65+WyzcL5NWVN7OHah3LkoAdYI1QFx61mSrU9zM00+PA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690233; c=relaxed/simple;
	bh=j0b3RDo14/N3cFDi2JteD+j/t8FhMp//FXZb/68VYcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cg2I6UHT2yZiV9iENDseeX8awUfgUVdODdF4ZRprpnue4W+tQHPjGbmjAHWo4mD068cUC94FrU7KCih1hYtozamXvtFfOUWt9G2Njxpd5ltOT/NZbCWVzUw5NLUxrPT3js0aUNlstyg1SX9sfQbnlj6W0QTHImk1AOOMTOCmEUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kh/8uP1G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D09C4CEEA;
	Mon, 23 Jun 2025 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750690232;
	bh=j0b3RDo14/N3cFDi2JteD+j/t8FhMp//FXZb/68VYcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kh/8uP1Gn5D07vxF9aOAjQozPUQQc9vzg/IqQHotfJZB6/uolcT1FHQE17wD2ZfpK
	 qh52ukSwjcrM7sBLt9uFSh8g84xEEdZ2CcezLP2F99Rk4I1KuAGrYR+OIcf+ntLBG6
	 iWccO1iGakE++zH6/VLroQp8WtNK2bgAm/+A/33/l9J03FyOViOzkKBAwr30965CHq
	 wu2oTNyNApDp4clRQpJdwPMW+36U+nAszEAuMHLm22DTAi93OXdDTEK/wxGTTXQa9d
	 Cp5pMTrSFI2eZ/pTbrDHrPiya9hqNJArqZOqIAMeFTHGcfcLPNsdTtjl79jR+rGyb/
	 ipJZS0ej93g4Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uTiV9-000000006Wo-3rlv;
	Mon, 23 Jun 2025 16:50:27 +0200
Date: Mon, 23 Jun 2025 16:50:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <aFlps9iUcD42vN4w@hovoldconsulting.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFloifxONXnQbVg6@hovoldconsulting.com>

On Mon, Jun 23, 2025 at 04:45:30PM +0200, Johan Hovold wrote:
> On Sat, Jun 21, 2025 at 10:56:11PM +0300, Dmitry Baryshkov wrote:
> > For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
> > update variables in the permanent storage. However being able to read
> > the vars is still useful as it allows us to get e.g. RTC offset.
> > 
> > Add a quirk for QSEECOM specifying that UEFI variables for this platform
> > should be registered in read-only mode.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++++++++++-
> >  include/linux/firmware/qcom/qcom_qseecom.h      |  2 ++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> > index 98a463e9774bf04f2deb0f7fa1318bd0d2edfa49..05f700dcb8cf3189f640237ff0e045564abb8264 100644
> > --- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> > +++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> > @@ -792,6 +792,12 @@ static efi_status_t qcuefi_query_variable_info(u32 attr, u64 *storage_space, u64
> >  	return status;
> >  }
> >  
> > +static const struct efivar_operations qcom_efivars_ro_ops = {
> > +	.get_variable = qcuefi_get_variable,
> > +	.get_next_variable = qcuefi_get_next_variable,
> > +	.query_variable_info = qcuefi_query_variable_info,
> > +};
> 
> It looks like the efivars implementation does not support read-only
> efivars and this will lead to NULL pointer dereferences whenever you try
> to write a variable.

Ok, efivarfs seems to support it, but you'd crash when setting a
variable from the kernel (e.g. from the RTC driver).

> Also not sure how useful it is to only be able to read variables,
> including for the RTC where you'll end up with an RTC that's always
> slightly off due to drift (even if you can set it when booting into
> Windows or possibly from the UEFI setup).
> 
> Don't you have any SDAM blocks in the PMICs that you can use instead for
> a proper functioning RTC on these machines?

Johan

