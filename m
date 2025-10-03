Return-Path: <linux-arm-msm+bounces-75879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F01D9BB681A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 13:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 912B84E61B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 11:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406152DC76E;
	Fri,  3 Oct 2025 11:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KC5VD2U6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0B2EB851
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 11:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759489209; cv=none; b=YpNAmwpmrONagAW5LgiI06+RGbfaMQCwzxtGCeoHud8yLJ3ojCIt4gJLhYnj2pTl0EI71/li3bmMC7Jm++VC8V3kyXkh6l1jsdLHr4zQ/ppvTJfHpKSXGF0uODqhP00MQZeyF3i+qpdR9lg4uWltO2YuU3Kgu5Ot9FJJ8jizb4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759489209; c=relaxed/simple;
	bh=tlBfIJ4kKHSYUsLvlHhOT3lJHNHmcihujd8G8HIpOeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=exrByeUmj8UzGU6Mcow6eTtsSku6kaIGSa3U5CoSFTq9Eokbthi4RBZEUBojzuAwpd1+oakNUcHfescBxCx+WUISx/IzN9VhvG15hl+iE36tw660jbHULMXDKMXLlbhc3/RJ4/mMbE12D7wqIBNAjtnoIvuuRhkusHJi1volNoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KC5VD2U6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593Aq2WB023581
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 11:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IEL92hzHLBUavfnk9rk3tHYX29lhg6slFzQWbOYem5g=; b=KC5VD2U6j73RFZkz
	wVzeYFX+QcSxmEGxfkK0oxOotmKZmo8gPR2QlexVviUpDFwAPhN0VN3NMgv/uPlb
	pEI/wwyIyLqsPstadYdQZSH2melVuke0kE7bF5xZk9YCknnmkNnsLYlogK4/Pb9M
	e00jIwuK4cay3zPrltsE2OrlxLMR9yrC77glEHGOY7ivkIcJmxPks2FZwI8vqqI3
	eyAuRecEw43nN+fNTO/Gr4Vkh7X0VmvDaNVkhLO88IsGiluKsA6Q8Emi68AWN2Gz
	CVplbc3WWfhRZULcTs8FkofoKJrpsCpzb7ymCOYkxgjfCWDtJ1FYR0a1XrGdYYn/
	838hjA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a6am3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 11:00:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28973df6a90so23309835ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 04:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759489201; x=1760094001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEL92hzHLBUavfnk9rk3tHYX29lhg6slFzQWbOYem5g=;
        b=hCrTlp7NClCyqbOvFLkw1FKGumwtZdoCaMJfnr6XvS18sgh7IQHCLT7jCn+tzjCp51
         RLPx2QAAiwAZvY5xL5Bc6Nj94OwHneABAKI1HpXRcmwdD7vcrF68jN9w8S/27WJ8hCOK
         D3ms7vAgp0AAjRcUtWpepJMmQOIzHK+6ky1xxJGcsvOXUZuHtyg4r6KcSHN7RyBaGFJg
         fheK3LQLcGV2AFbEKeFpb1Iff1VewA2GgSZdNIC4jrNK61qEpK6hEhhYDkWyA4qba+au
         0iAZQW9cD4XbeCrYsuWFuQw4dcOCHBE5jDa4SamxatFUPVvfQBPS8VJckWJEfhBcS71G
         opsg==
X-Forwarded-Encrypted: i=1; AJvYcCUneM7+iVXwtTdW9rfaYQ5Yxph3hiGHrCA+zha4dVbG1xCpXgFF9QQe4z36rgy+qZ5XbYaY++vefai62w7S@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5VoLCNE4MmbXutbJPp/ZDvMuFEVRvSRig0Pr+2QPgIVNGlHXZ
	NZN7fQwEpb8oE3WUgZVYcoa8fk/sjcnV2tmfecAKOG4U+L/8xuCPbGuEra1glWk+np9Lv+LHDfh
	Hjp/oKNvOwMCMwkVIIx6p36UDS6FArnAEFbhlNWg3GVe+uW5BlxPGfS9m5KAMsdbolsMy
