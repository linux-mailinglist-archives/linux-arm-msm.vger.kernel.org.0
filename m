Return-Path: <linux-arm-msm+bounces-100276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOhUB8RnxmnnJgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:19:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECC34344E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5B52304972F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337113DF016;
	Fri, 27 Mar 2026 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiZ3X4Au";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xg1yVgSv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6B3B47CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610099; cv=none; b=rcgVhNQxQQfJ/YrovdgJ10nIcJ+mUDoGQ9N73nXx2fnO5X73A1v8Cz/fwT95pjomgqugVZJhf0fSkM999KOpTLgiwBsr3CgxcJU8mXrwysMBof3W2TcHADHdyYcx80MI7bcMG5vTm2A+V9jfmXs3zwP2FX0V92kEc8IyNjjqiB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610099; c=relaxed/simple;
	bh=4a7QGMzrkr2lx7ANGjCP3zjy0oWMmp3doHSUfcdsJRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXYZf9xArPan+OaOPWsg6QUW7qCHoY9GLCLGfTm+w0mp7SiKSIhYsEoHlB8sOVu+hTyoXAGLEPbbC0G6c33YJiQuugS94c/8XIiYl0ZaQvH1KtLMlX0APpEbUzAzUFf00exasHYegyAFGozUC/jqd8lQG7IFbGIPizK/f1aPef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiZ3X4Au; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xg1yVgSv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wFXM1710589
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxLxManeS7atN005uiCmL1S0V1YPa5X8e8IyDg216fo=; b=aiZ3X4Au91H7bWdc
	zdHtyRuzh8G9TtTdPwdq8kF5K6y8gC6MS7SZnPTX0jfvdYrUzlcvBPt4eIxRdP+u
	kGUu8MAFBobUa7rDxsljU+aKbIv2KkcwyiiYl07RXQFtsqy6kl3fx8U1JqqWfkhj
	0uz0mlZlnTjwZcs9QtvwwCiZktu30pueRvCvcXRJbdie5jj/W7U6MXfLaAgzG9pY
	ANidTq9Rvn1AMzRiBurlC6mF9YPLm7Qm/c87icCKW1VRf3noMxf+WkOnHbTF9nRC
	W8tjflx5l50fmzTbNmB1CTlgzvLMUP5/ZvlB1VscK0Z8zC872mChBkwBa4r4gprF
	QLUnuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjqr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:14:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b33a19837so7467301cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774610096; x=1775214896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxLxManeS7atN005uiCmL1S0V1YPa5X8e8IyDg216fo=;
        b=Xg1yVgSvwkhad2ML8jKzgCiJRZH6ak4MzC6kxgTTS4ykdtrunscBGPPJyNwUICH2nh
         28NSIOiBEMNUNLDmDPsMKKYZZXL3bm2S+x/oFWa9GHsJ99Z1H+O54vgXWJsWsvBC1lom
         MjzqICfeuQ8SuzPLuHWduEuR0js4Vkq4pVt2jJ76Ar5kkfcdKhVbzlaQdr14PSZnjvNT
         cxeGlG1Ay+fVwUMemt8rA2yqittw/jjxsu4B3GqQggmFzg7hsZYAjwqblLBhLNPYh7t9
         fOsNIiTbIS3BtbgleMUC3QtURbPLxBnhtzbLkkBnNSPRc5VDISJ7BUG2ThNq2wxl7oHl
         Kfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610096; x=1775214896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxLxManeS7atN005uiCmL1S0V1YPa5X8e8IyDg216fo=;
        b=N+doy4RVqUYxC1Q6gb7Nc7Uwagf7dj+oc8GBeMXGv8m1DYADrSbSYOSYHLtemr//oJ
         grLLkB0J/VxFziTmWXUVJnNoTf9hlUraK4K3cYDj5O8aIC2cGoH+hv3vhddhShx2d6TG
         vlHu/2Lj8XXWOQPfJG49IwxI2poIx01cYIkC4bWxUs+Cc6XgqUFvIN4W79RDrdCkIpdl
         mhfccnEGwYSozXI5l+qD9tr3BXkgBGAKL5tQ+27aBKaSrVTswpAuo7z9wHC5D/v+6q2A
         8ADA6uG7YFcKu/ggnXYQSAy4SLoYqQ3M83EnHQnJXHDLQM+/rqK+yzkHneZLjsYsxlWj
         aZ2w==
