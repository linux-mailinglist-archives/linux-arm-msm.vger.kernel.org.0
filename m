Return-Path: <linux-arm-msm+bounces-108124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC+kDq3KCmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:15:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABAE568842
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCCC230021D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196803CB2E5;
	Mon, 18 May 2026 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Igy1keKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ud+AI2LY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D109325B099
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091836; cv=none; b=gIHtDO6YbALxxPO7bYlVRBL3dPJg9/x+jyurbkQxy3LrtXpehpOzKCqBNeDsM9YCUiKDfulsoqQqt5EDhJ9oLLdICoYoc7/LcTagTMFCcqrmx+5Gf+8dF08ndGqP6wRv9Mr0jv+pKpuSvl6thrpIilhkMVckyukmyaoP5QyJNfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091836; c=relaxed/simple;
	bh=TypP23aGH9V87ApxQ62dgrSHP9D4WbUjbUT6akzCSrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7cTPCpXUr0o4of9RtUazfvN0DvFm3wuVioQCCEwdmAEBbZxZWN9ZPvkg1wLNL/vvMo5xCDXlxRv6nAZ/x3G5pedFaNEB8vVt+UXz5wDYDAO6dYQ8+Cn1EGjIuqWFnSMCX/ol3UTSvyi6uH2YH9CgagoT/ASpzOs9j2UM0vSyPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Igy1keKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ud+AI2LY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7KtNM230808
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u16NnZfYSFY4xkfpv5Zf9NfzaJ8H7jvZjFQscSXeWSk=; b=Igy1keKt4o6Utssk
	BveJW0y7FQVkgiKMTVlHNX/6EWf50fxqbjOVFU4KfWZAcNCKESvv82AX9oVPb/tF
	Q7wURzp+lr4/av7HG4KoTyGLwsVJWBsI7Z4/8+ZC8N1mmktcD6CXg+t5Tq747f1J
	FhZ9CvmBz63tPLl57qL4ea9hK2PPauFvPFcZF3K+uWFgckyP+y2qiWLwrEId7cjs
	avwecQ5xWUx4nQFMhxGSekWuB8dokjI8CrOfG8EOE4W1NmgX86V6SBG3ioBgqLLG
	iEByiNTTd3UzbJdFOkDwSPZuHnNGiVmhQvNFyuPckzezQlQLPaiP9O9WwidLZz3K
	4sUVGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5cn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:10:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e429ba4dfso6521281cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779091833; x=1779696633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u16NnZfYSFY4xkfpv5Zf9NfzaJ8H7jvZjFQscSXeWSk=;
        b=Ud+AI2LYymLiUncWTJCdkFtFu3JSh0qj6n+lhEB83fvzLHYRGOnZMz5Cpv+GMjY5bY
         zRgiV7SAjM66sgCiqWm7Zmhb2W8rZCgRYW+LdQwf4HrsfJ34c64bxCBxw/eYSBiVKpj9
         fyfWHaQLBBWeGetdv7sQ7fSKk2px56zaLtqbwkNAr4JSo1n7Iuur3aBOZ34YZ7JH9uDJ
         zPPpWPFVdIyuJgeXtHDJheBFOIofRlL6CSGLpu+H6eETUQ6IHil5srMXqQSeCxImzVG4
         jaST2We1gBfu3+k1M7QKeeIUxC9/2kXUPwt+GjaHan7qmA2gsvDbnCqMj2X5AV+qTkLO
         7YCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779091833; x=1779696633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u16NnZfYSFY4xkfpv5Zf9NfzaJ8H7jvZjFQscSXeWSk=;
        b=eR1NuOUXSOEh8bGjT66eScaVen8qCYe2D09/r22NhgkDZZINeTMrufxc+6A/fGMvui
         0Kv5eUn01pnfTNhlrxsR87oFvNWImTEGYzgGraE0jgBqRjvE5qBpTMMfrjMUQaPx2KVr
         jzm7QeyqcGmkUBE0ABqgJmxO3eZx+nQsUe+/RKz82SjttpQLu7gjs5sPzq00Dteo5E+T
         aufjMjZNhoE4v5x3gocP5Wq3JgVzIwMqZNfpaYIvQ3xbKwdYomQt5gDp9OKAbJ/6tEYs
         oDFNmeSINg9I6nNo8e8nYHZ4C/GaDKvNaR3IzgskyGomVSmExo87UOfqUor+XmVM9UvW
         gYyw==
X-Gm-Message-State: AOJu0YyhoyUxNFJ6nULeszPznH2TQpxe3lyA3YRSsmVQOK3pa9gB/9Lk
	63PiAXmPzF6XXSjLJddN4LMXsmKKTPweFXvjl6stzrLHhuC/kkkrOfRqs16kCnZPsyHTHf+fbGO
	xwbUxybyV2StO0QDOkdmQ+hNG4YgRiT9ewOa4IU6cACy/tdNACAozW2X4F5JOMbwsTaco
X-Gm-Gg: Acq92OEIbfUeM42MNx0T8pL64qS0RHR0IoW1rK1tNNJFR2DJUC51hh6atR+9We9IcGp
	qPfn428ijHgjFm2sRcA6o55VuyWo4bAxxNQgkHVg/A+iXj5nK2lXx6UtPiDCTbG2UfYT79gkzZO
	KyzxLi1pWDxcAeOLAhgVzp5z9QDZqp9q1l2ok7urMretCU6ft4mrnXZnqc4GvRklzpL4YnpEi5p
	37eMeHEawvwgY/gttTwxQrRCkuNOdYfc5MSmSayWgn8KQWFDQ2281cFZaXANr6E+yovJJ8ynFmI
	/aKuo4gCHz/JMepoCEwN2htqEGtmy3ljIWGkRfl7xBdcAB5Oppp4eEuH7ArvDSpu5iSd1xkOamL
	4JjGWHxM7juwLWFzhsRWOqjDFaBt2TFxNI5hB4xNgGmdZlWutuazK8FYQL71X2nkRhIJ8T/i6dL
	LLugc=
X-Received: by 2002:a05:622a:1b05:b0:509:39b5:a977 with SMTP id d75a77b69052e-5165a2030f6mr119721701cf.5.1779091833068;
        Mon, 18 May 2026 01:10:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1b05:b0:509:39b5:a977 with SMTP id d75a77b69052e-5165a2030f6mr119721561cf.5.1779091832587;
        Mon, 18 May 2026 01:10:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311879413sm5037581a12.25.2026.05.18.01.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:10:31 -0700 (PDT)
Message-ID: <3e40ef5e-0a8c-40a6-9422-6086be8cde1d@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:10:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/a6xx: Enable CLX feature on A840
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
 <20260516-a8xx-clx-support-v1-2-62508bf651ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260516-a8xx-clx-support-v1-2-62508bf651ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3NyBTYWx0ZWRfX8WLQAyxICryY
 wg85lHX5fY4/R6kVKD5/AnAkZJB3vtZiHzmHKn5jxQbejRF0LzQjXuuuQu2v26xNO5tdaynRcHG
 4AD47sJAbS67EiE4zN5Yta5q0NZB1nym29PG8E34WuEAewr1AA24ehvBXULhiP5fVUcET472xpx
 v4PFxGycHI5H17VktXGzUNMDwjhvsblTjPcCQcQLiMzBOBM+FVnOqVAwNq0t7BOgBj7irrae/HN
 htlIgC6zxvrWDQaKsb3N8U3N0SKFPrJxslNf3xRowSt6q4v2bLzw54mIkyKEoUSnMstCqpjnYav
 tU/eXaRhV9hpDKDbdDurBO5XaDQfnyQWAO97bgWajy1JqA8hfoUDp3ZHh6cJpBM2qqBEwVwLYUb
 aqgUtQPVwI+QcHoBC+xpz0zCO6ZMFjilqikNN15EMOgxQ9KR61aj6RtSUA9EkmRHqkYqsAWP5ol
 0OHa7MBAzhQXDQtpOhw==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0ac97a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RZPte_UQLmBFeyYnhWcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: G9YVKwe7YpizVal9XWbFZcDD96skL2S6
X-Proofpoint-ORIG-GUID: G9YVKwe7YpizVal9XWbFZcDD96skL2S6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180077
X-Rspamd-Queue-Id: 9ABAE568842
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108124-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 10:07 PM, Akhil P Oommen wrote:
> Add the A840 CLX domain table and the IFF/PCLX limits table to the
> catalog. With the HFI plumbing in place, this enables the Current Limit
> Extension (CLX) feature on Adreno 840.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 86 +++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 550ff3a9b82e..c503912a61c7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -2108,6 +2108,90 @@ static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] = {
>  };
>  DECLARE_ADRENO_REGLIST_PIPE_LIST(a840_dyn_pwrup_reglist);
>  
> +static const struct a6xx_hfi_clx_table_v2_cmd a840_clx_tbl = {
> +	.version = (2 << 16) | 1,

Is that major/minor or major=2 minor=0 patch=1? Please add a define

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

