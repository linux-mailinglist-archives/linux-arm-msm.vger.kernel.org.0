Return-Path: <linux-arm-msm+bounces-89168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8EAD235EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADE7C302C9C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5B730BBBF;
	Thu, 15 Jan 2026 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSD0p/DI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7fptL8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED634676D
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468372; cv=none; b=C1SuC0pnRWPhmOxB+sAjolgV72ZhTWYZPwKeDZj6GltQ5KaVw8EwzTFkKGHeNNNNwbfO+0T7yYHJUW9GBTh9EbnspN7Nn84ZudRBQvz+VWJbdTZbCs8AzmvHtLWDZlmrH6qfyDFmsDXRf23Sem3MKAdr2O9GHJHvx+VzwgAvTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468372; c=relaxed/simple;
	bh=N4zuCdQxZ9NpBT1FpGBxAuNxlnNvrM/DDQdAtzr/A94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t51d9G2XvD+LbeWZxHAv5cd/9ISSo347vO6b/6xRubs8Nq/+LKMd4Pd/FthMY9ECsO+rLhhM5NDV4PSAOC4yquxgHiIqXWvm2O6oqunX85o1V21ii8PDmOJG2ePwjOpxOpBaththpP3su44sjq+zjBmMg9Nswp7QGOe9FEqZiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSD0p/DI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7fptL8/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6foXq1170731
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=; b=hSD0p/DIxfwxKHqq
	bX+EkklFL2pfEuZy5Yt7CIJLgqLv1+36Pmrau/LDtFSHDY5bil6swOF3rg4BAsK/
	IU6sAIaoHILDTZUaVFagwNxyPTZR1CJxn2kMAbIFRmhz/zC3Zol+MjXs4BukZI9q
	yV1vzrcxvH1FjKutF8wXYD3iCL2fDogyLwLJz4fWeQpPCLOqGgN35K6TCyNUbp5R
	eZJswStvVcMewZfgoSAxjzajqolT+R4PpyLgMo45W9HZaxPQF6bgdaJW4HbfGXw2
	xYOQu8dUcQBsXxqvQIBsy62Gigvyk+uUXv22Bwiy/8cKeM9B1eVJWM90Li01Q1KE
	tmOZqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84aabp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:12:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a182d4e1so8463285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768468369; x=1769073169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=;
        b=E7fptL8/gytIekSwbn0QdRyx67Efft/rc884yVHxSskG2RKdOumXKl5sGjTK4W2pFW
         uFInxmEmGw3KZ+FtGc/GzaPvIbyMZFskMCG1feQrbgkRrB1sheFoxoTr0QN5WbsV2ZR+
         JIx7+sh9KaGbXVGh5er6FDajdwdJo5dHBGZVTieyViAvFoymIsBcLf7srgi7Uxu71oRL
         CIL0U4fZY0VkaRzoPKllVC0iOsBAVlY1KmPoLytc7kBmTTqZ+4rX1ISlFmVUirFsCctx
         kII6A5HxS+xY6Bctvs+p2gxz+iHyLBZT4Lteu2VnJ3dL/xt/KJO+A/HAKlb0Jg2CW13e
         9ETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768468369; x=1769073169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTN6sCWzZcqzyKT6xfnM3ywcxTjqTMX0dXCRizp4xxQ=;
        b=UOOTcbX4/H3k5Gdc4LM5zPRHrZofTkyEcIOV/LpWtFNLchZU7v4B+p5BhEfmSReDHH
         ApoO55NS+c3cHbniVh1aNhAseI0ApE6meRqvpIVADuquGDcjJ3Db3QSoIVQveS2sii7U
         9+B6H9XTFGYglIZlq/4ZUzWs8gmMWzOlomMN49ofOs2HJKPFOk7Gyu0a1GKE58m2yoGd
         zc+M7khZsUENEqtVGIJ2zBAVlPzG95dZh+5zVhwe6/EkZH7YElBkL/iUobAMQDp9yYUw
         QqvlvXfhxbV1KDcgRa7UtXPWqZVNw7vD/jr4RWA17NIJzUxa+7fXWbGWbilHFwHPZ0zx
         C+iw==
