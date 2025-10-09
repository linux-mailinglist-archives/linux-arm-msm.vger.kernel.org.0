Return-Path: <linux-arm-msm+bounces-76528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11028BC756F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 06:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEAD5189783A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 04:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D7C1E1E16;
	Thu,  9 Oct 2025 04:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfH1KhJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662331EF36B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 04:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759982512; cv=none; b=Y8mV+FhDhX9Qgg8SXu5zX6VSDZQVnIPl2MZdM2GpNofgqOwhmCWMWXDhl2QZ3XYiET7Xrs8S2khn3Qw8501A9h6lG/8PPrs6d+jOlYlputPWyRYGdp1Wt0hCKitJLSn7oEqIvpHyOqTPmM9U/eVxyDTVJyr3eJNNssezsaqeGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759982512; c=relaxed/simple;
	bh=a43a/WOJy8uZXXez1tGKF56g5QwNfcVFfqzFknkXgos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3MUkFrfhRJfpYVz0agFBBVuL7iqM5pv1o+suVQcQatHVq72Nsw7TnMJLBI7dhcI/T9Zg/I0qTKJ02hKaAu/mei1ESiPonitIxRCSCzZ33tjPq2dPsyEjI2bHfgOwRXn4CbHgY5kMBYJaGKulP2YsX+z9gYfm98vAcVMSRfcOSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfH1KhJz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5KUX027674
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 04:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMzD/1x6I5Sm3TA9hm1nmCUR2NzvzpGDVrWP5NKJhvE=; b=JfH1KhJzxJhL5G1g
	Dui3e2YHuM64f9HyO0f8acVpeOmZzPIWh/rUHLjVw7x8zF8J0d+2eFPXGs7X80g7
	KOOFPeuxYNP6aIQbrcVHw/l2RoxFU1qlAsLo58ac5qtqLHuVmhgetSkIvg4cNHIN
	bFqBX3L/AliwnVNFrkCTEYqhKD5WJYTMNxGj07zUVjGqnE28zI9hDaJ6m6jxE50d
	YzOWb5t3N+yiBUGDJSMBDDqetPl3tww9TCwLLLVGVxMd2Z+rKB6n1FzA5H2nM8b5
	YllpCtBGtiCN4IbSJWNxxZdeIo2xedNkb1BExmRLMVpsN4LNaPD6BTE2/W/6DIkQ
	0cCqTQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nscm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 04:01:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so703452b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 21:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759982509; x=1760587309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMzD/1x6I5Sm3TA9hm1nmCUR2NzvzpGDVrWP5NKJhvE=;
        b=DtvmQTwJECygLJS49FiFVYv9gU2KJwQcRHZKTjeCT7WeR5Th8EBbALc4jR7mRXWskA
         Nc5GOnjBlTRq8eyfYVVFktBOTbrsih9wEpA6gEtPs+UnFtMjMNR1gvRtarL36wkLG/yB
         yzLiyiMQ/5+sBdNZy8fN2x5T/w4Gvl+CKd+02wOl4NmKf0nJKZPkmDJuHObcP7OwRnhd
         hxJP/2nKF5gW/n9qH7JycHV5QQbDZ1sfUwXSTSD8Rpe5d0GzncvifTIgMzHKqgFSX6TN
         i9srWmhNFByhPBYTAg8+jfYGdpVFdrUkiHNPj9YHey4Ojnm7DFqDPZ9wDJK5X4Unixc4
         CwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbs4UzKgqokeIWyWhk5WZp8FGy2XXvA6SX3Xz6IDXssGxrSg7qkB5nayA6/+HpGdCUP/ymr+rRM8gGcg6A@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/+TdgPsf9YQQ2+MfdnXwKVsPp16FmQL04oQ2yg52G90EY4L1
	tv14C2Lnh0R5NRrtwSghc5j8bH68apBF9RUzVjjf4p/0VBrR2Up49ig/IwB33OgA7gsPds9dQu1
	ecCmyODMWBnpyha3DSaZEdxI5NRY5W615FfSM/zlaQykZyQ9HN5IbFPZ138sjVqsmyFU3
