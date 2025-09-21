Return-Path: <linux-arm-msm+bounces-74341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4AB8D738
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 10:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F46B3A48AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 08:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE3323535E;
	Sun, 21 Sep 2025 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JP5+TcYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE0223B616
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 08:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758441895; cv=none; b=qKSKLNNPgrp32fzLZwayKldevgSeo3odKDuabUdRn0JOLkcIwv4mFU9ZUgir1IbxgONq1aXnmX1IjCfNatEIBBiHy59IwMEQlDwS8x/JR7f5jopkFwzJAg8M0KIHUs7CGZJjNyco16d4C5Br0+zUCRX+ehx5+japTaNBETiFhwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758441895; c=relaxed/simple;
	bh=WSnEXLeKHrRXxvgOkBIhVPDjW8GLL9YPyvl91reKnRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/cb+tSMdUL5B661ozBLkrc7YqtYCaTFMIQvXt/YBsekZIWETJiVK9Ia/pXk6H7YKDGd1uENX/PxP8sCyL8o5n7lug95EWksQfkIwV0TcHHntWX0kVjFcKszV47cwwqFL8ssjLJKCDcMU25bhYefrynqGisSePou1ut22DOS7zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JP5+TcYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L6EDdI032286
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 08:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XEAbnHbHFmi3/gfqNWQjGriA
	bFrVzrvYQPzuEkN3rt4=; b=JP5+TcYPY6LzluEkFZbKFYhH25r6O2ijmcUFHJqu
	M1XaHtBxXz/f4rf/R3LFiZgy8BYi/ZIwcUORGkEUiJ4JT1nN4H+L/Zfu/g1b5m2Z
	owh6KojNfdA3aHiWVHQH3aNwvVaeExap3LbiqkjN0smy2Q7HGgqYprr8dQeDsHIR
	LH1EEa9+S6q/zZXp2/8+RX9jab6DXM7BEMmg1QaqEIIAPCZR3HQ+Q2sKMQvcA331
	Um0RTMTZtjIg5Kc1izKZYpzPhOkuqyYv5KNAWfh58tPc2ARyEyNenpTyYVj3mGdw
	jHewL9n+uFcCVyIGW5To6sVv9UkZ8jY2KY/9TLEFhp7n0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyej4bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 08:04:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b7a2999d38so63533821cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 01:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758441892; x=1759046692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEAbnHbHFmi3/gfqNWQjGriAbFrVzrvYQPzuEkN3rt4=;
        b=QwDUzbih8BBMGdg9rB/CjAQFHI/PqFfwqKZIX52xsGpzq2rqUGLcH5E4F/VqQbIIMw
         ZRyFbSU7muLTa4A0soiBOqZ4gM1lY+D9sWYy8k9ST4nRvehntH+SPJ/JNEK7+oQpguxt
         VAhaIlbvTK0UfAx4mTyiilDGeltO8N1e2Y/fB2pVCDd/sHpnah12BT7TavDdUGE/onvo
         CXnBC6lIXvw3wiVaW2gxAZLez2D4/hxJC+PMf6aknICPnMOUVtT1D198TiakgxWAqr35
         yoJbQ0ngTFPRWL3tEoDvHG2B5D+zHigNqCN7b/fdVfdhQ7sedN7nU9ukvi3P9xYc+BUJ
         AkLw==
X-Forwarded-Encrypted: i=1; AJvYcCUDTjppwxGewd1W9f8n+RXbKrFe7WRkKUIbC3nHkDssnKnBQmnvZF/fNNF0S3CEmXsgibnppbP6LcxyYOtw@vger.kernel.org
X-Gm-Message-State: AOJu0YyT7HhhipEOCldyy2N+w5gNKgR0yyWfNdCoZtAyqFXvgBULFCdD
	cb4pV1PT6yjFhHzrIkc9pHXcIXdur1gtAJIZf7abuYe5w+nkp6vmm5nun+K/3xQ52lPhIWcBvK9
	f/tHFWKsuBBsO6nlQz9PydsZaphCcXYPhzdMmFdvdnl46RRsra7KwjoP9/Cvwu6x6wdgg
