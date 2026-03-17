Return-Path: <linux-arm-msm+bounces-98233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF5XNHqIuWmTJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:59:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FF2AEBFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4614930D8E07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA2A2E62B7;
	Tue, 17 Mar 2026 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4H1y0ua";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ov3v1V/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F53F23DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766146; cv=none; b=A7uk4sTKLoLgbV5tmNgHTQo2wuzXMp2OISlwg9f2K0RUNxAzmSXYxX2ueDQEvFY4i4DLJ1BXnJv79hct2ELY2kzcw7dCNNRC+bDvQt9942DYQkcFnlQM2GAX0QoZvEa2T7llboFgeUWoCJRianxaAq7Ck93uoBBkiUtiw8yyaFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766146; c=relaxed/simple;
	bh=dzQo8pIjVyFIpUhTBop2r5f458RB0osK21r8zdLhEiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ABbNp78tp1jptmBrfxO6ERazD+xs9Jcs94d0K0Rxp5i7aXlWW9wg1akhAXX4i1gKntqK3X/n8zEHMzL58Orai0NW3JzphSkXGtLHs2zM1TaVQUy4YHudPK1gOCQnfMhF8CdkSWrnfuEYz87QKxfUp+zEY1l5xBBImmBf6kMuzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4H1y0ua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ov3v1V/E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HEI1pO2188509
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 16:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	451Gt6n+OxCGYuKYdPgYhLoSVjAkvBCo9iM63F8lQ8M=; b=M4H1y0uap5vzXLWE
	nJnxdL7qOlLsLRSIX6z+4Rnb2J4t684jbo4SxBFE2JpXwFPaTzvM81paBveqwGoC
	oE7ISkAzOS8Vgke/Gi8sN17RKuoDco3se8oythL7/Hz2G+1L6o1kTESoNBLRJtic
	CTxNbfEpdKjYDL8AJgxR7kmDtAjwGw4cInfIt+apFNizmHwnKI+vMQmE5+JD1Fof
	M2jaDqaKjRdIyXJjhjEPXui3hXc4q7qj44NWOTznj1bMvSq/JvXUo6N1wdCyfZ8v
	3kNvzHYJlL48EisMu1CLaTYDlBOxNcp1H61IzDcSOunNtkTsId+WVJlf84mTKFJv
	V8k7dw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjrm2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 16:49:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd90958f24so320214385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773766143; x=1774370943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=451Gt6n+OxCGYuKYdPgYhLoSVjAkvBCo9iM63F8lQ8M=;
        b=Ov3v1V/EERtL5qJtf+fwSa4xjtPIixZPM3MA0qEDaFgNH8m7INwIkF9jsJ+jCxoyV+
         RQekHkzMZBUWWIaH5Ld1pdY6ms8icy2XiJNOFkPLBSVM/hJlFcp2H+TOGzXFFfFOdGGQ
         Rl3x38b68QYp9VoQ6QEffWSphEsqKLsGfoBMCKcw824jqfdAiTmZhDsqzDR0Cbu0QqC9
         k+W3bICsZCvAAYqk+dvs531KJBqR/6MaVw4cU/JI4l49m7c81hp+vo+HkQpK0t673I1s
         7k8arwnAM/LjueJuE+0PrGueY5+GDme6Wpd/mA0Ip9AphHOkWKtkbiCZ1IuD/OiEAsAC
         3Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773766143; x=1774370943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=451Gt6n+OxCGYuKYdPgYhLoSVjAkvBCo9iM63F8lQ8M=;
        b=NsHMpRzaautFHmaWEhMEtD5uNoeM+c9vPkAjlQeBnXqad/vWr34//VRbTjBn1a2jyt
         sX9fvgEVQiFy3VPQDyBwbb2smksj06NhfQbBVDHe8KibHeTTzT+u4Hwv5x+Pqw1FDFpE
         AB4hlYlvKgrYZojXiOPr8r7rH2DovyGyyXTQg9PguZcAJkKR86qTlVUQKj+2M1/Re7LP
         pBquCf+pM/c6R7rI/bM17/p4JauEIzcaegFfAsz/vaE1YgLAa6WHuPZz/gmZiJRFwvuz
         QmdtevnTHt98XlIrGj9N/9qbND46rJou6kL3PRKbNKiXS+hwL5titTzVebeUC2v+7gXI
         2tnw==
