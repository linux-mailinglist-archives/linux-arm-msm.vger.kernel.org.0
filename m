Return-Path: <linux-arm-msm+bounces-84862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C6BCB1CE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 04:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5ABD30069B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 03:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B181242D60;
	Wed, 10 Dec 2025 03:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8FDRPqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuzXsAru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE71EBFF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 03:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765337981; cv=none; b=h99RcPKVv76djy6GKbsKBLkLUaQUiPlLZt5pwDRLzvwQ+wxGb2kC7lSU4UlzA4dTHhfrX9x+Pv2CVWl6oEO1ncV6GGy5oYqJK+B5ig83mCpUWomnknXEzg1phRsRfwYKaMqXuCplq7lt6SU2pcOrW6bFvskuYNU2MGaWkJDyzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765337981; c=relaxed/simple;
	bh=V+MNJ8JdvjpJpkxPopIbEPtHuBfcQJX3/DF6jcefC4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1+q3MMTVBHEdRHUoeTNOQFeKGxjiYMm1VtTCmCz+X06YHo7/4u0RtfI9ZqnRm57vecd4/DUlg3I7lhF371a6tpk6KoI21wJpC+nhn3T7qi3eD5PNq5u9p7hllyeCqGnoOZqlryljqj9Bt9EtS6Sjxrs4mFXBAoqQxE9BkoW8Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8FDRPqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuzXsAru; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LKSN683467
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 03:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JB2PlP5Aqs+wZaYQ8JcK0iiK
	DmXwgjam4xkJkbIky34=; b=n8FDRPqO7cDKRI6CEP4yam5nrsIfxU85j+PB+TIJ
	VkoIUODtsZGkulfv6TJTh9/xahP9ahHwFHQxP7tMkOCLYrLXLvLgSkHWCJyaytcP
	WRVitslYSAz1sd7aJ6Vq6uUpgVxcXpc2/L5MZGK4qnKZxGwUvNfLT/IxpWFyr65c
	2V0OHVd/Hvhr7pUj7kd1xQ+HlIzES9CXQYMu1Divz2zNUOEK1yUYl0yWb21r4pu3
	xVt0S9gdPx33SEMpaMBGea1N9UZ3BMbTZKNYo4ZWw/F5cPRjiG3QjMnTrTFtX7N8
	WS4kNcyfbdbg7PMeuOx3vsKCy/U8L7Yy6lURYWCEa63htw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axwbf0tyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 03:39:38 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55ad466ae47so577445e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 19:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765337978; x=1765942778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JB2PlP5Aqs+wZaYQ8JcK0iiKDmXwgjam4xkJkbIky34=;
        b=KuzXsArus3zaKXZ4fBtsEWZaia5KYXic1sFmZUZ1ydyE3JwgwzTQM9gotiYKVyi97P
         RwW+R9Q6vp8kmSaj1COtlSOqBNMoJmfSEoVI1IYSaQ8+Otodq11RBY+7Z5Oj1V/QVekY
         g32bkDLCLd9zCGWGRIKFMRWAodkmwLf0PLHJqf96PnqxrBUJjNUbOuZaJSRlKDIS7RSx
         ccNFof1bhRjteRnADKboIzRoV66v/fw87e4Z99PNxk3VWUDIIj2rA4aecn3/1mTBb+KX
         kMf+vneXgSo+vfjEgHJImqaR1hoCm3oqzMhAm7qH9vqyJ/72tpJ4BlkfF3P+AylOQ2IK
         yjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765337978; x=1765942778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JB2PlP5Aqs+wZaYQ8JcK0iiKDmXwgjam4xkJkbIky34=;
        b=f9I7VxmhhyAIJO06ysKXdTHNDSOxRSzHu7uW3CVSJps+9xDc6qlDj/e1CIQDO+wbCL
         QbVTTiKdP6OXRI4Q4YEgchisLIRekjxbdwGy6u84qNxIV4Qcm13Z2Gq6wHSF0I+ZVxfH
         D6skwBuhwhPlPT5h8X8z5QggA7E2Yxy9Xk5qpgkLr2yxOtDWyeP7F0xlkiDYLxnc2LQi
         GwUjsB1Pzlu6MRlfX1lJX9Uq5aSvcFwGRIYclt1bD8vUJ/xeAOP9oSKLPo+8SyfPWtsW
         9yAJArIkZjVAe8GSQRNzC80CItXJOdzLSpQctonr1KO250WHX4ZupXu3UpVAOQhSnAXf
         XkXw==
