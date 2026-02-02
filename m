Return-Path: <linux-arm-msm+bounces-91476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKP+LumAgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:48:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00FCB2F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5E90303BB34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5941D359F87;
	Mon,  2 Feb 2026 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDkjMJNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxvL5lyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6EF2C15B5
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028906; cv=none; b=foTXqWHApDtUx1CO1uvELugDozwQgGpHkq8C9/GRF1LIz8WC+pGTGe6YQi4xb4zmhHHxdeusj1jX9T8YoWqzi3csRzyaZ/42CRVm7TsR91S6YRmqpkryCQsrqO+fx6K7X5rK5PhjG6U8qZF4ALCSXUzw+f8msqzX0tZqutJlnfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028906; c=relaxed/simple;
	bh=oUf9zQ8CeMSZMAW+LMBmwzU0xOFrgf+mSZ02+85hndg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjYop+SEOBTVm69N0zD9OjRl8vr3slwEtCyvnqrDMJsN52lJ37np566KUFikgbVcIfIsIj7nK3YUc0e6YmHmEnAXeJkp3x0DrLCnYUUoM1BTYGuymoK8CBo1JiYn/1Uzx2r+brrf5uIYHWZuHQdnCeclLs7ouGp3+eFUtOlB4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDkjMJNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxvL5lyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127wIaK1012482
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ocLd4CVAqvWZxPZdvnLgX3QCSVlIfyASqTcyrKS4es0=; b=nDkjMJNOq0AHOfJS
	jaZ09a+HH5UCMTvXkrBnluR4HCz0usIrIqqc4cabcDlaq2vPnxgPc2oyv9MEh2V1
	QYb74+n3qEXqesm4aIgw0IaHLwR/cD09FKiBT050B/LCfFo0gNl0cmOsBtb1rxoh
	XrO9zwQ8vTg2LO0wXVGyCfbmzUm5LZBsLtSt3Qaf34dOswKHj4BPiW00YwEFA+La
	NVGyIZ9Q9iC/atBU4kwdONsm5p+CasvB1WWs4LCQtcOSyQWn73o3OzNeTrefvyo/
	/MD4si0SU4MPt/9hyREtvX3nSyR/LnnkqMj1R3wPNjRuyLZoM6YMvuu6Xx31cT+C
	Kgmasg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4w4av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:41:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a8c465c1so34133405ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770028904; x=1770633704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocLd4CVAqvWZxPZdvnLgX3QCSVlIfyASqTcyrKS4es0=;
        b=YxvL5lydlQLsMC2xTwCupIn7rvFW/bw9YDcJM3VXm/X/Qq8iy7P16r72IvouFgmXWH
         aFC7fG5HJQ75razPSCS0dG2kB5VLDgIZI/a8lZSmU5NBUkIRp2W3MEvsTol6xcInah9Y
         6QYvz5yAjBmf9YAXkaUDUXxuPCUDN86exYFpkyp3JoO1qWpYvkq+Gp/wh46SCwysBRYb
         gIvrTgdtjL4QwHzVn8sT1/umRYQwm/WQ5R80Sk6RagWAWbkP9zqzeye9qXSxloe7pn+7
         ixyDTeBfgfvqWI86p6uH0P0D40aNKnWqMQ58jhcV/NBdogfIguPbgSVsneJflSIMIO5r
         DzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028904; x=1770633704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocLd4CVAqvWZxPZdvnLgX3QCSVlIfyASqTcyrKS4es0=;
        b=gJsy/eMlwxIe6bcrll0htxsNi54r3jMN3pObnzZlVkD17i+gJ+wEaMfk79JI9LQOB8
         RdI10ZGT1PXttiGzpVfFqhhDdRBOBzXspJ4mkAPWxayVG7WKtkbM9P7yWUV8WH2Fu5/u
         oSEM+NzDF4Tpoyl1vJUDjMw1xVYEfq/gqdA1zfJ55DDgpVhKI8t28//H+9uYWx3g7RLc
         9IWVam2IXqBbF3Ibo9Hqe7RXkAq+hPH/iIHJSEdVQNmBmCwAQ6fm2drGxvfzf4Pf70fA
         F1xx4IECydUsrxgM1YxqvIJP8bxosluK+uvRyehxeKt7P/+tez6SBQzDT0z310c6kLHe
         V6MA==
X-Forwarded-Encrypted: i=1; AJvYcCXL7nT3Kt0DC8GV9lH4BEqG1uh5Qcy7rbm3H8CLCPT18u4N0FK1Omgr4NRzler1Ik6XLTyvZS6fO2msR3A4@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEIemZvhAqmXX/dnXoWbJVvt7mbj8DlKtAMsXsg3Vp5D5suzy
	0AAkXnHTnRK/e53upw4waFAG4cbdqirnqELTc6NYlfOypLbhe5JBq8oxECGEv3zGwemEXoPI1Rg
	VzLGsQiDGIUJ6AKgqKtxwJ00vT70BbkBHjWEAK2d1zRqGZDj3y6V/Ku4zDYoBmdxHHsZm
X-Gm-Gg: AZuq6aKfA7BxbYpNKQPBBS7mjwFcIARPfjrMj4W2R9IwAZq8oGiAywdoB1GcBqVi3QE
	dI45IGReBcrNUY+HSOz/xssu0mHaoAPNo6wVdH617MviqUsg+sXJFX0Y6x4kebAFczn6rTGj1no
	Q/Z4UZs7E5cH+uc1r+NxhcHe7UcYQkth7eCVgRsRfU2fL1CQ0b9NJtnThAanrGghEzyMSUKg2ft
	qC3oWcxq3q90ly552hIPqXk6mWFifhO5HLMMJ+Cz9O6Q9PpRpdAHIUaa5bJH+RTLA8CVX5LQTei
	MDlFG0iGAGylloZLUTshDc9gG4Sivojio9CCOqUVYNY8FPsw2eqzcMiRk32/u3Ig3JF0KQOLacZ
	Y6fgoCk9a/QmcfGyMccrNboIq88NY0iihR5OgGUxSbw==
X-Received: by 2002:a17:903:32c8:b0:2a9:db7:4475 with SMTP id d9443c01a7336-2a90db74615mr31708345ad.1.1770028903575;
        Mon, 02 Feb 2026 02:41:43 -0800 (PST)
X-Received: by 2002:a17:903:32c8:b0:2a9:db7:4475 with SMTP id d9443c01a7336-2a90db74615mr31707795ad.1.1770028903050;
        Mon, 02 Feb 2026 02:41:43 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4153c6sm144656425ad.37.2026.02.02.02.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:41:42 -0800 (PST)
Message-ID: <aecf71ae-85dd-4dfc-80bf-04fd533ac518@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 16:11:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-4-e10b886771e1@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-4-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JcGBORnMqTFsiQ3ewbq506_fCVt8etBi
X-Proofpoint-GUID: JcGBORnMqTFsiQ3ewbq506_fCVt8etBi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NyBTYWx0ZWRfX2tI5lW9y6Smn
 7vZyoT/+muFwITCY5Xy7sDh1+yXGh/Um/xjXKJT4UaO1JyUdL+13I/uNH9XbbkYOIPSPBjHzEhq
 4VGqd+VX3y1bIZnOeMRxRN5KvP1DN8YA6PIeaLk2KCR+tnhuQpTO22O6PmsHT+eNAGslL55uDgU
 gkpUIiT3GUggL5GN9iPqi+/eydOZBtoKXFWcEIs2Y7mwnyRGB4WiWPAkb35U2TvHXCTMhVHiq3Q
 urwvLwStXd8WrR4p/nuaF12rUdwu4V7/3hFyob5p9gtzCP87H/EBGIXtWTrp1iiTBmhX8/yEEoh
 YCX5MWHmqjKb5PxhcULexHUUQJCi+iRVWEhM+dwbcClcgFPXIEu3PxS96zqEr4lTb/7kxEtyTWW
 fpZY1788wuB8K9gdY29HDI6hud8t8eHrnl7T4eIT3VIp9ZGr8iGbGOboDIlBJL2GOz1QIMiV2vr
 bj43EA7PafjheZ5g3Ag==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69807f68 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eoDJDuBATBRS9JQvDKsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91476-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B00FCB2F2
X-Rspamd-Action: no action


On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
> Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
> and increase H265D_MAX_SLICE following firmware requirements on that
> platform. Otherwise decoding of the H.265 streams fails withthe
> "insufficient scratch_1 buffer size" from the firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 12640eb5ed8c..8c0d6b7b5de8 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -67,7 +67,7 @@ struct iris_inst;
>   #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>   #define H264_CABAC_HDR_RATIO_HD_TOT	1
>   #define H264_CABAC_RES_RATIO_HD_TOT	3
> -#define H265D_MAX_SLICE	1200
> +#define H265D_MAX_SLICE	3600
>   #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
>   #define H265_CABAC_HDR_RATIO_HD_TOT 2
>   #define H265_CABAC_RES_RATIO_HD_TOT 2
> 

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

