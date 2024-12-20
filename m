Return-Path: <linux-arm-msm+bounces-42965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759E9F9034
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19EAB188655D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1691C3F30;
	Fri, 20 Dec 2024 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ne/R+R9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A93D1C3314
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690513; cv=none; b=HokyHmkuXFgq841zXUem6az+JhEGCeRzFq24FSLC9C0EGQP8eyMk6NMlgwAsTiyKn8dGvJ4pewfbnYrRhT6XhmgfWrjDlROB35dHb9MC/SLHx369/DUvaQYI79XxgVOnjuQBUPe1yLQ6BB0oTxvyzmJWuYDjr1nIKw8hfYZ/Vco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690513; c=relaxed/simple;
	bh=1hjBVCcUS89gAYDyc+pvRL1kdXckem1XTkgZ8bCc7Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LB32050X0TDjFQP4y4xUQfBBvw6fZjwaY0ZFmOAvWuxengPBa2MU+OJEgB1Rj3FEemgo/IBcxHXTXfReQKGpzTIqbcj10VJSeoQHVeFsnxNg7+6relBFXUSnna0BqMeyoLKNFSbhwbAyMFvyILOk8tyn0uPJVpyLuxW4hoSsGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ne/R+R9T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7LqW6028658
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjQWa0qd5X0wQZSFo1zpsnnF4GInUf2OufuV4F6Rxo8=; b=Ne/R+R9TGe/rAt4I
	8gdnZL4m4HNlcU9vDI6/Ao4tHqnlb540+ToYBxs5hqao/bIZXxtmuLi5jLVgOsqH
	YnqhlXYHA6bpYaoTbceHUL1MLjfefiRnkOJ5HBKPge0auYoohHSYCyIcqwtShuBU
	E3k4gKG4QLblChNktt38+wVswowx9ZTTvnNu5tEeIS3dNN3JCA33xXSZHC1XMjLR
	Npg2MrdhWwHspL+aWMjdQrGvqLRAQuDKdHvt7kkZJKWwRd9g7LFyQH8Za+TgqkC5
	uyktPWL1XzB5iN6iCZQ4arfaQURLuOa05BhtvNfwte4/ijFLL+j/lB0QOGAjKUz4
	3e/Ccg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44hrh7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 10:28:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679d6f9587so4597581cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 02:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690509; x=1735295309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjQWa0qd5X0wQZSFo1zpsnnF4GInUf2OufuV4F6Rxo8=;
        b=EtJ7zx0VyvLoHGL+bMrtgN+FqqsMPwQHdTA8NSjdW24c3nAgIJNgEMKMVnyg7fulpB
         Vn2x56Gr9rYQ5l1el+v4lHjD74+K/mxiy0ulN7rMx8brnW2hCIyOBI1WSYo51Pyx8zYc
         XNZTx9ezVarMxljDIUAI/9O+n5dcqSOkQFGVeNxEZFqKZa0lXIrbE24jcpmIKGb1DuLA
         pQJyLTdiBsu0KGmIACq8sDOYie37szxH7j7Y9ztjvow/CGi0e58o2eQu/GvEtaVDTnag
         RJHeZbbc/MlevqdRv/l6qSRk3R2dTPYQCLkb+WuJrYruAnl9+BXC8/ra9/YP+DPZzyqe
         WaPw==
X-Forwarded-Encrypted: i=1; AJvYcCUmi7nbnqeVghwF1SnGgaIQfSFTF/xnvCYVIxuMucrXxG6YYy8zdAjaM7pIooJOwUWhO+k0SnPqrJJsNOQW@vger.kernel.org
X-Gm-Message-State: AOJu0YxCUDfoZ5CbVlRShzqA6R90NymK1YGX/Zrffbxu6AiD4gZgK8fD
	SjDcrKKYNdYlMGpr724xb1Q/wMONdSRdjNgdDRKA1FkSURplC4wX6Tkm5Qi6ar3uUGJLXhEU8Gd
	orBrJ2sdoD68gHlQiAllr68v9By9kTFTX9kk4fix0HaFKIEjkPP40v5K9+63Z9AFl
X-Gm-Gg: ASbGncuGYvGDcnZbTIAvFvtnMdNnejRXnPCYEfxVME9StOA+bds0MysmfdyOT6dCqWB
	508en7IucCJ6kSs3RD4NdlzSpFLFd+8lYcLuwpYHcywy5K5hoE4ekrIWOjCLB+nnIUJX24PSo+4
	Es19EJUXCkkFNnqn1cJuunUYv+cTdC+U6zcHfLXkiSUixfJPLIK9q4fvaHZ1MKlMBYGCfWsnwa+
	AJ7I+R6iRs3S5LE+yorao0zuc7sQ+lhNiMiYnCIBcxzwygtUmCigrS6H6ymMQ7AMUGnBQ7dBNl9
	UV+kRRXSGeIiavq2h2s0KKE40js1PtP3czM=
X-Received: by 2002:a05:622a:4e:b0:469:dcc0:9b23 with SMTP id d75a77b69052e-46a4a9a3eecmr15332221cf.13.1734690509594;
        Fri, 20 Dec 2024 02:28:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMtjaKvTFUsh9ZDwXASae8DAiBKh90dcboQDUxU8iSgVq6zGvdYVzXhh/z0oYYZdIkXxgu7Q==
X-Received: by 2002:a05:622a:4e:b0:469:dcc0:9b23 with SMTP id d75a77b69052e-46a4a9a3eecmr15332111cf.13.1734690509230;
        Fri, 20 Dec 2024 02:28:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06cf19sm160882366b.198.2024.12.20.02.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:28:28 -0800 (PST)
Message-ID: <0f5f07f8-dc6a-4162-b9b4-82e40b9ca526@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 11:28:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm6350: Add missing parent_map for two
 clocks
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
 <e909ac59-b2d6-4626-8d4e-8279a691f98a@oss.qualcomm.com>
 <D6GGBPC4V5XV.YU8Z2KASBH07@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D6GGBPC4V5XV.YU8Z2KASBH07@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dnKh4eTiSi9MDh5wMsbxXcWB0deHcr0W
X-Proofpoint-ORIG-GUID: dnKh4eTiSi9MDh5wMsbxXcWB0deHcr0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=987 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200086

On 20.12.2024 11:21 AM, Luca Weiss wrote:
> On Fri Dec 20, 2024 at 10:42 AM CET, Konrad Dybcio wrote:
>> On 20.12.2024 10:03 AM, Luca Weiss wrote:
>>> If a clk_rcg2 has a parent, it should also have parent_map defined,
>>
>>                       ^
>>                         freq_tbl
> 
> I was basing this on that part of the clk-rcg2.c, so for every parent
> there also needs to be a parent_map specified.
> 
>     int num_parents = clk_hw_get_num_parents(hw);
>     [...]
>     for (i = 0; i < num_parents; i++)
>         if (cfg == rcg->parent_map[i].cfg)
>             [...]
> 
> Should I still change the commit message? I guess there's no clk_rcg2
> without a parent at all?
> 
> I guess I could reword it like that also or something?
> 
>   A clk_rcg2 needs to have a parent_map entry for every parent it has,
>   otherwise [...]
> 
> Regards
> Luca

Okay I suppose it's fine as-is

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

