Return-Path: <linux-arm-msm+bounces-96912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A85C40xsWm0rwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:10:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A60252600DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 596E330CD413
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D613C65E0;
	Wed, 11 Mar 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxaCptpn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETqSPcZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6213BE166
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219709; cv=none; b=CLKho47HK1pz1HAq0GyKYUDRJ3soRWnL2S2HWMVP2OCKwXhWqSHjMKgtYeejSxipndNQkeMI3Ma8DqHUrYkyZf0wS16YqiEAvywKNJ3HLxBtMpibjvUEIzXEzvWTbXgoFingn1IVeZhLcyqok+3U6y+8HT83G9DWbDOrdB2BaLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219709; c=relaxed/simple;
	bh=M82F9xn9mkuCwvDesk9AOkhQp+C6BBJxlqLOxPWAugw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDAYeRrVsCNk/bEVV1dzJfOyHg6iFzDFLALO/vJXgZ66HQu72ZOaodURbkocBG/syTsn2Ton56tg28eqhwB4HluoQtwFbziYvUfVnXDdcSEpNNFmWUrSe5xHWnAb5s1aKDjhQu6RAHqrnSJjgvwhxkmsclEH1hA4exss3C3y1IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxaCptpn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETqSPcZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6hK692677070
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IjC7zj30dl6fdKiDNAxOGLhU0Og1CDbQKQDvZiwavyI=; b=IxaCptpnszEjfQXz
	sU+zFc5fXfOwjrHfZ9ZMjOUaYRQ0qGwIFEEnf+mGngbiN9in16sLEYVx6nUagKma
	TRUPptEBBH+gz4rl1jDwHHoizZMmJFtWrWBPB1HIFsNhykfNqbmxf/VhIYB9CXex
	c69E3dGnsdt01pgM82VqGHuhlKeqfwn1yKcXaYdG3grQP/MEZiR2fEPcmk6JKqXN
	iagvzozAlT7JQ/9QC639F65pST7i4S/LWtFsHuMPi8Xsh5JX//SAl4aZQ8ndsxIc
	ye2gU2z/C1EFv7kQYuHEIgklxlK8dl4PaDOIggmJdvHnytKq0jjk1lctKb0EawTW
	NVNpDQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd0g9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:01:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffa8682a68so1334795137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773219702; x=1773824502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjC7zj30dl6fdKiDNAxOGLhU0Og1CDbQKQDvZiwavyI=;
        b=ETqSPcZ/e3194YebcUMAvQdLkmUxsvkbLac5SEmW9WrtOqvwgz6h0VX51B9UdPZbW/
         S9a0wg7XtuyR+LBOHrEFNAOnZ25s9oPI3QF5WZox60FHvWm2d67tITpTMBZP3leE1QF1
         WWu8WevT/hs+41m/Jz1EW6gIVr/qIvMzOzcT8x+pGdKV+R+wgyExOx1k1BBtwrgurFdh
         jhNbiZafNPHJIYHJnOOm2wIkLRIOM39GSmRVkZEx5G7+Y50teMEecJgBIFhv7OXcEvz9
         aNDKw5G1b6ER4vwAiNlb27ZhbfxNlCeqIi7BG7K13qtg+Zz+muZMxKk6LebTLdjYE1mq
         Zh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219702; x=1773824502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjC7zj30dl6fdKiDNAxOGLhU0Og1CDbQKQDvZiwavyI=;
        b=tcPF0ZcHKiuI1ZwxX9YU93y1SVgF3e59hCUeH5rhFdtmdhsbFycudABPjyqH1ErJBM
         IOwErsJnh83rzwOvneAUa1AXe4gTLhXx3vOANclBTBP3o3ECksKjgcV1RaxCquJF/6PF
         PzE7omZUHjJziKDPa2BEd15xR7KUUoqb5yNabsYBj3Pl4rzxXlA3a0K1ycsMdbYyZSgy
         B5fNjC0JccYsidHHaLyrKrCCBxaAOKYo1fx/ISzoPeX0MJziUPwzzU0fgcMFKOGDU68J
         X9W+b3ORn95F6zilEvs4WQjpwRVPLozaEp27ovGop29taTfOkAwx0LqHwCO0/w9hfbSv
         Rw6w==
X-Gm-Message-State: AOJu0YxqpXXlNMisvqESu8KOPfRXTHrJOsXlklavdSMP5zm5BIM+3xT1
	zVe5zTL5ni97+6aDBKrvJSxzq5ruUUop0inE9rOiG9HcSBmbblJWME+m2n2Hptz9PO3sBuZlWkM
	dFI2krhDzDzoyJhWOYo9aZkRCrNCXYGFFqDDlHdEUDwYPouUdiZM+9Tajx3W+R7sg2huH
