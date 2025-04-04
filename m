Return-Path: <linux-arm-msm+bounces-53191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA00A7B817
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 218E03B014C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 07:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0637D18C034;
	Fri,  4 Apr 2025 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrR6F1QD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A818BC3F
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743750538; cv=none; b=ZCf6oRpwcbbsD+y5ici/jJxEj8ayvpxRBddV7XowrnUOHwpMPlSBhjdXZ/2F0pu2tHjXKfaPH1aslO+W2xRgZEhRU7vhSOL60GRN/CZm5MLjErIoc55jJvfqGwxQwhtwVdSBRZGlfzDMvw9StXGFhWxhQqLNqcZ9+eZq+j4w7P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743750538; c=relaxed/simple;
	bh=PePG2N+THqHow9g9biCMn9mgwJJzMWeCgQMZbgxnnmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSaDCOmudMBpqrz0FMd+LRi1My4rPhGjJSNk8bQSKfYj7VdJKzYTRJCF/BGDkECcSfCdhS9rBz5Gl+7uzXlOztUtp+Eh/sv5IJIrqdfjpC+iW869dmyPVVc0yzV7nRccInbZ01/v9TXCcL4THj7lj6F4FjjgL+Wx37xCzEy1ABY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrR6F1QD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53433qSv023022
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 07:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgs/lfGfcLivEcV2CJ7Z6AU+vdLRxoSg/Db/YnRdOYQ=; b=BrR6F1QD7cdcqmfi
	Hj4n+bMko26opAOFz/kwf78erJCP2hpCqpVh9m64VJ3xbLq2IzttE351osR5w26b
	drBvhjWXbEq+21UBVPDp67UT5IphEsDO6ZHK+CIS8b85TTvCEYUGJhv+359sEe6T
	OF9+IvqtijBk8CSwIvh3xpbjJYXqAvryxhl3cpnf6rKbaFTud8kUNWtgGc4LPpym
	AP11ZfA5Ya8BP2L6jXlIGa0xJI3geEjUFwWAGPcBQE/fBlIrBCiXREViF9Dh/86/
	H+V8TTPD5erRq5PcwSmp4BNQC7jdqubXqSVptnyE5awt+hABvfUzJKYqZ1Ds1Uaa
	HqXotw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8ry7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 07:08:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240c997059so22327145ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 00:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743750529; x=1744355329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgs/lfGfcLivEcV2CJ7Z6AU+vdLRxoSg/Db/YnRdOYQ=;
        b=GycInpfVCzIs214f/Jy51gFOICp1x9A/XsmP9H1QrwoQQpFKqI6yTgDiYrRWTn5en8
         IUCsX9p3trpBMSmJKG7YA8uknDkALLadZa4uq8P2P86dERGO3GGo8lsvy03kY60sUCcs
         JnZ9dFKyyE1xGGTgW4K6TtlRUsGMnDtbkY0tPNSAqT9+837QZpR+K2kuyKZGAf3Oc++a
         lQkk5RY41HOup7eoHcUHu0NXUfXv+ujeTJftziO3+00s0IciPhEUaQf58Eho+VBJOwU8
         yjbJzFtMbqe8u5Oo2UVlgASu8QSkAOLrUKUYs3qKEBTfbdwRaykMLbCQX37xyjx4qt5Y
         FuFw==
X-Forwarded-Encrypted: i=1; AJvYcCUEa173Zpqwug1cHhspCDSut065uxNM6zjLN2fexRiJKlDR536nwnrIXOosdijdimsq0dg/Wz6ikP6hOOnb@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDORCKrdMvoDNgYcIz5Pres0S1rwwcpe+W3SXeXAJvhXNpn6k
	xOfZulUfYe3CiRml3a2Ln5VfGi07iSZLJvXEOTOMfOnpVTOxZ5jkgjKp3+k8d4DVCgFAIdUFIPa
	UlASNzAc1nYsV86KJDudsqsiRIZcVdBUiKPZV8YGVyjLCcQd4SOoK0lGQv5iqGiVl
X-Gm-Gg: ASbGncvFZHuIgNU7jRCWH7ROZTlUyQ2fRsNKf6Pwg3qiuy/vLDFVqEYFtCn0az5tqrr
	/gNXXQAv6xPFjJcv/Kp+5HKfQM1fnIACegMZAH+F7gCNWm6FKFB7hexH1X96L6QkFsaeQ5IrTf5
	dkhu8KJBFqyFHN6hjBhj6+5z7b17M3ONPz+VvrLrxD8GzTMHDTEfRsh/zWbBrzjufJraaLwxhjI
	lGYBHOyDAul5ySgr+xA4g1dcujrH/sXRWE7v3CVE6QYCPeR2nfBeIlVCk5VfS4anMTZkEOqV+cI
	NrekhjvUv1NW20bFtoDrYXfzAgHE7+Onv/BMXRo1GR4=
X-Received: by 2002:a17:902:d04a:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22a8a057a8dmr19970735ad.17.1743750529384;
        Fri, 04 Apr 2025 00:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ7owP26+DvwVCdb+EbklmFXlyFaqlxqwxGuGwC9OFUJ/AaSiMvztJdLJAg14Kj3eQ8arZNA==
X-Received: by 2002:a17:902:d04a:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22a8a057a8dmr19970515ad.17.1743750528951;
        Fri, 04 Apr 2025 00:08:48 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bffd4sm25615205ad.57.2025.04.04.00.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 00:08:48 -0700 (PDT)
Message-ID: <91bba481-5871-48dc-a7d6-86f3bcb60d0d@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 12:38:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-3-gokul.sriram.p@oss.qualcomm.com>
 <6b33d7ea-4ad5-454f-bd26-0ef961cf7ae3@kernel.org>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <6b33d7ea-4ad5-454f-bd26-0ef961cf7ae3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KcPSsRYD c=1 sm=1 tr=0 ts=67ef8582 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Wqv6gbwBmZbUZL-V1fsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6JUimpDLefQhGkcaR6NSHEMLz_HmRKWM
X-Proofpoint-ORIG-GUID: 6JUimpDLefQhGkcaR6NSHEMLz_HmRKWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=736 mlxscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504040046


On 4/3/2025 7:51 PM, Krzysztof Kozlowski wrote:
> On 03/04/2025 14:02, Gokul Sriram Palanisamy wrote:
>> +    minItems: 1
>> +    items:
>> +      - description: Q6 reserved region
>> +      - description: Q6 dtb reserved region
>> +
>> +  qcom,q6-dtb-info:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> NAK, you added new properties which invalidates review. You must drop
> review after making such significant changes (3 new properties? Several
> other changed).
> See submitting patches.
>
> Anyway, NAK for the property, you don't get DTB info from DTB.
Sorry for the confusion. My bad, this Q6 DTB loading from rproc is a new
topic.
The HW/FW has not changed, will revert.
I will repost V5 with just the comments from V3 addressed and introduce
the changes
required for Q6 DTB in a separate series. Is that fine ?

Regards,
   Gokul


