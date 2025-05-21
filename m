Return-Path: <linux-arm-msm+bounces-58888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2DFABF4A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B736189D9A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08F2267B1F;
	Wed, 21 May 2025 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFdTEngw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74132266584
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831614; cv=none; b=fmnF8lqZQu0NqUCk2JdijMavOU5g3l/VhBtgFjot7QBpxFw3/SDmLJ8i2BH4bq/K8io0fIBXnxzsxkr5sf4tMlybZHNhotM5St+3pdcsK10wWYJ5cFXYzbNadVap4k4dZTCF7cM3o0XlXc2OowH7nFl6nQOqoLwtKpqaL8jV2ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831614; c=relaxed/simple;
	bh=Xqeu1aJ9MItEqCaHvO4dZVDW/+gda4kJKzaek2qb/UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljHPNAe7lNWw5fBKyC9COYlWPPggwVtPFSbGzytcjEuxAXRCzZ9qY0pSq0HUl8sAEXBE2Kjnav3B4m29bsHGRR0CGGf3VmNPMKLQI2kuCXBeY5gjwVqxYAWGqQwmr9AxN3SHUrdvo6zNtWdfKso3H6ZmWfy+BzF5qqWb42fPp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFdTEngw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XRma029654
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sDTfHXY5P0IUFKShT7L/9f91
	7VhrL5k2KweIDi5wmfs=; b=pFdTEngwWRO0CNSUUa02wThitfFtqjr336BgyA80
	CTQ9jIeELHzB2Vjs4HosseT/LLzKbQ8EXjrr+IU0cZepeiYK51O+IginuP7ffyU+
	jTWkC7yv1E27pZxpHYWNxy6Etoa1mnHoknH7m6VFIT2IzFkn4Itjqg5BekNhz6Jh
	bhwxiZCjpUZldll7dOmJMZ2bTs+pCb6s8vP+JY9Sdfbr3TPOxWD2kNNWDzrHg9ts
	QXrQd0ZL7B/SDWKRtcAGwRafT8aSa6LHK7iKijXh3z3UGz2q+c/eCmiy+jNwH8cB
	M9HPqXCeFJBQbxv7XQAgRwqP7RFZIAYz860dKnJpCrfVvA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf430cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:46:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c8a36dddso79136326d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 05:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831610; x=1748436410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDTfHXY5P0IUFKShT7L/9f917VhrL5k2KweIDi5wmfs=;
        b=d1wKJ0AivLuUPRnoBYwd4LbNyHGkdS8+BoKV1DMvc74bMZBZzirlQ+D7BNls9MqNsF
         +WkqbEq7lECgljQgZ40LMVvCEkVCfHiFenGRLS3CR+jgqH/EHwKBgyVPn9jE+6wKHkg5
         cqGxXZnaQkKOGOwVxjhtXVmLgBPePA+Wd5DGWdC+Ud6h7p3niK6Y+9s7sd23H7A3MzKE
         kGcYOT+vG0Wt7BxZhf4fP/LDnoLDCsNcMCR6QmBzxjKD8UZxXwI5/5rSLa/kx52JV/8Q
         e5OKbE+XxvdR4/yzQdySZ2JN9fBMXzJDl6rZfGJjCRhVH+Gq4igxZS4Do0TrrCDcPLbR
         xjEA==
X-Forwarded-Encrypted: i=1; AJvYcCXZZRRTEanHnTSG6HcDNPLoQWglzn4QOR0jKFlYj4p7hx+1yYrETDkq9yquuzjo2+FJbmsgixOITH9KMRzC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgau+3Xzf3+Ul6Sck4fdnwsZDKejayIbGEFx4oX9S1iRNqROIC
	wurYcElP5q7A4dOZskXFVbd0wrPNaDhuunCFmSRNJEX4aLeRzbWSjYY80IcMxC0veSOq0Rk7ad9
	u1XtOysQ6HyCr2RrUscvtwEVRGxdIEAbCEU8mkjpSG1Dq/1KqJzAzMMj2GhxKyqTefG1GuY8dwV
	jmY9s=
