Return-Path: <linux-arm-msm+bounces-85893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D65CD00FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D32F300AC42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890042AD25;
	Fri, 19 Dec 2025 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsvncjr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jto+47gI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38AB1F8723
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150954; cv=none; b=Gt1sCEty5gnLpKsrs1DL+q3edVq2Vfu5kBdVgK99oO/zlHO/g3+cwb+YSo+aMRh3ua5zUS0D6KClTCFoTRy28GmVDm5V0VKACU5eHCW9RQim9ZafUeBCOjwX2I8WpcIHgsDUe0RtclzOna6QcMG2wz/U/YXpTfIeDGGc6oSgYwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150954; c=relaxed/simple;
	bh=loDuW4HPDcLcwKVVch1Ot7JWnUYxZwlopciQURmDUfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pf/JPb4A7ZYQgWbRgVOWvw6pKLXniYmEtL2Hn/NrzJSka37EydRSbs/RVnwMRAHPl/8eJcUVJ23Gb5FypHoe9JIkXNsHX8+FgLo4VBXFLLVDeWU1OJdX4hQDlE66HRTN3/d+GhHdBSQCHrgNOFsj2bOw3aiT+BFOFC71uMvYfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsvncjr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jto+47gI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBSAmt4145372
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smbsNpzzUPtc/SPUUqHLhXKLTT45mdFEONj27OKpOSE=; b=nsvncjr9ayxGA4cc
	vqXJvieK71qgrz4T/zlnWS/dWFVKcQvJHKuLTXEsfnwEePVoZ95xcbfSYp5En3ek
	P26tJnv/Rrmi94pfQ/nUBJDmO2H6nqEw2HpaDIFcKWS9WHilYv5ZZ682EMcZ2YDB
	xKf7fBNd4yPfAUy1kWQ+TxhCx9DXJvTCe1kgwdfF4lQsOhYQTbXnZapHNtYrWk65
	D8IVs+OTWHN1sZTjjtCKgMMft5vh/DeZUoPB44t38vVN/s9jwE/VrhZG1jAwJnsb
	SfaSsu3lDo9d7M55ML0wTt14PvFOehRwIpTxdwA6i7L3ZEIiaEebPJr/KI6ebJtB
	18tckg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dtspd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:29:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee409f1880so3263621cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766150950; x=1766755750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smbsNpzzUPtc/SPUUqHLhXKLTT45mdFEONj27OKpOSE=;
        b=jto+47gIMWI4kveV9x9pTCBy32EBJsZMQ/ihkjlI7tKs/4ow6QDTeVB9cZUUtTxPbd
         15QkcTkJiRGkgoRdlrWqMBn6pyjDzXQ2FIjQ21HZvxfRPJuaGqDZSK9KhdBjEfvugfzy
         b6lNvSdKlcaAEZMQarpCg51cCnNNlM9RrAVTKDzGaUThFFjthHIbK+yb47SNesRYgsAj
         HSb3vxR7NQtgTQ/eDPEDEZK0LjJUFtHJSgmfaDsGK6UpHpJRXv4QlTGHnR9IclDFpYXa
         gJawBq3vbe8fx6YkTTEPAtEhyXfqE1Ri9KqGh3UINSvs5zvUEhiLy+1jLQwuQJjRiWm8
         HhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766150950; x=1766755750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smbsNpzzUPtc/SPUUqHLhXKLTT45mdFEONj27OKpOSE=;
        b=tD19AagfUv8gem4lAzYlaMdX71FA6iugN5cSQpVs9VpyOppnP6AV8fThNm36+AcR3P
         KxfAbFN7cbTSP2jjhHdLuCFWPz08Zj3FRGiyaJUEhCELDjwR5ULJR1YsbLfY3mfW2mp1
         kNqu57v3MwtN5Q17pQDK2J6JUTt/l5d7xG4rHRFw+ynjdmaGqgO/Gc3LfrF1jAGjrf0Z
         F1N1c73phjO33n+Baw8zOAYMBkQmJ5MLOlesUwNe2IxbMtIxDOG4cTlaXXKp7z9RlT3l
         NIKyeplOhmHEEh/USQnMtFXem2mkqM8/Ii5+1L3t63LMiouDW4YEVclP2Z6ZKEdVWoOL
         i1yA==
X-Gm-Message-State: AOJu0YzCrhCmZSLHR4AwduIqOwqn1DST3vktqOmdyxjwO0nSBkHqM/qJ
	IR4YNHFiv6HqFQTSwGSMo6rzZ/y7vtQ+KqdMJoxOoNxLn5bmicU7zIihSkKGQhTbxLOvID56xd1
	V4dvfNYOFj+MYsgADN//moyp4PwGe2c/3vF+SAhh3YMD9q9pNnGbzhCbqWbtixYwMqmQ+
