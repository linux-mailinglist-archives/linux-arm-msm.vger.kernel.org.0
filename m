Return-Path: <linux-arm-msm+bounces-75638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96ABAF967
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD7E3C6E9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D461727B4F7;
	Wed,  1 Oct 2025 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d43vyIYE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B0A19DF4F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759306994; cv=none; b=frXq5bS/fGIrTOmYJdvZ+OPisrxcbhuqjh4nifVTcwCkMUX3JvscVKiWd+2hrbiHWKBfVkj40wYcuG0f/eTsli+J78k8rnQ/oEbIhc2lGaqp+0hk50oaJ+VqQMKyrIt2VBoMOiz4QCcuOe8pZ4TqSYklOOhwnSr0XOG1srSm6k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759306994; c=relaxed/simple;
	bh=6qX378YfIp9QrbNMz0Pxbr6TFYT3iKxK+48OaAx5WCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWquuzrWpU/DTZAY3yQEA6AMvAdrJTBPI7diiZpoKcmdX2XZgZiD10p2M5l48K39tF6wqjegU6zIUhKhFfbjGoefUkkGS778mFCjwuC2Hg2upzyHhgc13q7G4G0gt/fLjUftRsYh5DShMjZ9wN9eMFENL2FGyHkUuLwjzh7qP1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d43vyIYE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UK8ssF014639
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BfqDjr2vHvMLSpelJZSSDQAyOp1sqU85uHcOi6EeR9M=; b=d43vyIYE8peS22gl
	RaiBsLJGpH0xAWW/ubA1bNyiMc+R28AAo7E7Lw5wJZTAnbLA5W92hEmKRjMDBapS
	VoxIURn73FGmZbNhpM/jHtpp7XBPRyomW+SGdRxs+BPAfrNThN3JHP70B/gm8lsw
	/kVOoR+ZYbXgSpfBh9YmP5IgEG+tB31cdu1//8v4F3NrU40udh97dTuSFzt6sy9e
	pZMIistL2DRplvNwZEDDUn8kZ6IGqQFhPtlRJWXq7oe+9zz5W1JVKPEHa/Bq2cPL
	GStqNNbIHldPYNI13CTSV8dgRrxolzW/CJBfFoUfUGmgwnOLosYC9jL/B9Ycbo46
	6D9K+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr3uk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:23:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-819d2492a75so295760785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759306991; x=1759911791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfqDjr2vHvMLSpelJZSSDQAyOp1sqU85uHcOi6EeR9M=;
        b=XxxsuSgr2a7MXEN5UFN5iNAmHc1i0BdIzz6hw7D74gx52ywrnxZEFpgPXGHgMw9Psz
         FvSUPixPN9DzSDGOumnDk730EJLUYdyRpKotSWj8CyyWhcmJkLX9Qkseoq8DxgWS0dkN
         PUPOXDWxT399U0Ikn6bat/Jnbc7xJEAwswTs/7OcgnnbEmAHXswtg8gHH5BS2wug0u3A
         K7TgW+9IlKKe3LskMLmtyVetKqpcyDKBcjHEdcmZLN53kfPgIQtDr70ttEqMuazuB6Lk
         8phbR0KE3y8DQ9p7RNtvLjW0Kq9GLh/KYF3XN/NIPH+iP0772GzSmSFo1Gbf+641j82Y
         KNjw==
X-Gm-Message-State: AOJu0YzvSZOvtFBzzaMZblx7bw0gR7nde1TTATsNlodonNlceiVn/bV1
	WYWc/KWvXyQvLkvX8o6v5/wtqbofIl3YugfxoFwLvbJmM96+eU2UaYQnuo4JdT3SQpyranh4Tjz
	n4/9OU2yBG+fie1tY6Z3Rjx5LlNL6wvpXzYLLbF0wX4aLllzp2ouY5IxCNw8bBF8qb3HR
X-Gm-Gg: ASbGnctHPogZNJhaxGCt0wSdTdm6zfUnL2SWC9C9vJqYUDFcw0weimGsAA51m/HJap+
	EsNU28+sPsHwcYBPkN2wvoGwSuqcPOri4ZgIodfvbhMurFdobNT7VCS8PHsoE+6sKcKMK5nYEyA
	N8jyl0krEb5P3Ow1MmLac7xDei/+N5uTNETZSfnZZWTaqhsEZU1Qmkyfpw6gqcV9O3LZzXdD4fi
	F+nHzOkay08ZFFyGOhrLemikDE2VEST2tkU5lM/AoPWrd73Kc4dr3I3Guc0bA4djx6ZV8sIM+6r
	pD5DJjP9D1vfXE5KAEeqjFGp0rXDHr1HRbiy+sb0IkvZYnbHAtbGhJT/FRO1XuGxV/UAm2QTum3
	XuBROQQMsPujHtcFNdbchz+UrbXw=
X-Received: by 2002:a05:620a:1a90:b0:86a:79f0:6b30 with SMTP id af79cd13be357-87375f08125mr218916885a.10.1759306990816;
        Wed, 01 Oct 2025 01:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGnFUTD4TkfM05gLH1wKBu6EI4TJguWDNzVTARV3sTq77NHeGIczqd8JoSF98aSUiX1VzeMw==
X-Received: by 2002:a05:620a:1a90:b0:86a:79f0:6b30 with SMTP id af79cd13be357-87375f08125mr218915785a.10.1759306990262;
        Wed, 01 Oct 2025 01:23:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3a79fdbcb4sm894030066b.85.2025.10.01.01.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:23:09 -0700 (PDT)
Message-ID: <a5907537-cecc-4564-bae5-981d3ad85d7c@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:23:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: QCOMTEE should depend on ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org
References: <d0b14c3d51245f9eda2341504c05bd0f5b0828b7.1759243439.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d0b14c3d51245f9eda2341504c05bd0f5b0828b7.1759243439.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OJHVK-k8SoM2jErszU2S7j2YgJkLV-Ft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXyCZZqVoAfWwA
 w/IhuRj00/aK5OlnvrWvhvQHdkI05vyka3MRcUrWjXfTbViZEuf+aVPT0j55JRCT9+Sm0aIrona
 kijn0WA53msaRROZFvP05Qrac3uDZmq39afyck5Mbqnsb5wlfIxJCKe2qS3vc5xOriiY8IMLczj
 syUZ5MFEVajlssW/dQDtMhw+JfUoDPD9dzI0oNIFuF69ZALAdxAzzMnifpPxk4gi/FRJdpuwrvL
 q/SVhuwuHDTv39oqI/t0RifHSIaMXj5z+JC2R8u15eghwrSwArOPxtpZhQmDW8j61oAluqsQwer
 6GOqNK2T1SLiY4K28oC6HHjp/f5J3tsVn8KXX0YZ7zgURW6IFIhrbmAZaMWgyVfEYFa9HGjjksJ
 RdVFSi/xKnGHK5O4e1FfDqpDrPC3mA==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dce4f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=yXkz1KN_3VbnnYl-rMQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OJHVK-k8SoM2jErszU2S7j2YgJkLV-Ft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

On 9/30/25 4:44 PM, Geert Uytterhoeven wrote:
> The Qualcomm Trusted Execution Environment (QTEE) is only available on
> Qualcomm SoCs.  Hence add a dependency on ARCH_QCOM, to prevent asking
> the user about this driver when configuring a kernel without Qualcomm
> platform support.
> 
> Fixes: d6e290837e50f73f ("tee: add Qualcomm TEE driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

