Return-Path: <linux-arm-msm+bounces-108082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ClnBUhLCmogzQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 01:12:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69130564537
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 01:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BF8D3003E90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 23:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF532BE7CD;
	Sun, 17 May 2026 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UX6B8bSt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C39uYpBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCC3D4116
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059338; cv=none; b=i312g60lI26SX2MWJkxFVfxDyASby3gD12DOnDCQ6hLFyEgRsg67NsOckPtIJiEPEr5ebe8Ae/I5V9o+zvN2LH+OoitRLz8VetKwHhGuHo/Q4UFA2beMa2riasl8drvyeNiqoJG4QqYWMWT+071PqtrvYlJzpJCEFKNeX6xSy5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059338; c=relaxed/simple;
	bh=ArlcaaetigGRP+wScjsvldrqRDsVMdGVsFCijXr5sho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcIpDillFyE6aHS35/rwmoChy6aiJpZRjg7MT5J7cIKwiNTUqzv4jQK3N8EHQyMSgCwgYOADVvhn/p6BnLdx58/q3v0PCB21hB1UN2uUwSr4PdjQfXBq5kb+6DeSGw13JVGOTc9UdxQnF+lS0Lklr2jBHIS/rgbxHYyXEeU+dFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UX6B8bSt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C39uYpBA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H38PTC2303883
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 23:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2+QMreGSKWDtvbWKY0kKo3Q8
	eK91rzJiOdDRbt2/z2U=; b=UX6B8bStAfL+AxDCZQ9SGk3YOJra027naAtlG3Ud
	EyR7zaqw1/o7s1dvGMtw0dxMAq3hw/NBWRGtkG4IvaFMEpsYNRaGY/TjxkJHs8Sg
	5alUELVpfYk0OqUxCxTE4h+axvltTPUUzKqze97xTyyW/m4sGk424R4plAwJcrK3
	MMhAMUEY/a6j4tge/YYR3iXawtO32LrX5hwj5useLSm+UnznV8etwVIxukPJq+kD
	6qbayiSjGnY3ZxV7O3TkigwTnxV/rYg2sR64ZQi6zx2dzxuSgPVKy+PyzWeUH9k5
	sxIu81g3MOoiOQgguJA766dKL96UbmV97tu5ry7Rw11ezA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqurbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 23:08:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso17816871cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 16:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779059335; x=1779664135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2+QMreGSKWDtvbWKY0kKo3Q8eK91rzJiOdDRbt2/z2U=;
        b=C39uYpBAfRBBPzBi63DMZc3usTWWlAYmS3OtLyriIhxJQ3Jku77YdSQqWWmr7ztzoS
         RL2nLW+mb4bgYOPtqWqVhMa0oT7nm/E0fuEtl6ity5sVjuiIwCu9emBtBrmCODvNmY8Q
         pD5c7H06vSn3jFZnZlZ3181hsG3ciI1UVFB5VmsYYaFwP38yf4S5LrrduQs+Wp5T5s7S
         NxwNxI9irlYRfHqh8YzJjlEh8Q31OEgDL3QJrkZyrukoofxSExs3+OpAMWqHG87FVU3t
         xc7uhRKrs51H9BPFJ24xi+OBS6OA5Gb/Bdddh+9GvB0EmfJ13PSWsd3VC5vw0mAA/6xz
         SVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779059335; x=1779664135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+QMreGSKWDtvbWKY0kKo3Q8eK91rzJiOdDRbt2/z2U=;
        b=iu47qmflUdBw8Wc3Ddjnammd1qYbbJImb7BDayI0MT1jLCjkwLDiFHwVfIBn+DxhRT
         oS4VLCRpxWWokM0J5JpNsNqUscVfEmBfASyctBIXGph/xHIARsSeDyqpXKC+7AGw8kpN
         sQuIWnEARSVVSGl8zHF5w/PmezTJxRFOp9pVAziSYFIZIUb7Vb67KiOFL8XuBut9Frk6
         pJyXAvAgIfjTBTks1tigYk1/Xwrovj6MkstmFJHLN9WqSVAc70IzaLjGvIduZTzj/4Qr
         1W1aMdHaIZH2SLEYoLuxh1ALj/GX9fsdDbX4GxpDhoE8RmGNYQ+hKQN6gEUnXMIPV/OH
         KraQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CALpQPkS5Sl5bcRrOIM+FuMEv+UNI0Pq6VBcAQY1JeLZgRGNsmOZD8YN4x67gLmSjx/c1/yj7YPQHDmA9@vger.kernel.org
