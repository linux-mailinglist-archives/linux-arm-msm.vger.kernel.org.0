Return-Path: <linux-arm-msm+bounces-89742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A526D3B685
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 20:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D69A300ED98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 19:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D30E3904E8;
	Mon, 19 Jan 2026 19:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRp+IQp2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zug8ByNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D908392B76
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849239; cv=none; b=AcqQ2GxYWzZYA+ntuVhuQPsf0HaUfhTmpB0VJ5Vqe1TVBBOW/mgwavHb5zmhThwIkxMczyecq9mwXTTJJjyjR2PUgt2eNAu1SwqusJatwnIvctdz2TtDtsBBLnH0XjPXoViLXBJxPuoOPpLFKpyLhZ7dLpHUpbm32SbXH8dv2iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849239; c=relaxed/simple;
	bh=lAjq7fba5mBFkp5iVa0k0x8vLKodbf5quItnNBmhjJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJycFO/F882D2FnPbOiMBHL3bGQ4C43KChReY+ocQ+YVj4DHK+R4M/DVYkDty9Rsu/c8UJ65AD4ulvKy3WkuxJorN+2/PNU3o+jcVrOp9m2ThdS6893oy0rj3ww93N7cqfwANeMty6BqudbtgycptYHqzr/JnjLRoMSm6KI9rs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRp+IQp2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zug8ByNO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JHFSEx774076
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 19:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ea3RudHor1/CzJHno9mdqez+SZYcrRBHMvzlM4KMN4=; b=VRp+IQp2H0Iw5Cpu
	EBnSwMrfh4iid19PXqkOv4d2f2i5lOTrQ4iDyxWHrHAezdpFMz7EdtBMuRTCK5JC
	Jzj8i+648ukOwfhjLxUwURRoYwDfeRE3ztEijHxOiNPQ1Sg+uVwuAgDun6JSGCbM
	RXrFWz0uw7vZEMVo0qVW76cmNNM6/wdeHjtss4d8C2Z9ubHLbxZMzP8KjSeSqY+f
	t/5tcw4V32nqJDs6xdhkouoCXVitr/YHhxfbuTkbOGQCgvdkd13RIQmDKKFNmjnx
	RkVi/s3rbkR8lsq27hmDKLlE9CfBI7zVQ6iGeqOc+DI1P3tEPGWkxL2p1mYrRjoa
	7KHwKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a9kpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 19:00:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0d59f0198so49416055ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768849233; x=1769454033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ea3RudHor1/CzJHno9mdqez+SZYcrRBHMvzlM4KMN4=;
        b=Zug8ByNO0jbK7sm8ueojAAXlkSidOhRvPhnV2CwZIXqhoC8V6MjU7vh/C2DmHYRKaE
         BBPQpNRt9UbtqsK11U+V4FBQ2gEkC6LCf0ddk9jT3S1vTrWQZNHAhA/Xpty9HQRXtdm6
         pe72wA2X1sCtS775rS8s0abJKmzj9UqumeNfWBfRnVHzvizH2sCynIG2kzR1QY8pYlXP
         PLBHgPL4PHSxoNTdTdAQv8C/KmNob62q9kWUziJgRXF56Shzf4uIuyOrVRG+FYHbxYVR
         WyA8P1hqRY7ENFkVoKPEOhP3ZxQZQsA3yEgPLTyx234yN7OABAgS65DZoDNr+W9ykzuy
         9IJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768849233; x=1769454033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ea3RudHor1/CzJHno9mdqez+SZYcrRBHMvzlM4KMN4=;
        b=ebHri5NueZgRAGwB7t4PPi6qvGpMxP87bKUzrECWt8WQFKnMqS1B0sf07jYnQpvb0G
         Y0bCj2YDxh2met+rlALx1wgV2lWfFi7HxjYv2GPPpvemmgsdi2c8kacW+qAbPEd4DlPt
         QlhjPx6lZ4ZRE3aUpSZ7BK9xJwms7OKLl2l1JBHvvuyMtC7AIhTrhMDPI/P8SYlwqQlx
         zzSBU/msDgIHvL3EQ2jXbVieMu3SK4HbMs7vYl3Hk8qnhy/VH5Ici7VzbNJyvsxZ07Uf
         jegtk/bRjoNAq2jg8JwCxlfE5ABrNM0cDXY0A4dOj7bGdIYKuehZHjwCV3C4jOIUs+Jv
         ah8w==
