Return-Path: <linux-arm-msm+bounces-51424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B119EA61426
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E624B16F4F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EAA339A8;
	Fri, 14 Mar 2025 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m34jz9vX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCAC7485
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964054; cv=none; b=FOjMzJIRw1EVvd13AZ9iNLUw6632BcBNi+aWCz5X238sQRB2iq+I3Pf4wTi4jjw1JPjoPcI+gxi9si10rzRkoyiMrmfNiZVl1lKVbyTKOXZ381LmG9ekaZJpoiKTDAqRxTWsw1Ro7DE07yu5YBou7PA9u7sL88XfkOu4JJM0Y1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964054; c=relaxed/simple;
	bh=auNWg3EtXdmee2r1M8LgUXlbLAnbWTsjH3D8o7NFe8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGCCRTEkVadaybD19LLe35LF7twEIXyouukWWnbYYBGAo3MEebKpoqOq+rT8vQs2QEO53Z2O1agKxsdD8QSRRKH8h/OsGqzeFrC/srGTauvpjQT7uBKNED16rF0IcCvjZt1e+YQNPCfAg2wDQxHSqaubM+lmz3BM33jYsb6eqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m34jz9vX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so4733490a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741964052; x=1742568852; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dsQQtVO/hGMC4LT3OjrS/iAkJsL7ea7avit69Kt1D9g=;
        b=m34jz9vX7XhN1qrRHhvnpHzUFkUSqU5hDRmOwgT4JGUVH8ByMZnnyAkqQW2CEvdOjE
         CxeTk1QVTvOZndPosy4urzmV5AbZKSick6gK6MBwUggaIB2qvFBMO/nPrikG7kZ4lDWa
         hdJU3Uz9WZBRehSiMz8ZxFS4+yUlgJ3D5HPy+H1XaQlvICqq2f7Y+AJVTzaH1c/y9T31
         x5XB8k35wCyA0thqHEGU2orjbrcpDIdEDAI4uHjXOn5Y+IhzQAdeO8ydznhUJqoXFYGd
         zD+O9kTl/uPmMA+pwYyuNXY3WVxpUG+yyXqJjoGYmxPvsazxBjxqzQrk+zVXcSQozteE
         7Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741964052; x=1742568852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsQQtVO/hGMC4LT3OjrS/iAkJsL7ea7avit69Kt1D9g=;
        b=ioaL3ld/pTKFdeRCyF3myK6ivH7gpp71wimA+3GywBO9bSmASk5vxw7CkTlVRjL5gA
         yI1ZRhSNtHuOy7GGpSxkuL3SIooGsHEH/Ug2yqu5y0BWBY1gzoCjpXu9hwOOw7iDxUaX
         gNZDGZ6aVDyGD552GPy8iq30GN+r11YNcT5b/x9E2K4iX119zBya50yxG5buq6iAIlbk
         PM6A/hUeqqV9lmQI4GLWzJifJ3HXlhM3HyOzqtmuJZwDiGSNzGaLdb3sR40mV6TUs+bZ
         LVqqqOKurLIiHh6UwvbepWluwejdoJJLdgIal1FTv+R2TJHTpPVu5uUpvVqgK/t5/NQk
         VE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV068TOFVE6yit10TEaguj4qJjGanE+kSzQ+En2xzkP0ENQ3/PFNHhV8JDwAuXZ4XFz5J6TytkDkEb329Fw@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVZX9bX34C3abyyOEbDSRu3vWugNFnY3npTBtyIjouHPx8KVk
	JH8CGHRQ9GuKpCKvkCg7I6z2stvHoeLIEl0JDqOBDpaOrcL9JySl0o7F5gA31Q==
X-Gm-Gg: ASbGncv7EBZQbCI45UErgoUgZGSt8WQH/Y/7x9yP5TQ6/Yu4hbDwhMM4cu32HoCVs+I
	BY3xS6iccybYKTh9VC7huIb2Lj38kv1XvZmmq8dzNloH5bho4lVUSF3H4JXTf/aqab8cQfuxJip
	85oD+sZ9/YjFJ4Nbvt6gZM0mb2Z7yluiLP5Ac++OL7t81ZBICrK7YLtqCRN4LuvPKlYqPtS9YvP
	r/Yac+rxooqSFDgJoBQ/2s1iMKdV9lGpILQAO57PUtwBaPOud8FUBIu0BQVqM55tjEsX/StIXIf
	NHO+fP/8H2w6TQeHAVb5EgD7xc9dbIkvE29CMolhMP2OgmEnunTIlioo
X-Google-Smtp-Source: AGHT+IHzKryo+V7jF5cXWjTyfNfCm3Y69vTnLwXkAPKHfg34JnPxyDQUu9P0t75RNjjyMzo4OR6/iA==
X-Received: by 2002:a05:6a21:4d05:b0:1f5:591b:4f82 with SMTP id adf61e73a8af0-1f5c1184768mr4519574637.16.1741964052644;
        Fri, 14 Mar 2025 07:54:12 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694e69sm3054059b3a.141.2025.03.14.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:54:12 -0700 (PDT)
