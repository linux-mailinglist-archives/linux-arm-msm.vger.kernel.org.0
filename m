Return-Path: <linux-arm-msm+bounces-38244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5099D135F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 15:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 803D32841A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB211199FBF;
	Mon, 18 Nov 2024 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rn62nbwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445CB1A9B2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731940753; cv=none; b=bqoSSanm9fBrkAhQFMJ5M7F8wQgm7KY2/kGbdetLBnKsZ4uu80R1kyby1T6MWzPFLIANhzni+n660IHT7VLOPOb1ZqbXaKjFajY/eidrGzCEsJ1fNGJsHeRYWJEASfSSROt1+RHXp0XWrtDK3RHQFzDvEEk94q16K6R1I/qyl1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731940753; c=relaxed/simple;
	bh=BC6dgZpu/Kre68GQBaTE0qMJ7A9bxvl9WN55esV2qYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnR/mUqJjlv+sgdo97z89vG82bHR6E3nQRqrwaf6BakcGsTnZhooosO9BgzfYLywJb2v6U6XBBO74hjuVr5bk99cFsOP+jmdzH/nkibibSrrmRi41ARVRsCzkgAPu0CDUHlM3FqYU7PsSZru9ztdgRyPG2fpis0NK3408J7syW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rn62nbwq; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee40e83288so47390777b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 06:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731940751; x=1732545551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JpSDLLCiFqZ+5i7REgdBLPfhOaMYuIy1hAA6x67KYek=;
        b=rn62nbwq+I03/FbVBXKGCF8Dz28Az31RIHK7VDyEBZFWO1UFwmOXIezWVBBQhaKlf+
         S/JRLGb39RogoHvx/ORIsYuFQN77IYvnj6HSZ4XFc59eXvreZyoYll8tooK7b2bOE2qw
         rr6hXOBVmLUq6q1ioacW4ve7StZOV3CL/3m5Tf4jumVU+O+FI6fkEg85+s2/90Y1ZPSd
         kUIFRcPU2pGmqpEUw5lJTtPO3WsNgUvdT+tpmU4oqsTNBV2UwprzOaTGlbygQEFYf/8B
         TBwzn6JUO1kVrTe8YqWGemHJmFfYvotAMkS94GKUu0A41RWFCNwFJXiPKP+0B6RTVDoi
         gS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731940751; x=1732545551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpSDLLCiFqZ+5i7REgdBLPfhOaMYuIy1hAA6x67KYek=;
        b=hwJXrQ6x70PfyEnJ3G+wAxmmUG8BleVoKoniZT1Lec8scc6znPQd3z51T94tqzA9F6
         iiDT5S0J9r+p/wrd2G84TDJN2bzTJZszla+QLCxgGoStmCnPxeVzb8k/MFnwl/NPFQBR
         rKxxN6I9eIaShtJltje3cr9z/RzuiX3a/YXpaFvPn+RskcpWHlm6NBwMsykvVMJ3i/P5
         SrZ3G5yqQa+WIgKKss0uQy/UGc9U43/B/eSgciTkQuk+u8Snn7kMscvjcZL0tmk0TKZA
         UH2EOR8kX/weUQd16qDBwnji5+hsiaxH56mqxpvT6utb/GDd+hj3HpUDyqU9eVp/GnOP
         LSTg==
X-Forwarded-Encrypted: i=1; AJvYcCV7GQ8kDoDzpd3wiBGdUw67D/fGbLRsJrNmO/oAnOAhCc4f/0a0k5hz9YU8eunmIGeWGQmJdYtfMsFKKwlo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ZG1v/6ek1Kg92vkNsNgLOsrot3foYmKx2azoQrUFi0FzI26e
	gqr2OwiKmL+mb/EculgRZBpH8cZ6HBARmEEqG3kAWkFw/c+6uc6lH09/+BXfL2LtG3WrxTEdLNA
	/OQ+sbAHnf0N4HJCh3T/NlLpnN5y1yygZT27qzw==
X-Google-Smtp-Source: AGHT+IHcxZP0Ath2/RjkGLMJxqqaiGHP0b+6h9Soy7AfLhFb6uhahD7NhGEvfbdoMkjB6y+o/cSPi6JDoO2JA9z4VLo=
X-Received: by 2002:a05:690c:6806:b0:6dc:7877:1ea3 with SMTP id
 00721157ae682-6ee55a6c9ebmr125661007b3.17.1731940751262; Mon, 18 Nov 2024
 06:39:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <mcyes5nikfr6ptzorlttrzvtjgh5zugmbo5ao3pkh4q2r5h6j4@vonmpvsqykv4>
 <95843301-2061-49bd-80aa-c443e3694438@quicinc.com> <348605e8-a583-49c2-8921-dafed033f53d@quicinc.com>
In-Reply-To: <348605e8-a583-49c2-8921-dafed033f53d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 16:39:00 +0200
Message-ID: <CAA8EJpoGpA4AoUvnf_Nby5e0u1hGjMgyDuv4TVkejZyidBp=Jw@mail.gmail.com>
Subject: Re: [PATCH RESEND v17 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Nov 2024 at 14:12, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/15/2024 10:43 PM, Bibek Kumar Patro wrote:
> >
> >
> > On 11/15/2024 4:26 AM, Dmitry Baryshkov wrote:
> >> On Thu, Nov 14, 2024 at 09:37:16PM +0530, Bibek Kumar Patro wrote:
> >>> This patch series consist of six parts and covers the following:
> >>>
> >>> 1. Provide option to re-enable context caching to retain prefetcher
> >>>     settings during reset and runtime suspend.
> >>>
> >>> 2. Remove cfg inside qcom_smmu structure and replace it with single
> >>>     pointer to qcom_smmu_match_data avoiding replication of multiple
> >>>     members from same.
> >>>
> >>> 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
> >>>
> >>> 4. Introduce intital set of driver changes to implement ACTLR register
> >>>     for custom prefetcher settings in Qualcomm SoCs.
> >>>
> >>> 5. Add ACTLR data and support for qcom_smmu_500.
> >>>
> >>> Resend of v17:
> >>>   Addition of minor fix of the build warning reported by kernel test
> >>> robot [1] by powerpc_random config [2].
> >>>   [1]:https://lore.kernel.org/all/202411140748.6mcFdJdO-lkp@intel.com/#t
> >>>   [2]:https://download.01.org/0day-ci/
> >>> archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config
> >>
> >> Nit: then it's not a resend, but a new iteration. RESEND literally means
> >> resending the same patchset.
> >
> > I see. Since it is a simple "int i" and so did not feel worth a new
> > iteration.
> >
> > Thanks & regards,
> > Bibek
> >
>
> Let me know if you still feel this should be a new patch, I will send
> the new iteration then in that case or I'll wait till further reviews on
> this series.

I think it should be fine like it is now. Thus I marked the comment as
"nit", "not important thing"

-- 
With best wishes
Dmitry

