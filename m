Return-Path: <linux-arm-msm+bounces-84539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 849ADCA9EEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77F0530D05CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E4724503C;
	Sat,  6 Dec 2025 02:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsqwB7CV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJ7RPUlD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724931DE4F1
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764988277; cv=none; b=Ct4XPHOe6bnaWsAswH9BDJV8PCLH4TPnncfEgv+2H+I+UZ93mY3irJC6Crzu0r2lTJgR1NnMN2I028OoL13pASsqb6wLVhkN8uMaTJEJghRxqQP2QZzX5iqLcpIUQGDhMLRbvIvU+lWN/f+Ewunr44i9anfKiux+kQ1B6VjneGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764988277; c=relaxed/simple;
	bh=tf60x1YenFEMy2LGAuk7nx+ukOEr7WXd20AhfQdEims=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyZC/HB6BemNM5Qc59vsUYb7Wj3bgQiBTnUOJwr+ygkegkdzdCroP5ageGSktelttMjDKvm11CUyQeLvvZ/W0Ngyw68fNgXZMjDAQmX3qqD4rGiMauWz6lIAhyPYt9iHAwKlpsQRFvxGl7th5dvJgBES1Q/4zu0FBLSjNKShfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VsqwB7CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJ7RPUlD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5L8e5P1418803
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZRtO3TYmHTQrUnXdt/8BxaRj
	1OPXEp1i7OmNj7Dvdos=; b=VsqwB7CVnCPvSGB5MuKH/57RREUQA4h8w2Nf9wou
	/G4OE78gMRQp4GXJU/GcPVLu2P+G0tfdu+WKpULAt9t178A9IiRXquuAnpFBG4QF
	9J6OhB39dDEsQTs3pqyqg4UQ5JxrIS1f2t6+VQcrfujXiVzMWB1ruEifBnogY5FO
	PM5bk4gIqwRWHVRkNsyARv8vbJiSVAS0PKc8nllhiBBfy3R3e8GvbJyOGOCp1LoB
	pH0pxUVbEcTplSHPcc5r33/GijOH68TLzssIykt0o64LNk6jYJ+pikLmBjG4w4L3
	b0adgPoheQNm4SaAfAP/ir7UBDX2bH3pw0As8StO3fuDOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av71kgk2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:31:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8824f62b614so5086726d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764988274; x=1765593074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRtO3TYmHTQrUnXdt/8BxaRj1OPXEp1i7OmNj7Dvdos=;
        b=fJ7RPUlDODmHDIo/6qtsaY47Gizsc6NAgRMZBsFTSkWdkDnacEQubBfD0kug5FCnnn
         DAZ8/dEbYa0k4SgSxLfrrS4ZjKlnYQuxEUj+ls87nh3tdZne0MSY2Tq6iDtNEf+VKXm2
         on8OdDnn6mQ9M6pUs37oGqvaMdYHujNHz6EF8rqsr/VFKd/wS90y+19jPN2d7r1iGu6f
         NRqQYadm1PH3TgOJodmWYR2XU7mHKwtaQ2XgtfOz7uoouFRrGhWPjUYDfx+xZokagESy
         3PlIQZJdsxKThJS7BPeICkNeY/S6n9VQLhKPZOS80RoY1o0ab/a4AiUK+DKOGHSdk4bF
         rC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764988274; x=1765593074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRtO3TYmHTQrUnXdt/8BxaRj1OPXEp1i7OmNj7Dvdos=;
        b=oKsmHD+/ARiMJZytyXwtowau8GVsoHJUUnXMqT7XpjVon1yvNUirn7xfEHxf6oUpb8
         uKgXscu4CHBDmadGVVIixOIMmQV+COPkm7gDq3/RJoDddMLL9JYrqOJPL4BgBaXQpu9t
         TLSkj2mHSo1Ia9gC4V75tGOpSiURh2Y0lNpblvcXhI+RYYCsL7GGYcjyovZ9KXUn5iyh
         DhEgaoEjmuGJWFWH73HDTfOm4+Q9cp5620eT1E7FhcCXDpF5tuMvZyr5CHrgiimNJKCA
         03mzSKaBg/AqzquTdxbNRle/ht7ECZebfbl+olC0JUmO9OGeJ6cC9VlQx4t4QdmgA3k6
         peqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqG9aR7TRXfDBkcvR0E0bmwKoXwa24OM/oQjK1jtUNEmZD0AlOm7jMIFDuexnwqIlgUtfGh0NTfBDodRK6@vger.kernel.org
X-Gm-Message-State: AOJu0YxGC0+V74VAhkM7N+3ByRC9ykryLytis/ebKdtPf29zUBhweMiU
	tGjzZTbE6/UE7HAIKX3pPxzP9yHZUd5OZsNLuwEcIr8bTqR2cjO9jHjVTlQ1SYMf14w7Hf1/UC2
	CK0f/enA3BQ7iyo6BnhjPHqFMcUNFHHFUK8UW28brqkUCOoIPozCEMYkXrDGUGP8T3l3f
