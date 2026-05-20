Return-Path: <linux-arm-msm+bounces-108641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOgwCOZrDWrgxAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:08:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 897EF589686
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9259301C95C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00725371CEC;
	Wed, 20 May 2026 08:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYjAP1v5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hr4ZpGA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA0371072
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264427; cv=none; b=e68Lgx1rMoSkB/ztY1OlyYTsoPwj4uZxwKsFZA8Gsbo0XYpCvbZPIMDftOSTjs0dsOWzBrU+JCHVuVHiK/tD8Kf4EZ7e1/Ne2opKbSfCnkYQQpsNNQEPcz0GZZj0bFPI9Q16e9fyENvpZARe/rBE6Ro4S4bsmFlE1RwXgmGqqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264427; c=relaxed/simple;
	bh=doSLGbIUz9VSQbzQuG9/ImNnE2z+3bupLiKkylWPmm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSYD/Qkc/4ixMHsHjAJ30Lh82q7ijEq8lZefRXuw1SvH8ah/4Hj/fxg0bix6cXp8oapG1tHdUz48vbHQcNQPC3ceavnq15y4fgqrkXv364Yh4EEXpvF9bjfhFFG4sjVcUJNC+kw7n1777KhRfYNdJ9B8XUd6t4aI2GwssgDAYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYjAP1v5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hr4ZpGA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6urwE1238004
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T650/7MaBBkMruY+YcsiqlMz
	u9+Z1ZdRxXJEofivwyo=; b=pYjAP1v57ijF3+to3SE4aa/9Jv9WItGzu6afPG77
	mrZ2GMD3Y2v1VL5Qxa6poWFL7mYTfZ22aVL2UniJKCC0ZmfHWnwgxqYURr1eH5JZ
	adG6WVvNGkHwnZfiO6Wq7JuVi5eAmI0wDktbgGAQzlbGUh95nkP+AXslYoaHJV0m
	0iQ74a7rn63cgsHbo7waErro80s7mzCiy92WYqDZ7tmQ/HF7J4ag4kQunVXf1Sfx
	F6QMn4+6fJyom04awa32JK5nU26kMthA60nInQQqHIaLtfp4fQ4GbZbFr174ZneP
	p6Latchcev/seHQJppO9MwOUhmmLVH+TVUgBn70i4R3OdA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sut9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:07:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36781927b4dso4881676a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264425; x=1779869225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T650/7MaBBkMruY+YcsiqlMzu9+Z1ZdRxXJEofivwyo=;
        b=hr4ZpGA4NyBouedfFqSWpKPWzFaHgOHscevvTXhu0QDDIUs6fKntpoA6ZafWxjJB1V
         7uuo3fQOJbuEC9APTKxuY3mAq0Qado8JSEUZS/gPnTxVdN/50wjRfiVoGfMYv7eOJ5XT
         99bHplqPR69pnODKGEU2WNr4M7EgB92PxjRiqgD8ZLhEbdnV54mIyfaerEzcrIbrlSyE
         Il3d+cb3PvsJL+UHyXenokrxL8OlnKIQZe239qpBI6Kq84oHSNyZZo6N4MApdW3BLaNM
         BRvH7n0v6W2N6Bnc5LA5jEKKbfMq6lMRqBKV60b+V6uGW9TWhikqp+RM07tjHFxtNVnh
         KREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264425; x=1779869225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T650/7MaBBkMruY+YcsiqlMzu9+Z1ZdRxXJEofivwyo=;
        b=ALhIt6fN3u9uX45x/tpw8pT++9VYCfS32r0TupEnhFR/XFOTAb/q65MkMmrlfHD2RC
         jIbk/HGsF3gqbNV1deW9lR6FdScn0K6K2XVYlY0QM84+dlK1aYzjZrjyGgzmVC0grRi8
         3mj4N6ztV3BoViLYERXAaU3gSgtX8pUTZ65yAsstHgHlhLErInY1Xcr2HbmjdlNkKBnz
         j7taO3dnQXQ+6PJvm78GkcGy6bauUeTtJhoCltzs+IhppuztXvtikCTBzLx1c+SydV/Z
         wbbPQb2Ckgmwh+oIz5vt36D78ZCabjK44RIpScMuYIgqaX7gOZOh1PVBd5qBQPKRF59n
         aajw==
X-Forwarded-Encrypted: i=1; AFNElJ+GYBYn387X8/ZzKMtZEmfip/+lIBqnE4ckF120FdiyyUYRerPnkkXORsQDlbKTpWan7PgWoL507S1R+9m2@vger.kernel.org
X-Gm-Message-State: AOJu0YxVUQbKlVORn14FnB+GmTl7vrpqNkzxKbz0Q2F9p45PHjCwd59j
	ESWC/sYsx+M5p3KtlXo2GAzkHzJyUrueMbWdTDgn6zVm1hSk1FgA/1Y18AuPwJX4aSK4SQPixw/
	DqaDMslAl4El6D/nW70ThvqEo5qmFaNM8t6OG6yzV7jtl1IzuYSbrxKvXN7qyekQwN+8m
X-Gm-Gg: Acq92OFH0LI49g4C+ttVfsE8LD3zSYHZQIZ7T9xacaA0tpngK9XUNzQu2EI4HMxZS6M
	XvZn8ThSilXHpwR57uirI2P+XQJDDVOGMzulQ8NfoBPDjwX9YwkKX49FxrTRlpmigc/+yweWJBe
	duqrek4Cb7fyNl/cGFj2zhSu8jE9BhYD+9TWywhsWjoyANrfWEOsR4ngUpZrENrf9Uj3Xx1dCSO
	oKKgizRKIY9oaUAcxA+/E1kW5HvWUAeMpVwPdX8Gg41wdL/GZopRx2krC2sYMMQaUP/rffMiZLc
	sNH7vK0GjsFfuYA2vfJCviz60Vy5sRIWugh+7xLeCAUYRDiM6QCOTl07ah3CrjGTD+xNZx2AJlG
	qGHxhifdJm0lnLGZqc4+xILgP1mwBvaIAcGOwNR4UX7m8NrhYssI3OkvMKL4=
X-Received: by 2002:a17:902:7244:b0:2b9:87e0:1f80 with SMTP id d9443c01a7336-2bd7e8fdd06mr167260435ad.24.1779264425186;
        Wed, 20 May 2026 01:07:05 -0700 (PDT)
X-Received: by 2002:a17:902:7244:b0:2b9:87e0:1f80 with SMTP id d9443c01a7336-2bd7e8fdd06mr167260115ad.24.1779264424662;
        Wed, 20 May 2026 01:07:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fcb10sm209236415ad.60.2026.05.20.01.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:07:04 -0700 (PDT)
Date: Wed, 20 May 2026 13:36:58 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in
 qcom_llcc_get_fw_config()
Message-ID: <20260520080658.grps5dsesc7cxdqf@hu-mojha-hyd.qualcomm.com>
References: <ag1N_rAHEQ1YJsa7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag1N_rAHEQ1YJsa7@stanley.mountain>
X-Proofpoint-GUID: X3lZSIdHLsjWul_h4CfkCuXBpw64QfY_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NyBTYWx0ZWRfX8+k+KN+3wQFB
 mr+vIMC8JzaCVRW+qZJB7qliNv2w5f+wbFmiNX7KrNOdyyUiUAW/iHeRrH7FParknjAgJwpOD8w
 NPfKu9uDzOSaOj6+QLafaOWVr4GronkXdmeap8+e+Ftuq7QJbX62FOA8OPBARe7MZdnuI/HVGd8
 F1FmxVa/DO12I2Gp5Kgpn2FVTqYvg7c/sFDkFVGRUW8w6jVSBdOGZbDgJnNb5MsfhrI2zsfdwJF
 j6MpU001Wgd17TKd1kcD8P8XkS5gs43rdQ6bteqMd+/y8rYh40vICb71hNhwRfVfTNFGao0BRi5
 tesuvAlw/NOKZrMQav3fhPms2P3UAzFXlch6dlTDVJoS4+dVYdBr5ZiBfQ9efXzZPO4pPdRtE5T
 boiTvU+FKa8+DnDWRO812Wa7l/dqyXQ3AvSvkaJOjejPWA0uXg3O5cSPfRDgjLzuWkAcNi8x6VV
 5/A4ySeWXzXJLvEAIlQ==
X-Proofpoint-ORIG-GUID: X3lZSIdHLsjWul_h4CfkCuXBpw64QfY_
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d6baa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=E9smiYq_Guv_G-xNp4cA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108641-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 897EF589686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:00:30AM +0300, Dan Carpenter wrote:
> The devm_memremap() function doesn't return NULL, it returns error
> pointers.  Fix the error checking to match.
> 
> Fixes: ac23106a9b9a ("soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Duplicate patch

https://lore.kernel.org/lkml/20260519023841.1995542-1-nichen@iscas.ac.cn/

> ---
>  drivers/soc/qcom/llcc-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index dcc08f63e020..2006bfe198ea 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -5231,9 +5231,9 @@ static int qcom_llcc_get_fw_config(struct platform_device *pdev)
>  	}
>  
>  	slc_mem = devm_memremap(dev, res.start, resource_size(&res), MEMREMAP_WB);
> -	if (!slc_mem) {
> +	if (IS_ERR(slc_mem)) {
>  		dev_err(dev, "Failed to memremap SLC shared memory\n");
> -		return -ENOMEM;
> +		return PTR_ERR(slc_mem);
>  	}
>  
>  	ret = qcom_llcc_verify_fw_config(dev, slc_mem);
> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha

