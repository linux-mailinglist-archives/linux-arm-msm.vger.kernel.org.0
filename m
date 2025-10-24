Return-Path: <linux-arm-msm+bounces-78706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C668C05563
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 11:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4B091B84727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F20130AAD0;
	Fri, 24 Oct 2025 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QguF7XEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A5A3081D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761298111; cv=none; b=JL40C2sJ55/pUWHS5txNX59JgqRZ/UjB9up/1h/5DzTw1lHbos+HgLUZu8Pt9h1cAqt9cRBNZus7ZpgFgvZem9maF2TyMu6yJzRYothpRzbleL5IaHxUYOUAQpcPzH3HFxCv8QFuDAzHvmx6byDYi4o+7SHNm5t368DizII3GIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761298111; c=relaxed/simple;
	bh=TFs+uVk9VsisYkzT24JB2Gdh5pdgQe8tuorJAcqAzXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bG0kiuBhk+IMIV1bQiLyzD1u0fMQexK+Z0+Dijp7orRjeDxdxObYy3uDb+6RmF30PArKPGQyVMFn7qwI4n0drbwWQJyuo8LDm0FcOFCoAgNFTWWy5YBmnWnDWd62ARX952ASWfZqeTFJIYQe2Rx8IFFC0doNWeuTkkC/HGvKVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QguF7XEk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3MHSF021673
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zGkcT0F5HdfRvmdgOmrFrIfL
	DkdtJXkgEZhfMIxuKyA=; b=QguF7XEkUeOh2E3pknh1RhOE8KhIQT1c2uP+IQ0G
	zX/1juHpOOEgEAb2n5P9kAUK8s7h/r/ztfyqrAjbkoZDG/QlE2jUapvWcUZ7+01k
	IpUUGvjz7ZBKuL/vEafSBXLPqVZcft/UJlDHrY8ogrgd3k31WJtotb9RXel5w+Nt
	0crZWgRXZMURhLZDg0xZO/c80EjdibmbPGGwqO2U6xm/OYF+YCV7jsFsFGDsE0y1
	Sd5iNhe+3glckfGyogGvxX912c1IsECwYnzbfIdVZ5jeiv5/5N9uZFl1zWzeRAQi
	OCxz2WyWH1NVxvk9mdU6hMl5AP8n8YOg7e4YzonE6ynTCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8nqwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:28:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e89f4a502cso51179371cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761298107; x=1761902907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGkcT0F5HdfRvmdgOmrFrIfLDkdtJXkgEZhfMIxuKyA=;
        b=OLkNW3duqXG/78EMmMX32PGidnPYZDJDEPgSJ+0g9p/zmsAaVSSk0cPW1+nQP2SE1A
         gZMN8VmFMj3i+oQsjhz60Cs1VztWf3t72aoazdwA5sfsedDPcB70hpQ8bjBY/x8GfP4R
         ej2XbUTLquvSBE30dR1rcMavrdE7dnZT07lFraGItfBcU9FtSvL/hyuuZH4NDAhF7MOd
         pt0DACLTq8SUW10u0swFwtAxitH27u42W+2IVQHRd7mNgxXrR14BFBjtlVkAyKOcSNn5
         l0BxEMzNUZevEPqvGh6zT0ZJJ3jqS7Uoh8s+a6j4FEZs3zK1xUq+t0EbRQ5dvcDhQ+oT
         F2aA==
X-Forwarded-Encrypted: i=1; AJvYcCXlvrpEn77N2I1ceutVfhGEM/p6koL0NZlvIcRY7YcGBNceoenLB+7MVgaLAMIWB0ThnaPJej61G+9q+FhT@vger.kernel.org
X-Gm-Message-State: AOJu0YyvTy1ItnGe7GQsWkyl510sbnFNGc4DVIRKRuNaVohMhNvtmX3T
	9T0LKrwZLfBRNiUB/7/Rf7DW85QalcTDaiH8Lrpu/+MWCNb7+BCHH1i5q/TR/4n4cYL5g1dZTWt
	AGVbG6Zhmcg/5hb+oigzAJA5LbsP1L6X81oz1jcVPgM34/JAqFQT49ZmJNoG5GRnJuka5
X-Gm-Gg: ASbGnct3K4VPpnWt0XXwJ8aScrCcMFAOm/DM9tUS61vsUD1UXo8sC3TxiNJYaZ3wMw5
	LgdBQ6MidJo+ztm/HueN3gxy5ef2k8YEUSfYA3V4/DbPdjt/71rYifhnCHdyYAdc0m2Sov1iIom
	bPsCPeqFrfpQVL4PUuPQ+kG33E5VR1xyjhXHGgZR9z369yUQ26IETB8TkQA9/hjSXQ8gCJWeT8a
	f33BpvmNBeQmPHv/re/HqA29obMxgJdEdPTkffmcSehT9L/DtuQOT2xih2asqfyFNMtcA7zcHVw
	H33BZaAQtuhYV9KnNQ5vA+q0AAJJeBWv7KQXdXBHQLDcZLEw8ijgjggRtYw3RYJ5Gt1NJrFIhO/
	98ESooifqrbshyzds6ZdHSfai2Ay4xnA0Bw2qXjyWNSomU6P2OsAvhpBnw60Aj/RejmNmr77x0L
	RfosgzZhNCqMM4