X-Gm-Gg: ASbGncuXzxWlc6Z0tlQkLpe1N5noTUH11o2WOhc3HF0ZIgApeHInMPmt82/wqMLhcqQ
	5cwXzQeIzMws6kJyzx8fQzEXmGaGsBrjXr9nl2SDiAMI54vyI9ARWjHErQ78GMN4ga2boKb3CFi
	Jji4n7oMxOkTrk5/1yUI0+AM+17ophksUBrIvQCk2hMis0qB67YkqpQlmN1YFbIqmhyeEDkCCYC
	/uYdIhj6oLbzuFwwVu12rXn2zhdr/EeOlSQ8+L72IamXcJaw3Ko7NW3FL72QZp6uFkHYRbBzQvB
	hy+rSLocAYGUk8L7T6QZNNVURhoXxoCmVhF3kM7nKj4yjSa47cbDKNhhmm+y6PFhI5Cyy0TN9yW
	mD855EzCaauPfQCUcsSq8cghAvlidfu3gkqVH/SY8R0C1zqQAwNxX
X-Received: by 2002:a05:622a:4119:b0:4b3:4c51:6436 with SMTP id d75a77b69052e-4c06f07dacfmr109908901cf.35.1758441891716;
        Sun, 21 Sep 2025 01:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ2B20lb1PcP9AA7tQ7PqdyejHFWWWwxoSKhwLsPdsUWH2uJIeWVjvdVYTP8xVh+qWatH8wg==
X-Received: by 2002:a05:622a:4119:b0:4b3:4c51:6436 with SMTP id d75a77b69052e-4c06f07dacfmr109908621cf.35.1758441891250;
        Sun, 21 Sep 2025 01:04:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a904b961sm21573731fa.40.2025.09.21.01.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 01:04:49 -0700 (PDT)
Date: Sun, 21 Sep 2025 11:04:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: msm8960: rename msmgpio node
 to tlmm
Message-ID: <le3zymkfrocgkzb3pldezhndricja7xpg3pj4xcpmt6ngnvuam@he3a44gnvuoj>
References: <20250921-msm8960-sdcard-dtbindings-v1-1-5a2455a30a06@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-msm8960-sdcard-dtbindings-v1-1-5a2455a30a06@smankusors.com>
X-Proofpoint-GUID: aLL9OBHGmckETwPVM5mTH7eBWGKgJTe3
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68cfb1a5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=mZIXpXDClypwcOwN9UcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX85bjXG+LWsPw
 jgp/xgMXoXZr3kE8LbiDEMgy7/Z0TpWWRNtEpFW3x+SDsAIqT9xG8y6iOVhIrOs01o77Tz4zAnb
 erf5qA9YzKi0Y/goMdIs/oGyak9BILnvE3MGfAW0ovV8xi4/XM+3ASKrMWMwBZmRxO2W4HDlRNc
 3p3jxit6eUmkiEBtt1/lTB3ZHblCL4ql3YMhFWvmqRC9TL4bi9sUgQYvi1I6+/M5nWbfX05b8aS
 uS2zPA3qUkssnvCX6EUHkGUzu4EokGBcLQgdjIXMgpLNjeRti9DGWFQ268h1SuA0TWYzHi37HVK
 VaANFsyi1X/AI43o2V45PQda8idgmQwx9c2sbZPTlqlDxz9gFALjIK6lwBj5kQdm3UzBCp1+103
 vmjeD9Vd
X-Proofpoint-ORIG-GUID: aLL9OBHGmckETwPVM5mTH7eBWGKgJTe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Sun, Sep 21, 2025 at 03:25:59AM +0000, Antony Kurniawan Soemardi wrote:
> Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> convention used by other Qualcomm SoCs.
> 
> Suggested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
> This patch was originally part of msm8960 cleanup series [1], but as
> Bjorn pointed out, dt-bindings live in a different subsystem and should
> be submitted independently.
> 
> [1] https://lore.kernel.org/all/20250915-msm8960-reorder-v1-5-84cadcd7c6e3@smankusors.com/
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

