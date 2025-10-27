Return-Path: <linux-arm-msm+bounces-78924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE3C0E221
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D552419C56DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8532F6171;
	Mon, 27 Oct 2025 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMgqTSsl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585EB2D8DD4
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572306; cv=none; b=BXNaZ6dz/xuMCYmxcaHDKxLJ8P5AMR6PFsqAmAYCRFctB+puLoxFehcCfErvLzPRkJkb+5WgIyiLQbV5jY6Ys5p5Kx6CEdviJ3KgW3F2H0Ql8glbFMG4uSR562MMBdGIyPxr7pOK3IrvRABzB/YLNYJkMfmBgNcI5G1gU9URop0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572306; c=relaxed/simple;
	bh=ShR3jkOuRDmD9phsKSqBsiHpNnX7kwC2gnSKmhZFvVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDa4JJhqE8LCP3grBX91N6K+qN/yHu7pa5M33sWBfUz/ZW58tnYsZaSKWy7hNFp62DW29drICFtE3OKx3wFuAh0qK/uRXKlIyBKdhnrBvw/dsUgZMG1YKZkGM7KjBLcRAOH//x0bb9Z5K6iqhhtw5+rlqikBUxou/sCnVAeCD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMgqTSsl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8e1Aq1007544
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlqNAIoTMPpjwqW+Bc96s3wX/9oSlIUuj/zs6ZRUaZI=; b=AMgqTSslhd3ndFOt
	dqaVTSoL9I0Zfjiaw8wgPnHdQHVb0/F5h87o/XiWWAoBiDz+LQfBn4koPhk41kVg
	nmXaJIjUB9k1d+TxZn4KW5VaLDHR1BAWdz6AmQbj6O33EFRrOjHwePLeznR/va0Q
	iVL063UKzUq1hnh86qwdKmwsbe33i7CqOp3la95J3+H57hCZkeAUQGINL7l8A9uH
	Sa2/U9m96B0ooVBVl0sbMowjZBT3TD+kJkuqtjWgiKjUv6ZVmHHaT53aeWKo2EZ7
	PJP1OSpcP9nalsnDkDpaTZtIqC1wnaBeheHY/UAWuy7gIBG/Rf0DkVu3yvGm6SAV
	tyP1yg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g4q8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:38:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-89ea549dca5so112134785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572300; x=1762177100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlqNAIoTMPpjwqW+Bc96s3wX/9oSlIUuj/zs6ZRUaZI=;
        b=ZZjbTSCAjqRbRz67qToG+bJXiFB0KQ/6ZcGZHMmm5SsgBiVG3LyTk1Ps3MyxGP1eHx
         YbokZh0fGpvo37FVNQLiSl0ULS+I/neAMe3VQ0/T7C0c8/ctRVQWZySLzotUNRteQHB2
         4kNVsuSLH3AVqy1SjtMh+nK/257pIPqQ8v+4GEtU+izVv2+dtwUyRCYkQuBJyPD7YfCT
         jPoF169MrttLdAkTtquf8fN3aymU6/T+uWxumV/GgQ2VxZPMpTxugt6RCagmXh0fU7J9
         FnfGLqJeoqMd954LdxLLGsltoqd6SeCzOUGaeFmQnJtUNiRYH0SxxMfW+EUCL2Xq0k7J
         Wlbg==
X-Gm-Message-State: AOJu0YxJi50hJwyB7QUpejFLGn6TQ9WuiA+fzd3RIClHlcq+SdgzaV1+
	/AJI+6MsyqPxbWsN0iNMX1ko7jX+ozJCxxrQ+muqs69nnGie5xU0BgsfRn9FDAqkXsb53XN39Yx
	buHDucPk9bdmzrVsWD1QFHk6FatK8FBdEB4ovI7VClvQGolqntlyaFVqDaUtrhpYrLG7y
X-Gm-Gg: ASbGncvQiMuD0V+zXmFQt4eNZUsTaQhEMSkbsHfe1PTspXeaFKofHW1cV9IE7BbqK2u
	NaejvSdGzy5e5J/CszoN2NnjkRHEmoQOhFogsDjKfF8eCvNRjukKntUmtJi2YN1HTLFrBWpTwk8
	4/ERk8y9p2xxYx7/lhG392JnKn2oFaaC6uy6w8/b3mAmXhVd4r8HCcEr3sxcK0HPfrO+yu430jK
	IsrM8nVIxOf/sgHN07QS5ECktpc61CLJwvf3IAQX+s5zrdPVP/jK+lH3Xi5p7OAcDNwr4Vb+r6v
	48qJyT3IZFGjqEtkwfzPpV6+5clEjFK2E3BbBm9hYQ5Wzdjp8bttS9ewPs08f7qNsUbqKKNJ+XO
	xFhjVOO1IXdNFu4C/d3bRvi8fZqjnQvF/ayCU/NuhjJh3vZ2XlrMD6rm/
X-Received: by 2002:ac8:5e10:0:b0:4ec:fc4d:372f with SMTP id d75a77b69052e-4ecfc4d794amr21511091cf.10.1761572299583;
        Mon, 27 Oct 2025 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM17AQ/vx93xjYF+FCEIiTUB1Xqjgbo4dv3HEB6b+9AnxRB7kb74w76dLXL0z+Y2f1ynGSYw==
X-Received: by 2002:ac8:5e10:0:b0:4ec:fc4d:372f with SMTP id d75a77b69052e-4ecfc4d794amr21510891cf.10.1761572299193;
        Mon, 27 Oct 2025 06:38:19 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85398463sm747816466b.34.2025.10.27.06.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:38:18 -0700 (PDT)
Message-ID: <490a7cd8-b093-4f25-9c9b-85a3c2d86a6c@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:38:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _WgljIUcofJHvWoIwliJXTnh07r_TI2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNyBTYWx0ZWRfX/MibJZOo9CUl
 SrPJ0qfrG17fMCte+i2vTdqDWT0dacjAl7FHKc+oxOxyjmn9QXUUebWLH5w7vHRVIc5NaZ/3roM
 DLehLa6wxcJMXCBP8Qo8GXPpDrX8mTlqFb5e53N+xtR686qY+9d36PyUK6KSi7unk+ksY2ft4Pa
 E9y1BKNw3uPRr1nLC1ZNoTbgJEHCUC/BL3o0M3y1afKvZCoZMgURaF15avw0vikVUmrs8/52twk
 4myRDb54Kk9CiIfZ2rAQu9VIXuUnwsBeUMAEn4dpK5O5qHviOypCSlni7pULvZuDQMoCLGmZqV4
 /XJA1fQn/+MRpauRXorj7u/Qy7t20U97iMYZGrucldKMcq8mw6qDZLr8w0mCMYJ/X9BfulhSapd
 52MwUPwo8WUau0EKukFRRxMtfPIx1w==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff75cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=S0UzETgM28_sssm6r9IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _WgljIUcofJHvWoIwliJXTnh07r_TI2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270127

On 10/27/25 2:35 PM, Dmitry Baryshkov wrote:
> The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
> HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
> prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
> the header.
> 
> Fixes: a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for HW blocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

