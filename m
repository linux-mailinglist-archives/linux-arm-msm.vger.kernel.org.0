Return-Path: <linux-arm-msm+bounces-63765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB460AF995C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 18:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BB41898D7F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 16:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF771E5B82;
	Fri,  4 Jul 2025 16:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7mDgnjY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2919BBA
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 16:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751648147; cv=none; b=TXHUYvQXTgWKU8BQTQynGkLt5y+kzlOCdDwZO9Ysz5HlJghcLf/9e8xI7z/39ZxOymnL5cCD1dt0kCLyFoiMwZn3+D7s29k/8hnHYqlu0UJfvjQu2z9Ov492tkN79ogGOmr5G+ir1HM9Jl/ziPXWs63kRyNo8NI0LqagAidLPj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751648147; c=relaxed/simple;
	bh=p8i7XLYBzXGzwkf5jb0FYGDs//dNhAE8WOsatbFWV00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyiMFrqqyK2sT6fhKdCdF3f+SUCTSdPP3tSmRyd0w3YWcW0rBl4HcizCyv6ufEGfsU4saIwPfeUBT68c37C7rqE7zAJGM5VtwtTgXFwy8JXLwORu0WknhGrfiNjtR5t9ymYv1iF5ifMmbQF5kTAl7AOXJ5FPjYpI7hD3JM+W02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7mDgnjY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564E6MEM007067
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 16:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uGJsilyKHH4Uj2b3teA8OQnh
	5JhrzwNB6QZ7/ifZqDk=; b=e7mDgnjY9p6v+RF8+fdZG7rJKnTa3Rd/pugvpJa0
	H/sNW/r5qaebMSIf5akCMH+2/w6vTi3YCP1Pv1NzSWuN3Qu4uzIg64PiFZOsYpMo
	j4c3RU+/rQraBeOmHp6bhLgmzwECWXO3/bxE/Fsfdbnz2Q3idtTKLlNRAR45OUXs
	C3Lw1TgpAfSVKp4KNl2/MGCBA6ydVcIK0fmq2P015qdDkOl8ZWFHJowvuBm5zawJ
	h0QJv5KZRQWkn3yVT+lTsyZd55kRHE2T0/OfRrPCvp5XdKv0ptqAD2TBrTnHXm0z
	QoQylJqZnvaWkDbVUsNhgVTlvkhNqlhfN92gpAIo3bgW0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5js2xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 16:55:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f6471cso177658585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 09:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751648144; x=1752252944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGJsilyKHH4Uj2b3teA8OQnh5JhrzwNB6QZ7/ifZqDk=;
        b=JfQ+D0HA6EaYptVS5UO21jv2RwRVp16V6epXvzsyABDlXIw+O/nO7rLNoMj+RbDaq1
         ljXYSR0aWXVaumHu5QCBivj5v5NfjaYfuq4Jfou7IgklNJOAsvVIQVS6jRg5wGxIlonO
         xLijeL9TzzCwbXsMLLeBEyForkOlVwXV3qmvlHVYUItx8nXHzCHeQ/zU7M+7PiEgjr6P
         Nju3f+IBG+KKJsHTIfUrQ5t5VMyja3Ewm7Y4tAJ+MTimU5IGcdnJfvvCsYGbCvSdkx39
         Wjv2Wl62a3yjxgtPg9gj8usVW2ssz0rf1bKjAWTcplc1Sj7rwraC+5tfGC4mOEhUT9F8
         xPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC+bv6EIARSWi3ZTYzu8mQevuGpVwv3dFZnJNo/5wyJvXBQyhAeYT3ZqGYJ1wFT/smM+DIkAIu2t3gdOsj@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVqeKJ8o2OSGWQki+WKFq6SQ8+qQ+ERgo9KoFTphlKiRlkayF
	XdqU4+joXoMqDxeqL5kihkOl8k6Ls0swIWI/IM9cO2+wEvByMTmr609jLUbVXofiGF6AnFFb1vL
	WQjfoRXzpKpNTruodJxUbw1nP5U+aB9BvQC5PjgoJE9++HYxii6fMAM9tcyBzIzgixbSk
X-Gm-Gg: ASbGncutpG4DD9Jn7VUk1q8B9RMw+wgKk5e5ot/2jnHgp250zGLTQI1Rqmjpeqf69Wz
	qWLJqxdTgwMNovi9eWiClMLISyu6sT7OV83ZzM9OjXWfHHjgqXMdDpu5ezDbV4FHd+B1799omtg
	CzM5toityjttd+Qv8muI4jRUqqK+wkp/SYrxA1Cqtav9rc5FPuwLK2RtbhgJHcvbrz7AV+K2VtN
	TP/unnztGxff0uWhDHB2CyKzpQew1uoOfzUfwfSOLyrvWaviCCPQ+n38aEry+nfl+6fFVAbpso6
	1ENOXjhZ2W0E7Tog8gdBdxmTuoNTZqWEdsXaCGuacag44ZTWobO93Z/MGvQXm/LgUveZIRMuIin
	Fz7zmpvA8Pnxos9Bu2DUqmH5xb3dqpjneIhI=
X-Received: by 2002:a05:620a:7014:b0:7d3:8dc9:f438 with SMTP id af79cd13be357-7d5dcc9df6amr531553385a.17.1751648144300;
        Fri, 04 Jul 2025 09:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaVzA4IiTDSX6gXdnqwfBeXXk8lV7lfbEhBooGVKmi3HCndngb+lBjt9BZPHjHEi0TGBN+EQ==
X-Received: by 2002:a05:620a:7014:b0:7d3:8dc9:f438 with SMTP id af79cd13be357-7d5dcc9df6amr531549385a.17.1751648143880;
        Fri, 04 Jul 2025 09:55:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d924asm304261e87.87.2025.07.04.09.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:55:43 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:55:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <dw57fgjv667bxde72vim34263ak4flkb5z6lfqzhtwuorm76iw@h4lmizln4rzc>
References: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
 <20250702025341.1473332-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702025341.1473332-5-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68680791 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=GMwvZ8BIopSWxJjz0OgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GW1bnGD91NWuzNLIoh-oF0Hu2k-8-n9c
X-Proofpoint-GUID: GW1bnGD91NWuzNLIoh-oF0Hu2k-8-n9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyOCBTYWx0ZWRfX1kBfFepSoOYU
 S018EiPTcvrLnIH4HUKXUAfBHGL0crZX+bwU/1h1TuzlM+xFcdxy2+PJEdCrsJkQl4CmcBQXCwD
 uMD5ed3ITMo83lfgKljECE6K0yJJXr8pkX8aPozH/QP1rlmtv98J7hA/lDjH3X3mmxseOPCTy4Q
 1FzaolIiJ3nG0tYD9BDT6w34BrPRXlhOz0sAPZQhiHMlC6VJD7rH6wipgYRPy7kx9P0bVA5dJs3
 9ooTaIilUYK970SE6WZzvMYkWheq+4ioCr7ylTbhbcot96AqcErV1+gY/IA+DaNe0ofTJ1BLuDD
 2hgxruMyMXJB8OQLWHSd5AUx7DDX9CNzTrKkr0MZZa8b7Cfkp63zqzLMxZYMupltShEC/mgvAme
 jTua0jvlIgqBuWln1FixJW3eDT6rUfGIfMYaGfkjQINbEjjMx9M+j3bxRVhqatKXQKDAOCGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=782 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040128

On Wed, Jul 02, 2025 at 08:23:41AM +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. This patch extends the driver to
> support GDSP remoteprocs.

Please read Documentation/process/submitting-patches.rst, look for "This
patch".

The patch looks good to me.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

