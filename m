Return-Path: <linux-arm-msm+bounces-53668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D95E4A82A50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92EA61B839F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75D12676DD;
	Wed,  9 Apr 2025 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFiRCzNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471F8267397
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212261; cv=none; b=ezz60uwnronUjmSb3K+WhfMt8lK08tEg9wub+Mi5J71jUpG6M/ja+dod/WVEj+8wGjIJFw6aaaQOARhSjlXW24c1c7vSBylPO7xj1ZhTcLCWlO6LeEo04nlxLGw/ziVoIBd2bfIGiIWYLJbtwF8rVgCxiXP1IAFbY1A85VphrjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212261; c=relaxed/simple;
	bh=ScU4AaLBcgyi13lPsF6xUnIcVXmb9kKcyYpSWb+beBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhIPdRxSEXuRT1KYNibdQuFxe0fTLIsCc4zpo50VcoF7GHTTpOUfHxYWI0iWMykiJS14bTYkwdeWkyJBudei7iZzc7plE8/n5Knz4zLUGdwXGRtIw/BQssZtyTMi8lzI+zJQp6pohr9Dq6wE7MPWXdrqNe2q0mECerGNqwNO0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFiRCzNG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398PX0t015007
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 15:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSEdhEE9O0vxrvoKCNZ6yKSgTtfiEfE0Zo5ss4pb3gw=; b=EFiRCzNG6/T1PPJA
	TaQUktXzRdoz8uFOk3nWY0YuaWLVIzx5OV2bfrjrPmo2bfGQUuwT0JA9o/u+eeLL
	lPkG8kjgw02LisBnRg5CTQEkJOyWpHjwi9xY+RdrYR/H6iGdMk2SZSRuxmyrzmal
	nfYBeKgs5mq8QiA36bi5lJluyr76AZkIL0em8ddACBUYA7BiWxbblGqWGTRwvMr+
	G5t/mY30G74h5IqQpLGf0h1foCMuYFDg0Kp6vmyS147vq06iSfPh5GaNxYKucDaJ
	ntqIFy6n/A597J7RCNJKzLZG0b8EMOx4F/Cjywu0xf2wtCYrqTPOTAHRBKuDr4nC
	XD5t5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbukukf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 15:24:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c544d2c34fso998659585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 08:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744212258; x=1744817058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSEdhEE9O0vxrvoKCNZ6yKSgTtfiEfE0Zo5ss4pb3gw=;
        b=g2F5LSEK+YU6nur5qGCr92aFNxCpK87qGXC/mrKl0crjt50hYujoHfocnX6/pUoi0d
         fTdA99glehGuxwyb20bKiS5RjOAVtxHcauGPMtP8Pae1xh9RakrhGACZX9ue/0qVSuxc
         U0L5JQRXvIxY0mo3NIMrL0kyKEs8qaff3HpjjULRsSlsyJm/sbH3iBYmk9Nrfn0f0E+v
         LuGFsBZn7zmiSq3Cek6BubauGplPe5FF/H18kwd1h3Ion0LME9p9gF4MqDLUlLpi4DBD
         cLDotwh6VIYbZAxvxdxr058AIH0X9MX8X0A2IHgA5lTChW3LYRKG18pM/uyDw8dtbEKi
         YdLg==
X-Forwarded-Encrypted: i=1; AJvYcCV386u+l7VeCl1ph34GZSyFUU3rMHLzmkra34p8KqSCqJdUXdy9ZLcbJEwJnWpnCtZ+DV5jtb97Mu52claZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyayJYHNKlQ+6I1EnhNm1ov58GIIuXkP6wUYA5jTHs4BhZ/XHBS
	rmFMomrikB2FdMdr0+8bUvLiaovQ3xw1Ktn3LtCC5zVAFNAWutT1mU7dKNfg8GisGqi0hfb0zXV
	ExY/t2o7KNQtk1tkk9W/BCrr3Ez4vFEMCHqvDR/u9fzJkx+7wnSOtFM3mHfbrDgDM
X-Gm-Gg: ASbGnctd7eGcSqcP/FTYjc38cdOH+VQbG8cSx/4hukXkwoGGkhPqx7ErrPrJejF4gu7
	LX66j/EEltKB2wMEuvdBRc2cbPL3YxhcVE1zc2YRNcYXnJo+kFkhYJq5GP988OwLchRjFcMc4Zz
	xwBCFYSZPuVHHu93iaNFRbs86034qw/DoTtw2SYWQUvEQ5tDz7MzAtZKi0TLA0qnk67YFi3lEYS
	obSZ9rU3ydHKyIEqgMb5ZKjb71+zO+O9r8/S6p7Yevuhx6cXUGy6BbSGmGyGEGeITgwAFjZCYhb
	fCdZoUpAXstMJesvM/t2jtbb92sKEqjE+KZBLqduN2RQ6r9uhH0kp7zp97jfCW5NGgg=
X-Received: by 2002:a05:620a:2993:b0:7c5:6396:f161 with SMTP id af79cd13be357-7c79dea5d09mr378449885a.49.1744212257991;
        Wed, 09 Apr 2025 08:24:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQkqDfpPuYUxfxue/jjgomLcIw9q6/vjQALlKCjI7C3s2CfhqPDQQmOQw7VtultNfkh28MJw==
X-Received: by 2002:a05:620a:2993:b0:7c5:6396:f161 with SMTP id af79cd13be357-7c79dea5d09mr378445585a.49.1744212257661;
        Wed, 09 Apr 2025 08:24:17 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi. [37.33.188.210])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d5078sm1922631fa.69.2025.04.09.08.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:24:16 -0700 (PDT)
Message-ID: <bcc44dcc-8b8a-427a-9a38-8dc6d59c13e3@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 18:24:18 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
 <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
 <a654d62e-502a-4a47-96c4-a44c14860e54@kernel.org>
 <767e11cd-e338-4e00-a8e7-2e15f3da84b4@oss.qualcomm.com>
 <04d90c1b-1b73-4b6a-b7fc-351754fbb16b@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <04d90c1b-1b73-4b6a-b7fc-351754fbb16b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kgCSVwWPSqg_FSisqXi5pfNiR3oV4cKQ
X-Proofpoint-ORIG-GUID: kgCSVwWPSqg_FSisqXi5pfNiR3oV4cKQ
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f69123 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=RsVwZTJSaPieSAYsOaYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090097

On 09/04/2025 09:07, Krzysztof Kozlowski wrote:
> On 08/04/2025 22:26, Dmitry Baryshkov wrote:
>>>>>>>> +          - const: qcom,sa8775p-dsi-ctrl
>>>>>>>> +          - const: qcom,mdss-dsi-ctrl
>>>>>>>
>>>>>>> Drop fallback
>>>>>>>
>>>>>>    
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
>>>>> Look at SM8750 example on the lists. Keep only front compatible.
>>>>
>>>> Why?
>>>
>>> To make things simpler and shorter.
>>
>> I'd prefer consistency. Previous platforms use qcom,mdss-dsi-ctrl.
> Then you should have objected month(s) ago when Rob asked for dropping
> fallback and since then we consistently drop it.

Well... It's still not merged. is it?
For SM8750 it kinda makes sense, because the clock handling is different 
from all other current platforms. For the existing devices... I'm not 
that sure.

> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry

