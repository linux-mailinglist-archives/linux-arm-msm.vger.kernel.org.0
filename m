Return-Path: <linux-arm-msm+bounces-80895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0AC44C73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 03:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF09B188ACB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 02:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0142516DEB1;
	Mon, 10 Nov 2025 02:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XunadcEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbMV/9Sw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591986A8D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762742109; cv=none; b=VE2fugtB/hfV8KLpTN56pPjrMHqju7XnAvMY4tG7DuU4AIwAHbe63YYlSuCIRACQCZ4YAH93QZ0JWwUrBtkq8GeEvCLWnEKz8URBpZUwN1CsWZ+9QRo396PBfmDSPPpp/X5l8/rshHuPNqs4WzZHimA0pkzTHH8av17M8wopv9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762742109; c=relaxed/simple;
	bh=FWvVEmepI+ORVK/x9yXbzQd4Ox1Gvv7bysnMPtT2MKA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JI803wGXly51Yu3dIAjAdQgUXT1xF8jyEo/b0teMmaDGXR2XnpIDroHpI99jLMO7oWRwMgTBlfQ7fa3qwzXEpjT7XhOsDdHV3aDJgCSvkQtnbUmwnpau7Kex3JWuQpoRJ28rn/z5Jf2+F7run9Wd5uOi9jb58gvXI0JVDxDRP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XunadcEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbMV/9Sw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9LSlEw1639796
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5D6ZGrmC52DvawP2bZ8gsaexpKm30yHpnNBshUX6AA=; b=XunadcEXMce98rG6
	uzR2LNXD8LpoFfMu48X0p4DtmAbM2Qq4rZC7EfxSBuSwpgdhWx1UFyV4x383J/3J
	B/vzaJnq1Yv/0FCbJUfbkRDh9F/kGVcjI/+mTeIrlA0BTEJ3FTfzE9+d3CPnl0vr
	Rr7gKVC0ezu8MC5iDvbeumf0kQTEH33EUMgZK5XOQUqCel3RoyizbIqVKQ+kDYlb
	jO1e+BhOt9SxwKWpNEWpoZC1CdZIU3+0yoAJXrVIFnS4mcHdIP4gUFvnrbsbDuGQ
	rlbv0VoUJGYHXDYs1QMprY7B6rrhBD4fmXioxQDcbPiwEvvFJxwp5cyAXz2AP43E
	eUgIDw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aaue0gxvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:35:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b95d06db747so2040589a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 18:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762742105; x=1763346905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K5D6ZGrmC52DvawP2bZ8gsaexpKm30yHpnNBshUX6AA=;
        b=IbMV/9SwNoX1K6cZDI6eieeuPJ2eX9dKryUybyFlbL1mGHaUWXkyD8Z0u/7pVWkHQO
         +hugrKDpgEVUGJVhCo2JDDigAe62mbTmUqenG6XmXTuPkHLVMKCr9KrfhZqKZv7Sg3Gt
         N9T4SS9xJqQW21IykKmpnnNxQCeWSJFC+KQYgRpCNI7NhMF9fm8voSn/91YeV4qd8/Pp
         IVx3IJttpEB4JElpE7pTDW54JOn1o0NEA++OruTy9GG1L3L4DyQS2gXUUDSbfJe9+kma
         InPHikudwd57ZgfBfx6IfPSAq1/YTSa6kOyiDjwrd8kK5PD+YzOefqJ242vPBK71pqsL
         SsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762742105; x=1763346905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5D6ZGrmC52DvawP2bZ8gsaexpKm30yHpnNBshUX6AA=;
        b=JBZ0n8JHWA9gDr5iItahOl9Of1E9OCQWY+BOks/9a7BIbpEOpFc9JJR1AHF1bxWE7t
         uVFLi7yglVdSJRiHjrXMm+XAuSBHWZkLNVc7I6gFldprDJdMIJqKJMbls7AKoGyxil1x
         SRnmB3yHC1aNGTX5E6eEKdwdgZMvXbCuxvDHSH+USrFgtwBZqebqZAcZBvyVltjhzk6u
         pQybc2hdhsHMmnYOhlOM7jY5dFP90eNnsWFVIJPiWElw1vsqxN7QWGtroK5mLAKq6EjO
         ZyiapJngVzIJPaEw7lxlKawuwApRO7CL1U9s4b/LiCjlEDSeGZE0jjSMOXAKEIvwPSoQ
         37eg==
