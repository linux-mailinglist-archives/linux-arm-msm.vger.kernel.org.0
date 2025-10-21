Return-Path: <linux-arm-msm+bounces-78129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C32BF5818
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6690F4ECD81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEF82DECB0;
	Tue, 21 Oct 2025 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEsB44ae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12424329C62
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038969; cv=none; b=CUluolBd31zJ6hLVf6N2yME9NXZYyjnOvkFE2MlpEAljHDhW3D2GSCWwk6wvJbmlrrkx8MevjYB2rWVbI39c/fqii6NGu1CH1ZBKuab8J1150zNBgVB4VBGo4dnGsLet6KtecDRqRxd3hGJxnajg7ot7NJt5LdXqez6+Z6dUE/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038969; c=relaxed/simple;
	bh=Lgkx5HPDkqjxZ87HJBcNSye0fzmxDpuWBWFLKUcBuJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5Hto3r2B9S5Pudr+KSR1pHX+eiOvzWpYzerT3D6px2uALpPEBHABtocn6X9hH3eU7aQZdsnDN+UnFb2GidSPsgOzojSFRzaDF/t9ztP0lpbSndjYB6dRE4GPCwDMTDa6ELr7jx5eUm9DUovrr/kTSHMjhFtjnV0JIQeKUBnIYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEsB44ae; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8PMPb026906
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vchtIDKRTnCYbic8XdnIHZKcKNAB2qHtd73EA57D55U=; b=eEsB44aefSWI41BE
	W7FmzAAbWsxaqRsbY7BhATESzbG+ZjNUet20iA02h/pSCGzDK8Cl7N4LFSjHrzcY
	TFpRLlQwPy8xCqxuF427bUZbU8FpV/rgC+OObwb6mIF3z4tmDfRa2DSaGuyVF05p
	OIaeAKGOt5KfegvFUMq4RJsDVsJaGCsX7CZWervhYAPmVYc+G0WrF272NJZ/bjwi
	tYXms/jvasWANdWp/n1Y3QC/8h/xkR/27oQxcFsjtByow+wQBUFmyjOegxMZbfKd
	woLJa06Zf/ocJtCOWGIXIxj2wgmEKNpJ6H8qtP1SZ4t610GcIeU+i0tp9oibIiUS
	SY+NJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pgdnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:29:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2904e9e0ef9so107126525ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038966; x=1761643766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vchtIDKRTnCYbic8XdnIHZKcKNAB2qHtd73EA57D55U=;
        b=q4xcCS8OZLqUttXkr+h0+f8WGdo0KjLN7MGdQ8mDjCnSNHXZ3duu9KTJTRBICYW1gQ
         QRXRgumzcKZWw3zoVdPez5I++mee+aB6GejjgDWpmZEiKkhmUNfrQxs75+rhZrXfqV6o
         F/LWaemdni2Jm+B8+X110dZ8dOBZ3IYRJ3k5W4iDexe5bO8Gz/xqQYzOQQAoVN5xtQnT
         sC9ZdsprdRrCmyfXKkOLsjDmr5AVTnaRK0CbITRPaLa776wytjgbY/zK/jxz4/8TDS9O
         7QhbbfXD4toKnKiscAWVDij4Vvo6fIB1gblOVxsYkvA6toQQmjlI7i/GlDPQZljckYcX
         4GtQ==
X-Gm-Message-State: AOJu0Yzk2aZENjNEXYnbDqLr+Pb6XGgJuLuXtuzyOh0Tzlrm/RQLNxCz
	FxEfqiHuujIWnhvLdGXKUkNytgvXHaPINoM9uZVEH/aGsYsCk+lGxPY5FvHz/0/fg7WKl77QHLN
	34SuAZTvaHACtQz4rtUKtkAIGNccoPQ5v3ikkl38Qkg48VHWN1dXtimkPKVsKkAlgBsho
X-Gm-Gg: ASbGncsBkazVeKakD0Ohzr6x7znAcyfK/2osVTJoOwh4x8yFwivn8blyueXcpn4c71E
	t1ydhmskpPQEKLNSge5lCxH6yeK35G0Xa0dH51honRqPfYT4UiY1NEobUltYciukUKl2qTHN3Cy
	cBDfNR5nktL9kzxWv31dnqiKCQMESgoxARRkAKQ+bBVZbz7Y6BLRzAlAib7kRtTjxN0i/M9N1on
	kN/GPSBOXCI+OrI0sa3X8BIZyYL2v66FhMj+gff1mEmiYZcZbE2E0OchllYc+2VRNGAVFlBJKHp
	bPSz86InSXPUgiNxansgrOfOLAj7er0qUzHvgRwZPy9w5jMbycH4+SyQbzHjadu9kScI+jeAcA4
	kQ0kDwjikSatTNgXn9sYxkrKAGmw=
X-Received: by 2002:a17:902:ce0e:b0:292:324e:24bc with SMTP id d9443c01a7336-292324e26damr175702155ad.16.1761038965721;
        Tue, 21 Oct 2025 02:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOGC7PHugaE2XtwN/5ogJH3Nu6q4RR8mM10kZpgisPKy4YenMfCVuiNGzBa4/+043w5e9f1w==
X-Received: by 2002:a17:902:ce0e:b0:292:324e:24bc with SMTP id d9443c01a7336-292324e26damr175701785ad.16.1761038964961;
        Tue, 21 Oct 2025 02:29:24 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcde4sm104829805ad.5.2025.10.21.02.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:29:24 -0700 (PDT)
Message-ID: <fda2da11-719b-4552-ab5c-d197c9f29092@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:59:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Enable runtime PM
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012230822.16825-1-val@packett.cool>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251012230822.16825-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX1agu6N8vQLUR
 /Z5rzpuea8+ciT7pXPq4C/PcUJUlS+Ii4LapiEpCcKfi4WKN6h0ddoztcoBt72EgIw8xvQUpLZQ
 p7RquSG/cAuLFmIUCdyzZjeEgb8XP9B1qgY/ZTzrcVVEl52Xh0DjLfBOKs8w1GLCG04WaRY1yaF
 DvnChvnSSK/IkPXt2bkE2OVePEncVgoRuwOn0im+VNf+1TMZhtzzzOlNw9ZbAys8IhxwQ04hc6j
 hONuv2sE/31VN3mRnlsE1UozYZPskc7Ic6rM5/lxP2UjiafEnMnGpMoJEmG4oEuM9fcf8VNRL00
 TwB4Fk6p4W3z0R0q8vR6qYizpN1GmDb41n98M76XTcQPVcgoaO5bCWi766vVi9dghEh4xfXtQxa
 0RAbPgTmu05voeb8oPidCNkFNhxv8g==
X-Proofpoint-GUID: u4WCLF918m8iV85cE69fWl-AMo1di1Hu
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f75277 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ol272ZaqoCEH_NYozqoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: u4WCLF918m8iV85cE69fWl-AMo1di1Hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000



On 10/13/2025 4:36 AM, Val Packett wrote:
> Enable the main clock controller driver to participate in runtime
> power management.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Seems like this would be one of the prerequisites for actually reaching
> deeper power states.. I've been running with this patch on a Dell
> Latitude 7455 for quite a while, did not see any harm for sure.
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 301fc9fc32d8..96bb604c6378 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -6721,6 +6721,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
>  	.gdscs = gcc_x1e80100_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
> +	.use_rpm = true,

This is not required to be set for the global clock controller as 'CX'
is the rail powering this clock controller.

>  };
>  
>  static const struct of_device_id gcc_x1e80100_match_table[] = {

-- 
Thanks,
Taniya Das