X-Gm-Gg: ASbGncs7S5l3oDW4ufOyB8VJ41mDsCzut3HRGAdfGmezeFf/sCptnyJDtHZN3CE3EFn
	BVmXH6b1KNsV7CfwH4DGFgtPbWGzSE2M3uW0T1fHfyI8xl6riA7kdaYX0t8cU4XZQy9CX7sqAAz
	STHgTfedl75ctvYTjC0BHTFaUhp2MJDW/WmYVAb3xjHXekJhU5NeWTUQV84sgj61uhPJvXqGTMh
	QvFblW5SPI2H6ODo+VR1Mo0ZLYlLPrHadgj1Ie8YOUGv22o5ZLy7/pUap/UjF6JuUblSFDAIEb4
	AYNC3IVDqtxfO53am/p6lw6FsuH292maNBlVW5SQM5FnYvfZFFds5CnkyDQVSVhjddjh0TegYVC
	11H+665VkJcLDCHoQIZ6NZ9aV0hT3NCFghqakU1vgW45o9KSoQ2cqEPdxEROBCDAc5UWAa9J7Qh
	U1t5gLZVJiSJdRFFykghZr/Bw=
X-Received: by 2002:a05:6214:4509:b0:87d:fbe9:9566 with SMTP id 6a1803df08f44-8883db1bd75mr21755866d6.26.1764988274442;
        Fri, 05 Dec 2025 18:31:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE04NAuZrnromDR9MbXM6eEIfNuiKMMl7Us1PS2BG+IPVypoFi0GdBxZkOLZlekK+UzNyC2TA==
X-Received: by 2002:a05:6214:4509:b0:87d:fbe9:9566 with SMTP id 6a1803df08f44-8883db1bd75mr21755486d6.26.1764988273934;
        Fri, 05 Dec 2025 18:31:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597dfa1573asm473037e87.3.2025.12.05.18.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:31:13 -0800 (PST)
Date: Sat, 6 Dec 2025 04:31:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <l6pf6zoz3sfawnsdmtacczykg2dgnaw4x26dfg4o3al44y7fc5@vgzd5s4uygm6>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-5-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202060628.1869967-5-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: p_giNAmkguJPp6iKEasNfZqFVM2oKwZU
X-Proofpoint-GUID: p_giNAmkguJPp6iKEasNfZqFVM2oKwZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNyBTYWx0ZWRfXzuQUyBWwopt0
 eNlKhKryq/lOru9kT70P2r/bWuuXgYYYjthuWs1eaQc+8X4Y1lT8MM4QjbpQyzEGezZdUm82U0M
 Va6G0xOSpNn3JH3Mmga3nrHyQI/WN2HR85YrA2mbJga7K4llZjFwDOYlLHo0w8qgX7jI3mf97W4
 H3+36wGrtn60XzvifiYRdGXr57ahesxu2A2waeZVzUjkX7VNKan0/8kyli38+XE9BCzy53wqM6g
 vFwWv0KWUCl9MhoCE8zcHofxelmMMl1afjDMgLE7sdup2ng8WaoFYemJkBI4cpw6ewqYl2GJBWR
 FHzLWhqlOacGFH9ykVt2POzYIV8cB9i90ojQLCMNFBykWibgnnx6hYOP+kSfJAKGKlyUC5RqMRZ
 SReGYuJTmgcrs3TK05q9LRWr4slBfQ==
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69339573 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BxukJQUEoHWD8WPs6VUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060017

On Tue, Dec 02, 2025 at 11:36:28AM +0530, Kumari Pallavi wrote:
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA bits configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
> it to 34-bit based on CDSP and OF matching on the fastrpc node.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 6a67daafeaa1..c5d2c426fcbc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -269,6 +269,8 @@ struct fastrpc_session_ctx {
>  
>  struct fastrpc_soc_data {
>  	u32 sid_pos;
> +	u32 dma_addr_bits_extended;

s/extended/cdsp/

> +	u32 dma_addr_bits_default;
>  };
>  
>  struct fastrpc_channel_ctx {
> @@ -2189,6 +2191,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
> +	u32 dma_bits;
>  
>  	cctx = dev_get_drvdata(dev->parent);
>  	if (!cctx)
> @@ -2202,12 +2205,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		return -ENOSPC;
>  	}
> +	dma_bits = cctx->soc_data->dma_addr_bits_default;
>  	sess = &cctx->session[cctx->sesscount++];
>  	sess->used = false;
>  	sess->valid = true;
>  	sess->dev = dev;
>  	dev_set_drvdata(dev, sess);
>  
> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> +		dma_bits = cctx->soc_data->dma_addr_bits_extended;
> +
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> @@ -2222,9 +2229,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		}
>  	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> -		dev_err(dev, "32-bit DMA enable failed\n");
> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
>  		return rc;
>  	}
>  
> @@ -2311,10 +2318,14 @@ static int fastrpc_get_domain_id(const char *domain)
>  
>  static const struct fastrpc_soc_data kaanapali_soc_data = {
>  	.sid_pos = 56,
> +	.dma_addr_bits_extended = 34,
> +	.dma_addr_bits_default = 32,
>  };
>  
>  static const struct fastrpc_soc_data default_soc_data = {
>  	.sid_pos = 32,
> +	.dma_addr_bits_extended = 32,
> +	.dma_addr_bits_default = 32,
>  };
>  
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

