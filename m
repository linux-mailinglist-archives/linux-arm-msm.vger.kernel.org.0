Return-Path: <linux-arm-msm+bounces-71601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B675B400CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBA567B9A84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A41258ECA;
	Tue,  2 Sep 2025 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fg0v34Qe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D93258CE5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816563; cv=none; b=TcDujrfhDe0Dyuw3K3MznISgRjAlriScoQ7h+wlAI3RpBBLKI+gzUHkcQ/JGc4bUQe/3tCkcdwVBD6sWJ4qUdjpAPPx34RLv8zEpl1YaSC4nuqmEGyrbU5y2oRkrWIe71Q++OejW5Mdbua2XfE1rRQpO5CMqeadXzB4YJHgJX6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816563; c=relaxed/simple;
	bh=3awv6U4/xXS9ndF1y7siUavi5LFFCkIU3jbXd69usVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQzanTdD7jdQxgA6OC1tNxeIb33XsBSA+ijdWAgedz9yelydtgISaL3xpMFBnouRDrC+ytnckbkSAyJ5k3TcK8uSRck62K8Hfk/fIQsiKZEJ0Rrcfm+PzxOPJWEBiP2bOdP+Rabg0DseE1tiL4ii8FR2+jGPLaLc6wWRfGzdXZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fg0v34Qe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BMtG1020623
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ILiX1Kte1Zc25Jd6RLaKwW+X
	3sQ2KmSi7ISWDpWCZuk=; b=fg0v34QeKa8PlKiA8AmqgJc28GgFG57beSxyadVE
	Ouo7snmBxZhCd09165t5Guo7+2q2SlK74wL4OFgCoSP8dMpT+9kylrWKouLpe1Ed
	Aqr/9iNaXc0NB9a5p9k66CcM5bIC/9erA4LC9s6I4pzuvcBVZE4vSjIJ8v7ZH9s2
	gAH4swQn0EEEUglXDerpFaAUsqMS+3MviJn1eY939x0l4aowwrjVrgA5+BI1vK4N
	H/aEFCsu5aofmSL3ewAVf28ATrWHyv5K9lJCYfo/iwWL3XJO40lxGFqlW1M8RHW+
	1g3BxCZykbwGPNXB1q/+cHydivt3sW9jSMuVHhLZ+OKRvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryuu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:36:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b29cdc7417so103606611cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816559; x=1757421359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILiX1Kte1Zc25Jd6RLaKwW+X3sQ2KmSi7ISWDpWCZuk=;
        b=nIs6kj5Stg5ULrxYCg1cR6SDAwLS400OCl+MymWY/bOPocEeYP0gjInPn9TSOFL2j+
         mNwkpzp9I4P45SdkTf6GArhhI5uxVItvKwpC2xW34wZr4pcjBcxfwehqzU6Qh9E35T60
         ywp0627+EcQfTAhOVCaK1Ei84GyorEzY3lIkZCLVFA2ybeteKTMcUxiU3yeDWQjb7XoW
         QXSad/yxI+Ue+b0Vgl+grLL0PTYfm7gqUFo4B1tFaxtkSt4j+WixdxUVe9GWvE0LtyDZ
         ZON2ygYNjPjEvTA/6CljmNz5nldEx9J0sKG1JgEsEZG0nfvu05G59HN5LGDeZ6nZOuGR
         OMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiHcogcXjFAiFNSx/U+qjOqiOx04BPRtfXerOAUDufPbptcpDUQDJiqEPd4xN8XtilNKmBEhOVS1K5Jr47@vger.kernel.org
X-Gm-Message-State: AOJu0YziXy6LkqfQpez12a/gwLDwcnbRlDEdnJhOx5x9bAiYB0hW9isD
	nk9v9qm1Ahq7iehus2tTJVWU3F6ArhLhlhkAcjms0nIq339Jzy8jz/qwrGhomxIefH1miCykASI
	kmKFG4meUDX1WehEKTtlPfRwejeg811UWJOaDuQVSObPj0TYRLOtvZ6yg3k+RosPODFIe
