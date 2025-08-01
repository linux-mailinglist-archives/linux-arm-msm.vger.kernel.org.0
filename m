Return-Path: <linux-arm-msm+bounces-67352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C683B181CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE07B189B1AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279EC246765;
	Fri,  1 Aug 2025 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DG4aGNX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1C1C7013
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754051370; cv=none; b=tkLbgjfdup/g3pverb2obaejEDjcMXyjxU4Y9u9hhbwHvlR9nK9juO359bkYo9699xwLTlz5YRU5OFKY+Isn4MdV5NI45U51oRFGLbXBRtRmQhjNd8F+zB7utdlzMvKpakRiLESSFMy6md/1PVK1QPlKk6m+kgkd0QCDr+H0AI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754051370; c=relaxed/simple;
	bh=pbgmwZNtT9CA0LQIliQlAyv2/lGfNw6LSRHwP4f+Qk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGkGL4KGfiGVVfidtWu8sY0xb3uA0dUTtxDpmNVIGKehiSvU58tjgasbihCNHX9SoKWRXyBzSd8n3Ms0h+KbOjSInhtDansAEW2eN5dL3YJdgHrgthS27PnUlAs3tBXevUVX7l+x5Y9oH6bMgN7+dcTFLNNGXj9ikk8KmSWf19A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DG4aGNX4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718h3B0018769
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 12:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbgmwZNtT9CA0LQIliQlAyv2/lGfNw6LSRHwP4f+Qk8=; b=DG4aGNX4Hj0+cJfv
	3JiaQaXNzbMw+9bwSd/f60HYG/b6B7+MdZOE2Jmw4o4XEh7bVtiJXKmhqdVZlRvA
	3I8+lEokl5CB1gjPu15zjfrzQfAk2MBu3AFcH8npxSDPpYLbSzsHSxaDcYyQfaF9
	JAxwPr+lLxxxuDdTzQeq8V7hv7sDmB3jJsIIFbP7edWpV8W3gSuOGHKJem5AxxXQ
	MiA/MXyzN9SvMRI5D09mOgunp9g+nyx5zszCb9IHFtgIj0s311qvIzYxMf9bcBeL
	RuWjhgbn+ZDnJ/yt2WFcTIiuaLx5A2TurJvmynT3blWIEHkgcFrITPxHxFsfjCdH
	IVRqwg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwggbh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 12:29:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af0100c0b5so998671cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 05:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754051366; x=1754656166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbgmwZNtT9CA0LQIliQlAyv2/lGfNw6LSRHwP4f+Qk8=;
        b=Sv8uTYh4AfGP01txARh+cdGs/+Gq3Zb08zC9N8cIKZJC2BRE4+q9490vCeNAELmk74
         zqyQj1Au3J5YpKZwvIA1Kt/VnoMnZ3yES140Q3eZFra8mcEjzo1Dt60db1nIAnFt1kdD
         FTaDsPe+qIO0jvzTcbGQYKfHU/P8uFdVhLM/v1R/PNY1gNu4Qa9rN3ZQU8nlT6IB2VfN
         yyvsJw9NSKA/Ccsr/dfryxtvOeMSMFrnZNPvF8ggPebhPitK2ZkxR5bWGqCX7YHXp/mN
         OR4wo11753uf3VF8GKhZUGiUbxlDt6pVjqMaOUvcaG0GtMa/MQD6a8rVjZbB5+arxs7f
         yM6g==
X-Forwarded-Encrypted: i=1; AJvYcCW2p+oyYdmjyqaIS9W7XmM/rFwKubBRAJ0Cbe+bo1l0xcRmFSIhiwFNFr3a0MZyqMNbQun7+sH2phjkp++6@vger.kernel.org
X-Gm-Message-State: AOJu0YyvewDPabrkd5t3wUQZajMTG9AVbecX9Dy6lc2wjdTgvE4pGNVt
	wSHitzmX6xc9muXWcIYrVWvdYNDFU8C17R/sWNs77eaLc3akfk8xdtclb6STOItVlUVaUjYGKiq
	6SSXNdgqFwTkCXzuoZgsLq9n8MY2O6PVjH1q7j2rWfD7tnPZ7ddJuGYGkL0qb6g2+wJLm
X-Gm-Gg: ASbGncvd/Ooag4Q1cEDbwf0xjVefnkGLTPCouZPM/Pg3hzpFiK3nU/fQ1uNXzdDJRoS
	3UEfgDwYyI4m7WXSqm0euw74prQXa2GwjQz/JWqv0Cv5ngwLKLykN76j6INTZ469rpPp4zqzL4S
	bgg3pH2Eg5/zzoBDBSRasYwVrpGCtO8A9IrgI8iXit7fX0J2yWRFS+VO00+Hvz1YCV1HmJ1QsXb
	WJUOoXVrarW4ZcJt93+kuqDbLku+80Fo1oTXOxeRU+QASUji/xbHSXWvWc09KzSd+gyt0s2zeA/
	UV4wH23sOUbrgw32KdnS/nb4fyH8ry/l9Hr03b/gL+2Nt0/olRY/MLs5BLTtk2qWofOHp1s+gU7
	d5KSkV0rsTVtmBnRHEQ==
