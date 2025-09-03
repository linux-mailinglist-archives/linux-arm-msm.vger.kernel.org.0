Return-Path: <linux-arm-msm+bounces-71854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74375B41ECD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 297B63A368A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CD32ECD20;
	Wed,  3 Sep 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jtu/IL2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4532EACF3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756902162; cv=none; b=tfz+OVBr4KSM5gRted7Aq9F24pt3vmmmIPbvF9J2mg4xxogHTBi96x3U5xxmJZ6/huF3TfuDoJ8w96V5BmyMQcDXqmFamkbWgcE1L2wL5RIgi3SooI7sLg1egZb52L+4JCmXpCrWA95V1MwhGp5zSpGZZmQcIrwhhW0iFHm0q38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756902162; c=relaxed/simple;
	bh=q2Zj0cl8lYA5N8WZHyQQlQ3Qp6xdIaxhynORgU8nFAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBZCNeLHy9CkZz+7NjckNPXdBKrHup274lOKR6FLRZgZ657WYdFbqGYjBuRRxJgIBRQBfrxHn3S6i9nUdoFFymoZ9W1z2D6gxt8kwkjziT6ufd9pZtY7kiViYOxas4H9/+F3O8xZMRmT2+/mc7eL1IYecHHkqUSagaHzVGbLTW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jtu/IL2K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEusY004899
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 12:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SKm1bfgXnDxPg9BzYUZi1YNq
	zOZXroVzr/NmpGjdi08=; b=Jtu/IL2KrkSx5TMbE/DFsgGnqMMy/E5AyajJJcOq
	FgX85h5Z/97+9giWQ9I7TucpxGr5mLQ61iWXqI+4+fHA1K7trWyYasLYxyTMhiga
	a9ADihQ1KpB9uBMeaMrg5i74/I2azN7Kf6cjB3phA3ilyxM1evqaTFCZFkDFyfJb
	9gyFIWLdbK0vnUv1fofqKb9ajWWSzeuNeDlCmuwHkbZlyU9X5SMQPtioi8YO+8Mb
	hzYO81HZ3T03DLXbWPfVPVADRj+tyNzYaNrK6nbFFGDQb1gRU1Vro/019bSMTsrJ
	sOIF9wmALbb//lS1iMQQ7TazP7pwxKv9Cy36XsgRJpod/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s3p70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 12:22:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32d323297so67302971cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 05:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756902159; x=1757506959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKm1bfgXnDxPg9BzYUZi1YNqzOZXroVzr/NmpGjdi08=;
        b=eIO3V4Y5HRaDEJmB8Vb6Q1+uHIVMNy5K3mDCmoTKT3wWVmjQeZn2BLoKa+zOPwlqT5
         oAt8cemhjukycVK6s1C634M1KayOIE7UC/6cL3KcAybPkUJAucZC6xvPIwkmAoT/u8PF
         ga6blN/flYlq0VK+4WsWh8Q3pUTbBuyQzrhRLJb1GNKFS6tmcwyTWNd8TL0VucDnVDgs
         i+/Ez2Jl+AoEJVzvChzoAm1M5JU+53PAWlzeSqgQI5SaptBUi87K5TDr7ZECCURLTK59
         4MqA12MqHjuWt+58WJ4hfOYUePxsuolZ/cXYKPNEN+Ngwu/RHZ9oABj6nbcsxXVYwp3V
         v/eg==
X-Forwarded-Encrypted: i=1; AJvYcCWVUYkfYy1XrOtgQ0kpKQT6F5YrvnRR8jlMhx4k03bv7liiFSwrbJliAc5YHx06mK8X4W3KlsjPLFHnHV13@vger.kernel.org
X-Gm-Message-State: AOJu0YzxokkQHa+QDhr2dcqT3M/etZnhPatj/ZeweWMOlDXeajed1CUa
	hCW2b4G4UEHydMNIcFRz95wpzoGGtwBATMNLWGwtraL9V2kjpMCIzD0VWbt0PBcd0NYvd+7fFuo
	mG9mxMdTcI38km60oQRD7y1tAt6hRMb8DcxMOu+3U4za9VBj26tlTOuezA/l+OiZoTn86
