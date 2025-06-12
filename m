Return-Path: <linux-arm-msm+bounces-61146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47228AD7D50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 23:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D60B1898695
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 21:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEE3188907;
	Thu, 12 Jun 2025 21:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaxjjFpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DF223327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 21:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763202; cv=none; b=gageQiLApDnhsbYHqYdfvczazitz8et8XCKuUy2jTw4MDxVU9syLSbtEtfWjGuRouOw4mNSKouhNqE7QfX4OohGaNzKfvXHAr+/uqomcQ3Z3laQADdr8bJzp5+BPQB/g84ESFSBuhoYV/kQOC9f+5Y7+hwyyRwn3EAK23PTiVgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763202; c=relaxed/simple;
	bh=H3ogvr7A5eaCLCoobtUF9Y+ndFSfv9DKlh2LHMiNqnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BT6bDZbD3k84awMCd31k7d+CfkrHOiNoDxYtS5e5bQyrqYmY+jLqLNNtE6sS4WpFOs/Bgchtx23V8UR9xJRIqmREdfLWG/9v+EKiFbkkEwh4vLKgi+CIILJ1P+HMJ78r9TGTaRmJs+kcw2riUj8PndL88kXfAGY54596Z/aFXzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaxjjFpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGUBVR002408
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 21:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=; b=EaxjjFpJ7wS6WdqT
	Al1W1Dj40l1WVibjXSMhFBkQf7/kUWFEy7BYQ5Xh1aoIZxivt/1erMUK4pXf9IzK
	D6GvU6tPk97CzCjDbyjp4RBj9ZR2Q1Hvg6pEjCSoSHTOS3GpK1i0MNQqh6ss9Eg2
	SsavzA5JlzCtAdLE/i56RtkKXQdF9mkMe7qiHQCpIWSERGU97gZWoXfBPDeAs+Jw
	GtAZTZSGbvNuZJ46oglDZhV60SoySDp0yIswVG/qv1FuDvK6FXSbAiIjtNYMBxKL
	RYCYlTJN6LekxjS9R3Ha9R4GwWOjrVcR9JwvsLgw9wJq8Ykq2S9uhRG9dXyOKWIo
	0C2X8Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgy2336-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 21:20:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30a59538b17so1432919a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 14:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763199; x=1750367999;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=;
        b=W7r0a34MBhOS4Z6W4cm4/YbEmk1K8DfbVsJ9nHJPXcXr2WD+KE5CTJ73KibE9QKHYD
         tbAQ8n1ARK48lodTs+oBLWirV2NuDKDf6mnWbAIrjeIW/q8XIy7onTI8JSbu4TMifXgB
         jykWVrPHt3DM5dEZcLVsv8Yfp54sjDXL2j3vNE6mgMUNinKPZMsUNCvZOguN9Y42gIYk
         v4ihD00D66OCzyENYWXXTI7/HHevHVHLKzxZQz3nPH1Gf/rmxhoS5XUGW7nA2vQ66306
         xtIf/+ijWhE3mwkDVi3zdVB8aq0fAYMrQ5ZW+Lb00k3rzJ4nVV44MMv1hum6lq/oaUK4
         TY0w==
X-Forwarded-Encrypted: i=1; AJvYcCWybBhJ8LqA7yJ56/FHYzYJq3WRb2w2feE0gFkVIN2U2yrM6t/DF70IKoZHsIz6H8VhvsBBsr3NwkqrlhKb@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhJjkn/om3/aaSFpFo6PSknVgQobgcNjnxxEMPHHnozip4sHG
	UCe47p+ACYvE7rff10wJgiJFDbchyKbAusLabylJJAaBt41UW80o/0MDadSKOSwBZxFQ0O52jk0
	HOD7FmMdC5zIYWEzkOMZPswiFgr7r/Ma+oyVGqOE/BNE/FjqT9fT8aV6qxjjlchCugMT6
X-Gm-Gg: ASbGncuTilofMfR68YmyBjb/RZVuNGixlI5nnTc13y4D6vG1zZTkhXxR45u7KkJy0Bs
	f4iO7p8XjtsqTIcG+lYoNd8HOyQyXqb3eULhsFKxL2ujFgVb72IxvKti2WzBiq1CLq9kgM/YdIi
	iAigZev9OSdetS5ibUX8mrLwFYl9jFZ+cG16MPfRQKdza/Dz2qWaigH5fWUkKOEP4e3dCUYijot
	ZMKGAqdOuGRscXJszahd7WXcogd6E9uZ8HHHR0XKz46XlMeviIEP171Y2HCcsAG70lWzLeUalNz
	XO3dYW19AsK1ADCaRWqlarTE01UhvhnvFS0P/xZF6Q==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-313d9d71383mr1065550a91.14.1749763198854;
        Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcEB2oQFFgVMym1bB2VUhhziP7lQFCJfNjFpbKCnIdWSG44vwJc/VtPEHqnpJDg2SoasT6AQ==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-313d9d71383mr1065512a91.14.1749763198422;
        Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5a882sm1990932a91.40.2025.06.12.14.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:19:57 -0700 (PDT)
Message-ID: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 02:49:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RK-eD7MzrtJAhMg-Wp9gC2_kBavf1wYd
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684b4480 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=8TKXt+tWyFtBY9WE4KDEmA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=uKUkM4gl_lyc4tR08vMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: RK-eD7MzrtJAhMg-Wp9gC2_kBavf1wYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE2NCBTYWx0ZWRfX2g3kkbCv7Uz7
 Z45aHidAhOpkljjWrFwM4kkMoCeRLnooxjDapFrhx+LFzBMmZblemoxf2t7GrX3Dyp3iOk7WXqK
 /IOVxdkyy06SfbieG3XWTDI4jAVPzTv/rUKKNDoj6rvEWBhAnlf18qXo4pnufRT/IkEA7z78W0D
 nL0TJWBRFfBZJRxh2hbQQp66apQxgtmB3tc1R9njuL8RHH2H8ALMRZW1ZqatL4Z9JKtnHPVe7Qw
 hXfD5ZjtkMvYUJjp4c4aTqU+FtDsnv0njVB3DzAE8NAstTjvRuYPpJpyggOYRcZkChi5TAhCRVO
 xd+fop7ulXl5gXSoSMWIhLJfFHYYDfP+ej8bPyPI62LV8PNtNG3Uqke6g+WDVD3gq2gp00DQZYu
 lcXDyD1yIrANRbLjnPios2hzhYxk5HckUoHPd2Xf2j0m1J6S8h2XNkbBJH22QYQYm1g8kPdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120164

On 6/12/2025 5:32 PM, Jens Glathe wrote:
> On 6/11/25 13:15, Akhil P Oommen wrote:
> 
>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>> version). X1-45 is a smaller version of X1-85 with lower core count and
>> smaller memories. From UMD perspective, this is similar to "FD735"
>> present in Mesa.
>>
> Hi Akhil,
> 
> when loading the driver (still without firmware files) I'm getting a
> speedbin warning:
> 
> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
> missing support for speed-bin: 233. Some OPPs may not be supported by
> hardware
> 
> I've seen that there is a table for speed bins, this one is not there.
> Tested on a Lenovo ThinkBook 16 G7 QOY.

Hi Jens,

Could you please try the below patch?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 2db748ce7df5..7748f92919b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
                        { 0,   0 },
                        { 294, 1 },
                        { 263, 2 },
-                       { 141, 3 },
+                       { 233, 3 },
+                       { 141, 4 },
                ),
        }
 };

With this, you should see 1107Mhz as the GPU Fmax.

-Akhil.

> 
> with best regards
> 
> Jens
> 


