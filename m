Return-Path: <linux-arm-msm+bounces-106892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEaiHKmwAWoeigEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:34:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1850BF36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3FE83001592
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430BB2DCF61;
	Mon, 11 May 2026 10:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/+Syyko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGLWMtsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9CC3D8115
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495651; cv=none; b=uqNVZSw2tZQePwQ23sXhHpxEqlNKL1FovTlMbFRPRG5f3BwlOxyUjxxYIVntv1XkG/tbkaHkCckMh7b9+NJQk24f9TpP6lkD4nCbSjmwzRMbdi2OxgEqkWXJvTCKZq4BTXy5JBMufryEEbNDj5oxi00aBIdwKztPZk7bDiUTSZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495651; c=relaxed/simple;
	bh=Zzc/LyNUJmfRTRvy7NnUzglQq+z8kfXz7t/DNL1P4QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+sifHZM1C8D5SccF7Q6WgGMjt+V+Ptwo89E7O2vUZgV7nP7qQDrxmEEF8t5MgXr2Bs+N8JkPuypfYJbK1Pku8jYRiHx0KmVOAkCLwFmNRlIrrT2LkK+Ww0XzrB8IWksMYz1aFYuTqJoiX8A480MvDE4mTrF1FEdcG3xA2QzWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/+Syyko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGLWMtsW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B79DlK2575028
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=; b=a/+Syykoy6NyxKKe
	tRHW/qjzYLVM7MUxvRiEUlyquwszHORcQ12vZta7kuZDi8y4jF91gzpYIfWBmGIL
	7N1vqgtThulkLSvFzjqCQj0cgNcOvTTBd+Epm7laV3yIlDPLa3dHOUuIMpjzXdxX
	rhnmQvcfFiy6tmqMPTJstAkPuIRQgbsROPJhRqPm/LUL/YETyfrxfC/0WFNJXeOv
	BKKX06EvobnhoeIEE/ZwVEmgtktwdz3viTPN0EgHgP0n4i+R3UvoCfHRVgqECts/
	raG94Nsgo96CnAb2sMOtFJURjYOITaYOP1ObEMWSMEiMVykZESD0Pe0PmF5giD5+
	DfHbCA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79ngkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 10:34:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5753c3390b3so368389e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778495648; x=1779100448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=;
        b=gGLWMtsW+I3O+M0F4vqTVhpX7reBDf3u3VyJXmaOtQxBj79nvOjUAty1uQfI3ZuV2f
         2cbwwqh+Vrv1Mz80wVxkIIvg5Li+yRsQR1/gjuq5fuPp5MQxA+xmL2cuDZnkPYMJteGa
         IW/ySRsfST2GX7tNLNFI6UGx/zvUtswfXiO6x6VDSQRYVwlFzg39jRPT8DvYys7z8c05
         hHOaMlQCHjFTxMHiBMuLvnODfcBFG2rt1WYCAozG6pn/nJgEF5eCCrWxjqKIst5v8TME
         Qr53MxsDkUz6NzKxPJiM4GUmZLpw10ezSh0f7bma7tkxDskXUKkOV4DkRRFHgDaE3Dam
         aFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495648; x=1779100448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=;
        b=kTOTpI9rg9Wrc7qygx1L4+iY+fkt9GNLdEtb1l3C4luUBuq45IEbxpN2Uc7azcsWph
         whPQGLbuuhWKjT+KiaBqIjwaAaPuLOag5NYj4YVHOPBfqXpmQhfmRfcKuiYyo4tvdr8r
         4ZvBNdVUXgoCgnZYJJSIEY6/EIdMeh2dK1VeP43o3MRuPzjTOEOH9RsPzzAn3xNt0R34
         qknAQ5r1ZmpMOS4Wz603jCnO5EhgTJ4TlKOL3U++IUK9rPDXB25Fckp7f6h7qiupvIYa
         Yfa7AHOadzLnPsrBm/Byi9Mi67GmeqlriS6goXigft2RxEh3N4AJwvbYaB4Tz3nJzJnT
         WF7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9B7qwingo6JXBI7yKNXOLyKJWK+UykKtOz4+87fdkZCCRZZYBLu6OCG/Oe5LMmRBbeWas/rzDO8PdUXDDm@vger.kernel.org
X-Gm-Message-State: AOJu0YyJb7fg96T37HrmrQNIIQdNcV63gTTIpNiIsUoy4Tua0Nq3s+YO
	yBIJfkgpF1GmqBueX+UPVig+F6YMzPxXaONtq7ywAnTE0twGhY+V3GJuokhMbG1z0x+WfdFAqQi
	+2gWmcbE4l5bR5aSwp1hKyG2bdRCMpbxfH7hYGpRbuoHfJ050P9KM/9MvXajlhEVVtcQ2
X-Gm-Gg: Acq92OF4CUWl7/1DFGEChBTVXUeGUbAmh1uapqdAorkei7L6HxUtc2yPl22oaj4571+
	xpGxLFrf4F5Vpj8lAcrbuMihtxKW8gWXn0pndI/cq/IVsbIBEMKY0RzMQND4XfQPGs4q75cAaSP
	8Z/k7BXbkxkkycKScBG9j1EFWamYaIaqjX1jgLCsXe2q08EzlI2CkHYC2yt9dBSqrqDBbpjMq9V
	VDqnLDviniUldftZAzARyQpqv247o3VCFN7McCn9y+GhtkzjTWxaq8pVF+hyYQdyWEb9a1pnt1L
	ogq0pZyvqgjrXnH4V7ghHkI85jvXTPF7u4oV2Oz7KWMXiFgRqPnVz5JXYcRuveqbC2QnmRc/94V
	ObSQM+/Xg/46HS8qGTxRtnbu2zvRSs8YpMEV5NQBsDLNbvnvBo9G8poP1vihQTrKCCLJu8GDqnT
	Anqxo=
X-Received: by 2002:a05:6122:3291:b0:575:b506:43cd with SMTP id 71dfb90a1353d-575b50646edmr791740e0c.1.1778495648235;
        Mon, 11 May 2026 03:34:08 -0700 (PDT)
X-Received: by 2002:a05:6122:3291:b0:575:b506:43cd with SMTP id 71dfb90a1353d-575b50646edmr791732e0c.1.1778495647819;
        Mon, 11 May 2026 03:34:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce803148e0sm208248466b.10.2026.05.11.03.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:34:07 -0700 (PDT)
Message-ID: <52bcb432-9431-4a1c-a2d8-95bd92f1f484@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:34:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] arm64: dts: qcom: agatti: add higher OPP levels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gICceTfXeOJMSjnAnNpRWrv5Y8aE1Qc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExNiBTYWx0ZWRfX5My1A+jvwT5s
 TIkrwAKCk/xrTKD21ZkNhj6CitpB4FbynOx12G8v6/AtRV++0zdiYuD67zUqK0dshwUvy/262OA
 ee4MKuQghb657V2Mkrin1AxQk3Yqs1nE0OlXcZvq/T5zgCiUbSv6xVPyTFyfTM7ObCvnBVuawdD
 3PBw0mrYi7s/4uQjXVCmDY1OFi/epeFUMlaWhX3UzgQ7Lxpy1dyRTNo+5y1sQUbZ+W3BuNxXQi5
 3ewwZEwcHSnIkrk4TA3PTMoAZXKLASI/tntydVwsxhY77ZsPpXtp+YWceCJ3EMCej2WnwIT4K6x
 syBt+7GKcIRP8POcf+AG/Dh0gSO3rcobQ3PpeqgFr5NW/zZu+GrEDUSCYiuS1zH1u/nKohu6g9R
 PryDpXmpAtiib484Nq0PSnSdQMwoeiWRwgxmeQG8vtSVzjAfsFqnek9Y4jpLS7PkBmGkz1cq7gD
 CZALZoDZwpMoO14bINA==
X-Proofpoint-GUID: gICceTfXeOJMSjnAnNpRWrv5Y8aE1Qc3
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01b0a1 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JvtetXaiP3e31RRikywA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110116
X-Rspamd-Queue-Id: 3BC1850BF36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106892-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 8:42 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Add additional OPP entries for the Agatti platform to support higher
> operating frequencies as specified in the hardware documentation.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Please add the word venus somewhere in the commit message and
title

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

