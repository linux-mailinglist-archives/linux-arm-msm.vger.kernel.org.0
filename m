Return-Path: <linux-arm-msm+bounces-73233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 803FDB5440D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B782E6874C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 07:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B14261393;
	Fri, 12 Sep 2025 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3YDGEpv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A52472B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 07:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662697; cv=none; b=LDPgJwAFDcvjFdK/zRelRmCu5O2x0Tk7KC8W+RcUAXUsm6TXpMia88DcECC/6lUunrMKzg0A/ef1TR2Nook/G5vNaq0GZKLOhG8ttHMjVe4TN1U+JK4NsaOTxf6Ccht/e1BXlhfTlpyi7NGjyLdT4xPxxFCVLGYM+OZWf2nqmik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662697; c=relaxed/simple;
	bh=PxSU16uE+Ej2HzCtdrXRq8+sKeMpJU7IORy3bAXH488=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBmgbFhm/1MBZZFb22XOiwBZWKUReivOwNnl4AMNbeMYiqW8ejIRqDgIFD81vFB8o6f0jr6wnawJT3Z6zLe61i17iMLqHZ791rVIACW05AT4LPGuxKEuKK8vrADpGcaTbioVMKFgk6a2pPVqyytJKJ7/ncv7jnXVKsYyK08Mlww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3YDGEpv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7SKTV026727
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 07:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6LFu0Fh4zfdsz13Tuo1my+OP1x2vo1Q+dpLEWcRgmcg=; b=Z3YDGEpve9wTTVnP
	3c1zqQnKAXKzqGNZXSnJ693OYIyrVZp8NPFtvdrcKyuPALjtGKxx5tBPCkVrMswT
	SzEevKd08SRnmGYzjsP4APYJ1JpbEn03YSQugATr/BB3Dg4K4P0PkzEOLwnrPNXK
	KeHmKQR3pGalKL/a3xA1gADA0CQqQ8MkWDc/XUQ2O1hUuwoBTzRKzlJe3hzCTaM9
	BazOSeb+tChzsZWuDUkW79RPBo97/3T2djMJROXX4EYpHvUmMJzv/qy8YOhxnnpp
	DSFb/bEDvPT4Vhu5HMdmWm6wS9dloeGzGpU+o2MsAaC1GLYjq0TLqyFpageF2cEm
	6bh+Ww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h5p0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 07:38:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244582bc5e4so19110495ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 00:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662693; x=1758267493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LFu0Fh4zfdsz13Tuo1my+OP1x2vo1Q+dpLEWcRgmcg=;
        b=iN2V7fRY9jH70Fgl24/8L88nuUgPJ+rDFBUA0XsuIZHHi4iTtyTYX4OJrUMFjSPUH6
         5FE59jQ+3o4sXNopzdmVVcjRQV0y21wdUxK82/dBTyC0cVlDzOSUw+ZymRL8Yv1W4HP3
         PMR2biOTj7TIhL1r7K64+qwkXPO8x7E3zRF5ArBO4XR9oV5uHUOaOuoqJqTxkKYgPbSs
         pqFyw9IA48b4uLPb2bXBm2nL93+AuNgHlRQqlIT0nPLR9nAA6qY+Zpe7kbBxnUkUcOC7
         08vZHboJBr2LGC2jb743pKqJkZ2k2T9AsBhGripBrCmebybi/+oTlQvDDE99X+betOz6
         F1Lw==
X-Gm-Message-State: AOJu0YzWEky+W9WRuhwmgVBYztkzH5+gQ6Oa2KLF7rGk/Bdoph+oTvW3
	PUYG4Z476R6P4ZJr038Niv9KXfuQBSkuIDA3g45eSTBdsk4tx/i6nM/AMRP5nsAyvPtUmfS8U4S
	JT3U1Af681kSN/8uA6HDOs2uRp79knqiuPxU7FdP6q4j6tyrtNPprhob0vBQuK405ltDt
