Return-Path: <linux-arm-msm+bounces-63314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C4FAF096A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 05:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989F01C20750
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 03:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5DE1DED5F;
	Wed,  2 Jul 2025 03:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEi30UPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BDE53A7
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 03:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428263; cv=none; b=nYD1kUG4Ucja1zfup+YQWjovauuwqOjVyBbYLPD34U9PtyBWKpnQTCPIkMbGQr/YxW7G/1EAAKm1Kpl8xweNOIfKkZBJ1Stt2Xp082ccAhOz62N3tx5NkuL5V5ymlJpEzpX9iN6i08839rksYj22bLVnl/+pcNgeaSwJyC8G+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428263; c=relaxed/simple;
	bh=Gbuc3GQ5YJqvpK3fI88NEhS8do1N5azsksWGgrAjPfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dor4igIjplDUU5bDqCdbUA+4id6uDuZ0zg5BVcJQJgZeHZOc8b/ozBATYf7Q0SPyrkMiljDwiznmyCmnEnJ2eZ5AwRznTsdFjbdVPbWZHCpyhFRF9aRMitcDWy3z4B1gOix7PWpRRhdcU8IEu6CihjW5LceC78TbW/NDh9xDxVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEi30UPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561J3aVM002484
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 03:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B32luW0Sw1ltGtcSblfZe+j06KEyJ9zkhx3k4IlmlpI=; b=FEi30UPUuoSGSfRf
	M9U5f/XhyVi/oUJ6zB5wflNxRDXDrApWQx1lDehRQjn8KmSxvQflv+4Cpoz8mZgT
	PPAU++VyU+CMsAlbqwV/FtWKlCfGdm3R7QWpNRGD2XZDp7AZbHFuKubOJFkdYafn
	qu/CzqXA7gCXNmA6CtNs+pyJmEvBuT9Ai41s0Q28hyLiJvrLFe+22B9fTQ3Ko4em
	ebX8SFOCZoGe+e2v8tCOlQ2aa4JngI8nlKjjxvIeNkJS6wJ5KoprBC5h4lC2AEtQ
	uusM6OyG9Pgc6pkZ7NKJGo51Jvkjc2Mxw7zZbRuKqmxTtoPM9UxlDIxYivGoTqSl
	ekaZNA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kb4w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:50:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3183193374so3103071a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 20:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751428259; x=1752033059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B32luW0Sw1ltGtcSblfZe+j06KEyJ9zkhx3k4IlmlpI=;
        b=cK/7WqWHnqOdjAz5wsVui6MmyOcdlrptAczmtM729f+omXkxuvN4VNlFVphg4z1X+S
         s1trbAz2ODwWlwa9wiY+J0RFIazB1ncRKGmdcGttS3euQaFEvM/0kAC4/TW4xdikwhE8
         K8gGUfg/II/wuHxTRhzAJHsU2uVzf9xxhFfs36go/UsYYrAh80bUjfvjGfczIE1niu1B
         WecPLqJ6mLU+nL2SV0AGyBIFSRM8OuaBzVjFgJXxlUAZxxBanoxPC3yy+27Gv9Np+2x3
         FNDANZ0ZrAmmJx+NQ8niP/1CX7AtCu1bA/0e6M001mnZZ1cmK+AGBNGXp78SwehcsghS
         kCQA==
X-Forwarded-Encrypted: i=1; AJvYcCUarDuUPadULuwKP/UgNWYejC5vmArDLOQ+6EoRbFuJ1Rt+QohVPQSn800rxfYwwhPaTdoXoP440DwXtDBe@vger.kernel.org
X-Gm-Message-State: AOJu0YxsvQ/YE/w1Z6liYCca74fWwShkyJukdMOFXztnXy1KcMsxgCKF
	MQXPr8xHrZVObanW3u9ode2Wj6yyDC7bX8aMriEp35/dkUfEcVEZuKfsF2rQ98NkqIBeIz8VSG+
	13ynHHWo0X9gKBoGAE+J2esrdgVGPx02AtaDw9UdLBlsIcBIV0gQNzo3tNUVmLI5MIswd
X-Gm-Gg: ASbGncuTg56DxFH/I0qyXvd1g1fh9HwqSnv3CGFa6jdnklvp5BEPyBlkGJY2NZ6Fqfc
	WLOX6XV5GjIwfpfRojvp+qcZ36ek7xRvPVNTYJ8AQHCdaLaGZDBvxpT0/XesAvNztglrhfI1FF2
	5mw3cXlmoic5+MTpuuiL54FhjIG7wuWdeY3f9+18DgAYgsw0g2AEh2soMqZ3/nVZzDqrkRO14we
	57jkwciAc0HOcKHw2PxXW1yhH2kUk1IM2GECp8DcV8P6SF+vYajL3U8qaljjBR6alqdl60gpCA5
	5Pb6qLWy2yFzXperzhyiBtSQSQtKK3J6zpEBxJuwAKtvtkw6tiXQDOrQXO1fbv1GqhnxJs7rRff
	yHov8ZfWlN82M12o=
X-Received: by 2002:a05:6a20:7350:b0:222:c961:af1d with SMTP id adf61e73a8af0-222d7dc49eamr2846930637.8.1751428258815;
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8idSmfFKyDABY7yM0MVRpAAZkjEtC9DI11EGGNuOUHqgZpQyGDn56ZzZiQmPlDfFVsxkK9g==
X-Received: by 2002:a05:6a20:7350:b0:222:c961:af1d with SMTP id adf61e73a8af0-222d7dc49eamr2846895637.8.1751428258347;
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
Received: from [10.133.33.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300994asm11767768a12.3.2025.07.01.20.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
Message-ID: <5f2a900a-3c8e-4b16-bd91-500af7d0315e@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 11:50:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6864aca3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=UYPn-Rg_fxiY8il1LgUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDAyOSBTYWx0ZWRfX0P6YDtYL7YzL
 WoRCKE9iQTQkOpYXwd/9uXEBc+C+Lo/D953+ew2dF0SQc6BPhCwSf0tWvW7V1sgfOC6TnfqIKOJ
 YQ4IEi1LvHcF8+ePwbgVUpCOd1SwUsZWLZqsyLdC/C8Pcspk82RwyETlidSyv+jUOKCu3tlza8C
 Mpk6ZB8V1r6sHC34hnacHG4jsX1X19bU376lvhcSyfuvvTdqmeQuEI5q3accTd3vrPW46DOn082
 C58ffDgcx3k3KdxP011kPbgqZHkTFbc0RKcDxjMCmnQbjh/xF8GBvj6J1ACSzTL+96MpKNm5ngZ
 B05lwY+iNcAEuldGQb1HivUX5PO5GAPwk5rSwiIuj4kOmvjenQYxeGbY1lit/TpxaFmNQfi48eG
 LEK1XSv223/dDPb2grnnSy8d7ISvthkIOU0gSE5amvL/X9TFV2R3VKlsbSypQSG1fjYTvDLV
X-Proofpoint-ORIG-GUID: vvbxmxmJ9VpAM5_VDTrTNi_Vw3j-Lgae
X-Proofpoint-GUID: vvbxmxmJ9VpAM5_VDTrTNi_Vw3j-Lgae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020029



On 6/30/2025 3:43 PM, Muhammad Usama Anjum wrote:
> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 4488e4cdc5e9e..bc4930fe6a367 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
>  
>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>  
> -	ret = ath11k_hal_srng_init(ab);
> -	if (ret)
> -		return ret;
> -

while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
_deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
avail_blk_resource, current_blk_index and num_shadow_reg_configured etc.) inside the
_init() needs to be kept as the later operation needs a clean state of them.

>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);

the _deinit() is still getting called in case ath11k_core_qmi_firmware_ready() fails,
making it a little odd since there is no _init() anymore with this change, though this is
the way of current logic (I mean the hal is currently deinit in the error path).

Thinking it more, if we hit the error path, seems the only way is to remove ath11k module.
In that case the _deinit() would be called again in ath11k_pci_remove(), leading to issues
(at least I see a double free of hal->srng_config). But this is another topic which can be
fixed in a separate patch.


