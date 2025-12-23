Return-Path: <linux-arm-msm+bounces-86279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D7FCD7FAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 04:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D704430139B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 03:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414672C030E;
	Tue, 23 Dec 2025 03:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gn65uiMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8BiCcLB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C340A23C4F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 03:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766461112; cv=none; b=r2rQUzz159MROrl04dvJz6rsSvqrMmrSzFl0HkrCyDStBC//3meG8CABGRofm/rREjLwXqaRcn8xmP6QYJrJKqJ3t1eHT2IesmbUtPZr/6V5etRBAPU+qvUWQW0gljTYVzgWoLJXotSUbhSX00rAT14koSDdOEaZ8576HeGzQHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766461112; c=relaxed/simple;
	bh=IDq73ccTpwQ6XWUhUvSMHfGIr9CIN5j4KuGbi1/KI/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xo/cQsPkvVZ9gajS5zF6bmfPFPGA86v5Bd+BwFzRBLCkyK5Uwl6FwcKsnEKdnWJwXSd8pUW0tiv80C07cH7K9gkqj3mm8ELbBz4PuaTIHHC0SmXdoRuRBIavJjevSYbj5IOQtN3WhZ8lzmMQ14RHGVaWcgTig/+SZg5nnE+n8ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gn65uiMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8BiCcLB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN36oKW1528815
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 03:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDq73ccTpwQ6XWUhUvSMHfGIr9CIN5j4KuGbi1/KI/A=; b=Gn65uiMJMnAXpLOn
	F2ITSd6hUanyXhymbt9xqXNdg8HR0mPScWMblCpTNk5JpYLJdrOa11TUiuf97CyS
	rwowaKBjG9mTDT8S0gjFkt5g1vWZD8i0BOwauSX5fJcvEtiKgjBIVbT9L8LFu5oc
	xSvsSKs87rw1wwMo+uKOoAzS7abtcRMg538jUKZ7Xtji9relBW/Mkot+/Xp+hK/R
	0dHDgPmI1JeeKgMYPV14JBM0PPfMYkNuUsWYlMRsi77GMJLpDaD99a3emPfK3YQN
	Uk/0Td69LyncEFPszAqPkvznCCqLLvWNThmpxDwqF2BOxDvClAJRIiSIU4zt4bdK
	J6GsVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y2en0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 03:38:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso12734881a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 19:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766461109; x=1767065909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IDq73ccTpwQ6XWUhUvSMHfGIr9CIN5j4KuGbi1/KI/A=;
        b=f8BiCcLB1YaZJd7M2cbWaqXM0u5MpUPM7nUvtWCOe/DCz4u9mvI2XWikAybwDZnjho
         iO3ivri5edkrHiVxe8liPGWSQKd+AEZPKEDJZPMhIvkunPNQyvij5NJVfdhE26C6POEd
         GTU6+M92cvV18jjhdsRPVzq8BdbZBfL4JMAV9U2DeDdFiDEU4HnMBz1LiyzNec5ygEXz
         mzBdL+q66U8kpNSJqlpGCLUVe7+eHnzuh3uCpAb8tNrEGmlM2j93QdaMsHhNC4F3M8yV
         oUkxYMzX4qiI/CaV7uTEW4JF7k8XYtCovx125zSTX33cYRwxsqkz+P6y4Cj9uKbFh+ju
         wrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766461109; x=1767065909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDq73ccTpwQ6XWUhUvSMHfGIr9CIN5j4KuGbi1/KI/A=;
        b=rMa5Xk4e3jGY5RUkTkj4PqR/Z+9j32UZENoBCSag5p0hofv+58flfxLS+LXBXylYQQ
         PLAKI/LwNE+phCdZTiStfpzNFXZgA2/n1Jmn8YHmsGSl2cTWYmJQ1/nl006TOYERJ+n/
         vBWUw3Bdz74onGMVVS6/jMXzIAH/gw2AHia/FjEI8TJ0kYWLlhh/eezS2bVV8Ps6ceDl
         Y7rfR6oi/V8NouU7ly0diexOHFDsR3YkRM3IKB/q5GEAkxTphbuTmUCecgGE06Fc+lYr
         mycotZn4FqMLRhq0+2AeSqlFWui5qQtSGvFVWrOizl3rXFTw51deQEeo9d+lNU8I6ODO
         mcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+D4gAc21KnxgRt6XafbMpITkJFTZQ4S7is+f5tUFyHSIphOZUDqjXOc6Zd1uau1rzUfSrlFaKqdJRJLhg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Yu7QRcgx7x2thhFoRj6Q60D18UG3KGJSopoAL30n/7yMi1/N
	xInxrS8vz8WN6NrpCu0o+mFEqRctjjLq7ko6uktsvoW2o9Euy6JTL+lyedQ3nDsXUJ7jwapu2T9
	w5lwB4aMMfrzlct+kD4MDZOfZ2/xFAcoCzU4q4a7P72SvUKumijdgBSjQYQovAjROe1R6
