Return-Path: <linux-arm-msm+bounces-56857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83DAAAD45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 04:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09AEF9A3914
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 02:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D443899FF;
	Mon,  5 May 2025 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oy84eHsy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84623AC5A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 23:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487144; cv=none; b=mMNmE/1tSMt2gdUAepBKWOflzVczhLn/JFWqHBGmFfZaYEDnAm6qTz4dXatN6Nnj0QyJpbKZPN43MmYA9sdVEe19qPufnUfFXhZ/ViHThr4ejyiw0svpLBUJ91jGhE0v5aL5F4c8xJaXjEMkAvzaHRHJaeo+3RRY28ZL9THj08U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487144; c=relaxed/simple;
	bh=szSy1DusHGWtdc5DBdNxGyYxoEy8zsXq36nE02dq3Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tATVukQQhMBxy114N5tCcxwQr4/dC5B/AWdPYQTvWrs4Axl+im9ZQkAxu/dllZOXZuHQEWMwEdAfNKrDB4k/pIbwpipwCib+5q0WPpSuTfzR22dDM4lMfXvpWs6w00j0lF9Dk/F0ZNeRn5MJW112kZG4W4dDwQfyLwkvwqGBGIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oy84eHsy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M6XY4014180
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 23:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egliTNxrRWezR2u6nVEeNELYig/MxmMlQ01oFG+bL58=; b=oy84eHsyzw4cIS4t
	IbPIQBGACmEjACW5IsGawddvbVqI3FFn1seYPXHPptK9aK0cX84nidWwqwuonHVD
	yMve+Sosb0N8+Kfh2UNdHWK86ZhqRJj6oV9VqndrIEsP3x/GNOmkWWnAPMNzuH/M
	AL8M9xwo2k9cIRvghPBeEu7PVTNlMQxSfEwWTiNI2bCxvMvpwNuQPvNOvlYEyd/5
	cGSBjVDx1pdRIbUsQdwNKnTg5KCFk/BNC2V88A+4EvHfFb1QPy/4vEBaG/gFNYjz
	Bjm5J54h3/Jf3v/q59zx4SzPLVXtb9msx0BQ+irCq8F0p31wiIOXflDDOiJR/kDL
	D9rRGA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u404nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 23:19:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22650077995so74141095ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 16:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487139; x=1747091939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egliTNxrRWezR2u6nVEeNELYig/MxmMlQ01oFG+bL58=;
        b=v+JL+Pdphf4wiy8prgXzxrZzK5qfOaiZLGuPLWtCsEntJb0JM1z4TZqk++HdmALN8F
         7MZ4pRUq2i9l2hntuWR5DzwscTSQnsTZDRw8CdtymMOMIkgQlIwmAf4zkbn/roRLj8QW
         5GWosb/8dMPkDnGPN5uISlW2FHMZ3VF5YPTu2pX1gWVQKYFhwnIokqAlEfjbGxX0G5a5
         8DQJ7PBc/Ro25knN0h2B4+Pv8QoQPdL5eXVoyjheHwLZPMwLn1uZMRlJ5DDPaQy3o2AP
         s6wTolbkVZm6ei0O/Li36Rr4v5Fp8807JLPLkuCr+2w/yXkwNs3S2uJzJNYSFAZ1JCfH
         eWcw==
X-Gm-Message-State: AOJu0Yxg5YezAEV3cPCOrgAs/yuiCHBqrmUmg1ACH1Bf6HzMqLNJIVxx
	+8MBXRdQH0/KI9ClUiApa5xF3+gdznXe+aaydPegmHEJ3DS2Dj1AqO4AF1UPVAWn+qOXES2uOmT
	z35tdhUxA05uqoSCmo29Sfg9Jty/wLmHLOY9Wkqy0fCq0hMdJItpQlE9+vEsv5bM=
X-Gm-Gg: ASbGncunFhawndwojbtf9mbcRx4WDzgzir1sOESGDrU/8Wdabui53k2kg8DmiEkbYVa
	D4k9CKWjO4zVUHbgsPmdhWuXi/SwW8IkmDJu/3Y4K1xTNM/d4PhXIUcfF32IJ9b7q6uuz9iT1H6
	6CLmIYhJs2ng/vyf7PD0Ao94b+mrYbAB5UxnUz86RFYmcPigY7SlTIHDdgr40h8GTWMLpQk4y+c
	wOmuwdnrSKMvcTSGhjjf8Mmc2FJHnX7KIZxf+NhVJ2AHpLBcEW5GOmAHStVeWIBpN8Th78mVIaU
	1hYiPl6/yToXwpHCUdy/qNTZ2duKCSehdS51I8F3llPNvrLIqZxeZQ9+CcfQKyNtDoO5aHK0uVq
	mANEMsnnFLA==
