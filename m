Return-Path: <linux-arm-msm+bounces-83995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28760C980F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 16:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E5A234165F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 15:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBB13321BC;
	Mon,  1 Dec 2025 15:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpdUu/BT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWx2shnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4402F3321AB
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603107; cv=none; b=gRPqAWqeL4Z3vXozLQwtbSh5QNhaDZaD+w6myqiMJ632+oMa+HVLOSNy9UWYKuwaubjZ+DVeGAGcP4HSXMIIx3SkGl3xOWD9pLhxW8wInA+fO+myT9BoC2nWPBWmdgRV44YTiVfWzwIZ3RW04oID49SC931PdMShHuyBqYGonUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603107; c=relaxed/simple;
	bh=D1Lx3fbbK1SoVaIywDLaBXCbCV2o7HPOnKOHfU+MHvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8RG5YntlNmpnDyDqiZLkL4HcXPpj7LN5gxXMn4uB5AkPe0Elmrkj/1RJJ9URwm8J7tLPplxdw2uu/MsM1cAiNrTTSX1ne219k2RjCRDjB2RglrV2JUpyckzgZk6frITM5DD2PFIwcZ0TpSJ8FY908ABhricQJIZ91N3HtK5cLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpdUu/BT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWx2shnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19rGDR211933
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 15:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SrKsj7iG18zhdD3P9g1JYxVp2l2sXHZ6AmdLmJdITDQ=; b=kpdUu/BTL5rHMC6X
	VCKSgR0lMs2D5H2UfXfIoUMy4nJj5SXdnKlc6kzbJAH4FI6/GuHXIDbH5i1GYrdW
	EOFtUFeoDc3HxYbg19ee9kBTfTYH+1rWtS+qE53SJDlB/weHTewwX+X0GjUvAnBD
	MpgnH6hYE130lPPRZ9yZwpNWRc/re1J7OLbIH0SGlCMpJqIxqCXO60x7888lWQCj
	C2nD3fsI1a1ftWXPGIfy0FdryUgsC10MZt8UkZ6jHD+agVbo1j7zzaTbl0mz+xQR
	/pWVYc/xEvBailrdBptdqDdnFNLkq4Rs4lRhgkg52TKKD20Z8aE/4NTnnYaSb12L
	StwtFg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8sj0wqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 15:31:45 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4514cb26767so887124b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 07:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764603104; x=1765207904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrKsj7iG18zhdD3P9g1JYxVp2l2sXHZ6AmdLmJdITDQ=;
        b=QWx2shnDbMr8vNxMODJvUDdLX2FkSYFnQEh0x8OMSwWF/MPfxISCI1095Pod7jYBxv
         FVJ8YVbdmKjqIDSLRx2/r0HW+omQtpGYtm2n8SGfbxzr76fkVYyIk7XexUssGnGmiK7M
         JFQ/mYVaPHz3grNvkI9kfRVMIs92hfqLkr23sriNMARU3GfyNDNNDkACFIndKxJvrqRd
         OUa6RvKy86wMs6C3j5U1ys9eQravKXVNo+rze6TPWKyjRKjnH3xZXGfc2SNj8ZTp01ru
         z5tP11kmtg3m5m4RJCvArgNfBlrLzMRHOZx4h8K62TbLXO74IY2l5+7REhxBLiwt/Oo4
         Pjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764603104; x=1765207904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrKsj7iG18zhdD3P9g1JYxVp2l2sXHZ6AmdLmJdITDQ=;
        b=InqY6K2QGJkJnZtBanDr+5ljXs4TxjfDeJmFLYVQLDW7vrgwG1fRzWnGl447Knukxb
         /HWbS81ghnXrMlGYuUIofszHYSl50l5TKPtVx1bSCP7DpxX5RW11qVppsN7vXa0z6iCA
         q7C2UdXmcCc5CGeDlz1UDy+Sb13AyiBYiFjtCvCrVGNzCDSMcDaklClvB5XedhXfMTbs
         IcGKBvCevcO54Rb6dK64qENNk3Lgf1LBOoxpe6Knfu+Q1tr5h1tESGlwQgX1euIl9uq+
         NwTa5+EPMJ4WSDdUW0LTiBwHY4lhxsG00PzdaaKhat7kV6mWmLl3FsWxKs5eHVkG8kq4
         besA==
X-Gm-Message-State: AOJu0YzN3Wima7HBmRJBSuHuU+WRuBCmr9q52GPfWqpghjCEVh6DuBJp
	pwey2kag2IxsrwzlKijWAttYPlxB2wc10sJdYvAf+ImK1O+PlHcqlRTxVnHul/trcCPOcrpuhar
	/Av/kT6gChTBc6J47js8h22YkL49xI7GUnrzmpxnySdca6ZywE1U1ZGaqjx3lwE2PAzCv