X-Gm-Gg: AY/fxX5ExBRXzVtA2HICynJkhjg3oGZHKW/g8v56/f1ngwxWGJlKn/qedi4xtso7GFj
	JTyv//V6tS5Du2DYsZTswPVqX6nGhZo4iKTy+zh2zqwmHq3MdRmEvBbm2RiBP+9CS/6R43bURCZ
	0h77QbTcJ7Zhu/7wu0YmLVR6YFCPGtgt9OdkSeLTgCByegjl6JdDDzMjn5SaWRcfQr8q3vCSDbE
	FqqjFxRKFNKRqaq0zJkH2Q3ZTD1FtSCvsBucFR2HMahY2ZLB51l3eM/BP7Upowk/lkXuc+sb/dp
	c0c/DHoo2AYEtAGUjHUOIigFVZTuqwlauRSb8dbvRS/yQThCf50CyKOE5U5LvGK3CW4wyjEF8hj
	tI/rMbHpGvZYLo+/IvXsSoa2uJgb7MgyNcUXbIt0l8a/0hGa0k180Jg9wfW6GUvEgvQ==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr26372251cf.11.1766150950168;
        Fri, 19 Dec 2025 05:29:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUYKCkJVSrqW1vxhL870X4RtyrSYTxUNubHW+yqc1lN5UG9ZVKaDlqZ/xu0LZwEiRrzY2E+A==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4f4abe04451mr26371831cf.11.1766150949626;
        Fri, 19 Dec 2025 05:29:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm2215197a12.8.2025.12.19.05.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:29:09 -0800 (PST)
Message-ID: <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:29:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219043425.888585-7-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2Lv073UnfZ0c4eRsWhazYpqYLggbd5ED
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=69455326 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=N1TvPJiDMy0C9PSbT28A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2Lv073UnfZ0c4eRsWhazYpqYLggbd5ED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMiBTYWx0ZWRfXwq5RYY+00dN7
 GOUy9t0udJcSRlkWnj2nIx4d5AHPYOkPNC10tG6hv5n2YNexDocZaHS37X2DaZttJTaH1uh20Cl
 WqUv3c+SIWvcxFFH0uNiHzUTGCItPPFlST4NxzkYpjMpC8os4RwZk3j/i5TC66E7hC7kDTredYt
 r/+AI8QyU6dI3t6FtUhglV3JuTkegSXUtU7NAonEqyaZM8EX0sWk2zLebKBz6CKor62nWtgIpiT
 gQ+VzWm5xhb1ELnq835s917nG2OlD1yU/Y/bjHOqEIA2xdLjY9qm2c6xS66tyDWvnPrA5A7sr3V
 Pw+kuRmaMI1Sv2Xv4GnrgAg85ua/qLaJZ6c86etyDTXm+YUfnEHxawXRYUlyV+bzAy7ufEfsBs6
 ZNj3cyoVCv6PkW7SLksFr28E5hbBFNyo6Xd4KganY8wrRSJ66lRXRiJrd0K7uWQBsn7xvKYeXJ9
 fcRUvTYq/vEj4dHp4Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190112

On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
> to the q6 firmware. The firmware releases from qcom provide both q6
> and m3 firmware for these SoCs. Support loading the m3 firmware image.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 44 +++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index b62e97c92d058..265010c5c82cb 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -101,7 +101,8 @@ enum {
>  };
>  
>  struct wcss_data {
> -	const char *firmware_name;
> +	const char *q6_firmware_name;
> +	const char *m3_firmware_name;
>  	unsigned int crash_reason_smem;
>  	u32 version;
>  	bool aon_reset_required;
> @@ -161,6 +162,7 @@ struct q6v5_wcss {
>  	unsigned int crash_reason_smem;
>  	u32 version;
>  	bool requires_force_stop;
> +	const char *m3_firmware_name;
>  
>  	struct qcom_rproc_glink glink_subdev;
>  	struct qcom_rproc_pdm pdm_subdev;
> @@ -922,11 +924,40 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  	return wcss->mem_region + offset;
>  }
>  
> +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char *fw_name)
> +{
> +	const struct firmware *extra_fw;
> +	int ret;
> +
> +	dev_info(wcss->dev, "loading additional firmware image %s\n", fw_name);

I don't think this log line is useful beyond development

> +
> +	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
> +	if (ret)
> +		return 0;

return ret, perhaps? Unless you want to say that "it's fine if the M3 image
is missing, particularly not to impose any new requirements on existing
setups". But you haven't spelt that out explicitly.

You also haven't provided an explanation as to why the firmware should be
loaded. Is it necessary for some functionality? Is it that case on the
newly-supported IPQ9574?

Konrad

