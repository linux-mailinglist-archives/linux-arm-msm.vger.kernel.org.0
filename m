Return-Path: <linux-arm-msm+bounces-86958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C73CE9A22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E602302A970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403F32EACEE;
	Tue, 30 Dec 2025 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObchgJd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c068y7XU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF92EB841
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097169; cv=none; b=oQ4rOVyQNPVlHgEXpxSQPa+nvDMHhJ/PEmK0AONXgXm4ioFKDsos/8vEhrnN/URtW8RzX8WkJvW8KmoloL/+dJ4N2axSQvpfbfIX5KqeBxby6DEkVT8z6GEmYcwMKbnIV+guy467SPB2ce31yNZ4Vk3vaiuaWZhSKS7imvp5nrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097169; c=relaxed/simple;
	bh=sKLpUeSHFFxmRemOdXDmSk+tnrFj4/oiC0i+FF0jiSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8HuOIhzdnRwfj8q6AcyW5aSXQ/GXOQy1bo9nuTc+QzumjMMmN2/1BT8a/o9yjjfGdL4nubaclGxTQko0NhmgL1fAGSHsJFc3Fn6ebe1xdlxe9wL3tj4Po3TQsfWGVmtvRgUX1EJZiw1LkcJASggHEnUzR64waY9Y1YwI8Op5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObchgJd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c068y7XU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3hcr72546917
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78clR/7AVGJlzoGzMiWgkndg
	5bdBeQ8hxjrGBQfBu1A=; b=ObchgJd3lQjSLTP/8m22EIe+8gggq0CkfSpD9BVQ
	kWTX52Hrj7UxDNXflvU7RQuXP2Ae1Ixf0zU2WEnfU7viPGU5BoURpwG60bSiTsMc
	/H3nZPQuOAas/EhugI+PgqFiMomROQ/DuFhGBIV5kJ+b93p5/Qo8AeSwiCLRT4pf
	6LsmfqP2wgeeOtKl4mjar5qS5lULclebUg0/bwZO3we6hU5rrBwoGsX20YJ6FFyw
	RkdqsCN0SRG5S5TYJVuCqhcQ4hdD8esvHpbGBKkJQX+Kd/MDRRK1PXgpYIjKbavz
	bRNc6/7LLPilUBSjq9F9+waJwfnBHb6dL1etaTrXjAMkvQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc73993s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:19:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88888397482so301790266d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 04:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767097164; x=1767701964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=78clR/7AVGJlzoGzMiWgkndg5bdBeQ8hxjrGBQfBu1A=;
        b=c068y7XUF2vD/chNanx8q6vtkLzbLXTWj9dL/tPs4xPC4mf8/g9cwptxLcBRXss2r9
         7Ik8WoE5HVIE6dLfl2Pi+6ZrFSf7A5Um3yyhvEqgmNNZiMK/vzcyoxsi2rELKsYjRxN1
         R9Sto0lpH19e0MLa4XsCcCqr3XzcB0w9h/6oN9TU8Sa0tmCD3zU+tywPmdq8AaBXgz0I
         rsdEgKwUZRaD1FDWoacSFwY9rjcvb0QZzu99y0r70NSlWXgbZjlTfjiqtVdLax7+PpMF
         Fe0PitR/gcAnxV2+vhtIgL0iv3rGBkYpvuQIPcVLMztAN7+jr6z00MOtiOFW+vrPJWl0
         hadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097164; x=1767701964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78clR/7AVGJlzoGzMiWgkndg5bdBeQ8hxjrGBQfBu1A=;
        b=IQelz8/qwqI0g5khQsn0ibObT27Kq9hEO2vQFi9RGM4gyjd8LiY7/zbs1y1SP3Awjc
         94O+hoZJKxZmxN4PJulQ+97ogFfm2dtQ+8na9oC9PKzarUTqfQ/EOHZ6EN9tsu41V+Fo
         /gAd8lIY7F/qxh9ScqQmSVi7l2J4zZAVaD5r02eImB9LxlaSR5PHaeA1Q1yBRwiHsecE
         q+Q7pVZ4D8tHf//LpmN9tqUwaJQYkC/JgHsVIOR2pSJanYbnOysAYoBy7iY1BWwNytd7
         slyIp6FrdnT66FECtJwu2TTzM3Ekg99rXf8QR1eMnC4bbeJiIVYDJXR5vu2YxDxbYx3C
         fU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU62k85eFlrPFpdRr0sxBKBibBUHLqhiiq/K4Z5ObCkGCEFhu59uVqVBZv7ILTPq9DcXpg6C/Swhn+0LpEg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Y132eUJPgj3ghsfweYzOVnCaz13j876bmouw3A067LCxGvmj
	ki/isNNe/f3eFevOhJl5T9I+ZlDlogz6tyJCX1Mi32QAGYt+ASZR5YDcehuZNO5Ffecr21zu14h
	FsD7riu2pOpn8k1GEJjz8L6p5VTuS2sT92NBTrakZZ25HrP0vPslb1hzUV0h+VKeqr/nN25yvyZ
	Se
