Return-Path: <linux-arm-msm+bounces-76386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C486FBC4A81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75F2A3A68FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED57239085;
	Wed,  8 Oct 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7dl0iAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69182F4A0A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924646; cv=none; b=g9idulFTN65G4n4paUX5iUZZipQDhsGZCExRCfeoGrUBjhvi6lhsSpOOw1kqNUh0uv72uBytIY/hHWPKoqD+AMEbQzdv1ghBJTHWX8CMialvJxcCUQx1Ocx+aypeKA6Q2aZ67M8HGiKOKnLawXTKkzw+YlEThyzx49oerdF9reM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924646; c=relaxed/simple;
	bh=+VNqlLUrL2S0F8q0NhWGsHgRy8Zk0dmY4dvSjl9E7xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhQqXg9BxVNwXBqL+U36ZgVE6ZyvZwIEuEnLHG9JgtudfYMZ0RS0E0WbrlHTdGrL+WkMvFZ3sKvqfaWkCsPLotmLygExM89jWuOl8CprgL5j4q4w0A/qGHeCYJcXMM+U1rl0BkpPAnAuENdWmZE45qgBO1nYBkT7MTANzjow0SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7dl0iAC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890nVx029797
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 11:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IvIqdTOEMlOB1aUq+P90kmaq
	VRrdMXHPXR0BptFOObI=; b=B7dl0iAC0ebQmS4RvC+0fQwC+ny7v9BhIiF2VS6m
	dF4eGP/oq3zr1qFXymAVGczqv7LfBj737K2g1uEjHKYLasujp++gGomWTbuHbqvd
	/bFgUveBUOtPciAKPK0zkrsVzQUu0mulhBusrAIgy4rvbOlDvj5R/uUjaHXYZ/Jo
	KEtcMgFNSq9sV3U/iPsb0ntw7VV93DxkUGcRJFul7chATv/Rsn8pkfr8Oc5H3Gp4
	Gxq6trVLQ0g2H5Eu8k3CoL9bpqwc1VRSOyuayswpVnDe9lfXP93KaFVwYZijVekq
	E7D9/zbyoob+BHI6GLQ+OStxjdyqRkS1yVgAvv3sziF7og==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2g1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:57:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e60221fso10996849b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924643; x=1760529443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvIqdTOEMlOB1aUq+P90kmaqVRrdMXHPXR0BptFOObI=;
        b=dAxemmuohIXQZINDPIfivawiwct1f6QQlNfVXW1SKyx56jua8W0lhpnc5s480OXh7x
         7lvMGD7eBgABa9iTaQ3B9HoNRXm0QOJMuOkU34OId8AZsdxpTwCCvk4n0lCFFjSrA7vp
         nNiQPi9vU/K5CWrzgZBhHvBxvR9R6zhjKLpoB5ePLuZiAAw7qPb4RNH4n3uo/X9uYuvh
         LC1r/P16vzo42f/9+ohPBOEfVCfvgD4obp/KGxkWBxc3g16wUKSyGeXq3O/pYY2FUUNm
         lI+Ri6NiH80ci1nFDXL8A0dwiyHBn+tlX0zKsgV15TNe/mdYWsFlKWFenmz62SacpIhB
         uGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4EKS3Amy+DqxLLRSF3m8DqL/lRnBw0qRn244Wn0GjPatHBMbdFLkm5VDxOT8nw0FQCu1QIOVdWe9tc+ls@vger.kernel.org
X-Gm-Message-State: AOJu0YyjM4e0JzHd+ik+ihnx6iMk76qT6eeojLsS/VYsy9oucm4AEF2D
	RH4hZXzy7iWW6z8PLjUjWhiTlY4wFhdaD6W1PWkSfMyXGclwcX8BYitZEM2CseYI4orRZ1z+ok5
	lHUN9pgaFWsqLncYP61xIkuAFgb5+GhIERawoKijexNGs9gQafVNYinD+cfvHv0winm5t
X-Gm-Gg: ASbGncshmLEYbrQgJYqBQiYhQDbIlQ8LnqPc4EkbCzcPkOa++HBQhkvcHU+gTrodJo/
	G/e3Nb4Vnt44Azv7tIKns2sKQLMnNFLqjphZq30qBIvnSAxi8M9DmCGdnFeHoMp48QS6NHAUvq/
	n4Ry0DUOPODhlvDY000jALdk44XUP8r6lpKySmp5Fuw0ifnZ89NV3C2PSraNo5uEOqYSTPvP3IM
	Qgq0STPMfJjMQtNuh30hUYXi3hTuCGObr1Djs4O/mHUitnjT/auyORxWCsXm2jmnn8BfDyoxwp3
	/PpFR+IboXP6sUoKscvTEQEA77Dc8D9Y97hbBBbUOHSTHpNoGwMD58nn2Tb6yzR+xdFoafUh
X-Received: by 2002:a05:6a00:2384:b0:781:455:df62 with SMTP id d2e1a72fcca58-79384f488a2mr3750494b3a.5.1759924639078;
        Wed, 08 Oct 2025 04:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaaV0CNad2Np/BckgB4G9x2kyiSi6m3pXTtlqh/eBx1lGlL/DyqmRyKBbMygqe5tJdC1PP1Q==
X-Received: by 2002:a05:6a00:2384:b0:781:455:df62 with SMTP id d2e1a72fcca58-79384f488a2mr3750434b3a.5.1759924638126;
        Wed, 08 Oct 2025 04:57:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e809sm18617848b3a.71.2025.10.08.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 04:57:17 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:27:11 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Message-ID: <20251008115711.hi6uby5ivbxbsjgw@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-1-de841623af3c@oss.qualcomm.com>
 <ce03d7e7-9342-465b-881b-50aad29fd9d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce03d7e7-9342-465b-881b-50aad29fd9d1@kernel.org>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e651a3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Nb9z0baHQhIVdLoCI4sA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7ujW703A8Y8xmJRNQEdG52rErDNtGYqM
X-Proofpoint-ORIG-GUID: 7ujW703A8Y8xmJRNQEdG52rErDNtGYqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX7rqSeib+292z
 6BvPs3d11RRfPKimAHOW9R9XMp3+BZVgJH8diPExWGAKhiwLLJeRbhmyh7dQqRyqjupfIjToPkA
 wBNi23fngKYQ9YkMVbSe6ImT+jHjO1WE14NEJSZAtiUw2G3Xz0WTTdzYMY1mZcSjBFmlzT6vyL2
 csy2jkfg/iV5mijHm9TbZinl+1jr3fIGo6SB3ErgMbQU9iC9ZYCfCiJr8Ph4wkjOrPG9iButIDw
 OomVQ8XgLI6s6Ttdg06EV8PwTxoc5MgpyMbkPEEyDSVKXhTWh2qilamoFP7Kwu970js+32d+uWC
 kUkZtgX5pMx+zYcOu/FGabndD7f+Loj2LGtAUgBsOYv5enOvzFvterDzOvD0Z5dENdncCejfVtn
 1EUU+vdrQAEbehjcsJA6vwGYJ9uwzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On Wed, Oct 08, 2025 at 05:09:32PM +0900, Krzysztof Kozlowski wrote:
> On 08/10/2025 01:48, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
> > configuration for remote processor and when it is not present, the
> > operating system must perform these configurations instead and for that
> > firmware stream should be presented to the operating system. Hence, add
> > iommus property as optional property for PAS supported devices.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > index 63a82e7a8bf8..8bd7d718be57 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > @@ -44,6 +44,9 @@ properties:
> >        - const: stop-ack
> >        - const: shutdown-ack
> >  
> > +  iommus:
> > +    minItems: 1
> 
> 
> Incorrect constraints, this must be maxItems instead.

will fix it, thanks.

> 
> 
> Best regards,
> Krzysztof

-- 
-Mukesh Ojha

