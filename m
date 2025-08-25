Return-Path: <linux-arm-msm+bounces-70780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C08B34EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 00:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC6D63AE2A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1974B1A9FB8;
	Mon, 25 Aug 2025 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0VnrkVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C6B2746A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756160610; cv=none; b=FjzAKi/za2JVQlpc2KNj1dqvrPnWjQQ8/mdV4SW0Hi5vwdyvnfA4liZOxP5695quC4Lybnw2Syiw8W7fZOlOzJTt9dguMuzjVOYWFW+fMclVIj+NeFMrSt6nyRvq98YQmDrwj4dtwr5sj1Ft9PMsclI9aNmIRn7ln5o7HbkVi4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756160610; c=relaxed/simple;
	bh=pSyVZXZs5RMXZqg0UugXOTG0Wtr/PfJ6jbgDsvrBpQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OntIirI6dLJpM404arxcd9HrJpfeWafQMOsZr5XRqAw/5E82i1J8+JheqGyvL4/d01HXzZR/QnTS9URq6t+WMQiA0eMt9OxsiGtV/nEaJ0fl9sbfNmodFPA1F5h/gelstUpmDoSy6/kGt0oT6U9DDtMHzNyMoq4iFPxuZBbHmMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0VnrkVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFs7h9007038
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fjH+xA5Hhh74IqC0r3nz4iYW
	+qHZrS73elo/5Si+ukM=; b=M0VnrkVEwZb5l/PpJpVjvAG369Z6ozbEsYfLWRWK
	6B6QwwR/BG8/zXlbCj+DMb82ZTPNhdHgJRHn4G2Yic3ns5VUKZzcapGJgongaPCZ
	9EmgKmIma0wZtXMtyfGV0joRsi6cUvE47VUpCWYlVPoMmzP5/lBpauK+qa3OGows
	QGmOZomk5chmEDbCpuOl+Nvi6zLEcoR/E4tjEdBQsSqNssPmKEf5vucfeiQSV8oO
	avkXP8h5eZ6PmLMnEw4IFv7SL0ZHtrS5kLlNj9Xcw1f325BWHid2nWGCxIMHYZgH
	yHoO+TZ/UDFjRCjY8PIKr9vpO8tNPp/uheDRSqBfja8SUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um6qnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:23:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109bd3fa0so49511581cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 15:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756160606; x=1756765406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjH+xA5Hhh74IqC0r3nz4iYW+qHZrS73elo/5Si+ukM=;
        b=F1ZMgtqERRn0ghWVtUQNXZ/7WD1iK4UQQT2II9tqCUHpnsunwe7JVC87+L6yf8WxRO
         gMOiGPncp1YgSaCLKTcbhhZ6wqQqrzKgtYdFTujjBUi6AJuBl8L1ys9uegdnKOfmnxIu
         XUxm+l9KYU+fIE56d8ZzcbXYr9knVXAvuqTJhgxb1n1qPRbTjkZJZX08h1TtnOmxtL2x
         SE830X4IyWb20485lFO5RW9S47+nAmmXEQGhXIhi6w+8MwirE6mWcnn2vfq4QoonIKVl
         c88N0FswG7fbYz9JoP4hva0feQf8B2FbZ64qBilhGTnj5ANS/DtHXpkzHO82Zl97eIhS
         IdWA==
X-Forwarded-Encrypted: i=1; AJvYcCXpXalq1NrxujEnVTpGY3TQFxbLysyQVintdTStgmb5oo7+Yv5NYAN08vPU2bbp5rBm3jjDEbJvzndBNT7X@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQbLXhuFsVhcZjldj/FTvRfn2IoFtskT6biYgOFkYqd/0OBL1
	3YV/eiAQxq6LYk6YvQhuAJQ9MBzAkKsaoJnGlJ0zslN/juHAhfa2SGeWhlv1KiTg2h8dJATTpAn
	ItFm9Y0t/cwfa560X1otADktAlW4xUdKbbWetVB0bCc95PEaz5EKtjyu96ZpEUHGXTnVb
X-Gm-Gg: ASbGncsp51sK2IPxZ5MKOZcq3Hbc8vjSRZDQobOYE5SN78HoxV4JW9KE/SjxRvnXW+3
	9hZ/bR3CnsP/kdW31q2Yxad2hKhD+0pJbVSr0E1XXObKCKTKHmu7BH5WU9MqEp0KdFGsdDczZb4
	j32YrJPToeh6lcU7Ao/SEc5bs8rdbsJzDdXM3/p2+KdA0k1emZ968QciQGKGj1pUnHRPegoXWbm
	3SyjiO7QQ3HpaeQG+TOuaUr3cK9U80GGWKgeLl5lPGOy2emBcYkRer1wvVbWjZRQaLykBABc9sq
	Aw57mjUybmBb7S04zNHAXtR54Q/Dd+GfujuHAUi4dJZyIlxCgMJIgWbfGSaQBk3+t+h+JcxcmEA
	dJ5AAD+Z8+MrXDmU6r6QUW5yL8h4q12LYdbg8csuC0Bdaweec8qPm
X-Received: by 2002:a05:622a:2443:b0:4b2:8ac4:ef8e with SMTP id d75a77b69052e-4b2aab65f01mr179201341cf.73.1756160606389;
        Mon, 25 Aug 2025 15:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/gWs5Q3U2MNb4IhmQlYIuCMvPeaLXJdn7Nhfi+5p06NJqrdTdO3fCjgpZVxrr1qDOV5nUzw==
X-Received: by 2002:a05:622a:2443:b0:4b2:8ac4:ef8e with SMTP id d75a77b69052e-4b2aab65f01mr179200941cf.73.1756160605874;
        Mon, 25 Aug 2025 15:23:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8ba2dsm1836524e87.77.2025.08.25.15.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 15:23:23 -0700 (PDT)
Date: Tue, 26 Aug 2025 01:23:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 25/38] drm/msm/dp: Mark the SST bridge disconnected
 when mst is active
Message-ID: <bgo6yni27nqe4gkhvurrnzvgih4hn47itpwg7afgtctspin52n@mtf7e2jzcukb>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ace25f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Cr4VjbKX6U7v81t0Q-gA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXwfICdPzkezPx
 WRR/ZMGjKcZK29VB1vpOvTGHxRZPkKpdjV9Ip6DKPJT9Ag9/VJ7rCY3kbwaqfDCvyE+A5d6svkp
 ozZwBgbF/bgV+2bUzh9dcuTkk+Wa8F+JXM73lb8MPrDT/7s5MIeir8coFElkl++1YVlPJcUGGIy
 8Ah9HOBjDzmX5ORfkbEkXKxxDbN01iibAUGnRRDBXBZ3Y55O1bVkAgp5sGMRp6lrucM83PPe+W0
 q3t3HfuNuAkAnULfxZtgggN27x9qrf0C9KY5OHopdO2fTtowfWY4jbteB5QgOMvGluky1mXayRq
 AKZjWtQPD97KvnW79H0RKD8nXKJKyK8Pn/SPzTzE9IqHqytYSEeKgJ0o3ovIRR94QiXjp2Nifwq
 PB2732rK
X-Proofpoint-GUID: 86LroQoxZl9Wn9yC3j9E8cXq8uGGaM12
X-Proofpoint-ORIG-GUID: 86LroQoxZl9Wn9yC3j9E8cXq8uGGaM12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 10:16:11PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The bridge detect function is only applicable for SST. In MST mode,
> connector detection is handled by MST bridges. This patch skips
> detection for the SST bridge when MST is active.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