X-Gm-Gg: AY/fxX58qsmdk5hjg0nF37NmjdvfPxyPmjlUQWejWWcR9dWz6e5puslj+0wk0mjT6Cg
	EgBLhL936VW2H8Ta0UjMgsz4ugq8VMOwJyA8g4w6qAJuNqsE0A2UHVntwNXYkpIKqFBaAdGgH71
	+N56UclxtAgwHKFarQekU5vE/1x8kWceXy/xR88Q5ZLDoHZ79LWvYa16IPLOJ3x7wdPHc4DXhmW
	0FklaWmfQGA7uPLDe6xW6ySblqozuqE6z+Agc79gBP2E2MijXFFKtIP4QEMh+Qs5hcrgHayk/LZ
	iQnHZh6GnUcrmcBgBJ4/WVpPZT/7hPBGoEx6ReOOlPWZhxO1LFecqxJBpFvbkt72nYrjYm8MuL3
	ji3+qmBEbHso+GxlwYXtuYXvlNm1U5l+gl1JkoYYW+H72hX9d4wyI2vtTAoeESu8vgdWnKl3CD+
	dd5JkKJ67wStn9cz7tJ9I7IQ4=
X-Received: by 2002:a05:6214:dce:b0:888:883d:ee7c with SMTP id 6a1803df08f44-88d83d67096mr481709056d6.58.1767097164390;
        Tue, 30 Dec 2025 04:19:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsGTWMIxwO8tlwY4ghDiFwHr4p7vTNJMLZzrl8GERsuyDu3ARlBoNHaLdplL9hGdgL5tPYMQ==
X-Received: by 2002:a05:6214:dce:b0:888:883d:ee7c with SMTP id 6a1803df08f44-88d83d67096mr481708786d6.58.1767097163922;
        Tue, 30 Dec 2025 04:19:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282e0sm10240961e87.95.2025.12.30.04.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:19:21 -0800 (PST)
Date: Tue, 30 Dec 2025 14:19:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: qcom: pd-mapper: Add support for SA8775P and
 QCS8300
Message-ID: <ner3vjn437b2vz6zd6qwymkudio2rvmwhjfqxwsp7jkrgv7ouh@fkihfk77tsvv>
References: <20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-GUID: p4OSjHEl3mjMm9sLbW9B0c-fTK8r1f8u
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=6953c34d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FNvUDg0aZ3U1l87S4q4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMCBTYWx0ZWRfX6QNW2TCe6352
 i4XUAhPT52wcx5JIGBb+/gkq8GNsWQizOKa6W+UiwMbWH9Myh0chqufZLE7wLDvekC1nxz4Wddh
 BEDzWT4hgTjjAtY9y7//GnJBX/Xbkmd489XKm6ac37MHJrUZ8o32e5wGgF24J+NCytRstrKNSi+
 nAHpwht2WyPAu1qsCY1R6MyIkbJEUp7eTPHdeFBJDgwoSoT70vlSzG27K5fRAP6GYSGP1gO/bQf
 3YL9fb3G7FVNpn3sTHo29xMQrytELFHnUWzq7CdV4JjGjZ1dP6FAKcym3TTBGg4PQ59RT6w6Wcz
 2TpMfQHtKqLrGZyzp2PKFAvWhqbN+ghnKRJ7sUh3QZnClX5pmv/4/8mmhs94WhHVpGkFQkvTgGm
 mxGS6JoX3frUjyVzYdKBc9XeQo6e7QbhB2Ru6T7qKP8lBxcjhwPCQ2DwZ4r+7m0I4yNt5CpjBDg
 me337zm9jlZAtl6mPEg==
X-Proofpoint-ORIG-GUID: p4OSjHEl3mjMm9sLbW9B0c-fTK8r1f8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300110

On Tue, Dec 30, 2025 at 03:55:08PM +0530, Mohammad Rafi Shaik wrote:
> Add support for the Qualcomm SA8775P and QCS8300 SoC to the
> protection domain mapper. SA8775P and QCS8300 shares the same
> protection domain configuration as SM8550, except charger_pd and
> mpss_pd.
> 
> Add an entry to the kernel, to avoid the need for userspace to provide
> this service.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 1bcbe69688d2..82a923d41914 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -401,6 +401,14 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>  	NULL,
>  };
>  
> +static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&adsp_sensor_pd,
> +	&cdsp_root_pd,

Missing GPDSP domains

> +	NULL,
> +};
> +
>  static const struct qcom_pdm_domain_data *sc7180_domains[] = {
>  	&adsp_audio_pd,
>  	&adsp_root_pd_pdr,
> @@ -572,6 +580,8 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>  	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>  	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
> +	{ .compatible = "qcom,qcs8300", .data = sa8775p_domains, },
> +	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
>  	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>  	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>  	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

