Return-Path: <linux-arm-msm+bounces-81840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3FAC5CD0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5B497350FB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FE7315D5F;
	Fri, 14 Nov 2025 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVvHs68f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asPVUWye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AAC315D47
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118845; cv=none; b=nLO0qYWwxCVukSZIrqySt9AHQ/sAXfiYOU3ldBNPVXg3dByievGNENARpPg9wN/y89x0xi9YqXoaI09KqJENebA+pr+jOsgXT7iWLpd2pBf40k7GW5EGEu32EtqD4F4702i4q6VSOzDjnv5ISYtVLmql5K85ndwULcCHG08Ck5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118845; c=relaxed/simple;
	bh=V+dS51fPEN8iYqeNK6g62gPi3lGcfovBDulti49rEi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNaregZ02u6nS+9RS+dE74gyIrbytDGey2hsoG7VCD7MOFbmqdQW/Xp9N0B1lCIPZoZ/t3xiVYxShybDH7wlkbl4RRb+vXCz+YgXTLDAvzH5X9WUlR2y3adOUi5/v8ewy/Ife/DAMGeefZLziHaUdOO+jjq7WsRybCE1uGHjcbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVvHs68f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asPVUWye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE81krR1629677
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kBgfVHJi4wRQDnUdYnW3q9cP
	j+vyalNxx2jUW3VhUC8=; b=gVvHs68f6cWZ0RY0vuK5G8sKJ1jSvlZXRaahAXje
	e07OrVWXuLZ4N0amHuFzI7MQyO0sTN9mStHBYqw5G/eA4jDgymyg5k1IGoqShdxe
	ZQIdFOGY5hHavlX8Dm1e8Bo75O1RgnCK4bXtwdAyhY45Z8yTRl530RYDeUNec/vk
	hvvgf3X7djXQ77zgNo7YmfPbT96YCdCTUksr9nqap9XV+BMPqqzt2JWB8q/PVzek
	U5DGwj7UTpqU0Yh4dcHi4IJtrUmXdPWoybbevrY0sdjl2h+kOFzK8b3hlh0NbSeg
	/KGTTUrcLMB/eEw9OAe4jUq9KLXMu9qsCEAWKcMlVmGYCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d9xt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:14:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb35b1147so48119141cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118843; x=1763723643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBgfVHJi4wRQDnUdYnW3q9cPj+vyalNxx2jUW3VhUC8=;
        b=asPVUWyebbXFpY6WWup1eOhCG14xxkUJat9LRRVdfn6bJj8eMo2eC9z0cyQwKj0raH
         WFJihQ30bNj+HkU1BjQWlkfanPQTLcHO7Ey0JzoTbRqy09P92qpciH/RLfoEvm5SIcMH
         cAvbA9g0VAe8ZJ73Wq9dMcioNZ1JWuGxVj3FfTKZNBcHfkEraP7mIUCwf0jCYw6Y+U00
         duFn/RvY6P1eaE7T+V4vgnBCcVkC1vtQdQ1eaxVlhNI+WE/mQnWhMSk92oEgBURFrdW0
         ZxCeDYPvUCfD1vwCU9RUKiox8CVGo07b8xJLAZ7PQfL7gf5jKis/DMkaE5h3oKuF7Hy7
         MLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118843; x=1763723643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBgfVHJi4wRQDnUdYnW3q9cPj+vyalNxx2jUW3VhUC8=;
        b=htA0s9pQX8V7HaO4ok3pkcdoPov0/gyL+I+utFMowxQjr8c3Uj+NH6PF5BEq/0d1pv
         0CZLiXFVH1R62LsNfJB18eVS/Yu4j1IPvGmzT+yyFimBgsnSl8xz4RKuXQsQYl+qpx6L
         z0Gf54aI1WC4Ss2BSqnrNWc8KEv9gEQbP8QJW+lfniB2QKTvgzDi+nD3/YOi1LA1sMwV
         bTX6dsL6Rk80tnwPIT/ooLei49EmVcSYqabyNlZu52gLtoSXSMjERVl4g13TrZu2N5Sx
         T1Apye0YgRgUO99Oc+FtdPRmuskbBtY2hBp691topOqJ3YGQ7+6CVK0/rEBjoHvUzX3u
         hUZw==
