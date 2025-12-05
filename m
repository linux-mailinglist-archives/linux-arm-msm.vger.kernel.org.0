Return-Path: <linux-arm-msm+bounces-84512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C90FCA94AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A73B3078384
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0171FCF41;
	Fri,  5 Dec 2025 20:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSBw23Lg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLHxo5hG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DFE1B0439
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764967606; cv=none; b=bOUvAWollaZRaxJkki0qyjaRy0DZmZ0/U+0Qt+SNBPuNUgI1dZcwMc6Rlu8aM+yBshNJHLg3RMo1s8c0Lif3ryvhR9EdII2q58ZelXskL+vXNOWmMK8HkM+QSLXYwWdGZ/OM6Qcoe1uykKzcqns6bmHQZnJtQRuDmG4s0xOkwP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764967606; c=relaxed/simple;
	bh=8ziz5TQHdnzit1ggklKeTA0lwLtqYJ+zsTWo5biHEXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijilxH7TXchMCOQ4LDeMdw3tu8SxsJt4fT1VmB0mlc0QOsyRkz8LUkxyEqMZUJ3jciFyOVmrTXzpXE0uc+c1KJcobkPOke5lX7V+iWXF96yjX+rpTJxgnzA53bJgyp6Az0zgoJQTV5DaKxXWX+MSurnIrgW+GdUVRp38vIBqiSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSBw23Lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLHxo5hG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBG9q1075457
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rvBnu6Ta93G7OrYfvzXO7t8f
	cURSD6pM2QuExUQXjbw=; b=mSBw23Lgl2KuLxHyd2k6l0pPXqc7DdlA8+Ibl0U6
	A4EyoW73D6UAglI0UfghzLaLAyIYsTpLKfQsRh9XaW3D/zIyH56eVK9VuBoyt4JS
	iQZkE5SLFkoJzg2qQ13XdzmVKTuM7ZcXSEeD09s/dhVDVZH7yBoWY6pADQGjrzaE
	sC0BtWh5vG+FsXJ5nzcl9ccVYGjtgXD7E+OJVx08f19ei2xIB3WfzaLb1SMQqBg8
	YLEh2h7PtxKUAyTsHne+98elPqJOkIX7KR1CVbBJQXqxGcahkNiXPS9Ln+qo6Yai
	LVXG3g8oStkBI9k90PBHHvyP45NJ0GiycCnwq4hVoQ+PLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngs61s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:46:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29da49583so714065485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764967604; x=1765572404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rvBnu6Ta93G7OrYfvzXO7t8fcURSD6pM2QuExUQXjbw=;
        b=FLHxo5hGai1gKfABTwmGb7rPM9f8dCcg3k0LvIaU0MsHaJCNg29JsHufKqDVjhdLT+
         CoCM5au/zRL0YgQauXZntc5ZQpdcUZPHzN9EoPj6ZMMC9KUbO3xXFsvjzovm9A84eXaH
         Vk+kTY2gnXq/3Bp/xob69AW71K4X34U3Zop34vaasw5KfuH7BEwpG9ICcWS8nJuevdE2
         PuFzGLZVXVUw2SKiDurOFWa2BFrci6waBHzTZsXZIQrNZhSaGkL57Y17qUS76SXT3H/D
         ejg3/Ek/MmQYdeGDJYhFZEgj+AhHaS9wkZiddQQ3pcEHjMP4XETYuZyioEV/5H1UeHHb
         leuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764967604; x=1765572404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvBnu6Ta93G7OrYfvzXO7t8fcURSD6pM2QuExUQXjbw=;
        b=B4/xLtWyumO9dIPcWwfOvoSt0PEU9feL5G85NG+kEk+OvpKm7ab2VAE76nR4xYhaB7
         kljmRNDN+Rl7Z2TZHSYvyglp7r2c5alCY0WK2UaVyn5SnNpy+XZTgWN7cFjuJ9rlC9Ik
         eNGX1jV6xHK1nh6QHhTypOBCS0XHV2+lfeUBQaa+mZA5vhTnWJHiYbf00lfvAfWam3kq
         DgNUIEuwMAxDpXkmTUQVNFFziAqN8k2pFWT4KiS+j7wZ5qSzFuuCwzq775SS78ljCcDL
         f1/gmuI0fMBwrZNhLlV3pHeNyuNmaB+W3McGSkI9sTq7Fo0lq/wV4U+HvJRAF77JLtus
         wBsw==
X-Forwarded-Encrypted: i=1; AJvYcCX5X016KxUzTk0pMJZnteyNKxuaPsQniGsLKW0SDFn9vg3JvIqQsULCWhQQl6IGG7mXAOyTeC1pKTx5+jSF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2g0wy8gHtDbRcC3vLI1Qxm4QMaYwFfmquvo7NdyPLfgMhP53L
	LU2GfEPbJbial5InHlab5LSOU9q1xj7K2jKe0J5R3JjwXTTfwvFm6eqVyD8SUvBT9mvNMdsWLeC
	FCSTpFj0YLlD1q2hzBdZcwOVe7YZ4lbuh6Yt8sEzPZcxEf8ve8bJhZsOVZqW3CNFrCXbj
X-Gm-Gg: ASbGncsb8jmpwNH0DyoEmOCr2KHWR9N2/Ra3zpgh/G4G+EBWdkVvs0yzgdnmVcdsqmN
	cTFuCzPzyjbp9tssNdPUP0wLWGyowN2w6MwZQPC57lwYswIwRMoCGmEZDP6fMoGtHz3Wt+X+YCU
	J8wrPLUWbKUSItCRMzdy05vpnox8wWZM7MJb3wAeHlV15iU0JQsoDnP1+eD6cZ0jBnucxfmdpUF
	un7gx726ndG2mC3TF/MoERj5IBFHXYDzKKcthzWb0hZJTif2AFnpZA45bjHLxMan3ElpqRbhOTI
	fGu7HVBQHP4YNLZhENeg5gYYg6rBl2B3samSSnLNTp1SqsZkIQVTQZhQsSd+oDEZ1XkJDnf6Vg6
	fb5xuKfkhC2oED5t0jU4oPVvMNJqz4U/wq+Eo80lnVfQGXgggVi9ZqOrKpbqskXbKt2SCv6ugQ9
	wjZZwMYMOV5yHZFEOx3qzY5Ks=
X-Received: by 2002:a05:620a:280c:b0:8a6:a566:60cc with SMTP id af79cd13be357-8b615f81d15mr1314587185a.33.1764967603679;
        Fri, 05 Dec 2025 12:46:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELetrdjc5iMqya/VsgkxiDLcwMoAF/X1N9KRnuXZaL/BQ8YnfqsONxTkvK50pwBnyJns8LOw==
X-Received: by 2002:a05:620a:280c:b0:8a6:a566:60cc with SMTP id af79cd13be357-8b615f81d15mr1314584085a.33.1764967603259;
        Fri, 05 Dec 2025 12:46:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c32692sm1783250e87.102.2025.12.05.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:46:42 -0800 (PST)
Date: Fri, 5 Dec 2025 22:46:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: longnoserob@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 placeholders and sort
Message-ID: <6xr43qpael72epkdagbna6k4ny2mhhnkw3gzyktutpam6tit62@43sj2oglnzyl>
References: <20251205-slpi-v3-0-a1320a074345@gmail.com>
 <20251205-slpi-v3-3-a1320a074345@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-slpi-v3-3-a1320a074345@gmail.com>
X-Proofpoint-ORIG-GUID: mJW2vIhkDahUa8uIAl-pQv5RkfFCLLJY
X-Proofpoint-GUID: mJW2vIhkDahUa8uIAl-pQv5RkfFCLLJY
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=693344b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kmiW5B8qSYufVaGmy2sA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NSBTYWx0ZWRfX75O3G050ozUz
 xj0YuAhCRPDk/FFkWsZnuFEDFMaJRpXbTWXLOlK5GHDW0RDYE39qPKnbgy92SPsXg9cTXyTuepA
 WrOrh393tzCAi4bHtbPDkjPSIxcYgegTuX9Q40oJ3AjKPmFO+8byqss1ZAf/lGfpk8eCdzMSfxa
 DHaGn9ZjOakSxyUA8Uk0OROczbx8BdSvDdgDMepx7Ri4eQPxkzfkhHC4cf+xRNtQGhI6p+FMVLD
 6hNvjNLMJaIoY+uFrEZu7TjgR48tauNHZmL1DoBiq68twuYg7eyOIVcYVIPXIwoKkOLqi1HY+AP
 O9GhzVct+sr0K3S55MvrBDN7RJOBRjXIqEDS4F6wqePNyIsjYZ9brSaTfsitvPUlfDTo/nqDfJS
 ubKuOAZTdC89jM9s/OTq71sdQxpphg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050155

On Fri, Dec 05, 2025 at 10:59:01PM +0900, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> We know these devices are present, most of them are supported by
> downstream and close to the mainline kernels.
> 
> This is very handy when rebasing the integration tree with the support.
> 
> No functional changes.
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> ---
>  .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 29 ++++++++++++++++------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

