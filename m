Return-Path: <linux-arm-msm+bounces-54848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B14A94F6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 12:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F98A1891FDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 10:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C236EB79;
	Mon, 21 Apr 2025 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZEO4fjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154E225FA0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745231901; cv=none; b=DL2s7sD6iCNOvaP7HjVLDxEhdF+oUle6vlJLSvP6UyYpCBiQEKLly4xRbhuVmPp3Cqb9PeO9dHntair4Cb0TIEOulne8arpNdxVkz3MGPyYeqO5lGJ1MtW8yokvzbyJDTbB0ezlhqg9kv6Q1CNKCUkm2926IwG01UdRw3OJR12M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745231901; c=relaxed/simple;
	bh=QHaPZuunfEL/BpuzNrYBwWhaKnockJX6CUDjOyAHmZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCKBE9v0JfX7L4SFKx21sf5yuDDIUtPeVCKJE3reWv3H4giMAiEdiTY5fIFr++ne82x00Ae2OqsM6VnGmeJclcnHeYZZ4Lhn6r7zSWyBKSbm2hbW2yTvDgLoKYp115w4TgZJ3A2/q/lMKulD83uHqhDSIeXnriZTDYdeq3ZG9G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZEO4fjE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LAACTa013701
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 10:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c33W5SzLL5nQYhmY/46EzHi67Z4y3EfK2fl1ouN8z5o=; b=NZEO4fjE/Qd8/mpU
	y0f1EkTCGoOWVGQ6vBo1IJqhucb+LQzGBFNZhruo/s6P/qmOF2ajSrWJ5jBqJcjC
	RZ3bdE/skeTsAKONIF8vQT7wzBW/+Y2wRYbz5MO+4ib9ZBTfdqw+j+ctgbUrgTUy
	GLbaP7jVGRbn37AEeEvQUleKRzf6AGsw7c56Tp5FsPCbftkteLiIBViQRaWr5YgV
	nHDZ4Vn/GhOyk91uTRSz1hSID6V8e81Juu5ROH1jxYnvyAdUFrFWBdJ/NCP45GoB
	0tBSV8LDYGnbln9oiTL7hWDx7VBxVGRzjOydepbrBZD7tbhoeGewCgX6YrCGd8XS
	kOsp7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qv3xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 10:38:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54a6b0c70so347125785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 03:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745231897; x=1745836697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c33W5SzLL5nQYhmY/46EzHi67Z4y3EfK2fl1ouN8z5o=;
        b=N740Y0u7bsL+6p0zul1jqg67a6OqYC3XklCJMtnjEtK4Brcew9Kxn04ocmQ1RKhyoN
         XST1wZdQTLKbXevnCm1QQS+v3z0FktPRUXw7lmMu8+RKf+MUoP8QBDkkLJ7WsuNx5kB4
         TIOCq0meFocKvc9+3a//aTYAd4lxwerPUnzRoTerqJWRX47loIxYUuLEmjhAM2n+vH02
         43cMbXwsclm/c4dNNzHoEvdxTuCH7psRfo/aAM74D0K6V+IX3yWfoBMWxjpx5eVqdPST
         D0DCz4WCRF5TdrOJiHDUIrmzBOSyPtiEfO41vUxjarlmfFKuFDqQ6tretEjFxzkMTpA7
         YpbA==
X-Forwarded-Encrypted: i=1; AJvYcCUslLGDe5RWrdQbcQh9swpa3XWdjoJ8bN+1aVf3YPimtvuMFmGZMBmex82ZPGiuaja8iEiIlRGfXe+oYVzq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4uROHj3aR4H4N4ebNPSutRA0bRehQ1Lmb7omx34JZNtENBNR
	lYqYEcP2dIWVLrCXSIEp7I2czaSkYi1L8G15+S4K8I+96XEnxtQz6qDA6ejHdXFo0/g6GaGKQuO
	HJtnbTP05rrGqqFPJqYHK3bxwxPIz3/Uvh2yeQ4zompKaRPa5zckZgtf545SoSS1EdzuC6d7m
X-Gm-Gg: ASbGncsiofX8umtaqw+OH988fiPCyFKJIwHRfamXMdNWvKqG3KLETmyRYtYi5KvNZLs
	oM43+XmCyJlta2QE7Di/ra6bgV7uOtZCmVHK+JMc70nbgPmFYVnPKvpyUINmuYveSBJa4NOTUG6
	q3WCA3EaaCQIfPt4K4nx5l6tHdMu9OqWmYWLOEkJUxiVxoU/RUtsvEnmtymAOrICdh9wAo9GQEB
	WKbbIsEN0/VY2jyTVwI0hGlPkXaAIVmjTgNjDjRSt3h/MEkPg8i+q8Kyf9WLf6fGam9Pl4kU+P5
	Jrafe1y4WXngKyg4unpE6fYoxMaYjyVG4c/QjNacllR+K+GHZxo53J/qigFGaSUWoz5fb/RYI60
	=
X-Received: by 2002:a05:620a:410b:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c92800f4dcmr1977321185a.45.1745231897540;
        Mon, 21 Apr 2025 03:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqPUXrAc6wUNlI+xH5WJujuF+vftFUpOnZDrS8FepNMUuNFAq0kE7F9gbhkQeBqGJT7gvqbw==
X-Received: by 2002:a05:620a:410b:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c92800f4dcmr1977319285a.45.1745231897191;
        Mon, 21 Apr 2025 03:38:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e536c2bsm890524e87.31.2025.04.21.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:38:16 -0700 (PDT)
Date: Mon, 21 Apr 2025 13:38:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 1/2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
Message-ID: <viki5krjvs3vs5jf2lrhah6v5rziqju7jv5kbwz7yyvdfjwhh5@6gieypw5owfp>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
 <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=6806201a cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=_T3S15piZknK-H0ZweEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: Ruy1SFQm9h8ZwqL6Fxn9hkacDMj40qTg
X-Proofpoint-ORIG-GUID: Ruy1SFQm9h8ZwqL6Fxn9hkacDMj40qTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210081

On Mon, Apr 21, 2025 at 04:04:16AM +0200, Barnabás Czémán wrote:
> mbox_request_channel() returning value was changed in case of error.
> It uses returning value of of_parse_phandle_with_args().
> It is returning with -ENOENT instead of -ENODEV when no mboxes property
> exists.

Why? What is the rationale?

> 
> Fixes: 24fdd5074b20 ("mailbox: use error ret code of of_parse_phandle_with_args()")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b78e209861c23d934e1b9fd743606..e552a9af578e48cfd854a228a4d91e4fa04bf29d 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1368,7 +1368,7 @@ static int qcom_smd_parse_edge(struct device *dev,
>  	edge->mbox_client.knows_txdone = true;
>  	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
>  	if (IS_ERR(edge->mbox_chan)) {
> -		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
> +		if (PTR_ERR(edge->mbox_chan) != -ENOENT) {
>  			ret = PTR_ERR(edge->mbox_chan);
>  			goto put_node;
>  		}
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

