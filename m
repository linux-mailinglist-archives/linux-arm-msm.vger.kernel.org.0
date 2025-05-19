Return-Path: <linux-arm-msm+bounces-58416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AEABBAE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3691816D1AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E21326A1B4;
	Mon, 19 May 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRStUiC/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE71194098
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649874; cv=none; b=RZ7hPyqGJ44iqazg0ZHXb8Q2JGzoBuJpm7ZzbTWiuYayTSq2Gq0A0bzZnq+cQQCtCmmDzrwZEnTmDoDONvH8vFn2fQsmPFSQAOP+zmcnF3LkZh80akqrDNvuk9ZIYDeCvmzC2lYrxG/DSFtG61vhmAcDbVYeWWUOLkOixwc37G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649874; c=relaxed/simple;
	bh=RTpSRZGL0X3STcswqKQnb64LYoUqyF4tFZwss7W8k4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JktvrkpwhL5xuDVWgO0h2W6QbM7v14gS7Wgvy58q5aEiNVttM2PH8Qu4piZ+xwCq7nPhgBIJz7+4N5moAj5oSOKEXYTrvE/BiTWb1OYpQ/UOGZp+sPDwbSyU5pz8+NilNlkPCXOmGNmTfo+2zZX3T1i06K5iaY2xs2z2DpG90H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRStUiC/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9rZ3F003157
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/PcwuAaLrQXGvgujDx9FZz79
	4RRPKdZjInGYaT91vdA=; b=YRStUiC/+PEBnK+aUKPSInChgZ1rH5jhvs6s9CZ1
	2JvdHbyqJZssz3G9ptixLY8vOHhCYNX+gFQ7E1+sDtRBIkV7smNQaz+os/G5bzVH
	OhyttG4+xuEqzLLL0l6zDaJRKcKIWww7jU2uVybCDat6YwN0pZHhW6FBEDs73wTB
	wzSNa/7e1q7W8PLFqcputgovJWostoIT2YJPpW9lc1DORqxyHUO2O7G8N3sz0QeV
	sV57EtDk/Ffa4Z99C6/Ek6t/GF4NPLD53dbBqcUjyma/e0oTbeEnWrlBYOHe8xut
	cyKYt3UPYTXXuMN7nnQb0EtMkWpwGoL42jjsN61iFMUCRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4kxj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:17:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e114ef64so2818866d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649870; x=1748254670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PcwuAaLrQXGvgujDx9FZz794RRPKdZjInGYaT91vdA=;
        b=FGy8OLrfhTTLwsKUAGb6I6H5SaoHAlyc9fqrwY6DLAzlX2LAtx+ODkeKatMQLk1Ero
         gYe3prHsNks6zYuTFYpgkTgQ7JcXdkUgB/+AqAFO56VwKVZjaprKZlgHcdCu02OsYaUc
         /U1sqS9hVhfhAdOTM+XBa9W3vNUHbwAzZVUruSnzuEq6GBnHJ4Ry/yLNFBA2iLQmNr4z
         NOF5Y+2jvx7/+CNL89sXi43dX5fVJyItKjZLkZJEdtHD7qHWDDlW6Vkvw7rJJOCTXYXG
         wu42bc/ENH/TMIiXwOgJsQo8FJkXCVj5wFdbzK0Tmi+QtQa9sFCKAYvJQO/Xe6UvzWcd
         413Q==
X-Forwarded-Encrypted: i=1; AJvYcCUo1BS7eIJZ1lB4IPVqSNmmohzhge4jdgVjjL7YvRKSVyt06TQ96Zkb96gXlZaVownqjqwkOtChnGtjEM4t@vger.kernel.org
X-Gm-Message-State: AOJu0YwquuqfmY562UoJ4ppuCGSDJmPB6HQXYprrZNfQsFSJZeoD30Hq
	HN03TZpmOO7d1PJfvRXtUjEq3AwtvfnqSNbZFM3QTOABzWJQszNQDJaAnCqXG8a2eBx97p2vLDO
	Xg0yFw5tkboqhVj9l9q5ke9BzWo07n/Bz6SCdUNGdjRexrCL+bbD8uIW+HwbvZoiVf4h8