X-Gm-Gg: ASbGncsa5Z9DNQrQ9bZQFxBzLRnRSu8zQnoCaz16MxldK7Nhp7hyD4E26uF9S5+fpNG
	1RF0N58+MVd1/y3hmD0iuq4nBOgGhVb0yA5hWt05QCvKidjf4C9kMSiajqsi+bMQnizXPwAwJBi
	DYajBDTgshi8Vj8arJO8rceE7YSncCIxjfmlXPo5bDEbh3nOPHgL78Kngoqu3eZ8Q0KFwjygxzs
	1tiFjm90i9fpnFc1e6AQj7TUeTWfHQ/XD8+7RaPqGzfvBnRrU32L+v9YOOkONkXvCHx2vI/5sEC
	Hd3TlBzwIu/ZngD2vspSKelNN80h2o632hZcPSUW/cfy352tSAsTzNTEk/QNbQvdYBA2ypw6y78
	=
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id 6a1803df08f44-6f8b2d44cb2mr310211856d6.45.1747831610306;
        Wed, 21 May 2025 05:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKrrceDDu+GLUk9ALbLga29Hnv6Ac2h9d892IylQS5MNstSZj4gPJnCFx3NnyAWf0EeS1rWw==
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id 6a1803df08f44-6f8b2d44cb2mr310211526d6.45.1747831609859;
        Wed, 21 May 2025 05:46:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm2798700e87.214.2025.05.21.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:46:48 -0700 (PDT)
Date: Wed, 21 May 2025 15:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <the3rt4gwb766u5tmzzugoozkyt3qw7kxvy6mlemxcqb5ibs37@szcq2rzbukma>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
 <20250519-barnacle-of-beautiful-enthusiasm-4e6af0@kuoka>
 <ec4ee2f5-162b-430d-aeb9-90ad4559707b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec4ee2f5-162b-430d-aeb9-90ad4559707b@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyMiBTYWx0ZWRfX3M1SqvVt4GjH
 TJFdsFJnovkeq4q8BZTAK0KaDaKiATn8Wl+WTm4pbjC+cm+iQqgHm0/UQUqilLJEaYtT23xye+H
 FV1v+1DI5DjIJbZ31/zYEt6pnfYavH6vgFA+SPOvThqlSvoUlsKIC3eQ70iluu7h+S29G+Vs5fY
 Sjd2B4WrjwfHnIbj+AMtz8Nz8KSdH1lVLZ6MGmsp4xYjsQR+npl7BoHBKYFjUGWA76X3QzPjGHX
 4SQoEAQAHZZbf7ouwA4XNYdWOAaDHIaK0CQXFQavVAbCUJsK4yj+/80E6jz/4hxN0qcQsr5IS+O
 0I+5yFqxSULB/LLR+rVgXOoSah8bDMp8EOwiFMD55cP0Pz8FcfEbO81PrnhCHuMkvum+OZ4KMh2
 vqchwVnnmSQrd01BMeGHPzQ+Yzt/NQYdsD2ypR4tR+FA/X962XY5lRjYi3WuuvuuMw4QHnwn
X-Proofpoint-GUID: 0t73jHw-7iinV1QDeAg-BhV0Ezu1skIz
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682dcb3c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=mlDIMNG6S_g-ndTHxx4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 0t73jHw-7iinV1QDeAg-BhV0Ezu1skIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210122

On Wed, May 21, 2025 at 03:32:34PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 5/19/2025 1:48 PM, Krzysztof Kozlowski wrote:
> > On Thu, May 15, 2025 at 12:38:47AM GMT, Jagadeesh Kona wrote:
> >> SC8280XP camcc only requires the MMCX power domain, unlike
> >> SM8450 camcc which will now support both MMCX and MXC power
> > 
> > I do not see change to sm8450 here. This makes no sense on its own. You
> > do not move compatibles - what is the point of such change?
> >
> 
> I did the SM8450 changes in next patch (3/18). But I agree with you, this needs to
> be more structured. So I am planning to drop this patch and instead take care of
> single power domain requirement for SC8280XP within SM8450 camcc bindings using
> minItems and maxItems properties based on if check for sc8280xp compatible similar
> to below snippet.

I think it is a bad idea. I liked the split that you've implemented:
separate bindings for platforms that require MMCX (and MX), separate
bindings for platforms which require MMCX and MXC (and MXA).

It might be better to start by changing SM8450 binding to support MXC
and then adding SC8280XP to those bindings.

> 
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
>      description:
> -      A phandle and PM domain specifier for the MMCX power domain.
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: MMCX power domain
> +      - description: MXC power domain
> 
> ......
> 
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-camcc
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +        required-opps:
> +          maxItems: 1
> +
> 
> 
> >> domains. Hence move SC8280XP camcc bindings from SM8450 to
> >> SA8775P camcc.
> > 
> > Subject: everything could be an update. Be specific.
> > 
> > A nit, subject: drop second/last, redundant "bindings". The
> > "dt-bindings" prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > 
> 
> Sure, I will take care of above in next series.
> 
> Thanks,
> Jagadeesh
> 
> >>
> >> SA8775P camcc doesn't support required-opps property currently
> >> but SC8280XP camcc need that property,  so add required-opps
> >> based on SC8280XP camcc conditional check in SA8775P camcc
> >> bindings.
> > 
> > Best regards,
> > Krzysztof
> > 

-- 
With best wishes
Dmitry

