Return-Path: <linux-arm-msm+bounces-108645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPx9J4R1DWokxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:49:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1472058A18C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9536A310FD67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7923B5306;
	Wed, 20 May 2026 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fi399r+p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fop6yOwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF81280A5A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266216; cv=none; b=gxhhy7QcZRc03UWUiKG+P4i9eZ4Rd/J4G7xeaN7czQ1rk/D1QG/7mv+9J3vGKgHRlwM1R/cZsYGAT1W4Sl/7PaLaOU50501+iITwvvNLkRuP1JtLftr6Iwy0E3mAmN/gtUt35r9OmkwjFrJzCIQ+Cmi3/cEOKnqf2wOgvWZrYWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266216; c=relaxed/simple;
	bh=PdPI7WUUvPhqwXzjqQ2APugEZu8IgubkoJJTI+cytLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8qmH+tVGs67fSYf+Cuvq76WoYjt6ICSYGdpjJA+cQvf2LJFSljsuhossjWFtkwsJIPYkEXCININoa6GIpeNwhKGKXy3oeUgKV1I9wcYBA2O4R3cF6fFrvTko/JofUg4XaT20MGa7EUh5pG44+vuYDp4sX1toSB/CmRK7o1jP2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fi399r+p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fop6yOwC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76FSZ2063911
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMm9rGe9sBf75zeraZiwiYKH2NWtu3ILaP9e9pyvYOU=; b=fi399r+pR1tPMnWP
	91z51alEc+OT+KkcK6yln4BoU31VrB/ysI6yV6q3z2MSS+iLE7KtP3StE7A7Ey0I
	6LEfj95KnYS0M6fDHs20b1utoNf94Sa1zDDy0lgQcDiIbmWiPLJBVZjN05+ltHrO
	tnbIBuF6teOt44CbWw6f37kbuQn8dz6VCgeDMPJakFY96Yj1ZcBOHGPe+zGpchXh
	7R6RkCiBcZOUSRrzHP+EH9nf5y1H6Du4sP/KYyEREMjJJCfBDiZHXGvGZHucriHk
	Y5Uk7/qs+7Rs4HAAue78u7pDTYyOliRkwXsCoIRkhkU2DvkhduJKqZGZtXmf5/v6
	obNWCQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3s4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:36:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83544d05c5aso2290530b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779266210; x=1779871010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMm9rGe9sBf75zeraZiwiYKH2NWtu3ILaP9e9pyvYOU=;
        b=fop6yOwCsIxnwURGURq69rT2lVpto4RqEA8B1IXHaO0Agy+kbnqsupeZ8JBkPIXJE0
         MVzQRSRMexmcLObw6tgS0hOxXGLLf9fasKQGtSDB2BCi3Z4WHvRsUH7mvJOfqn/Ck//V
         +oM7JRGmsFQITEduEnIXymN/0VlokHtH1sYpLkzeq/INdJEMXmnZHkRx/xZQp0+G7GUe
         t/Hdr3l3wjGq6LF/kqq3ARiw8YxKfUKw4gCP9Vtj0Em3NV+6TpBm/nNfVBBzUVHW3/hW
         rOByq3MUtVtkXIHww4s4WbzIhlGPGoLX8mBm0en4uEwvSoq0A5jTTNj/jPceao3U+PmB
         gw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266210; x=1779871010;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMm9rGe9sBf75zeraZiwiYKH2NWtu3ILaP9e9pyvYOU=;
        b=shbC42qeCc6SjbpVYZgeG13Vj+bY1ww65YgW/Mb2jOq1RxEwdsBuAo6c7Up/MX314O
         iGNK68wTQn3xGh8MomsIhNjzITW/jEXk9NBvQIzRdDfimJMR+oSzbNXeJ1aNvAs7wYqy
         bWlZV39d8sevbOlj4wlYRyVth7oQsU6L1pnW0lZgq4rxRKXa5KZPinQ+Ofi4yMRxKnfh
         roX2Amq8lCaVrmrbAjOPjDaxU2MlwJrNESe0LsgeeOuvA8eiywOZfblsP+BSvdVGZd/v
         v67vVs/YZuqV6dYilZA4NU7s5i0XjUPBTA2USasj4HC699zjBAzQD6xZFewrAs+2le36
         REGw==
X-Gm-Message-State: AOJu0YzCP5gaK2ele8hddES5lYWppAK9dfFjAHSJljofh68hFOboj98g
	jy/rjcf4ahP10QqWKlFN03RwrwhNN+J1TLlPn2KzLE2+UDeDvvhnar4xcmVcs2z0Dmw1mdROnzw
	KTsqo+4wvPmABAL1vcg/jKC4+SvKboNQlWXavvsp3yVQ5bDciNc8dW7r5bFT0h91l5crg
X-Gm-Gg: Acq92OHCuN2ZOWLzLjKFHEnHdhdlViCtRA102bgbpJ9nDBXvtTw2RXSyy2DWhn46bcd
	z7DXhRsdbg/PdowE3jYBJQh24txT1Uh87R3khCalI3d08b7GLOjRjmHWkuIUmFFJBkSabtV/lKN
	e1LO4tRnMR/D+mrgCOvCs4skD5m4kygvcmbaCfsGq5K/PyLPLFzxoLQveUrqLSb68fSu6/0o6Ug
	2EWtwODfrQEL0t238JpjhJc3mrgsBIVftHntWMvflS6vGmbvTz75iyDZH5SwAl8xZWkwfisQSzY
	Fk+pVSyqi3oNqSjTdSc8EOzVVa/p7nws8eGZeS9ZnpCM2qvCXdmDuy6qTA1zV0T44Z9r4lc3LcA
	6uhcWssf+xtN15oB9o3yt3P3L2VZOLLV4YUuN0q9v5vQ76JdqK5fV
X-Received: by 2002:a05:6a00:2e9f:b0:83a:4846:90b0 with SMTP id d2e1a72fcca58-83f33dd8d8cmr23405735b3a.46.1779266210200;
        Wed, 20 May 2026 01:36:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9f:b0:83a:4846:90b0 with SMTP id d2e1a72fcca58-83f33dd8d8cmr23405710b3a.46.1779266209678;
        Wed, 20 May 2026 01:36:49 -0700 (PDT)
Received: from [172.20.10.3] ([27.60.134.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c3a9sm20515303b3a.38.2026.05.20.01.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:36:49 -0700 (PDT)
Message-ID: <b4787a2b-c1db-4c0c-8c58-fe60fed83cfb@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:06:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/16] drm/msm/registers: Add perfcntr json
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
 <20260518190735.16236-6-robin.clark@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260518190735.16236-6-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ajWH20ucXZ06JBgNMU0ouPpQUlhSjh-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MiBTYWx0ZWRfX4noAlGheQloR
 xZHpH3KBf4AA9Wv69S3fjIxaW5Y0JfEX0IOY4ttLzYu4HyrxwNcaNiCbPRf/nkwChLiYvMiUjoE
 7sPfJG48Ckf5RtQLRDRFOD7cmCeE16Ga1oP8FTQZ/Q0G1653BcGJSeYRPLn9/Z3OOq2dd7zocKR
 z9YiMQo+d0zhTmXwgc5BKscWLv7VWSWsK86MogXDlDcsE3Ubh2JoRahy2Xk7Wh2flyjpOo7IePw
 CV0G35iZn1jXYwo9jKRzaRAUxQPDhie3fzsCUQy/vRmBO3fZ643elWMPLiVtvL2LczLar6S8DgS
 Qp9MovQd/Db3UkldDmEDFPla/dD/NjT15ny1kFyEQWYySoVqShq6rPMRkR97L851TKu7d76NEsQ
 fgsXzfz3lak4fU/vsqR4dGtvq18dwkWl3u3NPaf8baI7NXH3+6blkVwMD+IFUPex/SKw6X6Fh29
 unqI2qxioovGX8eOD1w==
X-Proofpoint-ORIG-GUID: ajWH20ucXZ06JBgNMU0ouPpQUlhSjh-G
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d72a3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Q/5yxSSCruZ1lXPW2Frkag==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Os_MIW4w5OSApcyPIz8A:9
 a=8f1wxSZkJpRnjI3K:21 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108645-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1472058A18C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/2026 12:36 AM, Rob Clark wrote:
> Pull in perfcntr json and wire up generation of perfcntr tables.
> 
> Sync from mesa commit d2c4653ee953 ("freedreno/registers: Add gen8 perfcntrs")
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |  25 +-
>  drivers/gpu/drm/msm/msm_perfcntr.h            |  48 ++++
>  .../msm/registers/adreno/a2xx_perfcntrs.json  | 109 ++++++++
>  .../msm/registers/adreno/a5xx_perfcntrs.json  | 128 ++++++++++
>  .../msm/registers/adreno/a6xx_perfcntrs.json  | 105 ++++++++
>  .../msm/registers/adreno/a7xx_perfcntrs.json  | 228 +++++++++++++++++
>  .../msm/registers/adreno/a8xx_perfcntrs.json  | 240 ++++++++++++++++++
>  7 files changed, 882 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> 

<< snip >>

> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
> new file mode 100644
> index 000000000000..8bb31820479e
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
> @@ -0,0 +1,105 @@
> +{

RBBM and CMP groups are missing here.

> +    "chip": "A6XX",
> +    "groups": [
> +        {
> +            "name": "CP",
> +            "num": 14,
> +            "reserved": [ 0 ],
> +            "select": "CP_PERFCTR_CP_SEL",
> +            "counter": "RBBM_PERFCTR_CP",
> +            "countable_type": "a6xx_cp_perfcounter_select"

<< snip >>

> diff --git a/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
> new file mode 100644
> index 000000000000..e60aab1862ec
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
> @@ -0,0 +1,228 @@
> +{
> +    "chip": "A7XX",
> +    "groups": [
> +        {
> +            "name": "CP",
> +            "num": 14,
> +            "reserved": [ 0 ],
> +            "select": "CP_PERFCTR_CP_SEL",
> +            "counter": "RBBM_PERFCTR_CP",
> +            "countable_type": "a7xx_cp_perfcounter_select"
> +        },
> +        {
> +            "name": "RBBM",
> +            "num": 4,
> +            "select": "RBBM_PERFCTR_RBBM_SEL",
> +            "counter": "RBBM_PERFCTR_RBBM",
> +            "countable_type": "a7xx_rbbm_perfcounter_select"
> +        },
> +        {
> +            "name": "PC",
> +            "pipe": "BR",
> +            "num": 8,
> +            "select": "PC_PERFCTR_PC_SEL",
> +            "counter": "RBBM_PERFCTR_PC",
> +            "countable_type": "a7xx_pc_perfcounter_select"
> +        },
> +        {
> +            "name": "VFD",
> +            "pipe": "BR",
> +            "num": 8,
> +            "select": "VFD_PERFCTR_VFD_SEL",
> +            "counter": "RBBM_PERFCTR_VFD",
> +            "countable_type": "a7xx_vfd_perfcounter_select"
> +        },
> +        {
> +            "name": "HLSQ",
> +            "pipe": "BR",
> +            "num": 6,
> +            "select": "SP_PERFCTR_HLSQ_SEL",
> +            "counter": "RBBM_PERFCTR_HLSQ",
> +            "countable_type": "a7xx_hlsq_perfcounter_select"
> +        },
> +        {
> +            "name": "VPC",
> +            "pipe": "BR",
> +            "num": 6,
> +            "select": "VPC_PERFCTR_VPC_SEL",
> +            "counter": "RBBM_PERFCTR_VPC",
> +            "countable_type": "a7xx_vpc_perfcounter_select"
> +        },
> +        {
> +            "name": "TSE",
> +            "pipe": "BR",
> +            "num": 4,
> +            "select": "GRAS_PERFCTR_TSE_SEL",
> +            "counter": "RBBM_PERFCTR_TSE",
> +            "countable_type": "a7xx_tse_perfcounter_select"
> +        },
> +        {
> +            "name": "RAS",
> +            "pipe": "BR",
> +            "num": 4,
> +            "select": "GRAS_PERFCTR_RAS_SEL",
> +            "counter": "RBBM_PERFCTR_RAS",
> +            "countable_type": "a7xx_ras_perfcounter_select"
> +        },
> +        {
> +            "name": "UCHE",
> +            "num": 12,

A740 and newer has 24 counters

> +            "select": "UCHE_PERFCTR_UCHE_SEL",
> +            "counter": "RBBM_PERFCTR_UCHE",
> +            "countable_type": "a7xx_uche_perfcounter_select"
> +        },

<< snip >>

> diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> new file mode 100644
> index 000000000000..503b113df397
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> @@ -0,0 +1,240 @@
> +{
> +    "chip": "A8XX",
> +    "groups": [
> +        {
> +            "name": "CP",
> +            "num": 14,
> +            "reserved": [ 0 ],
> +            "select": "CP_PERFCTR_CP_SEL",
> +            "counter": "RBBM_PERFCTR_CP",
> +            "countable_type": "a8xx_cp_perfcounter_select"
> +        },
> +        {
> +            "name": "RBBM",
> +            "num": 4,
> +            "select": "RBBM_PERFCTR_RBBM_SEL",
> +            "slice_select": [ "RBBM_SLICE_PERFCTR_RBBM_SEL" ],
> +            "counter": "RBBM_PERFCTR_RBBM",
> +            "countable_type": "a8xx_rbbm_perfcounter_select"
> +        },
> +        {
> +            "name": "PC",
> +            "pipe": "BR",
> +            "num": 8,
> +            "select": "PC_PERFCTR_PC_SEL",
> +            "slice_select": [ "PC_SLICE_PERFCTR_PC_SEL" ],
> +            "counter": "RBBM_PERFCTR_PC",
> +            "countable_type": "a8xx_pc_perfcounter_select"
> +        },
> +        {
> +            "name": "VFD",
> +            "pipe": "BR",
> +            "num": 8,
> +            "select": "VFD_PERFCTR_VFD_SEL",
> +            "counter": "RBBM_PERFCTR_VFD",
> +            "countable_type": "a8xx_vfd_perfcounter_select"
> +        },
> +        {
> +            "name": "HLSQ",
> +            "pipe": "BR",
> +            "num": 6,
> +            "select": "SP_PERFCTR_HLSQ_SEL",
> +            "slice_select": [ "SP_PERFCTR_HLSQ_SEL_2" ],
> +            "counter": "RBBM_PERFCTR_HLSQ",
> +            "countable_type": "a8xx_hlsq_perfcounter_select"
> +        },
> +        {
> +            "name": "VPC",
> +            "pipe": "BR",
> +            "num": 6,
> +            "select": "VPC_PERFCTR_VPC_SEL",
> +            "slice_select": [ "VPC_PERFCTR_VPC_SEL_1", "VPC_PERFCTR_VPC_SEL_2" ],
> +            "counter": "RBBM_PERFCTR_VPC",
> +            "countable_type": "a8xx_vpc_perfcounter_select"
> +        },
> +        {
> +            "name": "TSE",
> +            "pipe": "BR",
> +            "num": 4,
> +            "select": "GRAS_PERFCTR_TSE_SEL",
> +            "slice_select": [ "GRAS_PERFCTR_TSEFE_SEL" ],
> +            "counter": "RBBM_PERFCTR_TSE",
> +            "countable_type": "a8xx_tse_perfcounter_select"
> +        },
> +        {
> +            "name": "RAS",
> +            "pipe": "BR",
> +            "num": 4,
> +            "select": "GRAS_PERFCTR_RAS_SEL",
> +            "counter": "RBBM_PERFCTR_RAS",
> +            "countable_type": "a8xx_ras_perfcounter_select"
> +        },
> +        {
> +            "name": "UCHE",
> +            "num": 12,

"num": 24,

> +            "select": "UCHE_PERFCTR_UCHE_SEL",
> +            "counter": "RBBM_PERFCTR_UCHE",
> +            "countable_type": "a8xx_uche_perfcounter_select"
> +        },
> +        {
> +            "name": "TP",
> +            "pipe": "BR",
> +            "num": 12,
> +            "select": "TPL1_PERFCTR_TP_SEL",
> +            "counter": "RBBM_PERFCTR_TP",
> +            "countable_type": "a8xx_tp_perfcounter_select"
> +        },
> +        {
> +            "name": "SP",
> +            "pipe": "BR",
> +            "num": 24,
> +            "select": "SP_PERFCTR_SP_SEL",
> +            "counter": "RBBM_PERFCTR_SP",
> +            "countable_type": "a8xx_sp_perfcounter_select"
> +        },
> +        {
> +            "name": "RB",
> +            "pipe": "BR",
> +            "num": 8,
> +            "select": "RB_PERFCTR_RB_SEL",
> +            "counter": "RBBM_PERFCTR_RB",
> +            "countable_type": "a8xx_rb_perfcounter_select"
> +        },
> +        {
> +            "name": "VSC",
> +            "num": 2,
> +            "select": "VSC_PERFCTR_VSC_SEL",
> +            "counter": "RBBM_PERFCTR_VSC",
> +            "countable_type": "a8xx_vsc_perfcounter_select"
> +        },
> +        {
> +            "name": "CCU",
> +            "pipe": "BR",
> +            "num": 5,
> +            "select": "RB_PERFCTR_CCU_SEL",
> +            "counter": "RBBM_PERFCTR_CCU",
> +            "countable_type": "a8xx_ccu_perfcounter_select"
> +        },
> +        {
> +            "name": "LRZ",
> +            "pipe": "BR",
> +            "num": 4,
> +            "select": "GRAS_PERFCTR_LRZ_SEL",
> +            "counter": "RBBM_PERFCTR_LRZ",
> +            "countable_type": "a8xx_lrz_perfcounter_select"
> +        },
> +        {
> +            "name": "CMP",

"pipe": "BR",

-Akhil

