Return-Path: <linux-arm-msm+bounces-116544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eIolNT5JSmr/AwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 14:08:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 425CB709E88
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 14:08:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P8gyfHdU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YJjnF81v;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116544-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116544-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 135A530080BF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 12:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79B7379993;
	Sun,  5 Jul 2026 12:08:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F6936E47F
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 12:08:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253306; cv=none; b=qt1Xtd55gg5IlXT9o5nLKoOU/I+dZYEZ6gvroYol6jFalXIxnTd1S9SqbOtmtrIhJah81PVp71IELdhMSfXeurg2XcxyZ+KoBSgcOxo+inlGNceMEGXa4oL/O6aJqi/pqLh3evwjYCDybCvoCWDi/TB2egQrBDALjZ8KVmZbPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253306; c=relaxed/simple;
	bh=vS+gozlH8xzLoSrlTu45N+1Z/TIoHqnGVzFjee+S87M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhY3jyyRMeayey5Gsadu8CNcItcDUJmeA6T5wsNz5w6LV3qU1IWoaQgrVusxMm+NJ4pVcEUVlRK3oujosLmPGwudDlasPHBKRX3urOXndNV/GK9Csb4WXs6M7por2ByQVLz/CYNPqt5rKvs1O5HoJRAxt8/SioLlxYjO7sXkuUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8gyfHdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJjnF81v; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6653l8sl502915
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 12:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=; b=P8gyfHdUAKSYbw5F
	ebPDrmUaIX13Jvn7JpP3n+q2E1UyjZJPvFp1eFAxNT5r9u5//qLxaHYmrmLHJ1QB
	rU6mbCndxiBnsUpoWGzNIxON+uFnzuEJjJiR/vblAOxOhgzg421bfw+xBSUNyN3v
	dECLnkLM9iGPoO0cjONObMCUB3R1zLv5WEXtgnGlOfImdbX24ZtX/2OEsrFZ+s+V
	0hlfG17GbXz4VT/5JNWGKdSV3kvOrYRizXR81CsilZXcgfVSVbmI6i+0VBalQQ7B
	owMYY3wAmNW4t7tV1dMLajYQtYISi2YPKOpvUZGFHG2ONseW1h4n4GVRtwvOiLx1
	D0HV1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txejhvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:08:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1881662a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783253303; x=1783858103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=;
        b=YJjnF81vCQ0rRLsTaZ6c3E3kED86BqTSjjNSyfqrQ54i2IawkgOKay5TtiDqgujSsc
         IenVrYqtA+r85HvEUSRHr+aiv6uF/bOOP4zokKN2D2Bkb5VcaklDCABeHbZ0ZIUE1E54
         BgBKbv5vWiJm6Krm6GiLoCD9Sf4FBLbtq4+ysNXqJGhwBwKM4JfN5fuU5TGhpJ2uymf3
         FJJvs3E+SPa92p02/gXOuWcjHG1L1kUD6xv6Gj53doL0noAM2OqMZ2RCuGc766iFI99O
         VRFcDpKk2eTEK+T9QEDXxYJZ+d4iRxcXH/qRY3RYiRF+kmeB0QW2jgbOb0ocTbnJnCvE
         AUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783253303; x=1783858103;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=;
        b=Sy7pgZXLwym0UMvyB1C5Qr3dtIyqtIhlYyCLUA1zBpOJtweLqL6hXTIDhu78PHczEV
         D9q6p83KvYkrWQ3JLHKuiJG3FOEgn/aaZrV5sPXRlPkYwDwy/35PysG8NrDkEVDHq5xx
         TS45TZJcsINkvqSiOMlsEKIASUIK3khxwx4OEitDQ6Af1uYEo2ZhPnK/XsPcrRk/5Hs3
         tY+DIunfI2fq1CNeZGmi0ulhFSUeeu7DImzsX3XzVGUgNWLPC8WrRqaFTbeBVlkxQcEf
         Netc6Qf+tHNGHKDL05169dHXSTYLFki4YUWr4Lk6TjF8HORSpkm2ZC4uKIrcycMjv6ro
         fgdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsj8G+89ciFvgFc3NBpw3ziKOrNtbd3A4QP0Fo6nguLfyyU9z6V2j9d4feUGgqgaFqcrJhdDSKjmfPPn5E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6zSu1PygFaBrT8T/P6JS1xijeCUILNNi9BSti9dWHl/NgDi2e
	olOY7lvBUiPufn2VsE2MyAgPk1A34EhmeiTQ9iCbwRfmIv5TFYnHy9yF5ciQAlEToMTmqOtIPke
	Ga4LT6Kka+aJ9uaWAr+kABXfAzUk1mUBwE8mUeNXAmcNJeuzuaJHAtjFGl4k3e4OQ3Udv
X-Gm-Gg: AfdE7ck52AkDWuMdsHCHu66w1PQfLbAqIVzeouSVdBMag+tm4Ox4vY8zLVCHoFpaR7l
	I+fFycooLu5oBMh/SCebWB9loE7PZh16wgUCJumrWuPA+HNCIaWfn73QPK05wRRYDBQW1KIMPDt
	CjhNsmf7K6n3Z2zdbBdDMsaL4UMNrfZGHUGrUCW6KqNd7NROqi/pJzk7wtrZ3pGFCAreAw+tpN/
	lYJLf0aByvjxfLFaCxrx/LBMweLY05LV/Ou/PaZ00Aj00Mo26gSsn4KQm2JozBmu05WiRleEJUj
	LJx56NbOjiosJU9xeW1VlpwNfO+vYzUKW722g6d3IvN2ozqam3ndZ4QNgu5tR+kFfFnJFnCzE5+
	1Fdi9ajii6BdcOhAuDPPGcfByyY6A4TJe2Q==
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr11701451a91.11.1783253303553;
        Sun, 05 Jul 2026 05:08:23 -0700 (PDT)
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr11701402a91.11.1783253303057;
        Sun, 05 Jul 2026 05:08:23 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31151fff32fsm6354185eec.21.2026.07.05.05.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 05:08:22 -0700 (PDT)
Message-ID: <81c657b0-7e61-4db3-b72c-46c213c707e9@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 17:38:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] drm/msm/a6xx: Increase HFI GX perf level limit to
 24
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-1-6ac53de56314@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260705-kaana-gpu-dt-v2-1-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDEyNyBTYWx0ZWRfXwbiXhIldpGxR
 65J3GuFLp84gBKVKibNAIS6Qhfz2rsWfbBrxOm4w23ZLKSQZW67yNiev0waMAAkLFJwaJQ/XX/I
 4seJEnIX+s8p1TqReK2q3zKDj2Bi/Jk=
X-Proofpoint-GUID: 2ipvXIYDVKRGD1KssVQ7GB0yrOXQhzXP
X-Proofpoint-ORIG-GUID: 2ipvXIYDVKRGD1KssVQ7GB0yrOXQhzXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDEyNyBTYWx0ZWRfX1he6+Iqm4pgH
 AVgl+sqy+nisjrZsAJSsUcG63vSSxjQa1QdHIdF0pwxm2p6p2diEem7evVadpnyDz/MIH71uNga
 hPVrocjDAmazanCeiJi7byGDmlAjOo/Wy8ZFSVSt5ET5W2/T9mcMI7y8fhzLgG0btIdxgWlL5pe
 3jB9w6Fijy0VETgqfCv4Pg8hDdXw3fhhfwPRtJHpEGVBzr3wvrfBOFEno6sIHt3QpwY0BG+s3Vc
 LZlzoXqJqh05ubxkGqL8j20Enr2e+aoZhKKLWSjoYqbOYwmI+ynEFdpVeHGsXtV+dk78ZrZ4DkY
 hAGPpUDPRg1OZRnU3B38B5E7dmKJCZ1RZ4ZCfsdCcYR7BNvtFCKpKN2MkeuINxgJ7PQpNLsQqol
 M8Kb1WltrlvAOH6Fhcmh9H57DF1XAspCmDKIxeK0D8CWSHMeHtFMJZ+BYBr7OgjzhvUnUefuncO
 A2BN1geoBxSpvvV06qw==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a4938 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b2dfFiZiitoj8S2i2yzycg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PFfvJpCOjzcRVZi79uIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116544-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 425CB709E88

On 7/5/2026 1:30 PM, Akhil P Oommen wrote:
> Newer Adreno GPUs expose more than 16 GX frequency levels. Introduce
> HFI_MAX_GX_LEVELS and use it to size the perf-table and bandwidth-table
> GX vote arrays, and to derive GMU_MAX_GX_FREQS, so these levels are not
> truncated.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 3f96b10b5f61..62e3fb230cd3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -20,7 +20,7 @@ struct a6xx_gmu_bo {
>  	u64 iova;
>  };
>  
> -#define GMU_MAX_GX_FREQS	32
> +#define GMU_MAX_GX_FREQS	HFI_MAX_GX_LEVELS
>  #define GMU_MAX_CX_FREQS	6
>  #define GMU_MAX_BCMS		3
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> index e10d32ce93e0..f4da73a555c6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> @@ -5,6 +5,7 @@
>  #define _A6XX_HFI_H_
>  
>  #define HFI_MAX_QUEUES 3
> +#define HFI_MAX_GX_LEVELS 24
>  
>  struct a6xx_hfi_queue_table_header {
>  	u32 version;
> @@ -119,7 +120,7 @@ struct a6xx_hfi_msg_perf_table_v1 {
>  	u32 num_gpu_levels;
>  	u32 num_gmu_levels;
>  
> -	struct perf_level gx_votes[16];
> +	struct perf_level gx_votes[HFI_MAX_GX_LEVELS];

This will break older firmwares (A7x/6x). Luckily, A8x uses
HFI_TABLE_GPU_PERF interface instead of this, which is more flexible.

Will drop this patch.

-Akhil.

>  	struct perf_level cx_votes[4];
>  } __packed;
>  
> @@ -128,7 +129,7 @@ struct a6xx_hfi_msg_perf_table {
>  	u32 num_gpu_levels;
>  	u32 num_gmu_levels;
>  
> -	struct perf_gx_level gx_votes[16];
> +	struct perf_gx_level gx_votes[HFI_MAX_GX_LEVELS];
>  	struct perf_level cx_votes[4];
>  } __packed;
>  
> @@ -144,7 +145,7 @@ struct a6xx_hfi_msg_bw_table {
>  	u32 cnoc_cmds_addrs[6];
>  	u32 cnoc_cmds_data[2][6];
>  	u32 ddr_cmds_addrs[8];
> -	u32 ddr_cmds_data[16][8];
> +	u32 ddr_cmds_data[HFI_MAX_GX_LEVELS][8];
>  } __packed;
>  
>  #define HFI_H2F_MSG_TEST 5
> 