X-Gm-Message-State: AOJu0YyP+kbfnh/CX6cMgFYQ+U0rzqHDQIYSzSWFKawj+PB0NJIFaRYi
	Ci+6W4QoXM7zWWYUhy8AH0jtLWQnQUZigZoo8VYss0FbqQsQXZ5VnIn0g+wNY+Tim80b104Bwd5
	VlyMSaXg7wNcBoPX/SSvXD5S0+PSpTYSmsVHn52aqWLNZdzl+gXOTnWm2oRiyD5o7CHWB
X-Gm-Gg: ATEYQzy5ECzQLMjUKcuSRqvhW2iB/akWB33lOywZRJ2zKn9iha9oqTSbnyQdf2+ONUK
	GmUMyCpcj5+mPNNok7NFmOenv0wHPmGYNwD5Jqci3SDTHlbapHttYHKEjQYmiyICtVlr/Dys23t
	Jj3b7NoR5Da89lScXlhrynaKd8J0NXjdcQKPjGAQhdnCWRNRdWFtofu/k+/JXtd8G0w1rrIY6hB
	HGto6WDqykmoILe0oWMVrzfjnOKNTgjMtysvocMFMXyKiOvm8wuleP4G+U/0F6v9dwC8/VTYzTO
	23H56KhpqywZeQcigUNFhBqMi1RrfJalQbAaaSPWs9aUWOY6ewCjiHDGtxwTqAM3Z2SY6L5VJh8
	h4mOGX0hQcR6zJtaqD1sWfDyVAnip3Rmky1J6UDwR1wcLELKcLJ0+NqWjoPEHUKsxmnEIurTl0T
	Re51M=
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr18470121cf.5.1774610095700;
        Fri, 27 Mar 2026 04:14:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr18469821cf.5.1774610095283;
        Fri, 27 Mar 2026 04:14:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6c568cfsm2144120a12.30.2026.03.27.04.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:14:54 -0700 (PDT)
Message-ID: <0c26faa2-f5f8-4d77-a69e-5e18dc5b6e80@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:14:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] drm/msm/a8xx: Add SKU table for A840
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-11-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-11-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7KZszkmPV_sOogLzWHR_vhwL57-OmjQV
X-Proofpoint-ORIG-GUID: 7KZszkmPV_sOogLzWHR_vhwL57-OmjQV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OCBTYWx0ZWRfX3csVcakeJPnW
 EaZWLWYYYC5YrbtVOEk15LqQ4RYy5VuUpOY5dl7L7uXo4BXq4q2tT3OGQVva+TaI7M2vLcK6rqe
 m/GqpU3rOBz4Gxy3rNK1q46FAhJlvYmnbvZnz6X9TZFJI2u3Mrh+NjdAvo3Ny85QR6YrXhl7Awq
 WyD7btTdOry33PGe9w2k7bTZwOPSrW3XKJP71XoMPX9kDGKs6W2T5ocYG3gYG6vXqobveGRY22u
 ZSFce14QLcD3/qXjaq+J3KTmysGwHUY0rTklefRBFewNa5NItwPqRn1gZuZyc6JVC1WEDJlnLh6
 rrrqLWRvAR/mQt2vX6yc1Gjde+FJWY/2JGfg1WkBJhsgvrsKOe3JmElgTu5CiEkJuaIq5DmDC6h
 DW4oEL6F26FU447bKEJRWMEaxJZJqtdhO68Bpw4tyE3ea1LhWcWmH5Brf0Hko27CJ3Yr8lwKwJ4
 dBoAOfVAVE2CRsKnCng==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c666b0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Kh5seR-78j4Uxd7EPEsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100276-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 75ECC34344E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:14 AM, Akhil P Oommen wrote:
> Add the SKU table in the catalog for A840 GPU. This data helps to pick
> the correct bin from the OPP table based on the speed_bin fuse value.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 38561f26837e..f6b9792531a6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1954,6 +1954,12 @@ static const struct adreno_info a8xx_gpus[] = {
>  			},
>  		},
>  		.preempt_record_size = 19708 * SZ_1K,
> +		.speedbins = ADRENO_SPEEDBINS(
> +			{ 0,   0 },
> +			{ 273, 1 },
> +			{ 252, 2 },
> +			{ 221, 3 },

FWIW downstream maps it like this

221 -> 0
252 -> 1
273 -> 2
default -> 3

although it's of course just between the kernel and the DT

Konrad