X-Gm-Gg: ASbGnctO0XeDtTmcDXEUK53ROR+OTQPkbA0H6cf+MlVN0QAbCgGAL6ObGwenuyUjXrr
	iYOFKXZiqN1vzdaPnLFwq4TMpI4wRYrgNiHoZbDN5Nf0apwJefm7qgYNrjegSmsTUXRf706XFAc
	nSPpSwB+0SNwf6zJd5EhikwmuYcVt0Y99GJCXpEAKssFtijA638VyIADUNX4F97f36JQ6rMvK0i
	D0XXXiz+UgTeQTaYVfI/oIYPzmyhRhlFuFXPIVU6PzPXDok9gHQOc773SlJtBwFQOzuEQYgGWze
	r56tClMuKs+hyWXcQ9dNMjQ+5m4gNCCa1oECIYYN/I1hyNiEwIQg/4QZ2SO/PQE/UbI71JxZ6nC
	9XA==
X-Received: by 2002:a17:902:cece:b0:248:f653:538f with SMTP id d9443c01a7336-25d25193c98mr24576055ad.27.1757662692847;
        Fri, 12 Sep 2025 00:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8mnmJxdmy5GnWW3mwOkJg1f+1p4sXZ2EfwMYb/qI4p3TOyTx6eLJBt84nq1qMYnMbR5hhtQ==
X-Received: by 2002:a17:902:cece:b0:248:f653:538f with SMTP id d9443c01a7336-25d25193c98mr24575825ad.27.1757662692288;
        Fri, 12 Sep 2025 00:38:12 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc5890sm41341715ad.4.2025.09.12.00.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 00:38:11 -0700 (PDT)
Message-ID: <b8a3211b-6d85-4949-9de1-54614dd8d769@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 13:08:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8300 sound
 card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905142647.2566951-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <43090acb-ea36-4015-b14f-78d44d789d42@kernel.org>
 <a9507045-b900-49ee-8841-0f8fd30816ba@kernel.org>
 <abc66798-dc91-4860-b0b4-de39a58b5745@oss.qualcomm.com>
 <a8dcffa4-c578-46d7-8fdf-cd4f5a29a2a6@kernel.org>
 <4c6e7e6b-2ef4-4ea8-8bf2-26c7aa8c94b8@oss.qualcomm.com>
 <ad8fbd0c-4e94-4edd-abb3-84ee9563fac3@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ad8fbd0c-4e94-4edd-abb3-84ee9563fac3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BkhWcx5uhALBH7wFldzRUUYdz3lBa8OZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX/NgJ4W2kjnlK
 KKtHKYciF8tZFlgJHRAXWHeN51YLfpNJDZvtHU2ygbvVMDDk3d4kwK/u9S5nhrq6kq5hKjS1+bP
 HmheeIaTNu7lcRqCTyS/3J9ej/LNwyapr3qEjMPCHeLIQolONagKWCjvsZ2Z+we3ksd0ZOMcnC1
 zL0HuLgsxXNp9VAyYuPfWSaS3/zH1znuHnOhz6AqqUl/vUmzrdpAsHxoGHrJeeJmNc2yTRNopup
 /JA9qDDCTTVuxTcheT3F7w6YSREM7sr+W56FbOWk9QiVKXzqpaMvIXuBLSISoC/Rz6YnY39Q0Ns
 oC6mSlCTUgRwAZEGtFkWAEu1dzMkYHtUY9FMKaEsCwtEiux03vi8nL89vNbDr0+Gak3KV8UNyZV
 fO08CgcU
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c3cde5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=d966o2na1F7DTwhL2BsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: BkhWcx5uhALBH7wFldzRUUYdz3lBa8OZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_02,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177



On 9/10/2025 4:54 PM, Krzysztof Kozlowski wrote:
> On 10/09/2025 13:17, Mohammad Rafi Shaik wrote:
>>>
>>> So this is the same hardware? Then no, we do not rename compatibles.
>>>
>>
>> Agree, the existing compatible is discontinued naming convention,
>> will remove existing qcs8275 and go with qcs8300.
>>
> 
> That would be a rename, so again "no, we do not rename compatibles".
> 
> You are stuck with qcs8275.
> 
ACK,

will drop the Renaming compatible string change.

Instead of renaming the compatible string, will go with the existing 
compatible and fix the driver match data by updating the driver name. 
This approach allows us to continue using the same compatible as 
"qcs8275-sndcard".

will update the driver match data name to QCS8300 to load the correct 
sound topology and ALSA UCM configuration files, which are added under 
the actual SoC QCS8300 directory in linux-firmware.

Thanks & regards,
Rafi.

> Best regards,
> Krzysztof


