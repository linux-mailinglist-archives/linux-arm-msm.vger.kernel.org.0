Return-Path: <linux-arm-msm+bounces-97404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIkzFTnls2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:21:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3952815D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD9BE3008E2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6210738C2DD;
	Fri, 13 Mar 2026 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9LMONvk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFTAgee9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507BC38C2CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397209; cv=none; b=WiJ25EB7gHj0bHNzwt0A32Neb2exFa07v88w3qCxCIt5sYizNfZIBGrB8F5ZjAzZ8NSuw/w5b/+2DhwPyNulZIwd1oL5gGJtQllAK+vNcFGOOx5r4JivgWLCvnSoocBTJ15KnxuQfm/wVKVXU4IZkewF50EkA8uFeCiUSCenEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397209; c=relaxed/simple;
	bh=QRHhS17FmInfjfzaTInaANXQhYqZtFtOsmaMJxe295s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7BERKiAYubAOotmOSTVczuVwDW9kaxoRle1rp2S01EO492kxFuKA8niNqbcj6gqkJrXNepUXLtWaEkTkwBb455HhLVQMWo4oFEsdQdLzHZXRENRHhbj5WNpPKtfduFZ2//0gwW57H53/VYaO51yUB9ao8wqSKEf+O4qk11DpgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9LMONvk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFTAgee9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thGH3342923
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5GWyweR8GJyu+q701PruVpq5YRzGNbSIhWI0RsI32o=; b=O9LMONvkz1MJwVu1
	4mDumvWkef4mDErooZfYBSNruArlCTELUZkrsygODy4kd2n8IyqFk4hxKvzZ/2qj
	13hl4795ZH1HafqOsaz+8L5e1B6gWVPDlv0qxwZ0yJkm5N5TmRX57I8Rj6GTisbV
	8nMBpBi25GyRKuYPPjRCCykGTbNLd6bP4ZZlLu+zHHqX5TwRfUlqUDWFCMLIS+k8
	qZUe599yXdwUwMz8w2VRYR3LaSCRnLp8Ka3h1k+Ut6xvlqnZQ3XpDH88xuzZaODU
	CEB4myj6fqmj2ulsCnx/voufWff88GW+ptRGQBdLCpUQOx41oAxWpWyUw1rf2auQ
	EPsWSQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4c4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:20:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a1be41f9dso11552226d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397204; x=1774002004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5GWyweR8GJyu+q701PruVpq5YRzGNbSIhWI0RsI32o=;
        b=gFTAgee9pFHqOpm0ykfZdW2Z15AKFKe031i79WSBvQHrwAWgJdxPuj7V9A7gicFDck
         BXdxilVAHCacGTz9FLg7r7WMqpLUKaaYLweye+VtXyG1gRdgYSJa8PXRnrYe1klp9XLF
         oP9Aw1jeMVt7VdFnnJo6F9idlKQ8h5b6R0i84jfgPml05SkwWy5oOfga9uohr97kWoxV
         EdFIRmr3HsYRcJKh/qS7zs9Lcgxi9MBwvFOq2dII9kjyIR9BixZBCmSMa5W4z2xTHEjs
         9sja8MpoP74E3XL0wrriRDTbwlgItFnnGJX0PGlL1+xQDxifkTp59UNUipdwth/VJBRJ
         /NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397204; x=1774002004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5GWyweR8GJyu+q701PruVpq5YRzGNbSIhWI0RsI32o=;
        b=q6xfYJK5mV27o3UyAlmsCmnBA6OY8JPdK4BXMoyJ34gi4EgeJwDsUV4T/St+6Y0UVj
         4Odg9midjfC5d1dW0tbzxAsEQw6GgL29dDKBcI/JDQ3vq1EWdCUt2cQzS32oaj3nT+gG
         et4eaozMyzD1vpFU+POLbhmJ2qB/SoI0YU6U8VtnV6vOCpYItlUsZ12C9BMoxErzxOrS
         5q1jjw1rhpPZW4Cbp6oU2JrJqbr4lc3QJfitvu2/illwE3L+6EqcCvjytqfR9EOFGO91
         XFbXhYvMf6H+A+fa34M8Bu6CU2Ehyv8M8vNQJ7Lw7XyXxh81bBED1Zlzwcgf3Em9VGom
         Tcgw==
X-Gm-Message-State: AOJu0Yyvmha0d8LvcgnXI3WnN1VW/NlLeS3owtrjxXrzfEal8EYgvUcM
	4hMQcWTalTVPJWT/8WQgY1fBSfX0vZvpI+n0c3gZcAPOzasyQ6m1uns4gc02z/z3hIs7hG5pbeQ
	yOOt/jce8l9l2juiPcS77uRALREKTgWU2dNPqNF8hJ4EtDhtcllVETLh/2TEaXTDM29jK
X-Gm-Gg: ATEYQzzavrfQ4QgKqftgK1niCPSiPoJXYheERDyRQndHnlNU6zUqf6/i7FsLNDTsaV8
	UrbiCsz0Q6ehH+0E6WBrHPenHYUPDAU/X0K8zB29h6nguBmzDkPwQTh3zyI0klLmi0tX9U3HgCN
	F569LvTQzwzvrvJu3C9PdWue81hPNOzDe7JoSk0qPmnhJZMQSraFyUt9REYksWJ5WA2S+WVeRc9
	p5MK86BJ9FeoPCYtXAsbvXT09oJkZLQsg9X6uXegt5e5sIFxdX/h+UIDSzXoijdGqAjot7kRiZ3
	BvrEB34lyFcX76clJr6elmi43KHXaFU27QZzXBwJw+S8iqdIvAvwG28MrybxSbN5imE7e99H5Fb
	7VJWD6K81q/HeUeqUJclCGH0PhHNPROy6voJkfL7T4SYUmIkAuDenJtLEHeckNKocEZkn5o1Ley
	+O31w=
X-Received: by 2002:a05:6214:5c89:b0:89a:44d7:6589 with SMTP id 6a1803df08f44-89a82032dc5mr27235636d6.8.1773397204235;
        Fri, 13 Mar 2026 03:20:04 -0700 (PDT)
X-Received: by 2002:a05:6214:5c89:b0:89a:44d7:6589 with SMTP id 6a1803df08f44-89a82032dc5mr27235426d6.8.1773397203880;
        Fri, 13 Mar 2026 03:20:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb1d20sm35152166b.41.2026.03.13.03.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:20:02 -0700 (PDT)
Message-ID: <19b36a86-12c7-4710-8f80-5e27c9c00e3c@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:19:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/27] drm/msm/mdss: use new helper to set amsbc
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
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-17-b7e8f800176a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-17-b7e8f800176a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kWAjiAJrr-NDWhif9U2bzeGL55Pyz9vV
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3e4d4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=e-ZaeZba6QCqovTgSgsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MCBTYWx0ZWRfX8S4BjiDgJ1LQ
 G6zKnKDRm5n1R5LuYkjMxA2xnMjUZ0NQrwyg9itvMWQbQt6dHTZisKX7PBTOOSGxjX7HwWNGn9r
 JYwiG81qO5BZsUxxQHq5tuI75vxQ9hp4cTbV+t6pbjZItxGMPkoWwRTkc1atY7/jvEYfS5pAlSQ
 cxjRxmjZ8QUFMGj0FgR2C9ojY1xhLq9fawfjBXqjtW1TvrygLky5vg9LEF69TqFrOhEwyzrOeO2
 oHp7+IerrNflU9+qsHEDVE/r2N90Mxp3okqkZ4obTKHmyKSPOw40eIz9y6yTzGP55001LObaa5C
 vakzgGF9yLv3pZbiGyNH4UBuVXovEnB7ZRR1RNvYaPNs+xm8zb/KI0SDMKIkeTxh8W6vj/O+4z5
 HrpeP/T2VfIPq471bQL+0+GISKgb8gSlbv95U8g0yNNRRZmuscpvG8N1aixUdFUoDu6M5EYInf0
 wI6mKpZvGPRNEh8eLaQ==
X-Proofpoint-ORIG-GUID: kWAjiAJrr-NDWhif9U2bzeGL55Pyz9vV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97404-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC3952815D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of checking the UBWC version
> directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index ca59bcdde7b2..04efc29f38cd 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -188,7 +188,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
>  	if (qcom_ubwc_macrotile_mode(data))
>  		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
>  
> -	if (data->ubwc_enc_version == UBWC_3_0)
> +	if (qcom_ubwc_enable_amsbc(data))
>  		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;

I know it's already there, but fwiw downstream doesn't seem to be
concerned with toggling AMSBC in MDSS (perhaps incorrectly?)

Konrad