X-Gm-Gg: ASbGncvjeiXDccPD+9jGu3z4amLp4U5763MR5LbCfTZNlzzqnuMpqVAbh0DSXl8655N
	ZgV6qowiQ9o0Ti+HOwDvDZKItLBbpXGhlSdfBZH0vqiG4bSQ4mRkuw2Cb3nv9nxanYF55Lt6sAQ
	P2d/ht5bBFTUiikZmU3ZHkEa2jt9Lx300S6gdvvH9sWd4CBQ4oUi/mtUtG/45ug7Q9jFH6qhn7q
	7lNl9dEGrqtcP/cnt7zYwQ/ILJEzYHEeqy0Xe2UAquilVxeEn+/roT24mxNFZ6IOaIKXlk6tNTu
	jNvPNb5W5UnjJ7C7ZTJJavAY0BQaBgcKskVh2ZXHxqNL1vdhQI2c2rOyOh7yyHr5h4LbpxO5pPN
	gf+Hm9I4f0OwuHg==
X-Received: by 2002:a17:902:f612:b0:280:4b60:5570 with SMTP id d9443c01a7336-28e9a65167emr31185885ad.52.1759489201572;
        Fri, 03 Oct 2025 04:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1uG5stT/umPWG9p81DrD4oxzCFHq3cshMjhhEawM6kFEF+8bxR0SNY1vqltyP5qOcBaXILA==
X-Received: by 2002:a17:902:f612:b0:280:4b60:5570 with SMTP id d9443c01a7336-28e9a65167emr31185685ad.52.1759489201138;
        Fri, 03 Oct 2025 04:00:01 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1280c9sm47348955ad.53.2025.10.03.03.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 04:00:00 -0700 (PDT)
Message-ID: <f31278b3-9f60-43c7-bfc4-027b24a49854@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 16:29:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcom: depend on ARCH_QCOM
To: Peter Robinson <pbrobinson@gmail.com>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
References: <20251003104236.1813979-1-pbrobinson@gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20251003104236.1813979-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dfacb2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=4n8RpipySPzvTEEXDpEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: tTV5P_PQ4oGDQQIH6RdlJbEV1XpmH7Lg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX0GhjkSeBvnFK
 db6rQSw6nGVlZS9v3EGTb3KZJzFVR27vl2KhbJPsCgPCt4sBQt7naXQ/8b5L3JQCdp+0CN9VPj6
 R+fgUAK63HiH/2A4ZB+SOYm4Qu+s0jQ4ER7T4JI7Tf+7uMyltE5vvCKo5mvv982RFgxqunGmgz+
 cIcJ8+/RApmmdHu8nWUjbE+W/7+1uDTVLIsp+e7qsnyy5hLBeN0b6wRSQptofesQm5mYrNY41gM
 OgZwop2uA5OS68KpI67HOMR6VTvs8tLhb/n2Tv9Oc1oxTbTiu9AL21i/equBtXIOfELDW8pCa2d
 d0LYOOpJ9D2yF2KGHNzv1jCciyTQwEikW/Z71rJKVEe6grYjEzgqelulycVykuFs/izKPPOmNdn
 H1oPDtzJjZkMxuvHaZ17ect0tdu6fA==
X-Proofpoint-ORIG-GUID: tTV5P_PQ4oGDQQIH6RdlJbEV1XpmH7Lg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033


On 10/3/2025 4:12 PM, Peter Robinson wrote:
> Add a dependency on ARCH_QCOM, and compile test, as the driver
> depnds on QCom specific Trusted Applications (TAs) and it's
> only, currently at least, supported on QCom hardware.


Thanks, but this is already taken care. 
https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git/commit/?h=next&id=3b63efa21bc6acc1a0fadd1dd0f0e1988a4c0177


>
> Fixes: d6e290837e50f ("tee: add Qualcomm TEE driver")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>   drivers/tee/qcomtee/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
> index 927686abceb15..9f19dee08db49 100644
> --- a/drivers/tee/qcomtee/Kconfig
> +++ b/drivers/tee/qcomtee/Kconfig
> @@ -2,6 +2,7 @@
>   # Qualcomm Trusted Execution Environment Configuration
>   config QCOMTEE
>   	tristate "Qualcomm TEE Support"
> +	depends on ARCH_QCOM || COMPILE_TEST
>   	depends on !CPU_BIG_ENDIAN
>   	select QCOM_SCM
>   	select QCOM_TZMEM_MODE_SHMBRIDGE

