Return-Path: <linux-arm-msm+bounces-95761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COgiC/iqqmnjVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:22:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1E321E9DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D32013003823
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 10:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C5A37189E;
	Fri,  6 Mar 2026 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRuHzsMB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkLmLHoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90BB33B6D1
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 10:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792521; cv=none; b=Qk3V4AJgjRtd2kKO/G4EkM/PYpUe9KmZngD/a72jfQ96Wt4J4/GDKRChm7FcZ4Vu99KmMC+zlCKL9eWaWVIVtXuI9tpUVDRDOflq1X+8p8IDMqaxMo8bAqgOb8PCesSq+hSmKT36alye9TiOFwKuxFiqCSoT7BE4DDVH3cJCKlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792521; c=relaxed/simple;
	bh=zEUVZfvol4G2Gu8x9UPYWCficCsejqxUt5YH69mxdgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL16c2w+uEizpy0CfXt0Hy5mm9jrft9pf4wjStXWiLJxLyqmJYXzMCw8PS9iNRXjVfpFDrgF5BtxRZ2CpjQ8LkV32GUrngaNoG4wj7XrEWaHfBRp698pXghPIRHkGCqChU7MF3kJjEKQX0XLKh+SQgF16d42K779qKdoF4Yy7/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRuHzsMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkLmLHoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626A38121087356
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 10:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wz/G6pIcGzUXqImwOHN+SRnsHkmtJI/E8Bl+l6suG/Y=; b=QRuHzsMB6ejFuCNR
	uv4Xki46Vx2Eeps0zF/VafV0n5SBtF8MHA2jq6B9awW+VviYhp3Qqjyh+rYoZhMc
	Yw5U0rN/m94pFKNLRxTRFrpV3xrhWYTpgdDmFAAjhy9GjPI6z7Dr0RW2mtfkcKB7
	Mupwstj5dm4r17uzM3jmN0cqBA1cgLfi5t6vcNELbVyIB0ry6+aCNxR6C+S8LvQd
	zoKaJ+KxepGz8LmkTlKJAbyTF0B8jpyB/X+EBG79xnZ7K7VulXlH0aCu4OKKYeh6
	3N9L3ufCGp38fEIctBTv/PAEMcqVy9I67Z+wXk6EjasMyMZ0keDimgP34v3S4CXq
	aT7Msg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6ar40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:21:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae669a8ff1so157627975ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772792518; x=1773397318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wz/G6pIcGzUXqImwOHN+SRnsHkmtJI/E8Bl+l6suG/Y=;
        b=XkLmLHoBI4OdaIhkNwvCFGfBIvPnTgixRVaEcbCwYBJ6bvtoe7yJ7lqC+XrdeFSB4y
         bpgGXqjtpnsZz3APpfnZLEN5wFIwiqcoXbZ9vvrZrMAdJO4kmlFRmOLT3olIMQWtElFm
         ribpSzFzEI3fDpTYbkll+kjlTRNSjaExdoMsLNKRHlQE1/m86WcaiW5SySo9GeI3mVFK
         PuSBqFw+RX/YTsf9pe/FAIWqYGou6IWWzVGbesj8eM7SfOE1t9jRlZVutQZCV+DVKMDA
         6yIndT1ZnfDna7Ta9yoh+/Rlr5cTNIox+YA4ArwDNciHnWGnsK8YyAxXaxR3eN4z35bQ
         Cryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792518; x=1773397318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz/G6pIcGzUXqImwOHN+SRnsHkmtJI/E8Bl+l6suG/Y=;
        b=ICyfFI5y6f6IwMV3GNoJ1fa2m4qaeEZKzyumov0sB21rPk27zEM/UqoxyAO+WTtTTx
         9NKbNYKZk/jpQx1r3bdTB1Ngg5CeAfyZmJdRQQfxRGVmPWeBoTTs9p8wbQxTa57PdUUW
         M3/TDwIRrc2uJ1Tg5xzz+O1DLPLUJwMzB4rhHSrW7PXqG/iJuoO8TT48ZmUog6gp2bD1
         qA+MOg+8GCaBuF0UPAMz7UFFcc1h0/aR3zRoMmDkf9tkp7qK/XFMXOXPJwi2DOZLksnc
         Woci3yuRH1yMOaG935zEQiD6uHsX8coYsfdpEGrU8QDH2MkAH5Ri7wjHJZQPHqr7Cadw
         7KbA==
X-Forwarded-Encrypted: i=1; AJvYcCXHKCa7HrEVTDp2Uvy03tHHrrdCxFuSdLtWy0E3sqAcDc0HGKVE6m/0bUZf79eeLan9opibmGR4DWKNfXjt@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9yPxt4D8qkhhpNhRr1lh1ML1bwKXNDsnI8DVUh+5h26uBhzS
	dM/fOKbohmWII/VjGKj4YX9B93Y0X37sN4A0hrPpEW5Z0H477M5T+WpQfFYk4eC12jnYeW7tupz
	kBtYJ6/wb6EVVt+r/D1N4ZdbnbjZBvvqQErSQrh58diowa+RgOE7UKRTMF3BFqMrxNtBF
X-Gm-Gg: ATEYQzw7vYqh+MMx0Hh4H8oPNsBSfolbFiPxKfRoOidbPkHWiY7W+CtK0H/IGLaM1c5
	oL6YjnEqxWBQAhlbXlxUpW/UZABf6/6rTw1vMJ19eQgCuVYZjKOZQwTgiSfcOMYh5WBsUvO9hlR
	mx/iQPYUoOpf/mQO6WDW6lvDMctoC2vf6q67lRY5drS8eRX2Ijo/eQMhEfAREfrmuaJtRM7hBGb
	qo7Yf+rBqpU5KriDDZ6Nwqb4TBQVcQspDhXqeCUt/x1v02S6z3GDHXL51RnWhZgLiUu+2JPjgBl
	9w3PI0IX2FQXcqR30mRIhag1tjtaP4lZ7S8lChi4HU8Xq86loyH6UyC31jLAGU+IBEG/KRWljXY
	EwI6Ib5C8r5R62ZHeiCdh7aMXPWlHUvZeSOsvYqR8BFG3bWZ9Tpv8mikPswW0SRwVT/fO46qqcs
	sVXRyoaWJrYps=
X-Received: by 2002:a17:903:2441:b0:2ae:4fdb:d596 with SMTP id d9443c01a7336-2ae82367db1mr19360685ad.11.1772792518196;
        Fri, 06 Mar 2026 02:21:58 -0800 (PST)
X-Received: by 2002:a17:903:2441:b0:2ae:4fdb:d596 with SMTP id d9443c01a7336-2ae82367db1mr19360355ad.11.1772792517552;
        Fri, 06 Mar 2026 02:21:57 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c8171sm18614755ad.89.2026.03.06.02.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:21:56 -0800 (PST)
Message-ID: <2ca7cd98-796a-4e1d-a4cf-acbb8ffe22af@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 18:21:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
To: Mike Leach <Mike.Leach@arm.com>, Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki Poulose <Suzuki.Poulose@arm.com>,
        James Clark
 <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        nd <nd@arm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
 <20260223-enable-byte-cntr-for-ctcu-v13-7-9cb44178b250@oss.qualcomm.com>
 <PAVPR08MB967411CF6B2247456F362AC58C7AA@PAVPR08MB9674.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <PAVPR08MB967411CF6B2247456F362AC58C7AA@PAVPR08MB9674.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dG2XwVzCvWA07tZTf1jvLWNbXA70aaUx
X-Proofpoint-ORIG-GUID: dG2XwVzCvWA07tZTf1jvLWNbXA70aaUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5OCBTYWx0ZWRfXyY4zow/OHR71
 JOTcWx5F/hOc8ndcEItlbW+6k5uktbJWlRwmSTigjGDZ9/kY4YgpFiO4W/QQchjdBjoDPolqXnc
 ykvM+l794j3VPLuRxTvUKEKlEmjirOz9UlkdWKRUeH5lYw9hzJF0X7ayZ8HjgC/QrB8pfjT5l1x
 FNq3DXY7YAq3KMPPkhCJXaqVRMVJepRUQSDyqpCIWm63gvUx/25AFWL2r3elEHIGfAovFA7JAsZ
 lT+18eB08qMr2jgNgjE3Rx0QgaedPD1KCAhvz/RGZX0GydxdEbSEQEZXmSqNPgKbmtMnOoOJBW4
 yLDdOl1lRqFnMjh32WJ1yWaXG+9aanppziRoy2dttVK+le0X46lzbuSemxrJXs4e9qcUhTrgmgn
 huR2RhiG5saZtPXQpE0Am9Nt6Jo1rneHv9mwusKcnnJYDNB8lSzYIce//3QgaWDU/F3L5oLOJWa
 AXYr13CV+wuX+hK1b4A==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaaac6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=7p5ZsVVZITTIZxtcy0gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060098
