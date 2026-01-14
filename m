Return-Path: <linux-arm-msm+bounces-88920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B8D1CD67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 08:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA1E63016B99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A20361658;
	Wed, 14 Jan 2026 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp8n5oNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpKQcxYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A43612E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375747; cv=none; b=lJTj6DNN3VS4oqLrbUAnhr0E2I+JDFawSJWw+54qXWUDdxsV8COcy3+l/KZK3+Ei19eLGDLH2szpI15jzNP8A/9ZvE1FEUEElZCMjOTG/bIOfMzf6ia3Zom2wIuAzGFo1l3w/ZV0/tqVS0Ah4hpa3OGFlKLFPcYgyj5EkB8+/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375747; c=relaxed/simple;
	bh=svwloPuWqcxO7bfrg7PFjEgIq+L6BI8w797MN6L7KgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwjKWAJumreB2Nv4FnnMwb3rQ9y4TXDX86g4OzzESmq7sOdEf+QT2vW8QQFxd3HcnyNQLga6no+YPEQOjj3gpUCwZ7e+jLwsFFf8647Yw8I4oEpKBIKKeJW5T4aMnlOZD2uxNa2SN+2uoMr4lpZa95EjpG5H79MC78zsjfHGnjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp8n5oNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpKQcxYs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E66Eg41845831
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=; b=Tp8n5oNvR/Vtq7h0
	s0i5rW07+zZadJjA4M6DJhtHLgSxobKOhMHtUsN7Vr68Gp9nOY2ZgRuwCnkoutiR
	yPy9sM/sD2aTd6kry87EMhcx+TWEH+aMIr04oltlqr108KBf/Z0QBl/I+GPnt6K4
	VZi5CapUOJyrkynBYsqQMdvj2eXqRBjRor3+ALMRnVHlIBr0uK7hv++dUMsjzoU+
	QmaDGjQFzAXnphzMtty22l8jvj5WyNc8iyUMFjj2KS4t49Aoxa3qC5d5D/tjx+KL
	ApEzTnYT1wHM4bL+8AySWohl5z3tB3rQpXXXVVSfC3weJMiefojVnKoNkmkRHILu
	TKfBCA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3eb3wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 07:29:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso79019725ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 23:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768375741; x=1768980541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=;
        b=fpKQcxYsHADz4lUV/LSe7JPg9wO8OKoLwkKKBQq5W5SHeAZZO3s1Qy3zSNLWEdJ6k+
         Jp+Ip3DIdMuOZ2uRnjpXmod0Vctbg3C9BfEUPDPGjykqnQYZwWt3qmn6X4YuIwaRyJMD
         c4va8Lz9xQDyGNhRe00S4ZYBlnpQv9Y+W/IJhw1misLKW7GGAJYQu5rytwHQCBbGIE8S
         fOZXmER8JMh+kcE+Tqzxszqo1AKAFoDuADUzwulOIArpBO2VJxh5R+EJJMCjcR2SRHNy
         olMfptM51MC3z3CG844q9nguAAtqfUsh3Fkliaq+d0YBuZii6VxBdAaaY6ca8XtZYWIR
         uCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768375741; x=1768980541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=;
        b=oYAg/+fp1dHoi5RhbWVF2r94UoOJeveXbHhthKv4Tf0OolfispLYLmmyLke4xVpcn+
         iAtfIY1UGqhfIFOVwvlVSYdtDJxwNxpiurQAuFXBO9Mq7RJv9SCdvA83iC3E7A+7QlN4
         Lzi549B4CnhKcM2wDXt4uinjW9RK+corzBATXaXUqtklN4iRA8O1wuWETdA8OJEcqtzE
         sQ7/nQwZYpgW7rUhp8LU+vAYcmwUZSNv+v+JBdoaOExn/UZBF7dv1ZIBvgsxxXLn4/ci
         WjGiAOlonL7liEcMgtJjeC8VpfzMbxRBXtWNi1jeg53PhU7dJXF04E/9yFlFa27qlq2V
         KZow==