X-Gm-Message-State: AOJu0YykDQpyIXE/38JjZpqHiMzShzFVPpjhj9VXNcUzTJeS7BjKEsn4
	0UlRUl6c523ocqzeCAQdrkcNh+1zWb+JnnJGLj0SBPSgSpw+fc+ScafVLi6Sg7JOOBllPzlvZWP
	8YHaFnVOc2+QljNA5pgSycVbynUiMob5dQh5bjRS4zFQM5557Y3ybM09dbBh/KV4sXlwPXOK3m4
	dC
X-Gm-Gg: Acq92OFOoKGI1IidM4rEKlpEDvFE7JPNLSApSAX1fZlDZoWJOsr5CFIxuFHXJ2QcS7r
	a+m3vUWVUF1FAj7tKoQJLh17yILLKUyUDq9t1yrkkILWjzP97N7EebX883UYU0920cvppdSacBU
	j3hysG4RpYuqlZyNeTibjZbvKe+p7G2/hPt09wss+PiDD/8RMzY/Oan3a/39w5fcGRgmpLhAH+g
	iF+q+msT3yAC3UseJBiQ1cJfAwsszoltD+3c9zgJ1ggL+w38hmZEcAHnGTrJXstxoeXbKIc6MxM
	MLjXXYTDnhGVbbWPy/K09MUl9ehsdjmvxq7Rcv9QBU7xCeyHmMMUfBPkmCx6S220DE6O68T+lnl
	FmN6ltjoFigd+oe+kIAiDLcB8FYvBVeLd523SOpzdfWQtAPdZ65ZNcJWj01ntAlwbzGd6TDY0it
	xIw6P3DTKQCVSkctaBn7nRSH3FcBbdgRO0NBo=
X-Received: by 2002:a05:622a:8584:b0:50d:83d7:686c with SMTP id d75a77b69052e-5165a1dbf16mr142646681cf.31.1779059335458;
        Sun, 17 May 2026 16:08:55 -0700 (PDT)
X-Received: by 2002:a05:622a:8584:b0:50d:83d7:686c with SMTP id d75a77b69052e-5165a1dbf16mr142646311cf.31.1779059334966;
        Sun, 17 May 2026 16:08:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c8b2sm2933313e87.17.2026.05.17.16.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:08:52 -0700 (PDT)
Date: Mon, 18 May 2026 02:08:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH] fastrpc: Reduce log level for DSP info and reserved
 memory messages
Message-ID: <cg526ebtmnboqpw5aabwrtmoc7fhnvc57dmjax5zltcjonnazv@pynuwgpx3bi5>
References: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: Wcq4B_UFrSTH2Vw6T_Fps75RpOZUJd4i
X-Proofpoint-ORIG-GUID: Wcq4B_UFrSTH2Vw6T_Fps75RpOZUJd4i
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0a4a88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=R5-0t05Agtt0UhhjQosA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDI1MSBTYWx0ZWRfXyvAl/8fc4KK7
 w057cXn5gjVvppLvNSqmAmbz1dg+CqHo2fENzkVfMcVpjw7SlKImnykk5lqizKagmcIql4AKyZj
 gy4ht5ljlnp7iqzbHndpwjkLdZrQEzhP9Rqus2C7yRY0igYSIpBs6vZVFWB3sApAXnPfnBA9cwp
 N6B9iMdNmwOl/A8K0ZYmdyQtO41hSAFfOvxDaZnDwndP3DpCQjXT2Il47fvAjxBBms/NzT8gboh
 mU1kKmOHy7rOH/gAjFLGvBIFc+dFA0YtnmOu771Abnp7QziayN7BklsniLJd8Iw3FZEQNYrSNtU
 ytcc8hTHfABpnmZh8zdjr33nHI2YddEVHpn9mJW4DXEjLuq99k0NEhJ+W11Wk+y23QdvUSCfEM0
 brHgjCMLUpVM3fT3IMHaCzr2oB9y2GzTyuVpo7exjgc6tOnBcZGVUMGPXlp7wX/x0HzYTawedaT
 M71IQ/d6NLjZgGjZMdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_06,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170251
X-Rspamd-Queue-Id: 69130564537
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108082-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 02:28:25PM +0800, Jianping Li wrote:
> On some platforms (e.g. QCS615 Talos), fastrpc may temporarily fail
> to retrieve DSP attributes during boot, resulting in repeated

temporarily? What does it mean? Should there be any sync with the DSP,
letting the FastRPC driver know when it's safe to retrieve the
information?

> "Error: dsp information is incorrect" messages printed on the
> console.
> 
> These messages are observed continuously during boot when metadata
> flashing is enabled as part of RC releases, causing unnecessary
> log noise.
> 
> Similarly, the absence of reserved DMA memory is a valid
> configuration and does not represent an error condition.
> 
> Since these scenarios are expected and do not indicate a failure,
> downgrade the log level from dev_err/dev_info to dev_dbg to avoid
> flooding the console.
> 
> No functional change intended.
> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
-- 
With best wishes
Dmitry

