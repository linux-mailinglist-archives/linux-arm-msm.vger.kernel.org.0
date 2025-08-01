Return-Path: <linux-arm-msm+bounces-67429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6960B1896B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 01:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E2A43B6117
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 23:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C2A23C50D;
	Fri,  1 Aug 2025 23:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KG8ggaha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE8236A9F
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 23:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754090832; cv=none; b=uvqeW2C9m8sKotSXfHRcSb8ByX3Zml0Lu2AiqzHk9C/MW60AlidtLGYjfgDBoMVlKOAjG9CTtZwgyRAO6tPTJ4jacM7954U9BPACQPz6nCuPvw+HQ/jULZRVea+9RaIrw3c9V2+zloBj8dMsrKQA/UqPjO+YNJDiep1mcXKGinQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754090832; c=relaxed/simple;
	bh=5zD2wU0RPedSB71xOIG2wO/sVyEkf/oGBni2oquUu7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6MUfWmmKka5y8tdHE0Gamku6iE6qpD3oVMsblXUiCst0CdmZm8aVEdUIPjn6r0uiB9pgHRXyHRJQZLxN4z2t36yck/POxhkZzkxIGYxP8l5NlUY30owRX4NymWregcivcE1qeUgELsci1hGC8xiCcHVhBLoyRJjbE70Gn54tXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KG8ggaha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571LfPsi006540
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 23:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4iwmGaik7FqRWxLvl/RYLwX7bMNVlJbG3lnXv3lDsk=; b=KG8ggahazOlKfkrC
	h1/JP4JFgeXGN1oNnvOGbsbH1MAxLqSXxn1NMWvcY6tfzZMZyXpapwxna3WQh8jE
	Wy7xd7qfIw83BnnGZ/XDMCxBtYIHni+0bjDdPJMQc+ssPi1tXrfr9R2NYb4zSF4o
	LzjP5osb9NgW0hJReKl9KAd6DB09d9LpMeX1IA5srt/k7reN2cJe4lp4hJY2Boa6
	jNlNbFXJldK6bEMopFHyDtu/74JjnCaTxTk8O7T2rrafbbtJnlDATtsMIdAhb9ZJ
	OEYHDTCjjfOVP0+arLMw37tevRMCM36JY33EOYJ47j3eyMCFnyN6WbgfA09xaV2i
	42RlRA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48887g5wbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 23:27:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76be0be9ee1so1058783b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 16:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754090829; x=1754695629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a4iwmGaik7FqRWxLvl/RYLwX7bMNVlJbG3lnXv3lDsk=;
        b=PsDvAQadfIpzy2cMHJCvdmlgO0wmqju6h8tWKZBiGee/7xMS3hIwHA5/Ru8HBCpwiz
         OUsynqsIho81OEbQ7NEB6oR4+Encev4YBFEaZf0COL9a+nKL2FYacJILnzoDvtW4kwxQ
         SdMTdzw4ufITE2Od6nOBtMdENcidSbYppbNR1IzwtB92WDEV5yrE0If/ffVUK/xwDMeJ
         FNECap+nyXU4L7H8XwGdNCLNsOU9Aux0MyjU+gPl7V0crp29+R8gvgQ5Cd3BqiowClHP
         cUFRtIil+S5ogEtWwcEroEbDzGUOD8F/yVmaiszw8bWe3Vw31aQS86n5d78MK1F60vc9
         mu5A==
X-Forwarded-Encrypted: i=1; AJvYcCWvgLd8oB/swjtIUxAn8Q9T1iH6vg7qfDpTfKyj/PFRFZJzTDKLp7renklSP8PzX4gBMMbmOi63y6aNwWME@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXb4HvX317PlQrbHGQ9d0LAY3b6malhYEwBzJg+ASbdXfjCwG
	fHBUOOZVsjzuP+w0jA06pVCX0L0OS76mw4P0CPLQ3LIageDm1er+KU9MXYMM/kBucSKLvs332LH
	sZN6jstYlYtHb16A0nr7I+0ApcrMDJNaGFm29bqO9uYv5n7iKZIWerxjNMSwD/I8im0E4
X-Gm-Gg: ASbGncvs65yd1GQkur7t7raSbQSWUjTZUncLQYTXmBCrFXfoEuJJxpvWYPitvu4to8j
	zB4Zt1v6hxLR2nAZIkpqCzVC96Ei7z2d42MipZFfeWmlg8B4nrj5QAYutqn62Il7B1fL3/jfd/5
	HG7cMKjsyICaqBQJr7ss3EnfZK/gTXNZnjRKYB1yZpbOpgGv/tuu3pE1Ke4D1XzQfOwdup7K9Lq
	3XN9ARwPeP/Fq0/ig55acxL9qWkOXeUkaVqgNtK6Rr6acfDGfD4apnT1QbTARQWQsasbmoyIqx5
	z2Jr87s70rZtb0A/WUCogAss8clKNlhAiEAlHi06DakmY7Be2HvcOcTA1p6zqRLVjsuRi5BadpW
	xozSAHQsK/5XnSj9Q+WJgaYxOMRSRPg==
X-Received: by 2002:a05:6a00:88d:b0:749:4fd7:3513 with SMTP id d2e1a72fcca58-76bec4c5440mr1401697b3a.16.1754090829195;
        Fri, 01 Aug 2025 16:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGru+DQkMQeTX4Aq4nDQHiVYbj42cjgkZZ7g48nRXf2BhgxKbCqcIJO1LIRLpdO2wrIjqiEXA==
X-Received: by 2002:a05:6a00:88d:b0:749:4fd7:3513 with SMTP id d2e1a72fcca58-76bec4c5440mr1401668b3a.16.1754090828736;
        Fri, 01 Aug 2025 16:27:08 -0700 (PDT)
Received: from [10.71.113.238] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd174sm5037659b3a.63.2025.08.01.16.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 16:27:08 -0700 (PDT)
Message-ID: <b0ad575c-068f-4f39-b086-c82ef6bad120@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:27:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
 <697bb6b0-ecca-4392-9e7c-8d4ef75ec96c@oss.qualcomm.com>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <697bb6b0-ecca-4392-9e7c-8d4ef75ec96c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vdn3PEp9 c=1 sm=1 tr=0 ts=688d4d4e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JTuwudAkkWYWUMqqoE4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: xQU8xq1KX_5nBSEFP1hbirOlh1K80pZ4
X-Proofpoint-GUID: xQU8xq1KX_5nBSEFP1hbirOlh1K80pZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE5MCBTYWx0ZWRfX8TrFipLsmPlr
 D20syYs6NDL6yvBOUNHwF2k+LqaFzkETDxQ1PUT0pGyoNjrtUNy9nlRe6Q/zavw7Jfvyoe9UkRg
 KIcvtQL6sc/TBy2Q5JG/06lLrHGU82nl3VceHYrxNq2SElt7Rhu8SABrY85zgANz90JxbchpmTg
 WjoM0VYc2zUmpzVsYur2QctNAH0BnJ5cH6JZl8+2Zfzej0mGbwO4Bt4QvM5u+uCeAdmQp168AZN
 fChcYIAAIl+EqKTgKp2CMS1/kd5EEoQDGgTXEYHvWmbdTDvbTltSwJLdqcwGCIcNFnFZ0WsH8nq
 ZYUnovTE3Xsm52wtROuS6ZN/dagDI4IKHgWv8zFMISQCxi9GjFa6kiGENrd8YNB77wWxJLmbfWv
 yej46V3p1yaTCYIASS2ZTNtRArWruJg1h4bTiJr4XKVpdmX4DHOcL01vXBY4sVeycQw+m+oW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=470 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010190



On 7/16/2025 3:44 AM, Konrad Dybcio wrote:
> On 7/16/25 2:52 AM, Anjelique Melendez wrote:
>> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
>> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
>> This makes the total buffer size increase from 48 bytes to 528 bytes.
>> Update the buffer size to support this increase.
>>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>> Changes since v1:
>>   - Defined buf size in terms of other UCSI defines
>>   - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
>>   - Removed Qualcomm copyright
>>   - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
>> ---
> 
> [...]
> 
>> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
> 
> You mention V2 everywhere, but then check for V2_1 here - is that
> intended?
> Konrad
ACK - Will update to check for UCSI_VERSION_2_0

Thanks,
Anjelique


