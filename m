Return-Path: <linux-arm-msm+bounces-55903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C3A9EDBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 12:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700B71894AE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C72B79F2;
	Mon, 28 Apr 2025 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpjNWBCQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1DC1AF0C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835469; cv=none; b=O0JdgIGYstNOIKrrqiEYmdBiihjXRWq0ZjLZh8PaiWqO65+rQ7QpmzMclCQY3V/S7nHBBvYKKNMG21zdGboYSDEAGiz2qo9LCAp4bywFlTOcnZ85QKREY5tNyLiqoH9fgPezCeKrOp1RESlNs2KGByYziSFr70QEkgKCEXfQSSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835469; c=relaxed/simple;
	bh=y1hiKClkkEJlEYkzZmsa+w8bv94l15Lipgs60J8J1mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcEienaWUnemro7qfvGPkaPTlkcpG5JfEUxw82J+sEETR/n9As6NllIcbYn0+Wdv/qVkHLKsaFyAxVgpqJM9LGxvfQoOGqJiZxIZ/m1CgWgICjWaXPM1wExu+rlk6JTashW9TTSLY3teZCMITQmRqID8GPzS++G0Ui2mSq0RVp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpjNWBCQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SA52Ts014536
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Pxtv8aSr8lPsn9szEAcL96+
	tyHoCynhCC+imycmD8E=; b=RpjNWBCQghFnkVznLenbzGQ7FGNRi4epvrMeyjVF
	nEr/tyfianNYxVaNMuotOAp/T8tX6J3Y94/rNtdLETf3cR4mU+2P3H4ZQG6x1KVc
	eQS/tEFyEnZyj8NHPvptz274q7rNSLw6hkz+1reFFHCXEH+pFbf4/MCySR7kdaud
	M8I+GUhLM7IJrSDyYT4gAykLYuYJZUV8gAjyNqku27Bv+YNQrFEdmCowpKE1YXQA
	B3AtMGkLgPb4pdh02QvKM/sdDqStEkVr+4uwIFMum+E1b1+dDYXNBe6sI2l6GRVK
	XLiFcNcOgnLd1D8RZ4ymS9nMS1Qdp+qdC9rF3h19Dainhg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwrrhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:17:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so6449959a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 03:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835441; x=1746440241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Pxtv8aSr8lPsn9szEAcL96+tyHoCynhCC+imycmD8E=;
        b=cf1O3CFMn4EeVbn2fk4e8wSl8u69lNB8pkJpVhqvcaEHbC/WvkdY6EL+uWMX22dwUY
         9/GCvb2/wGX993ndYjAr4MQ6E7wWnONvuiMNjA4QuIPwAbjsaHz1Ltm5ydbGKnAjOrmv
         v2ZIPxKMVeCgVoBR8qT+9CmXgjCzM4Ew9ylHrWznHTiBwwV72HDhZOhb+Pf3rYskh3zm
         qeVQUYQkn/csLKkGw8AV/K9OFLjewGgAvWTBQWDTqTTWWkvmPpa1sjBl3ApDNPNjxGFr
         iU4QEhzmEA/NKNulHIgCjr558AZC/jOXasYOh8Y9BmOEDX+0N4w18Dnk2LyGcG1Bx45n
         KXmw==
X-Forwarded-Encrypted: i=1; AJvYcCVnLr4ohZ9pbT78WtKKCeBr/9BSb6n1+4Fdgk6Qp/m5HVuqANzrMq11GxXdIF9WdK/0YHUgvr99TejCdPUb@vger.kernel.org
X-Gm-Message-State: AOJu0YzTVDFiFZ5mTGx7/dBsH5sHopaDPNJ2oQeYd5XweFJyP0YnXS3/
	0/H7yZQfnhDzfsVL9ekIG61jxgLfKBbJ1IFvhsznpyFJbRAuAka7Ltw7JW0gf6cu8ypG7EhkFTI
	lOICjtLU8EA623h51qg9JEQpCFt3Jq5BRslqkk13mDtOBp3wviz6BnRnfCfaCoM2Tmu0c/KkYI4
	kk+9XAHrl/lFohU380jC8U2XQBI8J5j2Glfmxrk+o=
