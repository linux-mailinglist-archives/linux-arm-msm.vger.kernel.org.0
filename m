Return-Path: <linux-arm-msm+bounces-76746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2995BCAFD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 23:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A111A64A0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 21:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50343284678;
	Thu,  9 Oct 2025 21:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyUTD9rm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A3283C9D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 21:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047011; cv=none; b=Mai2pccJWNEfTB5yiZ7HZ546v41DYWYmo3l/5eb9FXc3t/H8WFFwiMd4fTSp6LEm99ifblyOLRmU7k4qBHsGCMQ3+xEOuvVfrp0utsD4PhY+ofMmVCxLIea6CHZ+dYLm7yld1Ix/1OumiXZcXO+udeT4I608bdqdqXClb4FsHos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047011; c=relaxed/simple;
	bh=0OgiVxHxuHOwZl1JtEffwi7VWDcOnNxQta3JJsmBPCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzQMQjgypfO0JPn2j7zic09SymKwz4VSKMV66fWkh5NhiHHGHi23zhlFJmIfXUZXpuT4aS2hMVe+oqZmdHNWtzeHBK8nnnXcgl/MDRhVgRT/WL0kOXhilEzaQUX5m5l/yK22IoE5IgeGaUoY0PiNZKOp77+UGcbvNdlH0BsUp4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyUTD9rm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599GG7NL023363
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 21:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aXc6K5FtfcVXCLUBSxVt1McR
	pcSj+yDNhIZwNeN9Dac=; b=QyUTD9rmA8NOJa8IAHnoJvNHyfr1M5380oyJsX3b
	R4DqEb+ay1JHcls/T/Hh2H4+ZXJdFtqmUuZbM3/oG0sX8n8y1/VE7RONq8l0pkxM
	njzgs115RQ7eMC8o+DC2TcEU2zR9R3uDau0fRg2krkRwJeZLiVn/O/1WFFvhl8fI
	kCUPEmG2MuZLbuhYawhUHGsTa4mMmcVViUxmShgs6d0LcjAmRFeDcUEEhHAH1Y+Z
	7vLtyLuUScfZFMon3sCuyCuI1AlG8YCvgNEkigwWYn3euk+fIGWGGrzbCoULSYu+
	Lio6gXm17TL58qigBe2HL4DxdeEvdDXgXaXeg08oaBR1cQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49pgdsrtr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 21:56:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-859b89cd3f2so480702885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760047007; x=1760651807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXc6K5FtfcVXCLUBSxVt1McRpcSj+yDNhIZwNeN9Dac=;
        b=qu0lLexTai/A9HNuIKHudg4l5aFxeuN1UAhK85/LobyQmQk8cE7Cjz41hqjCVEG4lP
         S75VWpZK0drRSeHS/f77is5IWCenRi9GFD1hu4RfA87ZUxiU/ADWKdJf0rNt4J4MuPho
         1o7U6HPDLNkMoHHYl2JyQAmY9UOzvVEWnk2VtFfbHef9qkUAGNCT5e15pcyWSC1kEQfc
         rlOZeUwHlbDylJY4UyTKsGfjKER9LOR4f2CSk2c+5JFESVVIcRz85Tm/gqQjK8HWtKJp
         OHs44M9mhF/+49hBqrcwWOTV4oYmKwJITi/5Rb9/tAHvE7aMkmFtn3rEIxr9w29zZ/M1
         Z9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5IWFqiJINR7Ocb15apgvLYmk6hhc/MrX8UHRM/PSPcJpiDS83sVZwbddfj5vrNUvikonTtWOq4aTzEj6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2wvcS97c6/eFgkd7JuQFwAx6qaMH54ySHOqFrEDBZMyPpHKlC
	5X74D4Bb2r7DkMG6H3TNTAjMF58jmr8OghEXs0LUbc02aCdzy2Eso0EFSEmAnCzker0i1FjlLqC
	OojR4VZKtKi6Bi/o8KXFgux/6cKOr/AnpwmK3EgOkhSQcMFzD9Fpqg1YYzSfalXVWmXfp
X-Gm-Gg: ASbGnculAHhzZwJZOoVTaQaQpe3i6R+P/A6Q/naQiJ7/y5eYWDf7Pfx0QSOxYx4cc2w
	RIF4Xd3dtLhrQADryp7hPS8T5iFFL5cY+gR5loRUWoPoueCUGZizWVDqdzGHLa6l2jRb/myEH1T
	DjLdAC2EKTpgXf3NhOPyys0ZgyoSqkEnxhqxiSx3LX9Ulxhs+FcZC4gs+JzC9EzboF2Wr8bjVCd
	69F2lWNRcunwUDTgGvrdfBNckxEh/aLcwXipr5FS/uiJkCZYa/glrVmk4ZaDvwFa6TTE5J8r+qS
	sbx2E7um60aBFeYcqAzvz+EAcl+0OUdy/P/8JTX9JEzWGb9z8/RWOYNgUAJfvhKdqF2TLuv5Y94
	YxedMlB1goJwudTxlEs4u1BNTZHJQY96s8eca1wcw++NHNWWldb2oPZnS+A==
X-Received: by 2002:a05:620a:1a05:b0:84d:a352:1853 with SMTP id af79cd13be357-883502b5269mr1331695085a.10.1760047006499;
        Thu, 09 Oct 2025 14:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSe8X1c6l0Woc6nK1FL8k1XI8rlfvjiZmvEQKYodTgIRwNv66o2mRudxwpcphaC7lwUMm+yw==
X-Received: by 2002:a05:620a:1a05:b0:84d:a352:1853 with SMTP id af79cd13be357-883502b5269mr1331691785a.10.1760047005925;
        Thu, 09 Oct 2025 14:56:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm225146e87.7.2025.10.09.14.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:56:45 -0700 (PDT)
Date: Fri, 10 Oct 2025 00:56:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <vipgohc4rdankw2lcitdeypzpnqicbpccqcs72e37itpxj6wt5@5govlfjwyqxl>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-ORIG-GUID: L7O-lKjH2j4fGwE2D9LbMEt2OVMrxOrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA5OCBTYWx0ZWRfX/jo/Crt9akeg
 27btjtPKZIw16IotTq82xilFSRLgilVQKW2kskcSZkty+34ug0nlcztKQMemtMY7dqGNqEvdeUh
 eSbnQrqBHAAsK6BOKZ/vDsg6A8bW/i9N5BBiKWEbQK/9SZwLWKKC9MMVC7RQuAo+QXpa6Rrp5EH
 VucBQJkz6/HZamB8TnGw3gDwTOPem0Z9NIoKVsP6urFqd4s5t1rv4k9gqy0nRplTjGbdl+kae4c
 /c0JZwbvhIbLWbYJoHk+D09CwAg5FpnA1JMpvkw7p6h6ISKUBzT9981g3HN+aRQm60GDZPK6QH5
 WZ63Z0sT7Sp9PzBvQmR+e2hw2i5IpwxE8SUp0OH/NPZgB1ZQv3Wlj40eWzWa76jfDGL29blsObp
 /cfUe4LnbcoM6VjDyUKSaztTYp9RSQ==
X-Authority-Analysis: v=2.4 cv=DISCIiNb c=1 sm=1 tr=0 ts=68e82f9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_rVczFtdL_8dPuQia7UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: L7O-lKjH2j4fGwE2D9LbMEt2OVMrxOrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090098

On Thu, Oct 09, 2025 at 10:09:32PM +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

