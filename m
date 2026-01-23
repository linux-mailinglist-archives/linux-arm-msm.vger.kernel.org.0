Return-Path: <linux-arm-msm+bounces-90375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNMUAb+8c2kmyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:23:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88F798EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E065D3030D1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F17A268690;
	Fri, 23 Jan 2026 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQMVoNlx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODO2g54/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B1238C3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192610; cv=none; b=dqCB8c+8/ACO+vlnVwxl8AAqD2758shjFDezpOHy3qiwSCEkQRNHoU7g7V9EWNxQa/dVuG1uw2+DvXXosFXIDsc2zVKCIsHfV1G89AltCytplR9J6ncGobc1fVTTVneHOVwHMQrzqlBdmAlq98THHLrPJ3krr4P6YqH0BakvDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192610; c=relaxed/simple;
	bh=8cdCqM5vyc0qfvH/GXDQghnWpIPo65ja1UaVzd6M044=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gvb9CmCyRJmOXq2rf5dhe/32RFbecdAOacSMg+zVN34xzJMI3ooCr0Nmcm83OTGID6bp8T1SmQw6hThcGTu6b3jBQOpW8QdoOCci/8bo/EHcRc6nXr2AtCkLjIU0MWRrW3y7lg4c/QtN14DYhcd520Q9HcoWxGU/+jdACJsezM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQMVoNlx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODO2g54/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NFPGA12209312
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=; b=kQMVoNlx7hAtO97V
	8MA9n+nrQquFDk6KQKj2rG84pzAcoNkt6XYf3wka/T7fD5IL4w7WMg97ubWNqlVS
	+tbAexM027MM0yaTBNGO+z2XyEmWl3HGQ2iuBHyEI88ZayI3UPHkucR3ZbfJ7VcP
	72XKw9Z0zHKwrwPH7sXXGifAK122hDy93PQoN2+tawwgl9sFgVdY32KoHcgu2zAI
	eWHL/IAXkURS4w6ROPjk2YSP408u+n2vBEBkj8DlZgiheerzY8X8j3SV2wBXR8KC
	1j21tkxgEuZnrWYKfN4aGbvEb41wqBIqMAx5yM+3r4C8Phh2tpVVmtxOR4L3BIKR
	yPnbMw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvbm6gjdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:23:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ece01183ffso2178432137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769192606; x=1769797406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=;
        b=ODO2g54/TBq9SvA5csdspXhvo5OzSOa4/L729LeguuJhfRofZc0XZIiKTQ5XKUZCGR
         GPARhZO+27cyYqFVygM8AFZVDOwmR/GSBXHdXkr5mi/eNoFje6kglR44sMEVmIwb1rSK
         SBlIUlhtzFmp4s2Oc2qXh0I6uz9IB4SMrE9+lr8uEA0lW3koYX6DdKyi9vAz/NgsmSsu
         YvWT4zpx5drUH+89qz7c19UGp2CwjazD2bhZ1lxdjGd3TmWEEgsZuAQzwEt+R/udCRV7
         10r9gXdVd9zFAEaP6szPJ8gtYedCjkWzgScTxWGYavQp15LC9uCQMS1ef+OsBc5Hu81f
         78bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192606; x=1769797406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=;
        b=nGGq9QsmF3Al+GCsNe8wDzOo4ElPftMS4mjFEg/xbWPX7NFn7D1ZCO87l75cAA8xA6
         SkpAUVuyyzsQXf+UqlPieOaXcfompppxvQb9QUzFkg/dm99tX0qepclYhBa9ipzf04KI
         PUi27n91QbSH/lSX7JmwAxeXKCRvyd4UrDUFLm9EAHIIELCJncCZypF8r6TEPUFDnC7S
         SKAc8OkQD8EC9wSOzae2oIfWJpE0JbKyCaNqfh3VMJPobprM2ttzCvICN01KIVjDIng/
         YnBQ+l1D+ZgRsdWuhFNbgL9+wb99yZyJOz1cv3WaOnlpfn+rH4FsKqVnJ0SQX39PaBi5
         417Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmrC0A62iRC4OUq/1n6kTafeX0RCWfHjcgYU+A10SFzJDg7QpLtCAWzyzTqRnGcfTgjKx5z9TWl7tuMq7s@vger.kernel.org
X-Gm-Message-State: AOJu0YzNAqTJ9YRfi4fylrK6hky3dL9LOo64Ui6bDVTW2/zRupLxf5tN
	JLG0N3bJV/hlxPlV07S/iOR++y7JlVe8/UpIz6lKg7NrAdDeylLThDB7YvjUw+jvWu8jtbLjn+X
	VpLdgvanSybUITPhYeFu9G6FmwhAKL/cYky44rtMXu6nU4VcqGorK/P4L7urt45RvRG05