X-Forwarded-Encrypted: i=1; AJvYcCVmE33EMF0g3PLHQAn/Sg58qUuXgyV5cqg97/LOJeKVtq0lqAmxDmhXsW8tmBoTqx+WDENYPN/roL2vM/rm@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGz5KjFn91vor8fB0GP77b9qjJxaZ/ajapaQxRJE7BYR/m6gw
	xtSP7LGEHZIb3Wfop5VaZNArz+WeDW0/Orv7aqFMBiEESZG+k2smrWjx1sVFI9c93VztkMhMek+
	BN7or0R4I9fW4Lx+qYKZrPWAxIqOCu2pW6zzb03llRnyrFQLAkhP/pTvsRisBL7gXnrK7
X-Gm-Gg: ASbGncvXeD+4JGchO0QMv5d3ou+DelvNqfZZMoWfkOdlG/Y8wjx0SKs+Ub5fmr01jrF
	f3AGuPvo0Yc+AUhQGcHepzjhw0Ia7DJAmeW99/OFUegmasQtbznPnDlVwuuMfQPf3KMioSI8Fvr
	5Q8IarDw8hbbwKOsK20rJz8ySwrF9wIrscBNEntq8IBksN/+sBF6QEZhoXcySYuckqv4XDPFkfy
	9+5X7Rgn2+vNX+nNeh4TsEnzcMBwHO/8sWp34KBkKObQ1TjbFYlDuT3CNvn7M+liBpjc0wK6tml
	STIftDahy7iZumsL98s3fgN9BgMhixwbr562f6WRCDpWE3x43Wn3kGvC6zHMDiOg/x/VpGq22/k
	9gzSw9/yxr0Qmj1zTapbEZYfvmTdEhbY5lePr5u23/AOVZF6QaQhTHJEGgWoSD8C0V6eId7rhPE
	P1U4QwQ4Ijn9TL
X-Received: by 2002:ac8:5a8e:0:b0:4eb:a82b:bc2e with SMTP id d75a77b69052e-4edf211b77amr34756161cf.58.1763118842752;
        Fri, 14 Nov 2025 03:14:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1PkMK/O7Uyb4oQnSt889qcAcGtx0IjtMdylt2HwrmdfrdBAiJUXbkOImNXQ16DQ1Fku6/rw==
X-Received: by 2002:ac8:5a8e:0:b0:4eb:a82b:bc2e with SMTP id d75a77b69052e-4edf211b77amr34755881cf.58.1763118842303;
        Fri, 14 Nov 2025 03:14:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b30c4sm991455e87.31.2025.11.14.03.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:14:01 -0800 (PST)
Date: Fri, 14 Nov 2025 13:13:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdx75: Flatten usb controller
 node
Message-ID: <uyd4jui4km5ub656gbsqciowcl2cwiaobw375wdljgruapja7f@2boblerk5eta>
References: <20251114061553.512441-1-krishna.kurapati@oss.qualcomm.com>
 <20251114061553.512441-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114061553.512441-2-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: bHN8hxB5YYGNqj_W2QK5dV5jB6EPP-tg
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69170efb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=a-SOv6l-G2yjWGANBxUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: bHN8hxB5YYGNqj_W2QK5dV5jB6EPP-tg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4OSBTYWx0ZWRfXwxLSo3rPYYn6
 9A9CO/1oTIarEUzGcqeryEiXMcIPMtNJHBvznVPYODFLI5Nb2GvQXXGjdkaqxvvt0NJX2TrCwlO
 nVapqCoebGCOuQs0Dl3AJWkCSWKJ8fTnf8UOWKC3Ps28ZQqcuxYonM4Qe6myZJOWxohDkF2D1S0
 UnT3NmZvrBm/92uDc9ZMVrU4mEyeFYWAVUBzO434J+wBeDTkNvyb3JjWJI3O86mgqb7fTZ2Yg7i
 qCt0gyWUaIl7Udev+F8M2FicPRlnev7QGCyEQEGdXUXIDly6s8r88dWuL3fiGSIjjMjY0nL9YRQ
 Wld4NJasqtBmENxe8DWZBVxwsUxEWVnq3KvX7S6gPQPgwQcYlYN1p+2CtNa0DJsCR7r99CIJl9y
 z2H77LSuNGSFbTXgS3vSCPJIayVahA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140089

On Fri, Nov 14, 2025 at 11:45:52AM +0530, Krishna Kurapati wrote:
> Flatten usb controller node and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75-idp.dts |  6 +--
>  arch/arm64/boot/dts/qcom/sdx75.dtsi    | 66 ++++++++++++--------------
>  2 files changed, 33 insertions(+), 39 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

