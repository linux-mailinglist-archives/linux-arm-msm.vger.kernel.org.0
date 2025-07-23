Return-Path: <linux-arm-msm+bounces-66343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA4B0FAB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DA4B7B19DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 19:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC480236A70;
	Wed, 23 Jul 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI+dBWLr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C622367D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297403; cv=none; b=NUUb0OZSprEciVdpQMQooVqiwr1arJ6CP4bIec5DxGqEhGIsQb2AYO1cUtURzBkrSFEPlI0PbxLJzEf5FcLi2C5XNTWGp06uptkd+LhmME2uKQMVbQF1rF3BvTjOQEeAbZWRRjLkc2Y9iy7VOduXJtx9957/av799cF2R5mwi/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297403; c=relaxed/simple;
	bh=5ea0Z5iW73aQbfmp3MXeFXInCTR/m6Xn6x8V3w9GG+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqrUgOXEOSgkAd6g80pO4Q/OUb3mstY3izvaQFMcy5pNXbhQ8poIziXbgVRj9kbMnPIdM/ySZJwoUQe+sJU/sTzjWzG1ZHj7qgPvQr5BBeEvHh1NcfsJyxdiY8Twb00Kx91l7T+K1X3qNHtgpfMIYUqff8b0lj+u90DBxhMRTtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI+dBWLr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNxQf019886
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3JeOLC/VutJgCxJf2dGFWjbm
	lsKNIl0elH7h0M89g/w=; b=QI+dBWLrdZXvYiJUQm8wJwIKWRPJMfS2lDB6PdgE
	vBEfa9P8C8kQ283BY4qbgd6k81mgh43p0ih6ufhVACuL+sMXXCpTBjpSG98zS/bA
	hH+o0/6XfBCUUgTCqX1pcQRTpOLn6yTdaq5oOYfsUn/HUs7puTtfW3E0omVpLwgM
	JJZnsClG6u/qGbUrkGwZwT/F8ar71EaZGnYYfn4k2cgVKWfOd00llIBqArDSg2+s
	53aERgpWRL1paTOKSzOxtAwM421zKtXEFhxRUdUp+cnGFtrdxgQ1SwqnJHapASXo
	/jNpKxVSnwGQH9H1OO6oFverNyon8UQQMd9KTdRgpxCCkA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379rdjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:03:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7070970cb2aso3125246d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297399; x=1753902199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JeOLC/VutJgCxJf2dGFWjbmlsKNIl0elH7h0M89g/w=;
        b=hodVYQNktxY/l7YWV0Gh/4tsLdeN0Qz4UEj6EpDWiOng+NOlXJKKMqWXqejZGsVnEi
         n/vCofRLuV5+0h9j826rolW44dvX1INDesNLxxYjq2CVhULlYNW3+3zaKxuJAQbgGzZz
         t8IVGyx3Vl6bg9K3TUCQ/qOPpyEVmvVhhJ9ZHBdqVstVBm6hDjTSoDzYt6bJ1oCRA5DR
         Sdgqwhj1kxboJGOunnd8JuqNKryyWuLXAY3sBexAbjqm1WaQzifSgVQYYNypvFllQqJe
         o7zrMBQnA71AlSRCi9jZqpOS3loNNEYdLFoJ2gpKcBnVyWgAYM0IEQZkVTJki4snzbA+
         DQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYwjb6sghnzQxEbmLvFHfOThMFbJGNVW3eAMebFufW3sJ93/LtcRNiOqISJtP3QjX6KE4QmH906bNcNQUO@vger.kernel.org
X-Gm-Message-State: AOJu0YzpLv9dD49eRFvAlaYu0Hb6IMC1QeTD8B/tLnqv0adSyUKRSgpw
	E86+Ce/KTRIQNV0DDh6I2U3m1Zti00OwGp76hRptTT1iRcahYHrn8Ya5tItb2JfTu8jhKkIBGcK
	FCUu+qtjFyLkqeOiM33cyzOVLPKxYR6viYXGZcb7S1/1ZC03M2x+97b0LtF3dfwCKR8EO
X-Gm-Gg: ASbGncu1f1K7E3zYjQfTQS2CKnsTPD9WZ/gEE8SH1ZtKa+09A3gBNlz1rXUUiwLJRb2
	Q6dqofFqebBC9f0+wKj6lALC5lfWyUMQX/nDpXROK8sNJTWPtyb4G7PiMqHPs8E/Pey66GGYkKr
	Lc3bRKwQscPwwWW3l/gprDDaWdHMHSn3Z4g/LWA7deF4gD8Gpfl00O7/YlQDHnLGxikOY/1uyOG
	eLFpE700dtT9NZrmIix0e4nHS2PQrICCYu+J9oVU2LqGdcOfVmCpUxCsyFLd8fMfGLvFX94/QFv
	RlWefHifjmrwLq7HcnDKyRgEtQlCvypl/+dwk3/nlfAKl0Y8fO5Ug3oEjBWfPg7ZwR3P/yxk4kv
	P5SaA1T1XF63nyDvDPIlnZhlzm3X9E+dz70Qby92Ev4pUZmpJzQDN
X-Received: by 2002:ad4:5942:0:b0:704:ae41:df2e with SMTP id 6a1803df08f44-70700789c2bmr52781666d6.43.1753297398641;
        Wed, 23 Jul 2025 12:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsaankh/5EYi7v0dpnHuuH5wHWyyjdX2jkQSgmx1+drNNrAFDbQTC/0KMBPqf+Exsye9uSCw==
X-Received: by 2002:ad4:5942:0:b0:704:ae41:df2e with SMTP id 6a1803df08f44-70700789c2bmr52781206d6.43.1753297398112;
        Wed, 23 Jul 2025 12:03:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1475sm20370161fa.53.2025.07.23.12.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:03:17 -0700 (PDT)
Date: Wed, 23 Jul 2025 22:03:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: Add missing UBWC config for SM7225
Message-ID: <blibzpqgbjbbwvnsx3cu3fzjxk776lamnmd4erokc5jx7qkubh@7da6ihmb6xxj>
References: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
X-Proofpoint-GUID: Y5tnnXFDAo8pWNjFdYRvV3PA0splXQ46
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688131f8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0w4he5-zLxu2L8T7xFsA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MSBTYWx0ZWRfX2q4CfoD0ewQc
 YZ9FqEZclqoBtKs2W8J9PwGnCzRk0cIheKuozFxpkKPqFe1vVRanEjekSte+DDJAaYGAYf49PA0
 GJNKKSVKGuP6Rs83qy/QvRE+NfVmrEQ+5oiKfs741OHlnibqK7Gdbzv4XLK/mAOm3wuP7kc1c3F
 GX5BcDkC2rHQx1Y/o7hrSpYS0PdMV+ZJucaVOTVu4yY8Mi1519fycI55hiUgSSnJfmJz8S52PaC
 i4NKDnpV+124pp6d0PbmTmKhVZdLJlv6j8UAztdpz6WBAMA1wOoJtjv2MkDOKllkn6/SjfZ2IFA
 bIVzkVxtlzZ/UeBOzlWAGjEGoKrWP6fxjscg/tQKTSJuA8VF+Y4FsnxwRNuli79iQn/snbgisd1
 ohRTwL3yNHOBycKQVCCFSr5+Ki64hDvOGExeEjGAx0PIoagN4Ejhk2Ucyx4Bn1X6YytZTZeX
X-Proofpoint-ORIG-GUID: Y5tnnXFDAo8pWNjFdYRvV3PA0splXQ46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230161

On Wed, Jul 23, 2025 at 04:19:22PM +0200, Luca Weiss wrote:
> SM7225 is a variation of SM6350, and also needs an entry in the table.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Note, due to other bugs on next-20250723 I couldn't fully test that
> DPU/GPU are working, but this seems to be required in any case...
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

