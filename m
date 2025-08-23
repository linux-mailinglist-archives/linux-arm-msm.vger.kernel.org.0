Return-Path: <linux-arm-msm+bounces-70489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B635B32C05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 22:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0F17175DA2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 20:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA21B2EBBAF;
	Sat, 23 Aug 2025 20:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="owJUtLPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679FD2E7F39
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 20:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755981841; cv=none; b=CxO/NGSwjVEdtnrPfKaq/cX5c4HR0w7EkPp1gMI5GnSuCIhPOivpf5Pt5VXOkrbycbBfqR2X3cPVamcUb5+PEk74TQ73Qqoodx6ICe44MVf/NCyTQBvOCeUQJMQpBurMjSc9u/C7uMoD8qVS7e3bkfk84C6h5sKu0gpjgYt6nrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755981841; c=relaxed/simple;
	bh=0Dda5qm2OHi63pkDwgChgj6GsL0RlbZr+Dk8jL/as2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmnCqC5gbRvCjdizz4gLmvWABN0AnlUP5exLgoxJibTP19tiMJXEIyoCJCm44DwJgLqT2POOZwt4IRRyLun9gmkEKnxhMdodW4LK/rznH+1XP0YGE/TTYZiZyXyBgcPRXSdmn6pguXdonhfwwfKBh5VWofBCqr9r/Yc8JF1cSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=owJUtLPj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c79f0a5b8bso560836f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755981837; x=1756586637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncOl5iwhH0rvJNuoHUdRLF2/Z5/Gu+uKD3hX+7/KMaw=;
        b=owJUtLPjT+iy46ZcmwQBLigZcBX1+DMpNeqRqCcXMGhKbCeG3Bu6Z7XVTYglvPl1ev
         D/SpA0gXBk1MWzCJyq6SrrFTKNs8Uqu931SJmeWRrZtLrqZ8o3EJWyCTZzyGC1fyqKng
         1FpMqxp916FixxFPfdBDlnbtMD9+t2+zMf+aU5smXUepvBBO5jzbaSfCbaQIj89YVRrp
         aS/J0fMeLFHuY4cDgbfQIhjS51ZnKsxfqAbxKLRb2BEj4GKubpIKTtcI5eAtlKRcnuWl
         6QGqQ2oarvI/gH1esa8e8M8phO/26YUBe8qhLpu22rIHgKdhXMnyzq7crmbFO9vvh8OV
         nyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755981837; x=1756586637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncOl5iwhH0rvJNuoHUdRLF2/Z5/Gu+uKD3hX+7/KMaw=;
        b=NTYIDBGCROU1kdq8ZzVSMYJMX6Qi/FfG4wKvzBqeRjFJm0C0JnOazPTSa/hnbKAlD8
         5wPJuAX0hKH82vDyNCUc52QcwjSyVkACDUcs2uVYY9yEJWs0qn/klRJwbAbHj0UXBnGg
         nBE+AyfODZj4MtrESoU3hn6TNxGedtONGE5RQs2+CD+P1G1CV5Zl1aB3mHuRltcVzNl3
         OCgj0w13mCiOSk1Re0AMZhg19dmAOYQFs3gIrJxNx89IHky4sJdn4xrXcPswzY2Cpsbu
         Otmy+Rg5GhMpJ+1cSZAWXZdieSXFYfHhgAiLUub3asxB9NPTnfUhOKxUaeeMVIzKh7gv
         LroA==
X-Forwarded-Encrypted: i=1; AJvYcCUPdRDh0e/oGyqMEJCYP74mf/SZhDtzhTUhWLnuuM6ctFrOnMzCTZe5rVNjLL2VlSSX8rvJJfnfq6l0LY/K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm93CX4qtAKLT36NDTj+DtCQTOMWNviLa6rYnWXj02n+pMhh9i
	zr8yKPtYrTMNQoIfaNLqqIXm2BNwiq3BmBNHdZ9kkppSon/32KgMH/+WEw21PsEbv4c=
X-Gm-Gg: ASbGncsVNzjuHC8mJCxByUnojAAZnN8P9z7bPm9mgVpFvK0arXoag48OX4zeCHbpUak
	5aYOsy8NY6GEWZpEFUB2FneRFPpSiK5enUT9zI7vbgMw5mHpJEawqm6LVeSm6+X1NiBe9pTqfXw
	3ifpLF1pfkIhEDoa9czMFgH3ylLtTheTgTj+I/C50RfRSWra0/YooTg809DMjNSUih1PYJFjMM0
	w8MB/B3K1Asb1qe96cnmeZCkJk+vNZEDXMEdNbCixtwEljJ7+/5fsQ1yAsjdG6iYNRVct/id8aS
	m2tlbzh855GMV+gCecVjDgm6h/AVMYQVRa0R0j3BWif1kzKogOxiSt581OJLluYYg9orvanA7P3
	Reb/R0ui0jfFSyHLZ6uq0jTg1a7XvGCY0H1o=
X-Google-Smtp-Source: AGHT+IGs4eKFbPlrT8Yv6hTCIpTHOphruT6aa4eb9E8LlM4kYYOYgvkuN1xHLJp/ymLK+6lCX00Jaw==
X-Received: by 2002:a05:6000:22c4:b0:3b8:d2d1:5bfc with SMTP id ffacd0b85a97d-3c5dcdfed86mr4339314f8f.37.1755981836506;
        Sat, 23 Aug 2025 13:43:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:514d:30f3:c6be:a5b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211b0esm5171237f8f.42.2025.08.23.13.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 13:43:55 -0700 (PDT)
Date: Sat, 23 Aug 2025 22:43:52 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <aKooCFoV3ZYwOMRx@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>

