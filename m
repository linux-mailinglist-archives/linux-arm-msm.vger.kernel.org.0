Return-Path: <linux-arm-msm+bounces-77241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F35BDAA02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7704A4E4C5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24C92D876F;
	Tue, 14 Oct 2025 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2YPznHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C228C5D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760459712; cv=none; b=EClZdcu0CZcWfHv7WcmW4RQfI9S1vZE3xhm2QvHb9s2R5ar6EfcIGZoXv8nbBx8o/u5bBynIflgFG7PKAViv1DAMAOreVCrDFe/21IOT/BeTd5kUseSksmqE6KzFOEaI6cxDrUP/wpn+EbnaWwOBo+uILz2S/qcZf0RUGrAhlFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760459712; c=relaxed/simple;
	bh=pi+ESWw1hsDD1PyAqUTw5E6xDuDWQISRFLnfGQnNl6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0S1gdf279ka2oxiJFPnsePpj/VPok3qel8droGI9YenXKMchpf/nvC/XI3n+9Y2GaB2YphtPQ5hz+EHRtpaGSVJID48HYgwsc1/qs78wZxLFK4CEnAZ6/E3m0eC37q/SLUOmKEwfwHuNAryJtHU1G6H/D013uhCDdCcoP1wkjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2YPznHm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EGRHrd025659
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snYkfWqfbWC5mdg1cRDeyos/lJ07Ei5Te1azJy/eYc4=; b=e2YPznHmUEXe+1qv
	hw9RRgrE5C6wGvmchfJi+gKWaJolBVB4TMdyserb0s7ZfeMzmNJpGJpkDc3HYHHY
	VkM4zXhzc76yHpb2CF6U6wZlffSYAtALT+SEjQTX0RzuJ5TZ+AJKoTpBjp3r47a6
	ykzg6fzrkxWlE2pVkSstFwVQ1+KAW7rhHgx8sD5l7IzLivRtTtirw/knlnn5eFyB
	Hsw3Jo067KQxi2O2inaDSCpnRkv6GIqof7Ow56NudKWKIPB6fmzDXd09LFFC3vIU
	IuDfALyvC26ne1qD0GC9qIGQ4VxoUHbJ0RH2TvLR2VIglZ6kiXklM6B4dBlaLwMG
	CWjHOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg14md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:35:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-335276a711cso12132648a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760459703; x=1761064503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snYkfWqfbWC5mdg1cRDeyos/lJ07Ei5Te1azJy/eYc4=;
        b=cyOO2SCybXA0W/F0+13CxV1CbxI2/7euABq9rKxDJDrZ9U6D6THAXWBbmVGneti071
         hc1pWLaHI8uzrXU1x8GmyK4WXtqYOTyQlv+BPPLeik4Ur+9ZE7Q2VwGEvUSbU2XDmSm9
         mygG7bFCPNdiefUGF3JinoxgiA81Xra5GtpI4k7pc+0v9maYkwVZAeALy9yZdydkQ4Wa
         5m6+kwq93hWb8IAzdzMC4/D8E5VSiVDD0NXFulg4ns6xQA641mbHHVXc8kD12e2XbxK3
         /IzOePKo8/iHLRlLGsGv8/DquaBw9FC5FRgKg7TfLqWkO8oZbKq/+aTLNbNETkg9Gu0P
         pOOw==
X-Forwarded-Encrypted: i=1; AJvYcCXRkiqVp+CcOJDgJ8q7o2yIfnJGcbwwWa219lMCO4gIrLkpu0jRHVwzKhfCeQlEwo/H749bCzUFj5tJFtcu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5LeHQcFW59SA3ymEs4bVpH3ONbRJchKFMwtYm4a20esDFrtgZ
	gpcwXlSptVEVCNXQtXSjMsKEnIYmGJyr3lW8/7/h0DCMbzUrPxt3CudnioiXTItYsxDfz6+WXEQ
	GK/izP2GWYAILyk8DmXJlrrqsuq6hJuHrSETxjxhL1Ukd2kkcte0h7tZCp33UG6r/okvF
X-Gm-Gg: ASbGncsETI11DjhG3+qOLWbEsxlKefmOMDvSSs0NJGjqeoS9MqLWTr9TFqwZR6bv3KI
	b88q1JRRraBPmZe4CPTpOoLwAVDliZAXPsGSzNrdZQH2F7a509S1w7SbM9FRcfDdpZIIP6RrFOP
	nRah2gBfhkLSR4GNeoWMedwz2zP349rle1W2MNOHHQGcC0QPwV1pKb+1jZlJpJmWXIsi0V1gUYe
	7ArEZyh/vHcoMG3un3fLEsozyHMT6nboC3j//Ji9Vc+Pks2eVsj0BcVk2NHCJI6D7qvY7JL2D/t
	Wyaurd81DxTkAi4a7XHI0BC4dNVnN5gwLeRPMN8CQ3oKkIX62c+Kbre8EneRiI1c8gwBaKRuWer
	h0aodbjB/0LZBOg==
X-Received: by 2002:a17:90b:1e06:b0:32e:936f:ad7 with SMTP id 98e67ed59e1d1-33b513a1e9fmr35677882a91.27.1760459703290;
        Tue, 14 Oct 2025 09:35:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1IKYgXAviHSRtI5+avVntlXW719Omnbzy36XJd129skhFxQ6xsLsOPzgf/9YPV2w3jXFY6g==
X-Received: by 2002:a17:90b:1e06:b0:32e:936f:ad7 with SMTP id 98e67ed59e1d1-33b513a1e9fmr35677862a91.27.1760459702839;
        Tue, 14 Oct 2025 09:35:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67de1d6227sm2429381a12.46.2025.10.14.09.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:35:02 -0700 (PDT)
Message-ID: <85ecbf95-17f7-4b04-842a-ce7a20877152@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:35:01 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Ensure entry belongs to DBC in
 qaic_perf_stats_bo_ioctl()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX+miukgM3SpC7
 0j2qWkBC5+ueydXYr9f3hG32aUrPBYppjcgKia1pmdoks6qoEUdpj2qaEv77u2WmrWZXvuT48Ik
 5uoroTq3NpoT6LBGxQdFRaTu7qOfv5K3+fTUsYpVCedBbjCIBTKvU3MQOl2GD0AzO+hvZY9cvpD
 zThWGlonHhK3DzpnhxpvIZnQ4uYBRam0HpgYTAXpoAl8ZaqUC5xMZeOQIU5I4+1jlKX/88QSulE
 epmM/ZvUkYecWfDIuNCWylOaMxQiqLta4mhZKGifGYNPoPxtfH8NHTcrPec56OXnXYtq6GuNJ4f
 /cHg9iiXsd3aSBmV2T5nzjvMQqzuuiQxhigU5sy9hrXkc5k5NmD1Q9X7KeCd0aV/8CQmjAqomL0
 uMyxzi0+WaCfHap19n6Mbs+ogp8cBA==
X-Proofpoint-GUID: ml0COElOedchcf-K937VT9Z3J_NBGmJf
X-Proofpoint-ORIG-GUID: ml0COElOedchcf-K937VT9Z3J_NBGmJf
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee7bb8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZyNJWp81KiKnRxZMCyUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On 10/7/2025 4:12 PM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> struct qaic_perf_stats is defined to have a DBC specified in the header,
> followed by struct qaic_perf_stats_entry instances, each pointing to a BO
> that is associated with the DBC. Currently, qaic_perf_stats_bo_ioctl() does
> not check if the entries belong to the DBC specified in the header.
> Therefore, add checks to ensure that each entry in the request is sliced
> and belongs to hdr.dbc_id.
> 
> Co-developed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

