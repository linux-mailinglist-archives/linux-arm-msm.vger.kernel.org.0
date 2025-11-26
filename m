Return-Path: <linux-arm-msm+bounces-83342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97531C8798F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA4F3A2655
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253442AE8E;
	Wed, 26 Nov 2025 00:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzlJ7OOg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+XLXmnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA3A4C6C
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117169; cv=none; b=pttXtFeAmqEX6yNdGzAcY+AMc3iVI9KZxzF9fmfg4eyxxSz2Qtg+mVdzsaPlWzRTh+vbaGzvNAKMLZr0Rvn685VVnYX0Hmu0qB8C7q+BEYTGinHN2D4hnJz2syPtw05jx0kPfqdL+mn7vGlv371n/wuj4DiNDljZAbvYnri47Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117169; c=relaxed/simple;
	bh=FW4aW4vRDh93SIf2+rvKyWJneGjuDMvsfiXv3maTYO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSBnL4Sw4loHJYheoNih2qRrZfIO20Fe1pUsoU+YsZ+uzG4URpqeOuiBXO/1J1hlOw6RdyXl+TI0oTxreD/2IWzPYgFnrS1AVKZcVbCAmBcPHL6pbqK5jrIPbkmzMSkSo0zNlopMyoWo5y0+CX96mcCYG9/+EYCp2bRIxgimFqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzlJ7OOg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+XLXmnw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APIqV0j2650830
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J4iwvCXgi41ApZqHy6FaDdAC
	MQVq7RfPnZ/ycHIPWtQ=; b=IzlJ7OOgYhSqkKr3DVMnyJDXS+/ZecvljCzHkKg6
	y9wtWSE3Av+FdszfOJ2lvPOKjfQ6bZwL5A8GYTt3fllwlVqEsqdPTA36Pgh2+jDL
	OaK0pNk0CBPgfeRNvC5bgNyTdQYHkkLoMbF8AiDCsFK7TB2A9mDi2zI84eZiiuQ2
	JEB+E28wQn0RBM33aQZXGJg/fL6KYYP0IxotRmSvLPBaB3y9uwkOTIgEdGRxAoTM
	v75qzxVuin9s3rYUNQzpOy44HFfvgKAyLj5H+GEZeBVeXdzxdZdD7ImYflHM/cwV
	oMQKeV6OWQxhgskui18DNEpWJklA2VrxUsDAqiQx7R2qrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabt8t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:32:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2217a9c60so2287782285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 16:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764117166; x=1764721966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4iwvCXgi41ApZqHy6FaDdACMQVq7RfPnZ/ycHIPWtQ=;
        b=H+XLXmnwE56VC/Ushuj89eohhClXRJioxbIZiG4DZ2sMcrSJAN4vaH91vV/b1oV2VQ
         jiRrBEcPrf6vkp3nXT2LFoMUXccuD5S+60PgepX9wGWaEOH1rE9xVwj3BabuiTYfvj+Q
         UPCAAT/a6YnAfFcYro1D3dKS9CKx9oEmIJdPpIhnbG09mHxbU6EKOO4CW2n0CjBY6epw
         faoGsiZChXUd9THWvfH/M8BxtgWC0rOiqGnlN2olB0OKJM4/gkLRr1ziuDeLb1jPbT4P
         CELaYfjG1HuvMuANnYKTtHjnXSsQhggXvLMElGaloPV5zpKZI0GuJkR9VYpPf1y0skV2
         mj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764117166; x=1764721966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4iwvCXgi41ApZqHy6FaDdACMQVq7RfPnZ/ycHIPWtQ=;
        b=tFZpZqIfVEkHVB/dGP7K+escKVPTRiDQB8eZH6lZtSe5SYebm93/NKRGNhAx0htkSs
         jmP4kce8WETpuK7gSa04enJnRJD/BwT8Cdg0eLet6bEfS/Hu+R26rxF90Ufcjl09gk/G
         HVXgI5/yr+tkgg+0++PH6uhOmMC4gfjOR0LMI7nNxjcdDAMOq3Ep9Fpc/m9kzbYDCQc+
         Yd47EDVU4C5wJpWgfIMUREYYyHApbPAn2V7BeNz+3QXpSdlkmfB7a8gLo7aBNeQxeh5/
         1SXkGKPLwAUYjduJBBmHWeL1XUDtQqD+3L4DcY3Zuuxie/TQKaOqZo210c018JMzK++5
         XL5A==
X-Forwarded-Encrypted: i=1; AJvYcCXlPOEQclI0+Dvt66105hG8kGA5gs4R0bA3Ju239VAh8YBufgv4ouMISHZhzN31ynRuiFdRC6IHe2xzZoOT@vger.kernel.org
X-Gm-Message-State: AOJu0YzsoUyUdrVeE50C+0+PusMJjnPsZ3QpIPg8p4zZQv8yCZadlppa
	CvC9XyXLwXNPiB/Tm5oW7Y/DVJfsDeCPVeNGyCUNmuxDw+0gCRmnHESdOwiVniGJBlzEYrTozC5
	gRS8VX7Iv3g08l7y8VsWve2NySDf/PlaHWNHjrSG0TrXPTFT3V+urVrdg6rds/8cim0jO
X-Gm-Gg: ASbGncvYdSKIoXjajzVSiWIA1E9ag/4AU28BEOgyScDku666ECAfJ7WxBwEcxi6E33M
	VCpTQ8RIdvqyxbw0nDJWU+C60TX5O1BjG6DZp+Y23lABwHvy+mg3qvdguHtqNKvPbdAI9nMj1qx
	tOEj/p6aFe1iwXe2HFPjc6dgI9KFCghbag65jWQetDhf5SVZ4HAqHCdcLHQ1d1IF4MGubmp+2p6
	8duSBS/aKe0xcJ13Q0pYHfT682oHWYWCGypLwCKV7PU++SCkn+Sq6XP9Tznq+8TfGAICEA90rA7
	Q7QOe1iU6Z2Ljngdin1Eu0q3r4RwMYNr7dKZ1n8nHrwBR5fD5H2pEKXDYyYMz6YFXr5GBjFNh9s
	lflN5ZAA8Zc++ZrItez/RA7T8Lo8l62sIO0WNv8xoiF/hEnqPVfYvTEwUGECxNz3ja9K9iuJnX6
	HTTEovBWqBiHTT5qo9JQfeIsg=
X-Received: by 2002:a05:620a:4015:b0:84b:76ba:9548 with SMTP id af79cd13be357-8b33d1fd268mr2309120785a.24.1764117165881;
        Tue, 25 Nov 2025 16:32:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVWN0vGTHFY36fRR5GVlSOD+Z/Vc8pYyN2r9PKxfNBonDbJyyOvww5vLYOR9v7WXY6UEtXTQ==
X-Received: by 2002:a05:620a:4015:b0:84b:76ba:9548 with SMTP id af79cd13be357-8b33d1fd268mr2309118685a.24.1764117165475;
        Tue, 25 Nov 2025 16:32:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbce0b2sm5555763e87.96.2025.11.25.16.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:32:44 -0800 (PST)
Date: Wed, 26 Nov 2025 02:32:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <nw6oxqdeoeckcqk4lycxyujh2uk63vjdzdpaddddkjb257xldx@eh36fawnt2an>
References: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-merge3d-sc7280-v1-1-798d94211626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=69264aae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VPnwEqdzcnHAo8jZfgIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: JNj2ZGfjHhkKYdbwVO3BYu9lIyKuL6fj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMiBTYWx0ZWRfXxZNlpBxfnIW2
 ulk4ZRx3dTq7Nf2mswZ9Y1CDwmXtwQ1p2EWpN8iGsJ0dvMUI1UCofDRn3DpkqiLB5RyumM/4Tyc
 XT/Jip1YWALwTysy+9QX4ah9mL4eOhA4ca+5hHvLeQfCQfN8ps3KWjLSLGdEARqiebuNCheO9ms
 /br5bD2Q47YjfSOnekyj4zmLnaf1EeJ+1O/du2y7EdoZiP0+WMbYBPP9LOfUhuS6fa3de64vw+N
 POcatEwKC8FVZHUjwEtX6R1H/AKfbuElbePdrpmosUEZvR2+3z3UB7jExLa8JifCWb0YJf31oU7
 W2k7QBGyPwKppb9WyoHwnA/tMVlBFeDF/K/8BP977CHpWtPVGpMxIU8GWFw8zV53RHpOKr7RMD4
 hv7R3kXxdRB4kvk5/GG041tB1L5AkA==
X-Proofpoint-GUID: JNj2ZGfjHhkKYdbwVO3BYu9lIyKuL6fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260002

On Mon, Nov 24, 2025 at 07:57:01PM +0530, Mahadevan P wrote:
> Add support for the merge3d block on sc7280 which will allow
> merge of streams coming from two layer mixers routed to single
> non DSC interface. This change helps to support larger buffer
> width which exceeds max_linewidth of 2400.

Please see Documentation/process/submitting-patches.rst.

First describe the issue that you observe, then describe steps required
for solving it.

> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

The patch LGTM.

-- 
With best wishes
Dmitry

