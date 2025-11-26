Return-Path: <linux-arm-msm+bounces-83518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BE4C8C104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 22:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF46335AE9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 21:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7922C304BAB;
	Wed, 26 Nov 2025 21:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEl/yGbC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ds7WZijG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECBE3168E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193367; cv=none; b=RBVRCSi8xnTfFDmvbwYJqnMViWM9w2fu/yJc1It4TweXA1U4za59CtMx9IWG61z8kWEf7DbQF1/P+YVYhW2YN8au6446CgMWGw0X05wmwVDwAM4QfpDWuvJcRfVHsJzdENHv27329NnK0SmkWoF5kmGskYCL6yHV9YY+8mPlCAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193367; c=relaxed/simple;
	bh=KLk0N1FAetp7tkmzfYNdMAb0rPrwY7OkD8wk8cLPZrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RA8LuCDFlotCY8rAM/WEq+gs0dKeqboKoKljKIA9b9ujf/l27lwgOAiKw0ghIecp8LJJn3uiAkjSh+zncXyKDp+kh8RaI5o/oDrZ9iNvFI1eSGLofm1s+DyIqLsC940oGsGW053VYAMZtsJ/r2tSby22Cz/nsDbxNwv3uaeDvDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEl/yGbC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ds7WZijG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNxog1849691
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z+WPrqph3VWDf+dS1LJJ1KlR
	DwYS2bbPcyS/oPhvXlc=; b=GEl/yGbCRUI/c6OQ8IPSjWdNvZXV91TguQT5Y6aw
	PcDDhC5scY/y7LgUKz24x2muKP5S/mYwvC8lYOEnoncCvbwXdqjoUsE2NbXdR/jz
	FDPDpCB9o3SUKKPH8tCkY/jHh0DR5TS77wP/DxSO3XXu09ceQn88dELmbY0sOYIc
	HRaHz2Ut3sJUHivN9lqE8ADjYG2WYLh/XbmpChF9m76oY18Px/pRaWlrDvjCmL/8
	KDWElglI16o3+Hp+CsE5ssTRU29PmAUGTtdGXpfyVRVmAbxJQP5wfVzCXbYBQcNV
	pFGawcgkSYkGLFzJ5ytdsieRRB5WSpmpD8O6rll9+aS+kQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msskxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:42:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b286006ffaso46122885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 13:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764193364; x=1764798164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z+WPrqph3VWDf+dS1LJJ1KlRDwYS2bbPcyS/oPhvXlc=;
        b=Ds7WZijGhFcobO0QGU67vZXTyXij34eA6xK0dQX22V5vhD+wGzwaG/XpH5ZOVYIJoR
         lA5Rq6HMqBDDDnu91P+OoIJ6sZ1M+LN3YKY9U/Rr6WAMzMzRrbD2M76o0yYbbyfgUB3w
         4qGw/PLZ3I61Dg/Q9OZEzt+aN726/AWzg2a37wcCD2KMw6OzpiCyY/3oeKLU4v6mpQaC
         7wRZGwd4s+vaHj/W/VJxtgYL/qGZpTm1xFpEcBCX77nD+Ddd2LvxoMzyZurovVUdnx0m
         5SHpgVAmbGh2a+glFjGC5P5YqxSNaEnr74DUDqXMoEKuYIQOcxzACXYe6OGOKM3qzYAm
         qK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764193364; x=1764798164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+WPrqph3VWDf+dS1LJJ1KlRDwYS2bbPcyS/oPhvXlc=;
        b=DAwNEbWx7UgU+ajay6ZIhzPJt4eyvhVepl9WoYxpuI/LAzYPZGyXa/ZLgVCyBNNF5f
         auvYuD7/U6uVaXVDgRhULg+OXZphHiWUnMDZynR6auzShGQ/eBXKAGC4BVXHLU7AZ+5o
         5OWqjnLqr8gKHyEueQFTUurZipXsJU1B4+wYAfVgM53+ImhzVi+eDy9AWYknutenzrWS
         BJW9if/hVb8uJZTpil8M79gN47UOiRIZUZdyvNkSsFA+15/Fh6oIT1RBpPFlCZvpM/Wf
         VgizhXiHSeji+oySUOsOowCsNRJk2En7G0FN3/BsOAnRRPFjfUWBOscVL/Et6kp4xSap
         Su3A==
X-Forwarded-Encrypted: i=1; AJvYcCX+oGmK1TmQpw9+oe0aIZRS5zK/5jir1qC6SWqZuBSFa5K+liuyShWVMvmrKWyHURIF6V4w7cRxdtFh8+q7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5kl8dPEO35LfKQ4kIap5WZFh+sHBCRqt9U/ZRMcWGKZXgPtje
	EWx5fE/C1H5K74dbXo/3k4w9ppKzNJfcJMWoEEDf6u/5BWxq1VWnwGQFWPgmwvmAKK219+0aAw6
	EdHJOQ+gZTxR5eXm1kKPTY2QksKKwzU8UM1KKZ5FHBNCgnHQHhYhHf7gA4OFMXKW7B72U
X-Gm-Gg: ASbGncuCpTXbtE++e6i2O/2zX1f27zAozomzWTSyvU0INhMz9pnLCUitLxkbTq/CDMS
	d67r1NE+EKtaYthsgkLE6ji3z9sos6/cMc8DU2HrFXl0kR1o8YCIeAzmhCNBS6FIwNdfliZPG5n
	AlowUc8nb8CIbsLJVaqerMegkaXOVnkgz/i0W5B83+UL2GWtUK/fq+3FLDFqBW10HNZZnC/NcAG
	8ANEVJPdXdIX6A7NWzG+BsDnJgpG0kgT/KYlJjg4b4OG/GIwmB7alNp1a3fy2d8AcjWD26cIItd
	QnGsN0Q0imqUGC/cxzFnViekVyoIT94C7aZV5D7Y2MbZ9lLSYexVOIUvxOsFocWGXSo16oAsEHk
	Qw5hnP+WmMib5nynyEat7eZZzC/yHl75f8xPy8YPVD8aEQzHIo4hycLrWwK2dCSFUppGJZFjkUV
	UWICh3S5um//hxp9LJnyjv5R4=
X-Received: by 2002:a05:620a:28d2:b0:8b2:dd7b:cc8a with SMTP id af79cd13be357-8b33d469758mr2883989385a.75.1764193364018;
        Wed, 26 Nov 2025 13:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH2vVGd+GcWOMX+Re4xb1YF/CKD+k9Z5kHfJEow6wWU+/bNxqvRsyFDVIN+UdpwQznY75zxQ==
X-Received: by 2002:a05:620a:28d2:b0:8b2:dd7b:cc8a with SMTP id af79cd13be357-8b33d469758mr2883985685a.75.1764193363526;
        Wed, 26 Nov 2025 13:42:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59ef2sm41430281fa.16.2025.11.26.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 13:42:41 -0800 (PST)
Date: Wed, 26 Nov 2025 23:42:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: add PERFCTR_CNTL to ifpc_reglist
Message-ID: <c5t3ae5ip2eoxrxv34ssudf3det73nht2ug6o6ia5lawy2ws7d@jafvcijp5hjg>
References: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
X-Proofpoint-GUID: WRgOUvZigPnpY6LvmUdLFhZR8u9BeBDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3NiBTYWx0ZWRfX88Uo8UTUoXf0
 EXMDrY9LSqtcySgTRdUq3kNNaj6lf4Ds6S9TDevEGjrte65VZUFqj9jKKKI6S+uR/CwpJLouEgq
 Lt4EQBsb3YSUAA+g9EvCtY1DuEUANjdrz7j8UflWx8PIzlF1J5B6GiCQq6ERLRGodIE0y3tShuk
 +jtgZFo4luvro47ybEUF2QyCysFvJKJfjDDou00S0vLtK5Y16+icXt1MLvDJ7SeFWWUgO+6LQXj
 TJj8YXZNQZ5sSrBKEW5L3jNWECirFKxk+3phR8TvSIV5e99sPHiQS7PGNv3n5TspCxM49LbuOla
 uAI4WK8SL/pe4iq9qAj6zZhhtbiq4a6jiAUXNRfHaXBCZ+IetdkbpbTlgZll7vGSRFLOVyJZH6I
 v49/h5QOgncoMC8VX9eddSINP7vsQw==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=69277455 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RUpeJWWRx64e7F2V8Y0A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WRgOUvZigPnpY6LvmUdLFhZR8u9BeBDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260176

On Wed, Nov 26, 2025 at 10:31:30PM +0100, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Added Fixes tag

Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> - Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry

