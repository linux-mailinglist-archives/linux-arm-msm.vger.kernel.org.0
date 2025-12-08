Return-Path: <linux-arm-msm+bounces-84720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05FCAE5F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 23:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42D0E3012272
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 22:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C672E6125;
	Mon,  8 Dec 2025 22:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pW0VgkT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Df9vRt+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151FF22A4E8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 22:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765234741; cv=none; b=CwQAu/UQcpfbBamHbnnhLm+SDvKNts48E5i/EOttczZw8Q8uNdlld9FUsX1zZwqmA8wkBW3z1kOz6UqOwuEuIcQTU4u97EB+K+SdBsP1lyNr0p/eFyhU6R3omsMfv53ATszRmAq5LTRAHUtd8OU27UZvPP8Sn9f26uTrCFtyBPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765234741; c=relaxed/simple;
	bh=/ZMr0LtpedWAYtY75jAMaEvFz5FtHfhuzEZvDPDl18o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdjfNB7HjAPD+oQvK6NTvzRLo54Wy6PRS4I7vgUoEJMAEEZ+UClYFGWGRgXxqA0MA/YqrFBYJHLZ/4y+FEeuGZAxfmV4/0l2qoM+gyUprfvaeR+P/kOXpiXu2b0UVX0SzPNeHXpNuljMK/658joozT4K0Zex+c9M6gZhytz62V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pW0VgkT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Df9vRt+g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8ChX4V850621
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 22:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QKgt0p9I3O54Kz1mH4zj4pyk
	Ax2/kdfGcwbFjdAZiZ0=; b=pW0VgkT19csft4GkapYGtQPH1xVoQ/5SnK1kKGOd
	psj/XuYI5TUSHIcY9lbdfjplkj7z21pBmpU4fz6umAL3GifURF/BCQzQCtDSDTlr
	fAguo4UdZ4/cqDSajFbUMd/KizyRPoXt55G+rTe+u2dznqWjALL4x8us0tlo1ecX
	ZqY24vI9cizWyEt/E42iVlf02WA1NDTpvdxEIMsWNqkcPzF7FoZbwhK6x4gYdyZS
	Crp0qks0w9XxRDEGso0raop4sKfrDQ2DRSAUekUe+GCSUW+0yBeXO01aa314cdSJ
	r+cw2K8y6rmAz+U5TmwgiVMuIwZ6mPQ95l7fmuBrMyNW6Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awxxc1ngn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 22:58:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso5419200a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 14:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765234738; x=1765839538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QKgt0p9I3O54Kz1mH4zj4pykAx2/kdfGcwbFjdAZiZ0=;
        b=Df9vRt+gr9AD9iD7B2JZftOrocOIc6SDDocYShWb1E3P3s2hJ8IOZ0opKHRMjqJ0zR
         TvabMVBziQbhOdb/X+Dg0yRwrcR4n4wnMuJspOfmI9G5e4s+IgvKGg+BQAS44A9A9t0s
         Ru1KKqlMsx6NOG6+GxGUO68qjH6IRXHA9S8IPo/qLzZslMKRtrrPIVtY8phMXy99RQOl
         GPRc2cXoZavB8V22mVtHKzJAhuVkNolQvJl7oIBo4U2H+cV42gh/ZANfSSEAx7Ap/sfb
         yYqznET1PaVc9jcZihi2Tfv2mhekrIJJ99OFGTjmP8fG670rpVO5gPkl0GCXobx/SA9Q
         m+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765234738; x=1765839538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKgt0p9I3O54Kz1mH4zj4pykAx2/kdfGcwbFjdAZiZ0=;
        b=s0rKf6ejtZhQgE0esgL0TbS6zXm6JNZCF2NeByckgnU5lf/z+JTEkrdluTs1oPkdZQ
         5HvEmFxIuudvAd8FQFJ73nBipCS48pczhYvy3uHjvUaBwjwhmDsxrNWvCS1PSMh4Z1bz
         qoOuJjScOIuAXHlafHabPyuNevWYlIczLGrtFrwsu/udQBTYAS1sviTfUOfTRxvafbLC
         Ruwh81xTlc/Ifh6+xm+DVuRX7dfHuk60PY9uISKzHZ2fO45iw83v9Ix2REsHQpw4HEbf
         zOODGobTOlAIVATNdHMr8xvh7/mEHUG8p4iJCpPURvOTEz4OnpI0VxQUijwvk2j1sJwY
         zC1g==
X-Forwarded-Encrypted: i=1; AJvYcCUREYoZU/RXRiuec1aN4yjdZU4SFeYJPAXG3inW9nzNwdqXYpWqzoDrPhjblrrV7eEoYDAsvDhLALOAwXpg@vger.kernel.org
X-Gm-Message-State: AOJu0YyL53Rr9fYy5sg0470m3cdczAFfuW+v5HEqVmB6bS2oXH8i9b1O
	VzwHaFFlKs93wQvP69GreG/P161YPp4udnvoY2pTYRa3rVP19BJwhPrVQfF6FixvQcP1Voor34W
	/sX/AlnbonsLebZN6k2/r8LmuPR7LprS5usSy8XpyQUR9By1AO8d2p8IRXUQjgGSi/MqY5ErJ5r
	ryKs8dzXA5pvik5npyaS/9M2YpPgHoXtRg6iVV3jZoCvg=
X-Gm-Gg: ASbGncvrSawzU/e41crsVp94cjCO6Ac/O4cgFrqeNLB0i4igouWDNhuu+JMC/0csJQ+
	DC+cNW3Ub1oLCBSOu3xNW52oh1y+NUB8ZOCAn2z+saDQ3H6GXIlVlwZQDEi6s/N7q4UahEndPti
	fV8dT36nVOVf+AA6oPZmGbd9TkPeu3l3VZgOAZi+zeDfZjxieKNtLQOgOZBGAaGt+19aEeOYmc/
	yXz2ijn
X-Received: by 2002:a17:90b:2691:b0:33b:bf8d:6172 with SMTP id 98e67ed59e1d1-349a26c2cadmr6800358a91.34.1765234737935;
        Mon, 08 Dec 2025 14:58:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+R13fCWlinwEbgpGmZPHyMFonury49ULZGv3kNILl7FaYcIst8UAk1P4CrxofUscq6obPPfCKjTY63VAOxS0=
X-Received: by 2002:a17:90b:2691:b0:33b:bf8d:6172 with SMTP id
 98e67ed59e1d1-349a26c2cadmr6800335a91.34.1765234737428; Mon, 08 Dec 2025
 14:58:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
 <gsjyj3arwoqcjln6nlmyhohlowyvkwqmxppdq5y7c3m4khoyq3@npzixjpibh5g> <0bcd5a92-5213-4862-9a31-8ea539b1b72c@oss.qualcomm.com>
In-Reply-To: <0bcd5a92-5213-4862-9a31-8ea539b1b72c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 00:58:51 +0200
X-Gm-Features: AQt7F2qiksWXfb4QJZZD1j7gIWBPQusAazA7cTt2NoYXOiNgNKUjwRXhyxvLVwY
Message-ID: <CAO9ioeW0fafwRnxvDJ7yHGcQYbgfkfRF1BMTpXpG=8tSKRptdw@mail.gmail.com>
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: ECFYtXcLLlISdCYz4G4FXceNWVG48m8a
X-Proofpoint-ORIG-GUID: ECFYtXcLLlISdCYz4G4FXceNWVG48m8a
X-Authority-Analysis: v=2.4 cv=AKf9OaRj c=1 sm=1 tr=0 ts=69375833 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jas2bIbCv71b3E4NwwIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE5NSBTYWx0ZWRfX3TmlT8cEUbP5
 gwmCcwy+5ldQyxTBU/pJqpyp5ohRkFryYT8Ne9R9yimTEjkMWsHJ2HV7tEbBKG5XPc4MRJ/dHYb
 VcdBoyt3JCfxie0y7iKRmNnKv6rjVc7Bqg8b3IiWtnhxUYdpCMKfqCmcQZgZlqYRJLQWOGyEBqE
 x5OIkQTjpiOZVXCDlQybANEo4USxaUlACYUOl/Jv21eS+1gsaluzjLMpmYHPlUUPkS9C0w/9z3A
 8k3aTYHnj8LL4jsDeGEkwFlIdbEnFTaSNbbCOlzwIZzT57D6ZpQgSoyW/bjadvChXE9l5CtskvV
 8Vb7Dv5UKROkcFSjqNd5Wmg6ZxNfNT3WpH2CMzlOYWxQiifRdM6KV4t+GdHy7Szfs9UkqHoWpP4
 IJG8/wEfytROa3PApRSbmGLBGKcvqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080195

On Mon, 8 Dec 2025 at 21:28, Bibek Kumar Patro
<bibek.patro@oss.qualcomm.com> wrote:
>
>
>
> On 12/6/2025 2:36 AM, Bjorn Andersson wrote:
> > On Tue, Dec 02, 2025 at 06:24:47PM +0530, Charan Teja Kalla wrote:
> >
> > Based on the other changes to this file, the subject prefix should be
> > "iommu/arm-smmu-qcom:"
> >
>
> Sure Bjorn, I will address this in v4 RESEND and collect all reviewed-by
> tags.
> Let me know if you feel this change needs a revision update to v5
> instead of v4-RESEND.

RESEND means that there were no changes to the patches. If you've
changed anything, it is a next iteration.

>
> Thanks & regards,
> Bibek
>
> > Regards,
> > Bjorn
> >
> >> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> >>
> >> These are QoS settings and are specific to per SoC thus different
> >> settings, eg: some have shallow prefetch while others have no
> >> prefetch.
> >>
> >> Aswell, this prefetch feature is not implemented for all the
> >> platforms, capturing to those are implemented to the best of my
> >> knowledge.
> >>
> >> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >> ---
> >> Changes from V3:
> >>   1) Add actlr setting for missing sc8180x & sm6115.
> >>   2) Improved commit message.
> >> https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
> >>
> >> Changes from V2:
> >>   1) Add actlr settings for all the mdss devices on Qualcomm platforms.
> >>   2) Improved the commit message that explain why different ACTLR
> >>      settings
> >> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
> >>
> >> Changes from V1:
> >>    1) Added actlr setting only for MDSS and dropped for fastrpc. --
> >> konrad
> >>    2) ACTLR table is updated per alphanumeric order -- konrad
> >>    https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> >>
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
> >>   1 file changed, 26 insertions(+)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> index c21a401c71eb..149da53091de 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
> >>                      .data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> >>      { .compatible = "qcom,fastrpc",
> >>                      .data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,qcm2290-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >>      { .compatible = "qcom,sc7280-mdss",
> >>                      .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >>      { .compatible = "qcom,sc7280-venus",
> >>                      .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sc8180x-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sc8280xp-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm6115-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm6125-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm6350-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm8150-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm8250-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm8350-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm8450-mdss",
> >> +                    .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >>      { .compatible = "qcom,sm8550-mdss",
> >>                      .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >> +    { .compatible = "qcom,sm8650-mdss",
> >> +                    .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >> +    { .compatible = "qcom,sm8750-mdss",
> >> +                    .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >> +    { .compatible = "qcom,x1e80100-mdss",
> >> +                    .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >>      { }
> >>   };
> >>
> >> --
> >> 2.34.1
> >>
> >>
>


-- 
With best wishes
Dmitry

