Return-Path: <linux-arm-msm+bounces-82183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AA2C678D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 06:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E13953660AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 05:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B7D2DCF72;
	Tue, 18 Nov 2025 05:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f25IPHPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTOjUvK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A3BD515
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763443337; cv=none; b=LdZOJF4vLNAMZHp6u92wDBYkfo4Nnv01sESxPHemPmzx1MXj+9/A99c2w9TRKdx6Rce2mr97p452nkEOlWMPJ5ZVPgv004xgDBqGwgnZHV0vteV+bZxHZQNCe2xyU1WuwRrzmSKQkBiCwmzBTIL/yJzAZmhIEgZ/2u72jyGfITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763443337; c=relaxed/simple;
	bh=xRSbUtDjphASPzi77zs/SWi3MvRmI4rJ7GDIFx7mpLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NivxT3VrefbtsNauV5fP+Q1KME71EQVRxAIzBgLrn0FkJO1Ei84TDTjZaEospqEnKgmEE6cDKTjeTrFL/i4Zy5uzDidDASMI9K9AZOiCX6jMJ6y/i9pU5XNVrzRuuY7fPc0zc2VRXnkZb3AnHG2EDDfHqwB3mL8uzqKT42dHTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f25IPHPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTOjUvK8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2qaOH027519
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xm3j6ZAQUkCoBb5xNFFOGfHblUIkSU7KVoSsfYylsg=; b=f25IPHPNxsWB0tYg
	nTrImnNALkjP//PXl7k1FKWxdQJ9IKkT+32JeDt27IGdsJpV4lIuzgBBb0uQpvZ8
	WJm5+cwOH7Rs7yni/FRuYytjPr4XGYHZC/yN79LIngqRsc4A4e4bF0n24D7xT9qG
	mXqXr2Zw8SXzak2GlQVK5iwTBlv9O9hO2GMKWvNl4hn+JCH1wV6jA8PZ04k8V0w5
	WwisxfSB/d3t6w2IcbiwBnNT2XoiOhfK/wZH6YRbSEvvstDlvO0Wqu0rgkhou6rW
	AwPnz+jSZ569Yf9xszj+10x/lsWCtBoEWtl+t5za0PSYz9p+ioWRBwm7SBfIkXti
	J12SaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t1v3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:22:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2980ef53fc5so87788215ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 21:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763443335; x=1764048135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xm3j6ZAQUkCoBb5xNFFOGfHblUIkSU7KVoSsfYylsg=;
        b=DTOjUvK8hdI+zykEN1xey1/jNPLOtduCVEkFDoDQqsKrplwsWwaH9HgLWKRpJOQR0X
         cNDsLWi1PfML8rPKZcBWflPnRL32GF12bFKhyoEHWKyRYy7n+uybtS4nq0rGt2v2ggcl
         NaChaK4wyIkCDZ56TdU5HRaALRn/79rqcK1JTMI+bFdYNtqHGBpRT2V/MEljMTVSl68m
         lGjHmORum1r+mfKzxshNClV+IdEU1nkB3wNyWkEQ9dqv4atbvLtm8kKepWyk2KPh1L4X
         3do7RV2XAfpS3DrUE3FEFknblHA9pRgGlh/uCytWG51jNZr7laySnbe23NI6rPoL8fA1
         yW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763443335; x=1764048135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xm3j6ZAQUkCoBb5xNFFOGfHblUIkSU7KVoSsfYylsg=;
        b=ABvdMT0X4t4twMed5jHlQN/qz8IbvyZ7T+iFHUqns1DBIAfnXiAbWW2mUywTP+1Pjn
         h13MB9OvwG3wU02G9eePt3VXgnVeLqX4mhw0pglwIlzfVLwEtMOIJ4U8cSRebi32BDPe
         6ZNM02CTxv1eVBxPJ/aBqcWyeY/adyJhu9/8YxZ2oPPHz8bHzrxIEXZHH2s5uV1iSQ33
         Ng2Jw/A/9bmMnFIVHX8inKOQPLmWv2x8cxgK4GNzFpb8mKthBfOIucRkuthRUsD6HSa/
         WTZSYdJDh/PBV0erHeuTAdZUHBL8rCCw8PvG4ZVehCOnsKUzDsUqA5f4Y4q5uE8BIVVa
         I+3w==
X-Forwarded-Encrypted: i=1; AJvYcCUM1+/RQSjzfxdfprGl5LtV3mDfSZVUIaeZ8Tzg2C8uW7gP3oNbr2TpulTB/xXPAln74L3o9kPSp1NdUVkp@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLVObNDZ1/qj0Kf8R0JouGD9iPLVLrpQo5E/iAkV9joNUfNXp
	uqur5ykyaJTe2rnngdIwSUhY1u/N6fr0i7kIYnUM83aED3oxcQLJ8vCdtgioQoh4ihhDgWfPbcW
	3TLC05N9bJW6XCrJokrB9c+yO2VguSTCPeeD6tnJOGOfZYoxpn9A2lx3K52wDbzjixuU2
