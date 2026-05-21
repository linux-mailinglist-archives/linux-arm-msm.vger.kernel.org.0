Return-Path: <linux-arm-msm+bounces-108926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNm/AJypDmr6AwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:43:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE6E59F94A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9302F3048F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3CC395AC2;
	Thu, 21 May 2026 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGbvrLaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKULL0p1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2063955CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345662; cv=none; b=I+N2+jiz12Cw1H/LvAb4VhBtMS7uGMOHslZowsbALK5tGqkuD79thBHOjdu0iS+GpCCb265iVmzmV8qtgcXYLsnKtjqtErq+y/He4TurW/xNF7RIFs5RSuu6iVyswznNnObFkeUdAELbI245IMbHKxN4nfjkMKgL0ws8bX8vAyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345662; c=relaxed/simple;
	bh=Bg3wv+G7Rugf8pCuJ1KGip4ySS7+uJ2LCfo3GU+OnGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAdy9e8HFWIBacDB8ak2TLJuU5rHhGcitqIGvOMexdUSE7PCs3l1V09VA/9dX//fooT7e77WtJ9OhT+0U12BuyeI5Py/zTPAWuXFVIKVIiDLsLyjSquoCxjHuxqfu3gITpQxyCXPlWnlorA9uIR23Qi1V4gmyUso5pC/nNsUwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGbvrLaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKULL0p1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2T2HO3816724
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gufQkHi4wZzoYH8TEPzFMkNzt1iU7P3JLBUE34HUhQ=; b=pGbvrLaL78us87ZC
	qoWvxsv7V2INxu/+LYewLf/Dj9+tEUXahR+lOB1X0Jn6fABWHOWTXz9IjuiptX63
	LDHkSGIRTxjXwrGYwGXEnQeETck4YSzpAKVmctSzjxA3Q5MHR1sSW2h8P3AO3uIB
	olClDTEjvs2c6UwO6AWstv3MzUE/DaqWAMcx/rbLwes0tAHjMYdL9Ju1yvFsH4td
	FamEMvDSnYWQQAPHrWkbljA26w1wV12BpCN7fks9DapiFsrMUxOlofal82eKGD9O
	y/eg1qOLPXIDCixysfptgpB//Pt+S6sQhrBHY1FLK4Go4EQ8hqIV9bfHbMLRiMF+
	EAoVPQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa0t4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:40:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba5f794825so45311775ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779345659; x=1779950459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gufQkHi4wZzoYH8TEPzFMkNzt1iU7P3JLBUE34HUhQ=;
        b=CKULL0p1EcEO3nrR0eGk4IGB5DFgnjUYe7twtl9QEgV+C/40QsAAzAbVq855sA/fu+
         /KgFMYo64ch66Obet7xV/w/2/+p9Ul1it9j7YVRoeSvFUkBp1Qxz0dBEq5B9JNAvDOr4
         NV/GGqDKsGVnz4iTGjWsmqKvjshxwdWR+VFQamuwycCCb+3XlfQ3MOBANrbfwJhGUng1
         uJmI/ON3WIdrsRcmkhSVDrrOqDrbkREMFi/JwzFy9r2wszM+LSG8JQZ6eS+5NIJKD3W1
         /dbssJW5Mvo5kQmL3H60Rux+zhr76c0f6as1K126SOzphMGQs9YJ/Set0EZ56MxLWCup
         9mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345659; x=1779950459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gufQkHi4wZzoYH8TEPzFMkNzt1iU7P3JLBUE34HUhQ=;
        b=VTESR6J7n/Km17pD7MgesPLk5GgzGqMYMTO68z99eLRXX6FjDmKxp+GLuuBOPBOZOb
         6K86F7qcvzIfSJ/wHLQNw6hYA66hNLxdhDaAcP4YP0LZVPA8ErsR5W3nujq42gpcNysK
         WHh1hIbd5/AMG6Q5tO1vHjuPGjWeIdk5Dwelenb/7aLreA3P0xyUO2xiOWTQL4d8MQMO
         FVa4MWZLrjb5cmIpzjanTEV6+qMPfzQUPo4NGN2i/Ohprf0zP7g/5bkyjYwbdxBEfekC
         zYyP4OnMemEpiu0YY1kKaR8SqyC2EnpcHhcePlWdM5lVn5IezfD4RNPKOLbscNMTfid1
         wD0Q==
X-Gm-Message-State: AOJu0YzlF0LwJNWm3cSnHyhyTQykPEJ0cfQQ5u5XwJB6HGXVTpfD7c+d
	gLKueRTo1niCLw2HViLrji/EreQretmWzQDQumRTPSh0CMBHH47SxOqixJmGSp59iwNfTrVWSDH
	0KkWLShuon8Xlzl3DVukYzhyq8I6KYPvM7swIr+zRWsR0dNWDH89OEsPLxim7w3jny4eK
X-Gm-Gg: Acq92OHmb1TZciMR17CEGKzeOsnrT4uktAOdD8j8UUU3PpMpK3VbUU4o4TJ4yd5ygo5
	k2IL8zDHZrM4/XA6bbFLy7O9UVcOPLAYy/eJmJ9zUq5yfMQM9FA0g7fNdsMl+RlV4hYwd/ulqCC
	B8RrZbyf/cQvukIFmSfRQ7Xa+cICEsuLyNib7W1ReGvn4VjvSoxxIdxmEyjRI1NDYNXHaQolm3U
	vkmdX/7UEpDA9SnmYy/2B141cjmhEvE142Iq50Qopzc6d2Wsg8FN9uSADGsThf7KuOM5VqTckXJ
	PC4uqKOn71CCnaHvZymp2J4/1EHNJ2yq+eZ2bWkztRvtv001idEwF4NltLyUSZiw/JwqbQ8tNKW
	ZCLmFOr2wNwhHSALRBOorBjxVoHB9gTK/WzMUwKSlS4eoJdTZCkIC4kQc
