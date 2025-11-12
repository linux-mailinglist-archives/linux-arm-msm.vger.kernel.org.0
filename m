Return-Path: <linux-arm-msm+bounces-81432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B59C52A46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30C784F9B6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D576D25A343;
	Wed, 12 Nov 2025 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZ0FyE35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcdMsmsR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD421FF46
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956051; cv=none; b=ibevzEmGjRDdB/DMpHmRpD1hKavZFzrWmy5pIbMVVcWfBE+ge3xYAehmRWguCLq2fvmabk+aXsLiBPmcUDOKTmvn80YLOFhzq/TYznxElxLkU9ubzkuIW5wFonahQz7up9rC4PNGZxQuEXJi3GsMEP825YoQRQ1MZASHnbCje9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956051; c=relaxed/simple;
	bh=yUVoXexaOub7BTb7gu637I7PFwYE/ysxkVEIn3Z/fRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3pWMnH1LKInVhRY7/KBL/ZDL1vpkE9L8nJtn/Ic6NzLs7reUN9aK3SVdj/ufKPTXx8/fxw2sDXGJDt2eJIFid2aNii6ygj193Y1CUtNkWEctIgKgehoffnjc2pcX3aA7852q0cFCPg4sDsg0FnMcYvAigTaKFKMRO3VqFOh63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZ0FyE35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcdMsmsR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9gMZW960232
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=pFBpxvCThnvTjNirIlaCiwpE5flozd6oDfK2MM6c4Bc=; b=YZ
	0FyE35DJvhsctetv+GZA8d1/C4lvdQEfA3egCJ3nsIXAUrl3WEDcaAMK+tCUm4OA
	W1F+D/489qT7pQqR3I6pWkn4gh19aYk2pU+kxaxo6DbAnnCQHz3/CuqVZXCzVn+F
	a7zHSSYvd+gNv2I7a6UY6wG3QYrsMC4Noogdaa/yku6pFWVMVIYo3atzE9I3agug
	LcsMu2d/+E7xQ/etXeTThjfgRMtIFMoDmHSngwc/h4GlAv9txoZA+ywdtkMXPri5
	4AbQgCCfu4sZ1b34/Eu2pniR8jzlwIMuxn/Im0+QRsSfJZ9nrvlLEvIcsOE2t7CD
	1oKaWhHhbMdbZv/MSWrQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acquerr26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:00:49 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-44dbbcd4328so1194233b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762956048; x=1763560848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pFBpxvCThnvTjNirIlaCiwpE5flozd6oDfK2MM6c4Bc=;
        b=gcdMsmsReib51q/TWxJMGRquUb5WKEQ5KUa4C4vxzzyw2v+IX4eFZcYio755IGTV5B
         1F3QBrMf9nHcaIXtCvkOoIZL0Q4VBh2Mqgp+L8JW+DTq/KS/B73gkAwhq3Tpx6M/Up55
         BwpO4qxkDNm4XQ7W5hieXg/eQ/VwlmRRxuSqQccjZQyltG4bIuA/52DDR7dtlkUdCsv+
         O3N3OhtLtG5xFn7LxT0Yar+zwIJobKNF7QXNdsq8QvSOq8xYjbFawcp7E7ntBZ63j8G+
         6qV+xuaaZqBypP71hTivMceCUR4N0D1CrkvXQAKzsdtSj3clnf50Ky/nU6RveJrD5dGA
         P+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956048; x=1763560848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFBpxvCThnvTjNirIlaCiwpE5flozd6oDfK2MM6c4Bc=;
        b=H4UxSPXWeNSWGXkVBZrC00TJR2Kar327MOOYiBkjsDmAbvKlkXZgRNFHWiZGLpvsMb
         rMgNK020Wpp1yFBRQ54aDl7lbz/G65xXtDtXY0rGZFkMqE3cDp9nErHNo9qvGLKROlJS
         5BDX6wuD2NPewEF/XtRJG636X7riX3mUbSpT99Y+9EZH5Xe6EeMbc3nCYM5jDx7OecbW
         u58GCQCZFG5vkWIjMaroqaQIkJ6StDWaLJN4oTTeMpiJSKrdnXIngRmeLKOc3dHMxqrf
         t9q+/c1zEG3JfgSn+KVceTmxo/vD66zWdzAdilfU4dqYRGCu02VD9M6f7fDQuunC1UeP
         sYIw==
X-Forwarded-Encrypted: i=1; AJvYcCVBYpsbs6OR+LdaV8ZdlYMI4dS+Fmgb/uv0KXEVhyKcl7ApXDoLlY1FN7e0qM6LeKuK9n4ymLWhmblD/xm3@vger.kernel.org
X-Gm-Message-State: AOJu0YyMaABCr/Q4xozRQqY0zglK3KqmZrC8QzVs2+lgpLR0JZUY1Wpy
	1z4AgDimmYPa7p9HazGKAAu7SNhCqeQWhN+bnZosUMFDqtwb9O1Bm5WZCB94UIoXZX/M4Ywy57k
	c3+hkWVMqrngRfHfodwFt39Y8VH1ooCSwH2rhfxzZFj/2qzCyfgf7pCU1my8r4Igvi/vN6aGn5T
	eSyvgYGXr6LggVPJ4jsHTB74u9vU7HG3ZRwpibEIPSde4=
X-Gm-Gg: ASbGncvBFQN7SiGVDFGfP10FY2NHL3sqpQG4Li29yXME/AHIUe0vulzD4eRZP2UBFMZ
	RfEvHuTntA0gDPRlOtT7fzGe7LGtF/5V/fXyenn0dOnYwNGcc5MH95hsF/apOiHIS+woE4K35ba
	8NlJTGSfZq5VuzwbZ2w+WeqwniI5z54ziFG7lSokDmj3fBpiuuJ3WVkx8bMBeKMalu9J/Dg2acu
	D6qM5q3tq6ehKw=
X-Received: by 2002:a05:6808:1b12:b0:450:507:c77d with SMTP id 5614622812f47-450744c0bd4mr1438127b6e.2.1762956048352;
        Wed, 12 Nov 2025 06:00:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH96c1EnT3cd13kxATKATzWmWR3BVJ09jffO+pUV8+0w4fuulnyNcRl+pIMD8xQH7UGqOY2SEAhMOOnfhadkY=
X-Received: by 2002:a05:6808:1b12:b0:450:507:c77d with SMTP id
 5614622812f47-450744c0bd4mr1438095b6e.2.1762956047813; Wed, 12 Nov 2025
 06:00:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020113708.7403-1-hehuiwen@kylinos.cn>
In-Reply-To: <20251020113708.7403-1-hehuiwen@kylinos.cn>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 06:00:37 -0800
X-Gm-Features: AWmQ_bmSomh-Lqktfo9-_yIT0yuHH5MOogLEutWFwCLiDDcs5TN9J_P3zC898No
Message-ID: <CACSVV02vOhbW9U-9ZAT3QAh8ZKqr1vyO0sQY7CDRAGrwM997NA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix NULL pointer dereference in crashstate_get_vm_logs()
To: Huiwen He <hehuiwen@kylinos.cn>
Cc: Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMyBTYWx0ZWRfXyq3DmbP497ZS
 eUT9OaVlTE15BYkT8td1RpGIfyIttW/w2XkDzAQ/iFk/Aum+BbJJ9KHNyttUrUUJjthL67BPVBW
 0cmdQTr+tAO6roOOH/k3MBILwgimjCyLgVL1vhK6TvU0/DTTPQJL3879CAaTLticSHzwoBasWab
 OGRDF7lI5NQw761Ki62n8V/DJIK3xrV6Kbt7gFIN4HxgFDRTw/DmgE2c5oBTf74fnQVYhSTloJR
 6hgMID4smckfMPqPxXbbAUorVCRyAGc6oYSALTTOJK7N5GKXiIp14+ts0/2iDiRn91jSwx2bKpf
 PAyU5vgRUmgCxS6aO8FG8gQb0FOV/Ij82JPBPMEA2A5J2yKBL6Y7rWIKpZ5JcNE7ZGiYJ7fF4KZ
 Rti6tpB1+m2WufKP3X0rZsBrxgwtdQ==
X-Proofpoint-ORIG-GUID: 22ODKhGWSHsLux8XXTT62biUEEAEt8st
X-Authority-Analysis: v=2.4 cv=cPztc1eN c=1 sm=1 tr=0 ts=69149311 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=G_YO64yXUFrr-ST3v2gA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 22ODKhGWSHsLux8XXTT62biUEEAEt8st
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120113

On Mon, Oct 20, 2025 at 4:37=E2=80=AFAM Huiwen He <hehuiwen@kylinos.cn> wro=
te:
>
> crashstate_get_vm_logs() did not check the result of kmalloc_array()
> before using state->vm_logs. In low memory situations, kmalloc_array()
> may fail and return NULL, leading to a kernel crash when the array
> is accessed in the subsequent loop.
>
> Fix this by checking the return value of kmalloc_array(). If allocation
> fails, set state->nr_vm_logs to 0, and exit the function safely.
>
> Fixes: 9edc52967cc7 ("drm/msm: Add VM logging for VM_BIND updates")
> Signed-off-by: Huiwen He <hehuiwen@kylinos.cn>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 17759abc46d7..51df6ff945d2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -348,6 +348,12 @@ static void crashstate_get_vm_logs(struct msm_gpu_st=
ate *state, struct msm_gem_v
>
>         state->vm_logs =3D kmalloc_array(
>                 state->nr_vm_logs, sizeof(vm->log[0]), GFP_KERNEL);
> +       if (!state->vm_logs) {
> +               state->nr_vm_logs =3D 0;
> +               mutex_unlock(&vm->mmu_lock);
> +               return;

You could simplify this by just setting state->nr_vm_logs to zero and
dropping the other two lines

BR,
-R

> +       }
> +
>         for (int i =3D 0; i < state->nr_vm_logs; i++) {
>                 int idx =3D (i + first) & vm_log_mask;
>
> --
> 2.43.0
>