X-Gm-Gg: ASbGncveicGRCtnNCjcnZvbYdvelX/U+gJC4Fpqq141cHGePvzFqO1WHWqMT6lD45fA
	OlrT6Ga9nd8GAj2FIz840eKuu7JkcWoMT7LuGyi7/QdM63MPsALwT+5PSK6R+YKersHKMTgr5sO
	4str6nM7mmzqRuoXweDipQNWPNfCYd78cLoGQoo5l660YbTpHBzKeEHo1fxsXPypOvfHmHcRx+/
	ujTy8+IRa05dfCSg3kmw6e8KNp3hn6yM/pkx7S8nE3XlwI3AXCHF5kGsgDJG/2uiroAFp7UPte9
	6SSJI7Gls4MTo7r1/Os/sBMvFHSR3VH+fEVZZ9p4SXli/iJsaSC08DcychnvJaaH8D7g+WWUMrM
	=
X-Received: by 2002:ad4:4ee9:0:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6f8b2cc876cmr171598516d6.6.1747649870087;
        Mon, 19 May 2025 03:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR4mBGKiUglDXqp/Q3z5m/L1YYyGqwaRe9+bf0h0QCUbDpcyPM2GI45j2fQ+VZaF4AFNwjFg==
X-Received: by 2002:ad4:4ee9:0:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6f8b2cc876cmr171598206d6.6.1747649869690;
        Mon, 19 May 2025 03:17:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70181b4sm1794804e87.116.2025.05.19.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:48 -0700 (PDT)
Date: Mon, 19 May 2025 13:17:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MPszKXV_OzQvLuSSwIspxl3to8r9EOdM
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b054f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ii1ax498U2AZhM0x0wcA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: MPszKXV_OzQvLuSSwIspxl3to8r9EOdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfXyUdrOSaiS713
 bQXgDkSVNJfX4nDXd7YWVTsl5UHDB1heb7MUbBmIxn1w0KE4O1tjQkBt4TjD1ysOafWwD7VPa67
 vAPRWjHGigtOpB74WnnDxPFb6fRpOOLTwPGURN/CeJgPVXn7Lp6mHxz8OdRLVagWdoMkBK60MbO
 DK/fCqyieeywe9J1lKsoL3pnMHxjsn3G6cD+a35HORabuCmzMLZO306DLzhFhg7oCvgBFcQDPpz
 x+YopBwsR/8YYQnYp3QnpGP6rGfjI5jMv85sQHoVhQ2mPC/exroZaKyhTY+GcRsAg5aUC3/vXlt
 B/29U21UX82fSoLlGrmrJW4y3MULWyAcPKqlzJUdtnH1BPu63urDOVJHb5IArkdzw+UTXrd1RZS
 fm5rtLUNEM4o9LhDt1oJ0awOSvw8ZeQHFgBgk5Q270Whf/RhMT/9neQ7HYnXkRK3KHGv11C5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190097

On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
> The initially allocated memory is not properly included in the pool,
> leading to potential issues with memory management. Set the number

What is 'properly'? Which issues?

> of pages to one to ensure that the initially allocated memory is
> correctly added to the Audio PD memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4e38b5e5e6c..b629e24f00bc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> +	inbuf.client_id = fl->client_id;
> +	inbuf.namelen = init.namelen;
> +	inbuf.pageslen = 0;
>  	if (!fl->cctx->audio_init_mem) {
>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>  						&buf);
> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
>  			fl->cctx->audio_init_mem = true;
> +			inbuf.pageslen = 1;
>  		}
>  	}
>  
> -	inbuf.client_id = fl->client_id;
> -	inbuf.namelen = init.namelen;
> -	inbuf.pageslen = 0;
>  	fl->pd = USER_PD;
>  
>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

