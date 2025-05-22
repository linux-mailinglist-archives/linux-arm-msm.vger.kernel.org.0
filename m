Return-Path: <linux-arm-msm+bounces-59048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495BAC0BD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD1674A7CE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405D528A405;
	Thu, 22 May 2025 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCpmfFnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D623507B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917966; cv=none; b=YjLE6ZH3fxbHyo1s58WZrgsLx+8VNPQsqk4pSIuv97HUJvXtXmVuyZch46f9EyCj3S0sUFCqda6napiMLHdbdZ0eSbWOg+PH7jijm1JFsy0r8WFWuKg2jKJ51cncbXQF90C9J9ugVQFegWfFk/hAG9olsL1VD6tA3109LggXuL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917966; c=relaxed/simple;
	bh=G6qoqkoT+pTNDGZdq6ve/6OJVbQnJuz85yGz+aLGcFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8ym09KCXEH9Gn+JUMhmGc8Eu1HKpqMfRUnlOBjjaXTUpkStT2JCewYAfblm4bBxi4WDwaFV80Xtnx4gdrw4zRKH7EG54QBClUA2lWVvZ7Izc0VMpAhuNEU+WEFHkW0kX47WL0ofWFiAlJb1BEqlu4McLZVST8JMaCI7BC+KEb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCpmfFnw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8Z4hQ011354
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hxb24Tzeo0KMUYFizXcVNuIL
	xkcDwZQp4t3EVpGJMhg=; b=VCpmfFnwhjd9rUh4BnrHyCP68FqHSMZOivsYYQmv
	EYV573MRARqhTEWXxTwOJMqnU7q68nJ7twCjev7dJxAq36D7UYhzb+LUCpOWShwJ
	aM/YXM1EvY7ODlC9BjPhNChyYpKgPBT++FeenKNPBUL/nGaPlEnUfVTiYRBYtAvQ
	ri/s9BGRsSKNUdfRNPL3eKW14zuOr5Ii5IHXPjTcxtaqg0n1CvwvjkQyoAN0HZPT
	bp6TXAwPRi4gIETAZqC68i/vvJwFI2wGPkG7jtjCRYRZMAJSe96oV2qLK4lrIKCC
	sO90xx27fdv2wjB4tuB6wDZnLOUREKtW10xV5vYDRRG2rA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb682x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:46:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8d47383f3so81827186d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917962; x=1748522762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxb24Tzeo0KMUYFizXcVNuILxkcDwZQp4t3EVpGJMhg=;
        b=EC53Ipj1Yex4wN+wGdokLCnsmEnGqr2r4EZ5eoUVpmt/vahBVMWdarRBOSviECTKve
         n5JrQtCV0D8fUEKmHMDr4YF93w/yQb8vxGWEsVzdzK+xniXafDZn97UACHoDO0EdhyQk
         n9Q3EZgZd9ZbfueCqCyRyGNUBq+o6/d707oc4ZgaOeiC/TaU1gDpFbyF9ywJeECEtIil
         jAtZkp9RRtov7D5NiCrlQIsH+bIDIp/HQkJJNMhFGnUd18Clkmw8t1GDrq8LJUJwRHHh
         bwGaGwNc7GKTPa2Z9x04ej6Sg8ggfo163IqAOApDjZ6tywllredyPXMq1grHkoAv3Vb/
         YgQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN32SKpOkWUo3lh8DArY6omdypGYxrHTycX4QNPYc2unK0gbQ44ZDsISkdRsvS3lUyXU8rNMCmew2M4CP6@vger.kernel.org
X-Gm-Message-State: AOJu0YyIpJ5/tu1wh6jmqML2N1p85gYZIEnLREhFQibt6ylSEvtCbIqW
	XRhy4ElYWfgE3yJzXEvKWEfGfslLtlGYLnRtTK4Ca3dfkeDqt7VQB2lHpwvnOtwjW29XiV/CoQw
	IAKefeaSo/SDcgZc3i6fvHLGQWYNqD8q7oWPriNSY+43tcK2yDnM6zPvZQV8woeZr+Baa