X-Gm-Message-State: AOJu0YxCn2aah9d8DDT2LkonQYckyRuMUgCKrgHvkmF/r37XWQUokeQG
	ijZ08LcKRCJXTb5aNoentPtbL6ANIRVYZouryWUmQFZkYPEGtjg5dz/YwffUdoTIG70jPrQgoY7
	CfOQOro7zrycBPlcGCxvNMkj3NVKPTYkY8CDigd1ZuKtXcMdiKUTC/L+MQDbYRQsmK64w
X-Gm-Gg: ATEYQzwFO+U4BOtRzyVzQ09U6AMHMrGRlu2z8m+f3vmNBrhXR67LlbLTtWHOXyznA0v
	7oBuuelK37DbrhBMF6RznMQjbjyPVVpfRE0nnwJ8jo7lzkUb6nrLpAU6FvTGA73iF02cNjazTc1
	fFsQJ2kqlC/LbQp/kO+sdmQ7qog4HhZ+dawbNh1W3X1g+CvHMAznv4RxDQa+JP/ExH/iQmAyseJ
	MwOlqSgWvePCf8MREGnIXVY1AdAsNCE+C9SeiC1fyEBluionxxMDcjk6onih7NZEpnVCiyDZbcM
	w9i+058Pob8DAvskN45E9O+b+8nQvM1nyOjbyJoaJhPgnCM1QdyGtne3XGfbJruRDySls9Zh3pp
	L4iuO39DCnj4BZFHK7wY++xypLVZHuXqA9XfsqwiekxDsaTJG9G/rYVX37PpF3rFVmmP1rVYu2f
	hodoM=
X-Received: by 2002:a05:620a:4095:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cfad376157mr19976985a.8.1773766143563;
        Tue, 17 Mar 2026 09:49:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cfad376157mr19974685a.8.1773766143117;
        Tue, 17 Mar 2026 09:49:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13ee739sm21035366b.12.2026.03.17.09.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:49:02 -0700 (PDT)
Message-ID: <df44b8d4-98fa-4a9e-9c24-b408f406b124@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:48:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: don't try using 2 LMs if only one DSC is
 available
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-fix-3d-dsc-v1-1-88b54f62f659@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE0OCBTYWx0ZWRfX30mi7BbLtak5
 UsdhisT2qM8RKmjXmgSz10Q3qqBA2kxWXxcEu/lYUTFK2HFJ4qc28rSEUpMKsz3ddRG5fAxSGfR
 XwPKz9WsOKC0CPGSHuuInsZ73Qpd0XwXdcMANpGsF8U/rjVzlh05WZkB3HYumTbQaVYPUMMhAUc
 Scxo1ZZa28+HGW6R3Atr2BIRNtciL2MF1v9BEICbzAaf2xdUQlPFxmoZP0r9LlTfvv0pzThvtOi
 NyQ+TAR2F6YiSG6tFMQDcP4fsZ57pGUSL4eZQDbXr4//QJpUUlyEKbX5bfpx7/SWEwq/TIpey6X
 yS4IZZehAqDoXwvcQ4XlzmLpgVAOnu+Fz/VrTMgJJX8coaw/RNqaZ+pdmlOwcZckTVQ65Qc2ybU
 3WnKDS1MhnI8AHPpKlzKjx8Hbew74R22bfjmgyZt/brYwUI0zSFyUMUIGSxBuWgJVVkR0uEk0KZ
 KUWUQ2k26jHMOmEpaKA==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69b98600 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=LbxHV1oPoWewQDzF:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=n8dURotSPeuEtQbmUPwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: xnr9BzU_Jblxl-0fWsnIfM4n8D78HRyh
X-Proofpoint-GUID: xnr9BzU_Jblxl-0fWsnIfM4n8D78HRyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170148
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98233-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 339FF2AEBFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 4:30 PM, Dmitry Baryshkov wrote:
> Current topology code will try using 2 LMs with just one DSC, which
> breaks cases like SC7280 / Fairphone5.

(why/how?)

Konrad

>  Forbid using 2 LMs split in such
> a case.
> 
> Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/r/DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com/
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6bf7c46379ae..96b67ea3fb4c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1410,7 +1410,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  		topology.num_lm = 2;
>  	else if (topology.num_dsc == 2)
>  		topology.num_lm = 2;
> -	else if (dpu_kms->catalog->caps->has_3d_merge)
> +	else if (dpu_kms->catalog->caps->has_3d_merge &&
> +		 topology.num_dsc == 0)
>  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>  	else
>  		topology.num_lm = 1;
> 
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260317-fix-3d-dsc-4b073977ea19
> 
> Best regards,

