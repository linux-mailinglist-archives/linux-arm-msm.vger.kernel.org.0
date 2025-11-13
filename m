Return-Path: <linux-arm-msm+bounces-81705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E529CC59E87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 21:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E1B23B1C4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 20:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160242C2357;
	Thu, 13 Nov 2025 20:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1X4BNp2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaz6alS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21A3218AD4
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763064636; cv=none; b=nNLNSwqNsc2Wbx4vLArysFazhtTklU8biT/WXZGwM9KobeS1l2wQNBmaN3S35qCRH9wivRUW+sLea/MB0m4Po3bpCdjUJYZPdnbZCkYHsDV1Yi1E3iqzkmjX8bB4rHkSNbyV6pbSsYCvbyxwlB8B8e6kZ3yM49QB33Ll0FJy0QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763064636; c=relaxed/simple;
	bh=u9RySDl15q4VQU/CiflITu5aXX26oKXqdEdt/sRfeWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPWYzNsSTWh/5+HeaWsCaHeLBIOfwcjN+3hMxrISdCfQSCj3h7FyoWX5xIxBIcrylekhU4JhRVCWkFd2JpyeF7x0KQkUFzKD2josMZnY2W1TAUWipnT8N2u3DFd7SRCmYWISLh1C/LljASk/US23RXrCrQkpSxC0SSj+WRUI7l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1X4BNp2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaz6alS+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADGquRw905645
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s8tPGooswgIMKejH3qBxxY3u
	OWCMCTmckngUI1E3HI4=; b=a1X4BNp2ruxrWnEaNCEDX1Wmrw7Lzau2EMdbPhFq
	xGH5rzRHdZYM6/wPCeI0gvPNI0GX4VdEfthT8pY0PcgrW9wttbG0erhMkvw1DqTW
	jjiGbT6UHkWUyGa16j36ujOByRgkCUhPyTQZ02lVMh5tuUkkDfAh/+Nd3HMzhMea
	tmYSVg1Ga4J5gHo+bS3Jz5WeVOoWpVjlliXYWHcgC34Ww1ZksWdjDqsr+WCAYvJ9
	HXSEi9zV6W/HojMwzFBjqrGpUaETlkDd8lA335sRBji7hkS0xL4LH2SqbQhd2feA
	4MKxjmTOJzNAZAGzSOLu4h1ZRKuA/aGWt21qQfPw0a61vQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adk828ksx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 20:10:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb84fc9bbso76842131cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763064633; x=1763669433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s8tPGooswgIMKejH3qBxxY3uOWCMCTmckngUI1E3HI4=;
        b=jaz6alS+1exwY/h+6dYzp55G3wIOWJDhPANBSu2xKR8Y/O8g+jYYOSfwUsHIJrQUUJ
         wfQLTxALR1Gtb+6FOg+hVYA7r0JelfY/EN0ILukh5GkTvSAhAViVLYvUx5aWbshdtMoF
         mq4GZAYGfPRP0HDYpP5EsvsGBhLZOsV/zGUPHqmzUMijiQs8Ai1YVIsUk7qSE3h6bWTz
         9BH7Tf6fMIfP08o4ctdNya0R6Fav1WmPD/MmpuTM+g5+4/8D5VbmecbJn7HRudvxC42n
         BJtBO/qSjXvlCIdbzhU5M1Fe2P0y5jKNTUNVTjcK+FavEIkxd++1vAgXJ+s5dzo9p8f9
         spxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064633; x=1763669433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8tPGooswgIMKejH3qBxxY3uOWCMCTmckngUI1E3HI4=;
        b=YpINCkXeh0E1gp5wE35LRtbMTe0VSZweMpadagIhm+9x6e+mNuPE6fq1ei7OEu3WIA
         BZj3nvae5RaBsCfegqMhcyHbptrWEO7KCOFQG2gueJckRLzUY3gXUUV7IAdFvBiTysap
         nfR2A+8fcvP+QmtWiR5Y7kwMqNNOOwrRekTNg1l45SqKubKqKu4YeCKhEsN2IrqGxZeY
         rqvVBCMr28XFlDbj37PCF9cXf2+y+oTeGGgHtgPcXZYyH6G5VQPXUDwILVcmz1VIlc9j
         q4448fLtxLDaRGjaecWFdxbgZ8ZcvX3utT6pTBbJqP8AsCFm7h+hBimidoU6hKzWpE5u
         rRjA==
X-Forwarded-Encrypted: i=1; AJvYcCUbjsRHKiJw1tt56nt9s/91MVp7CppqH7P17EbkqClFWu6cr8+9po1kwb5Q96sfJfecAfKoEaJ7tPPJv3Nt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxo2eHKJ24OMVyzaWB1R2YAGhpXoWqw/LbxkKfXbA43B+uK35S
	8vDZnHU+TeNzx8Gjv4Glm6TX5nZzrjgVJYpZ7BIdvVAGxobgW/gbS2uhkSvlyaTaMS8zG5BlGyJ
	PgDhwElKF+xbS3UmNva1a0/2qxnw2N9c6Bf3Tj/WhBSekBzTI7D5hX8rhFTUXhxfzoVJ+
X-Gm-Gg: ASbGncs28QFn1G5KGZeeEXOojtViyTE4/smtwl4HptLigUBGJxS5noqQ3CUkwZ4Ac8b
	LHnZiEUPOBy+HdVj2mGtYQd7RRKCI+uI+LGfG4jImDRTrhibqo3kPvQ81DUKNlZAmP0nvs2vNa4
	ZVoazM6HRRyKmlb9VaXjvtLM6KtBCgOqazCPNJpPFuxrv3PY5gqDYkMn24A1JlhPEoYNNRlvpR+
	2FoESMNnEqVOnCQ3gjEXprf9RF/MKkPRu2KqpALsJT7T7P4Tuf0P3omD3X/HC5mrztyV4UzyUtS
	u5RxfX5eAUERknOx1GUuN/e7A6c/gQm7l5gF8cRoBA3mZncszzKXfVdaDwCCyQpM1n1ZscHmzQM
	dJHiqwggN5MS6VN5IDvwGp4SU2y8Z0INnizReoqLcbX5opoz5YeYDkLPKHSuWRZbnMPNSy1+HOT
	JJa2wkrmLWh8zA
X-Received: by 2002:ac8:4803:0:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4ede706998dmr44418211cf.21.1763064632789;
        Thu, 13 Nov 2025 12:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFopySeu50zsEQ516PeTyLmIBycowUIkiIbbJG3BWLcacYVYWdgBnMHXUAf/J7cPwjPRWvs9w==
X-Received: by 2002:ac8:4803:0:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4ede706998dmr44417871cf.21.1763064632299;
        Thu, 13 Nov 2025 12:10:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803aca8fsm598424e87.9.2025.11.13.12.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:10:31 -0800 (PST)
Date: Thu, 13 Nov 2025 22:10:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: remove unused 'apss_clk'
 structure
Message-ID: <sqdj3tn2zno4xbdywrijdnnqenlxlmb6wowecxfapzilzy7z6o@yiwqvg24iofy>
References: <20251113-ipq5424-remove-apss_clk-v1-1-e942e720cf99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-ipq5424-remove-apss_clk-v1-1-e942e720cf99@gmail.com>
X-Proofpoint-ORIG-GUID: GgzpQEl9jvZiK9foXVbxXxkPKU4TuNJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1NyBTYWx0ZWRfX1bnfq4j3UpUr
 nwYyffVyqP4yo5siLY+L5DlpY5k512LOV9JDolzoNYIXvxuBpqabaIdu8Cc1fssbdaZCix/7df8
 +/9kfpCyVjvrXj46jnBiPtmj3xZVbB20nxWux0x5l38+kRXRs41jMiWJhJ/m0yEtYPw2p1t/tyG
 pvtGsPNRDmNzjkCI0AEeZlLBQ+OsJfavQNDrSyhHRiAgLNA/go8+Upk3ZKAV3AETVLCgy6mo2yi
 tJr1tu61y+5aeLFUW86Ueq0A7e81Fbv9J2IE35Zel2b+3H+QliuPbDBsHzMN7OuTwMKg2Aq/qGZ
 LqQb2nrf+Ra5UCGEss6Yek5yzh39EGaZHNwvS/I9FbX7b13B5cj2TngrYFZXWOWaz9QLKFWI2A5
 1E33h4Db/G0nNLmtiNLhjtgCyRLUlA==
X-Authority-Analysis: v=2.4 cv=Wa8BqkhX c=1 sm=1 tr=0 ts=69163b39 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=55GwOStj87rXbfvUp68A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: GgzpQEl9jvZiK9foXVbxXxkPKU4TuNJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130157

On Thu, Nov 13, 2025 at 05:15:25PM +0100, Gabor Juhos wrote:
> The locally defined 'apss_clk' structure is not used in the code, so
> remove that.
> 
> Compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/apss-ipq5424.c | 7 -------
>  1 file changed, 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

