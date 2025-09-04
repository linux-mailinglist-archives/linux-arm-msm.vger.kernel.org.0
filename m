Return-Path: <linux-arm-msm+bounces-72017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55BB4388B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07A487C1D49
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577E62FA0F1;
	Thu,  4 Sep 2025 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2+Ubdhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F6F2F60A7
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981024; cv=none; b=dVuVXNvz2q+xjjsrR9pG1R+kt+HFrWWObkjQaIDv3Gg/wEQbxUFczA2XbgLjauzVuUDr82+q8157APWBRIGUrsKFnivg+1YcRQXMF+AEkaF0KJzCdjuWsLg/BG4QnQq8FVPpbpjnd4tB0BAcpXhHyhmxefhEM+wvQueKwuuazeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981024; c=relaxed/simple;
	bh=7MJyzBaUxP9X5PagJDcFR2Xl0v9tA5iGZjMRO04beHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZEc5srwrRGEKgV8c1ghU8L4loMNZeZm7yfPoKIjcF2qXiuINyhqbJJ3ssmqNa3U++dLnBAtxPB9/E9/VmRR/3D4lC6UImmJZxsaziA3x4JfKEAw/TQpOCszbfyLToqPM2NGHN5PY0C8xsgZQuX+b999jACn0w6939TNS8jjcTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2+Ubdhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X6bV013944
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 10:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rmgllivFRv6RjPwaBGym+Zby
	4n60SrTDmfiiEvhrg5E=; b=b2+UbdhuhLawegkDcLTK0dX7H/ggcXf3MnP37WvU
	c2aEonH9wF0KhNcaKD6oLOfakxBTr58H8WNkcve053YRYurMvjEzksh5jwxIUozJ
	pu2nu6SPAxDk8IAeTeaDOuIViFGlAbA6GDH9sGYi+lXbti1tNjB0IB2FqbRW2jrA
	YNVNmCacrLyh/GYV+y8Ol4dmdbzNn/yHEKicAmEWWN88PkZlVIbEEe7nS47rbTvX
	OYv5eLMFVOOITqurcEpiqbSnTgfHeogQWBGsH7z+A0qcEpUvtY2EMXsutsK0vSfX
	RGCP5nM6Wh2Lgo3pR/mKoA/CpcoDH6deWIDYQhMHLFxt0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv7955-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:17:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4f8e079bc1so667437a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981020; x=1757585820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmgllivFRv6RjPwaBGym+Zby4n60SrTDmfiiEvhrg5E=;
        b=CsyH88k8P/ciqkC08cCBIf8tyVzbwj/aTuMeJqmOizm+GDmbuFt2Y7kvVpMntNvtGF
         gNBgWz6SXje4KdwFJdcKSUA71S5RYFhE0OFgq8i69zejs6FVwLcN/hmfyuz5Qan+6msQ
         IIByr6WuVqx3TLdaBIPe0LG9Ufr+FBfNvxbOHCU8zny1aO8/2V2aqJyskKWH8twfRKtq
         EjEvmgQQkAFOVCHcUw+roZl48YVa4efnZzW3WTDuIh0e25Q8jrT75RPFplumfsbFriWx
         E+SY/96fiMvDwj3b4Z9UrXhDemPaC4oAAyp4vPFLHDTvzowT5+NXR6u6Jfg17z96f68s
         R/8A==
X-Forwarded-Encrypted: i=1; AJvYcCUmnKSGw7T1WqzXaCcIDNsF94n1htZBE2kC1NUg0uDitSzs243AYlFitm1w6ItWLTRegU5QnN/GUST/MjNo@vger.kernel.org
X-Gm-Message-State: AOJu0YwqpAi8yiUyVwWwG9bvwPheDIjamr7lERWeQAm0b+dwgrEKkzTm
	27rJlTPQ5GZeKYWiUvozG/0bQwDGzLP4odenfNoq4mQ4si1vouFpCzj0kKGEacZnvI8FYF/CKjU
	/jqnvEPdLnn2+hsEWgA2F9q227hkgN3clYbmP1MgB6ifOfiqWHzwRZia/RrhZMIanNcJi
X-Gm-Gg: ASbGncv3n7tU8rflK6WmVg6WH/vE9OzKRxxgQCFHDOJnbUX8aEFOKTc0pb8d50tLkOK
	d9e3Ut/rPz7VmtRJXoWTrbLty8bufcV7XrLYAx2wfGNlhJfg6+kC/hLo4AwktfY5GH69/9HuGuM
	YRX10HiHq/quG2oz3eWcExOWWNmuMtKhMfAA7kCOBMWmKXL/1rmFCypsC8pAVoctrKnXcsVe1n6
	0QIJxO938zq5N2HAP0uhbFJ5pb1snBQZteCBnf0TC4GByV8kl16vvAfNlbX+tBprqV/FxtcwEdb
	oH9Db1umvqOXhYD7BJ56a5DoFC7B0eJ9n+svgvHmAVztTjJAbodEr7P9XjAOq84G+/ABm15DQA=
	=
