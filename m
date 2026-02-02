Return-Path: <linux-arm-msm+bounces-91412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFUXKTBEgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:29:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E116C8AB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42729301AA69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BFA2FB612;
	Mon,  2 Feb 2026 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+pdskoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0Eps7bh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C02F6560
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013597; cv=none; b=Y1Lyh1vt2gbqL9GMtONOslNbuCASuPAbo2HLmeRMtskDOah4j+DsZFpQAANtmk2xfo4V2vHeEDL+NQbS+wl/TUmi0vltVhuqGtFR8KC2drZaeIQDBomFm2S+sySIDeDdtIaV++7/OExOe+drnKayU8HTURhD14VAMeIifWNS8uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013597; c=relaxed/simple;
	bh=PYAoHS0p9uDjoGECmNIEmr2M1dPxO11BnFsBKgcQBQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c71zU7/B8XbyAnIyS60C/pY2plawwgawJhyfFhMp0gbjPyTYcBN3LTIxjwPl3eie/ZpAwUX10V+WcQNgHv8O04Y/UcF2vMuwcHE9Ti61XvjMWeTWlXqORsvYHU8sRmVY+3NeZOTfYioQ2I2ON0utkmSm5XVpzKIFUNnVPzBvoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+pdskoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0Eps7bh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611LH70K510179
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n1DJ7ZyXos7+1bnCbWgkVud4qHnGcgBAAPukQR6gY04=; b=C+pdskoD4rGe20FM
	z/gYPZiPTqKy4rw7JZ/C0dZtI5Wq+YmMOmbpVntk2ATQOO4bB0gqfJvvvObvESL7
	sVYcR6v4fwTWsg84Lo+aEaHnhKuYxrCuMqp+6qjnCe5nTzo0Zc4OQi028/UesgQN
	a337OhYlwMvpM9CjFm90b9YtXbGxsBfNnfB+BNQ7OHo2sNJNQtK5r56pfo6nHl4y
	mRXScwndIjq0BERZwSv27oaH61CjyiChqfW+NsdqOaZYy+9v3gamjGh5PsFz2j23
	7cYXeWnCbGfy1tJW9VO5V4yb3xXl5evFMfRlvNSdMc5yZoelOWvx2ubvyeEpsBWw
	kHtIZA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx44yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:26:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a784b2234dso116279945ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770013594; x=1770618394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1DJ7ZyXos7+1bnCbWgkVud4qHnGcgBAAPukQR6gY04=;
        b=R0Eps7bhj6TP51sgiUv8jh5tW7Hv5dePqyK5PbhulEp3qdb1Q2uikPLNd0CRI1Lu1V
         NR3jvpsNvhC6+stawNXg0sdcwNU/GIbie28zuSCs0YHv/2toqGwJXwXIDArhScZ8V6YY
         ktbQEOmrb0Jy54nwUwup69FHN6J9vYQAAqOy0tTFmCjWtu98Mc+GVhiRME/WU86iufKn
         HwUjfz4/7j1XrrXCUn+Xi4iyDKGTTSOIY8kSSN9TCuTl5rs4oDeh49daVTRU0R2yNl/J
         xitQaKZE1ttyiGQufqBuxy+nBN12DJ/bueqLIa+gqpbXlChWXLm/q592TrxvKq49dNSQ
         /NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013594; x=1770618394;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1DJ7ZyXos7+1bnCbWgkVud4qHnGcgBAAPukQR6gY04=;
        b=pzfh+jsAr/4ppdEqU3W6JppWQg4ZK4BQCFTmVzu2/NCl+NQtw5L8V0JHNrc/wLq1bR
         5GNYVv+Rp3c8l7Tgg9LSiFSzSRX+QfnW5tdpJYW9BizXNvmIPqb5Dw6vIYtk9EQOQNpM
         8KJBEC/cQyVkLwp7PUB8dSBSnuG0XsghCszyS5v43jP1ouYkqGcaNWVQRreOfcX5Mh44
         70ct9NdGGIUlN+SD5KHFQ/a1lUJxM6OD1RvhrW+G1W4AuPsUWfi6w1UimVvQly2jYdfw
         2eRiiZS/mYc1DAr+9M9N/OOcKiJA1jzna1330xXuMElGWnfAZgZtXMXq7cZ38KQUCjM5
         QTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3YD3n79UY2jit9GLAZ1MfYfhPeZTZwZys//h1MBywbgmKPEJiMqWuNTvmsn6XZ+a8lic1cXh1HuQN1g1C@vger.kernel.org
