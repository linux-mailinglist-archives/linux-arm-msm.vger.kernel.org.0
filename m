Return-Path: <linux-arm-msm+bounces-70454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55829B32224
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 20:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E44DAB68234
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 18:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B1B2BE039;
	Fri, 22 Aug 2025 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okVGphik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2322BDC23
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755886414; cv=none; b=Vvb4ptVFoA5WVSJwzXi9JF8J7+uEfoIr5FISljG+GNtbmCcnL7Okk8isUK54CNndPD1VnXGWPnNuJi9zWazkgiPZJUlqtmH+iwrYAHq2Ph6ivmOgS9IVB1YF9C4XzsoYfgNCvL26qvJIAsYmHCQlZfXgGeiGjDfJ5OzFDChbEpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755886414; c=relaxed/simple;
	bh=OsSWM5rafowFUmYpNuV9JqMJVXfG7U6c2e6naLYaZ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhvszh+Jxbu7Q5kBv4FAxHtlKPxjY7swTHR8aLoZiIXBXEhodgI2YMeZZu2zs24a9tULGnLqkiRC2gs7jAv2znht2s8tNhlYE9dZPt/eAgNyfG6f3IIBLtvcsh/dO6CCzU9kIa72pK94QvDN9+JsYS7kerMkT/GDiQZHnClB4V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okVGphik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHUhQ6018145
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dSO+6ftuDsb8o5P/S7crWg+c
	tsTiUDkNMjVkpDX34wo=; b=okVGphikPj7NyIg2pKsu8klAXo8PB5IQDnuSM7kh
	HvPvnLXHjcd48MnHikgSXdd1KttVCUhl0VU7YRm2yHlUp1Oqc1p4RRBxh/KtlCM4
	feUMxx4mnnuCy3RkXkbZSQyN+lMg2sJMNzlCv8MC8ctaVcqrHPzWG6JUvZIlYkgX
	8U6pSTrrAaBPZOvOZkzsqgUH5H10RaOpNEmLND5CkZ2Bw6eHzBenXZxrogcz+xj/
	uUs1Fn55cAK4HNcLzP0jFPn6KJYjTKNNX0kBY8YQuDItjZaiTxgvpFps3ImkYWd4
	8bqjG2pq7eFmv05rSuVuo0pf5d8Tep4jUBITagqi+0XYfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw10g4gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 18:13:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109919a51so107738021cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755886411; x=1756491211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSO+6ftuDsb8o5P/S7crWg+ctsTiUDkNMjVkpDX34wo=;
        b=ktA6I+evj2THQm14e1r1EWTcx2nEa/mi27M0EU8F5udeOW4/N7snN1VIMeCuXaZkin
         +zkojaRH9JGz3L5t2IGslBWqk8Q8HSnTgYXfGUUjY/qq/JfEfYnocMX9p8FSseg20HDJ
         doCNiv1qHCeCID3Okco7ssu1wlFS779Fydnipy66dYfLOj6kgGqMOxLtzTVVtcx40HiL
         jyAUFI5Z+FVgeL1iD2lOAwK4RmwX33r9LHp/t+qQRi6D2w2t+JSSkOeGEJPb0EUBJdeX
         aTTACR2u/cjm8jzz8IdnmsP7eEyt7WwlhHV+olfIWZN88fDir/QElFOMRoPNLn2tBoPt
         cZsw==
X-Forwarded-Encrypted: i=1; AJvYcCWl3qYTsssbN9cwbQ3yylaHi8ghFtj8YYbcdNxakjKim7JfbkZhlJsTfjGWYb+Zy2Oci/GAob3ET2qysE2N@vger.kernel.org
X-Gm-Message-State: AOJu0YyOpYGSS+xDhT9N+ixoaFWnxpMQdC44BbRohYAbe8f1WgmS63FW
	+zQfulxxCRC6JPkSvB6fdOoqPSPVskvkUToAQdBEGxagOb4FcDetkYLI5MX7gC66dm/KY55s9DL
	Ebmfmu/+hH+4AAk2Q8/gxqJozCEAKPvvg9yWorw/g7oBPecDnsKlZNSPu7goycoleDwS3
X-Gm-Gg: ASbGncuaDan41Yz7FIZ6xIMINiwofuRVKx6bHzS6S/2Fn1ZVPM5JVjdBYOabfBfPqYR
	M+7cS8Nr6PFG7DFvqDp4TpsNizVb9zLsci97h98GiSxRqBXEsVZVKN6U+a/KyA07gZLTNLz/hnS
	dNNJa0aC6h2wILyOTGPrQaythlgJhTtpaynGdOFNlfI0PpRxy6vW39FmXVoJgoaSslzmffvDP+i
	rwzgkyj2+3reI1oIO0zoNFCsT09UrBwRAcDczV/t2q6Qs+p1doCxvFcFwKrkb+Hfqt7ixAOZLai
	c4QZDhCZGBujQPrz54sWuL6kqltt0eCQw4dVyehGsaKHXAvMeVV5OlFaSvzDb44LJ5uq0W5N0UD
	1IT4g+syOnLzz9YXI7y+KYioh0gsIqTPCrfQfVv8Fjtn07sXUdzda
X-Received: by 2002:ac8:584d:0:b0:4b2:83d8:4e19 with SMTP id d75a77b69052e-4b2aab2f2b4mr47540161cf.67.1755886411355;
        Fri, 22 Aug 2025 11:13:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgl6Rb3LPZBdGK6f5eEI93UymhJjbrLRHxUSpKaWOlHOwLwB0Hqe7KQvriMM2BunTVfmUN0w==
X-Received: by 2002:ac8:584d:0:b0:4b2:83d8:4e19 with SMTP id d75a77b69052e-4b2aab2f2b4mr47539671cf.67.1755886410756;
        Fri, 22 Aug 2025 11:13:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e23df6csm691821fa.21.2025.08.22.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:13:30 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:13:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] arm64: dts: qcom: Set up 4-lane DP for sm8[56]50
 & x1e boards
Message-ID: <yf5bw6hesd2vpvum77zprr27oyedaglhafumx5netfqzxcy3cg@2r3l5w3ddns7>
References: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
X-Proofpoint-ORIG-GUID: AaUoP6dP7dLONyRitYxmeo58VW_Q2dSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfXwvgl+TNbXpl8
 KOLp7bnujG53ED5pB1kmCNf4FXvKD92BgbvjlwZHRQIB1UbpXUgoUPVfAjnp8Fz99ycXfjzu2Qu
 /pgSFXQVWH2RWCz9wSR93lKanOdwX3axRa7dFBLfjGk1KnLWFHBkx7ntusFMd+iyoHVUTVGvZmE
 V9KIW2UU+YXdTyeUlQzqrhnn7jrLIPvVASv4UpycW6xmll0S0ocUhZKYnQyvz1Z+m+HqnIw0Bix
 OWjbwfKDefpl2e+yVPciD7x/aWTr17rTifS9KX6Gj2g65mNOmYgI+hIjAoLrKncOp521HRZCI78
 EbumYm8Q14EqjjLLGe0EjZxRdbt89kMPdMFBDt/5d1aQ1rRgx9xh/HVlt4gf20f/p18siMLy8dt
 2K8HO3l5
X-Proofpoint-GUID: AaUoP6dP7dLONyRitYxmeo58VW_Q2dSH
X-Authority-Analysis: v=2.4 cv=B4G50PtM c=1 sm=1 tr=0 ts=68a8b34c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=i8zRFognpsdf2JTOJ_QA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160

On Fri, Aug 22, 2025 at 05:56:48PM +0200, Neil Armstrong wrote:
> Now the 4lanes support in the QMP Combo PHY has been merged in [1],
> add the required plumbing in DT.
> 
> [1] https://lore.kernel.org/all/20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v3:
> - Move the data-lanes in the SoC dtsi, and update it there
> - Link to v2: https://lore.kernel.org/r/20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org
> 
> Changes in v2:
> - Add missing x1-asus-zenbook-a14 & x1-crd
> - Link to v1: https://lore.kernel.org/r/20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks!

-- 
With best wishes
Dmitry