X-Received: by 2002:a17:902:f70d:b0:248:d917:a57c with SMTP id d9443c01a7336-24944ad11e1mr272852535ad.40.1756981020187;
        Thu, 04 Sep 2025 03:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF62jdk6gndKp8OgF73KFyvJIMRCikJPPEDPzJaEVOadSZ9EtTIxaw+Nb5rGXP78fAdDW33dA==
X-Received: by 2002:a17:902:f70d:b0:248:d917:a57c with SMTP id d9443c01a7336-24944ad11e1mr272851775ad.40.1756981019086;
        Thu, 04 Sep 2025 03:16:59 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc91987f4sm14453055ad.33.2025.09.04.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:16:58 -0700 (PDT)
Date: Thu, 4 Sep 2025 15:46:52 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add binding for gunyah watchdog
Message-ID: <5210a5e2-0d75-4532-b3ca-1cbdf8ea2a9e@quicinc.com>
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-1-3ae690530e4b@oss.qualcomm.com>
 <ea295ff6-5395-4470-afc2-76e5e2dc9fb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea295ff6-5395-4470-afc2-76e5e2dc9fb5@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXz2zuUE6at2ks
 8AM6p2nU87RHKfnPrXvvHeyDBvRsoIMJq5J/C/IAk/zs2yX21L2UHZKy6Xs3nKZWm2GPy7N0ZqS
 6b6QUpnYkFf4ESBxdq8YE2vNS7k5npFmprwaFR9MFqPOYr7R8uZyPCITq0JhHaNd1ZJf+195WrT
 SJEadAXthInBdu/n2yUkQXFjT9g0VWGLiXi4zw4uggisLNdnXO5Yd3UqzNFZuFzQqKu6XJVBs0N
 cOu0HkxIZO6I7LGI1E9xWzf4n+qzrVRzWblMPx+Cb657aNFigA622/rUSVb+fVbyo3QYrmp5Vx7
 8BK/siCthS7x0/1pZJeX0cX82qmWQ71s8H7aVROLirZ7kF6HbTLwu1vnBbEgfgeo6wY5vvjfYJ8
 M+lmpLGn
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b9671d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=oqeMfTGgUyYRHvyDDiUA:9
 a=CjuIK1q_8ugA:10 a=i6qsmYmKKdoA:10 a=csto0wWSG80A:10
 a=x9snwWr2DeNwDh03kgHS:22 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Eis1aMaL_voF8oEpCKz46jZTG-v4h1e-
X-Proofpoint-GUID: Eis1aMaL_voF8oEpCKz46jZTG-v4h1e-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On Thu, Sep 04, 2025 at 11:52:32AM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2025 21:33, Hrishabh Rajput via B4 Relay wrote:
> > From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > 
> > The Gunyah Hypervisor applies a devicetree overlay providing the
> > pretimeout interrupt for the Gunyah Watchdog that it will be using to
> > notify watchdog's pretimeout event. Add the DT bindings that Gunyah
> > adheres to for the hypervisor and watchdog.
> 
> Wasn't tested, so limited review.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> 
> > 
> > Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > ---
> >  .../bindings/watchdog/qcom,gh-watchdog.yaml        | 76 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 77 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
> > new file mode 100644
> > index 000000000000..bde8438c6242
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/qcom,gh-watchdog.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/qcom,gh-watchdog.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Gunyah Virtual Watchdog
> > +
> > +maintainers:
> > +  - Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
> > +
> > +description: |+
> > +  The Gunyah Hypervisor provides an SMC-based watchdog interface for its virtual
> > +  machines. The virtual machines use this information to determine the
> > +  pretimeout IRQ which the hypervisor will be using to communicate pretimeout
> > +  event.
> > +  See also: [1]
> > +
> > +  [1]: https://github.com/quic/gunyah-resource-manager/blob/1b23ceb0dfa010b3b6b5a5f7a4ec1e95b93ab99d/src/vm_creation/dto_construct.c#L519
> > +
> > +properties:
> > +  compatible:
> > +    allOf:
> > +      - const: gunyah-hypervisor
> > +      - const: simple-bus
> 
> What? No.
> 
> Don't create patches with AI.
> 
I am next to Hrishabh when he is writing this patch. I can confirm he
did not use AI :-) not sure what tool Krzysztof is using to catch
patches being written with AI, that tool needs some improvement for
sure. 

I will let Hrishabh share why he put simple-bus here.

Thanks,
Pavan

