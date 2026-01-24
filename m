Return-Path: <linux-arm-msm+bounces-90415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH2LNdjrdGnu+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 16:57:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440E7E12E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 16:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B809F30056FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 15:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EE01EB5FD;
	Sat, 24 Jan 2026 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SG12+DI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmPOIQq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEB41DFE12
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769270203; cv=none; b=mAqUtMpHrkkUgRNoLCu4xQkbnvRw8oBeorvpoH/fN07vfgwyOPYCCmQ4G8JRgFSvwhNXisRUDpWA+kJQ4YSCsE3nFl8syccvvyLCZVBWGwW/0rRXrtrXeTNWPYrW+fr8fhJGPfeDhbQIOjf9QYoLZpjh1Zkl8uJTErc9Iw7yJm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769270203; c=relaxed/simple;
	bh=SSshkAyqJZTqKca/sDILgs3obPFksCV6s6s7dYZ15Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAon7lJBp0aNhp4iC0g+AOdzDOMR07mL7AAyuVCbVx7BRxpvZwGp/vS5ScdWjBsqdXkMf7noYfJEwwi3ZiSceL9vKAToprBOACfqR1nty1902FZjPUCMe7NDCrvX7w6nLXggYjkqE2g+5SzM+J9cZZ517wGYPfOFIzD0X4O1aq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SG12+DI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmPOIQq7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OC1Z6u1348087
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 15:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PD/+4Tv/QlJ9os4hleObvuo3
	vPxWZDiHtIkn/geyQaY=; b=SG12+DI58KAP2XZnxvPaJA5caCKX6CGBs0GGHypy
	gpMNt3t0b2LoKHoRk4vDdS8d6HWSOQn4/NuSv8SMra7Zo53M7J3RI59C30oEC6Xr
	S7/j6X/2H3oZXhe9Yuk+ByDRU+gmXdFKdWX7TPEGinuhye36PIro5lzwhEzu4yJg
	IddLiD/jh8rqIXEg/JwbAl0jZiqZxCZVD4MnGxWgCeDOx2sclhNSexoNTtj6Ce6/
	/SNTtCJPLgEOgOyaNn4VuukzrJrdaGCMiFDEzjpyFocZgzoX5oP5V+C/WYmh1nGg
	+7iR4ZwkNncGzJj9jC8j1AKmgQnNn1pKn2SwM3xk4IIbrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3h8udn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 15:56:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50299d2e742so144387461cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 07:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769270200; x=1769875000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PD/+4Tv/QlJ9os4hleObvuo3vPxWZDiHtIkn/geyQaY=;
        b=WmPOIQq7j/gRRNwiw0ctIoPQQHFDlKdRHT3ui+K1tlhVLCuKJQvwEFm+nETh6SGBvE
         D1Nq2Ri7Wqea8CT2wm7umkZBkJrA7e4U2J/Q3JvklYCuJ4z6chVoGMF1zBTBfSkma3JB
         1m51zLVX24qwoQIaBoNIt/36y12ATH4UIO3q4baHSkn0nAw15EVzg0GCQU8G/WiGT+Fm
         81pqgBvxuay18nB5XGt1xg+2gsY4/TZET3rCOpTh3yepj2jcmxurcyeOyDoj0Lz9r9Fh
         D8jGmJnskmfy/gzxvVXXI5oozJG1OiEPm5UqhL4Q7dYNrB/EcZHnr58pNpl9PGFuxq0I
         oCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769270200; x=1769875000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PD/+4Tv/QlJ9os4hleObvuo3vPxWZDiHtIkn/geyQaY=;
        b=EZrtY8Epdvn/j10BGeC180OTItP99Y5toBBGhN1ircMXxe2ZKahlVXgiATDTzGmiID
         vBKGzlme3JHc7Znr284GQubMPcs5C4iYZaHK5ispBbXJW8OrwiSJYg+ZQDeXu8k4X44w
         yk1AIVLQAjLr1h5dWrvBs06kJn/NjtAG0gZbMcNB9PVv1kCAx6ptJ2hW0xs+7V7qX3jz
         kIeQnPNKio7tYX0mkOL1ml6cah6Grb4hWqbHmG5gG23JhRzJFUwS38WGozuOTmMydJCY
         7PCyTKBDissBcUlNPT3DN9vxSHqs3p5MquUIK7/YBV4e0qZHfdLYqQPJc9+XYwRjm19a
         vCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfCINrZagV5NlQGvEr4tMQJLgcFEKEEMNmz9sMDhw8IgTmp70GRqZdDLhglAHw/fn3DYlgNDDr95qcl1/i@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5romcgUQJ917pypYYBDpMOmLiLNMEXSiTn8NBqJ7dw4aU5M/Y
	6/Lkv7hypAdGwe6/wkrRiWGHY3B3FxV1rHGVTSJlFKE3ZVAbn6lLEmga9qWqhdDu75RJV+LnPtA
	skAftIFmdIi0FTFZjhhREW0Yaz9MFFTSzsl/YeD4dgOx6a2a0AxB0pX1yu4JONdA3sgXH