X-Gm-Message-State: AOJu0Yygx06d8rZSU0objSPzRdtTITHZ43brUri2ELGzJtdQQt89eyz4
	jOUdASiBaMWUzuHWdBVaiR13zOcvl+LKXw1Id1y5lID5JnaEyyK4dWzquljC4fVPotiJPYJnMLM
	27MVUNx2RI4YseEio8fglsy45FEhzoD5gKioXXWAeIPz+1vHRp3nomCf5ZE2cpYxvxiHM
X-Gm-Gg: AY/fxX7gIts9TZSAIKLQLjrd2Fg+FN25W7h/lSRV9Jpvd9HPGSyrIfWEAiRI7e/mEvo
	Ec9X4g7H8/g+1rlOHM1Zp59EF18ZBShkCVAUr3bktllolu+IPc07ZOfM2VnW1t5eMm6AWn/Ybye
	NfR2RJh0fq2uO+FJBpwf3T9TTEDwuoGrIb49z6x4k8szCrNkJD3G/X+i5uAkPLwo+o8IcLleTYw
	O2zYUOenXa/+tmehtp3j0m16L3/TWf4pwUa2pqUB67kORAx9vIROjHzoVMw8sKbWVZ8oCFtAoG6
	dC49COD36gsh2vLaGwXZAnQHXUXZh1YvAanG16nBd5BR7TA6xgIbHxNrDhG8njpG+bWomyzLdZ6
	c+sZ5MOHgEmd3gDnwHkFcjfw1/Q2zuvsA0bH8sqzbGaf8X9WeI7bhzvTiOeRcCc5sIZY=
X-Received: by 2002:a05:620a:4411:b0:8b9:e0ea:af3b with SMTP id af79cd13be357-8c52fb74bd4mr593195585a.5.1768468369409;
        Thu, 15 Jan 2026 01:12:49 -0800 (PST)
X-Received: by 2002:a05:620a:4411:b0:8b9:e0ea:af3b with SMTP id af79cd13be357-8c52fb74bd4mr593190885a.5.1768468368433;
        Thu, 15 Jan 2026 01:12:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411877707sm1893534a12.1.2026.01.15.01.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:12:47 -0800 (PST)
Message-ID: <c2d8ef54-069b-48cc-b6d2-642b357eaf5c@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:12:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] drm/msm/dp: Fix the ISR_* enum values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-2-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-2-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NCBTYWx0ZWRfX5+HF+HCMZx0W
 rOPLCuJzgG6CJipVjCx4w1s3QfijlNLqF2+ci4ujxLZ2oqLFzab26w25t0SzcvEnlUo3DgDuW9q
 7g/qJ3pmEdPORl6m4n3bsMpolhbDmQXOZ/soCQzPAMs1uufxLUguLnHeM4RkoNdAnr4u6CUxUdi
 Sr2m2bPBFvQWgYPTRyG5ocPMUqIMCugIaNua3KioD/lG41TzsB5YPH8bwFEPSilKnQ9beDIFJxO
 87++lx/P3TMxYTj8Sn0YHVF71Ngm++QJa+Sczii2BMQ3/ViOdKTEEyHaSdtMdab5QqqZyXo9ik/
 FTIH7uIW5FQHfl2hpT2pX8pgxUeiCckfqywPOPvBQNurYTIvyQ0Dik2dHEeTXlGyiJxKr/nAlkc
 8DBfTr5UnaNJmYtHvn/X7040IgIOBInyS4MLhu4iqFtN9qubasY7vNjXXtLUmgHxDGDwKsWsqZG
 S+sZxJScQaZOMxw4iWw==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968af92 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hxhQaWjiUK3sto3hAJ4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: awylIJyyCxv03jFbUxXfGA1GzBVq90Nm
X-Proofpoint-ORIG-GUID: awylIJyyCxv03jFbUxXfGA1GzBVq90Nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150064

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The ISR_HPD_* enum should represent values that can be read from the
> REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
> ISR_HPD_REPLUG_COUNT to map them correctly to register values.
> 
> While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


