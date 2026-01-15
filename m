Return-Path: <linux-arm-msm+bounces-89167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A8D235E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EE7D3033986
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3250346AC6;
	Thu, 15 Jan 2026 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M04mlgd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iugHhzai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E934572F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468343; cv=none; b=Kqv0b3NU4aG80UfXyexUyxYO6QWJ8Qio+ubclkYPcq1NfaSnS+VklKXMjI/XYaCSfRK7QrQDgKuDyVakq1l7cYh2cRc7o5LZrmPouVp88d2iAtDaHOb59+KITcFKme+UUuFNY8HGMEsuR2xohrwucP5qC5zi/Qrw9+7pTxEQW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468343; c=relaxed/simple;
	bh=GWep8UI+0yqjz4/wgxh3H9H1FXRfvdtPRlEXiW3eCz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pP8tGtftatcKLDvBlrjHFh3BrqknjY8vQ0rK5hpz0FUSeJ9l55BXkpGD3ZTbHmAfJ3eKiIuLCCYBVLN/iWac1VKJb6Y5Kqe1GtRH6g2EfQx2gf+0nSj4NIxTxwx8WXBS7eG5+0kuHiWtXui0zVcy0U3wEakNC9vuxyqSFZ9DR3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M04mlgd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iugHhzai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g1Bx1055253
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2NDP/EGkgTdQmx4cjpLRwc8p38qoVtAu2G7CGSyXyw=; b=M04mlgd/lD8pKUj/
	oYJUwnoCnCrXay5CUrW/1uqZbpWgajlc+SMS0Y+8MutyuRq6Yy1LJLQLFyhFtg1e
	0SSiAqJ9spE5TfIR7WFw3vzr6YPNZG95bihuHh3G/Pp8gXptI7/vX464/ZMCjN6t
	z2+vR1gEF4bduO8BcjP1XBdC5L6CalSs0dfkNNuc8PBydr3zco5w8AG7fdEOHs66
	l9M+YeKmyFvLrTFy14edI6GWLzD9qdT2suAmVLSM7XJ0UasyhumQYIRSboCfb/Dd
	zBYsEMHUL+ZRJau2d70RuYLCJmd6m/CVYIzKLMZAZ7Q2bjCpBZrC05iwYoy7H6+i
	AWnAJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d342dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:12:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bedacab1e0so24966185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768468340; x=1769073140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2NDP/EGkgTdQmx4cjpLRwc8p38qoVtAu2G7CGSyXyw=;
        b=iugHhzaiSN39Nl5XiTIn9z+niPWB+L0mxctk4ydHuTevsHXsGt82JXgG4So7DDPg9H
         kF10EhtFm/d5fBORvrdxNPjm+jGvUut5vCMDWV4TEODgcIHzwEoBKcffkKUpPrTVdWo6
         dsQwHK+mNPOsiHwMn3Dn8+1eoiXid/ikLHUw6HcflL4hgkqgHroobBzCHLht924ILroW
         iqe++wLY3xRVajzQwhyfy750tJ8q7W1cNMxGkpJ6+zvj7gFyAJ7RTgN1s11MthsQsX7a
         bJhkGd0lg6X3Vb82vp1VF4I7vJjUKEVAv3A8pSw7kfgGMSMpsLR6UE1qvadqsJyvYmf3
         9Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768468340; x=1769073140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2NDP/EGkgTdQmx4cjpLRwc8p38qoVtAu2G7CGSyXyw=;
        b=tTEETElwIf/RzjIjylCPGuiUwe8Dpo6K67E1rIOK+2A/Mo6Rx4YYFRPi4dAt54WdIM
         WOrNBb5EdgZlOLLNSn7zgKT+erBxJXjAWCzOAnYmQzZyUCPQTCwsc6705DG0FwKyGwM5
         NH14jX2/f7yN2OIOTPGaNRSmHmhkz8+pO3Wl5psShstWPCwlZAmuVXZCTJLDwGSIPlf5
         OkmJlzO2H8k3+jwx2RT32b7J2l0V4/pyweXwPdQDL3thdvA37HrKbpbEIipcOm5YeM6X
         uUmqUvJVddJqzsPazP66WS2ZmmSSNudzMZxiNKEp1cWPWYaKvE1jxKQJIhtlXxq6i7Y5
         GkxQ==