X-Forwarded-Encrypted: i=1; AJvYcCUBZd7J5MCo1+oOmRCstTC3beFYw6VBLmjKqeMdG1DzZb18ow76gsPmDt3cfuDCksctqX0M9e949k8h9xO/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/3rg0yVhI+hV+4c7IO0g2Z6JYHPWd6XGdZyLf+5VBpDi955Q
	unyVXtU0rojIA7d5JsAfsUIe1+NdGBVG174kpAywj2j7BGYszGSkpVyCYvAzCB2VangJsA2k/Cy
	nVxwhv7HAN5K0KkcmztyVmtTGeNkseMaeK4zCMIZvJXDdBb2zG3465ybtip5HQx1w6SpA
X-Gm-Gg: ASbGncsOfLjrdR7Re+/b4ZWyNrRv3t5yDWD8SJxJ3nKCo4lMPbOQiLTfm705OHz+U0N
	gV8OdVOGZU9G8GaRXmLA8vc1T8nBOQuz/yCPY7GBMxGWawKjOLVwp8HPSwAcVXrev2vJiunxfqp
	05skKTuUVHcdZIgX75V+K7ef4jKYrpfiTL2qEmG5WSwwHBh87Sx7tYUWzt08TtJVUny0bCx23Xn
	qL5gfdQEnblo0Nw7LNfInSZEF7XEarxkfikHI2AW1tYpQ9jtpLDdFRZNgzTEn9zBQYUKIEJqWsr
	AOlUPIRoYTWv+vjou5sg+cjwR6AFBd+/HTsNzIksaOFUEZiDbqYVjeBCtXlY4wO2auEoq/oxTQN
	qbRtnDD/csOAtnrHaozhHLNEDGdWPROPDcX6BkEEMJb25KQ0GZgzxtVAZxwbKGk4oGPJ1bw==
X-Received: by 2002:a17:903:37d0:b0:297:f2c6:8e05 with SMTP id d9443c01a7336-297f2c68f6bmr61548895ad.6.1762742104874;
        Sun, 09 Nov 2025 18:35:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH97XC5ddthR7Ydja0T+XyG+55lI/1s75GAyjkmHkqkHI4eZFrTDzVTzip2JG43DVoRzGmkpA==
X-Received: by 2002:a17:903:37d0:b0:297:f2c6:8e05 with SMTP id d9443c01a7336-297f2c68f6bmr61548585ad.6.1762742104386;
        Sun, 09 Nov 2025 18:35:04 -0800 (PST)
Received: from [10.249.28.136] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c27a999sm3185823a91.4.2025.11.09.18.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 18:35:03 -0800 (PST)
Message-ID: <e72f3d55-9d1a-4e10-b9f6-5f1162064982@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 10:34:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
Subject: Re: [PATCH v4 1/6] media: qcom: iris: Improve format alignment for
 encoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
 <20251106-iris_encoder_enhancements-v4-1-5d6cff963f1b@oss.qualcomm.com>
 <df169cde-39db-ec6c-7294-04939575498b@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <df169cde-39db-ec6c-7294-04939575498b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0zfKf9T1qu_ALC49qL8oZIBWNdf_prDn
X-Authority-Analysis: v=2.4 cv=BfDVE7t2 c=1 sm=1 tr=0 ts=69114f59 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=WNGIKuW-4MPZ4T8x7xwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 0zfKf9T1qu_ALC49qL8oZIBWNdf_prDn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAxOSBTYWx0ZWRfX+2qywnZ+MG13
 TDH/tsAKdvykEn/WJfLF7D61wPIZpK6ggk1zvYlFzFHMRolG/swf03N3R0M6+AdCrv3MHXZUDG+
 7T+sh+FVIi8JrZJjavoZvRmW4B2uzEwEJH4R7J3VW/Zo9vqBQsfRCX3Rtp6dqLihMqPg+KA4i3L
 9VQcLN3gXA3qoMbhYZNGk4TppecZm55Qtkfk6CRQPfnGUFiHgIFfu/aIwlhG1OnVa5iVZdOFj+u
 ezkF2arviYqvVOiqCw6if9dbxKE4+MrNReUGnyoiKz/FiyXWzINUDrP+HYvQNy5Tsu2pQ33KyPx
 8bXVIXYhqpKn6yCSr716kqCVkHGlnATkyW5z4+q8Xz8V1+Kf2/GcqMxTRxZrkb3tHLEMQ5WhyIL
 pLvi1W43i/ry0SvspA3TnsCXwjELRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100019



On 2025/11/7 16:42, Dikshita Agarwal wrote:
> 
>> @@ -231,8 +230,8 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>>   			top_offset = inst->compose.top;
>>   		}
>>   	} else {
>> -		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
>> -		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
>> +		bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->enc_raw_height);
>> +		right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->enc_raw_width);
> 
> This should be move to 2nd patch where you clean the CROP offset property
> setting.
> 

It will be modified in v5.


-- 
Best Regards,
Wangao