X-Gm-Gg: ASbGncuX+/8x9ZhvjiaKJjRU6aaI30cP1v0Cl/OjIceAEnFjkJohEIoODb8oL4Lr1nU
	UZHvf9qlTocP1LxxeBiz7CVEsKftwh0cp9L2eeQOdVypKc8CGublFBOe7yFqIeoC3+iDOGDkZBS
	jEc1Z5EKjQbh0fRE1wC9Yp4yB3b6ReN7gQHXQS3ivLFhHRhWm1h85Yb5oIcabZLkf+KxGiofGvD
	51rssnpmSfJZbq+zBLXwkSmZlpdKgmPCIxl+rAhifHhAUj04C6quFt/dY+GLqp2/bItWXJbumxI
	yG8Tw/sCiyDp5m3x2ev+xqJymcXzJbuAEdcUTXqV5hxED+0BDj61E3JVKNdYGsCDvvROjbxQpYD
	7bvXxe8pt6fhXKW3/hIZEOLsHRwM2ygk=
X-Received: by 2002:a05:6a00:2e03:b0:781:e9c:2178 with SMTP id d2e1a72fcca58-79387c1ace6mr7086587b3a.31.1759982508942;
        Wed, 08 Oct 2025 21:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiVFGjSsBPmIHkzRmXqGgO1LptcNCD4ejfPklbEg0Tc6AH+hGC0RQoErXtmfjEstoRjisSow==
X-Received: by 2002:a05:6a00:2e03:b0:781:e9c:2178 with SMTP id d2e1a72fcca58-79387c1ace6mr7086543b3a.31.1759982508363;
        Wed, 08 Oct 2025 21:01:48 -0700 (PDT)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e22ab5absm1322883b3a.64.2025.10.08.21.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 21:01:47 -0700 (PDT)
Message-ID: <93491a16-0585-4c24-8ba5-0e4222efb5da@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 12:01:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound
 card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
 <20251009023341.27277-2-le.qi@oss.qualcomm.com>
 <c469ad4b-9dc0-4ded-9736-1856e44d21e3@kernel.org>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <c469ad4b-9dc0-4ded-9736-1856e44d21e3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cWubbw_U_MLRI5f9HP9cqqCqEWCXEFMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwIvktvJ3V36P
 m808ayHIQTw0njdtJZRjyeMQSrDGAkbl9Jj+cLnzhiMsn0sorexnmWcTuFOvnEXVDUd74PhbAQ0
 gkkHDH92MrfAiWzXcCT/5UcJtbNE4qGcf7RJh1ekpf/bnxksoVz4Vq6G+V/g8k/aZzTz8CjLegE
 qwnzv6U0Wg0ZUrfp5W3lkd0QgTjbDyULQ1N4LJbScU4+mmKKmNvdewiRdYgM8vjK+4JLwRER4ho
 5axayzL7CVUI5GNpqC/qLdEVh5fKUzb445BeXIPBJQfA4F/GAtX2PN4+r46dwfDnezCHibj8rpP
 X1hYV+8tTJKCe20luhiE+5tjjc6lSx26rBTBX9CWyqo38eLPilprE00mxt1m9oep5fwK59pVqpj
 9rnZiy37VOXHwYG+qhxno2H0Gj2bGQ==
X-Proofpoint-GUID: cWubbw_U_MLRI5f9HP9cqqCqEWCXEFMX
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e733ae cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=uooNEMFFsLr74DcxLqcA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/2025 10:47 AM, Krzysztof Kozlowski wrote:
> On 09/10/2025 11:33, leqi wrote:
>> Add bindings for QCS615 sound card, which looks fully
>> compatible with existing SM8250.
>>
>> Signed-off-by: leqi <le.qi@oss.qualcomm.com>
> 
> 
> Just clarifying: is "leqi" your full legal name in latin
> transliteration? It just looks a bit like login name, but of course that
> might be just my western assumptions talking.
> 
> Best regards,
> Krzysztof

Yes "leqi" is my full legal name in latin transliteration.

-- 
Thx and BRs,
leqi

