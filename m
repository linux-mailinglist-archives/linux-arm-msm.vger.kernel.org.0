Return-Path: <linux-arm-msm+bounces-58351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33912ABB1CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 23:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8B387A923A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 21:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AE2209F43;
	Sun, 18 May 2025 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EeP0Lyu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A41FBEA4
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747604845; cv=none; b=nryGXXYdBBx+NDJuE5/usX63+p/39ZYNEBG2nBzEUt9la79TQPVEUmdnn5I9blnNFo5SBSoECFaUdf/bY8mYhWNYwqwGqnlSV6q527JgBVfKUJEWh56tfw15eEjKmjNszjq4jtoM8LypYDgCdBS9HPAUvJgeCdpPfF90qys9Bs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747604845; c=relaxed/simple;
	bh=8USPPKA8F08m/GfxBs2kIB4QqaZhO5O4rhsWjIsjEFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJfgke9f4GFi2uT6O9zjGO/3dagvvGZkCiwhpv5ZALaDI9mGu1oXV4WOhH0/U8ob3kNI+xHnwxrWe4qmNeXZQGhf9V8GZbDwsXZpwhgq/kuuXvYOa3AeSDPKQah7FKIXzlFcr5UzH2IF9WjTim+O/tbrLyADdPD5i7mo6JAHUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeP0Lyu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IL5Mk5008062
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 21:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6kWR32uQPCPLrbktI7pQ0oTp
	I2aRreLj3nIlYIE/3Vg=; b=EeP0Lyu1TGOr+KqYeKjy8C9h0ohluTsNpAlSQyhz
	82KV9YCHQOVl5CJZLaRU0ie+CoZTQfB4rwBbKZPxKnluLWOfnP60P45upbPR0rxf
	3BPX13eSldQV3FJ8uekUwWsGU9zbZbE6keQLWQqP4T/+8XyhWCk58PBCqrYJIbbN
	/krtPymI0ykugKX0KIAItNsjS0mneNLncmBp6sULvTnkzsoTkWUqe4E9SJvowdw9
	mflmx69nwYodDj7wiAtWh13+osUaiID0m1TlsL1s3qFTtNCaqxGZS427t4kgFmW0
	WzrkbTof3iv5eqzVMUEG2lNeuf0GOf2x/Qxyedsq/Hqfug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4tfhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 21:47:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d0bdd023so38742226d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 14:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747604841; x=1748209641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kWR32uQPCPLrbktI7pQ0oTpI2aRreLj3nIlYIE/3Vg=;
        b=LYZD+B0DvU4YzCuFkkVj8C3cUBzcuzkNpRRDB6mwzIZI3pGAWwdARchh3hkhEUu3+V
         1N94G3jJGOYoyd3Nq52wSBmmzyDLW6GHlUuEajVmojl8lJeJBmWgEVtUO9xlz/RxDgVN
         qipjB5cGxzMH16d5rtmOOx2eEgd4yDcVLfRhs3H16JT3rOvyyX1QWOyA5YetpuR3/klZ
         B7F+VotwQPKoD2J4SaLLetnHr8daWonBs7bUR3UXReKiHqoOYCDXGvdKUQ9+hMvYdJVD
         TNMQCP5L3+EHGgYP0LURBdAEFbzXQNIJJB3UC7kgHgs8clbGH+bQ44WXPEbmqq25dNnO
         1iGg==
X-Forwarded-Encrypted: i=1; AJvYcCWumsDd5ZkYs2e9T3CzZKwlSo7JIuQpwFcj1Y31AdtBiFxArUydzWVz3wtCl366LkfkuYEiOdXtMRR6p7LS@vger.kernel.org
X-Gm-Message-State: AOJu0YwFXvYOvRbV6fE5TAKsponfSJzpcBSyGzRdDnhZDiEpCD2eGSZh
	v7Zdhusr1mk06guW8K3UMTcJeCSgvVIVYNvVSdtVUiKaMK2Asd27Hzahl5DRvI1vEPJTmlv61HP
	hnfLlf3CrqnHcxSgFTO442jXUUEdqh/Hl4mGvXO0iwZNHIjfnGVNsxL0U9x1n5mcbysVm
