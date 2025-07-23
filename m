Return-Path: <linux-arm-msm+bounces-66338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF419B0F7E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 18:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89F55188B9FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303BF23A6;
	Wed, 23 Jul 2025 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sth27BLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7662E36EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753287407; cv=none; b=dqiKqxRV2/75ShZ99sePGsoljJA7v/MR2Hjt4ZBSF1TXI+q80OCm23O5Oz4AQ77aZGXu7TO0Sq0TVdr4hleddrFmG6a0smdVtVt9MqDkMcw+dUkIm8sdSoKD9CxKyiSvzPuxHZDJFqzJv/SvTUBe9H1y3JRr7lRN1XeUp236ntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753287407; c=relaxed/simple;
	bh=TeAfo5XC+SYG/qzz2DoAru3zKW8ugDTeZdQCUfzlipY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3Y/BEgHy7f6Dlu11QZGNyzWMQuUNQDL2kZEEPJK0gVSPci4FDxMlgLEmKxvW07EdTEwSEh8T9QYNLzSDrEk12K3LS6zoeTzxTeULClHjhZcDtOMrZXTt+xHsJ7JojNa9m5aXG4NXG0s2u9M2YuQJ/PCs7LjWJHYKLf9SrvUfgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sth27BLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N8rs9M009238
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 16:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ahHdpK2wt442MUxN/a81ci6TCouisGheQufqHd76VQ=; b=Sth27BLKQyLoRJBW
	octAOqjeROU581klddfMxELv0V+1wzEVdpo/zAljqSjNZ5Aa2NwDJYbOJfw6+CV7
	yZFHHSa4hsx2Hp+XgXqjkKyZncOSpNF0Mto9BGmPHr21x+KtDIimVPttQASlxzc/
	g3RBazqqeVZtAbcExNlhYKs03x2sbMFHlgu32IJA4cvvsAVnSLmVZt/VTyik6Hvy
	bQ41Kli5UHdcIWp3iIlp2/8g81tAOMw6f5BQsdCzlxZYEdZ9nYOixdZB9B1Qza4S
	EwYNLap08aEw/7t5EqBrZJfOEEMFCRgpoCxh8Ls2j5U0c8d1OQcDoexJCiqg7yB1
	cf/bfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na499d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 16:16:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-237e6963f70so113030295ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 09:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753287403; x=1753892203;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ahHdpK2wt442MUxN/a81ci6TCouisGheQufqHd76VQ=;
        b=oeQOCHNtB5xTW0xRHscoiKo/Uri3pDJn7EvQggT7tnncD6btGMiLp+T5tDEnINUagi
         3M8N6FxMwhc48s4SsQLyc/7vxprMIIS2E6sML4AKTXxX5HMe9Grs1mETUNqZR974YIqh
         mbFYG2YR6DLaFyNUuu4pm2axK6PfXZF3dX9hlDliSCbSawpvYs0bIgUEUDim15VLu+A9
         n0jcaVKXjABTvwr970jmfB4xc0bV1TOF/t6+AutCEattoZBHTqlcarSWCf70Lk/hBHC9
         SXvTV1ywdRNtuyxbRivkRtBIMt665KOENulajKTpYFxCmFXcWXX0BOwQqqr47EYH17Pk
         hCvA==
X-Forwarded-Encrypted: i=1; AJvYcCWKLQtA7ZpqvUfrittQFaN4NKcGn6gYCTY2B8xkM3YoX+cOC2Rf/07F017NOFsJ0ydjrB7dm4GLu5VP0HIj@vger.kernel.org
X-Gm-Message-State: AOJu0YxKG/BIxf4Korku+AUOZg0xjnO+1GYByj6aU6apaNiRucysrqdZ
	/q4Jx3ZZm0VHKv3EMvSo0MNXx68oP4KHCcGgWkpkLX26PEue3G8DGg8/B13vW2++51C7DP+Wzu+
	ZRNofoNmUWTJLefJOaSdNXhsVbV1QGDN2J7RBjTwRncbQM0uKOer2dBBdDekl6dC3L2iO
X-Gm-Gg: ASbGncvmK8GVigxi5ug2DqJ3KcfrpjnJlxmDZ9wasV6nh6R5YN9qynCva7C0PNAIW0z
	ZZLQZsM99CORkWkuzf5T8Zx6tdDVg7W8qM2T5La9Z5uhcExWu6Cjg5BRdVApq3fBhTrnPtUn0DC
	ncy6yZ8kP3mgJKneVR0aQtkJSmT+FGl6U10G1YJ28J1eQ41foREy9wq18YCuivAZ99LaGYxOdOi
	rCYnSfeLBAVrZ/MboVEBcBiIzOZs4+KNm7JY1vw8wOeB9IiY2ndJhmDBoZcj+RzVjmYlhjbf0W3
	6R8JbZptmKMFvMqBt7ieVUClIrOy4piFMW31iuXH4XNS23vjlHashHujRVK3Mw8p
