Return-Path: <linux-arm-msm+bounces-42966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B39F903A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C2921896839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDA41C4A34;
	Fri, 20 Dec 2024 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmjlEI1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F91C3F06
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690522; cv=none; b=LMDdoxeVPlcz7mTru3JBJ0zFzMFySzBLhTccvr+7WBrOZzk0EIQaP5P1KDpsMH+FKpzQO0/NVfrHI710i4n/n45YFXPb5hp0mDDT5dzoFlIug7Vfp91naRrgEEmktHxG89ECsikRraB/JJEB62O7YX6KHU4URT7pQE3X9v5+iYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690522; c=relaxed/simple;
	bh=5QWr8KiK0fqKJ2BcZIva5mJXwGTB/TaTgOD7YAkLkD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZLIeMtjFUMETZTb7hUsbNJeB3cTUrpHG/7Ilukjgzxo2fc07B3ncw7PZWjrwNml2V/387IS32HPTjOfCRdlr0gQIyyaJ0ZGuPa+jPN1lN3ah2oxCeYaeKlgcYU46ue4CZEnp/HulvcXtTz/hoqK31K6qeqXegfluBtEcJfDcGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmjlEI1/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK4PVIh024575
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0LK1w8USgsUPXw9o6UhgF0/OBJgHQXzHotizFN7BT0=; b=gmjlEI1/IWZYvFCS
	s2TrItx7xzF4NNTQ0SUQ1wQ/ICLkdu/xm/bxSapsBQD71mfrEcndIp7m4uIVh/4b
	1fVL4GhNLbB3x6Kbryt3Rdj88zz8yX+wfNE3LbkiEqEt1kjqX0tAS1xj0ux6dEWl
	DeUUDBJH5smvKi6iBsGfHNoq+5G5L6vGnKCWGam03vdkVNNWI+6mWMV2hI1sV9YI
	xsGRzmhKvYXsSwWQJjp8gT/zI26VDx5HCwGa9ZkO0HRttABgXHyiuw0EmwnnBKL3
	4/8E/UOQ4AgG0gDl8eFtN/Zu4SZDvVQjgvQMSz1QjAGGN4n3UceCg3R+g+7mkMZK
	Fx4jLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n1hx0x10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:28:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679d6f9587so4597991cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690519; x=1735295319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0LK1w8USgsUPXw9o6UhgF0/OBJgHQXzHotizFN7BT0=;
        b=LlHjW3WeUFGsc13Xp3lnRiZJVgjsmBmWhH0+V5dkz23DOl82jEFuJlb1XNA52ebOuo
         bXN6ieDREgD3Ur0NOvx/IDxU7cwwYPFAdyRwrTpx8G9ottXKC8Fubtl4xN17JSgFSVFC
         6VgafDrm0OX1J/P1c1V0QuqPlExH/injE0YrvPse7kd2ODI8DA6/lq4RXNCIvnbVOC8J
         doodW+VDusS1h2a8pLvMvo3kGPBDuCOIOwQGKasKPl9s1ZUSCeW1RPyWUU0CCmHYaY7u
         jxlMVvbu6+ANOMMBvGWiztCxUYQvWStT916DRFrxLbctT96n0x1dBg/a316PWV9L/HZp
         ghsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqIXtiLyn9u7B8usiHqc58RNs7nrvEr+lO4iXyyFVPasU+/gIVBEE4hkKk5hzcE6KgVdZsutOc1TJYELCN@vger.kernel.org
X-Gm-Message-State: AOJu0YwtdluNc47it+kNPH1ANaoSZfK106tn3EtHSYzwLLtVDfnMPoGW
	s/TqKlaZQAsL02kZ1LDMl68Ohj8oevXPNHdtZgVJoJCIkFjPLK0HWzCUmJ9jTV0cWqwVfXIOVw7
	T07WQ472qSbN6mhHSH++4E8Ldi/GBzsRiNQvXRHawlrjQqG9xENAfbWvAUlN30cmt
X-Gm-Gg: ASbGncuffZiFdMXavAuFqwM8s/w1Ej6vmWcIiNFGNZ1LRgC/essCussE26lItqK6JH7
	ODWpF5uJ4m39KEkcmfuYncIR3iX2iXwcoFVntRau1U73D02dUZVzOAwOWajza7h9SAymyAGiGJ9
	WB0/j8SybcNZrg1j8pDwULjBV277BviFq5l0R/r7RzetoUpYVT0n9JfefKle6b/bz/llIvGTysp
	ltrPLaA6g358343r2xA4uoZcs0H0n9zRwXIGeQMdSPOxs+uRi/B/ZYsoQJBmboe2GMeYRkdnQtm
	0ThprNr6O8p9aStoB3f0C3Xg7u2lVaZMvU8=
X-Received: by 2002:ac8:5f93:0:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46a4a9785cdmr14547601cf.10.1734690518994;
        Fri, 20 Dec 2024 02:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEnO9AJSDDgOGm3ytySndEK+tdE7dRdZ3crkt+on5jmDGWI0kAK+1MGayLMPEHLC1GlL8+sQ==
X-Received: by 2002:ac8:5f93:0:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46a4a9785cdmr14547501cf.10.1734690518633;
        Fri, 20 Dec 2024 02:28:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae4345sm160775866b.84.2024.12.20.02.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:28:38 -0800 (PST)
Message-ID: <6220744e-8e62-475f-a1a3-3b7c2c888b3b@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 11:28:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm6350: Add missing parent_map for
 a clock
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9itA3FM5O2A7jpkNRie5tiQID9yVMo28
X-Proofpoint-ORIG-GUID: 9itA3FM5O2A7jpkNRie5tiQID9yVMo28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200086

On 20.12.2024 10:03 AM, Luca Weiss wrote:
> If a clk_rcg2 has a parent, it should also have parent_map defined,
> otherwise we'll get a NULL pointer dereference when calling clk_set_rate
> like the following:
> 
>   [    3.388105] Call trace:
>   [    3.390664]  qcom_find_src_index+0x3c/0x70 (P)
>   [    3.395301]  qcom_find_src_index+0x1c/0x70 (L)
>   [    3.399934]  _freq_tbl_determine_rate+0x48/0x100
>   [    3.404753]  clk_rcg2_determine_rate+0x1c/0x28
>   [    3.409387]  clk_core_determine_round_nolock+0x58/0xe4
>   [    3.421414]  clk_core_round_rate_nolock+0x48/0xfc
>   [    3.432974]  clk_core_round_rate_nolock+0xd0/0xfc
>   [    3.444483]  clk_core_set_rate_nolock+0x8c/0x300
>   [    3.455886]  clk_set_rate+0x38/0x14c
> 
> Add the parent_map property for the clock where it's missing and also
> un-inline the parent_data as well to keep the matching parent_map and
> parent_data together.
> 
> Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

