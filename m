Return-Path: <linux-arm-msm+bounces-58468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B488DABC044
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4C15189E941
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 14:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0890D189906;
	Mon, 19 May 2025 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHTARNcA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C827AC37
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663533; cv=none; b=LnGmV5XRxz5IhaP7Ln1XyzixK0kYnBruBchjcNffZPM3FFSMNxU9XKpAdifkoWM4MmKca5o1UHGonZh8SwHAAbK4ymxKScS9Wf5CUOKJZppNgThbhqs/ahiMn91zQ3+/qaGG0LaT8o7gvfPZfTZ5j367uwQnyl6ItP4//wuzY2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663533; c=relaxed/simple;
	bh=mTV4BK2qfjbUtqotPH31b3r0RSBtimJqNdwrEbp6QFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfNiY35PFGDE8jJWExB1OvOcXBOvlj6NJYapFQqacUTjYeig+B9rp8r5oaAnlX97GgHXPbCCw2/HAxT4kFFBLv74JR9mjuEdbEbhGdouL4rpdBugzpLgrmuVQ93Mmq7gNSSTp2FD/x601tXy9knR1VNk9pU2WSvyjDS0Xxnv8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHTARNcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GgFJ023276
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kkHo6XHPeTMOyNCSzAjow0H/
	jYOdseS2973aNB14vqU=; b=nHTARNcABLaLMLh43n8IaZmeqPwUGviG+5i9q/Dd
	rOfwz8GDvdCqJk/4GYTrCIZok92nLO2Vr6lqFDD0+4J5PrZP17L2kv8cuW4BtfnM
	PHdHxMF/3ERUdKTY8jVTcSj6DT3/mePmz/uazvnHC/AIchzHRxoIr4kmnhEJmKSy
	jDn+4eUwDXT18HSN1aco0wm2uuhxcvLtdQNFv3Wpqahd1NyNS2d6dKxYvV1SZP7K
	lx9+sSiuNpZFtbbfiAK0AcoWB9UCReXc9aWayJss7SMR1bW16YCKxF9rX7AhlToJ
	1HlUV8ukG0VBREgsyKEuEGzzCjzu+llaH8hvDHpb0zkz/g==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041s56p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:05:31 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b53875729so818406439f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 07:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663530; x=1748268330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkHo6XHPeTMOyNCSzAjow0H/jYOdseS2973aNB14vqU=;
        b=WflreIOouBQxSD6zYYHIb4vKeaIdLMS3bMSJx7JYBSVFWKZKkl9XNtf7aK0UmaVwY/
         Jerq7wPRBe7qV7D1nyzBZPiXwfFxlW6xBtiypWje6AjyJivie3erz1Ly/hG7NdHGEmUL
         pXVVgYGGGxrneoLdMSHzr5j1zR2TbbsfLt3NJQdy6RgfneziJhvW7GEaKP3YJQjhlnHs
         QJGaVVlPsI+3dXxM4R4117F8Of/pTDFD9qctkALqgGTSNUkY8yA3J9A4T60ZxZaSlNIY
         vrnmWNHNwdX5nNEVSm92l8bWZ5f4WT4A3L1ct5VHb/aNToHSiqmi4//D8uDGBvS0hx8G
         9ITg==
X-Forwarded-Encrypted: i=1; AJvYcCWy+Dc5VFhjDJiOHEP2tcKaBiHiki1vzDcUkcrx/Ki17QV8VAeZZhXKS/k26q6J4URIpnmD9TK2F56SGcXG@vger.kernel.org
X-Gm-Message-State: AOJu0YwfBS5YBihMUyADtv1Eu6jXSACNcvP+HZmLL4NNuMNglyj8sbW3
	XxH+u57dQm4On135bdG/2NhZxMtXOUJgke30FGNNB+ldiLFh43YykLWnZEUP9T502xUeLXJqrGF
	mA7aQBMahDfYjH3o3M9d7D8Ba0MLmoNROKr+00rq+wFW/nPolMJyul8u6rFY80f9Vxt9S
X-Gm-Gg: ASbGncu6E3vW2i0A59J6cy9KmcFmHcn5tKjuNQiHSjl8jlz7DHcA/oWld84ghfJ3SZd
	6g7Kwcvp1SU+G/dtEJ03YqSk+jzisj7IBcgjTPWZfqG3kNY/lyimSJWyUCzpskFbyRX6ZuVsNPJ
	18U5IWFtBBnxyw1QgOoUw0WPCWeloS8eHiYNuHPI5sleoo2aTG9OM3HoZ7TI6XNwRzbfTJPK0XY
	eJz9Bo/yN+xQDVeon+Z02zaes1Ldqe6VdjjfC4ne3YXG0na0bxrlngEsj94z7A6g6c9MFqmLDqE
	DiKVXovq103XFJ5tlQr80w8CiZnW8dD7bTeSxCDsbS7ZIRBYJlGKA4JeUkIKuXpm6qxquPhjq4E
	=
X-Received: by 2002:a05:6e02:4414:20b0:3dc:6a27:7c14 with SMTP id e9e14a558f8ab-3dc6a277c71mr34500135ab.7.1747663530576;
        Mon, 19 May 2025 07:05:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElHCzRUlcSmkePX3oMcw+Ft8vd7nE8mHJmMO5fmpzntvorhLTQD2zarO0h4A0QZ8OWYTbnZQ==
X-Received: by 2002:a05:6e02:4414:20b0:3dc:6a27:7c14 with SMTP id e9e14a558f8ab-3dc6a277c71mr34499715ab.7.1747663530131;
        Mon, 19 May 2025 07:05:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b4becsm19262941fa.12.2025.05.19.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:05:29 -0700 (PDT)
Date: Mon, 19 May 2025 17:05:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build
 details
Message-ID: <6dri4ig5iox7wctvc7umltcsstrtghrtjvdwajdlgz4sb5g6nn@zyrys4re4576>
References: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzMSBTYWx0ZWRfX/5E7kYUCl1pt
 xPq2xf2pGZTjujFjTNSQPcrpL/QZCSg9GV73/WTcZLLLl3HNp9v8ZXaOat00IzoKHuDT6F0Y865
 oZh7mNKw7dbW9KJBlmJRi2fvPD96MaY0Se86Ygv2arlTolelwHmMkBfup0o9xzLw7oE3fgwIIDz
 OjhuHQone5ZT45WBVoNavUTVOB2uTcaP3FD5+DS3PRG5Y70jT4Fe7eE8naxONvKNTR239HTZrPv
 AQoXVl+VBwQRVN5M/8RUT1g/GN+00udjkHhgRc7PHnmAXdzjEF4LjovgQtqU3LgEu8CW4Sx+oPx
 9cmICwMxxkGN7mAr4HGwr+mZkw1xR0xVBi5e5oDp+PgWQNpe/ND8Eu+OCWJcD3mlZWTUW12/wgQ
 HiGq81SknL33Bg0hkbt+MSYAG3J0BBpggESJzCmzakRAG1oisuvAMM/PjUK3A/aDPIDSuXsB
X-Proofpoint-ORIG-GUID: I7fFG6qt5UVANGNXcJ5_nW5XvWddY2lg
X-Proofpoint-GUID: I7fFG6qt5UVANGNXcJ5_nW5XvWddY2lg
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b3aab cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hASR2W6MItGKdFUF1uMA:9 a=CjuIK1q_8ugA:10
 a=TsFzuV67ciA61D7d30EA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=657 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190131

On Mon, May 19, 2025 at 07:14:01PM +0530, Kathiravan Thirumoorthy wrote:
> Add support to retrieve Trust Management Engine (TME) image details
> from SMEM, which is present in the IPQ5424 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Note: On IPQ SoCs, the Trust Management Engine is referred to as TME-L
> (Lite). Other SoCs from different business units may use variants like
> TME-M. For consistency, the image name is retained as "TME".
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

