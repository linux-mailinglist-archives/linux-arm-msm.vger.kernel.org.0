Return-Path: <linux-arm-msm+bounces-65704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D58B0A97F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 19:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B3145C181C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844272E6D26;
	Fri, 18 Jul 2025 17:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOjihzHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117712E5B0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859723; cv=none; b=fZahI0jV8AK9Eb8QSLNONttaKA0aGjOPKzL6/s3pEuwdHCnTl9La7gLN7UIvYMI5bKeQ9cD4xQgR6bHtXtdz7RaejVyOVmk/+6ENNk4In9bHj8WpxonQy+lPfVbnYiH1inqo8oMoTs9MIZKEl9/v90lZ4xgJTXhbRXA6vcHgWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859723; c=relaxed/simple;
	bh=tHym/k0wWfQMHYQVdHi5JfPV7kabZ4jWC91jK0udNSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0xWrsLK3h5Bou3apxzHTXc0pwFtwhGukbp+oBFNvf9DKWJKxL6AqaTYBArXNUqqMxowzGWDshtx3VLRr79x0Oz0YdDVJ7hpYVpgg5NcJYVKCT+LRThDeqiMMR/51HoJ78LMYbSwiNF6l6c7MvrNR8SLkXJHQjxDBWW1KNUxZzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOjihzHU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IH5Pxs025205
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f6yNaiRLHAcK+6GC8eMfTdPL
	ypI+sKJ1RhRN3e/m+tM=; b=TOjihzHUobpA6dFi1+++Hpb9xgD+bHm3xJHRqLqd
	CV4XWt9vKzLLg51HQ9F+OCmYbxK2s8LfdHOPNyCjtr+1qujPhZivZxfVHGnTjjIl
	OCg6TVvyjhWZvUYXTpjTQy6AnCUtShf8RUcL/+rOxqYWsRRNj6AsyyczA/dT5D2d
	SNEl+EFiynDyIT/mDLsDmGQOhE8CAwmg1hhv5IfU7xzibtcW3chHD4isF52Gqomd
	APa0HuB0GLjFDnwYzvB3859uVjnGpRro63e7kUcI29A+bs7Se991AjQiw6jGc4Uj
	g9fIwhGe8Tt5vJIWUu7P5yCA3kmo+l21eoeKHIlQcDJaDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqgkvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:28:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so424043185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859720; x=1753464520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6yNaiRLHAcK+6GC8eMfTdPLypI+sKJ1RhRN3e/m+tM=;
        b=GX8zZ9oE5pH2rAAqzTWc9RUIvKCKdBCB52GabjsPCSVFn1OAxgX4W584d8MY7t1F/2
         Joc6AmTismZ437JAY6nvhL/UvA8Gsmnjlz8HfzeakM2brn57+4yiImSbFoxkFmpLNn51
         E5Nu4zWrbEbiwh4V1jSljZdtUm1pTQq0iDU2abqHm6qTfLq1Au2DSzzrfDvOehDb/275
         f1PCbo/uo9bzm7WxHi5/aXRmWa/RviOg4TeEydZi7gJc8vTK6ukPPFby8ybc4uD6fil1
         /QiPrUAnFeq4agcHanbRhXn+a9nHWxDCZtyWIzJ6cSRU634G4D5R1tnsulq23Do9W8Iw
         1sHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwqP3Y+DZI07wLlyDOMHTN6ZD6HN8bJhVscYvBRkZai/JTUtRsJkvGB6ZO1IHRcx2RoTUUvaB7O21lr0Sr@vger.kernel.org
X-Gm-Message-State: AOJu0YyZkK1xkqIhqghAaRoRnkZuJbbR/hlZWZud+dkWd8cP62LYUE+0
	rnCwBpd14YprFMB8r/pZs8xkkcUYtt7YhDjuvN+xyV7UQIs6jdj/oqKpK/9+b+xBnYIK4jzVyVF
	jbCGKvlGsrKgar3HmKp9Yxuw2M/9bBRoahqQUn9Fw8ekUafaOBTJkqw2JPwHwdBjwQ/HU
X-Gm-Gg: ASbGncuG1Jovb8KCm01Y+df19uEKVh835yuN9SQYoklWf9twP9SSvpPTJPQVF3+zvbY
	bzAXH287GO2JatvirNuU4/AuPQQQejBw1PJTW1EyVzqV8uM7htRDlabyLzrnxfdqc1dcP8Pby0j
	Dlq2oLPL5IMyUc0K+CbzsDZF8haBYfI193oXHGruaIdOZLYEB+4sER0ofauusv97fF6DrNcHfZg
	seDkSday3+Vi8CvS19ADS9UQETdGoGyh6X5/HzVz7p7ffRV3TPcjvbYGmbPXx04gbjUXI4j/FZH
	A8ZNaXSow/8x12OPvuJ0itVhwfcqxpuuBG82OhkKx/Xlio0uJHzdOqM9e71mQG9bLrRXMJ85jnE
	LaoJUw2xsP7cliwKsryW8TQgfZFEYrjIQPfEbplMxWRD9/bkJ5Yx7
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id af79cd13be357-7e3436253d2mr1626777985a.46.1752859719446;
        Fri, 18 Jul 2025 10:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1w3sp9zVGjYWBmgKH917pY8I7F8sCh3F9gp3Q6iMWVLnWjt4QkDQ8fFwWBHnJpBaRVJQW4A==
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id af79cd13be357-7e3436253d2mr1626770785a.46.1752859718706;
        Fri, 18 Jul 2025 10:28:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aac76bsm336325e87.68.2025.07.18.10.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:28:37 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:28:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm: remove extraneous semicolon after a
 statement
Message-ID: <qjvxpdibdt76vvw2capf6mupiuqvjlcevtfl66dkqp634ot2zd@eau52bnkh5ec>
References: <20250718133404.2047673-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718133404.2047673-1-colin.i.king@gmail.com>
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a8448 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xHVDqe4EictJAN7MuBgA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: m4Ttfd8_hJW66dWOvnEYsE8XZpYPx1SK
X-Proofpoint-GUID: m4Ttfd8_hJW66dWOvnEYsE8XZpYPx1SK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX3JPCUI7TtdB2
 sIqqGHeMmapZX5nYbwyR2GDLMfMVZzEemsift9+f8bgimCZVtiWSCnlltPr98USWipxKakQY72M
 wU0n1aUCiYPzozqICm0VvBHlvFFa1vbt4iLd0qdifUh9eVEkj5/J8RvKGGl8pwfBRp9Y/3uH9sV
 bBCxXn2asnR2Ydxf1nI2NFeMztaD44vMV8bfbkIsMQG6ZwknsOj0RFXTH7RTJ8B/fAEV4LxbmwW
 wvArMY7epZIogWuphQWf++tap5Dm+YnyuFcNfJ/HXWtxf0Vyx7c32+rDsNbN06eAB59H1Ag5gfn
 QrGKo2YxNQe3TxC0yhxuO/AdOiAs08ubY4C9eK8TIxk+g57sxGp1JTxl+jCX+S2Wkn8+6LsFutN
 KRPMQJcmpzgzn9WG0dmrMOLzavp3NpccRdnZIgYuQ3nKtnfBV8GIprWOjO2S8hl4KLfQtxjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=732 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180138

On Fri, Jul 18, 2025 at 02:34:04PM +0100, Colin Ian King wrote:
> There is a statement that has an extraneous semicolon; remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