X-Gm-Gg: ASbGncuMSZcRetzSdrEMBVgiOLFz5blmPQ+RCrSa9AdhEb5fFwGVzZKf1FdvrtX9ulG
	efYODnVmTrq39/I15Cypip2UJLy5mEFiODNgcyzTD4VZqG25y51ckOCM2hu7eHm9QkMACVxsb0I
	7t+7VbgLoK9nBXqZn+bC5376Uo
X-Received: by 2002:a17:90b:2247:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-30a013b0fe9mr10022799a91.23.1745835441423;
        Mon, 28 Apr 2025 03:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIaELZcY1AshO25NA0l+ttmZJfXNfsi/nEo/9o06JBJB434i2TbdXrkARPRYRTyvmK6A6cuZ9Wjsgk5Ys7NMc=
X-Received: by 2002:a17:90b:2247:b0:2fe:baa3:b8bc with SMTP id
 98e67ed59e1d1-30a013b0fe9mr10022761a91.23.1745835441054; Mon, 28 Apr 2025
 03:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com> <3094b6e7-0de9-43a3-9678-4b1844aa600c@arm.com>
In-Reply-To: <3094b6e7-0de9-43a3-9678-4b1844aa600c@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:17:09 +0300
X-Gm-Features: ATxdqUEUcpx2-hktcO21OhqmqQqXyNUMMYDgeGivjswWKla-vpUY9os7A0P_Tug
Message-ID: <CAO9ioeXhFOn=YPt0+zA_C1WRcXQJheLo-nkVDUk0+87+0YM=NA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] dt-bindings: arm: arm,coresight-static-replicator:
 add optional clocks
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: _tMZV0RE0gFJdOR_H8OQNFI7U_yT-N_3
X-Proofpoint-GUID: _tMZV0RE0gFJdOR_H8OQNFI7U_yT-N_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4NSBTYWx0ZWRfX9s0p3NwXuyXb Fp7luKmpBKkSzK7Y6vTxug62LcDeexotGH8Dwrb1U5l3SIdvh/obnRfrlLPvHQ6DOjk4KW2FuWA QPO7wfvo1EA+3qCYJrLQ1aPx2ZlrDgoQUlVZ8eyVBUlw+cJdta60YEu4cfjwR8+1kwEK/7LsaXF
 YK0FwTcI6L77APQyTBofVmPp2vbtRUWBGu+xuw4cgxCixXkLlQ6R8+ZacvKe0OoGlNNlT3IEbeN OAjca+Jxty3PTrLk1/Z9b0QBBHZLPb0TVNsQXkneXdMLx+wYIxus0Q1r7kzjxFQfU609ldLp6+x HrXDMLV6x+N9JjAu4T63g8SoyYznrioLax2BD6eRd0prEsnXtk4y4z8O8DGXOVPqo+kZYIxQKSk
 8Od6r0G4gZTP/ObJoKZSH5ohqbmpVgJjFT9ogiKr2SfxDnuwpJ/x+OCu24E0XhMO2FLwsILk
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=680f55c7 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m05Zng2Y9WU2dLnq8PUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280085

On Mon, 28 Apr 2025 at 12:06, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Hi Dmitry
>
> On 25/04/2025 18:47, Dmitry Baryshkov wrote:
> > As most other CoreSight devices the replicator can use either of the
> > optional clocks. Document those optional clocks in the schema.
> > Additionally document the one-off case of Zynq-7000 platforms which uses
> > apb_pclk and two additional debug clocks.
>
> What is the plan for merging this series ? I am happy to pick this patch
> via coresight tree.

Please pick up coresight-related patch. Each of the maintainers is
expected to pick relevant parts.

>
> >
> > Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Otherwise,
>
>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> Suzuki
>
>
>
> > ---
> >   .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > @@ -30,6 +30,19 @@ properties:
> >     power-domains:
> >       maxItems: 1
> >
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    oneOf:
> > +      - items:
> > +          - enum: [apb_pclk, atclk]
> > +      - items: # Zynq-700
> > +          - const: apb_pclk
> > +          - const: dbg_trc
> > +          - const: dbg_apb
> > +
> >     in-ports:
> >       $ref: /schemas/graph.yaml#/properties/ports
> >       additionalProperties: false
> >
>


-- 
With best wishes
Dmitry

