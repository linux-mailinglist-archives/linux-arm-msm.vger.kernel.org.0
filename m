Return-Path: <linux-arm-msm+bounces-766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966A7EDBAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 07:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2817F1C2098A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 06:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB4D23C1;
	Thu, 16 Nov 2023 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JKPA8XAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09195182
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 22:52:08 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5afbdbf3a19so4806307b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 22:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700117527; x=1700722327; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oc5E6kIcla/Or4QU1XuvIaiW9BS0HQZyOIehNU3S8rI=;
        b=JKPA8XAzdAdGTJOuaT4K7qsHLB1F/NWQTD09BuxtbWnpcYajOZduXcgNWyCE8REp5Q
         V/0yxlsCnJnr1ACDz86vudGvbzhNYOGYTjPVxje9oFSoE05ZW777SwbA/uvNz1U270Db
         nkU8ygjZrPxdVYH7B2ep6LVYm5vn3TMWsiBltDhHwOtQObQKYMv2cvHRDfZKalbzjmmb
         9t/U9HdNY8PmOlKtJUBN4UDfXB0KGxUo9PixlyXxDd5arf+KUAPxtjeOv96NjiBRxxht
         fGm8icxjiVGA6ye+vWaMIweB71Yjs+wpXO95Y+UqRPCEtztBI82AC7aJeesIOq3j3+kG
         6YXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700117527; x=1700722327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oc5E6kIcla/Or4QU1XuvIaiW9BS0HQZyOIehNU3S8rI=;
        b=sIhsuTwcZOB/NsKoU6hi2Q2rpDOgBA6a68cbbm0ebZxXDVfQalnqjnEqUoCT3Iho69
         EhM0IjsKBRUDBImYvT62zRO/l/uQxK4+DasioNc0lcfCjvu1PlsJrA4L+VD1VdL6oXJl
         oZhSbT50vAxdKxPhh1pysEBD6sdGklOtkWXf6V27TlMlDN17yRWt+hvyhViCtL4SOIyZ
         XHCLjDxKUyrQLd47N/97f4/VWovGt+5i4dGkgWRh3CzjMncNCr0QNQ8tztNSfNlM3Emj
         so1FxS0RgJlYFK6sG77L9Pxrk9VbnrY1wcCDhGGIbf5FRz8QYaeIZlzQKbAX0YqLpX57
         kpkQ==
X-Gm-Message-State: AOJu0YxXnjxAmBuvdsbzTyamamfY4vybMsDlyBoD0rswfsLhSdVhS6g0
	4L6V+cT5sJC/NIUCkg9aN2WGoR0kNjWY4Hhcif2BOg==
X-Google-Smtp-Source: AGHT+IF9xl+Hc9uyP+mSbdRq22l1klxH1FdSfYmdGQLsuU3qAhFB8KEVx7+2dM8/7H2WMf9mXaTnItbCGUXlosfWtoc=
X-Received: by 2002:a81:a549:0:b0:57a:cf8:5b4 with SMTP id v9-20020a81a549000000b0057a0cf805b4mr14384806ywg.51.1700117527207;
 Wed, 15 Nov 2023 22:52:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-3-quic_bibekkum@quicinc.com> <CAA8EJpr1NzqiuNVZ0YcLpJ=yeOYFbLouAFgN9VMOiKpmoGVdtQ@mail.gmail.com>
 <7edad996-f148-42d5-8e72-0334d3b9101f@quicinc.com> <CAA8EJpqzEvC-LEjJrOk6Ed8utFNnqgP=qkb0mq-dOfMZd5ij4Q@mail.gmail.com>
 <dba223a1-0456-40b8-b295-ea960867dcf9@quicinc.com> <CAA8EJpqvXb_Zdmq0O0KEA8mn5UkSriCZ02w16dts7Gd84R30oQ@mail.gmail.com>
 <aebdf7f6-48b7-43d3-95af-83859ddc593f@quicinc.com> <be9675a6-a01e-4cf7-95b3-174220d4a042@linaro.org>
 <61d2885a-50f9-419f-8473-10308baed493@quicinc.com>
In-Reply-To: <61d2885a-50f9-419f-8473-10308baed493@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 08:51:55 +0200
Message-ID: <CAA8EJpoTeonht4S5JkW=1VJmKsSFm5iCb_Tz-ZempaRufnjmHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iommu/arm-smmu: add ACTLR data and support for SM8550
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, a39.skl@gmail.com, quic_pkondeti@quicinc.com, 
	quic_molvera@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Nov 2023 at 08:10, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/15/2023 10:12 PM, Konrad Dybcio wrote:
> >
> >
> > On 11/15/23 13:49, Bibek Kumar Patro wrote:
> >>
> >>
> >> On 11/15/2023 4:15 PM, Dmitry Baryshkov wrote:
> >>> On Wed, 15 Nov 2023 at 11:51, Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 11/15/2023 3:08 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, 15 Nov 2023 at 11:22, Bibek Kumar Patro
> >>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 11/14/2023 7:42 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
> >>>>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>> Add ACTLR data table for SM8550 along with support for
> >>>>>>>> same including SM8550 specific implementation operations.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 92
> >>>>>>>> +++++++++++++++++++++-
> >>>>>>>>     1 file changed, 88 insertions(+), 4 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>> index 578c662c7c30..0eaf6f2a2e49 100644
> >>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>>>> @@ -25,6 +25,70 @@ struct actlr_data {
> >>>>>>>>            u32 actlr;
> >>>>>>>>     };
> >>>>>>>>
> >>>>>>>> +#define PRE_FETCH_1    0
> >>>>>>>> +#define PRE_FETCH_2    BIT(8)
> >>>>>>>> +#define PRE_FETCH_3    (BIT(9) | BIT(8))
> >>>>>>>
> >>>>>>> What is the difference between PRE_FETCH_3 and PRE_FETCH_2? And
> >>>>>>> PRE_FETCH_1? Are these real numbers that refer to some amount /
> >>>>>>> count
> >>>>>>> or just dummy names?
> >>>>>>>
> >>>>>>
> >>>>>> No,these are not real numbers, but prefetch settings for a particular
> >>>>>> perfect configuration.
> >>>>>
> >>>>> Then I'd ask for some better names or descriptions.
> >>>>>
> >>>>
> >>>> Noted, PREFETCH_SETTING_n / PREFETCH_OPTION_n sounds like a better name
> >>>> in the following case. Would it be okay to use this name instead?
> >>>
> >>> Not really.
> >>>
> >>
> >> Any suggestion you have in mind, if not this nomenclature?
> > Dmitry's concern seems to be that you provide:
> >
> > PRE_FETCH_1 /* prefetcher with settings preset no. 1 */
> > PRE_FETCH_2 /* prefetcher with settings preset no. 2 */
> > PRE_FETCH_3 /* prefetcher with settings preset no. 3 */
> >
> > whereas it would be both useful and interesting to see what these
> > settings mean, i.e. what differences there are between all of
> > these presets.
> >
>
> Ah, okay got it now from Dimitry and yours' response.
> But we exactly won't be able to reveal what each of these settings
> mean, as this might risk of revealing IP as ACTLR bits are
> implementation defined (except CPRE and CMTLB) which other SoC vendors
> might be using it in different manner(or different purpose) in their
> downstream implementation.
> We can name it like (e.g PREFETCH_DISABLE, PREFETCH_SHALLOW,
> PREFETCH_DEEP) to indicate the behaviour, but won't be exactly
> name/describe it to explain what it does with a particular setting.

This is already better than 1,2,3.

-- 
With best wishes
Dmitry

