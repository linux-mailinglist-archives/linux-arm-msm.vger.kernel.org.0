Return-Path: <linux-arm-msm+bounces-70136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25FB2F580
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DDBEB60B59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08543054E3;
	Thu, 21 Aug 2025 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dovp1mlP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30235283153
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755772716; cv=none; b=WLnShHX3a0Tv4fx9YVtDVzkcVKjfBY75bjrntj6jlHut4sw3wl0fuOJC0JoRSLx7ew/UEGbZu+NwPNm5DMvsbmTmPWOAL7SYfYzNyIEn7/oKjwzL3rhq7R0+LeFq9QUN3bQDaL/W4Te7gcW7FClbnIKYfvGQ+XZu23bLVxrNug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755772716; c=relaxed/simple;
	bh=dhc4I/MlWDeDvIuwX9I961QDfZaUtY9V9+5sP5hirYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oscu3wT9s6BFmBLu4gFixFx2YGHWlsIe+95ONh9ctORu4+w5XzgvBHfIj+Wp2e5E50XtwiBhaQxH1DrhM4ovre0ppSndT5RJJ8EGv/QWOah9PKKOmCHwzGnH4x8LOkY/cX2NlGt3ovysPW8gZqKA2WGWNNaGbn1mklJjNIHZ4Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dovp1mlP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bH0U013278
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y7XbYhx/DiCJXD+gTIWE345l
	Gfy4pmmZ548BXwvRUTw=; b=dovp1mlPD4cNC3Eo8I/3/JPFWxnwtWzuHGFzGReP
	4yyMfStnGYB3KLM7sDMU1HunVcfcMIzh2RZ4oyV/cskgigggwyUwHrMydSrHgkxh
	FJZIQqENn6Pjn3XbOHVAu17QlENfPWJi77lyChxH3/Phz1BsXmSdztv9o5G7aWMP
	xqRaeBENaXCEKMYGiOeYLlhf81jEXPQsaV2an+8y2gWsvt/7ulINBK/QYNnPAQKV
	7Y6JMAGQFOV8XVW9wdorUH4025hY3ldFNtJkjR9kykEeaaSeXwPwwm87LR2wwu/p
	DMir5IvSKTxNdy101S8J+UMNu0C8Ce7xGjrah8wI4SRDfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dn1a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:38:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a928dc378so19626506d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755772712; x=1756377512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7XbYhx/DiCJXD+gTIWE345lGfy4pmmZ548BXwvRUTw=;
        b=BnVTcQJbxDuh/giS1zDz/A6aYINZYHRQv/evAGOq63Fsgy0nFIXrAT4B9+h2o0Ql4a
         qGrv4XoRTP7V5NBoLyHhcXl17Gk5uzoQ46/OKhsSkiHgGMZrg0HJHnoVCORbOhLGO0BP
         3EsjbzIzomQ1W63zTlAICVaPm18QdDMfaZjUlTeH/g1cwjuY59mCJc3VaWmQ1GZGsuJI
         1E8EQBgZjfM3wXYrtU1xXA/GJC7OwFPGaNPT1tDRHDAiF7vYDm3tbCdpzwf65LmUY3GZ
         nY3hwo6fiGvX4Pq0lugEqsgsOtQXHFdtArlElw9yn0iQ+Mq1lPTbvQtyhlEPFZQPz2IA
         b4kA==
X-Forwarded-Encrypted: i=1; AJvYcCWrfXFu7Mb5tRLspALe6fVsdv+IgE5q+GOZ5XJzNFscVv8BB4SrSgZm7GV4PsSI9JFJjdzRjigxnMXqymL2@vger.kernel.org
X-Gm-Message-State: AOJu0YyMf/za7dv/rBO+nBi2az7QUa7Y9E+6esjDLP54LAvp094FMpCA
	YFZ4SjEXPg/HvOZ5BBUCcTJHeeUJ/eybpuK9+V6nErbVA3KKKzpuD6ARwHz6E81RQqW7cv7Rerh
	/KvT5gXi0NTBtqCaSmuysppqxvEr2xiVu6EomtYvvGPKzAIyMSWoTndF4ktb2CkHUPMhy