X-Rspamd-Queue-Id: 0F1E321E9DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95761-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/6/2026 5:44 PM, Mike Leach wrote:
> 
> Hi,
>> -----Original Message-----
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>> Sent: Monday, February 23, 2026 6:56 AM
>> To: Suzuki Poulose <Suzuki.Poulose@arm.com>; Mike Leach
>> <Mike.Leach@arm.com>; James Clark <james.clark@linaro.org>; Alexander
>> Shishkin <alexander.shishkin@linux.intel.com>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Tingwei Zhang
>> <tingwei.zhang@oss.qualcomm.com>; Mao Jinlong
>> <jinlong.mao@oss.qualcomm.com>; Bjorn Andersson
>> <andersson@kernel.org>; Konrad Dybcio <konradybcio@kernel.org>
>> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org;
>> devicetree@vger.kernel.org; Jie Gan <jie.gan@oss.qualcomm.com>
>> Subject: [PATCH v13 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops with
>> tmc sysfs file_ops
>>
>> Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
>> is enabled.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c | 53
>> +++++++++++++++++++++++-
>>   1 file changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 32ca2ec994de..6486bdafdddc 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -31,6 +31,7 @@
>>
>>   #include "coresight-priv.h"
>>   #include "coresight-tmc.h"
>> +#include "coresight-ctcu.h"
>>
>>   DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
>>   DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
>> @@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct
>> tmc_drvdata *drvdata)
>>   	return 0;
>>   }
>>
>> +/* Return the byte-cntr's tmc_sysfs_ops if in using */
>> +static const struct tmc_sysfs_ops *tmc_get_byte_cntr_sysfs_ops(struct
>> tmc_drvdata *drvdata)
>> +{
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	struct ctcu_drvdata *ctcu_drvdata;
>> +	struct coresight_device *ctcu;
>> +	int port;
>> +
>> +	ctcu = tmc_etr_get_ctcu_device(drvdata);
>> +	if (!ctcu)
>> +		return NULL;
>> +
>> +	port = coresight_get_in_port(drvdata->csdev, ctcu);
>> +	if (port < 0)
>> +		return NULL;
>> +
>> +	ctcu_drvdata = dev_get_drvdata(ctcu->dev.parent);
>> +	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
>> +	if (byte_cntr_data && byte_cntr_data->thresh_val)
>> +		return ctcu_drvdata->byte_cntr_sysfs_ops;
>> +
>> +	return NULL;
>> +}
>> +
> 
> Should be in a CTCU source file, not part of the common tmc code
> 
>>   static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>>   {
>> +	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
>>   	int ret = 0;
>>
>> +	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
>> +	if (byte_cntr_sysfs_ops) {
>> +		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
>> +		goto out;
>> +	}
>> +
>>   	if (drvdata->sysfs_ops)
>>   		ret = drvdata->sysfs_ops->read_prepare(drvdata);
>>   	else
>>   		ret = -EINVAL;
>>
> 
> I understand ctcu usage is per session & per device, but at the start of the session would it not be better to have a function in the ctcu code that takes the drvdata->sysfs_ops and substitutes the callback directly, restoring it at the end.
> 

Hi Mike,

Thanks for the suggestion. That would be a better solution, and this 
patch is no longer needed.
I will export etr_sysfs_ops in tmc header file so the CTCU driver can 
retrieve the pointer and restore to the etr_sysfs_ops.
With this solution, sysfs_ops will be switched to byte_cntr_sysfs_ops in 
ctcu_enable and restored in ctcu_disable.

Thanks,
Jie

> 
>> +out:
>>   	if (!ret)
>>   		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
>>
>> @@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata
>> *drvdata)
>>
>>   static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
>>   {
>> +	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
>>   	int ret = 0;
>>
>> +	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
>> +	if (byte_cntr_sysfs_ops) {
>> +		ret = byte_cntr_sysfs_ops->read_unprepare(drvdata);
>> +		goto out;
>> +	}
>> +
>>   	if (drvdata->sysfs_ops)
>>   		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
>>   	else
>>   		ret = -EINVAL;
>>
> 
> Again override / restore over the session.
> 
> Regards
> 
> Mike
> 
>> +out:
>>   	if (!ret)
>>   		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
>>
>> @@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file
>> *file)
>>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos,
>> size_t len,
>>   				   char **bufpp)
>>   {
>> +	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
>> +
>> +	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
>> +	if (byte_cntr_sysfs_ops)
>> +		return byte_cntr_sysfs_ops->get_trace_data(drvdata, pos,
>> len, bufpp);
>> +
>>   	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
>>   }
>>
>> @@ -297,7 +344,11 @@ static ssize_t tmc_read(struct file *file, char __user
>> *data, size_t len,
>>   		return -EFAULT;
>>   	}
>>
>> -	*ppos += actual;
>> +	if (drvdata->reading_node)
>> +		drvdata->reading_node->pos += actual;
>> +	else
>> +		*ppos += actual;
>> +
>>   	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>>
>>   	return actual;
>>
>> --
>> 2.34.1
> 