X-Gm-Gg: AZuq6aLPqo8kFajqLZOD4M+uDLN9BUGrjNvnB+5sBW9rMxkVOmjWzEBjiPYeP4+NtLo
	TZyMyudXy3z5SO/s7AsFxtrcbkteCJyqu3uJBwwA9PNj6e5TjHoNeA2xK6lOK91FXDMCv3B35CN
	4htcFVb18foumqwtJJfrHbied3WfIZirDqkz1P4avDTzV01iqgV6wWAOtjpC0KnAdg/e6J2y6qz
	dqZHyt01TmJhCljI24+wYEvs+MdDKt8DsnlwSlQU6PZz0QNKl2LSj7lLj7FQ99QFhPzvaSfCRKC
	kuWBPv66LJFnp3zEXxc42KE6a9oORP8me93aFUg2i2veCuzkyFBFESMoSLChH2yHS+kNhKSEXAm
	4msUUeZ/2dukShJY1VJXStNFLRPTmfhroQe0D9ZOXNMdyrsoKdUmq4yc2BgSeMkZk3+xFuoKAOa
	pUCZyp2OvSxMkI2GYg7hJhrm8=
X-Received: by 2002:a05:620a:6c86:b0:8c6:a8a6:e164 with SMTP id af79cd13be357-8c6e2e34264mr811833685a.45.1769270200303;
        Sat, 24 Jan 2026 07:56:40 -0800 (PST)
X-Received: by 2002:a05:620a:6c86:b0:8c6:a8a6:e164 with SMTP id af79cd13be357-8c6e2e34264mr811830185a.45.1769270199769;
        Sat, 24 Jan 2026 07:56:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da200503sm12996901fa.50.2026.01.24.07.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 07:56:39 -0800 (PST)
Date: Sat, 24 Jan 2026 17:56:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
Message-ID: <ai2yoizqkpx5f6n4y3v7p6im7wy4xwsgstpj3z2sbludaat5wv@i6gpuqwg73yi>
References: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDEyOCBTYWx0ZWRfX7yDOUV7j0+Pn
 jkjx9J/OKY2D0cOSBLpMVfeLmtdAjydkAwDFYlzPIwthZJZxM92zVRwtFKsI6c5M0X27KcxQi1N
 vXQRGk6EDey9fD0jkA3zCEN0poQ38hxaCpvHHNTpzMYIcr8GdI89qQocFq5sqB8GbEXUI0gVBTU
 wcJJqVzk7uKwcGBMx3Tl9jEkZyaJF+FgWnCRy0kEL/ouOxihxxhBWJ6W2fv0coN7pAvxVn0XSP+
 ESDVQaJ6vP5jQnKazbLbaVHjLbpxAbEiTBMk0rMN81AVG8Tn1xmKuSu3tH7DIqA+nnsKsw7BB6n
 GvYYQ0ssIR35TadRzbHv+Fn/q89aZTvCpRrT2waf6PRV3w2w2IMVBDAs5YlypINlMSpJjFI+Ix3
 Crmuj7drM/xAumF3YpRFb8+URsD1wX7fZTZjCJayGmJgGzyD53Yx+c1A1shBBnq70VNZ2GuN8KJ
 7ccKIG0qaKp6szmUc8A==
X-Proofpoint-ORIG-GUID: jeHTw1g4KAcrVeyELyrM_sLOUAgD1Wdr
X-Proofpoint-GUID: jeHTw1g4KAcrVeyELyrM_sLOUAgD1Wdr
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=6974ebb8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YWtLmMpjZNbrRuJAT3gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90415-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5440E7E12E
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 06:32:56AM +0530, Akhil P Oommen wrote:
> Since it is possible to independently probe Adreno GPU, add GPU match
> table to MODULE_DEVICE_TABLE to allow auto-loading of msm module.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