X-Gm-Gg: ASbGncu0httpRKLjJ0S/+l8uBlJZX/sBwQHdV1ZtVt5Mh1sRaM12UCxxbid2RlZcdzm
	sXz4BT9B6uJXWB6tdUXO4yeXU6t74XrhmT08LgXfW2irLaprXaMwCm4craTpoH46EccE9jDCKC3
	s33oT8sdbfZBi1ZEGb1faQKjWK0GnGMkSmk9W3ddZDR/8vxJlvy/mynbK4i+/OHijJ9xtnLbfn8
	6ZCdpT7ZqV719IEKpQC+1rd9EdosXuysv5T4fZp5vUZR8AZZEMEVIL2FPslpK5IbkPiytjN8R4R
	m4Q7Zk7F7utkBFfJKypXubgg0Z+l7VvWPmziYMwrST7eLPy6giZ0iSlb+YDOodDVJ/3IiYqxZEk
	=
X-Received: by 2002:a05:6214:e85:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f8b082e9a0mr430704036d6.27.1747917962206;
        Thu, 22 May 2025 05:46:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFssdC80K92sx7xKrUev631XuatncvYaG62tDTkTyyXHOExAcKuWZ2mBRfrr9QTOcb/tyTgQ==
X-Received: by 2002:a05:6214:e85:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f8b082e9a0mr430703446d6.27.1747917961725;
        Thu, 22 May 2025 05:46:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1622asm3384812e87.25.2025.05.22.05.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:46:00 -0700 (PDT)
Date: Thu, 22 May 2025 15:45:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] thermal: qcom: ipq5018: make ops_ipq5018 struct static
Message-ID: <h7eddsjh27vvv53gbexo42pizjrma47463nhiytqhk5nyzmanh@bdnjxzc4hzro>
References: <20250522-ipq5018-tsens-sparse-v1-1-97edaaaef27c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-ipq5018-tsens-sparse-v1-1-97edaaaef27c@outlook.com>
X-Proofpoint-ORIG-GUID: SkamY1HzB_awHB_uyDIKw_u-Dxpzgk-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyOSBTYWx0ZWRfX4i6MYgPNW+r+
 JI2qQu3Ci6/MBm2IL4cbqTfboYJnkmaozymAmbdZpsoHgBUb0CZWaNW6+BNc0vSrtmHwKtkvoLT
 Ybvtu+RYGbMLdvuEvg87FJXKRYm5xodqNBmlLvpNriEVh0PvDSwIpcDlVoT1GAY/xY2zPIHrOBb
 jwQzj4ACzXDlN8O8ow1vIdkPOoTox0YluSwgcF4QixQoKhbpk2NEI7hTcbOFwje/lCPopsOb+SC
 gpr/O3sK79pWjhbnRKPzKlfR7HHSP295pQvuW/kENwWD0W9GzI3CktUs0bH1o8CPc2tuax9LjK/
 3slgLuOih5R8pziXKjziRBg/3XqTir76alOyaqRNojMwRooNA4VAW/IN+IHJ2GdPiur9n6IsWd6
 8PyxDceoxm/FkxQFsTd4IbSkqRsIzI365K8eo4s78dSRP/XIp0gebKr1WGgfDDreUTM+uKDk
X-Proofpoint-GUID: SkamY1HzB_awHB_uyDIKw_u-Dxpzgk-h
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f1c8b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=ONbtDiuOtXKcKyDzJgsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=922 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220129

On Thu, May 22, 2025 at 09:48:51AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Fix a sparse warning by making the ops_ipq5018 struct static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505202356.S21Sc7bk-lkp@intel.com/
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> Fix below sparse warning by making the ops_ipq5018 struct static.
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/thermal/qcom/tsens-v1.c:246:24: sparse: sparse: symbol 'ops_ipq5018' was not declared. Should it be static?
> 
> vim +/ops_ipq5018 +246 drivers/thermal/qcom/tsens-v1.c
> 
>    245	
>  > 246	const struct tsens_ops ops_ipq5018 = {
>    247		.init		= init_tsens_v1_no_rpm,
>    248		.calibrate	= tsens_calibrate_common,
>    249		.get_temp	= get_temp_tsens_valid,
>    250	};
>    251	
> ---
>  drivers/thermal/qcom/tsens-v1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 04b31cc53fe0 ("thermal/drivers/qcom/tsens: Add support for IPQ5018 tsens")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

