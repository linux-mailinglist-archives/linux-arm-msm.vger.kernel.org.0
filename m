Return-Path: <linux-arm-msm+bounces-82526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E16C6FB50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D79EB3810B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0AD285CB6;
	Wed, 19 Nov 2025 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4oNfBVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggPkAKNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2B2E370E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566456; cv=none; b=X/zLy+KyhT4SlDDOkC/qK2cuQeDrD1g+lFN1u2HBPF5wS4bskPVhAcMSEnKjInfbbZwD2QicJfPVe67CaU4SPM3336ZhXBY6G2ZNlUiB6e3i+/H6rwx6TI0GiLgdK6wh5Z4lIY/6JmEH3NxxGzbdxP27FIPwPaES6Cspr7bMZ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566456; c=relaxed/simple;
	bh=pLGvdgf4QfyYieGbUFa8iwmFMwen1RG1iVPCNvJAnO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FoOi5OdWAoPwSBwjz+9HMZW5f/NhprC8WEiY5UioiL+YtxoxQMEgrgTxoivTjFlXypcTx/kZS+azDC2a3g6BxeuqC0mDEPkshg3ARkPlNlt0Tx8plKOJBsSt8Tt8kXDwXtyvLmrMXU+x6SnzZdD8O8Dlgiz+7WOXbvKGq0CVZzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4oNfBVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggPkAKNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJBe2J5536943
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUDFqX3czujsHokKC0c1TBg90zwZgtieckSR5pz0cUw=; b=B4oNfBVpq/ylXQmA
	0CNCP0xzSZpw1lJLRdONJotcuT54bviYVwRPKSAeQFIwk7xExcbRhHEhDQGbftyr
	HWfYpy3spSSGmccuUdhmkKy9nKaoNkGoaHDVoXCGTir4fpDSP7qPci3b3A6kEbdt
	WtxQKkZmZqahv1/6clJWq1cyOip1to3EyKomFCOV6eLxA31JH/SIq5E1a6KiXkUS
	CIGbZ8voLLayYf89fVMV8OSK/aVRd9WLDP3oFiATYY+xKrrxOSPC7uzJbrcG0jJn
	5uncMXa1oUZGSekYOpbDIAnM6/+4+fnpdd0N5UHox9ON4k2G1G90S7BnvuMF1IpR
	EHI+ug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah65t20v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:34:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee42d99125so19563651cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566453; x=1764171253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AUDFqX3czujsHokKC0c1TBg90zwZgtieckSR5pz0cUw=;
        b=ggPkAKNrVy22PNycfrI8wmGGPtt3T9CgtRYBaISb9V34PXq/qaULQKH/BQUJWZTzYA
         BPeBrMOksx5zd8s42dmhRwo92s/K2lmdfbeAgdnQpoSFFpJ2D3ONadnbUdgcXRjTVbsG
         28g+JN5oMcbHiXMoCsSEB76LnL8zDd/bFHwKG/WRSztwJWSTRd7SCEujWLA3uotx4fUT
         HqvjpvBGQiCGgs/DwGwKnAYKwsFg9iSNofEr9a2olk/M2Fa81rFr80Qpjeo9fbDwZfmo
         7HZwdYlMgjvCjNnNn/2zJoJ8NdcHp3Sotjw+lnh0wnOYuV0mOoEwDLV9xefYcEYpXi8O
         0f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566453; x=1764171253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUDFqX3czujsHokKC0c1TBg90zwZgtieckSR5pz0cUw=;
        b=dTjCWdEOqJpx3jFw5avmRFIbRu23SmHnJ8Et2M06tCHB5yVWTXfXC9cB70PgTsK4AN
         lEKNXgu6i6J2bRtkqDohguX3a4Vob3ugkFxzX2mGDAy4Ix8Tg+tteO34IY6Cr5gS5LjW
         Rhpq0TebvXH7PDlii8boXuDjXKdQmoTkyHr70TiJQyVhXBwDJ2FMomXNULVjb7ozmEDW
         O++u8ranHu+MWpnULuHGFJvw/Z6XhSKCx2OYAgfE3RePJTj5i++PSqFNOvw4NosMLlI0
         9a+9bdrQZ8iWeu2/o+VA8lBWVqIFqxD5nkwBti9JU92rvMGvjUG24J5XFY+SDB52FNw/
         i88w==
X-Forwarded-Encrypted: i=1; AJvYcCVInCuRYWP42SaUJ6gLc0/fWs4r7LnkWCUUnNlbk4dKvf/w4Dwk2vydC5gghrFZb9txmvMCAtWhAUVfTxls@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6PhzYS+trTkm005JzAYmoJbA5KRhBq+GIk+3CLBhpbvK8Ggr
	LLfyo1OIKZCNSfHzMUBllNj5t64l1gs5ePr5PFJH56ld6VfKISjjuogsUNUu6Tx7lrEi66fKLiL
	7SfTpnEPFlyGYSSeUbO8lVGNc29mXd/Zm74PsNKmi/hQcdqsUdKl3NT7DdSCuhwaGupaF
X-Gm-Gg: ASbGncvtvyXuVt5a4WKc2shCyRDNqQvrtaeu/b2zuA2FBrUeYCtr5wQXILfMCUvqqhw
	mP9bXFGeFzAt9S4o2GzOIakT6QB8NUo3nKOGauMSUZ5SvblDr1WvibhZJkjbocRwZLzAX5Emvj6
	tKV9LvCk9LQjFDa+dhZDy3ZTSDP9+7WQyaXC3Ed60foV9pC0zRAMWnTwJcb58Wv85B/kClKjINK
	lURJ/78jiC42kN9gT5dbMaT23JDMiLuNK/IsR8koatTu4je6wEvH8xe9gOTIcPZ5STDLPbXMJXf
	mpAnt9Cf/XQPyLTewVcdRNVTaV/htFiLelaR2lDT36z/6mrgwDX5TIv+oBF5gj7bWqDYkzh/hGf
	FKRnwbCJ51TVae1CDcOCWPr2Nn/LbIACSAfKP
X-Received: by 2002:ac8:59c1:0:b0:4ee:24d0:454f with SMTP id d75a77b69052e-4ee24d04d27mr133568281cf.37.1763566452542;
        Wed, 19 Nov 2025 07:34:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG15CHRssyqgHoVeSwR9lEF8QcyqHmCrpLi1la1jDh5Mt6DO7neMAAecS8aIIfCeoz9mkLuwQ==
X-Received: by 2002:ac8:59c1:0:b0:4ee:24d0:454f with SMTP id d75a77b69052e-4ee24d04d27mr133567561cf.37.1763566451987;
        Wed, 19 Nov 2025 07:34:11 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53f0b62dsm38607224f8f.24.2025.11.19.07.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:34:11 -0800 (PST)
Message-ID: <3d53b87c-c5ea-4250-8a95-4a422c58641a@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:34:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: codecs: lpass-wsa-macro: add volume controls
 for mix path
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-5-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-5-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=avK/yCZV c=1 sm=1 tr=0 ts=691de375 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=wvWJiIKFnMKyShiGQoEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfXzMVCcxyO+NRK
 F36o7PzOlGE7r/51wHBLhMfMdLjz6YJnh6R6a/UCZXcPpdXvY/McG5E5QfwbXpVb1a/muFCpAbt
 C2b81gCXSHVEe4GEiTswxXnreXYDjsoDFH4kOfPAm2BYjRR1A+Sa8ZGuQ5DsCSwZW3F1XBGafYn
 hr6ACIHbHYgrwLhttQIIJGqZurTuDEgf3+Efx06gU4s1P5wfXZuXdJh0X1BnEiLhJ18TogCTYMJ
 PbvYSgk4stMJQlUtkJTh+2ftSqgloVv6m/+if7u0ij1/hvHKMBCX84/l3EN+3iVuG1ikwQagG78
 tJcK4rmMdTqEyWbAs3XamWHE8UeMpL4jNlMuJ4owKAzEE82kO7cqK+24W6TWJbg1CkFvNnllQWw
 wqNuulTeD6T6lpolGJp5GkRih6oRLw==
X-Proofpoint-GUID: TdUMzRL4s5zafG-6Lh5ZrDhqQUhUucq0
X-Proofpoint-ORIG-GUID: TdUMzRL4s5zafG-6Lh5ZrDhqQUhUucq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> This allows changing the mix gain registers from the default value.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-wsa-macro.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 27c8c060cab19..2a814a5d2d1f0 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2248,6 +2248,10 @@ static const struct snd_kcontrol_new wsa_macro_snd_controls[] = {
>  			  -84, 40, digital_gain),
>  	SOC_SINGLE_S8_TLV("WSA_RX1 Digital Volume", CDC_WSA_RX1_RX_VOL_CTL,
>  			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("WSA_RX0_MIX Digital Volume", CDC_WSA_RX0_RX_VOL_MIX_CTL,
> +			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("WSA_RX1_MIX Digital Volume", CDC_WSA_RX1_RX_VOL_MIX_CTL,
> +			  -84, 40, digital_gain),
>  
>  	SOC_SINGLE("WSA_RX0 Digital Mute", CDC_WSA_RX0_RX_PATH_CTL, 4, 1, 0),
>  	SOC_SINGLE("WSA_RX1 Digital Mute", CDC_WSA_RX1_RX_PATH_CTL, 4, 1, 0),


