Return-Path: <linux-arm-msm+bounces-45778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A95A18E8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BB9B188B56D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648302101B7;
	Wed, 22 Jan 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIdvPI3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C22E20FAA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539002; cv=none; b=hCF3Zy6GQYxiUWLeiFRM38/U4ddWI/4tCdRtdfOajre/t97KfDOf1qdTOTFPcveMVqm2pe8rm3jumXjROtaqgBO+OXIFiLgmUJUTG6cj4oNpepiIv3mwSY5SVijkoKP/pg+FbdbXgZctXXIN8a0CiQMpZtPJs4UqNdlOz2/1RFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539002; c=relaxed/simple;
	bh=zy6h1JnlKDXFwQP5GSEaCP+uF88TIdw8f4LXte9R6oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgQ0KW0YWomWkO/FlG2VfOnXuhLSAum10Kbh6K51UGmoxOrgKZdIgs4XE9Rhg1kXCiM736ilLmJl9CeTR+iEonzr80Is3vlPl4GY8qsVAVWPmdrJZhUkZMeaoGnAwCbtsABNwW11yfoqz6g/FKrXNo2unDDAUozgaELfZmiPnHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIdvPI3f; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so6951526e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538997; x=1738143797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3S/0JLlz7LzJBPei7H8kq5dNzr9XPGVy0+GvfwBxRY=;
        b=FIdvPI3fQQkNlntCoiyXMS08+IcLMe+zSbJBIau+Ku1GeoMBOtogRAT984goE94wfb
         TiyaC62PXkmUejFfwZPh7Vz3O6UXFjIhgsQEdcXbencV5omqWWPGeTJPyNmTbluBTYOA
         ieNn9wxsY7g51bM8iKQjvAvko8cUJOwqC1SJq3a49qnirvxoy/RQ540Sl+qW7K+4E+Im
         DHJ8H4eluWcA15cHZj94OkDEaWqbfnJ0a6tGche5gsGoTOmrhFbvErJcvf0JdZxbPp1E
         fyfHqHXX/6SMonjcJaIqrAAbu8SCiOw8vVTYUP3voXoqxQgjKRrf/vW9Z2vvUS9ZsIlZ
         BDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538997; x=1738143797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3S/0JLlz7LzJBPei7H8kq5dNzr9XPGVy0+GvfwBxRY=;
        b=GmlOz/9TparSviXAaQQyv6KYVFwzo86rr/2d9pk5sZxEWs1juP+XJkgGrmAclx5B3N
         my8v4KBUHDqtjignqd1mPPHodZWFhCkU67p9J7xUqmVWy19QHQcmQKZpuyDh6afBGVsp
         Oili+e2HmzcOV1DIVkUus/jMQP0oO9FhhuuWt3rbuSQmyXVhV2NSsFLBzowl8j7nXbRv
         PU+nmPIISw2Lwy2h3xq+z1m5CmEasKQugHz/hWsZPwQU1z6Swzc/Zindlh0pr2R/sJBr
         1qhGCi1s8id8sDQKCD6P5Q0tcS4g8CV7/SE9CqA1JTNp7jO1bzMdjZGMw1XeicZs9XNy
         1V6w==
X-Forwarded-Encrypted: i=1; AJvYcCUQvtDfo3Ma/i7EasLbJx593o9v6qnSmR1icLRKfnySVR8gXzzlNip6uX8Os9f5KyxDlrjurpq3IwRGnBNX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6n8SuBzI5pjC7L/SSmScD6fuQEm4DpPx5rsQB0R4iLdjgaTkn
	ME6Z7p8Q8ijPrgXbRfASNaO/i8mgEa2eWfEKn7F0aHgyYXISe+/okY+9TBEJJR8=
