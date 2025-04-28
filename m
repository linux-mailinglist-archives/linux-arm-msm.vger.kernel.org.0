Return-Path: <linux-arm-msm+bounces-55937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD4A9F78F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 19:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88AA65A2110
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 17:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70C827A911;
	Mon, 28 Apr 2025 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRn34Tw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCAA294A1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861967; cv=none; b=Gf2DP43NvxfxwmZjIuZyb4BoySwXVTQw05v3oCDA4CZN3JQN8NeFgaFCuTvTpFDZubuXYH9tNLPJkcfjZr7bc4r44IRdeV5W2PEDK4ypZ6yIybO/xsNExrlnGRwV2KzppfeosGhnR4jwtYABRBr1gyPG80HH/Q9uhKLUQC4ZSxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861967; c=relaxed/simple;
	bh=rMdgH1z5b0XG645DmwX7UvsPvQa6FdO63A/yWAGC49A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGFsQ5TWHC9fvYiv2VHHvLEMR7VBEpyQqO3SZQ6Es1YxMfZ+79JO4j7hb0DJjxQ74YqsBATEyjmGH59nt7Xx3O7MojMYDgUp3RcsX+WVF0hwElP002FbE5iL2QGQhYdWSaWS7umvOx7dqk50ZsXk6Ur67UQexZ6Z8u/s0f01WI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRn34Tw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9Wmgo009160
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mI/HiKaz9KZWlPThwibrKI2Qv9tQ/yegSAkRcgBvHnw=; b=XRn34Tw6gst9RdeJ
	WRCDsskTUaVVsaraYKEiEir6D1c1Tm2kuXswuytZ3MrWZIyA9OK3GnxAGvSBjqXe
	hVKaud5gZJi61BobRXh2aowP0CzI/0NAmquMIzoWvNDa68WRpy2AseZhQCBVtqlI
	m4bb4q+62IqeNJentXx0RH4cgprsupH8p66kKk2paZ+x1LBE14FOpZXqJsh+PfoW
	chxayRC/FfciaMYTlcaVPpD438D7UNJrsKbCzwK3wQEA3QXaEXvDd0kRx/Kd4myF
	rmPq36JDPhgvo5+XupUotSGrYwAE5fJrQwG74UzE8INacgyAEXiMCY1L/XuOjkAm
	bW354Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb8w1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1415cba951so3086828a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 10:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861963; x=1746466763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mI/HiKaz9KZWlPThwibrKI2Qv9tQ/yegSAkRcgBvHnw=;
        b=kJVJAcWPG2nGEzZuAVfSfBdlhzXaFZMOGqpbqTDgVwZ1lO0J9yrix5yIJD2EOcepb9
         5wA3QDTjBf/uQRFNihXw6JwdCJNFwvt40+pDJdrl3IRHasZAN6qDVE8Brf6K3QewJxJV
         fg6UhSsoTLJDWoiyHIJgHXoaqC2Rdw9SA3xqVp94ADiwc3h5+mqX7T60PeTwSXXgBcw1
         24fomHvGGFYBToaz0tKM/SOEnq/4VWyNKLitFEtBng8+ZyhojGcZfJr8hQHO/wSEMAxp
         eVFQVo83xLYuVu/XBL5ARPIj6mkpLHAEOone8hKDgLr+MfrLtJeG7QOLBjU33/qzE461
         pJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ynIetbKmihL9TjOBMHws1+NyQyKZ83mCbHaWYuayFb9Di3PpjolaanNktpLnHj8/njQo2mYHjU8wagJB@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGKlUysYvwDek2dfWE9JmF8F3Ml/cpwHSVdg0IaBBjIHvhFlZ
	IEviUZniHLjuugwHL6ZXwDmJ/0FgIxVTFEwwl6Ihvxp1edUmT5QYLBkK4A4nXKQx4R8NIWwojv2
	kb4eVC0rY7J+w+houHEg7LunAkbGEhr3uyjkN+fM/sG6Jubt5EMYp/3zRrV/bKZHj