Date: Fri, 14 Mar 2025 20:24:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, kishon@kernel.org,
	p.zabel@pengutronix.de, dmitry.baryshkov@linaro.org,
	abel.vesa@linaro.org, quic_qianyu@quicinc.com,
	neil.armstrong@linaro.org, quic_devipriy@quicinc.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset
 support
Message-ID: <20250314145407.5uuw7ucrdhca4z5i@thinkpad>
References: <20250226103600.1923047-1-quic_wenbyao@quicinc.com>
 <e556e3c9-93ee-494a-be35-9353dc5718e4@quicinc.com>
 <Z89Ek8Y7TRSgTuMg@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z89Ek8Y7TRSgTuMg@vaman>

On Tue, Mar 11, 2025 at 01:29:15AM +0530, Vinod Koul wrote:
> On 10-03-25, 16:58, Wenbin Yao (Consultant) wrote:
> > On 2/26/2025 6:35 PM, Wenbin Yao wrote:
> > > The series aims to skip phy register programming and drive PCIe PHY with
> > > register setting programmed in bootloader by simply toggling no_csr reset,
> > > which once togglled, PHY hardware will be reset while PHY registers are
> > > retained.
> > > 
> > > First, determine whether PHY setting can be skipped by checking
> > > QPHY_START_CTRL register and the existence of nocsr reset. If it is
> > > programmed and no_csr reset is supported, do no_csr reset and skip BCR
> > > reset which will reset entire PHY.
> > > 
> > > This series also remove has_nocsr_reset flag in qmp_phy_cfg structure and
> > > decide whether the PHY supports nocsr reset by checking the existence of
> > > nocsr reset in device tree.
> > > 
> > > The series are tested on X1E80100-QCP and HDK8550.
> > > 
> > > The commit messages of this patchset have been modified based on comments
> > > and suggestions.
> > > 
> > > Changes in v5:
> > > - Add a check whether the init sequences are exist if the PHY needs to be
> > >    initialized to Patch 2/2.
> > > - Link to v4: https://lore.kernel.org/all/20250220102253.755116-1-quic_wenbyao@quicinc.com/
> > > 
> > > Changes in v4:
> > > - Add Philipp's Reviewed-by tag to Patch 1/2.
> > > - Use PHY instead of phy in comments in Patch 2/2.
> > > - Use "if (qmp->nocsr_reset)" instead of "if (!qmp->nocsr_reset)" in
> > >    function qmp_pcie_exit for readability in Patch 2/2.
> > > - Use goto statements in function qmp_pcie_power_on and qmp_pcie_power_off
> > >    for readability in Patch 2/2.
> > > - Refine the comment of why not checking qmp->skip_init when reset PHY in
> > >    function qmp_pcie_power_off in Patch 2/2.
> > > - Link to v3: https://lore.kernel.org/all/20250214104539.281846-1-quic_wenbyao@quicinc.com/
> > > 
> > > Changes in v3:
> > > - Replace devm_reset_control_get_exclusive with
> > >    devm_reset_control_get_optional_exclusive when get phy_nocsr reset
> > >    control in Patch 1/2.
> > > - Do not ignore -EINVAL when get phy_nocsr reset control in Patch 1/2.
> > > - Replace phy_initialized with skip_init in struct qmp_pcie in Patch 2/2.
> > > - Add a comment to why not check qmp->skip_init in function
> > >    qmp_pcie_power_off in Patch 2/2.
> > > - Link to v2: https://lore.kernel.org/all/20250211094231.1813558-1-quic_wenbyao@quicinc.com/
> > > 
> > > Changes in v2:
> > > - Add Abel's and Manivannan's Reviewed-by tag to Patch 1/2.
> > > - Refine commit msg of Patch 2/2.
> > > - Link to v1: https://lore.kernel.org/all/20250121094140.4006801-1-quic_wenbyao@quicinc.com/
> > > 
> > > Konrad Dybcio (1):
> > >    phy: qcom: pcie: Determine has_nocsr_reset dynamically
> > > 
> > > Qiang Yu (1):
> > >    phy: qcom: qmp-pcie: Add PHY register retention support
> > > 
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 86 +++++++++++++++++-------
> > >   1 file changed, 63 insertions(+), 23 deletions(-)
> > > 
> > > 
> > > base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
> > 
> > Hi, do you have any futher comments?
> 
> Patches lgtm, It would be great if this was tested by someone as well...
> Abel, Stephan, Neil can you folks test this and provide T-B
> 

I tested the previous version and it worked well on X1P40100-CRD. Will give this
version a go and give my tag.

> I am also concerned about bootloader assumptions esp if the Qcom boot
> chain is skipped
> 

In that case, someone should add the PHY init sequence to the driver. That's why
I wanted to have the check in place to avoid silently failing PHY
initialization. Right now, the driver will error out if there is no init
sequence available.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

