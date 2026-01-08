Return-Path: <linux-arm-msm+bounces-88096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5C4D03CE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A79C230477D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165943A89B3;
	Thu,  8 Jan 2026 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlyMPnHT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8ucJe28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A885426D30
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880062; cv=none; b=bTfqJUL89zLwPA4d6Lt6vBK+S1r/XpruLak385rK6inbBfYvzh9fi4tXMe38txpIZ2JXH2h9uNCDI9jLskoYMa3BoPNo1xMhcxROXOKupam2iCqRkWgTllWfPutmuLpbjERKNYR8vD1lmGIVujKhxVHsM/nMYuyQzPCSWWp0eos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880062; c=relaxed/simple;
	bh=gbZK/gE0HKhwU+1kopdT+9msHoNGOV2czTcKzyj6rVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=If7ZKDMZNCxIvR+hTGr7GZabtsZlgcjfVZDrCdHN2/4uGVz8MVoB6z0gkvO9mNpnJ1JSHGVLn38/XdgxeS3U6c5+3ayH5JHNTMXUUgIWb9qhax9RIXRY6QyIMdDHo5YjBXsy7sDLTxOn6fNHfNExrolghFNmjDWXoCtPccz80WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlyMPnHT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8ucJe28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VTLb1838244
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 13:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n3f+etYRxsMiODiXI93sCH+C
	dwRw/Gwp4Q/CPiOkIGg=; b=nlyMPnHTfHlLNFqKdBvXDwOa3iy7HGZG9PbHWofm
	pplFiw5H/3M4z4kmSDsA2q2ki85US1/NJ79S5BKoXHUhbfqrVORwZhPrfYnXJ0EH
	wZ4jNRW27nUTSGHozrhgepEpQuDoSqIt6cLi5L98pAWTZvZ/UNJdLJs9EXj2McQc
	KgGr4kCLtaybYTFM/jDFK5iW1xav92umSpnk8MVI8ddRU5IuWZFEstXXSPJbZwy5
	d+5y6x9B7ox/IWTwd9dXrDwlvbvxsV+Eph+EA27HyX49Aue9vROnNjSgxd0LzgbN
	/7lYQaR7fYt+D1bh82+ZX/sB2Co9My2trnfhwBRIbzmqng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj89214gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:47:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so536410885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767880033; x=1768484833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3f+etYRxsMiODiXI93sCH+CdwRw/Gwp4Q/CPiOkIGg=;
        b=b8ucJe28YQkxv727IiwNAVsEjudfk5w0pRJBNWyqGZZILOxnPcuf6br5ok9dvfPARG
         BjfQrk9rZ/xQPTVCs7c2it2H9f1knVSUyMjSuNpLPil4iaA8PewH6lq0H5yQTbG8qC9R
         XKSSw5SkFg3Onk0SgDFQL5BFKbpfiy891YzBJkduwdMxw5zQxGn2JIqP1uS/BsvAMoot
         U1564tnWsDL6izgwEkBWkNC/3L2NFvDDnlSp06tM/sjFc/Md+wg4pY0YoDlsXB83Nlfj
         N7EIw0Y0m8M/BJAvz9H/e0N8jXBeeUIBbkmeX7EG4BJ0Qq0HA9uUlZELWJD8ujxKbOrk
         uj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880033; x=1768484833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3f+etYRxsMiODiXI93sCH+CdwRw/Gwp4Q/CPiOkIGg=;
        b=uWs0eHglBH1MTto4HwVcbGgPojq1zk7L7RX3Acx7IPtehwnklYPltVv1wZ4tWEe3hm
         4O4pi5zlmlu5KWXHiEbq2Ex3epXI0IDjCCxP0LleK01csRTzc+wJ6Ig6im29iq1kojve
         Wn+QMIIPFRcFwMiCrhj/2X+Qb7nvZHAL/Wmif47hCDcdCNIU2Dc/s7wwljXxRX0hmgUj
         8qjrqLHWa4H5gL8F/qwUafdtNLc2sxQKN6UQ9mhgMRBNT639R46P9h8v7DGvAkHOG5yZ
         MoqyGaFsxfg2/bp1xJMuU/b1ZQFaVYD2AqQTW56aSM2l6w9JzrGanaakbXLy6IVyPZlr
         M9/g==
X-Forwarded-Encrypted: i=1; AJvYcCVlMB/N2bgBaIatVHAeqDAP/GsmlwJh9OClZ1aUNDkHFTwmQLqwfOlUgtl6/ezLJCIqEG9dzjQ7ZWx9X39U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6VtMcGN3y1Jc/QIrV9RMo/PewnfWN3A3hfmrczoYHWtiaMiTG
	Bpn1OZkbuiobPs3XT+Z5l5Vdtz63d4WA/SfzY1ED8nrMtMPJ0yti4CpeI1vobh7WSbwVkWd75AI
	T+ytrizoRsmvM9fgavZajNDAw99e0/OVm+MobfY6U7tQDtCsNHVyau/fMS0b7xQb4nWDz
X-Gm-Gg: AY/fxX64wLmpXWEFtWxAoaNpZSe+hzak33LFErHDKPjrJtZtCmb1KI2IVFYK6Ljq454
	JO3a34WCTtncQGkzXFg+gRfAwyFTXVG6aWbfG7LAygKigf6LJ5ZsMj/GEy5UGW5y23yYn9vKA7a
	PEbqAS7Q9FB0iUfy4/WRBOGuQm8uGyJeuCocKUISxPp7ioKucGlGasIHHOGUnzhJvriiIA9p3tT
	VtQ7ueiDLpUjXSUqx/DCxP3ioXJ4IUs6P9BuXBpKabI7Q23o7oOr0cXmBqVbBx/a8/DTeijoYns
	8GI4E2UB0WObokKyfOvCwzgcxO4b7FGjHHv4VjYlCOZw8m+UWra8Ofaj+kAf1kYh4kx7I675bvj
	j0+q14WknDD3U7FT1w7J8vq8sPGgqAHFl05rwsgejlSxCmmfprwcJjLxyQZ9SBUZegwZ7UjEH4N
	XXjPqukyvwEyFWKAec8eh0Cdg=
X-Received: by 2002:a05:620a:440d:b0:8ba:41b2:da01 with SMTP id af79cd13be357-8c389411960mr706757585a.71.1767880033379;
        Thu, 08 Jan 2026 05:47:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbpFtpZNVM7lcaBYVfhMcezqpILdVwNfiJmxtPnOztyHBEeJGRheIjrGEnarHqtGVANi7z8g==
X-Received: by 2002:a05:620a:440d:b0:8ba:41b2:da01 with SMTP id af79cd13be357-8c389411960mr706752985a.71.1767880032880;
        Thu, 08 Jan 2026 05:47:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb90a4besm14701141fa.41.2026.01.08.05.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:47:12 -0800 (PST)
Date: Thu, 8 Jan 2026 15:47:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 11/12] drm/msm/dpu: Add Kaanapali WB support
Message-ID: <mr67bnn2t73kdnh7fr4imue2jnmoofwlfn3btoj3etba3lybjv@jv4wajl62vlf>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695fb562 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2ZwTbIZCPXwejyfJx6EA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pHcghyDbVeDM8c04RSScS00fJldea7vt
X-Proofpoint-GUID: pHcghyDbVeDM8c04RSScS00fJldea7vt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NyBTYWx0ZWRfXxR7PVX9PPkCr
 +Ms5MNv+2wfyUJL9B1c3kEiUOVOIHcjsDLxlhDgYE8ElVBh3DiYO5ukRZnWjkcd3BnbbM9UiUJr
 hTP2AoZ8IVnX0vtGoVAokoCbh15l7q8BqklsX/uqp+aXcPodZ8avK0O37MJodkSso5T27tggpMv
 pVMlejy8DldcKAvVwHy7XuCTyAQVMmSb9SDtMB8RVMwrc7FmjsBApiiT7QPwKIu33GCBJ47ZnSs
 Gtp3/bF12nAqSXlrSnN8mqTCoQy1WZ9r50F4nTDXxrWupUa8My9KFPgswhQXxNqUKeOvdR+jray
 6hiKAqDlOUYrGhkjzT64jg4DR6UIupYG8m1UGCz4lrPtelxrNYcF67tMSlgVLT85L72sZpF4/9n
 KgpG2lXgDQ+555UGuFM/24scEmiqAA8HXl/ILiT6mZGAMZ8MF7g12lgPxx3ss5tE93Utkofx7Rc
 1GtxGFUe8BH/8rBI2EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080097

On Thu, Jan 08, 2026 at 04:56:58PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali WB, which introduce register
> relocations, use the updated registeri definition to ensure
> compatibility.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

