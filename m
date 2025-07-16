Return-Path: <linux-arm-msm+bounces-65269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C369DB07904
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B3CE7B464E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740E41B043A;
	Wed, 16 Jul 2025 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/J9NI6+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D71A01BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677907; cv=none; b=iEGp+IROh3Zan1o6ooqkkpAftqFncL0xX2ZVVw1AkERzG3S8RZGGGo3uK02SgqGTxpkd7qOcP0VH26h19sEWW9zDQOq6G2FZml3wDhXkj47JcnCHBLH8/a5jTKcY9iKywI+t0MtGSMw0s41buY6HUxS6tZR0GfBvvrmNovyFLoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677907; c=relaxed/simple;
	bh=fiecLZEgxwBHhvCtE3OC0jqMMMcMzWtkxcrkMLboTz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJB0UYmonNWuDVLFgibC0cnzNzAnOJK3v7ysv5eKGDEzp2vYqZAREnJhf9FkfYVnCV/OakqSfpeFbwHLkzrJ1rZbXQFjd0PZ5httSPmF5GEWKr8j5goXuYlohrSFvh/gSGH8iUDEKYMlwGrvB3VtAc0soyDt44YRXJh5TUsjfUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/J9NI6+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GEcqoS017998
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RDf8cJibEjhiFo83apzBrmHpgcz1vDYMn9bRtB9wako=; b=S/J9NI6+NVkFsLcs
	HyzjPCyusqVoUyOQhQWOgN30XCuBEKk5jTJU5Y+B3miL5fodY8U9LZQeELU1aApM
	VnZzSxcvy9uAKZkpdTWMcU3cky8nB1Eu+LZijxs1Yg+xajsblzBzy7RP5Q9tNFa6
	3HtV4uepI0W3Q/eQf23HGFl1hrc+YuFbNImCTUJKu6B3aVADDa2RLU9mbRt766kw
	OGmRzP+CDaEeIu3LSmlgn6XZQUlUySbfbHlVoKyKODb2UJ8rGvAja3qOG420brXl
	3Lt01qrG+mprDqi5EVACmAsUG6WMtFffNhOMRCjvBhBZKfw6N1PTIdJ8O4s2s501
	fYJC2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug384frh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:58:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e348600cadso64875385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677898; x=1753282698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDf8cJibEjhiFo83apzBrmHpgcz1vDYMn9bRtB9wako=;
        b=Snwi0xKjCyVqQrawMlzKRK5N5gPA0EIOS4NCaWIiOmMD5H9uJr75lQWgkLn1NOIw3T
         ZrnX0W3befntUyEPPLx9RThQMVOUtSOr0Gx1kEcKzr70s+Z6QNvN1RrJL4Qk+QABOvL+
         zEDv7KJMa9xgNQDE0Epk/O5neLNCx8WflJ8W+P65smj1uxFlvX98dh9Pb3i5VtZ/htCq
         Spy4jagpFV5bTBMh5fwjwjIT6bUs/ZVYkWBUtKZX0VX9RJrn8FICJAvjA6RF2ddQyAIc
         fbQ3uiN6/XZt3B9XBY3YBotqoQhQdU9yPDLMQsOdbE45W0b7Ioj1zA3yNhHwf7Vl6Zbi
         ce7A==
X-Forwarded-Encrypted: i=1; AJvYcCWpTe0pBUCH+X9/spjoaVYASgd9jCK+vdzSMJAngNEVjBF8sUQ0JOc9quwo1zeAk29oqr8KY8+OXH8W6i46@vger.kernel.org
X-Gm-Message-State: AOJu0YxpSVvgllXEi/VcoMLgpfTpws/a8vsR8+OJQ0VPzs8vzWlyQSv7
	0ohX3xV8roQETqeTBv1ajHy8cSKrng+DEHJ3xzb/Jw14jKdW1igiJE4mKsDCpJ0HI+dUQTWr9fQ
	6Q1zP7FSn8zgn4wszS1NWLvSvXaY3YygLbogQm0jvp7EDsK+W6w5HF08aRuIpLso9d05j
X-Gm-Gg: ASbGncuqlXOw9T99N/qHAKAOOaG+mgbInrUVU6LivRVwtS2wxyJ1abMqmBKXAxrFjq9
	CJXh+SwbyjjFrF5vLZpz6ArZ3eqr7PKmI0lyx9kUEby2p0JZmSn2/pHqBu4RPG6AIS8U4kdx/Q/
	nICKYb6qaV4b8gItPTRXjf+LOg8oCgrFgDp/dkcQupwkGfwvbkvlOdBgcT/WOJ3T/MM3GDRZj6u
	Efof3qnWTk0IPt7hzM7noKz7paBPuigJ/oeSMeXQEILaWSmGnZFkkctqUHYPkMoStC1rh2+Kxmm
	LaivHZCvAJChPxrDxpso/pnv2Kc7KSU/PgRmG65+IuAnsEP7huvJLcq3A2rfBCQvP2pMgCjhU7x
	bG27zwg9iq33xLMPeaYMJveEQD5NTtzK7EWqFSDma8jYlQaQdZ1gt
X-Received: by 2002:a05:620a:22ab:b0:7e3:4413:e492 with SMTP id af79cd13be357-7e34413e876mr264146385a.62.1752677897605;
        Wed, 16 Jul 2025 07:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0jOujE3U+BYkwFkxZi068fm97ejo79VB/1BsmjFpf/HPzJEDPZJZLcHh9+NAlr5Fw707ZVQ==
X-Received: by 2002:a05:620a:22ab:b0:7e3:4413:e492 with SMTP id af79cd13be357-7e34413e876mr264140585a.62.1752677896933;
        Wed, 16 Jul 2025 07:58:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a0fe70bccsm1355597e87.30.2025.07.16.07.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:58:16 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:58:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm-smmu: Remove sdm845-cheza
 specific entry
Message-ID: <2kpb6lwr36izbbp45dbv7lg2akjdxteiadhtc2bbphmsreycwu@nre7uzuezydq>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
 <CAD=FV=XmwiA_gX9pF5Dja1vezson7f21WHC8u8+Rhg_6OUJ+rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XmwiA_gX9pF5Dja1vezson7f21WHC8u8+Rhg_6OUJ+rw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNSBTYWx0ZWRfXzPQUVZY2Ma5S
 3N8mOgIf49TMPONhx+e+YNO34UtWkHq75tT9VNv2ye5uOPOSXXsoY4+uSxJOzhaZDCXnlbtkgZR
 94Dd8YZQsdTaBVhzLkaXkL15z8YsS/0Z+YJlkJXyMkRjWvlAY7t9tLNJhWuEZih+rQRQdSEyhEG
 Op0j0T+2YXVcLOiGiqv2xGxSGpYKvI75Ya36b1RX3P8GQtRzljn0f9ipeTz4FrnElu072oIVklV
 lWG5IoLvPOMrmYHHPVUxX/IeF0eS5udRkpVkRg/4qxWDrtPziLvrejuUwP3oZ8dcJCszGuSxiWm
 8G8NFM0BDNjVEjaFRLhlVkRkRC4SJsa3WtsGTGjvz9v2o728Tus7KIqc9OV38Mt3hCslCDlOi78
 G4ZVEY5HQuDVBPfXt59kum7G2deKIQIiKxQOSYcwbdMvpDEiatYq12Z9tGP8o10Mc5b5cfsQ
X-Proofpoint-GUID: oFFjJANJywW7N67rNLAwfN4Wyj7aHxx4
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6877be0a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=HCTRSnsxAeQ6huVMZXoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oFFjJANJywW7N67rNLAwfN4Wyj7aHxx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160135

On Wed, Jul 16, 2025 at 07:21:51AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jul 16, 2025 at 3:16 AM 'Konrad Dybcio' via
> cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
> >
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > The firmware on SDM845-based Cheza boards did not provide the same
> > level of feature support for SMMUs (particularly around the Adreno
> > GPU integration).
> >
> > Now that Cheza is being removed from the kernel (almost none exist at
> > this point in time), retire the entry as well.
> >
> > Most notably, it's not being marked as deprecated instead, as there is
> > no indication that any more of those ~7 year old devboards will be
> > built.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..646814ec7d15f6d8a0136de73b7eaddae232ea64 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -132,10 +132,6 @@ properties:
> >                - qcom,sm7150-smmu-v2
> >            - const: qcom,adreno-smmu
> >            - const: qcom,smmu-v2
> > -      - description: Qcom Adreno GPUs on Google Cheza platform
> > -        items:
> > -          - const: qcom,sdm845-smmu-v2
> > -          - const: qcom,smmu-v2
> 
> The code supporting this can also be removed then, right?
> 
> drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:     { .compatible =
> "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },

No, we must keep it for the Adreno SMMU on SDM845.

> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

-- 
With best wishes
Dmitry