X-Gm-Message-State: AOJu0YwKENaHE3KcRGHQXAjAXiOHuuxCqHoQ+plxoyV24XUUVvobTuVd
	KEhraPy5dbLeWVuLfRs36R/qy5AeGv30cisadCcdoelGTSuP419fwyuuhwStJaJ+C9sv41gl2px
	u0gRJKkaeIvUgmNNKxoyatrLSJzLOQR1VspAXvh/IeJ+dn8cnA48JP1bsXtVhunIlVWEs
X-Gm-Gg: AY/fxX4B+nGnrLAjjJpGD45ufCJixfI7pT2Klz3DwVcnTCvy7o/pTNQVsImqlW/swrb
	XqasSu6A6V12M9JYqaaNoQnbuHdyuXYSv0SHHlYc7p4k3orckUPG+NwQEw/dVqxaCQL2t087MTP
	C6fuYFa6RXD/WTOOs1KHiFzeFV82ZBhFhWkNszmv9PxOyUURwEf3oMUckkcz6T+W39sT6s8hj8g
	Nw3E3WCLFJ70n6OVtuRIeNbHozoxWwG0mh1tXOjyp0nDu+83VviMSNb+gKUN8puEPD8pmBT3wrN
	SPMemoeOdMpqWQlHgM3ifVLnGBofbY586g+z6I8d9YgnCoRFKLlxGt722CNWhq2GX8b5e9GTE+s
	rEBxhpVvklhct6W93yr9JbY8rLiYqVXT9OAzWypsV0BZ7pNq54b78QPDiGfE1+LYtSPk=
X-Received: by 2002:a05:620a:c55:b0:8c3:9ae3:1a78 with SMTP id af79cd13be357-8c52fc117bdmr570866985a.11.1768468339837;
        Thu, 15 Jan 2026 01:12:19 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c3:9ae3:1a78 with SMTP id af79cd13be357-8c52fc117bdmr570864485a.11.1768468339393;
        Thu, 15 Jan 2026 01:12:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6541209cadfsm1972784a12.34.2026.01.15.01.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:12:18 -0800 (PST)
Message-ID: <63065e3d-70bf-4178-bd92-04c6ba1a1340@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:12:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] drm/msm/dp: fix HPD state status bit shift value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-1-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-1-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rBL_KK_Dk-ILxkNxUEvMiaBm9jekS6C5
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968af74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tINfiVESruKu4bDgj1EA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: rBL_KK_Dk-ILxkNxUEvMiaBm9jekS6C5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NCBTYWx0ZWRfX3K4VmNZRfqC/
 cmokxfXo8f0OnThgwDE+XqC2bXWbaJSB9/1HzGykogE3Es0d3FG9pxJzfLxg+8Ods95nWeEq3wA
 ugMLM6kFSA/rnO1mmZ3KiuotG35MlymkTHcES/InXSVCKHof47MESq/xImhsldIUC+10qB6ispJ
 IGLI4hHGKxjV80DbkTF5iGS6PlDc4le1sP9YZHJF1XIzVAAZMge6rM3LlUlGpicni2wtgmGYtLa
 8zDcNQfVlfTz65HGdZPCnUxgL3EqKFDuPzlrHRWFvbmY5Oglzev2zfY8d0a2k5BjaXPaDNToiKi
 rxFXvvKTq+VV4aNgT/lXbiuk99cnZCGA1mOj9HlS83q9jWOTTaw0nCCXWi7gdUdECcGwJBCoCGn
 j8ooh/fMPgiot6uWCFOBBdtkkxvQknrkTNUHWOhxk/Wk/IFCdaDMe8LW7q9W5KJcdQMSBVZcOnG
 HCTct8XQm+OrlS2qnkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150064

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The HPD state status is the 3 most significant bits, not 4 bits of the
> HPD_INT_STATUS register.

/me stares

BIT(28) is indeed not defined, at least on Hamoa.. Amazing luck things
worked..

> 
> Fix the bit shift macro so that the correct bits are returned in
> msm_dp_aux_is_link_connected().
> 
> Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 7c44d4e2cf13..3689642b7fc0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -68,8 +68,8 @@
>  #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
>  #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
>  #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
> -#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
> -#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
> +#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
> +#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)

This file could use some genmasking..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


