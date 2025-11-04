Return-Path: <linux-arm-msm+bounces-80252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 456BCC2FB7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 08:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB64D3BE10E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 07:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FF530FC36;
	Tue,  4 Nov 2025 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRy98av+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nvd2W9qj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB8E30F948
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762242535; cv=none; b=U91MUDsHFcCt8Bcawttj9j3QlHYHD5vUGIg7a5A9DTRugQgi+6/NrrN/F67HL40tzNif9NfNjLgl63WURl9kfJHWVDvjD9yndHXg9YwdnasKeRKcnXx+wO2I5Khde2HfursuUTzxM7wKonxTCkvouMu/rdiJdp2vwqaj06dpPf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762242535; c=relaxed/simple;
	bh=GPfBHlhTxc0E2ivc+NZyZNkNlQB/Qp9Uzf7GzN+XDO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTmCUvaIPQnnZpKvbrPjXoyY2YPBelwyzzxkUI2KbjrefavlkGKVNEoRVbBRZYOSY/nZ1cIgfy7Vr9rgh4kVoUdjS9lu/TPweBZnkuSLoxAkkhCznQHCjaDx54tf+fyQFQDBGr1OC1EZlJMW/KQ40Ic4S0O88U0tAeUjnDYS7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRy98av+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nvd2W9qj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43AsSk3667852
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 07:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ML0bwIBQV8yKSWMhezC+0ED+VzAtX+MqzkKsWQgpDdQ=; b=YRy98av+ZH4Ti0iR
	aXc/q1YgaP9Q/DZv0SqxGTTjdmlkZlCC1Kf5rITn8A5y+ChCQTDwMW2AfgcwtZua
	jN5poz9YFSziN9pahsVamlEaGSYIpqfi/s9/dAelzfyeigHe1k8AXpgHVMOmjE4/
	y6+wiB0SMz/SFU57A7aJj4C8slO0YEfTCYbQyOi2I5uqueuOOFAbrvvO8158TUh7
	sW82lBlu1uMomIYi1HzJzx+lwtY7EYBY4VuNmzxvEein3zTLlQacbsAIb8HnzWts
	Au8Ah7S8zrmHpN8BFyYHfJX83154jrzYOxz0i6/Q+A0a2FVDYO17Ah88sglY98/2
	MMgjcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffj4nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 07:48:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290e4fade70so64986715ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 23:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762242532; x=1762847332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML0bwIBQV8yKSWMhezC+0ED+VzAtX+MqzkKsWQgpDdQ=;
        b=Nvd2W9qjI/1XQGDf28Cmx8iW8YYVumdlwDDTSYLdI672KbHJeHyzM90xymkh/ip6GG
         ZFhvUSSPJpSdUNzVQSDyr3EyrOQ4T4W1B5buXNIMFH99ZCDm2u1JHOKIPaU6RO2guH4K
         vuzlEfQBj0xCijNfRkEvzS32Yhv6c6R0hjK7uT8/P8NgJXCPwEe5TIOGAxNTWHWVeow8
         a14RoYOy4QIn/piFGyBREGQEBdDrxTaIrB4+UoOHPbnTlYz3mxifCVv3gYjZDFc+ocD5
         4yw4f+GfiX6nyS6e+UogmWZstCKBPfo7ROOwOXFQ18smGGW24WlRVHi75SW6txx531Rb
         Zg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762242532; x=1762847332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ML0bwIBQV8yKSWMhezC+0ED+VzAtX+MqzkKsWQgpDdQ=;
        b=BtW+gSqjr+Ljx9GmG9T6zJ8eudC6H5HY/sXlbQ3jAlqabQjsIZi5Hmoz8Cn3X5WIWG
         iczUiHiEJPPr5ANzPmOnMbsIPZSjihrfplNm/lYuFIXeOXOnQtwmskVS4KR5GZaDl7ej
         SJdt3k75bKqVyaxMPtFrlwyqhJApg828HCU+4UkH9Movk5vv6JKUZtCAfEYxkr66hYRE
         Bn0LYIJrl69YbA3rKsVH9IX3qL+gYK5jlc8R7f32AZfCpwq69CdgV91yVzYISm0KyTBq
         YS6ut5F0B3qIfvrJj92vRPmslll9DXgvpPQZXifNI3L8J1D7TxwGogRakHhqcZRODJRG
         9now==
X-Forwarded-Encrypted: i=1; AJvYcCUX4+F6Dyjbq+LXHElgRx9BtvHRBn30kM40CsrROhUz92SI5hs4GgvaMQa6v+YPvyZzEW8kq+im5Ohg2POV@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxijKWpdmtF1yTmo8tDXHWjc+TqGi4/Wn2Erxnz1qEaMHEj5R
	Va2loq2IqH6duAxy60wAzabv1hr+LtQKcVeL7GwpmUg8r7NzlKQU7AlRLolIRXqizBtw2Hc+nRv
	O4I0zmA08OttsupwXOJ29p4WDPOzSMsT4N9Z/SJ61P7GvwhFFi6T0KN92N70f5rJLCOSd