X-Gm-Gg: AY/fxX4jSqsbmEb+d+GEWx/5eepyCpQTOeBtB9lZsQjUDPGfi8PoXVx57++3mCcfMiq
	FzcY+Etgaq6cRUVXuEnfBombmcENkVJw+jC/2LjFidtE+XNviAolRhl6Q3RnXX5Ij82RXIT+poG
	kQoqhyfjaJ5wmW6wvkZw5V1/IILIs9gc6smTE1ONSpE1/OWwoTOOFs+CngSD28t7TZcDU1fBZZf
	xK3ZzvZ4GcrhwqApClpE9VhU9gxgoHS5m0ZBZVEKfwbtHVXoMYEmBMBDyXuAn3gNQjrEiQaO3OV
	FS32/SizxJs9mZtYumXHgyrd6+Zju63jTP37yQPusPJRD1CIyI/MhztCgxJq4h11VZqHkLy6p14
	kjVtSBjOijCsxhlQmXkNEiiGxQef6WAJFFgTWn9KpwrnnQemeI/SwEkxpQN70adiopEsxNAJtJO
	Bgw4CrGg==
X-Received: by 2002:a05:6a20:729a:b0:344:f9e5:e9a9 with SMTP id adf61e73a8af0-376a88c8ef6mr12029200637.18.1766461109349;
        Mon, 22 Dec 2025 19:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqRk2EnrTmj79tngAq6qJVe/JAzZhABWBhAUuv9ff+6Ku3qT2YNjA7rpd9300zYVMhUaazWg==
X-Received: by 2002:a05:6a20:729a:b0:344:f9e5:e9a9 with SMTP id adf61e73a8af0-376a88c8ef6mr12029186637.18.1766461108905;
        Mon, 22 Dec 2025 19:38:28 -0800 (PST)
Received: from [10.133.33.219] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c530f72sm10298321a12.29.2025.12.22.19.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 19:38:28 -0800 (PST)
Message-ID: <b8f0e8d9-449e-4f32-832e-f1d5597ff496@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:38:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
Content-Language: en-US
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
In-Reply-To: <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a0eb6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2qjAzDyWvdJGPxEKtWQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: TSfW-L4QzAm7Eoy3qXNQRvVH9_49mupD
X-Proofpoint-GUID: TSfW-L4QzAm7Eoy3qXNQRvVH9_49mupD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAyOCBTYWx0ZWRfX7c0zRPecnuAd
 55WL1o4BeT3biYQ2c3UumrnA5sb/F5AFlq7kqkDRJjSyeDwmFMfewDFBLjCSOBdjUwv5D7IXpyL
 gsuKTsYszn4iwaj6EKvmctpd40CIOrTv7dcvmKQNzP24N1KZqe/b8rmIXfKoUPX2gkGRHawyv+N
 gf2PjBHaQoEnGHcDWqjeuhZbNgrEhhToOF9qAdpzy8cbId+Ocl6/DkOjsCBeDDw5faPGgTXpuk/
 ynWGC2qSwYa2u5zytnB2trGs+OMHbSCgVhGwfZdzMVgm3xOSah0IDXHGofGLuvvcic07Rm7KLF6
 6ZIUm96T/XPTvl5xXfFaw1KQityuDGz8ThIBeU31Cr+41mP7oLaOr7PAPSk0SO9iYT5/ucTTgAu
 UkHpj0JqYgcDNR7GpFY9wnXdy0kZbezdY7WAgumOdiQTOEHsbDdaEopdYf/+ZIe3UdwGGUY2uA2
 BwBg2//r4OZq428hdIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230028



On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>> the common components into separate files for better maintainability.
> SoMs do not share actual hardware. DTSI does not represent what looks
> similar to you, but actually common parts.
Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
has Hamoa on it. 
> Best regards,
> Krzysztof
>
>