X-Gm-Gg: AZuq6aISS10BinQEyNqbYqoMoyDe5QJfAw2Hgls6jGtUwvyxUzZZlM6rFOmHjpb/FGV
	CIaGgAdL1zGArlZMggHI72IckDkzSbiQe4p65OCHHkCEClOhjCF8gFxBvZWHgRVpBfgM2+Z75lW
	bF1BDeYgnTM9aLr07UWtUmDgbAaij/KJEk7wW50if0NJiPNtLxPM/IjK788nzhFFBGDJVf+3ky4
	h4vwD0HgsrHGYuFbuinneHhJP1exsuH933EJ1p7Im4oKttRODnPeZBvBf9iTUQzFXsvYJOO6bHe
	ZsROrg+gY5Ez50yOQRFWRURFbq1/KSXtp0nUj4Y2NzQDUAvdSPytXDYnZumiyuUyBNrzepSjBcH
	QWmXqb773tJo0B0BROtpn+DPXKMzjjs/lFg0gckjXF0zrMhUPH7Ar9KycxtIISdqt
X-Received: by 2002:a05:6102:e08:b0:5ee:a7e9:f157 with SMTP id ada2fe7eead31-5f55874884dmr572403137.40.1769192606453;
        Fri, 23 Jan 2026 10:23:26 -0800 (PST)
X-Received: by 2002:a05:6102:e08:b0:5ee:a7e9:f157 with SMTP id ada2fe7eead31-5f55874884dmr572391137.40.1769192605953;
        Fri, 23 Jan 2026 10:23:25 -0800 (PST)
Received: from [10.205.56.101] (84-253-213-87.bb.dnainternet.fi. [84.253.213.87])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48df7e0sm836906e87.17.2026.01.23.10.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 10:23:25 -0800 (PST)
Message-ID: <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 20:23:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
 <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
 <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Vu5BEk3v1wFlHL4wg_PF1Y9VBNp5APAV
X-Authority-Analysis: v=2.4 cv=LvSfC3dc c=1 sm=1 tr=0 ts=6973bc9f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=oW9j1mrv7lfAxSiOe78TcA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=nHOJee6wh0HJpeXwZwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzOSBTYWx0ZWRfX/lMJ6FnxEEfQ
 QGOCg5FLUnebk3yLdsiWNWyA44RFTx/0Pjvf39QWQ4/KNfSLoyE62F6v/AVqtLo8GsnOREJ5mTT
 3/4fITp5bjuvMNI6QeqgIjNWz2gVeOSWBnl1V2lBkLSxlyG+ZNNImBnhZj/8fBuklaeF2D+HIk+
 Z4ttzQpE89dtLzArUP/MOSdHRpM70ZxEiFGe2TbGlmqpsUxWpjgGQ9jLYyxy/U59g14J3cd8Bf0
 ngslFke/uOrruC5VRPDNVd3YSBJTluWBr4M5k0HXFh71e8r4DO7tvhZaXpd/U3OrOUvtF8jY5Ka
 NZj0kFyPkmHZPOqrv1abuI91P7wYURwSey6GzAmLflc7+fMG5mTlZSoLEct6D2U5Uxv/M9TjcT6
 iO/t8yCXIlnG54cTCg7gbEnfr+yHB452UXwOAbAxYfo9I5uyfZ7r/8GpHgntyLexCbEpAO1IJsx
 qC7koIwu70lBCbgVOHw==
X-Proofpoint-GUID: Vu5BEk3v1wFlHL4wg_PF1Y9VBNp5APAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230139
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90375-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C88F798EC
X-Rspamd-Action: no action

On 23/01/2026 20:21, Felix Gu wrote:
> Hi Dmitry,
> Thanks for your review.
> linux/cleanup.h is included in linux/of.h.
> So it should be included already.

Yes. However we should not depend on include files being provided by 
other kernel-wide includes.

Also, please don't top-post when replying to the emails on public MLs.

> 
> Best regards,
> Feix Gu
> 
> On Sat, Jan 24, 2026 at 1:58 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
>>> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
>>> While there was a manual of_node_put() at the end of the
>>> common path, several early error returns would bypass this call,
>>> resulting in a reference leak.
>>> Fix this by using the __free(device_node) cleanup handler to
>>> release the reference when the variable goes out of scope.
>>>
>>> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
>>> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 2129d230a92b..0bc518d9fd65 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>        struct msm_drm_private *priv = dev->dev_private;
>>>        struct platform_device *pdev = priv->gpu_pdev;
>>>        struct adreno_platform_config *config = pdev->dev.platform_data;
>>> -     struct device_node *node;
>>>        struct a6xx_gpu *a6xx_gpu;
>>>        struct adreno_gpu *adreno_gpu;
>>>        struct msm_gpu *gpu;
>>> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>        adreno_gpu->registers = NULL;
>>>
>>>        /* Check if there is a GMU phandle and set it up */
>>> -     node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>> +     struct device_node *node __free(device_node) =
>>> +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>
>> Missing include for cleanup.h.
>>
>>>        /* FIXME: How do we gracefully handle this? */
>>>        BUG_ON(!node);
>>>
>>> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>                ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>>>        else
>>>                ret = a6xx_gmu_init(a6xx_gpu, node);
>>> -     of_node_put(node);
>>>        if (ret) {
>>>                a6xx_destroy(&(a6xx_gpu->base.base));
>>>                return ERR_PTR(ret);
>>>
>>> ---
>>> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
>>> change-id: 20260123-a6xx_gpu-cbc095dbe423
>>>
>>> Best regards,
>>> --
>>> Felix Gu <ustc.gu@gmail.com>
>>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry

