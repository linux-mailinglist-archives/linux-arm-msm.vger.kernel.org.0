Return-Path: <linux-arm-msm+bounces-114243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QLRQHDWvOmr7DggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:07:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A76B8909
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:07:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pTuTu6VL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MXuXaZyH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114243-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114243-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0723C30AA2F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D308F30B50D;
	Tue, 23 Jun 2026 16:01:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5C030B53F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:01:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230503; cv=none; b=BPu/uTppuh4914U+qZ0PBQXHiQ1cUIqXZcn1rBkB7pas0YDZEZtpAt+9v2HNr1k9ub0RITxqPfG5A7xnRAfRl0YN1Hqjnpso8sHt5alBsng4ucYRwCCw6Hn1mHdd82dVEVOl48iAwyPnZBF/TEkBYSt1kcfvKyAozvVx8su6CBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230503; c=relaxed/simple;
	bh=5x4Qn2jScmdpoYjTC9i8ZyEGJGnapAS3dQcXy47NxoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wx/8U/LtF1Ve9+jGt3+SAscLKaROGkFnzrSUZxugg0dlcMMsCfUd4GX9fSTSIpCwOhgXh+4gmKL73yhxYSxiKI/4YDHxXt96Wi7NeG08YuO9339BTtrVEqWwDIgt/u0+XiYj71BtiLT7LDhicfDJe0Ai1rH7Dd2/9QLrsvClFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTuTu6VL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXuXaZyH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NC6gt03744649
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fBp3puLUMyEYdihfHRllMOzm
	OhNKSVobjoArydDpeN0=; b=pTuTu6VLcOdZek5XiQjczXrIbU1f+VkphV8IA/LO
	+BHESQR2mmvobiSi8p/SxbO+3YjMedTXxG2dnvouEPWaSMTg7f5YO2Y4qBPgoH+s
	ViWw9Ox/oVOUotiE/F4UjiUT8y8kV0slc/W/c/WCSoEf8inFZieHKWE+/xvYV3WK
	8j1ui22tbyD5h393Hnq2My/0x/SWEGCXuIWtv/O4gUcvmuD2igoHyptnxPzF0Y3H
	0MouP9NaoKl+eR/fZpsXO1v+q4B0UadEB+oWHhREUg1t1RHGS39BWH6qwTGHF5+k
	HEqfiH6x8bl1Ua+G5TFcFTXssOhADIFR1JkHtEzGtbCFYQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3h135-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:01:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso77752a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230500; x=1782835300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBp3puLUMyEYdihfHRllMOzmOhNKSVobjoArydDpeN0=;
        b=MXuXaZyHOSOCYBPGTYtathcVwhOAmhM2MIzEs6jU3/LX8lzDkai4vGCZSg4Jvomafq
         WZUufqROj35VQ6UxyF26SSrhf+8gaI5lE355thBPzJkX7bt4TWEI6qYLTcghtBS1b42W
         7G8ZCiddvx8XeOEdZ4zwGFggOOkTy7UDx+FRkiNNpCjijaua8FihD0n9gUaWx1D9gqRw
         0lh0rgiP7VfGV/KH8q4rjvwEihuEVgzle/ibjXDafK54K3lIcPSi9YR8hAla3vVR5/Hl
         sf2CjuqcY9NL4/YW7U3/bquwq3uGoGvGmC0LJLZ5xXCw1ByxWBBfgMTtz5I04lUmgKc+
         Ma9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230500; x=1782835300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBp3puLUMyEYdihfHRllMOzmOhNKSVobjoArydDpeN0=;
        b=ZxklBeoIfxFUTQW1FXcrsGsAxxilSKWCsP/1lF9YqzOtaH5rL/ui4VPBaDmOlgIZap
         wEs15BxcUYVFh2om+TF7t0eya9UJJVWr6YCKxXnZ+ccdORJJyQWlFJrXDLES8ZIJQXFM
         4hadcDQR5098/2TemFOcab2sT5MdxmJ4ONbJjnQXkCVKin9NpOX6ztbzLXaGqHUkSEU2
         fLUpb1Ksct2iBzK5oV2/8fr98xMQoA/++ZM1gLtqUVEF7QGVy5SUO2WRYSRhWLxOxxIM
         64cg+kIAlI6CQUZXnfAn0Q2YYjLbe8elzaHd+JamcuiS7GU7ciO/BIoHjggN1/TYJ12s
         ebww==
X-Forwarded-Encrypted: i=1; AHgh+RohvDo0kWggqqPf8ndKxfmVhF2ZwGwJZcZvVxreHz0yu3NxZQeEPS1QGkXK3RKUIaoRVvbpX5Jo2fakSZie@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/z0gy1RD4WfYIirWW/u8K/Mb/YW/NyB2noWfWACuZX6lzIpFz
	0qRrcVOjrdsltRrEwbv8DtomdlTnCGp46TB5cV7i8ZTeaEKrUXPmNOQZBveDtoVE0Q42SlH+/wR
	S0ynz7hPFiQAQslgi+y7QO7nlha1ygB1kK8FhdeJQrP1ETKuRSjFYEeQux9AkqJZD8yFu
X-Gm-Gg: AfdE7ckpD4Clld2Jfv696rtn3LWvqENu93b5xAT8UndwS0l+7d+Qycpwsd9zbJdJo6N
	oy1Brut7DFCpGcCzIIDNsrDMKU/TjY0T8Nr2cspMjqj8l32/Ks8j1FGzup6qPpFyQnWez5R8sgu
	FW62SQCacN4oybOm8Xsx0YnbM885CRg/6YUNmvEqhrYWABc5sGfg79J4eSFUpYUhAyPgGOki0Ma
	XSyttc3PBIHneYZgFx1fYkaoPkcDutICksAl/OFLJuZXgbsQeG16sn+NgyvoaJFvKjVWGUQVH+U
	ZIAb0BhpxDhQIcpWg9j6pDBYMdeuVtIHrAOEbnlAN+dr6JnnneLvTzET9sKh/h99ZoNF0ypJnnb
	aDHU6a9c3B9TUYfiQrRmPg0+HgA2tDkSlgaVU2A==
X-Received: by 2002:a17:90b:57ee:b0:36b:bbee:fb28 with SMTP id 98e67ed59e1d1-37d160bd6dcmr20063048a91.2.1782230498921;
        Tue, 23 Jun 2026 09:01:38 -0700 (PDT)
X-Received: by 2002:a17:90b:57ee:b0:36b:bbee:fb28 with SMTP id 98e67ed59e1d1-37d160bd6dcmr20062934a91.2.1782230498192;
        Tue, 23 Jun 2026 09:01:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm10452458a91.7.2026.06.23.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:01:37 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:31:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, djakov@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Release QMP handle on ICC path
 failure
Message-ID: <20260623160132.5rknnudcs7g7haoi@hu-mojha-hyd.qualcomm.com>
References: <20260623132015.2243317-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623132015.2243317-1-haoxiang_li2024@163.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfXxx3eUtq4G3ho
 mCUR30hD7jn1X4FWxqgz6SWDjilDIOlkAMlrE69gGSlKPRWymIqBbPeCoqSd6Lf0ok4+WtPmGBg
 kMTececUADvcTPZjBUs5bfHUiAM6vFw=
X-Proofpoint-GUID: 477sh5LL11aojYTCpB9zkcjm4jpe8mag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfXySSD+DN1cNju
 VTM3/AGrvUMK5owo1AryXCF/0H+c3CEdh+d1uwqNn67XmMeYTqP1cE7e/H11l8Mfnin0bPZpIbO
 FRNvxME+JA7L3CCTnPYBxIzsYXS1pYtlU8/iGbDncYkeqOB/lTSSIo08ILZqQ0qpvLI0AsZNE0Y
 M9CZMpBZKyQ4f6Z7hqvG5ylUZzlPueDjtvCPaDbZiQCFrCuftwvuaMQwYNNPEfBPdVAzac63o33
 axC3WiBdxsNYxCZ9wrvYcATGJR7XV4/e/Q0ui/24cUiRTr/e7b9phGkpVOt63BlswEu0b8cSJBT
 vz/FQXPNV5yXA1T9/bV0tnHG16LxSLrdd+d5a7adNQWOuUF8v0yVEYe6DwKcnc2QDFu1HUrgHHr
 YUbsULlcr7wbB2WN/AdlbdTzjzrkNQ==
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3aade4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Byx-y9mGAAAA:8 a=WIYw4C37AfVeLPo9jZYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 477sh5LL11aojYTCpB9zkcjm4jpe8mag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:haoxiang_li2024@163.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:djakov@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,hu-mojha-hyd.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B3A76B8909

On Tue, Jun 23, 2026 at 09:20:15PM +0800, Haoxiang Li wrote:
> qcom_q6v5_init() acquires the QMP handle before getting the
> interconnect path. If devm_of_icc_get() fails, the function
> returns without releasing the QMP handle, leaking the device
> reference acquired by qmp_get().
> 
> Release the QMP handle on the interconnect error path before returning.
> 
> Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 58d5b85e58cd..b57041a37d28 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -347,9 +347,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  	}
>  
>  	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
> -	if (IS_ERR(q6v5->path))
> +	if (IS_ERR(q6v5->path)) {
> +		qmp_put(q6v5->qmp);
>  		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
>  				     "failed to acquire interconnect path\n");
> +	}

I would have preferred to move devm_of_icc_get before qmp_get()


--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -331,6 +331,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
                return PTR_ERR(q6v5->state);
        }

+       q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
+       if (IS_ERR(q6v5->path))
+               return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
+                                    "failed to acquire interconnect path\n");
+
        q6v5->load_state = devm_kstrdup_const(&pdev->dev, load_state, GFP_KERNEL);
        q6v5->qmp = qmp_get(&pdev->dev);
        if (IS_ERR(q6v5->qmp)) {
@@ -346,11 +351,6 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
                return load_state ? -ENOMEM : -EINVAL;
        }

-       q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
-       if (IS_ERR(q6v5->path))
-               return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
-                                    "failed to acquire interconnect path\n");
-
        return 0;


>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
-Mukesh Ojha