X-Gm-Gg: ASbGnctB7p0asZXUbiRwwBFEgRu9JFeZ+D18DFnPJ/UCmvoXaiP/Y0vfqtDi3+maKVY
	IfxK97JjhHxQbcvAyYukvztF2dY/jLjgVyBisuzbUsED0R7sujUD4uD3epIWAeUTaHcZ/M2Z631
	QTKGWJz2OhSHejxEIYHhd/m4hWpy0lh9uyv8ypjRTZtGjTfBFv++2FMya8XB+J8y+/zpoisQY7J
	oUJWChKUZCcn92Or1VfLwGI1kDOmKQG9mAbMVZsUp3RM0rIFMaZGyKnqRdYwGv7zVDLkDtbE1WB
	RJqpHhtKqnirDRPyqZfTZlkLMwZEvZnZ+hmebDMhw+Q7g+E2E4hMa7y5WsJrEKVASvSAkT3uMhE
	zAWGH2lfh3IeCnqaSVzVLkKt9wCMNKW8n4IBS5jMwOH3ZYJ8JX0UZ
X-Received: by 2002:a05:622a:2cd:b0:4b3:81b:c5ac with SMTP id d75a77b69052e-4b31d85d5camr129761281cf.24.1756816559355;
        Tue, 02 Sep 2025 05:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvKP2rcrShFJTSAgCxbP+O5cx19CegSGWpv0b+ec33ky1+7ucp/wBQW9HOyyPTSs0QsJn7tw==
X-Received: by 2002:a05:622a:2cd:b0:4b3:81b:c5ac with SMTP id d75a77b69052e-4b31d85d5camr129760761cf.24.1756816558669;
        Tue, 02 Sep 2025 05:35:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56084bd2803sm317462e87.64.2025.09.02.05.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:35:56 -0700 (PDT)
Date: Tue, 2 Sep 2025 15:35:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
Message-ID: <uhjhgutnur3qjbmqhpjgg3dnsryf6glm56szwy6iys5ffuijsv@ld23wny4s2fx>
References: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX6mkI3LPGW1xN
 abLK0ZNIPHx6gmP71SBI3puL5iojTU/aHgEVcDEr0UP5SmoZXE0aOdjmGSHaDIb/VCuAA+z/v3O
 doTJTP7Xl7LkSS4kKyNJqrVuU4W3egen891PhfbSrqLNvMy/CdkG54zJzk2QWXqeMG3urlX/CuT
 cAYyDEsEUM2n+117NuutEc0NrXWNlLzhX5MfJrdC0lBR0NB81enxGlb7iC/62fITHBanPvS4qIs
 40WNo9ViKUcoHKbKLssSYHMo7gnmxCTanfqNYL/xga/87ibgXrLq0rDoEHtLkQIqN2uU/b8MMAM
 MaxOi9ZNNTZ0MaPHhVwEexhoZZHSk/GBi46u1w8L44WG80VmQSvyEdavLEQzqzp07wqQpZ16ddx
 euu6xBvZ
X-Proofpoint-GUID: JVat6Vhkls4zbhGkdwTccOsNXFsz5SEp
X-Proofpoint-ORIG-GUID: JVat6Vhkls4zbhGkdwTccOsNXFsz5SEp
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6e4b0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=GxmfVdM8WKu4Uw088-MA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Tue, Sep 02, 2025 at 02:17:54PM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock
> controller driver") adds the config QCS_DISPCC_615, which selects the
> non-existing config QCM_GCC_615. Probably, this is just a three-letter
> abbreviation mix-up here, though. There is a config named QCS_GCC_615,
> and the related config QCS_CAMCC_615 selects that config.
> 
> Fix the typo and use the intended config name in the select command.
> 
> Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

