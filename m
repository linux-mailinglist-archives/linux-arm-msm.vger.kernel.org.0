Return-Path: <linux-arm-msm+bounces-63707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F0AF93B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 15:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4640616389A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7D82F94AC;
	Fri,  4 Jul 2025 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX/u+KF/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95E52F948B
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634566; cv=none; b=ajYkVgP6AlTMN5rRCR8MQxFqx8qhPZkcjZDyqzd5l2G+Hla8NzjmR963ciWCbLUWdJxceT9ivTHyx0ajiy4XmmdKcqWB74K1Jfurv8UZFA3+OlibEyYnNTqTMseDzoP8LXnQhqO7mPJfYb/zcPTm78nC49UnpqOMwXBwO82GrHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634566; c=relaxed/simple;
	bh=Ap0K2BXqAX2E4QeVi+8XmFTB2roywz6ya0wOENu7moQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2AXoLAO2VX8WoxDzDsobDvE9fkPc6B+ODX0/SYwWn6hP1QjOqNEKWBhynA928oAyQf0wlKAIAM/7yV2Pt0pPvh/OXB3tV7oR/p8Y4/2jYqAt+GGjowePbIQH6csJ4ZwnUXeju56zEj05Ae4hAgm6IUHUPViGV2wwwtho8XnLZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX/u+KF/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B6HMj020081
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 13:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZmMxWadnM8fMpQdZsfFV0mCz
	lb8kLIYp9mRGtmk3Ik4=; b=RX/u+KF/TCRwufrmdPoRk2Xy8C8C+pUNh2gHs5nq
	5GOWTBiMVi+QM02wyes4ybGfRJep5m97o8cn2OjMdLMvQQcQwJriwVp+KCoMNn+p
	ThtZ2G5xXSxSdCJW0xUSy9ywsUbZT88fytNMn7Yc6zx7jy/FHw72szp5rMAHuXp8
	EXjroAHQmYog3pWrYwoRe3NYm1xDA4G7Dcv4d+tmK8lVL8UUQ2ERh9XFBmPdKYnw
	18Xb6CV5j4sy1okz/aGPEPA2mPXMc3qmPuJwU/MTu3SMez/HzExl2YUxNrCTnSqJ
	4PMJhEB4vcHUO4mTVprXbN3/JY7GtHdyyglXReBxtGIdnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8bsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 13:09:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so261532985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 06:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751634563; x=1752239363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmMxWadnM8fMpQdZsfFV0mCzlb8kLIYp9mRGtmk3Ik4=;
        b=setme0vpuQ6vuY5suRuUo0Gva6WmjMnnJ3W8fqGZiIjJfDH8Mqj0ho8Ny6VsrZfJKn
         MZN5nA/YD5AX2PX+ZP6cXSSlIJ/SzTk7mQQMV0YT/et4CH8nNY4azKkqBArR42sDzH81
         y8LT9A+eGeUXGd+Yn4M4XoukBkrWMowZYr8l+S5XzNrqQKL/iot2zVOz/4PAfJXWvuaa
         wK5/D3nfK4T7MVroJZvuknx0pyrt53lHnd+ad+hQqyqZzrsAyxL1l9QCHggAwKHkbVjr
         aVGuLalyDnav64RhhiyrRMNsWvbOrHwI8dsypnY+lqVn8CRLOYE3X2fhkyatZ5Yv+g1K
         r3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXKHGLioFXKTmRq5Dv9xmJGvqBz3oyUUkwwsOu+6IjumB8vBxT1xLK4aHLizLHqhffh3vLcpL4P6/nUw3xD@vger.kernel.org
X-Gm-Message-State: AOJu0YyHn3cCoVRCz4iqf14ojELrvOLqHmDHelhOyAFtF+wZ3uvIVECM
	rcBGl880CN3lMiujufVTB+EsgoyzyZsfsqLQG62NaHI/Q7nMe/o/XT19QGKnHYfwSQMbsrqrz1h
	jSl4FwwQHNQtCr9rhlcBmmCVm5Y2EtJuEtqNTyQFKQ9ksrIVI8yuH8vaFPVb5Hbvumj2I