X-Forwarded-Encrypted: i=1; AJvYcCXib1XXK/vfh77llrd3MW2eZRxQ+vnmLqRjvDb9WSF+pn9Nns2uAmPC7lvzlBF7m5/oCMjL+2vocf4jHvaW@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8FhBBRF1O8qx7YEgJNzGNO+Sd1/n8vYfPGkWN/RBWHB9o/QL
	1nM828Q9dY9RT5PQJEnv1dnNtZ4oXYrv9MQYFOPGZCRn0+dpJ+vIXkCAg7uiNplH3Ak88i4HxHb
	i6oJNHzmsCFUpSng9ufky8eqtRxQhmDJN2qox08zIEA8tODHPFexCE850/f/olFgg97Q8
X-Gm-Gg: AY/fxX4RSow8JKSSbUQApAZRDhikVUpbwUwe70ZFBq37HgCfQFEjMmtL7hD74jhpvzU
	X2SropkxkrnTXp4JOXmwVbk/Iov3lFajqc8PJDIJK4PNlzBBasscuviUM6mcXsMV8zggBjFIkfW
	hrKY5XoxK0/zvgiDuGef3sTSPsN8Xref58Ob0I7KccyXgKmYKhh/onfGbfe5LmrurU0y+FIMOp5
	g81SRfTOVsr3x7bU4eBRObKQNOcnzeVAOpgSvHuzpDfTeOLQyQo4pLg2omZF/kqZBmEveIP3CuY
	TedBrp08CPqjYIIkyeGRacFKeKCivE5JcspAHVdylVbNzb3Z2m74it6CTCTGW05bZMRZFyYIClr
	lnNHi6gI6AkuyaUBNqcGyoddzgCP2NPVj3jhr4ZucNpdf
X-Received: by 2002:a17:903:40cb:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a599d826b0mr20847245ad.2.1768375741548;
        Tue, 13 Jan 2026 23:29:01 -0800 (PST)
X-Received: by 2002:a17:903:40cb:b0:298:4ee3:c21a with SMTP id d9443c01a7336-2a599d826b0mr20846895ad.2.1768375741018;
        Tue, 13 Jan 2026 23:29:01 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a2f7sm223039555ad.16.2026.01.13.23.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:29:00 -0800 (PST)
Message-ID: <4124d961-b262-c75e-5e34-01be1edf7959@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:58:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 08/11] media: iris: don't specify max_channels in the
 source code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=696745be cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=S5pdipytwMNRnYpo3tEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfXwi8tA3t0gQFM
 H6HpfYHsdtDs8uUpr1gyTKsegGq9fbTGiQiW2Ci7jag7zIZohy6dOmc9JA3WAd9xkTGjGPoxNx5
 a5UZjc/r5eKoPCfEPSf98Brg1sjy6LGPDymEfFkqyujnxmX/WNY4THY0Eq+Xk6aDzmt8abgFpuR
 QGw/JcoQkMITmTvQ+AndoLld60zBqJx79zHzSQfl4GKQW4jobeILPrN0oCFu9sv4mpDZT12tuKy
 tRdgNPDptChhsc4PpYkjUiBoKs2VBh2JOhS9OMRDZ2lxR7h2k4PM5kmXngcQhN9uots9ALNBUOv
 EkfqPE0lHcXlXvJNn/lMbDd7Y/Aph2NmYg9/ZItuFEtmRo8oIm2Mk2DIw+GVgFffruKLLKDVJv1
 0dnCaST2mFRgXFVbWx+BHFMrxfZi85ijjr4MFYELY2crz7/R1H4UTzZknnG13cRp5eESP8CwnG8
 pO5gJv3ckEwelcBWmGw==
X-Proofpoint-GUID: WTMmHKEeP7kycrN2Jg4myyfmSLL06JO2
X-Proofpoint-ORIG-GUID: WTMmHKEeP7kycrN2Jg4myyfmSLL06JO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAX_CHANNELS,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f99fcbb8fced..4abaf4615cea 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -72,7 +72,6 @@ struct tz_cp_config {
>  };
>  
>  struct ubwc_config_data {
> -	u32	max_channels;
>  };
>  
>  struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c967db452dec..e78cda7e307d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  };
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
> -	.max_channels = 8,
>  };
>  
>  static struct tz_cp_config tz_cp_config_sm8550 = {
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

