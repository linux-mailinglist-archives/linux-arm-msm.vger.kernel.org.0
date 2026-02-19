Return-Path: <linux-arm-msm+bounces-93361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SYYCHpHelml9qAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:57:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF1615D932
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5997C3015CA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7134303A3B;
	Thu, 19 Feb 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGbdBwUi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWef/4ZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ADF2741B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771495054; cv=none; b=rQoN7u5E76ifJiDXKOxqI6y5sA20Vr38HIjDeMBB5IGcqQi7Kt0i8QexVzfY+oa2neYhVre2rEG9r//wXX7xY9HyUHkhdI0/jJUvs0ogtwLhSXyxPaxE7inQupkNSmlqInZsMVmTPENLTtlEYwuT1FxNnOXqnbt1TdvNe+Slqm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771495054; c=relaxed/simple;
	bh=NvhZqvTQ6h9v1tYeHCXRgchkbd5eyjCbVW3fOG1FWP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdegb7btXsbrp1WYOQ3K3ntq8+dLsIAZu/JZJY1EuEVOTI0cTmVNbJn4TNmMGT43AMGqjAhYBy6jxx+ZKxDxnJMLTPt/z0zoOt8RY0EeZh3DE6hqGZLZ9QRZDuKjMUThULdSK0jKLYkx4RiRH/6BTTPG8UZBTZ0HWlwk78pW19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGbdBwUi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWef/4ZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IL5dSN2004685
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Tz/APViPT6O0NOTvr+dMwiRxfKOXZMUvm5WCcr26Us=; b=pGbdBwUimMlp8n13
	KeAV3ReoMjI+m4Di65Qwq2ajmkLgwxANEaJ/cz83MlV4vAtFfcHafi7zuWUc6wCX
	U4tCMU+359r5r/YUdk8pTRm8YM7hdSN6+lxLQXq9Xddob/eQ7omsVUe+Ogs/pBN2
	3Qo1gpFP6kzivIK6iO4GxhJy/Kc4tqKwVUysXJ95tjFEVMJTJLq+XnevozWTtLas
	GEECx4AyPXb8IjV3X7qQXvyJWW2UoCOzorRA3ZLaMg4NoxApldOVyJG3T2oB01BM
	C4j9KCfgq5Z9dztMV5eVxTZ+nN279MFGXv2ofj9d8z5zVggaFCiPstJexGPY4RK9
	6tZPrw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qhfrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:57:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894a207e7cdso6500156d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771495052; x=1772099852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Tz/APViPT6O0NOTvr+dMwiRxfKOXZMUvm5WCcr26Us=;
        b=FWef/4ZSoHH2zz6PLG93LGDjao/U7aUmYOPzr95np0YbkEjJM2dnZdF9dM9iva7kqo
         R8Gh7JHnIfcYrsnk7B3X91g69nyaqZTm9Au/DCBXPa213VMozuea82dfdvOASVn4uUxY
         TTfjBhRfGkOfgay/NKeWSqHtg66XYKxpMNQ7pHc31HLdSUC05OmsN5QPo91igXC1wRd7
         bw3zvGfpBFD96IWuxEu6AbK1T9Dp04rUWJSEnUmAZ0IlNy7SgDGA2LCg0asqInHxEhan
         jZaoSEnNZZgJfsYniEeOjn613C308PCLo1ziR4e1795b023MwIC35Biga3lkV3GpYT+7
         78MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771495052; x=1772099852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Tz/APViPT6O0NOTvr+dMwiRxfKOXZMUvm5WCcr26Us=;
        b=GOt9dm/f+cNmcvnKP6nzwnG0Qp8udxC72ODVWwwPGvho5b8hIfzBfh2zbfHWfKXfQ9
         oZ2bDiq31d+U44YSIOAezDAWJvZGL6fPYIESshGG5g05To844m2PKu+BBAkSee7g9bhb
         qXt0V0xZtayfwJqcLx1loFz+kApjXO2PzyVfy3ymcOAiE4A6P3qgrtrmxQCq0abopRNp
         NBQxjdi1KqHRt/bgLGYcyf/oF0LZymx0dBrtVoXavnl1+mw5TWiqMzsy3rGleZFh42+7
         YpJTCD/LrrhMmJGReijJH3WE3DFHy+LA4ZJiJNNBcZgEjOjvGKN/9S0vjwvLDbpiGU8B
         jK4w==
