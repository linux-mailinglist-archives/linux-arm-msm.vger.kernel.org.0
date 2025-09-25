Return-Path: <linux-arm-msm+bounces-74890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BFB9D3AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7763D1B20908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C0C2E54D1;
	Thu, 25 Sep 2025 02:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HX4F8QJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A02E542C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768438; cv=none; b=mTSJWANlObsHxlWiOjpxuGYdJKULEDFzGQI4HwMxJhLuhyYkLcaATdbxmHMBERaMI3wuhzew1oLIHmEVvbL+3n+2oC+mi6c/1dI2+OAVlKghUbqP0q2W8BZHACWhLhM6h6V5US6qvYOT9W/7i+9kj8dQNYcZU32ajWTqxZTxdYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768438; c=relaxed/simple;
	bh=knL0qShSKz9iITJEJ5pqwFTLrmcOR2lgqU1fn+jaaVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFvLOT+jdquTJdqMUmif+bagpJ2ntrrwpiSyssTIeJ4N7ycZdvsAHhn2XSjwmuCcnrR0FG2PalllfU003ptTsX4K5pfGAhoxbm2kx+ppMPjgqw8ykQI7tXMPmFeqO7tyjk1F+c1gsJtnU/9DeWyEHvHrOIgwuvIJUEfLyzkN4tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HX4F8QJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1EbXo021502
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vmzDde1nY9Gum+QP/kxmg/q8
	dry3hyyGVlLVwLkd+PM=; b=HX4F8QJ3IB7L6d4GE/+g7UqPw04IyNlM7sVMyFyf
	3OmCpJ9X+A/hHFuLuT4w5s0w6HkAT1GYeXSsI2Uo6Kry4P1vYCSFOKzfc/EjsJlW
	GJ/IYnEbYUqzyxKEwfzLXSxZEr2Z/vuAqnHYljJE4+eDHJ99FvLtDiBXHs9HRbxO
	SCcAy8mqGF6ttw0/tCjl2zWgVO8rdVFlskGCaAnd3eb/LBklI3jq+yAl9t2I7sg9
	1quHLjQ/MGW9RcKNeoVuBq+hO6skgvwhYWPs9pX3nj5MEaUkO18AELFdrvJYav9t
	VlW2CXNrzUVisbgqZS4+ve5L7QMeHfms9ykmDnPjmG404w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budae260-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:47:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78ea15d3548so4559596d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768434; x=1759373234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmzDde1nY9Gum+QP/kxmg/q8dry3hyyGVlLVwLkd+PM=;
        b=NTFRXxg3xptH3ZrJqbQLc/LgLy5MLa82k0E+by4cY4z6jdDXmWJ0qTtM4XdqEcNw0u
         XX39Ini4BuEDgCbyfOrtlkOmGvR8mcwXJLmqGtmEWCN7tf0W8GRSTp7229XZ5akOjTID
         XRIJZkWE+z72Ip5rRjksYr5CgRXpYGoE2bPT58/2knhbCyZTxGtpxJnRniZCAX7i9Kk2
         qe7LgOZQbj1C17PTg8gXSp4Z5u78dYl+veuO7dV11PT19emLYXrW278vbSnFKVl2MijF
         yWojBlimm+W3kweQFJgwtcR7gR5TDJEugln2p25sjrfMTyj5gUs8Mx1+3dWqvNyyt+vk
         o6jA==
X-Forwarded-Encrypted: i=1; AJvYcCVbHO2bX/lsSK/Yo6J4BKv0pYwbpZ4dHx1FzXaiaBg4xi7S9UKk6BrX93Cyvjv0u0qAigdPyBd5cfn6XeC6@vger.kernel.org
X-Gm-Message-State: AOJu0YypnCE5v8z7Bv64Ci8YwpmWmU9qEKCvX9pk6lVxuoMSLsYiJMcY
	j9/tx29Hk80bViOjY0Gvj1GsIeilJ+ERfJpj0nuvXo6GWA7anjPFyQpMQsnAyTi8VsLAhJwCbJx
	+FtJ3kZyqhhIOlJr3uFy1D2IQh1KBg70E8eodw6aTeOtX7Byl+OdcUHpaiJ1uF1gcP87y