X-Gm-Gg: ASbGnctCDl9YUp6MAeiBfw8P31+xdHav9Q7SpQeT0UdCzBEoRX7KwXly2BM2h/mC18J
	h8IFxc3EB/EMFYU1WBGR1lxlSL6ctM9I31wnMTLPOoJSi75gO1NfH7XxkrjIuc6rr1vCocgAfGD
	q1MZc19SqmM/nnivRp9M7qTDtfY8LPetMl+NCjFDgKfbyqhAE2jMLg4yXEZrNre4hnWWx3w+aI2
	H1FXGGnr7xxunmPENsMo6Hnu2CK+3pu680A1+KaE7zVLaDjWfs1tcsO1nYHBZmhFYxM/6N4sfYS
	doUkCKpPVehQpSjbO1fHP+pFZV0IBt4q2vxrD5ZJu9I6MABXzVQ+X1jwA0DjRB6kzEjjycqgTrm
	MAPTsEm6YntMjNSEOp9OkjeODbGH/TbnjypBhjvPCoHN4/wg58lNJ
X-Received: by 2002:ad4:5bac:0:b0:709:e65a:8ace with SMTP id 6a1803df08f44-70d88fc9219mr15034166d6.46.1755772712232;
        Thu, 21 Aug 2025 03:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH61ZKpxI75vebq18AslDQxb4qNuADPe87MuwfCz6Y1lEvwAi3O2ArZrJrJVYNRQ/jcIemWHw==
X-Received: by 2002:ad4:5bac:0:b0:709:e65a:8ace with SMTP id 6a1803df08f44-70d88fc9219mr15033976d6.46.1755772711837;
        Thu, 21 Aug 2025 03:38:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a6045b3sm34241381fa.39.2025.08.21.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:38:29 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:38:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: milos: Constify 'struct qcom_cc_desc'
Message-ID: <dv63p6laidz7aj4ruk347jqboqoiyekddgzqc7xb7n4ppvjkwy@rzdhicxf7phb>
References: <20250820124821.149141-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820124821.149141-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6S7MiZiaF06H
 LbYhsp5S8mTnf2KlhvGNQ4gJhoWtE4ZaBCUqRcC7YWoY256ELv7yy9crhUvVvtulJz8OhQePbeB
 Dej5CIOdiz3yf90t4YrMSZw+E0QiWgVGQdbkn+nUSdntXjciyVIhZjhVgKs0cp2T+EX1xHz13d5
 El94IAMOf+LZjiKGsvupG68RsWmQoXGXR9b4iF/IvarRCpxfQw0GcybFDFQZYauXfThDNn4CmtD
 iThZ+ieUP/6qViqlsb5QkXxQaGxX/x5JlbCVROAzEktYV4zDNcK3BycvkaI3Tc/8mHuEh2D4thy
 vOh9PhVC4SdoCtEOOzs8ZSAa3noO2hfiKeQj0VuD2UW7fVURzgmoWF0l2dMgmxrT2WNldoiZu3E
 e1L17sa/7C2XyVhkai3bstKPrz1JTw==
X-Proofpoint-ORIG-GUID: fMY2SHGd2Gm7ctY1ucey8lOCJ3zQ34cY
X-Proofpoint-GUID: fMY2SHGd2Gm7ctY1ucey8lOCJ3zQ34cY
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6f729 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 02:48:22PM +0200, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> My standard commit... I just keep repeating the same over and over
> again.
> ---
>  drivers/clk/qcom/camcc-milos.c   | 2 +-
>  drivers/clk/qcom/dispcc-milos.c  | 2 +-
>  drivers/clk/qcom/videocc-milos.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

