Return-Path: <linux-arm-msm+bounces-35832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03C9AFD92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 11:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0EDC1C24E6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 09:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1181D4171;
	Fri, 25 Oct 2024 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTikHe/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E31D364B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846998; cv=none; b=C4zDlspLvo239GqZkEh7omAPkQMKWSx/DUWWf1zD917419X2eB9QKS4ePOs0C4rt7BXk4uYxELYv2ydyXUa63CmlWF62GDHo013gyPDD+H5xQckkNc/TF4r6Jo2C48CqynQXVjpcPJHme947iozFBiOTnanC8mgeNTY6OJyK13o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846998; c=relaxed/simple;
	bh=jHYhHWD3Xj5+wXlnNcistsa5N1NbiAqU0VT1H2LBhX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcBucJ/c8/dw4q5Oj0D7lVlhFQX6MCYVrxKrrXGgPUjkrrn6+0abw9kEWuSWfIL3cnk4gLDuMwcOvZf47Ap1qpYqoy693dRDEgdVEQ8azjlCS89IUclKicQdDA7Z839TRY99zcUKo9NtIWOjravPgQ5ZjQmgaZIfaFhcbW6wy6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTikHe/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKKt3d016165
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 09:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvhs5CvaUXx9tdFQHE16vdbNwHsAjwYgEe7/KvNaR7A=; b=LTikHe/ixfshnhq1
	EStit7aQIrtTYAIz0yV0/DGtBaA/Y1subIMy7QVbpfmQj5m1zAV5SfH716hwlvxJ
	hsiqCB1fpJ1TqBP0gp3/Ed/b6sCLfFlPPOzaaGc+Tpz4Og9DSP/nMSODDwU6y0L7
	FrqFOgY+sU8o73vipI2MmZ17zSg5SrYN9lxRNpu7laxRZEMhxruL1/IhzB6V8Vsf
	xOqOjgx6Ax741fyIhaaTUqD8ffEfqBIdU+raXeUtrRPoyajbQD48fNEgufIrYFll
	XfJq+NNKqVrZPsNIpq2y9zquWC7ZEvHejlmbxJN513VNArW97LNsDNGUvhSc8G9w
	HzKa+A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xrc38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 09:03:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe993f230so5838266d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 02:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729846994; x=1730451794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvhs5CvaUXx9tdFQHE16vdbNwHsAjwYgEe7/KvNaR7A=;
        b=oexapqlEb2YXvVUwfHRA8O7Vj6onTmzuBDW0xrMPF8LVrShoV5V1Hu2dyxYxFplNFW
         18J5r1IYaKsZxzXtylrhdX+QpWtjgbuaBnrw14W+3zdV41vetoU9TzQrlK/LXG5k0ucH
         TQbheHqn0lHufyyoRjGaY0mLO9BrGIUulRA11jFxgioYNIAMJrorTVOwiix9R3kQ5y28
         aZXAZ6V8F4Q+Ll32HTpKllKo4mmbZHKCsZkxb+OsJsA/1I7Cd2kesxWnjpkVqy+0ZgtD
         RUlKUx2v+FKiHcbyevxUvMi5h8Ntdak5m/+ToBMNN5yUnohn2fbVejYne2nDLH/7bVhl
         1VAw==
X-Forwarded-Encrypted: i=1; AJvYcCWZpqnZ+qwzjChGS5NzYfzu3nHsNWE8QUCBf0G36GwvQyefKzPcngz5/MEvR4hs3B63lTj2qtnxBlTUNhz5@vger.kernel.org
X-Gm-Message-State: AOJu0YyDlvFhHl3ScFiMS+5yMD3KqluMgH0jMh+5ivRP+qFnH2v+NU9w
	K6Ciwcd+1vWds2ZPS/l688FOZXwsY3xwBmZcslAYqlRNHwlp32H9nPPH+orZY4YHlL9a0DNTPVM
	Zl3+fTAyMqN+UgyLlneswDzuIzGEALrjNsXaJZvG6WKQnhL0I43UaE4dIrYAaoEs+FGmdJeXG
