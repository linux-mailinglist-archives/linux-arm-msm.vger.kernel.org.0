Return-Path: <linux-arm-msm+bounces-88231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 887CAD08226
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D665301FF76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED60B350A3F;
	Fri,  9 Jan 2026 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZm5F42Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkgmY1r1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55E3328B47
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949952; cv=none; b=Fs5Jaq2RT+YyWofU1YulnFAX7TzxBhQzUcFjhZqNf0nI7cxraPUBQwyJDjAXrXQKFPDOQjwsKkmsSSaX2kUWzOZOGoVCAOgmKwLmwleinfpbK2qIP8wpvi6iYcPikSATE/uEIzvBkp8zFHCK8h62yWK4wfElf05TUEPj48KyNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949952; c=relaxed/simple;
	bh=8P7e5hNZYHOujkFwsZ5ZAK6asennYcD7TND9Zj3DXsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Or59N7dgiFKIOno+bzsM0rI/OKjXEixc+iI0IOLrPFVyA68y0VCZ6NYWWAzuJ5FPq243woDchp3Po5vAnv+LFNLjxOyaPUnjSrqU6vv70+FwWKCDBK8K1ijf7U+0kxpKB2o1tNBjs7VsWh941A1X3C0j7+Mbm0s6A6xENmZ8NrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZm5F42Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkgmY1r1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098eNDn3728466
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaGi9IlbEMfHTeJRe7b7kpx5l6QK4PcdQIDwe0BXtpM=; b=ZZm5F42ZwvR21N10
	O3lZeJyAD703wI8IrSNnHhLd3LpiUTAyRQPWyPxgY0EUUf+RbLTcP0zipTMi5Dmf
	KKA355yB3mJMG7x0dvVwhYTdEF9+3ssGzE5vOljiba5d4RnlQifhCGaWi7dd8DEQ
	ieyCry/jTRSFUePSpNuSQU7yrNiC68quX/qtB9kIlARuqgk3mXSzBE3bLqeBhrQy
	jftUhIxxQVAYzT5GMUWTzpF1d3MZm1lAj44FtinSPWwq1DlKxgvWbt0utSM09rxa
	eZAJPgn7MdIKR+mjIj/2TbOw3t5hPtbv/xAb6YYLM94sU66xMETUjmBL6Tkz9tT9
	ij/Ncg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhe0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:12:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede0bd2154so11287981cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949949; x=1768554749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaGi9IlbEMfHTeJRe7b7kpx5l6QK4PcdQIDwe0BXtpM=;
        b=FkgmY1r1E73f8MEGbhzxosbmMmndWJM1PLRUXjl3/XrueYSlfm0qUa+32fztHylG1h
         nlIcmjaPv1m5fQdLS3ckzY9/gkBtAQkfsRaFRoQqEdL0xuARGDaIrgcnE2BqeeeK6E03
         64skzSYVMkwQzq7YTbvU9Xg50B6wDOMYRGWZsLTs8RoOdzMTYDogvX9tf4r8gBYHbl+Q
         tlPZExMbnBrpIzA5QphySVxCIu4qkA62deyIHdY06LDF9uKmDDIr83S5x5XLynOt2h4b
         HP8K+aRis6nnPz2tYdn/s971wK+QOz+J4FMGIbfw7RCK050tZFesV+6ReYyQGL53uq6t
         Husg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949949; x=1768554749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaGi9IlbEMfHTeJRe7b7kpx5l6QK4PcdQIDwe0BXtpM=;
        b=ONT31lLlHy1Y4t0nB/1zLmwGn71QGwP32vSLbzXhKxJaJ6CTkpfMN33bE+UFrJJBAA
         /Rvjv8+L2am9KMay/MGRR/Je27M89UodWN3nP3o5hJaq5SGubVr7D+Pfj9WLgA96bg+6
         NiW4eIdPsTXplud4kTwJO00qUivT0RBB+Dd5PFoao0wL0AbCey4GcMMBl0HxTyESt/5+
         FMicughbt1erUAduG0nTJWYUCgybM0pvXmvKPKsb+uTe20viyk/Mb08zoyvfQjPFXtuq
         4eA3Wp52kraxEg/Kt41pFEm3Y3jGbK0r2keLWfkbiqc8i4TcwH+/WRTfEHnzTYOiPPJo
         Lgog==
X-Forwarded-Encrypted: i=1; AJvYcCVg5vREUuvgRPYa4FedYnM1vBq5Kyx1gm0LK3RAlenPBIv2E2Ppa3nxDgKTG+AmIcxDXSfT0u7lvNXahEmz@vger.kernel.org
X-Gm-Message-State: AOJu0YznNOp17DuDhFadFSAcb4z4O+ZnOazvYsrTU3UAeyxGbktm7KdY
	w4z+1wcZduuYAuUvYCH2JklX9OhNhcao87vpukHp1mCaaVAwjiWi5kntxLsTkf6DXnz81V+qdjk
	1t7juknQku1kxuAFmHFr7WC3Tme6yeiSX04nx+493ZTL8mS2uesQJbltkOwM38Dq49CRj
X-Gm-Gg: AY/fxX4SB3lA5PTSg8Ef9VCZmDd8kZ6wlyeoUD0iaLCTLKWoXRtKAW31Wal1AMW7DcA
	U6mpaHfQKSk0OsAXb2Q/EG5m1yPE1SSN/N6/sHl9RyLtOvMcSQVSkyy5vQT5tFC5nsA/9j9sk/t
	VlbaC1vG2qIdtBokjWq2wZD5juCrUfL1r6xYwA8cBjoEh0TYBHR6ig1N6Fk6p9dAGzt+/jxXSvy
	hDDYl5znWAVXdKmhhz0a0+4gXdQzyWe98WYHAAtxHS9SFDAsgLk+BdoDKBeeQrzoOX1JXv5xLiG
	goFVAfxTVW/mPSjLTYdqQGsyEYqYlgrMs6+1S7iAgAt4jAUFpEpHlkzz1Vz0Ak35JeVVEFnuHux
	cQQpfQVyphRIYVnAnJqFV6MerTzQckJRq2Icrr/Bb1j2nUl5h3we4OrJS1sFQfW3uydU=
X-Received: by 2002:a05:622a:1a9f:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ffb4a53533mr92196401cf.10.1767949949048;
        Fri, 09 Jan 2026 01:12:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtbj4FKuVyx1u4/ajD1sK5wvw9cZMiDon0+PCeyeNijYuuoudWuJ2i45bsUb52XtqZVliz9Q==
X-Received: by 2002:a05:622a:1a9f:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ffb4a53533mr92196221cf.10.1767949948583;
        Fri, 09 Jan 2026 01:12:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118d3sm1071026566b.47.2026.01.09.01.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:12:28 -0800 (PST)
Message-ID: <5421b535-ce65-4f6b-b8fb-977d48b70a76@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/27] clk: qcom: regmap-divider: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-16-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-16-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960c67e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6EpqkLPisfCEkZo2oUHvRJm-sHZi8unK
X-Proofpoint-ORIG-GUID: 6EpqkLPisfCEkZo2oUHvRJm-sHZi8unK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX5W215r11uYE1
 /Q192Nt8JB5EIVjy7EmkxY6WkqYVjJ31w1u2jW5P85TFlq6J/ZT54J8clje1WaustDrDaI+4HP6
 7cde6TUSpyuKy/cUx+OzmgoteoFKr4+7iflbKPsJ1Z4DYf6n5RjiSGCowO6Az4PBHdWTYxzlR4D
 QaHbgimhmg/6+RPpaw9knqX43c+rHrEILPfCpWSO7tTFHn6cRonh+W7rN9PGHwvuWiRlta8HDiH
 oJSW+qpyqSQMLapiB7Ek2eO4e+nrBt57QQ5QrtY+pdVV33mhOP9gN4Er4OfwFn7f2K4Z6WbVJz2
 tDw/9P76ZX/fWB4CB341PSVg8oUJPWLpncIBLUICMwnqYyLfSkUE7aEl4Kaz1PHIFf1YagWYkD8
 0LLlIS+RLHRTBBvc4LDseL/5HYqL2/kF62egzMTQlh2QVhHdFNXbgs8M03z3xPQyZKaSeXRttru
 Q3+TnVx440Mg59AoM3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