X-Received: by 2002:a17:903:2281:b0:236:748f:541f with SMTP id d9443c01a7336-23f98195113mr42556565ad.33.1753287403365;
        Wed, 23 Jul 2025 09:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH32GBYmFHtSz/Uwh2EzZr1vWg4+DmelFbNwMgWwGmiVYzlCyNqOtYbX5pVtof8b7I5J1rvKg==
X-Received: by 2002:a17:903:2281:b0:236:748f:541f with SMTP id d9443c01a7336-23f98195113mr42556075ad.33.1753287402781;
        Wed, 23 Jul 2025 09:16:42 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60ecbdsm100314065ad.82.2025.07.23.09.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 09:16:42 -0700 (PDT)
Message-ID: <77e344a4-ab45-4999-8864-2ba443dc0391@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 21:46:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
 <aec9cd03-6fc2-4dc8-b937-8b7cf7bf4128@linaro.org>
 <c052931d-9bbf-42d0-9ccf-4fdc62d408bb@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c052931d-9bbf-42d0-9ccf-4fdc62d408bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7t2Cs0lmCOld7MtPm4-xS96i7J1wxBhE
X-Proofpoint-ORIG-GUID: 7t2Cs0lmCOld7MtPm4-xS96i7J1wxBhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE0MCBTYWx0ZWRfX0TjRxXg9G70a
 C2P7/Drv9Jtjroj0F2VbVhg8UkEpvYGlPP4s/LvXWwx7f4mUUkb21RLyKkzUMrRZFpzvIpLjjFK
 9ilvFI+fMBFLBjYpRvXnzkS/ijbn2RqDs6kEZ40G4zGKqyQwuFS7aJsbM4B7e5+z4cx/C1q8nwE
 69G5clD63ulq/s4izqxPfRl1gwY+M+7JvVOcqKvI7kfI20DA4668X19HzHRFplHSCj8Y1p93wQK
 H06od8/YkMZDGdgoBnm/N3G4i7IxMVoLb3adh4RlP175yiYbWPIz52KoOS/kRL63OSdfrtOaFB5
 UN4Aust/YTxtyEFnlc/Dne6dhkdDbOtfqHMVp6fZK4vzkncyaQmEUvQ+vAJAhrxPvA0uWX7qXPu
 CXFaVBwm6hQk5xT7h9Yn+XwXZGICzAg9qJNzyBjFQIm7NmjfaaHdZoTbna8mihnuDL8SwktO
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=68810aec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=7eR1o1z8CW6_ZOpSCJ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230140

On 7/23/2025 9:16 PM, Neil Armstrong wrote:
> On 23/07/2025 16:46, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 25/06/2025 17:22, Dan Carpenter wrote:
>>> This function is supposed to return true for valid headers and false for
>>> invalid.  In a couple places it returns -EINVAL instead which means the
>>> invalid headers are counted as true.  Change it to return false.
>>>
>>> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read
>>> past the ELF header")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>   drivers/soc/qcom/mdt_loader.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/
>>> mdt_loader.c
>>> index 1b4ebae458f3..0ca268bdf1f8 100644
>>> --- a/drivers/soc/qcom/mdt_loader.c
>>> +++ b/drivers/soc/qcom/mdt_loader.c
>>> @@ -33,14 +33,14 @@ static bool mdt_header_valid(const struct
>>> firmware *fw)
>>>           return false;
>>>       if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
>>> -        return -EINVAL;
>>> +        return false;
>>>       phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr-
>>> >e_phnum), ehdr->e_phoff);
>>>       if (phend > fw->size)
>>>           return false;
>>>       if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
>>> -        return -EINVAL;
>>> +        return false;
>>>       shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr-
>>> >e_shnum), ehdr->e_shoff);
>>>       if (shend > fw->size)
>>
>> This patch on linux-next breaks loading DSP firmwares on at least
>> SM8550, SM8650, X1E8:
>>
>> [    7.572665] remoteproc remoteproc1: Booting fw image qcom/sm8550/
>> adsp.mbn, size 28342616
>> [    7.615176] remoteproc remoteproc1: Failed to load program
>> segments: -22
> 
> It also breaks GMU loading on the same platforms:

we don't use mdt_loader for GMU fw. This must be due to the zap fw
loading has some issues with this change.

-Akhil

> [    7.418330] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu
> [msm]] *ERROR* gpu hw init failed: -22
> 
> Neil
> 
>>
>> CI runs:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/
>> jobs/248846#L1323
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/
>> jobs/248850#L2037
>>
>> Bisect log:
>> # bad: [a933d3dc1968fcfb0ab72879ec304b1971ed1b9a] Add linux-next
>> specific files for 20250723
>> # good: [89be9a83ccf1f88522317ce02f854f30d6115c41] Linux 6.16-rc7
>> git bisect start 'a933d3dc1968fcfb0ab72879ec304b1971ed1b9a' 'v6.16-rc7'
>> # bad: [a56f8f8967ad980d45049973561b89dcd9e37e5d] Merge branch 'main'
>> of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
>> git bisect bad a56f8f8967ad980d45049973561b89dcd9e37e5d
>> # bad: [f6a8dede4030970707e9bae5b3ae76f60df4b75a] Merge branch 'fs-
>> next' of linux-next
>> git bisect bad f6a8dede4030970707e9bae5b3ae76f60df4b75a
>> # bad: [b863560c5a26fbcf164f5759c98bb5e72e26848d] Merge branch 'for-
>> next' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
>> git bisect bad b863560c5a26fbcf164f5759c98bb5e72e26848d
>> # good: [6fe8797df6f2e3a7e3c736d5bd4862915a06a690] Merge branch 'for-
>> next/core' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
>> git bisect good 6fe8797df6f2e3a7e3c736d5bd4862915a06a690
>> # good: [c522d00e1b4b00c5224c2acb9c2738bcc9c04ff5] Merge tag 'ti-k3-
>> dt-for-v6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/
>> linux into soc/dt
>> git bisect good c522d00e1b4b00c5224c2acb9c2738bcc9c04ff5
>> # good: [6a323f22a8b925f3646c884e2f9c733c79393f1d] Merge branch 'soc/
>> drivers' into for-next
>> git bisect good 6a323f22a8b925f3646c884e2f9c733c79393f1d
>> # good: [5d8b3562faac8030b5c26efc1cd739a41c4db722] Merge branch 'soc/
>> dt' into for-next
>> git bisect good 5d8b3562faac8030b5c26efc1cd739a41c4db722
>> # bad: [b79c0d780e519d760c2529f0bf849111b9270192] Merge tag 'apple-
>> soc-drivers-6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/
>> sven/linux into soc/drivers
>> git bisect bad b79c0d780e519d760c2529f0bf849111b9270192
>> # good: [9841d92754d0f3846977a39844c3395ee2463381] Merge tag 'memory-
>> controller-drv-6.17' of https://git.kernel.org/pub/scm/linux/kernel/
>> git/krzk/linux-mem-ctrl into soc/drivers
>> git bisect good 9841d92754d0f3846977a39844c3395ee2463381
>> # good: [64a026dd896e423a177fe87e11aa69bf5348c27b] soc: qcom: socinfo:
>> Add support to retrieve TME build details
>> git bisect good 64a026dd896e423a177fe87e11aa69bf5348c27b
>> # good: [9cea10a4f5a39fde32bf7b8addfa5f9175174e0e] dt-bindings: sram:
>> qcom,imem: Add a number of missing compatibles
>> git bisect good 9cea10a4f5a39fde32bf7b8addfa5f9175174e0e
>> # good: [0445eee835d6e59d635e242ba1d9273f168035fa] soc: apple: rtkit:
>> Make shmem_destroy optional
>> git bisect good 0445eee835d6e59d635e242ba1d9273f168035fa
>> # bad: [5b8141596b06fba7313cdfbd5f589649d7fde662] Merge tag 'qcom-
>> drivers-for-6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/
>> qcom/linux into soc/drivers
>> git bisect bad 5b8141596b06fba7313cdfbd5f589649d7fde662
>> # bad: [9f35ab0e53ccbea57bb9cbad8065e0406d516195] soc: qcom:
>> mdt_loader: Fix error return values in mdt_header_valid()
>> git bisect bad 9f35ab0e53ccbea57bb9cbad8065e0406d516195
>> # first bad commit: [9f35ab0e53ccbea57bb9cbad8065e0406d516195] soc:
>> qcom: mdt_loader: Fix error return values in mdt_header_valid()
>>
>> Neil
> 
> 