X-Gm-Gg: ASbGnctuw5+CfaD9TP89m3jPPND/zYE4najbZBbSZnUZNxJVfZ8VbjW34ohI9udBset
	7oKRHKzmmDudiUYX+h7XSUkJhrodqUrMe9IN5XITKZQvBxBYz6tQuspxQWIGbV6hANrVid5aW0/
	Q60Ga+unnHym8WTbTnir9u4DOleDWhnYPBwUjoHsbFvWApQ38PX1DoiSwtqJCOd50sjGIZQxOdh
	8GFZB76H9vxYfE1Z7MqVBhv3hs+aoZeE0ZSpjP4xgoczHGzKwhCxgcxBvrD81YjmAdgH7J47VUK
	nxs5DYOq3Nuleeyn+q10TcZ0l1da5BpfCwBIFR/lbVY/jARcmHyIKu2eOTsRg5Y0x+z1e+1CSaO
	3qs8defVLslo5M2h7POOpquJYj3CFa9VMZWRLsdkmmLZiQbfuKb/x
X-Received: by 2002:a05:622a:5146:b0:4b3:4e8e:9e4a with SMTP id d75a77b69052e-4b34e8ea939mr65237631cf.56.1756902158519;
        Wed, 03 Sep 2025 05:22:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2FoqT0z4zyASuUjUeIGy8E5KMANVV7KhtQlJY8p5efCPL8u0tAS3LoPMY6FjYaebAlTSVcA==
X-Received: by 2002:a05:622a:5146:b0:4b3:4e8e:9e4a with SMTP id d75a77b69052e-4b34e8ea939mr65237251cf.56.1756902158009;
        Wed, 03 Sep 2025 05:22:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm495216e87.99.2025.09.03.05.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:22:37 -0700 (PDT)
Date: Wed, 3 Sep 2025 15:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rajendra.nayak@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
Message-ID: <hxwrmoyik5bzgtxufw2trjwz5oqn7jut5wsej4v5xqdk5ho6hi@jic2xbti5jn6>
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
 <20250813065533.3959018-2-pankaj.patil@oss.qualcomm.com>
 <bdfb09a2-0053-4a07-85d6-5e15b8bc126a@kernel.org>
 <d35s5ldfswavajxkj7cg3erd75s2pcyv725iblyfya4mk4ds4g@hekhirg4fz65>
 <bbf60240-4d84-47fc-ae35-483e55968643@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf60240-4d84-47fc-ae35-483e55968643@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX3RH6p2VGDyut
 WHK6tdzFSZ/Zht9Pd6E6whecAxMjca9CIJqwEqOVWUageEpB4BAgsW4vFCX70dkR4wFM0kMtvVm
 cjgnc7Rtv20JHKjtcPT/Qp4HJ+fjKQPg4h9O78pTTt2XvKODAblAI73gKqOoQ9CSWT4qC1Iq8hp
 55r1SAH3Zhs2XI2U09SIEFcNIutgeyT9arDbIPnwQDgy0nFObeKwTZ1gk4YK+3vT+v0mqmlqCCj
 BNfJgQSVJj1mGXPIgajmqApPd1DeFCndRm5XuyTuaud8vhxOc5m8H3CaxnGmVJH6PfIvKfOfmgI
 //UPO5ESq0rQ5EzeVdhGVvyDDnsqdqM1Vn09Cat+2nmM9lbx5G7bXBvFW7inutXrirE/PJeOmKd
 ZVUc+zvX
X-Proofpoint-GUID: jRwbyaY8n16KFjyMepCALsRnP95mJBip
X-Proofpoint-ORIG-GUID: jRwbyaY8n16KFjyMepCALsRnP95mJBip
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b83310 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=9UiGzq1QuJPVDsM1CnsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Wed, Sep 03, 2025 at 01:28:43PM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2025 13:01, Dmitry Baryshkov wrote:
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  gpio-reserved-ranges:
> >>> +    minItems: 1
> >>> +    maxItems: 119
> >>
> >> 124, I guess
> 
> ...
> 
> >>> +    properties:
> >>> +      pins:
> >>> +        description:
> >>> +          List of gpio pins affected by the properties specified in this
> >>> +          subnode.
> >>> +        items:
> >>> +          oneOf:
> >>> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9])$"
> > 
> > If it's up to 124, then this pattern is incorrect.
> 
> So 125.

I think so

-- 
With best wishes
Dmitry