X-Forwarded-Encrypted: i=1; AJvYcCXzx5JMXKWMbAEl6T7SQ8quut6Fg/M4UorsBSoU2mzONAxBBfAH/kVteRoKxtqOAARWQHjkjyic1NvvDkD7@vger.kernel.org
X-Gm-Message-State: AOJu0YxBVLxeKJPtoCVoU/HCDBzT+CpT9u39aoFxSO8vr4m/ENZ5LzZy
	yFcjDvP7OU1epgEYtyzGu5Wujatqrd5+zUG9P6xq6bkKncOBjlNbOrzoGFfQ3HaNMjnOXFzr0+d
	kV0jRfep0fMBKdrnsq39dGkRf1l5kBmI2eKEjFUUaySNs1KxrnJ7OUEytXrm5lhK861sX
X-Gm-Gg: AY/fxX6Vrqo1joqWwW87lnNxKAWQl0ATVS4V1WFRCYV3heFQyRWTf7UYREV3SPRRf6A
	rbpSumkgfbBzf9yfD0lCKGG1Ate+/Y5uyDgCGyy3PbusfgrFoxnqQ4W/eBJuKWrIK5y69XAfQmt
	56rllS/H7hYCDPl1txLZTvqtGRYgAWiAGYr7ENIrSiDleePCNlqGB79dS+KnSM5NLlHW6LJjpnT
	zfkWY6NbWh0xFVVlFNGGglllVK8ZjPk6Mj22u/yzPVGbpGRcwsUPpUupMF3y9KgXZKlFGl1ml27
	zfONnfpWYEVSTOj8mO8ghkhIzKsFjwwjkwvataQ6O1V3KImDCUbW6l0xeedantsPL5uW5HQGixs
	Jbq7NL3GJp2yufR6gr+jT+VLh0hPh/6SlR4tFegekpiRm7j929ih9cKKQW1Z40p9mM8iTwjixaH
	nahWiNiO9pbr7gJgyLSb6eLNE=
X-Received: by 2002:a05:6122:182a:b0:54b:bea5:87ee with SMTP id 71dfb90a1353d-55fcfb42d77mr377994e0c.7.1765337977684;
        Tue, 09 Dec 2025 19:39:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWZD/79Nyc86hHBYRke306DSmwPKbdCS7KJXfExru+QCuL6W3GRx8RN0t24JcWq9J9N6zVCg==
X-Received: by 2002:a05:6122:182a:b0:54b:bea5:87ee with SMTP id 71dfb90a1353d-55fcfb42d77mr377988e0c.7.1765337977294;
        Tue, 09 Dec 2025 19:39:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70621ec7sm55347691fa.41.2025.12.09.19.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 19:39:35 -0800 (PST)
Date: Wed, 10 Dec 2025 05:39:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingweiz@qti.qualcomm.com,
        yijiyang@qti.qualcomm.com, yintang@qti.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Add WLAN node for
 Hamoa IoT EVK board
Message-ID: <tzaugy6vzlh7qv7zo3zhbjkyvodno436wkrwpm7gkmo2dmxu5v@2evb2qevndne>
References: <20251210032817.1264850-1-yingying.tang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210032817.1264850-1-yingying.tang@oss.qualcomm.com>
X-Proofpoint-GUID: pQB1AbgJTGpH0CWDXXB4KzxhipYPhmL8
X-Proofpoint-ORIG-GUID: pQB1AbgJTGpH0CWDXXB4KzxhipYPhmL8
X-Authority-Analysis: v=2.4 cv=f/dFxeyM c=1 sm=1 tr=0 ts=6938eb7a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IOcu9D5yMRbS1NPKWcMA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzMCBTYWx0ZWRfX8iu2eC3Wp6bf
 wQxBuO1TI2naXFY9IY0PFyNMSNfSTh2OeFkI41Rd7OqkcTo+aOgk/Y1edouNi8kJR2iNaXLf1pV
 VbIfqhRle3tgjVvw/ZSe0HiSv7o6Kyv9HhfZULSmQ9T22JYsrI7Csc9ULgLLaVcSjrjMjsrMGlZ
 o+QMu7tvw1jdQhB3Vh17Eow8/sAw2ae8k65pdIBfEcB4U9LkmqbfEqayTiGhqA3BVPp8CmLRiG3
 yWhFTw+tb28MC4U/PdoS++h2bCm9N0xGqLThX3xojbsf22e1IXQE70EnW1ugIY9XdmlGi30wVIB
 k7bUYJfvdrTGpk3szQqoWlR8x0GUiIpR3KW0DJ8NP9FW9UJGGrqKWan0hScOK+JQn+ArShFD+Uj
 X2GqfZPeyJFnAGex6Rh69WRIfp7mrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100030

On Wed, Dec 10, 2025 at 11:28:17AM +0800, Yingying Tang wrote:
> WLAN card is connected to PCIe4 on Hamoa IoT EVK board. Add WLAN node
> to support power sequence for this WLAN card.
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated commit message
> - Link to v1: https://lore.kernel.org/all/20251209115924.848165-1-yingying.tang@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