X-Gm-Gg: ASbGncuzhJ/fcOCfSUgyjeyV9htSiFT1vqhuJa4x1XnnNp/ARV36c6L4SAKouJvubQe
	mMXyo6wHmUzYLCcs9BdxmW+xvJnb8JooALBfciSIpsIkoMExC0nUegJvekKPKZesB2Mtvf3Bp3B
	I9d4UpJe6r+sPpKthEfDEFY9Y2NICgvEFJJo9X94q4wJuf08qfsNdOYecTcGVvtya7fPOPTrv9m
	E7nBlDKi4UV6TURVtzts7UZWAYzdjN+CG5COnkM1UhrI3U6Mp7wdyqtixYyvYCzv6OfodpZL9Tz
	W3ai1mObBrkS0AAa+AM/Q+LJRcmloGWJcK1pu7iQam45xi1sM8YNxj4T5WNJ2Q7XiXkAMaKe95Y
	=
X-Received: by 2002:a05:6214:226e:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f8b2d15075mr197800786d6.34.1747604840751;
        Sun, 18 May 2025 14:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYpLjwtw/2fMf7VCMh10ctMqY3tfAssm+NBI0lXDVy3BdKLAmoBlS3u2kQoxocRghI7rYOCA==
X-Received: by 2002:a05:6214:226e:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f8b2d15075mr197800596d6.34.1747604840406;
        Sun, 18 May 2025 14:47:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca1f2sm15970451fa.29.2025.05.18.14.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:47:19 -0700 (PDT)
Date: Mon, 19 May 2025 00:47:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] clk: qcom: rpmh: make clkaN optional
Message-ID: <x67lmvo3mx66h22vza4tisxtbjlwhtiwkduwasucnrfr3exfdc@xuntucwpxnec>
References: <20250518130403.440971-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518130403.440971-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682a556a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=AK1EQsT5Zz8P7VizTGkA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: yCBJRdAYNcnJQElLEp0svM9IjZW4Ua5M
X-Proofpoint-GUID: yCBJRdAYNcnJQElLEp0svM9IjZW4Ua5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIxNSBTYWx0ZWRfX0dEnigkIxd6O
 wbrXlYVdfse9ittin3TpXZ+n0sa2ZiyUCRmuYF37BwI9+se8/3PqhyN0zvP1HEe+e2hIoIuExkQ
 TelVShP1TII851eM3piKa3A+sw50lWmLgLVtqxezf8rjbi4T/CW7DmhWc7qE/lE6mCoyCpAep4m
 oxRME9lJCvJk1B0K3gQuHUbY4LI0aU944K5kE1b/a5WhfZbh4NsXf9+eQr6HZg3zib72GFtPpbZ
 ocQoVkMLOo/Zl26kbmj7X5GKRVCJo1lo3X8VC0xUIzB4OQhLNDR7B7dAjBUmMZgGU/ICtUDM4hv
 d2hRwMobjwTxWb3vgyIJZAprT9YpighTr2d4LWSg3L/nbTKMdYuNQ6zTcHx3C88hb+4358ofHJ7
 FvKU5ouA0DwXuBSWbyZOLpaBpiyAJChBJFDKN65Fk6re98s2jATDJYvBDUjiBLl2X4hFvqLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=684 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180215

On Sun, May 18, 2025 at 09:04:03PM +0800, Pengyu Luo wrote:
> On SM8650, clkaN are missing in cmd-db for some specific devices. This
> caused a boot failure. Printing log during initramfs phase, I found
> 
> [    0.053281] clk-rpmh 17a00000.rsc:clock-controller: missing RPMh resource address for clka1
> 
> Adding the optional property to avoid probing failure which causes
> countless deferred probe. In the downstream tree,similar workarounds
> are introduced for SM7635, SM8550, SM8635, SM8650, SM8750.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> Changes in v2:
> - using capital letters, sm[0-9]+ => SM[0-9]+, rpmh => RPMh (Dmitry)
> - correct typo, alform => plaform (Dmitry)
> - remove tested-by tag from myself (Dmitry)
> - line break to keep 80 characters per line (Dmitry)
> - Link to v1: https://lore.kernel.org/all/20250404072003.515796-1-mitltlatltl@gmail.com
> ---
>  drivers/clk/qcom/clk-rpmh.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