X-Received: by 2002:a05:6214:5283:b0:6cb:4a88:8cf5 with SMTP id 6a1803df08f44-6d17dcefb27mr3093406d6.2.1729846994001;
        Fri, 25 Oct 2024 02:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPoaFY4NuMUdT6UC7aHSQ4gmyr+ruu2H47w697MikAjvXx0EG7IdwUwwTyyAPKKUyqFJflKQ==
X-Received: by 2002:a05:6214:5283:b0:6cb:4a88:8cf5 with SMTP id 6a1803df08f44-6d17dcefb27mr3093266d6.2.1729846993735;
        Fri, 25 Oct 2024 02:03:13 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb631a3dasm393276a12.65.2024.10.25.02.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 02:03:12 -0700 (PDT)
Message-ID: <c1d4c2b6-85a0-467a-930c-ac2797c72699@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 11:03:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: Rework BCM_TCS_CMD macro
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, linux-kernel@vger.kernel.org
References: <20241025084823.475199-1-eugen.hristev@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241025084823.475199-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: utTvAlPHopKQdCfW0PBuXjCkGotLbdUo
X-Proofpoint-ORIG-GUID: utTvAlPHopKQdCfW0PBuXjCkGotLbdUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250069

On 25.10.2024 10:48 AM, Eugen Hristev wrote:
> Reworked BCM_TCS_CMD macro in order to fix warnings from sparse:
> 
> drivers/clk/qcom/clk-rpmh.c:270:28: warning: restricted __le32 degrades to integer
> drivers/clk/qcom/clk-rpmh.c:270:28: warning: restricted __le32 degrades to integer
> 
> While at it, used u32_encode_bits which made the code easier to
> follow and removed unnecessary shift definitions.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  include/soc/qcom/tcs.h | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
> index 3acca067c72b..130ed2582f37 100644
> --- a/include/soc/qcom/tcs.h
> +++ b/include/soc/qcom/tcs.h
> @@ -60,22 +60,19 @@ struct tcs_request {
>  	struct tcs_cmd *cmds;
>  };
>  
> -#define BCM_TCS_CMD_COMMIT_SHFT		30
>  #define BCM_TCS_CMD_COMMIT_MASK		0x40000000
> -#define BCM_TCS_CMD_VALID_SHFT		29
>  #define BCM_TCS_CMD_VALID_MASK		0x20000000
> -#define BCM_TCS_CMD_VOTE_X_SHFT		14
>  #define BCM_TCS_CMD_VOTE_MASK		0x3fff
> -#define BCM_TCS_CMD_VOTE_Y_SHFT		0
> -#define BCM_TCS_CMD_VOTE_Y_MASK		0xfffc000
> +#define BCM_TCS_CMD_VOTE_Y_MASK		0x3fff
> +#define BCM_TCS_CMD_VOTE_X_MASK		0xfffc000
>  
>  /* Construct a Bus Clock Manager (BCM) specific TCS command */
>  #define BCM_TCS_CMD(commit, valid, vote_x, vote_y)		\
> -	(((commit) << BCM_TCS_CMD_COMMIT_SHFT) |		\
> -	((valid) << BCM_TCS_CMD_VALID_SHFT) |			\
> -	((cpu_to_le32(vote_x) &					\
> -	BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_X_SHFT) |	\
> -	((cpu_to_le32(vote_y) &					\
> -	BCM_TCS_CMD_VOTE_MASK) << BCM_TCS_CMD_VOTE_Y_SHFT))
> +	(u32_encode_bits(commit, BCM_TCS_CMD_COMMIT_MASK) |	\
> +	u32_encode_bits(valid, BCM_TCS_CMD_VALID_MASK) |	\
> +	u32_encode_bits((__force u32)cpu_to_le32(vote_x),	\
> +			BCM_TCS_CMD_VOTE_X_MASK) |		\
> +	u32_encode_bits((__force u32)cpu_to_le32(vote_y),	\
> +			BCM_TCS_CMD_VOTE_Y_MASK))

FIELD_PREP/GET?

Konrad