X-Gm-Gg: ASbGnctqbezjpyLmK/Q2lpQe82t5DJrXRUNJOn4DJ6G8lqqup4JPpUDkD1+2JKJ8WB5
	S/Dsk7wIrQqBp/LemhT2JvVtuBd10PVkE/ktnpmkNsA/jq6fJ+ocCb1VzdNunKvZoSN5WcHLPUo
	2XsgkIxLJH9ykKeu6HS3rXkkcasFc/12zrrSpOkYAYoTLpRtDc2j+ydwSBmgIQplySwE+6c6eH+
	dgPcw75nMb6JIzMlG4lNpO2PjUFWQvHXe6Or6vgIVmXyX4xkEJpkT16AiHzqvgwc7gC49wjKBgH
	PXeAv7v5Q3N2AG31+gsKg21fdE2wPcBdssJVqSrpppHSRnD0mDNQuqAthWZLpGKJ3XNSIMU/ro8
	oUBijiWLc58wCVqvc1u6G6G9mzSV7D8G+NhjMhcumGIXS6IK422SFUIX5SCSTjkb7ecoMWg==
X-Received: by 2002:a17:902:e890:b0:294:f310:5224 with SMTP id d9443c01a7336-2951a4d8357mr219816945ad.29.1762242532517;
        Mon, 03 Nov 2025 23:48:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVlq1HJiVNCk17XfjZL4ygCOoK/YhlTzaL8scnoFnoc4aalCAtrdv0g0H5F795oWl99sMb5w==
X-Received: by 2002:a17:902:e890:b0:294:f310:5224 with SMTP id d9443c01a7336-2951a4d8357mr219816585ad.29.1762242532015;
        Mon, 03 Nov 2025 23:48:52 -0800 (PST)
Received: from [10.249.21.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998893sm16411545ad.40.2025.11.03.23.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 23:48:51 -0800 (PST)
Message-ID: <bd1cfdac-16ea-46d7-ab97-989a2d3ff203@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:48:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] media: qcom: iris: Add rotation support for
 encoder
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
 <20251031-iris_encoder_enhancements-v2-3-319cd75cbb45@oss.qualcomm.com>
 <1d653876-2df0-4177-8256-00905148fb46@linaro.org>
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <1d653876-2df0-4177-8256-00905148fb46@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909afe5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=P3cjl3EAIghPSHLTwM4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P_mg2HC5V3Dz5XLi2kwYROq28aC2-hBl
X-Proofpoint-ORIG-GUID: P_mg2HC5V3Dz5XLi2kwYROq28aC2-hBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MyBTYWx0ZWRfX0UaENKnyMd/1
 2jrgrgfaHBU2S/SKbNiqd9yi7uaH2FXr4c3rity0LaYSq12Cfm/5vMAuZ2e44fGU8cqJhcp1Q3p
 nW0jJ+sOGbHNgZryXow+8Ft6fY326Jay2KuthfkDq5/Vqz1RC89ljOeVRP1/ktXRowq48z88wjw
 aJQPHChZnh3BWjuRFoMuTOH8G1bvOrBFoFt/r4mDqZxbbn3vMULto2kCnx4b4OuU5fM5bsAacwh
 pBGt780aqNcaK5KhcVbR6dYrF6WVAIMQIOdHcmp4rg9TsB1CddbxYLmBEQ5eP6JM32Y1a96/VHf
 RRxyM4qyTOBGRaWeuuE9qP4E48Skxi4I061uOTylukMsLU4xdWbl8Iw91XfKsnlVWm7kbKcL8BP
 6DbzCgwvs/BTUSS5YnuGS9XzLLvW4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040063

On 10/31/2025 7:30 PM, Neil Armstrong wrote:
> 
> I found the issue with SM8650, you did not update the vppu33 variant of 
> iris_vpu_enc_line_size.
> 
> With this:
> ============================><=============================
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/ 
> drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index be8b8588a39f..4a4fbcbfdb46 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1082,8 +1082,8 @@ static u32 iris_vpu33_enc_line_size(struct 
> iris_inst *inst)
>   {
>          u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>          struct v4l2_format *f = inst->fmt_dst;
> -       u32 height = f->fmt.pix_mp.height;
> -       u32 width = f->fmt.pix_mp.width;
> +       u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +       u32 width = iris_vpu_enc_get_bitstream_width(inst);
>          u32 lcu_size = 16;
> 
>          if (inst->codec == V4L2_PIX_FMT_HEVC) {
> ============================><=============================
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> Neil
> 
> 
> <snip>
> 
Thank you for helping test on SM8650.
I indeed forgot to add the corresponding changes here.
This issue will be addressed in v3.

-- 
Best Regards,
Wangao