X-Gm-Gg: ASbGncs6anaZm59QkuNm9byQNvV89IrlcZMv/Okq7ewuY+nFwYQhlpBIs3dBMR/diAd
	S3+nMgttbIyo17n19luQ6UrpdKpSV+lkJXPsmmE5Sim9y9wcZTk0s0591ky/G9rewKA/yyHBwQd
	dukWF14Cjj/Waot7ezvMCrnZPRtDgTL/U1jDQrPjgixf5zIcYqbd31z8nN1vSE4OcjwObsofT/M
	k8v3UsjsUmzBwmn1SZNVCdiRPvLUpCgPhDMb7sikfzpC40srWFIY1+2eOCcgAcOEAaH8SnG1d2m
	snL/m20zqFL4Lyl4IgjhXaCcC8CAZ3Sn9NstTSynrCQTvqacpZ6iDMt7TDuLeOdoC2UT0JDZz+l
	nJaV34RXBkJgSc+a0IwSYzPGPW15kR4kuPtAQ
X-Received: by 2002:a05:6808:4f67:b0:450:c58d:8c3a with SMTP id 5614622812f47-45112d13fd4mr11912232b6e.46.1764603104219;
        Mon, 01 Dec 2025 07:31:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOVPe5/1O1JUcc9/LS3JmdUtFUyaDMruxTbp2fk0PfKd9Zq+QvfJm7nfIbFIqYhCD55rsbcw==
X-Received: by 2002:a05:6808:4f67:b0:450:c58d:8c3a with SMTP id 5614622812f47-45112d13fd4mr11912194b6e.46.1764603103661;
        Mon, 01 Dec 2025 07:31:43 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm252764485e9.13.2025.12.01.07.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:31:42 -0800 (PST)
Message-ID: <f599936c-4a37-4564-ab1f-c329ccda0f14@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:31:41 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC / soc/qcom: Constify APR/GPR callback response
 data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a1WRb2WaMgLOxfftJVKlEP6X7FQPqPcR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyNiBTYWx0ZWRfX2JllyydC5ljz
 1E8YRGEC9Sa5jZfredR4Wc7RCeeTr1BAoBOYvdR+QCahka9RAfuBQ1gQMPKDa1m0rpf9wWId+Oo
 xuX9HKHl3vF0byPSUAgzFSNkkdlpCwYImYWa80Smp6BYveLABQswlUedIBRg76SGENv6G4PxI0J
 +wwABmQ+aZl/QK4FoQZ6cL0ivJNkYqurWNylU9CdA7OawGWnQSOohFjIH55F2GYxbO3Goc6kfQh
 3Eti9hrf02dQEYjIwtuOON4xrUF2P+sFuktcYF31yBmittzoW5prm4+HMTbcsFaDlmPacWYny2t
 hqavcZVz1Y+jbrBmJp1UtLpedj0IJX7DuGbXr/eDejEcOmz82E6gPj9xqp+4fBHSLaoxvjz7yrK
 y4IIjbLUGMkbVYuH5mcPwnWpJcSpSQ==
X-Authority-Analysis: v=2.4 cv=Lr+fC3dc c=1 sm=1 tr=0 ts=692db4e1 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wcac9RVaDo837PQIeaoA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: a1WRb2WaMgLOxfftJVKlEP6X7FQPqPcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010126



On 11/30/25 9:40 AM, Krzysztof Kozlowski wrote:
> Patch #1 and #3 touches also Qualcomm SoC file, so this could go either
> via Qualcomm SoC tree (with Mark's Ack) or via ASoC tree (with Bjorn's
> Ack).
> 
> I propose to take it via ASoC tree (Bjorn's Ack), because I am
> constifying things there already, so less possible conflicts.
> 
> Best regards,
> Krzysztof
> 
> ---

LGTM.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

> Krzysztof Kozlowski (4):
>       ASoC: qcom: Constify APR callback response data
>       soc: qcom: apr: Use typedef for GPR callback member
>       ASoC: qcom: Constify GPR callback response data
>       ASoC: qcom: Constify APR/GPR result structs
> 
>  include/linux/soc/qcom/apr.h  |  6 +++---
>  sound/soc/qcom/qdsp6/q6adm.c  |  6 +++---
>  sound/soc/qcom/qdsp6/q6afe.c  |  6 +++---
>  sound/soc/qcom/qdsp6/q6apm.c  | 10 +++++-----
>  sound/soc/qcom/qdsp6/q6asm.c  | 10 +++++-----
>  sound/soc/qcom/qdsp6/q6core.c |  6 +++---
>  sound/soc/qcom/qdsp6/q6prm.c  |  6 +++---
>  7 files changed, 25 insertions(+), 25 deletions(-)
> ---
> base-commit: 8db0437c888596202bf1b996d6a152de3f83c4e5
> change-id: 20251129-asoc-apr-const-f9c768f0cda2
> 
> Best regards,