X-Gm-Gg: ASbGnctJiMiVcqboBr4gycOohG2pfypzutxKIgAAHUDwzKzfF0P+H2J/jrvrcE4sX6b
	zoBC9AWnaJVn27IQNAXJKT9pSKzVwYcdRvUAspHiAzD7F9arf1w1A+Y2IDiiR+ncCBz1f473BxL
	t0mJAPKKd9w+IPa3l1ntTlW6BO4FJTewYujrH8du1wOvf+/ZfGAxXpwPEUPoMQJhe5wsWWYgmeb
	C2dymbhccpk/pUkNc08BDEXWQpVNTvmPyk9eGCY5PVmby97F29f6kPMqGAZ/EfIzcUAWX2emTs4
	epqf+bZGnpdsEq8zVjTfo2IDN8oeR1Gi7J6cNLoO
X-Received: by 2002:a17:90b:2750:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30a220c47c6mr285886a91.11.1745861963245;
        Mon, 28 Apr 2025 10:39:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR7p2L8d/2GX19iNf1giRAg/eaumctlcwhuhNojkhH3I0ZDBZ89gVbUpJkpWFzmeY2sqOP2Q==
X-Received: by 2002:a17:90b:2750:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30a220c47c6mr285857a91.11.1745861962896;
        Mon, 28 Apr 2025 10:39:22 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76cfasm86047575ad.47.2025.04.28.10.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:39:22 -0700 (PDT)
Message-ID: <59c49a34-5bf3-4f10-a98b-bb63dfd58f40@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:09:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: dispcc-sm6350: Add *_wait_val values for
 GDSCs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
 <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfXyPqe2BSnZZ+r Rz7Xbs/2ZUyBoV+Auqu6v34zue45GuKcNRT6bFI/11mA9Ip3qmxs0cJmlHkT29VhSzZOO2+8V7I G1IvLZk9Bx1hee5SZFGZuKxjHjb3BAgZhIZMgIR/2VVOuzBmRdQmumuajU4JkyENY7rx7XaypId
 DNRqhvpoQclbbHphCsg5YM7E8mV0hqzf+O+q7/M/DCSj0X3H/BBh5rq8YMLTp+mFbzKshZt0qNz N/oU1CYraeZgtc6vE4l6pKPwbAEc9ER2pzwYCJfLvqSJUDoCfvv1yISxBQH2n4MCf3wVkhv0To1 mEKQ22HZ2kzb1kRZpakoLAfy2hb4ls2A3s6QE9Xuzam8wQzRSfSTxCPkbmAJCgIpPuOKZIn2OdI
 /VDoyMq7zyjvY28VHp3o8BrdwAZLdFfLEM/9uyY+k8dwA2yGI4YiKHTfR7QUDlzKwGllpFOR
X-Proofpoint-GUID: 0zrlhPtzhh-Uv49fpAj3W1TBpUfeugWT
X-Proofpoint-ORIG-GUID: 0zrlhPtzhh-Uv49fpAj3W1TBpUfeugWT
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680fbd4c cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=6dQnf3u2Ryt8jKbU0REA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280142



On 4/25/2025 5:42 PM, Luca Weiss wrote:
> Compared to the msm-4.19 driver the mainline GDSC driver always sets the
> bits for en_rest, en_few & clk_dis, and if those values are not set
> per-GDSC in the respective driver then the default value from the GDSC
> driver is used. The downstream driver only conditionally sets
> clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.
> 
> Correct this situation by explicitly setting those values. For all GDSCs
> the reset value of those bits are used.
> 
> Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/dispcc-sm6350.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
> index e703ecf00e440473156f707498f23cde53fb7e22..b0bd163a449ccd2b27751e32eb17a982facf07d8 100644
> --- a/drivers/clk/qcom/dispcc-sm6350.c
> +++ b/drivers/clk/qcom/dispcc-sm6350.c
> @@ -681,6 +681,9 @@ static struct clk_branch disp_cc_xo_clk = {
>  
>  static struct gdsc mdss_gdsc = {
>  	.gdscr = 0x1004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_gdsc",
>  	},
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