X-Gm-Gg: ASbGncu36nkWY32gscML+LOi2+5X27PIqiFOZSlNUfSyAVJHquhG3c35+AZF41vSxvi
	VItvU6SizZ2BnXUE2UroqPxWdvZYgzgVVeStXTw87B3QTE9TpX6fLg0qBUWRSPiANFbuYisogAP
	FaTA1pGfhc8f8LP8ugFD/gY+Qp6GL3mkvr0l1R+McbphfaX7ZQ53h0nuNqasW/rFaZJOJ2KOk70
	KztUAGSKFlaFM2XJfmN7jsA7ogGwVffZmQMpB/iJs/8yg/yeLoTlJZK7nEPW77GGyraWsvN18Rv
	JtHxtoPBLqHuFmrV4p6FyKYQc5Qc+ECmIMU7YAulusLQ4pYSwP9cA2qGJR2Hlf6TS+dfcYsxqwd
	2I4JXVR0qANZhjy6cx8+XLH0W2eOCainZDu0=
X-Received: by 2002:a05:620a:198d:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7d5ddbff5femr320340885a.57.1751634562429;
        Fri, 04 Jul 2025 06:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAsxytp5ACC6JF9kJgurJ5J32AJAM2hwvgKYEX9EyXWLBjVdSY3uG2x86fHzg1zmi3ysFXBA==
X-Received: by 2002:a05:620a:198d:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7d5ddbff5femr320336785a.57.1751634561978;
        Fri, 04 Jul 2025 06:09:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c4785sm247560e87.231.2025.07.04.06.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:09:21 -0700 (PDT)
Date: Fri, 4 Jul 2025 16:09:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1] misc: fastrpc: Add support for userspace allocated
 buffers
Message-ID: <6b77fwl7rdaxfbbeoizekoa72a35oob3shdfxm5xnoip43a6lh@zk5agyfbsnrq>
References: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwMCBTYWx0ZWRfX831AnBamKm38
 fpTrralh1zL+z7D90L+2tQg81IUWWe4snbRm3CeYtoxVFk/fBFRPS1dYHAOGfLAbCDCgAaFCAgH
 P9YMeGtldyIXBlc9zFCNhSbuYZZyI3J7rWPCv1DSUtymjpze7pyWKeFpbJZWQ+OthiFD+cgPj76
 wPZ5Cab9KaeJoGaGejwwHD9+459XTNc9xpDlR+jaJrd0NocGyBuwOGKtsZvVEEJKdTjeP31PhBh
 wnj/QKVgI7u6lpeNVJ+JJ/yuwIXoS+OhPSF4AdVAydAuwZT0tRv0v0C7ndpjP4LcijRsrQXxYml
 33an6pelMAwUnfvKLUnQNO3jQpEa2HLETzI5fQBgyCT4Olr3zyzbcdjp0GDlyjUBfpGE3wnnOby
 C223bAUhFGif7UPnRUkm56L2STsSELG/Jjhyb84JaBfO3GCbj0r3I1E88GPTIpBT5w0LrT3M
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=6867d283 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Wx4UnwnagEXOOs62NcYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2jJTBLc1_21RqlhXQRQD19qht9SQSyaC
X-Proofpoint-GUID: 2jJTBLc1_21RqlhXQRQD19qht9SQSyaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040100

On Fri, Jul 04, 2025 at 02:07:26PM +0530, Ekansh Gupta wrote:
> Support mapping userspace allocated buffers. If userspace allocates a
> buffer using rpcmem or DMABUF and sends it via a map request, fastrpc
> will map it to SMMU and DSP. Add support for both map and unmap
> requests.

Please start by describing a problem first, then the actions to solve
it.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 150 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..3c88c8e9ba51 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1797,17 +1797,16 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  	return 0;
>  }
>  
> -static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
> +static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, uintptr_t raddr, u64 size)

Please split the patch into two functional parts: one for refactoring
and one for the actual bugfix. It is pretty hard to follow the logic.

>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
>  	struct fastrpc_munmap_req_msg req_msg;
> -	struct device *dev = fl->sctx->dev;
>  	int err;
>  	u32 sc;
>  
>  	req_msg.client_id = fl->client_id;
> -	req_msg.size = buf->size;
> -	req_msg.vaddr = buf->raddr;
> +	req_msg.size = size;
> +	req_msg.vaddr = raddr;
>  
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);

-- 
With best wishes
Dmitry

