Return-Path: <linux-arm-msm+bounces-57409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE8AB0F93
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 11:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C856A7B12D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1C72701AF;
	Fri,  9 May 2025 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaNxtUL1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF728D8F5
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784140; cv=none; b=M4C1FeI1qXiRWaBKiHo89YDczQyX9AqLYvbKtc2wRSRDcLub5256Qc8LN9qc92VA1eVHY0Li7P5/ul+YbQf4AO0vfa0+YGX15jZEN0GSpKel+S6a1xZPdqpvFgk5jYpZpv6IWgiw4r2csxRlL+ELCpoAHrgnuDDORRKax3ZINIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784140; c=relaxed/simple;
	bh=jMWjHD1rTFP9aLEdaVnBGZKpupXl27qmoo3tPrPAil0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cubr1elbdH0BVRmH9z9AEzs8z+FySOmbjSTyIf2C6Vs5o7m/tUS8xs9nyIgfXEG7EbTKj7tSlIMoBR5Glv17AeO9xu8REC4ErRr7qnRBx0ahjweq9dVJ4sdeaRE1m0bn7S2473i056If7vTWF79LWTQwZ0R9ou069CWVrctx9z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VaNxtUL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491AjFA025220
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 09:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5TZMgewoxR5IAJtnCtwQR+2k
	wH5UKsrPDtd/6+1VrS0=; b=VaNxtUL1oVsr1dhcXJ2it5zo0ih7756dwy5nCFJO
	iCeFWm22nhDmGndU8XM7nGAwb4X0RZxxlMA32BujW6AXWQkbqKlyu9xqAlGP0XRU
	jjWF7+jY3XYvTVLP4FhQMWWapRHprrxzB9GqPO2ieM8kYLeZl6uI6vlG1OPy4lb5
	oQt4y2m3yB+64ItM2hJubRcusZuwUJV7l0ak4Okdg1FVem+8hjZvPjvXa3UMKlFS
	yyEfJlCSk+/UV+wdcJvOOjXtcDmy8y6KjbzwJfNJlQoqkkf/GkV7t2nte15mYhpE
	RBBAVTkZPJImHp4wbZTwYjJCGeYBuHIVmxpkHSclSHWGlw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp14829-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 09:48:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30c4bdd0618so464507a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 02:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746784137; x=1747388937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TZMgewoxR5IAJtnCtwQR+2kwH5UKsrPDtd/6+1VrS0=;
        b=hlAoFhWtjsAVuD1amoIUTwsuUIe5gjzyQwRowx+iWtNOiyfa/JsRNOsg2FCuM/MZzl
         8v2pwPXuhR6sS5DsO7iOwXeDQDaUjD7dw65Xt67S+NbDx5pUSFHj132ERcjvcIZ8oW2P
         ggZivNButsQ5QxZnXobpTtBEmygRWilpDAMBdZDLdR5KB63OdiyDHrpTAgHJknwJQJW8
         fasLjA2QMeBAcHX0zAn915xXQ6Rg2MrXrI/zI8SSG7wGYhk6L7f7lCZOSHGtahn7bxgZ
         My0OywEJU7tYHruK90tFMXNcQ58QV07Dm95F6pYVj1iT+HNtY2hoP9z8zBQ+OYzOR5Qq
         99ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjRMgeOwK0V4yfjw8O7l5/vAz2/q65vT8YeUmlZsvZW0bK8/xEMnuRmq7/tn3uTUB54KQckWPTD9EhP0KD@vger.kernel.org
X-Gm-Message-State: AOJu0YzCvYZ+cCLS7GlcTbidRl4BsuEs5jLlHUi4y3I2LV5ZHZSqpC7C
	vTG4cAjG6o4dfOAKPWfREU2qffujT6hgsGYOiiEcI9XOcc139FDOH45m9ajTbBVcuQe/M10MdRM
	LCIN1zbDaCzE3NdGbPbnpWI6iKpWA8x60U5dFYQdkTLPEeIYQNTE6Mj6s3V5G/AOw
X-Gm-Gg: ASbGncshf9je9NS0iKbediY1tcTXpAU6DXc9q7nhmdC9EahX1lEYdqOBtN7ZpJKRZ56
	1fG4rrqwhv+6lvxyFTrcrKvJrvNjxWL43oirYDQgV3sea3gDFDkQ7+xKTS8wU6ehhTjL/CJo6sA
	OrznZf/78irXQM++tgmpghCPiAhYSM9QDiWkFMyFg7nicvMf5ZsK8uf0Qe7UuuoXbJArgjNPoN3
	xZWnnT/AcuuD6WRk5OnugnFo/i7huI6aAExZRGBCurifKJcOw7Q7YinB4qbAMMmfrlbUIO/L54n
	IYAiFcZr8N9E1+eP/yrf4lnbGrZA
X-Received: by 2002:a17:90b:4c81:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-30c3cb19ac0mr4286941a91.3.1746784136709;
        Fri, 09 May 2025 02:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQi8+RQd67W36NgGcktMBBwIUKFCg/Vc4iwo6NQv7JDqt7T8xUwe8qLgeEJmPVVbmD8JtrUA==
X-Received: by 2002:a17:90b:4c81:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-30c3cb19ac0mr4286910a91.3.1746784136320;
        Fri, 09 May 2025 02:48:56 -0700 (PDT)
Received: from hu-pkondeti-hyd ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe239csm3624195a91.32.2025.05.09.02.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:48:55 -0700 (PDT)
Date: Fri, 9 May 2025 15:18:51 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v6 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Message-ID: <a1aefddb-6914-42b8-9ba9-8eb27a0ce2f4@quicinc.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
 <20250425-multi_waitq_scm-v6-2-cba8ca5a6d03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-multi_waitq_scm-v6-2-cba8ca5a6d03@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5NCBTYWx0ZWRfX/5BDmvfH0fza
 d/9R7H/o/wHaxfq9LI3s1k8mzfvEbU5Gi6HoH7RrofL/ZMfbTePnefdI5yE/jGEKrXWfwWM6lQb
 NciK8E3TVcMxRcB5GYmqA57sIAdQfkiVo3z9rjrBAMg4/8dU9k141vmjxJrES2sfRvpHudejxQb
 5pB7GSxuo+mvNinU9oagxrIivOvc4PP3+QZv6+g1WMgZywHYdgOCysoh5Dt93C0QTufQm2jbqty
 uMOkijR6OZj68+49YZndNS3L1LB6fLRuJxbJIiaOjTPHR9KWc4qXGIELGhOhIAZ4dKp0/180/Ms
 8/riyAYuCwDMfa+40oTJux8NCn4a0NbrwkZx65WoS030gFWWWxUuQWz+g/E9HanzC8Ixt4BysNs
 YAvhh2NnqsYXRCGQJnNUiuyP0llm0buRet1RDHkvwsfvDd3x6EEow3sHKLey+43qJTz3bG7/
X-Proofpoint-GUID: YgpxlbsyJNHDux9YLTnAdKVcEUxrPTU8
X-Proofpoint-ORIG-GUID: YgpxlbsyJNHDux9YLTnAdKVcEUxrPTU8
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681dcf89 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=u9c1M-ofyWthsBcQn4sA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=997 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090094

On Fri, Apr 25, 2025 at 04:48:02PM -0700, Unnathi Chalicheemala wrote:
>  
> +static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
> +{
> +	int ret;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct qcom_scm_res res;
> +
> +	if (!__qcom_scm_is_call_available(scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO)) {
> +		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");
> +		return 1;
> +	}

I am testing this patch on SM8750 and found that we are returning from
here, do you know why it is happening? The first patch in this series
does not check if scm call is available or not and I see scm returns the
hwirq properly. I have commented out this block and able to see waitq
count as 2, which is inline with what would be overlayed in the device
tree.

> +
> +	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	return res.result[0] & GENMASK(7, 0);
> +}
> +

Thanks,
Pavan