X-Gm-Gg: ATEYQzzAs95r3oNNON973xRV7MHegzQGo5q6A4fOMkkx+V5nUl6dNlQ1xFFglWPNDOr
	2GiwBHBcbi0dsfdIv6+e6CaNgO0CzkUX179iBiHVuH3Z5sjDrXLpUB4RfQuotcNS7f1pgaJyqUF
	3LJOmBL/SogHPCRO6+2SBr3ATRPR61AxTJYtP4P2NPk+10sUFe5SGudX0aOqXJT2OP8RaM4iX/7
	L20Q7+gRbfsRZp3PP2CGkaihzJeOx0iGOdwHKjaKyl6RsYwuWKqxqAxwfYysApsTMQg3aOPrlh1
	57b96wjNWUtwW+FGfc73zAeJkQSzM1qL66pwV+McYLsOG/kQgNYGRbm5q+n0K7G5kCMF5L0Agoe
	a1sgM1VDejTJOwrT8GDANY8aai1hB0rY9QX3BWhTJd9bI2oqJ06wB/dpXqMPrU/R2+sXU2cXJsT
	an57M=
X-Received: by 2002:a05:6102:1606:b0:5df:9ae0:45e2 with SMTP id ada2fe7eead31-601dee918e2mr328447137.3.1773219701708;
        Wed, 11 Mar 2026 02:01:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1606:b0:5df:9ae0:45e2 with SMTP id ada2fe7eead31-601dee918e2mr328427137.3.1773219701272;
        Wed, 11 Mar 2026 02:01:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14dc4dsm38046366b.36.2026.03.11.02.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 02:01:39 -0700 (PDT)
Message-ID: <b24598c1-3f63-4e72-9c81-cebc8b14bf5d@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:01:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/25] drm/msm/mdss: correct UBWC programming sequences
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
 <20260311-ubwc-rework-v2-1-69f718f2a1c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-1-69f718f2a1c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NSBTYWx0ZWRfXyMioskrsfu0U
 BUo5+FgqRjWlBhqfQ3J2BY8VIMB40PuSBiyAP9SYEUEG2/G015d8VqIvgdTNWad9fo/+5Cr27QC
 j3S7+/il0jJAgGg0IetN7IYQuoHirg3+HlreLDo+m5Zl0AON83sYqDAFAHiMHRyW/n2VdWmDscq
 d8bqcUG93YqCeqe13YJVx2NHkuPL579qzxxJZEvd5KXTSqRl8FOhkSTw1jJrl7niq3cpf7ODLlt
 ClhzOv0X2bti6j6SyewCRoXco4B7W3dtNnly1EjsA+VtyvoA6eRJ8hf6Rzyx1AQJlOsw1d7Q4Cm
 27PrZkBdtMNsRPmnW0iDuESpmEcBoyJdUt//YjuT1kSqBflikqH+Ecs4Bb+KWdyXQVXkQyic81R
 rduf4caU45QTPSVvNE6ogMJ/hyp9YG6ZTDdEw5Ifuz7/0fKs7lFxrGy++NyohyysyRc55t+sHbC
 I3nL8aCZcR+N/OoH+dw==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b12f76 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ICUY2vpjD9Qnjj3NXwQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: akRvN9prrq4HSeBTRQe8bIVc4yx4owlq
X-Proofpoint-ORIG-GUID: akRvN9prrq4HSeBTRQe8bIVc4yx4owlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110075
X-Rspamd-Queue-Id: A60252600DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/11/26 4:22 AM, Dmitry Baryshkov wrote:
> The UBWC registers in the MDSS region are not dependent on the UBWC
> version (it is an invalid assumption we inherited from the vendor SDE
> driver). Instead they are dependent only on the MDSS core revision.
> 
> Rework UBWC programming to follow MDSS revision and to use required (aka
> encoder) UBWC version instead of the ubwc_dec_version.
> 
> Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 120 ++++++++++++++++-------------------------
>  1 file changed, 45 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9047e8d9ee89..d8b0288f0040 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -166,27 +166,27 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
>  	return 0;
>  }
>  
> -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
> +static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
>  {
>  	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> -	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
>  		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
>  
> -	if (data->ubwc_bank_spread)
> -		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> -
>  	if (data->ubwc_enc_version == UBWC_1_0)
>  		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
>  
>  	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
>  }
>  
> -static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
> +static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
>  {
>  	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> -	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
>  		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
>  
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;

FWIW neither BANK_SPREAD nor the higher bits of UBWC_SWIZZLE exist on 8150
(MDP 5.0) or 8180 (MDP 5.1). They do on 8250 (MDP 6.0)

[...]

> +	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);

IDK if this is a concern, but this register has a note "Valid for UBWC_RGB565
only"

Konrad