X-Gm-Gg: ASbGnctuilu15XAX6AdF6zNaRqO08XF9pusrspgaBqyfK58cc8sGjo38kujmnIFM79T
	lkVS2dErupAPguRlCuCskTo4pz9vMPt+O0Z6AFuriCb73l6GLntxpnoMy/D43yskRMc6J2vMTnh
	QYFGR6G5igl1FXCU+UsPn0lCtOD1Va0cIv9WQ5UOHvvRWLZfLqpRUt5mPTKwlg9PgQA38RR4Anc
	ec61J3qCxXPsjelOKMzFT026Lq2MQYR1Q0wuQNtOYM4ZBG9gKXM7+CyANQ85GK0fJ2XSMoEZiQY
	Vp0vHfzKbtw1jMrulhQjhgwSvJM4G5wYHwGBXUELUwohW6Fhwg==
X-Google-Smtp-Source: AGHT+IHoCvY96azOotZwt3BJv8CvaWuf4DBvCn90+oWEEf3LcY7uHtLGbTyHE6SGcx9X9pIuFFB6YA==
X-Received: by 2002:a05:6512:ea7:b0:540:5b5c:c18d with SMTP id 2adb3069b0e04-5439c22a94dmr6016316e87.7.1737538997130;
        Wed, 22 Jan 2025 01:43:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af734e5sm2150125e87.191.2025.01.22.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:43:15 -0800 (PST)
Date: Wed, 22 Jan 2025 11:43:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de, 
	abel.vesa@linaro.org, quic_qianyu@quicinc.com, neil.armstrong@linaro.org, 
	manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <ya27ma6iah7ts6sj35payj6ek4z7m6y5v4pnxd6wtqrp3cbyta@ypvrzwa4bnfv>
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
 <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>

On Wed, Jan 22, 2025 at 03:17:39PM +0800, Wenbin Yao (Consultant) wrote:
> On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
> > On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
> > > From: Qiang Yu <quic_qianyu@quicinc.com>
> > > 
> > > Currently, BCR reset and PHY register setting are mandatory for every port
> > > before link training. However, some QCOM PCIe PHYs support no_csr reset.
> > > Different than BCR reset that is used to reset entire PHY including
> > > hardware and register, once no_csr reset is toggled, only PHY hardware will
> > > be reset but PHY registers will be retained,
> > I'm sorry, I can't parse this.
> The difference between no_csr reset and bcr reset is that no_csr reset
> doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
> are programed. After Linux boot up, the registers will not be reset but
> keep the value programmed by UEFI if we only do no_csr reset, so we can
> skip phy setting.

Please fix capitalization of the abbreviations (PHY, BCR) and add
similar text to the commit message.

> > 
> > > which means PHY setting can
> > > be skipped during PHY init if PCIe link was enabled in booltloader and only
> > > no_csr is toggled after that.
> > > 
> > > Hence, determine whether the PHY has been enabled in bootloader by
> > > verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
> > > present, skip BCR reset and PHY register setting, so that PCIe link can be
> > > established with no_csr reset only.
> > This doesn't tell us why we want to do so. The general rule is not to
> > depend on the bootloaders at all. The reason is pretty simple: it is
> > hard to update bootloaders, while it is relatively easy to update the
> > kernel. If the hardware team issues any kind of changes to the
> > programming tables, the kernel will get them earlier than the
> > bootloader.
> With this change, we don't need to upstream phy setting for all phys
> support no_csr reset, this will save a great deal of efforts and simplify
> the phy driver. Our goal is to remove proprietary PCIe firmware operations
> from kernel. PHY is just the start and will be followed by controller,
> clocks, regulators, etc. If program table need to be changed, the place to
> do that will be UEFI.

Well, that sounds like a very bad idea. Please don't do that. Linux
kernel drivers should not depend on the UEFI or a bootloader. Unless
there is a good reason for that, Linux should continue to be able to
reset and program the PCIe PHY (as well as all other hw blocks).

> > 
> > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 91 +++++++++++++++---------
> > >   1 file changed, 58 insertions(+), 33 deletions(-)
> > > 

-- 
With best wishes
Dmitry

