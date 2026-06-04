Return-Path: <linux-arm-msm+bounces-111173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VKkDIKtOIWrvCwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 12:08:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E411B63ED64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 12:08:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PMKjYmYg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EXp2E5RV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111173-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111173-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 112FD3134268
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 10:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BD3376A0E;
	Thu,  4 Jun 2026 09:59:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380438E8DF
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:59:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567164; cv=none; b=QfSFtzgQu7AUs7lERcPt1CEAZQKQvCpBNJqR/wJBR056MiOCQq4AHiM7XpMbYkdYNNSGq4hmRXnwy0yfzZa+rqWQ+adUN6LI80cufnIM0aT6spZ9AFh+O/d1da/xlFxP51JtSpEXelAeI/5A5xD5rjXSx/LEF2gHE8NmTARtx9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567164; c=relaxed/simple;
	bh=fBY9r5p/Res2urKB8Xo5iKQi34Gll8o22sLon6mFNCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIQXTWYRhaIVTEyKCH1Gnew5DjLgD5kfCWrQBjWHOa5H+iGE6lgamcB1l/WEFrXrWSlOIn+Esf6UHqzxMG30EOPvJo1XQqwCmjqCsvPZzp489421VHfkJSjTCTjpe2XVNyJlqsFsrpGhv993kTMHsmqw6LV/ECAFdtkTB9iG3jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMKjYmYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXp2E5RV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548c7qQ598270
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 09:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUsiL+sMTqw2BA6pSSQlXtUhqDxTlOvEKEB4d/D5wsM=; b=PMKjYmYg7tDzkNfL
	54nihwYnoojM1vkFUagTBALspgONiH0Uj0w2NCfuesxrLISx7+5P+ZmTeAYJjvQm
	sv9ec08U3WQCidSf7LwqpEsVvSDY9Sf48mVB2wvpTLiFKDCCAv73IY917lfNqgvb
	z62yun4Z8V0WLx1asbVW7kmMFTlrsZVRynKerUZCjWH9NQ9GPLMaqmu33SK7x5lX
	Fi+wUiDyIQzuugEWJUCEATiRlcxu6J/wa2ZjnmKuJm1i8RLMwkNHrpxk+ctXQnn+
	16HFpKgbb67ACLrx+KrcjiEK2jLPIfWF4Sx5/cb1IUPShQN3hxhze6XZ3N7I7LKV
	v3mxOA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m1rd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 09:59:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso450657a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780567161; x=1781171961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUsiL+sMTqw2BA6pSSQlXtUhqDxTlOvEKEB4d/D5wsM=;
        b=EXp2E5RVetYSd7qsDlf5hBHE4umiarWWeBNg5tQlzKvKmdCDvLlB+Es2u0RTCveg+o
         DdA7kT1bl25FYFkA+Zisfsx55PjbImpMZHnEvBj/pDcBMLwg6Z608x3bQwBWn3l9oYUc
         wYl2K78T7N6ZApvclLCXUvmBXnaWFkU+G/gTi0/dWbDiNDpqfmCPvzarslHdasAsev21
         SUY7PRiGe3hoFUhSn4dLlU60E4uNBpt6quKcfeppY8RgZ8e2q7ulwDQ2RjLAvadhWYCv
         4NCo+KgFVqWRZeDmAr/Nyuina5xnIdNcPPq+gHZ0Erx3LObV43lneczBL6X5Jm48Pf6/
         fxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567161; x=1781171961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUsiL+sMTqw2BA6pSSQlXtUhqDxTlOvEKEB4d/D5wsM=;
        b=IKQJC864J6Rj43/dTginlB//GtNxtXmFpy5TtZKQJLADa3pnL2uqTClnerUyF8mZaM
         BlJ+k0ykhILA9yXXcRhJKqg7BCmPr6LgK0Tnj04TZ7gIyTmirSLJyzsuRqHOBxjftAsD
         dzY2GCY4JpMwdF2rfU3oCZUmfckQqppM5jWuUA5sPGvxbxe3xBXmx2+QS2updkTU0/L4
         iAcm0cVubWiq3zlrue5kyTP4SVmFIWaLyWJcnh8i/Uukp1o/P1oaSHuyR5HteO57aAyz
         Kj1f60/3hCGWy+R/hCS+L48DGOyMNSDojuAZT8uIBK8F/FDrvSpJNIDPehri4mtuAvgZ
         9S5A==
X-Forwarded-Encrypted: i=1; AFNElJ98js8d8o0EHa/kZnyoC3fJSFc1eDaGQZYMtjv21hghYWpCIohlER1kpG8STn1ois7sASx3D32eemGma0Am@vger.kernel.org
X-Gm-Message-State: AOJu0Yzffp/ZQRh9UqyH+rzXSznUzc3jR8S7iunv+YhHOIiTPVH7yu76
	yAqrxScxZcU/WDa+DDCGNhB6R4/SZ3a6l0ospqSvXiQK00+ofzTG+7cRn4XgTh2rXTthpIheN/b
	AqxCEbQLviRB78rg+CGRMWLaooBDBdowvSfrVAFHlQyC9/2ErxRX2nmTR7GplH+aFrnM6
X-Gm-Gg: Acq92OHRR3mh83F8PzufxPb7qjmmerTOMog2kmUVYIgUZEGuQ6c75qWcchx7MD+2f54
	6HM5oGs1WHd0dNSQ/iARUJqJURK0PK9rKzSVa/1d7q4dPBAdXlXTuN5Nug9ZUHbvOzYyb1nrbC4
	7FG8ht6lMVGAl3Yr+zTS9zEbw4PMMy5E3Ih6hQXYDJy7KhnwF6tTLfo4YpSfysLCRWc7+Sa+0FR
	q+gdYJIM3cO57K1YaoyHMEcJePRxlDKlfKp9TLQjBm4onqddk2+KF8OLnHu9E54rlip9pOGzKPM
	2RXDRZ/qkOOtrMwoieieVG53pP2h6NUchV8cZzcSjACS2NWQolwIYu3CY4kOi/o4vM28hFe3Wc6
	gZDGrCWF1mlK9lb68zFB7bR+s0MvjaWx8pYtH7ItiszA8ko2/HVrKyEbdy0p7+mGYj7/fjEFUaD
	wzI62YstrDNR3ce3CE5R2l9fCBkCWP2sc1//UVkJweAQ+G9fJcLteHBAGgcw==
X-Received: by 2002:a17:903:22ce:b0:2c0:b5c1:8e3e with SMTP id d9443c01a7336-2c1639ec7f3mr78133295ad.8.1780567160622;
        Thu, 04 Jun 2026 02:59:20 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:2c0:b5c1:8e3e with SMTP id d9443c01a7336-2c1639ec7f3mr78132985ad.8.1780567160065;
        Thu, 04 Jun 2026 02:59:20 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d59csm50731415ad.4.2026.06.04.02.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:59:19 -0700 (PDT)
Message-ID: <6d2ca392-148a-4539-92b8-05bdab1d07e3@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 15:29:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim
 7x Gen11
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-3-57c70c23d0d6@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260604-topic-yoga_submission-v1-3-57c70c23d0d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a214c79 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fkFsjA6a2Lb9G7MwmvcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NSBTYWx0ZWRfXz2f+8WRiNI+r
 MemMi5E8QYUGSIc9FO72jiWR6ZyvpiIfWSLnkmlrbJXJw0bRI16gH1bKINu4VXogc5MBdN08AfR
 RRoLFWK12rwIZtEIu1lcn45wTBoo0iDJpintaGuFXJ/hGx2MbBE0lpglr2LZBKdcO225BVRmROc
 UZ3gDgipx1HQ8wUCtKqBE8Kwj/mooS2/7OWpXKc8PAIDFsGRVUDy7TnJ1Ywl2TsUMaA3771eXdN
 QgM7nRAoDw4qSPcsjK4azWgBHZUo1jbbWQgEZrgatwTLiCP2qVBqGzv1GtuTMPhuVKP+hPRmy5f
 xMFXcqqgbo+PjQ9pkvzOXPvPIw/APmHANM4TkGxusHVAMQ2oOK4wFI3baOO8ldginmueb/ZOhkc
 FvTPRnY0MhCHTZYWEZQXMcEiVWkYgz7hYtJ1CzjOnklJqjlQGtAWO6WmK97wmwgqIi9KYBeFJkp
 W8BS3h1e5tusrxPAkrA==
X-Proofpoint-GUID: BnsSITirY7UM0zEvrzD0E8tFieMc8pLQ
X-Proofpoint-ORIG-GUID: BnsSITirY7UM0zEvrzD0E8tFieMc8pLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111173-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: E411B63ED64



On 6/4/2026 1:36 PM, Konrad Dybcio wrote:
> Introduce a device tree for the Glymur-based Lenovo Yoga Slim 7x Gen11
> laptop. It's fairly similar to the reference design, although there are
> a couple of major differences, including a different EC.
> 
> Currently working:
> - Audio playback and capture
> - GPU, Display
> - Keyboard, touchpad, touchscreen, lid switch
> - Privacy LED
> - Charging, Type-C
> - Wi-Fi, Bluetooth
> - Modem should work on the SKUs that have it, but it remains untested
>    due to lack of access to such a device
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 1237 ++++++++++++++++++++
>   2 files changed, 1238 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f09c3990e90e1b25a6f7d618891948c5..4d2864b371e29925a3b3bf4de50efe709b971851 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>   
>   hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..e7eb20ea81fa4e9b735b7daf4c27bb0feeeb6060
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> @@ -0,0 +1,1237 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
> +#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
> +#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
> +#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
> +#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
> +#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
> +
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +/ {
> +	model = "Lenovo Yoga Slim 7x Gen 11";
> +	compatible = "lenovo,yoga-slim7x-gen11", "qcom,glymur";
> +
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +		i2c0 = &i2c0;
> +		i2c5 = &i2c5;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_vol_up_default>, <&hall_int_n_default>;
> +		pinctrl-names = "default";
> +
> +		switch-lid {
> +			label = "lid";
> +			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			wakeup-source;
> +			wakeup-event-action = <EV_ACT_DEASSERTED>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-0 = <&cam_indicator_en>;
> +		pinctrl-names = "default";
> +
> +		privacy_led: privacy-led {
> +			function = LED_FUNCTION_INDICATOR;
> +			color = <LED_COLOR_ID_WHITE>;
> +			gpios = <&tlmm 111 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			panic-indicator;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,glymur-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* Left side display-adjacent port */
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_0_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/* Left side user-adjacent port */
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in1: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in1: endpoint {
> +						remote-endpoint = <&usb_1_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/* Right side port */
> +		connector@2 {
> +			compatible = "usb-c-connector";
> +			reg = <2>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in2: endpoint {
> +						remote-endpoint = <&usb_2_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in2: endpoint {
> +						remote-endpoint = <&usb_2_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	vreg_edp_3p3: regulator-edp-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_EDP_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_misc_3p3: regulator-misc-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_MISC_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&misc_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_nvme: regulator-nvme {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_wcn_0p95: regulator-wcn-0p95 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_0P95";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wcn_sw_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_wwan: regulator-wwan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WWAN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wwan_reg_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	sound {
> +		compatible = "qcom,glymur-sndcard";
> +		model = "GLYMUR-LENOVO-Yoga-Slim7x";
> +		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb",
> +				"VA DMIC2", "vdd-micb",
> +				"VA DMIC3", "vdd-micb";
> +
> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			codec {
> +				sound-dai = <&left_woofer>, <&left_tweeter>,
> +					    <&swr0 0>, <&lpass_wsamacro 0>,
> +					    <&right_woofer>, <&right_tweeter>,
> +					    <&swr3 0>, <&lpass_wsa2macro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		vdd-supply = <&vreg_wcn_0p95>;
> +		vddio-supply = <&vreg_l15b_e0>;
> +		vddaon-supply = <&vreg_l15b_e0>;
> +		vdddig-supply = <&vreg_l15b_e0>;
> +		vddrfa1p2-supply = <&vreg_l15b_e0>;
> +		vddrfa1p8-supply = <&vreg_l15b_e0>;
> +
> +		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&wcn_wlan_bt_en>;
> +		pinctrl-names = "default";
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id = "B_E0";
> +
> +		vreg_l1b_e0: ldo1 {
> +			regulator-name = "vreg_l1b_e0";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_e0: ldo7 {
> +			regulator-name = "vreg_l7b_e0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_e0: ldo8 {
> +			regulator-name = "vreg_l8b_e0";
> +			regulator-min-microvolt = <3304000>;
> +			regulator-max-microvolt = <3304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_e0: ldo9 {
> +			regulator-name = "vreg_l9b_e0";
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10b_e0: ldo10 {
> +			regulator-name = "vreg_l10b_e0";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b_e0: ldo11 {
> +			regulator-name = "vreg_l11b_e0";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_e0: ldo12 {
> +			regulator-name = "vreg_l12b_e0";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_e0: ldo15 {
> +			regulator-name = "vreg_l15b_e0";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_e0: ldo17 {
> +			regulator-name = "vreg_l17b_e0";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_e0: ldo18 {
> +			regulator-name = "vreg_l18b_e0";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pmcx0102-rpmh-regulators";
> +		qcom,pmic-id = "C_E1";
> +
> +		vreg_l1c_e1: ldo1 {
> +			regulator-name = "vreg_l1c_e1";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_e1: ldo2 {
> +			regulator-name = "vreg_l2c_e1";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_e1: ldo3 {
> +			regulator-name = "vreg_l3c_e1";
> +			regulator-min-microvolt = <936000>;
> +			regulator-max-microvolt = <936000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c_e1: ldo4 {
> +			regulator-name = "vreg_l4c_e1";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E0";
> +
> +		vreg_s7f_e0: smps7 {
> +			regulator-name = "vreg_s7f_e0";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s8f_e0: smps8 {
> +			regulator-name = "vreg_s8f_e0";
> +			regulator-min-microvolt = <952000>;
> +			regulator-max-microvolt = <952000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_e0: ldo2 {
> +			regulator-name = "vreg_l2f_e0";
> +			regulator-min-microvolt = <936000>;
> +			regulator-max-microvolt = <936000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f_e0: ldo3 {
> +			regulator-name = "vreg_l3f_e0";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E1";
> +
> +		vreg_l1f_e1: ldo1 {
> +			regulator-name = "vreg_l1f_e1";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_e1: ldo2 {
> +			regulator-name = "vreg_l2f_e1";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4f_e1: ldo4 {
> +			regulator-name = "vreg_l4f_e1";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "H_E0";
> +
> +		vreg_l1h_e0: ldo1 {
> +			regulator-name = "vreg_l1h_e0";
> +			regulator-min-microvolt = <936000>;
> +			regulator-max-microvolt = <936000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2h_e0: ldo2 {
> +			regulator-name = "vreg_l2h_e0";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3h_e0: ldo3 {
> +			regulator-name = "vreg_l3h_e0";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4h_e0: ldo4 {
> +			regulator-name = "vreg_l4h_e0";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchpad@2c {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;
> +
> +		hid-descr-addr = <0x20>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l15b_e0>;
> +
> +		pinctrl-0 = <&tpad_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +
> +	keyboard@3a {
> +		compatible = "hid-over-i2c";
> +		reg = <0x3a>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l15b_e0>;
> +
> +		pinctrl-0 = <&kybd_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +
> +	/* Something @ 0x5b */
> +};
> +
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +};
> +
> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@14 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x14>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		post-power-on-delay-ms = <200>;
> +
> +		vdd-supply = <&vreg_misc_3p3>;
> +		vddl-supply = <&vreg_l15b_e0>;
> +
> +		pinctrl-0 = <&ts0_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&i2c9 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* EC @ 0x70, irq = TLMM 66 */
> +};
> +
> +&lpass_vamacro {
> +	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names = "default";
> +	qcom,dmic-sample-rate = <4800000>;
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp1 {
> +	status = "okay";
> +};
> +
> +&mdss_dp1_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp2 {
> +	status = "okay";
> +};
> +
> +&mdss_dp2_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "samsung,atna40hq08", "samsung,atna33xc20";
> +			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +			power-supply = <&vreg_edp_3p3>;
> +
> +			pinctrl-0 = <&edp_bl_en>;
> +			pinctrl-names = "default";
> +
> +			port {
> +				edp_panel_in: endpoint {
> +					remote-endpoint = <&mdss_dp3_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dp3_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +
> +	remote-endpoint = <&edp_panel_in>;
> +};
> +
> +&mdss_dp3_phy {
> +	vdda-phy-supply = <&vreg_l2f_e1>;
> +	vdda-pll-supply = <&vreg_l4f_e1>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4 {
> +	pinctrl-0 = <&pcie4_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l1c_e1>;
> +	vdda-pll-supply = <&vreg_l4f_e1>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4_port0 {
> +	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +	wifi@0 {
> +		compatible = "pci17cb,1107";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
> +&pcie5 {
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +
> +	pinctrl-0 = <&pcie5_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie5_phy {
> +	vdda-phy-supply = <&vreg_l2f_e0>;
> +	vdda-pll-supply = <&vreg_l4h_e0>;
> +
> +	status = "okay";
> +};
> +
> +&pcie5_port0 {
> +	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie6 {
> +	vddpe-3v3-supply = <&vreg_wwan>;
> +
> +	pinctrl-0 = <&pcie6_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie6_phy {
> +	vdda-phy-supply = <&vreg_l1c_e1>;
> +	vdda-pll-supply = <&vreg_l4f_e1>;
> +
> +	status = "okay";
> +};
> +
> +&pcie6_port0 {
> +	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +};
> +

Hi Konrad,

> +&pmh0101_gpios {
> +	nvme_reg_en: nvme-reg-en-state {
> +		pins = "gpio14";
> +		function = "normal";
> +		bias-disable;
> +	};
> +};

[...]

> +&pmh0101_gpios {
> +	key_vol_up_default: key-vol-up-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		output-disable;
> +		bias-pull-up;
> +	};
> +};
The &pmh0101_gpios node is extended twice here. Please merge both
pinctrl states into a single block, similar to the fix already sent
for glymur-crd.dtsi [1].

While at it, could you also take a look at [1]? It addresses the
same issue in glymur-crd.dtsi and has been awaiting review.

[1] 
https://lore.kernel.org/all/20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com/

Thanks,
Gopikrishna Garmidi.