X-Received: by 2002:a17:902:db07:b0:2bd:9a27:70f1 with SMTP id d9443c01a7336-2bea3367915mr15247105ad.30.1779345658531;
        Wed, 20 May 2026 23:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db07:b0:2bd:9a27:70f1 with SMTP id d9443c01a7336-2bea3367915mr15246705ad.30.1779345657978;
        Wed, 20 May 2026 23:40:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm234673925ad.40.2026.05.20.23.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 23:40:57 -0700 (PDT)
Message-ID: <07cdbd20-f0c5-4be5-878a-ef23dc633767@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:10:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] media: qcom: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>, pgujjula@qti.qualcomm.com
References: <20260518072856.22790-1-sumit.garg@kernel.org>
 <20260518072856.22790-12-sumit.garg@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260518072856.22790-12-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2MSBTYWx0ZWRfXws/2fD9JorA0
 rYsTMEc4PtpKyRZUHoBHXCijpcuM5AD924FGi7UPjFdVKlG+/LEuhaGarTb+oGc/Vak8CHRgczL
 42VikGyIXnqQwy9MVDwHGHXV/iVhC4KJTSHkKena7PmccoLVTW+P4nK7WOORuswWk/BSFtO5ACv
 Tgg/nrDSB75aNSgCPqoG2fIW+4cw/54FVy9krVcxYhtfRckY9FaGXUQ8v68eRV6Xicrn1tmssVS
 L7/+oWGpN/M5monkh366ugW5eswNdBbUuEaQbbDBiGbHwwOUxbNEtoPa47vOlVHBIjAJJHPHuG2
 lukJh52YOcKWv8/spNA6yfwjlIriF0/hwttSJbVJoaP8lDrX5vsficjuD1VHgE8HeOqWW03fdQM
 Til0WQiUfcgNf+TNxFmBgS3fBTvE43C9y+FxxTCWnC5UmgYBgCUH1pMD/qM7vLKjqBDi8fRtswL
 nXO0CvOpFSRJoeOrA7g==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ea8fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=X+kW/DRse7pI7A4riirJBw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WXTWxIQM56r_4Oy2wpoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9hrGyq9rfL08ygpPT4WJKH1gcBtGhQCz
X-Proofpoint-GUID: 9hrGyq9rfL08ygpPT4WJKH1gcBtGhQCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210061
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108926-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BE6E59F94A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 12:58 PM, Sumit Garg wrote:
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..b3c5281aea91 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/of_address.h>
>   #include <linux/of_reserved_mem.h>
> @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
>   		return -ENOMEM;
>   	}
>   
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
>   	if (ret)  {
>   		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>   		return ret;
> @@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
>   						     cp_config->cp_nonpixel_size);
>   		if (ret) {
>   			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			qcom_pas_shutdown(core->iris_platform_data->pas_id);
>   			return ret;
>   		}
>   	}
> @@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
>   
>   int iris_fw_unload(struct iris_core *core)
>   {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
>   }
>   
>   int iris_set_hw_state(struct iris_core *core, bool resume)
>   {
> -	return qcom_scm_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, 0);
>   }
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index 63ee8c78dc6d..7997b8aa427a 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -6,6 +6,7 @@ config VIDEO_QCOM_VENUS
>   	select OF_DYNAMIC if ARCH_QCOM
>   	select QCOM_MDT_LOADER
>   	select QCOM_SCM
> +	select QCOM_PAS
>   	select VIDEOBUF2_DMA_CONTIG
>   	select V4L2_MEM2MEM_DEV
>   	help
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 1de7436713ed..3a38ff985822 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -12,6 +12,7 @@
>   #include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   #include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/sizes.h>
>   #include <linux/soc/qcom/mdt_loader.h>
> @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>   	int ret;
>   
>   	if (core->use_tz) {
> -		ret = qcom_scm_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, 0);
>   		if (resume && ret == -EINVAL)
>   			ret = 0;
>   		return ret;
> @@ -218,7 +219,7 @@ int venus_boot(struct venus_core *core)
>   	int ret;
>   
>   	if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> -	    (core->use_tz && !qcom_scm_is_available()))
> +	    (core->use_tz && !qcom_pas_is_available()))
>   		return -EPROBE_DEFER;
>   
>   	ret = of_property_read_string_index(dev->of_node, "firmware-name", 0,
> @@ -236,7 +237,7 @@ int venus_boot(struct venus_core *core)
>   	core->fw.mem_phys = mem_phys;
>   
>   	if (core->use_tz)
> -		ret = qcom_scm_pas_auth_and_reset(VENUS_PAS_ID);
> +		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
>   	else
>   		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>   
> @@ -259,7 +260,7 @@ int venus_boot(struct venus_core *core)
>   						     res->cp_nonpixel_start,
>   						     res->cp_nonpixel_size);
>   		if (ret) {
> -			qcom_scm_pas_shutdown(VENUS_PAS_ID);
> +			qcom_pas_shutdown(VENUS_PAS_ID);
>   			dev_err(dev, "set virtual address ranges fail (%d)\n",
>   				ret);
>   			return ret;


API "qcom_scm_mem_protect_video_var() would also need this migration, 
any reason not to consider that ?

Could you please check, if any such usage of legacy *scm* APIs, like the 
one i pointed above, can be enforced to err out at compile time ?

Regards,
Vikash