X-Forwarded-Encrypted: i=1; AJvYcCUWqmOIOpm74raw+u6ERJZ3fZRrV4iNF0qiHgRa72+W4njR/70R38KH2GVJ3ILusVPd9H+0ml26YIZZ14kc@vger.kernel.org
X-Gm-Message-State: AOJu0YxB0hJikxP7asCFPRLoi/SzFSAkIPv1koV1BaESSDMAVkdJEDwG
	Hg50RycQzQ27wNXB7Oz29jn1FF53w4x/L23sNM8TPKYKdZbQbUNYFJRVihgpE0eek7cyvpvScU7
	8ylWD1wmCfoLLEpwTCHOHY64YEhjQ8rQTZ5SgtLxUIOx9EyuEaW2xD+SASscogme2qnHw
X-Gm-Gg: AZuq6aKxSlN0E6xbFsMeS0DpdS2lF1AIy1kZdeuiwEdului+zJ9eG/ZpFINrzjUqtAq
	cwHzrlF5agzRCc1pU3tHH0/5TO597ujx7cOBC/pVoZMZdGs4HHXtkcZdtQjcGrLPeqXsdtO+yy0
	uOZLWLC+H3IGGGnthleVAF3pdhWgD19O09zytZL9prjd7Uf6Q2AWwm7k2/Y2Zri3Tme+vqZlPKD
	VXGLLV/z28UZ9PIChFc2VPESFJI9BQfmTypPIft6KcRFvHJG0c1+HR7xqAL/YYpC20GToafdxV+
	usN2LZZiFUrGPL579y5tSNHjtlNocZqo3Ny9fnXZw1dWaxUpXsx4HBIgl16c/LebiwKLPErxI3r
	B8P8U4DqPjsTZSjx9y+bh57bllfH9fSNi
X-Received: by 2002:a17:902:ce8b:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a7175bfd2emr101976385ad.41.1768849233175;
        Mon, 19 Jan 2026 11:00:33 -0800 (PST)
X-Received: by 2002:a17:902:ce8b:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a7175bfd2emr101976105ad.41.1768849232506;
        Mon, 19 Jan 2026 11:00:32 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190abcf0sm102290175ad.12.2026.01.19.11.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:00:31 -0800 (PST)
Message-ID: <d8c24f26-3ee7-4966-a11b-1e2afcad93cd@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 00:30:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Cq31z-dVRfFpGlU_boi8ifTMNbRpOi-O
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e7f51 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PptT_Mh96ff8s3TZVEoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE1OCBTYWx0ZWRfX+ipjijCdrQTF
 18240YZExMdbqNI5ulyowHO6VkuXnXJmOcQFjxg2aZAdp+8JxthP5ht7pEI8rbYKNokiiJ8iyFM
 Kvzi+cySTXJ5o3l2pZKDoeMvlhhLFUIEXgqi099KzXTVE3DVO5AqCfBvqvInLpeX4Cy+PTtvBdR
 XbIXX94kyKRUZUnmUuly4+6EFxCl5N1VIoywiz9BCziDRLwesMYXj5zh9cI0v0s0wuKsSi4R3Rs
 2EWbQjAaP0JoGXbtCueLuioW7um4GE1CgvhKyLKN0sRXyBRh2RSdfTJ++9fEQHsmaBE2mfLwVtE
 8of7MWOsl1HoMFqFfQUKIt4wgiBcRT+LnlQmasGh8//p/xXJv9fu3mRHQ6zgWj9AKLjZqYwc9sr
 AcXCLaJVSKdUQPoR0f7nnb8ZoGwYxm/zY3I/Mrafbqq2nO4fHZARKY7KfqIXFXdldcJVnaE0q12
 cz7g5XMqD2t8J3qFBkQ==
X-Proofpoint-GUID: Cq31z-dVRfFpGlU_boi8ifTMNbRpOi-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190158

On 12/11/2025 12:32 AM, Jagadeesh Kona wrote:
> Add the cpucp mailbox, sram and SCMI nodes required to enable
> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Just curious, does this patch enable thermal mitigation for CPU clusters
too?

-Akhil.

