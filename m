Return-Path: <linux-arm-msm+bounces-59234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB1AC2885
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84DDD1C07918
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628D5297A71;
	Fri, 23 May 2025 17:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxxUg6DM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2482980BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020946; cv=none; b=lQO9YSWlxE9sdsV3jY8vQPwH3rsuCIENvtamoKLlMlVySyY3o3M4YyLgIKBu8OBKBnZ5UltBYYqR5Dr1KInItthMNw4Y9fWcjXeHL8OC/r4TzS8ynEZRLSB+MAWg5AE3fYWo/Fjff6M8TdyBVNcy6g04eIWFODXjsAH4ZOtFELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020946; c=relaxed/simple;
	bh=ciVfyX4hXuuw2wqjD9Sv4gEA8a9rO8kGTuisbQ01LOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvTE1ycoi3T7jSnMAy/Irzmnr7ZI83EdtUgCTMkIhofCK/A1Shekac/oCxKHcAo4EjXQSF0SHoVSpowOLVqZ+I5262mbeMSXAIJDNeIH5K3GcYMiXh3W64WWQ5tWRaD0iCZLOR7h3mxSIPR847C6OxfgBl4/h4zEDLOq+p6qqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxxUg6DM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAplgC006647
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uG3JqnGXG+GKZ5KgytOXKsg7
	GoHCQnfSuXFijLHgzo4=; b=JxxUg6DMCh9y+lYdqYpKLFpaqt8cdCay+Bga62Yz
	Dy1aqjKUUZcwZ3TqoQSyidpkCUPWXIJARJpQSUHySC2MvWMwx021wFPRbqJOSN0R
	YSoVYKhdn2nqwk2mz1DHIjwYFsLQ8bluEUBX6B7hjh5XSEKAV8L+9rJkb8op93Pz
	nax689/D+/fqv0rod4CgoSv9gkEMPcsbLrhzjGuu48jiNRVqlMeLwMIOW9JjbVok
	YyCvTU/l5CCaczqFn3xx6uJ06gSEqCvlCgzG3xCWpdVRZmSvhqN91veSGfXt+PMA
	XPprIcOc/F39PES2gMz7b38yq03imVpQv9m5G7IlOIEQag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0tvtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:22:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c92425a8b1so25346085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020942; x=1748625742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uG3JqnGXG+GKZ5KgytOXKsg7GoHCQnfSuXFijLHgzo4=;
        b=iP01jC/0UshGpFF0ELfKsWqTTnUmH/rbm6UXcfbRAPR3rNLhFUOgmxyPZ65X8ghYaj
         6nTmx3/dyc+Ymu3krlrtnrWydGqPMYo92iHb1bcM2gLjqLT6EQI6P1a9tVkWv79Xz1a+
         Kb/O/OoxTH5zy29na/OLSFf/Nl727rcM9J8MzDTjHxi4kHRKo7hsUC4sJj3K1/9GgxPL
         5/aDuC24QL+kp/nyysaareICituo3LoZHTNkgIDf25SmoV9olNmtNGcrar7PIpomKHU8
         XyJYRR5npQPLgzNz6MnbsaK56V3CFSUHGt4ZXUvivZsUU1gNa8cJ8fmOY2fxZ3wICOLX
         /2yA==
X-Forwarded-Encrypted: i=1; AJvYcCUlFHzLlBKAFm/6xQO7up0rcj6fDjhZw60IJi5t50uXxmURV7TZ5voo5KedqPyOifNtH4QWFf/VcShUbdsq@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+77HbF0zmcZTG/Y9B1LiwselABJFeOeg4b8JtTjtdaLxwInm
	Am/IoeUNn5ukajsnqrasgxNNMV0Kww0AGJu/Rz9pnEG4eo9vgnMFvCeu6tdGgL5MnYu6ZuLczSJ
	ehjn8t0t6bjOEzm1L0fIwJ8nGRhqcNcBRbKA/pQQMFvZQYgLfLeoRYyiXvZZURPtONM+N
X-Gm-Gg: ASbGncujrgbBdh5f9IqvAta2hINu2YG52eu+meuKirNs5USI9OAvwdEx27yu5y37XwJ
	ztPUFHdwzb1E2aJxV52jPLFUV7HWSsJDMBGxaA5yXrEVEWwFritNU/mPKqUUO7Re+ZDZkjKW68p
	rgTIZvayEUpB9Wq/hHw//d1a418/EuaoKujnKZs9dmST3HG1yCE+TXwep7/iQfU0JMQjQSQMu6z
	hkwRQ07n8SBPWs/dWq7JJeITiOWFpjJ+GNX+HzvAka/vBXvOn8tgs719MSYPG49F2eZYyj1NsYK
	Y0Q+1SUUT98Ft0fXH74/qeAS8bFUglEhwdulaikmMXnxYWysrRxt5RxeJq1cEo7UcByMK2yJXoc
	=
X-Received: by 2002:ae9:e40f:0:b0:7ce:e8d6:37d7 with SMTP id af79cd13be357-7cee8d63898mr242633685a.4.1748020942714;
        Fri, 23 May 2025 10:22:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb4AgEZ5EQJODwKjLBL6jIuNnzrRc6oSdGR9gV5lYbBxOO+Jvrxvhp+BmkpjZgFdzm38wzOw==
X-Received: by 2002:ae9:e40f:0:b0:7ce:e8d6:37d7 with SMTP id af79cd13be357-7cee8d63898mr242630985a.4.1748020942377;
        Fri, 23 May 2025 10:22:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dc632sm36587211fa.54.2025.05.23.10.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:22:21 -0700 (PDT)
Date: Fri, 23 May 2025 20:22:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 remove camcc status property
Message-ID: <ls5rfmlqbu4n7tkbw2onpmd57t6yfxjmocccaqhpf65j3xowis@ryec2y2afbkx>
References: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
 <20250523092313.2625421-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523092313.2625421-2-vladimir.zapolskiy@linaro.org>
X-Proofpoint-GUID: 4GysE-2bnQLnGdKi1qtAkCk1xKiBEQH0
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830aecf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PyysaQbSp7gYuLE0O40A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4GysE-2bnQLnGdKi1qtAkCk1xKiBEQH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OCBTYWx0ZWRfX4+Wnh8hpRZzz
 AZpyLa1q+kQYYhTibrIdyhW6XqBIsBOImsHorIVJa9YoH6wTDoe2Th+NY9ZCS3IEwjrPttDBvfP
 kChL1ABoquQYmhBv+2HVIQz70YhTtJkw3vZv3mjfVkXs/9dhYICNJcwvqODKG0NPqyiUdR4fBQQ
 j7aIWN1RSehZ9XHQNZE5NfzOZLUpU/nNumovL4QFL0c3P1OEBAj2zF0U40pQnXQ6r4hlJp1ZCcA
 bTzzAsmhyIT3JTIdRhI6EItEKQEdaF/cCfTGtW0gsHoHxihzyJwTnUZgo9UFcb7eIrKzniEppmQ
 rm5bjRwADndDJnuAEeEb9FAXI2Ku9VX1xL1SfdjIKUsthN7EtB+SLF7qz8MN//kroiQhE0a5jls
 Dq8oK68PHCF4u0EN5Y0tAMMBcfFL2HxoornfLHE4khFZ7YFSmHyd2cmgcAvo1czmHVl6Dud2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=747 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230158

On Fri, May 23, 2025 at 12:23:13PM +0300, Vladimir Zapolskiy wrote:
> After a change enabling camera clock controller for all Qualcomm SM8250
> boards the explicit control of the clock controller status can be removed
> from the RB5 vision mezzanine dts overlay file.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

