Return-Path: <linux-arm-msm+bounces-55299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9921A9A796
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E67F442B3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFCF21FF45;
	Thu, 24 Apr 2025 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBk/5ikW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE9020A5EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486511; cv=none; b=CrTMNGf2VlZkkSj7S34ua5+Rsd1bl3jmnf547yuzeLghuta503gbazCHM1S5/fa6GD1/QBGlEKdKkUi1fzCr5ON70es3v4dMY3TjK1lnmMYxUap8AiRyyqUAH4VbGwE6cDDltnuXotAb512M1HMLcrczIRJyIDQo1GMUWzLyG2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486511; c=relaxed/simple;
	bh=cJTS4h8qLRojZ8VoSi+xz4ukVm/2Bvkl9jt6qESf3Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj9/TY0X8tGGeIUDW3qS6tZ02fTVXWWN+a5vrFVPg4u+iqVkF7Os6XjJi1/pDlhmRSkskEzyv59iAqc84zGDUIoZaJGCcih7sEHaSepGi41xzXIQ7Z1zemJggrxXcIdGxnNet8WV6BAZNkiF5MK4vnoqIWWtB0TPbEmljkcNBbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBk/5ikW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FHXe000855
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xzXZ2sQZ0fuZC4M7pch+4US5
	mpXlHFEAEEK/BeG4woY=; b=NBk/5ikWsUbRruaW8hiPfj4m+a9fZ6SzN/fElfwe
	Ec8BluSgDCCkI1QL+6AfmIAqNtwQPKyhSCW8invga/jUYvcUn9730UD0jZg/3lyD
	Gp7OizFulM8Uy1RRQ/jPHyof8Hs9oUSZb1gVVA51uLFOW4nKzlnmbL1IUbaM2taw
	HqGqnh1N+4QUh2Olp84IgcbG+4pev/stgW0lp0cJFerVPcoBXxduxxgPWrQM8okJ
	/kV+UyMaPUYKeycLls/bxvnD90DM8xrVCbHplyO7cHyT487Da1KvqTtfbu6If5rw
	Dh8ZTswTSxNWPj7nX41In/vXiE8Ag3Vr4wYmUVfezTV5Dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3cx73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:21:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c791987cf6so167895485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486506; x=1746091306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzXZ2sQZ0fuZC4M7pch+4US5mpXlHFEAEEK/BeG4woY=;
        b=jktqBP0zGNhFjvmUR5z2/lbDLxSOggQgOn2Nk8q3ZVSq9yqhsA3FjGoNVjT4xCBtLG
         +IX8rTGcVwvMoccGbOPFi/zReuwXWpth5BXKkIis16hfZ0rk7iwpoJYDTbiXRPW+55mU
         HoOn3Sg/2NQW1wWJoFQK7AP0tU3Ibw0ifHL4GDoJgpzHUFOqbXlwkr7NfrBcugf0CEdc
         pIT9LrsM8Xe1s3/5hUKYizYgaiFqFxzZK0HSdoKcvEhPaYdeH8KzVGRlR2BXJTVDQPSH
         idemK5pe0eENAz23UgkCZXmOPSAisioyh9eYIhUMPyiOUA/lwa5LIhEBOVpJzq8iPxWA
         SyWA==
X-Forwarded-Encrypted: i=1; AJvYcCV5z5g0ApcZFQyoFnXt8d6lsGpD16W/QHtD6OP3+XLqhkGrLuh99oVaR10KJoZTkm6tEQOZ4ILZlDh2q66T@vger.kernel.org
X-Gm-Message-State: AOJu0YxTBNi8nnkq2ffYCTLPBLvxDxy386KtYk2rB0bDcsLVT5IMBtH3
	QFCouEfyJ+ZhqgGNRfAOUAUV+ySt36IKiesoHo229fkqCN9vhq2Jcu5flk3iTYbc3mhixYQs2um
	Z86IU/Z6Q7KeNSv4oprG5r7ETgk7/7VhctWSQ8QjsHN9W2UZUgJzdiiNOuVFkvMli
X-Gm-Gg: ASbGncst/Z1EyJbV9gcfOiwhwPPmr3luFdrpwsiSpJ3f7s6UQuKlxjkHW2ns8v1grzp
	M/8oh4XgZOpOiys5FSDVvxq5sPYGDfhMsDUQFtKdGrRIkG/Vte81rWbCjsus8QNW5xs4SWApHSg
	kiWR0zEzV1cjnG5kDWlUIhkyR6ZMG15SAHcDHqmuuB1kDKliKU7rUOiVQMsYIo9TTlWHB2HV+CN
	p713dAnM6E6EU1NjKVGKCIo17MQrEYdoIhYQdPzGif/IRrcyW6bfC0KhMc8Udq1FWL7vfcF0V6f
	QFnt1gE5OtNrwRKwkWMPjEIMn6Uxgr7jnlHcPeWd/KQBi3P5jcLXsWAVzr+EHXb0v7xVombBP0s
	=
X-Received: by 2002:a05:620a:1929:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7c956ea73aamr256992185a.14.1745486506355;
        Thu, 24 Apr 2025 02:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7mFBXzRRSv9QJD9iHy+ibiIGa9pagdqpuIXwRTp5W2woKy22E/vHZGvaQczZ+I70l+2H9+Q==
X-Received: by 2002:a05:620a:1929:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7c956ea73aamr256988685a.14.1745486506008;
        Thu, 24 Apr 2025 02:21:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb262e1sm163072e87.34.2025.04.24.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:21:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:21:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
Message-ID: <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MSBTYWx0ZWRfXy5lhNVb7k+oE jEpqxdvxt1oZzHRCdaapR2kVj9Z7V5vNxOsp3pBwHWmyQbF23QoUNKgpYkhOYj7dstdtSbwIsOC V3QdBlJHY2gaJ0ecx/CA74Z8p7u6TEJQ971t1yH65bz1wY6MqbIToIVpkRcqcoTR1Mclk23JHJA
 EBJJXRM8NPtepo3XsyrFcChdN3C94PfJ704l5k/b447ua7tfzXV5p5Nis2zspfb2V2PiUGHJqjI mC8cyBcnbKhBoKqaYDuVl7FWyFj14WWMp4uZu8B2m7WrDuGX1vgOOKZi5G2iqh6aHUkDQ+1aH7/ iTK4eOJT1OzJ7ajHBmmetWeXcQfoaAWCz9VNnEiyLlUssRwTx5yCfIj2nUjSAJtfrRk/Rn5FScN
 mDzW/E9ZpdDZTVJikA84t7SARvYM6Lmnk+q+gBqJ9SxXE9evq3u1lhFpIdASBkAc6nNTmYFy
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680a02ab cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=7jjsK61l1hG7xBlPe1EA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WwBnh9o8hHPiHJfPiRjSLik1cZj5cM1L
X-Proofpoint-GUID: WwBnh9o8hHPiHJfPiRjSLik1cZj5cM1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=839 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240061

On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
> Add the IRIS video-codec node on QCS8300.

Nit: you can not "add support for the video node". You can either add
video node or add support for video en/decoding.

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

-- 
With best wishes
Dmitry