X-Received: by 2002:ac8:5881:0:b0:4e7:28c4:6492 with SMTP id d75a77b69052e-4e89d2e9159mr345061951cf.35.1761298107573;
        Fri, 24 Oct 2025 02:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7yl9p+wm1YmrVjaFh115CT4BHZ4Az1ybfHc7KF6ROWYFgbMv01hIcBHSAkMse1hgWxSIKg==
X-Received: by 2002:ac8:5881:0:b0:4e7:28c4:6492 with SMTP id d75a77b69052e-4e89d2e9159mr345061771cf.35.1761298107121;
        Fri, 24 Oct 2025 02:28:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4aded51sm1489790e87.23.2025.10.24.02.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 02:28:26 -0700 (PDT)
Date: Fri, 24 Oct 2025 12:28:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
Message-ID: <qcs6y22hozfmb2ipmahfw25m2xti2gr5kjn43c2woiueqe4xmd@ovnrhwibhhe2>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
 <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
 <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
 <ff37b635-b3dc-4180-8eae-e798ef6ce55a@kernel.org>
 <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: M2_tdkFRqtFpUuYRbxVwE_TO5fTRYrUZ
X-Proofpoint-GUID: M2_tdkFRqtFpUuYRbxVwE_TO5fTRYrUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX0B+aARU8JUV/
 5v6n1f7JtlX+kKwE0OvCdL/9gJAVaSVJwQQ97hNqB7kj6L9RpG+NYVm94u+fJVaApGdRoKXHGEn
 pWW4MdCNbQDia/uVG28B8k8qcRi3pnzkdvc/gFidG8a1vP2Kbh8+cRubIP69lGr17/N/q3BL5se
 1OxMgggWa90iQn4msPAdJMJhc404f+eOKct5cnija4oxu3ye03zyA8ZJjA9dFLE/StgR44vpKCQ
 M5RpknQRuTQW8TOpxmQ+f5uwEJZ+if/oV8z4Qsj7Y3OHwE+aLh5DUAKRYdEBJ55UuPXGE2THAru
 ffzw2XTAT56xbqoNGcb04E6N3CkMMzgd3pAARw+VVT59K/6uAzHOutF4OjVhF7IZFetm3TQMBGq
 /u9iPSAMF/VTSLuMg0UPS3sq220sYQ==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fb46bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=QZfYkoQWqmGXo21g0SUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

On Fri, Oct 24, 2025 at 04:33:28AM +0530, Akhil P Oommen wrote:
> On 10/22/2025 12:49 AM, Krzysztof Kozlowski wrote:
> > On 21/10/2025 17:51, Akhil P Oommen wrote:
> >> On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
> >>> On 17/10/2025 19:08, Akhil P Oommen wrote:
> >>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> >>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
> >>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
> >>>> scaling, bw voting or any other functionalities. All it does is detect
> >>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
> >>>> it doesn't require iommu.
> >>>>
> >>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
> >>>> schema.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> >>>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
> >>>>  1 file changed, 79 insertions(+), 19 deletions(-)
> >>>>
> >>>> @@ -313,13 +360,26 @@ allOf:
> >>>>            items:
> >>>>              - const: gmu
> >>>>      else:
> >>>> -      required:
> >>>> -        - clocks
> >>>> -        - clock-names
> >>>> -        - interrupts
> >>>> -        - interrupt-names
> >>>> -        - iommus
> >>>> -        - operating-points-v2
> >>>> +      if:
> >>>> +        properties:
> >>>> +          compatible:
> >>>> +            contains:
> >>>> +              const: qcom,adreno-rgmu
> >>>> +      then:
> >>>> +        required:
> >>>> +          - clocks
> >>>> +          - clock-names
> >>>> +          - interrupts
> >>>> +          - interrupt-names
> >>>> +          - operating-points-v2
> >>>> +      else:
> >>>
> >>> No. Don't nest multiple ifs.
> >>
> >> I guess we should split this. I will add a 'required' constraint to the
> >> rgmu constraints above. And apply the below 'required' constraint
> >> specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.
> >>
> >> Please let me know if you have any suggestion.
> > 
> > Maybe the binding is getting to complicated and RGMU should have its own.
> 
> There is just a single chipset with RGMU and we haven't seen another one
> in the last 8 yrs. So it is very unlikely we will see another one again.
> So I feel it is not worth splitting this file just for RGMU.

I'd second the suggestion to split the RGMU schema. It's not about the
number of platforms supported by the file. It's about the clarity. I
think it would make the file easier to read.

> 
> Let me send another revision and let's take a call after that.

-- 
With best wishes
Dmitry