X-Received: by 2002:ac8:5705:0:b0:4ab:5d26:db88 with SMTP id d75a77b69052e-4aedb94316emr87971161cf.3.1754051366301;
        Fri, 01 Aug 2025 05:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8q92C2Wo6neQzzml5bgsNfb0UtuzxKP8kk0JsYE01X/PsK4FmcyVYqJWR7viitVa/ixIFrA==
X-Received: by 2002:ac8:5705:0:b0:4ab:5d26:db88 with SMTP id d75a77b69052e-4aedb94316emr87970691cf.3.1754051365732;
        Fri, 01 Aug 2025 05:29:25 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c06bsm280116566b.119.2025.08.01.05.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 05:29:25 -0700 (PDT)
Message-ID: <0cf8f99c-a64b-43c4-a747-d5dd6fe28996@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 14:29:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: aliceryhl@google.com, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, ebiggers@google.com,
        ilpo.jarvinen@linux.intel.com, joel.granados@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org, len.brown@intel.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lossin@kernel.org, mingo@kernel.org, ojeda@kernel.org, robh@kernel.org,
        sfr@canb.auug.org.au, vanyang@smail.nju.edu.cn,
        viro@zeniv.linux.org.uk
References: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
 <20250706034303.5404-1-mitltlatltl@gmail.com>
 <f2f0f25b-40b0-452c-ad9e-01b84b32e163@oss.qualcomm.com>
 <CAH2e8h6XWAz-pqmuvzK8JqOb=ggiDGb2U3TvAR2+43D_zdsZpQ@mail.gmail.com>
 <9efafa16-e6db-4227-9b47-5803f5933a7d@oss.qualcomm.com>
 <CAH2e8h5Eov+827X3W_EZSHRoaUHgP119fXJA+WEUdmdJ6f3gkg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h5Eov+827X3W_EZSHRoaUHgP119fXJA+WEUdmdJ6f3gkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688cb327 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=78uhRy8ZE0Nw9m-UYXkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Fx6VdeQLWdB4vu4c2vwMINIcFYjplUH3
X-Proofpoint-GUID: Fx6VdeQLWdB4vu4c2vwMINIcFYjplUH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA5NCBTYWx0ZWRfX5TSy9dGaHq69
 mXPQT+xfhpqMQ4GTG4fAWUWM5m38uzXjK5QvUq2LtjgFC+ozD4yniZ3y/W+mn/dufZjKjr+oL4u
 iXpCLYe4GcFUCtHmUFUfR/eV29qhG3BotJYyL9V/qZjRO38mHGura6gmSmjN4X1bNhUNPVOnjLQ
 Wp5QrPf9gGTQfywkvBEaJTuaEDuCtZGloF5/4FtaTa3QFSPqfxI5hzlJNLOwEmcrSoms1WfqUIT
 1LEv+87Y+SLgTnr6CUvRfZx1ZUssnFYswqQSarnrO+I6nAuG1hIAxpSK9Olavsg/0BeERmrjRLb
 XXTJQ7H+KDmfTgmkavrJvBigKtNM9Xfl8YJX1QB/Tfl/tbRZ7+79laWLxH4qOkKxUPrWyVx09KN
 JMOafera3sLVfr1BLA8x8oR6hwi1PhhixZQRnGS1eyn+/9ZahNyRsJAa1LYcKpom2uPIRfPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010094

On 7/31/25 5:05 AM, Pengyu Luo wrote:
> Linux:
>> ae94000 20050001 000001f3 0000000b dddd1011
>> ae94010 00009130 31211101 3e2e1e0e 00001900
>> ae94020 00000000 05190019 064c000c 065f0528
>> ae94030 00060000 00000000 00040000 14000000
>> ae94040 06100006 00003c2c 00001000 00000008
> Windows:
>> ae94000 20050001 000001f7 00000008 00001010
>> ae94010 00009130 31211101 3e2e1e0e 00001900
>> ae94020 00000000 05320032 064c000c 065f0551
>> ae94030 000c0000 00000000 00040000 14000000
>> ae94040 00100008 00013c2c 9bb9b000 00000004

0xae94008 differs, bits 0 and 1 say that the cmd mode engine
is busy doing something (did you set MIPI_DSI_MODE_VIDEO?)

0xae94024 says:
Linux:
ACTIVE_H_END=1305
ACTIVE_H_START=25
Windows:
ACTIVE_H_END=1330
ACTIVE_H_START=50

0xae9402c:
Linux:
VTOTAL=1631
HTOTAL=1320
Windows:
VTOTAL=1631
HTOTAL=1361

0xae94030:
Linux:
HS_END=6
Windows:
HS_END=12

0xae94040:
Linux:
RGB565 (16 bpp)
bits 25/26 are "set RGB888 for DSI1 stream"
Windows:
RGB888 (24 bpp)

(suggesting your panel driver is wrong)

0xae94044:
you may want to move the

/* Always insert DCS command */
data |= DSI_CMD_CFG1_INSERT_DCS_COMMAND;
dsi_write(msm_host, REG_DSI_CMD_CFG1, data);

in dsi_host.c out of the if (!video), not sure if it's correct
but that's what Windows seems to be setting

The other differences are due to the current DCS command(s) being
processed


Hope this helps

Konrad