On Fri, Aug 22, 2025 at 10:10:30PM +0530, Mukesh Ojha wrote:
> On Fri, Aug 22, 2025 at 06:26:19PM +0200, Stephan Gerhold wrote:
> > On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> > > On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > > > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > > > >>>> +int iris_fw_init(struct iris_core *core)
> > > > > >>>> +{
> > > > > >>>> +	struct platform_device_info info;
> > > > > >>>> +	struct iommu_domain *iommu_dom;
> > > > > >>>> +	struct platform_device *pdev;
> > > > > >>>> +	struct device_node *np;
> > > > > >>>> +	int ret;
> > > > > >>>> +
> > > > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > > > >>>> +	if (!np)
> > > > > >>>> +		return 0;
> > > > > >>> You need a dt-bindings change for this as well. This is documented only
> > > > > >>> for Venus.
> > > > > >> You are right, wanted to send device tree and binding support separately.
> > > > > >> But if required, will add with the series in the next version.
> > > > > >>
> > > > > > You can send device tree changes separately, but dt-binding changes
> > > > > > always need to come before the driver changes.
> > > > > 
> > > > > Do you mean to update the examples section[1] with the firmware subnode,
> > > > > something similar to venus schema[2] ?
> > > > > 
> > > > 
> > > > Sorry, I missed the fact that the "video-firmware" subnode is already
> > > > documented for iris as well through qcom,venus-common.yaml (which is
> > > > included for qcom,sm8550-iris). I don't think it's strictly required to
> > > > add every possibility to the examples of the schema, since we'll also
> > > > have the actual DTBs later to test this part of the schema.
> > > > 
> > > > I would recommend to extend the description of the "video-firmware" node
> > > > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > > > TrustZone, so the description there doesn't fit for your use case.
> > > > 
> > > > I think we will also have to figure out how to handle the old
> > > > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > > > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > > > handles IOMMU from Linux). Simply checking for the presence of the
> > > > "video-firmware" node is not enough, because that doesn't tell us if the
> > > > PAS support is present in TZ.
> > > > 
> > > > I have been experimenting with a similar patch that copies the "non_tz"
> > > > code paths from Venus into Iris. We need this to upstream the Iris DT
> > > > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > > > which doesn't have functional PAS when running in EL2.
> > > > 
> > > > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > > > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > > > or directly with the registers. I don't have a device with the new
> > > > firmware to verify if that works.
> > > 
> > > You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> > > but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> > > used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> > > video-firmware's iommu property is also important.
> > > 
> > 
> > Yeah, this sounds good.
> > 
> > > > 
> > > > I'll try to send out my patch soon, so you can better see the context.
> > > 
> > > Are you saying that you are going to send patch to support IRIS on
> > > x1-el2.dtso in non-secure way i.e., non-PAS way.
> > > 
> > 
> > The background is the following: I have a pending patch to add iris to
> > x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
> > was to disable &iris in x1-el2.dtso (because the PAS way seems to be
> > just broken), but then I saw that e.g. sc7180-el2.dtso does have working
> > Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
> > code as-is from venus into iris works just fine for x1-el2.dtso, so
> > disabling &iris in x1-el2.dtso just because the "no_tz" code is
> > currently missing in iris doesn't sound right.
> > 
> > As far as I understand the approach you use in this series does not work
> > without the TZ changes for older platforms like X1E(?), so adding that
> > code in iris seems to be the best way to move forward.
> 
> Yes, this series has dependency on firmware and will not work for older
> platforms.
> 
> > 
> > I started working on a patch for this a while ago, it just needs a bit
> > more cleanup. I'll try to finish it up and post it so we can discuss it
> > further. I think the IOMMU management in my patch would even work as-is
> > for you, you would just need to toggle a boolean to use the PAS instead
> > of accessing the registers directly.
> 
> Sounds like a plan.
> Thanks, please cc me when you send the patches; So, I could test along
> with my changes and make dependency on it.
> 

Krzysztof raised the concern that we shouldn't model the IOMMU specifier
for the firmware using a "video-firmware" subnode [1], similar to the
discussion for the "non-pixel" subnode recently [2].

I mostly finished up the cleanup of my patch, but I don't see any point
in posting it without an alternative proposal for the dt-bindings. For
this case, I think a simple property like

	firmware-iommus = <&apps_smmu ...>;

instead of

	video-firmware {
		iommus = <&apps_smmu ...>;
	};

could perhaps work. (XYZ-iommus isn't standardized at the moment, but I
think something like XYZ-gpios would make sense in this case. There are
many other possible approaches as well though.)

Unfortunately, I won't have enough time in the next weeks to fully
implement and propose an alternative. I'm assuming you still have
ongoing work for supporting the "non-pixel" IOMMU, perhaps your new
approach can be adapted for video-firmware as well?

I've pushed my current patch to a branch in case it helps. It's similar
to yours, but it has no external dependencies except for a fix in iris
I sent recently ("media: iris: Fix firmware reference leak and unmap
memory after load" [3]). You could use the non-PAS use case as a basis
to add the initial implementation in iris independent of this larger
patch series.

https://git.codelinaro.org/stephan.gerhold/linux/-/commit/1e068f5864d958ab9e807e6e3772b778cd0edea8.patch

For the PAS+IOMMU use case, it should be enough to set core->use_tz to
true, plus any changes needed for the SHM bridge (and maybe resource
table). The IOMMU management is independent from core->use_tz.

I'm also happy to add the non-PAS approach later on top of your changes,
whatever works best for you. :)

Thanks,
Stephan

[1]: https://lore.kernel.org/r/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/
[2]: https://lore.kernel.org/r/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/T/
[3]: https://lore.kernel.org/r/20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org/