X-Gm-Gg: ASbGncsBML8/FztL/QZczUZuEzy67Z9OtuAqPbSfNsRdIVe2R+cnnwuxA3/qHv9NJpu
	L9xnPcZAZbJ0hwaNH58e+bjXWAnIBNJEiv63e1m0YZivfGVGj7dhfQ5rMsczi2cVePRvbyoxwX4
	EkgrpE3VSxV0yWZ7vvkU+fOQZS9VdoqtokF4UNQjr9STJz0ySW6XhabZtPkeeKT9UGe3SUPgj5l
	ouEw8X1AnPfguc5VtrQZYVvY/+aARqDGWMf4K+yAYCnWKt5VWyuCJ5FRyKVROxLOeSYsemloq1t
	mIu8ZpL9vxUpMfZmdvxXQE1eyAxn7qC0EMam761cLRe+PjhnHv8jRQzP+HWSZ8o9vgZOklnncTP
	pBHkP+I5xlSZuI/xAL4VeLFkF0JFIJvwgrRrPkJrGfDPa9/W+5xUA
X-Received: by 2002:a05:622a:3d2:b0:4d9:ea03:74f8 with SMTP id d75a77b69052e-4da473535b8mr32183101cf.16.1758768433998;
        Wed, 24 Sep 2025 19:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExb7T/OYccuwzgjimDxaVA2LXm9/FSZaMnNzHFBySx7V4Je77xVRXOd4TLu6HqCTkejd5+IA==
X-Received: by 2002:a05:622a:3d2:b0:4d9:ea03:74f8 with SMTP id d75a77b69052e-4da473535b8mr32182901cf.16.1758768433568;
        Wed, 24 Sep 2025 19:47:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665640bsm259733e87.83.2025.09.24.19.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:47:12 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:47:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/2] interconnect: qcom: add Kaanapali interconnect
 provider driver
Message-ID: <2mq2qqrgm5x4hj2cnstzsqzfk4lmzhg223hmobrjnqu62facc4@p57wbmkys4in>
References: <20250924-knp-interconnect-v1-0-4c822a72141c@oss.qualcomm.com>
 <20250924-knp-interconnect-v1-2-4c822a72141c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-interconnect-v1-2-4c822a72141c@oss.qualcomm.com>
X-Proofpoint-GUID: o9HThSitcSwzXEUTyQzwIyhgXQh627r1
X-Proofpoint-ORIG-GUID: o9HThSitcSwzXEUTyQzwIyhgXQh627r1
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4ad32 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2uCcKERadT1UtqjeBP8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXxKoWoGWvVXoi
 hB7atpL8NurNR8zmt1G2Hjlve/QIYA5r0ZqbvpZBlqtE77sqleShmyE7bgDmu52JHMX54zJjooT
 ghISWae9upXxeDeM9xWtxtsGgYIz940GE0MBj08W+6nH1cDLNxJ5FIF+hNXQUWo8rkgCCN9S/HE
 G97aoY9Wb94CGLEOMPAmingDUSEB+B7GDF5iOk7FGKsKtAHbmBHCcGh0HJhqDbxowbimdB9YxdS
 N/h4oEHKSpIhqrM/hZC0Ld5qEtngpRHAcUdNakTdQMb/XmTwVr3cCdK5VBJutrZh1TAyZKm0gE0
 6l56lA2RYfJVOK4KDER+pBh8io++XdXjxnjN3dIhIoj1seZ10PD0DbYRgyHF/2YA02hMPazfzyu
 XWiRjEZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On Wed, Sep 24, 2025 at 04:02:45PM -0700, Jingyi Wang wrote:
> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found in Kaanapali
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig     |    9 +
>  drivers/interconnect/qcom/Makefile    |    2 +
>  drivers/interconnect/qcom/kaanapali.c | 1868 +++++++++++++++++++++++++++++++++
>  3 files changed, 1879 insertions(+)
> 
> +
> +MODULE_DESCRIPTION("Kaanapali NoC driver");

Qualcomm Kaanapali ...

> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