X-Gm-Message-State: AOJu0Yyv2d2mrcKTr7IfEQKTDgj4hFigQTsBdsgN9kyejJuPYNRmwFhx
	Jg4JU1WZc7ce3I868YG8KOXXx5OMKLuHekXD1Ii2SHuOgfiL8G3+ZQ3Ng5+bTjfJ5RYJzj3kr42
	ethbTjHE3BDqnKV6qiIg8Ey93XnzPn1XF93VB+XvQtbLLDS517puESI4f7Wv93Yp26olp
X-Gm-Gg: AZuq6aINHwcvOQA7Upn3eAjAjMHQdB4jSz6V/kcsWmie9YpHTg7LNxC+gWbj1lgs3I6
	7G+PrJQGseuEnm/1zn7E5Iba7WfvWP29fVUoUV5/3pMhyhCW1boBEojYOxURBxq1bM3T5M5SQhn
	caW/0azHUbCjB9BVPGoln+6xgGUwnaJpDrKteiOuIaIxIe8mbXXKJWxGzO4amJ6+34MuNLHLXac
	kyRK9BhY3SUR1zq5bIDGd1MVFiRJbRxumxfLW4IArHTcxACiPbdxxWnWss2ZMguNrgoLqQF5nLc
	OxPlGqT4LQk9uxtYaaE+9kE2uNfbZBa8cLH1DM6hbq2VncGvpBMaX2lnmlcBwFKvhlyZm2Zba7p
	XrkjIjZfhtSM1lrh1L5yKK9B+4MViq8bL6JSEZyRlSOnk73INs9gCXfwGjCAEfKIUhSu3/ivh1g
	vYg+U=
X-Received: by 2002:a05:6214:8083:b0:895:4919:f536 with SMTP id 6a1803df08f44-897347af1b8mr237205366d6.3.1771495051897;
        Thu, 19 Feb 2026 01:57:31 -0800 (PST)
X-Received: by 2002:a05:6214:8083:b0:895:4919:f536 with SMTP id 6a1803df08f44-897347af1b8mr237205196d6.3.1771495051518;
        Thu, 19 Feb 2026 01:57:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc763810asm544031166b.43.2026.02.19.01.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 01:57:31 -0800 (PST)
Message-ID: <f8c2fe29-9e38-487c-b32e-7ce151403a7a@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 10:57:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8550: add cpu OPP table with
 DDR, LLCC & L3 bandwidths
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260218-sm8550-ddr-bw-scaling-v2-0-43a2b6d47e70@gmail.com>
 <20260218-sm8550-ddr-bw-scaling-v2-3-43a2b6d47e70@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260218-sm8550-ddr-bw-scaling-v2-3-43a2b6d47e70@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xlrOk0oVBN49Wu7obBH4D3PGxSj4lUIX
X-Proofpoint-GUID: xlrOk0oVBN49Wu7obBH4D3PGxSj4lUIX
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=6996de8c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3ZJPoGdyOF2n25YemrEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA5MSBTYWx0ZWRfX3ftCiEhMpPFU
 cZk7bgWa7m46mlulbNRvY6roOgrAjdueta2JPFBkx6LQCNfnWpoCJ1UqAGlXNZ9SPDh79Xla9CL
 D9UL+sv1yF7V7Ae8x0rGhytYIbMRAOc1gSv0zO7hn7MttvHylftQBqWtYOAQ87jxA2BgjwFU7OR
 hP8UZ/CSw9gZWj5qtoUifICoTQ+/HcTesaAWmnGmkQ7+ONuJJFphQv9/HbK05GXMz1kHIckE8LJ
 s2uQwaCDT0g9vMyYhJYj3RQMa7yzFIeli1ZK+LdVDRX3If+U7ZT0IqtKHxqRkSZqRJO67sh5E4v
 R83sEzemtYKIkFzJwHsXwyJu4tblAuE44UOyFVmsSQJtm822KOiegToT/rLVOeDNi3rUMcTuEo2
 m4ajX156sTjsJSeVHtClqLiAo4oU5d2QY7eaq+BR855K7yEZ3W6XZCxTtZOiiWGs7U1U72C+ZbH
 pVvkriLuXnLcgGocxjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93361-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBF1615D932
X-Rspamd-Action: no action

On 2/18/26 7:16 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
> frequency by aggregating bandwidth requests of all CPU core with referenc
> to the current OPP they are configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> changes frequency.
> 
> The OPP tables were built using the downstream memlat ddr, llcc & l3
> tables for each cluster types with the actual EPSS cpufreq LUT tables
> from running a QCS8550 device.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Once squashed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

