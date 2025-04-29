Return-Path: <linux-arm-msm+bounces-56057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A55AA0616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2898C3B62FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC6D28FFD4;
	Tue, 29 Apr 2025 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwu95V8J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8632C28C5DC;
	Tue, 29 Apr 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916465; cv=none; b=X6KguyPeitNh5UOxojy3RC4WdmrZX2zYlucz9iixr3I+H3upZUTPJXJpVg2DFh3mjDbjjBT25HcomKS6Co9JjOs7aQEYxRqgcfXaHPm66V03is8odaLjay32uIpLXtUF7AHb6lJwAeL5gTud5CPspwSC+PhKQzNof61i5DPQ3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916465; c=relaxed/simple;
	bh=0JH0Z7oTPN0PihVowtifv52lUTa+jlkr/MLQBRnPoFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihMJazCkAk4HvBtATBN/l30S8j6tfI4HJlef1Tbxj7UMgraQ2kWh8ePoyOppJOQOFFzbnX2JS34GU8YrZ9JWlQxVHdVnHYhZbwLROwFX/J9sQ+NLJkyJna4TETzGuSaemv+XNMEn7C2Xgn+G4OgjDs9teC0oh0FIR4ESG+zec4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwu95V8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFE5C4CEED;
	Tue, 29 Apr 2025 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745916464;
	bh=0JH0Z7oTPN0PihVowtifv52lUTa+jlkr/MLQBRnPoFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwu95V8Jxq0ApZ/A8MUaQ76OxAAD8CpamSIc8KQkl61x+99eL7RVBgCEw4bqJUphg
	 t6QF65fNipJ00S0Kf3VhVkEUWnUpK8riojOzxwlo6jeJCpahPvyOC3GA0Jc5cDJBJr
	 vF1ZNdDh5oVjXNtCab0Y/1P+bgZ3d7US27chWydRXBVDwIgm5scEWGtqZqgZpPZFPj
	 ncWFnLKXoYlGO16/XznYJMYEKZzGHUQVVyzG87F04CF/4g8I4eT464a3Sh3cd6dprp
	 Ofgw43I7VZid7Ly6zlTSiloN04N368hqq3KMzmNgSBHBrlUbCzabz3iz2Rs6GpTc/p
	 rY3r8f4MJ+SuA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9gcz-000000008FN-10kp;
	Tue, 29 Apr 2025 10:47:45 +0200
Date: Tue, 29 Apr 2025 10:47:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supply
Message-ID: <aBCSMaZ7_tl-dEkB@hovoldconsulting.com>
References: <20250429075440.19901-1-johan+linaro@kernel.org>
 <f44722a5-25b5-409c-baec-13d19af61d43@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f44722a5-25b5-409c-baec-13d19af61d43@quicinc.com>

On Tue, Apr 29, 2025 at 04:24:19PM +0800, Qiang Yu wrote:
> 
> On 4/29/2025 3:54 PM, Johan Hovold wrote:
> > The PCIe PHYs on x1e80100 do not a have a qref supply so stop requesting
> > one. This also avoids the follow warning at boot:
> >
> > 	qcom-qmp-pcie-phy 1be0000.phy: supply vdda-qref not found, using dummy regulator
> >
> > Fixes: e961ec81a39b ("phy: qcom: qmp: Add phy register and clk setting for x1e80100 PCIe3")
> > Cc: Qiang Yu <quic_qianyu@quicinc.com>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---

> We have QREF for each PCIe port on the X1E80100, all of which consume 
> the regulator L3J. Although the PCIe PHY uses QREF indirectly, this 
> creates a dependency, right? 

The PHY binding should describe the direct dependencies for the PHY, so
the addition of qref for sm8550/sm8650 was probably also a mistake.

From what I could tell there is not even a one-to-one mapping of qref
supplies to PCIe ports, but perhaps you can provide more details on how
this fits together here?

> If PCIe doesn't vote for it, how can the 
> PMIC driver decide when to disable L3J during system suspend or runtime 
> suspend? Is there a chance that L3J could be disabled while PCIe still 
> requires it?

If the QREF supplies can be turned off, you may need to mark them as
always-on until things are described properly. But whether that's needed
is not even clear at this point:

	https://lore.kernel.org/lkml/17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com/

Johan