X-Gm-Message-State: AOJu0YzjlS4m/m/eSq/BC86fYynOUGTl7WkEFXte0ArlUc0+4OFdn11U
	5pXDIaJDzmPcPLlM95ssN4XE53VEn9fwFvgdYM4GpK/3JMTg8uKqZgVchxza8Onviu634jrI18W
	SMVXDIgic9r8PHN8MIk3cDKUVDasQ/KMem8Bp9oDuiRQrw1yGf1xQtrnWjVibw19AUnmwpMllGM
	9j
X-Gm-Gg: AZuq6aIWsuhrTv0FRfVbTU1CEk/ujEMnGmCcZ4OWJCUQnJwFYH6q9cOm2ET1wESCaVq
	Rr5PJuLHt++47LewN9TAt+yO65HDRsLOBQeGOt64OIdV8XhNilLMgTFRJvl/A49VCj/CejobiBc
	N5Ln1w5+GQYm4BK8HNnFtEI2VdVj4i5o8gWGMes2r9eE8VEUyHx+Aff1TGbEJe1F5pCSOBqsWh8
	/FCCXzL5XrensA9wM9J7Ma2bWD6pOIe34zCmKzvJEFVZ1Af11Mo9gKSnWjk3BD6p6DyKoarpF11
	pLjkRZS5rBEMkMYlsCX++/dhDabAHXard9Ua4JrhfXyU776xOlnwpYHXlPsuVFZunHJyUSuYoE0
	2afvkgg8nRLcbDoMD9HvUYbth4FMmh2lBKmh+23gx6br+
X-Received: by 2002:a17:902:ce0f:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-2a8d994f69amr103277775ad.41.1770013593763;
        Sun, 01 Feb 2026 22:26:33 -0800 (PST)
X-Received: by 2002:a17:902:ce0f:b0:295:3d5d:fe37 with SMTP id d9443c01a7336-2a8d994f69amr103277545ad.41.1770013593335;
        Sun, 01 Feb 2026 22:26:33 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c40e1sm135440215ad.55.2026.02.01.22.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:26:32 -0800 (PST)
Message-ID: <b408b5b1-8258-289c-4580-3dcbf50069aa@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:56:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/5] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-3-e10b886771e1@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-3-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UxjafL3a3IyLE0AkwskkYcWLBz14PDiF
X-Proofpoint-GUID: UxjafL3a3IyLE0AkwskkYcWLBz14PDiF
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=6980439b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=taCg-2STDlqsnU512KsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1MyBTYWx0ZWRfX3fSftwNikFWM
 LZd9ZCbK0s3W6TTpncpCs5HEl4QnvxgUHWgk+FIr/w4YHjFwOMLizevyyL4keaGCzb1JO361PPD
 UPW3VylGdYV2YTjkpCzKqyPjFC1tuqVZ502ecYkHdawlFiAT2oUqxgCq0kMa+bZsk5RP1/bYO0P
 enE5E5ECjkvnjd8gBASKyRSrvH0UGfbO5DjNDzyaFyxB4aA0IMPtqAFGR+b6xgHiwUaraQ9jSsI
 kosGafYP+Qt39REGFk4biA7ODOfdzs0TnNmHl27bQOThXPI/GF7T+oZWqu0OQqgvtgjnMpU0VZ3
 yNbIoHlj65Se2zcaFXKZ4ZFW3mp1MgjegIXUi0VHKeXvPm6sSWv0pcES5c0KKEf5B+HCB5wBezM
 0o7XyRRr3kk2SLtnnkmzpnenwwwNJSk0+VJTJWe1PwyIkUWW60jms0UPQbOdXd4tq5tR+4Nd4Jp
 AYxk4uHF4C005IQfgvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91412-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E116C8AB3
X-Rspamd-Action: no action



On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
> As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
> uses the video-firmware subnode, move its definition from the common
> schema to the SC7180-specific one.
> 
> These properties do not accurately describe the hardware.  Future
> platforms that are going to support non-TZ setup will use different
> semantics and different DT ABI (using the iommu-map property).
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
>  .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