X-Gm-Gg: ASbGncuV+aegnVSBnqhDs6Eia5F80qQA2/5D+5XvIn6pE6WsFyhLvALzMFm8NerpE0v
	r8njBIneaxY5ujufMFJBesGxChufwPokGQPmtAbMphmWClu2rNyl2xgW+s8tE6jJebHwMZgmmcI
	0fgxXm3mJt/dvFwrSUjc7mUbNYtFs2QpETzNmBD/8WlHHEbXEgeCggTdbtFhamRC8WLzcaDQAEi
	L0Mdsy9KcFSdgMzOcDk0458nPEdlut0YRvl5pMCJcVKJti4AodcKIdgxAWLeLuLdiTh6tRxs5S6
	dlpzn6yZPGhyDxy0EuUX2JeQV7VAZe56F8NwRUuEKlIhJKMh/ge4YfiEujMRZZJOOojFUZo/cyE
	gQH2A7bBZejO3Rs72jhcMUw6v3ZxjhPJzVA==
X-Received: by 2002:a17:903:b0d:b0:295:ac6f:c899 with SMTP id d9443c01a7336-2986a7556bemr164116625ad.47.1763443334653;
        Mon, 17 Nov 2025 21:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErawagGA4MsAgntcV3g3quJ1MdDXXJQL6I8uQOZUyaPuZsZTIqVVXR8SqrMIcDgRS+JSrbvw==
X-Received: by 2002:a17:903:b0d:b0:295:ac6f:c899 with SMTP id d9443c01a7336-2986a7556bemr164116375ad.47.1763443334170;
        Mon, 17 Nov 2025 21:22:14 -0800 (PST)
Received: from [192.168.0.171] ([49.205.253.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234870sm159705935ad.12.2025.11.17.21.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 21:22:13 -0800 (PST)
Message-ID: <2d377b6e-0ee8-4017-b0a5-f6e4e5622674@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:52:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Change psc properties message to debug level
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        =linux-kernel@vger.kernel.org
References: <20251110072429.1474615-1-busanna.reddy@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251110072429.1474615-1-busanna.reddy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA0MCBTYWx0ZWRfX0FbuE0oTEJSF
 Ku7oVKEJEFzCmXvNCUh9Ne8Wlt07Jml2ybZkursWQz2mZJhzNxrJ3mt4yiF3IrirhXKi+pnk46h
 W5oNEuByws+g3xEkBK5eak8Ae/KDhVdhiPl9kkpEz/BHPWKFUUnYAS2QzdIRU1GVq+p2LdKQeBw
 hVOgXAeG7KcvCsqTFUgjvFz3pBC3KpXrVn/vYNy8z4hj9N+z01yhT7f9JdgROF91kINrq2l9cWs
 O+TxqGKO+oXYf4pWLVhekkJEdBTsIhw/1ei3sgXAxE9Y3EPepSMf08zd5fcNq4m512uGZZ/kTkI
 U4pqQ570mqW7TOcw7YZjt4V+2Rg8xH4YgKlNS+IbOqbSEJyDpZ/H7+ZrSEphucZbHCe3Vkp1HV8
 stCPidptrdacNlZPI+u4udQ1htmFKQ==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c0287 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qKS+5dAnvCMTy05vH4hvkg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uMTuLg9HXLKMnMOSmRYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Cd_MDJN3kJkb38JiQe0-vmXhkTB-PDpo
X-Proofpoint-GUID: Cd_MDJN3kJkb38JiQe0-vmXhkTB-PDpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180040


On 11/10/2025 12:54 PM, Vishnu Reddy wrote:
> The message for attempting to set already configured input or output
> parameter subscribe change properties is not an error condition.
> Move it from error to debug level and make it more descriptive by
> indicating which specific input or output psc was already set.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 6a772db2ec33..ff29e8a4808e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -760,7 +760,7 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   
>   	if ((V4L2_TYPE_IS_OUTPUT(plane) && inst_hfi_gen2->ipsc_properties_set) ||
>   	    (V4L2_TYPE_IS_CAPTURE(plane) && inst_hfi_gen2->opsc_properties_set)) {
> -		dev_err(core->dev, "invalid plane\n");
> +		dev_dbg(core->dev, "%cPSC already set\n", V4L2_TYPE_IS_OUTPUT(plane) ? 'I' : 'O');
>   		return 0;
>   	}
>   

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>


