Return-Path: <linux-arm-msm+bounces-56696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0ECAA86F7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D40A7A8FD7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038E31865EB;
	Sun,  4 May 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edt2AnNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773DE1EA73
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370285; cv=none; b=CcEuTITxPXbhHuZQYBiUDSK7BuCxWNifVlLz5KHd5WzTIyCohpXxFdk6nM61JUIJMNopSNeor6/SteXELS38BI225Osb9rqYrwCTvfHUS+JC24U4UxUwK3oM77FFS503bQ9oQUa0gEgiQ4LTyfCbGaRv2m5g/BeiMz1kcPvC8iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370285; c=relaxed/simple;
	bh=R5jUXMTEI4sATcODUwe7y6lMZm3PO8rLE2ZZrClw+x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8q26XC4/ZGfLayauwK1/E9SqW9BwAVBc+gaFxLhdn6sEfpb19G3zyY0hCwej/FuSAc+KeC5MW/IOZjyCg/SpLuFcvNdgrsTQ9SH3mgkxWpVxZGaOVMqogEE8bKXTdfZgt4KICCB+UOMIJqbwqMq6kau4UDnoMQeYixxCjcvKgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edt2AnNI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544CKHkP006836
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 14:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aT646PFGWgiTNKYSG2kvR0Vo
	KIDIZ8aJQYd5gcs1oaA=; b=edt2AnNIAJ0Ra7AZdI3qtTFlcPIYK49DvI3nwUxj
	ZrzksU50KjzPGvi7+nU5dsOJt2iuH80ubSQUGt8exz5vk4lAAN4lcRMlih9gkYDP
	KCQIDQF/PoEbWwHlsibEebllWcpsZNncvKL12oO+YIcg97crdkrwAMO6A+a5pNDh
	J6+KlXH9q2sf8awnXq2SqfPfug8LJMjdCMJo2pqQm17Im0WHqATsuXjJSro+27R9
	nWWoYqjSdXT08JhLBvHsjSfRJsFY/IB5M1G9frjsPEgoIJEJcM5cgjTxbn4vB4FT
	pjvJ7C9/RarfgGQmtcf1mIc1eKwI+kYOVhVKWz8tok7GSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsrknn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 14:51:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so951979485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 07:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370282; x=1746975082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT646PFGWgiTNKYSG2kvR0VoKIDIZ8aJQYd5gcs1oaA=;
        b=TCdo/OSCs1bhI3IqnOtah1WV95M5wR6n6pOqj9eqYajnO1rr16ykjX26dwfoEyHwYm
         a0Yq9X3jX6k2RLS4dTj6+uxYhWSd1kZmWmWNMclm8GWKsZTLJuohdqct0RBZC0j634HY
         H0kgfMBH+7jv3nbnwAFBgNyZrktJPSQW8+6FyF4tPNJvrdemnLCh5JebVqKNuf94JrGm
         01z8wmVF+1zDe+P4iu/88Q+KEA85ojTyVlCPTx343aOQZutHpUWk7HMj54R1xnv2sLKf
         QeFwhoWI1vOdoWvSKCKIXPlEQH0Us7+xTE8+PJm4DqulEPG6GkDPJ/nBXsFrUP3jG8KY
         hNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj/Ew3EAL4Cz8owHq9/j8QK1UnGjGRPokUVKWsqtEbf3KMPt8VM6bF3pBNqOhcP1KstbGVoMfDXKGxrlg9@vger.kernel.org
X-Gm-Message-State: AOJu0YzgszAbGdhifSDQ8qOLrFVyQh6OqqfljCaMp4JoPzvM47B0yW8P
	6uYz9qSTgJ47LXKcnLoxHG5Ee25bk/D6fQBR6Xj0bPfcsvgOKqc1z/zKqBOCKHFUK45iLQx/X41
	ufsobXYjR1GV1ov40b8gPbteunsy28oZT/wb+c0VsOJaqBiUN7puMYvM4S8OiAEpe
X-Gm-Gg: ASbGnctMiq314tIenBGm4prCV49gpzBsIwP8sqsSIKHpXvEPIgN/UYF6GBF6JfITzbP
	yzHlMQQPlKnuodPq5gIYucBQXxYNazy33JLEXXR3Pq5CkEFD56Jg/VhPwbrT48EDRfa2DNIKpnB
	Rr3IoLO2fmZFkz+PflMsy5RgPp3um8ozeIPupgS+w96ldw/ZUXi0GaBycCyxwzqma0u4yeAoy/S
	FzczlLKHLpoZLzfs4+NSyGcck6kwSWg8aFLL9lg42gAO7h5/vetE2yYujsU8+sKWx4u3XpQjrCT
	4rT3UT84DXUfsWS1S4G/2B5t2dLBNCI9kELCvfI8aEOw3IVorarynBxHm739R8/rNP+shc4iZGo
	=
X-Received: by 2002:a05:620a:4152:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7cae3afd94cmr506218285a.45.1746370282630;
        Sun, 04 May 2025 07:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2YEQcg+z4L/QH84IcQi6XWb1BR2SKyeknZAaEyykVIQte4w280JJ17Qto3urIA058pFmO3w==
X-Received: by 2002:a05:620a:4152:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7cae3afd94cmr506215885a.45.1746370282284;
        Sun, 04 May 2025 07:51:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029306833sm12338191fa.52.2025.05.04.07.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:51:21 -0700 (PDT)
Date: Sun, 4 May 2025 17:51:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dang Huynh <danct12@riseup.net>,
        Alexey Minnekhanov <alexey.min@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm660-lavender: Add missing USB
 phy supply
Message-ID: <jujiy7ij63lahrx2opj6kbotglsgbqjqrlcvwlnl2aprj5lbzp@p2tpx7uib6jf>
References: <20250504115120.1432282-1-alexeymin@postmarketos.org>
 <20250504115120.1432282-3-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504115120.1432282-3-alexeymin@postmarketos.org>
X-Proofpoint-GUID: 1vA8ajVqM3QymBYFibAAawuVyyFmlsL2
X-Proofpoint-ORIG-GUID: 1vA8ajVqM3QymBYFibAAawuVyyFmlsL2
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68177eeb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=uluJzZTdjp9Xle8A0wcA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDEzOCBTYWx0ZWRfX75N5u9CBOY4J
 YBuU+8PzOWZcCkVPP8TXdPevidOap4cgOXsfwEqg2pvTGoq4yNOirIvUOt2+sj7uLA+bDu51cHH
 NG0gwWs3WhJQCh3sK4e/0CKhBgmH+/82jJk7p2ksQIWgDnIiIJrQaCi6Nk0LA/W/q7SZy94NocL
 0IXwoJhXjz4DbeVP7vkMrQIBtRnMd8IZVLZ9lMilM00xXupDNpHXFeO/Svr9ymCHzhYXeWaVEA1
 bWzi0vu0vbdYXLJgUlCpc/i21NHknZ6uigzsklR1/tJtpCDz50IMO3SiaTAIPI2fTVmDfF6hHyb
 +KmHDUux6aQKww58t0zbPCQ4NlKDBtT6SMK+6iIfcKAiDOd766Ns+G8Q9amc6vDN5rt7PSGhfBy
 9elpD6IZ8UegeoIPgApFK/6hT9w9qU6eS9YfIxKdVF5kGUW0dbIW56DyDyhMDYxQVmCs+hLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=629 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040138

On Sun, May 04, 2025 at 02:51:19PM +0300, Alexey Minnekhanov wrote:
> Fixes the following dtbs check error:
> 
>  phy@c012000: 'vdda-pll-supply' is a required property
> 
> Fixes: e5d3e752b050e ("arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB")
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

