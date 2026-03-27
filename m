Return-Path: <linux-arm-msm+bounces-100278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ITDEEhoxmnnJgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:21:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6E343512
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BEA2300F107
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95E62EB87B;
	Fri, 27 Mar 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KABEZbvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KT1oBnGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9026B332601
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610376; cv=none; b=A7HwIj326pm2whHmucDZo79nOR8Zeqm2hvnVRFErM/Gn06sIoLk1N4b1Y/gZMhb1XJOSjVm/8KDvV/c+XOMAM0o6lLRFRriz1A0SGtWDVtjtF78wK1pk9QRN+ZGBHt0CDZFEEfMsciEcP2J7U39DeSYf56hspBw9bnanqASSlic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610376; c=relaxed/simple;
	bh=rgNeiO/smAwM31U3HrozXgW7YcAVwQxdZj37vQKkPWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0FAATXYpRCLBdNQ255FyzTUD1/T2L5pfcYUo8sANOyAuvKcnV8eWH9aFYWX3bonsoEgMkVfoC/6uh4lDWR0NukVmpQjK8XFMdVIJoobWxK5n7xdCjMfLw4AJzchcvCtkXbUcS3h1oGzAVnXYc82NqbymomhkENejoTxD5kWieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KABEZbvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KT1oBnGi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w4261860270
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMjrA6TTi9yCOvGqK1ztiHGK4CSNrrj4NvPFBfXCxkE=; b=KABEZbvtYxZx8vLm
	lxUSis05lkXMQT0EDjSszvh1unwpCRZ1REiD3tfUAEDiX1KeHbt9jtFwpZUsRA+m
	X9TGPVfiPq+xvV2VngUk68Fmsp8SL65NwBI4+nYhV8xAmh6F9/fDCexAgQQ5J/TC
	OOO0hZAUqRUQiBjzP/wMlsVB9+Etu+VHzUnDdXhsF5Qog72CBKRRML4t0d177Coo
	gCQZvPHkPMgtV/Fxnz7kW26dph5Iu6GEu1n/dOkzwRcAL5ChSp7cacn7cCs53EUr
	i4RLlxek8kyCl8UznEEW7pkA9Xaw1g3zhZfiHvxxYbSMFX+5L8Ti39o18dkdUk11
	rLgiPg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2sbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:19:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2d15c360so4993351cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774610374; x=1775215174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TMjrA6TTi9yCOvGqK1ztiHGK4CSNrrj4NvPFBfXCxkE=;
        b=KT1oBnGiiH/vpAyozaN4fEvQB0bMORIyyrjZCnC2PT5oUqjyFLudOA0ZwevlwIMafg
         5oG/pq1XWpcLEWkViF25oDLVeF3U6n9rvJFVneQ7rmlsR8UzSeZB4ZIakSAuTOlTPqiR
         Nk66LIJIKP+AZbn5cUroxQm1kKyLmsqruHU1bEmy1PGgCvNrZP2D/o9UTPaAvkDspWVV
         Htm3PWZPujcHLoMJr8NWd7a3aji3AJgOyOdswukfOP2NIxNyoM58kpMKLJQj6oeZR0hp
         z7WRlFk8MAMoVZ+V2krGv9sjLLh4PdRH+GcRuadsVqZA9rX8nL6lVSzdZJH2r985RNL0
         FI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610374; x=1775215174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMjrA6TTi9yCOvGqK1ztiHGK4CSNrrj4NvPFBfXCxkE=;
        b=Q25cAzr190eztEtruLW+E9Bi4vXtSlW7YvQfw9kjzY904jDmgVlMk3PiSKoLiandoI
         9VyTyOlXKDoL/KL+QARdIC+diH8jiY95LfTxridpMWikZxbhwFQF51FdDFksYChmlsOT
         /7VApx423oCW+gXONehK1Jl1mFYC+OxE8IDm/WQS6zWUTcgoo1jikUX09/UUyx7WiHYq
         D20GcUfcIeMG3oXJyK2kz71vRvszONZP+g59gGjyZIg2+J74ooSvda+0blXdjbZVe3jU
         OpkbkCEe8tbajJV8RWxIuYGnBpX4iQtbhpAK4c6WzyrrRY9apYTq+VQyU1l9PUGsAl79
         PDqw==
X-Gm-Message-State: AOJu0YyTUcZH2QciYsDibFLSQEbGFyE5hfFLkZSqQLkCCM8emLU+advD
	FUussmHVDCVEA5qjv2tHDSMlEkVhUFZ0j0hxss922JATfxDknAdH98a2vXpx/7sUITPE7M+eF5B
	CP+Nzhp8iaKY25QyBFScjccaOdfmnGEYHQ1IYJjz4EykLQMm9dtsi4g253lsRuKeRPJ/v
X-Gm-Gg: ATEYQzytWo0zNUaGkdn2BPBDzhuWEMzl3F18KIe6Ue1EUqqtgIOHuQqzAU2UbCnxY2d
	ppSvaWzLHoswNKIbnRj2cPGNUfR873++2vTWu7COkHTzZLxy7IvYHYAtQt9HChv5OBpFgkJiEjh
	hB5TERfY0vASqi54Q3kygLje7vD9otqfB1l8+ZB1DBdr6gu2mIU3yB/ADcEXA+W46xYI5KDn2np
	YhMQdpA7z5PTxXKe/2Ei9rR/4ZhqVuS2nF2LnLl7KozvRRttFaP+dXKyif1gdqrrKNXOUFQNMJ8
	OdCadhHOc0sMI+Lzxk2M6pKO1M1yXIFmXsCkI+ZpJdp3jxBqirhmzZW/uY5cRtDPNtu5Le5q6qx
	9zNHeMMzQva5f8vzC59zKCvi2c17wB8tlfOqtm7Z+cPB/7O1JvkKEipgTp0YECcg+O9WuvstUWe
	WJsow=
X-Received: by 2002:ac8:7d15:0:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50ba37fc306mr21756951cf.2.1774610373793;
        Fri, 27 Mar 2026 04:19:33 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50ba37fc306mr21756651cf.2.1774610373380;
        Fri, 27 Mar 2026 04:19:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a4ec00sm2110378a12.23.2026.03.27.04.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:19:32 -0700 (PDT)
Message-ID: <b3238d53-f384-45cb-ba8a-c5b572d27e2d@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:19:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/17] drm/msm/adreno: Expose a PARAM to check AQE
 support
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
 <20260327-a8xx-gpu-batch2-v2-17-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-17-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c667c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2XNqRJ050pmYQOFmOusA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: j7tdZeUbmUiEoeFu2AWL1s6VAaNjnVEO
X-Proofpoint-GUID: j7tdZeUbmUiEoeFu2AWL1s6VAaNjnVEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OSBTYWx0ZWRfX75+UJF+P4ec0
 JJ69sbsnvHR5RkdstIMKpLa1g3QvLrcgAHsAUAAacGv1h69ZCH0SAZcoZ6XPjDaX0lA04HI4Csh
 Srva/HcyBMJa97Sy7Vb28lIooCVhfhLdamUR9BK75RtJGsHm3InzyfKjkh4iTijAmAZUNylrMkn
 K9YobCECWPWZvi0WVg9V0XiiU6wI746iAwK1IrHHRzRvb3Lh766UPLKq758112+zH32t9ORHgK6
 /Dfe1o52ibupUwdR5AwdRzJLSJSR+Zk3R75hcru5l9iAjXayXpQc5e7SkMm6dIzwmDiSglgabgS
 rHu+ixrsaeB8Y0r+x+P4uNzkYGL9tmVcWnd8L2FI91hQvTgdXnKCksqZ16xULtyGP49WFfj20hx
 Z8UXOcEcPoGWNNjc21VmduNCXXaDh2ysbGVwQxLyIlZhzNjV4GOC9SW1geGU5DQ0ntwgleG+azk
 aGpJRcsW344InoFxnQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100278-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 97B6E343512
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:14 AM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is required to support VK ray-pipeline. Two
> conditions should be met to use this HW:
>   1. AQE firmware should be loaded and programmed
>   2. Preemption support
> 
> Expose a new MSM_PARAM to allow userspace to query its support.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	case MSM_PARAM_AQE:
> +		*value = !!(adreno_gpu->funcs->aqe_is_enabled &&
> +			    adreno_gpu->funcs->aqe_is_enabled(adreno_gpu));

again, this is a bootlean even without the !! because of the inner
&&

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