X-Received: by 2002:a17:903:11ce:b0:215:a179:14ca with SMTP id d9443c01a7336-22e35fa48edmr11374135ad.2.1746487138868;
        Mon, 05 May 2025 16:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdqr8QmR5hHl03YHuIdiZ5XDPvQLzJ8NRfBgcXvm6h4rkFqPZiU9iHtAyIKS5UBK5d6Ay3DA==
X-Received: by 2002:a17:903:11ce:b0:215:a179:14ca with SMTP id d9443c01a7336-22e35fa48edmr11373785ad.2.1746487138404;
        Mon, 05 May 2025 16:18:58 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fb3esm60612335ad.121.2025.05.05.16.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 16:18:57 -0700 (PDT)
Message-ID: <2a0df02a-1657-4b59-8f31-791a8aff523e@oss.qualcomm.com>
Date: Tue, 6 May 2025 09:18:49 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] firmware: qcom: scm: remove unused arguments to
 the shm_brige
To: Kuldeep Singh <quic_kuldsing@quicinc.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-6-6a143640a6cb@oss.qualcomm.com>
 <246da659-2add-4ccf-b914-f737fb93f3f2@quicinc.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <246da659-2add-4ccf-b914-f737fb93f3f2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=68194764 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=S5yCOARCkap2nlZrFcEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: OZ2bbiXD5PHS5ay0RhUe7o8DhQsofgVc
X-Proofpoint-ORIG-GUID: OZ2bbiXD5PHS5ay0RhUe7o8DhQsofgVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDIyMCBTYWx0ZWRfX/er/6AFFeBly
 EDFp2N2Fp90XQi7Jj3Wn+iT4tWiDbHgQE21CA2PzSo9d7yEy22TjcPfR4X1s3E99ofpUZevEQX7
 MDaIS2BgVs1jBChopazSI7QBcJ/A61NwNFw+jIUwiIJvK9QlgQGfOA5p+41IepgPdxxv/Q6uwW1
 29/gQXpK7zs7m+b7McOSuCZQ1QbSQolEocmOPUZGmvn4c93u2kMIJj/2ZiV8WyfjcB5/rxu2Ybc
 T9WrDk7XDZNbIHy6VqJzaVoLgJBHQvBnEOye3+JxfQmwK5kOZCmO8Joe7zhFaQeVF/P+toUmUXd
 8BfrLpokgsobl4lsqddKZEKeJvNGPGUVkWwBkhSLH7hf5NKnqQ4ddDCIug2PTkOZs5MEXSTQweM
 +llTF550wlEt50FyTBibFLidfM8yhdvZOFknLM7/+vPWTdiH3XRQGPSiqaag1GacVYXf6Zoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_10,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050220



On 5/5/2025 8:58 PM, Kuldeep Singh wrote:
> 
> 
> On 4/29/2025 11:36 AM, Amirreza Zarrabi wrote:
>> shm_bridge create/delete functions always use the scm device.
>> There is no need to pass it as an argument.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> 
> There are 2 type of APIs exposed by tzmem driver for pool creation.
> devm_qcom_tzmem_pool_new and qcom_tzmem_pool_new.
> 
> Device managed pool is created with devm_qcom_tzmem_pool_new but
> currently qcom_scm is using it's own dev to create/delete bridge which
> is problamatic here.
> 
> https://elixir.bootlin.com/linux/v6.14.5/source/drivers/firmware/qcom/qcom_scm.c#L1653
> 
> If pool is device managed, same dev should be used in qcom_scm to
> create/delete bridge rather than using qcom_scm dev.
> The dev passed as an argument to function should be used instead of
> __scm->dev.
> https://elixir.bootlin.com/linux/v6.14.5/source/drivers/firmware/qcom/qcom_scm.c#L1634
> 
> To summarize, I believe correct solution should be to pass corresponding
> dev to bridge create/delete APIs instead of always assuming to be
> qcom_scm dev for devm_qcom_tzmem_pool_new scenarios.
> For qcom_tzmem_pool_new, qcom_scm/qcom_tzmem_dev can be used.
> 
> Bartosz/Amirreza, please share your thoughts as well.
> 

It is not true.
Why should shmbridge need to have access to random devices, while the resources
are obtained from the scm device, if any?

- Amir

