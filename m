Return-Path: <linux-arm-msm+bounces-91673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D+0L0LqgWkFMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:29:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE60D905A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 233153101DB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D1233F8AE;
	Tue,  3 Feb 2026 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEXxhyiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMZ3oVZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6F33F384
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121440; cv=none; b=GWyiecrAuv34TrEph++SQUDBVR2GaSB8OT2nrZ/4u/7vBCDEY+9/ro51Wkn1eSmCzhFDBXmBT1H8F1H8YTw8PMoMN4H+aZsf/KfRldSWaCwgVww6M7BBargOQttqJHCYWmBR0LWe6EDdS7oNtqepZWRNPMvKDZFhDnzYjqpVF6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121440; c=relaxed/simple;
	bh=1beno9bJ66kwAx9wlruDfw1G3tmXkab6b6hnYrIXZ0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxZb6zayJkOcHh+eU8fcGd/rjFaMxIZ8CT2hVqwN0X+K8rt9x8QNV0tTCcFnrRX1seaHlODVpU+aNJE1F1zspK+J/THYP/leh+5ASj/LrcqUnUvktv8g1hMrmx6ki/bA6irmiAYD9/sqDGMgoIXVjJkT5UUVIQm45nRkxkzdhG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEXxhyiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMZ3oVZf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613BLq922847348
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYO3cR/k1KFc/9QYbB0PIjXcwT9hHSS+VNzE2GCCgfc=; b=EEXxhyiRJfZFSbZB
	ajzLxTCZss5ndJE2qW6VtPKK8g+B44amSCDEsbDTaikwDjlUsvnLQ6Zwq8fitPvO
	DZZPGjXUvxZpj4st/oQOfIp32RVOTXYrgJ/qb54ytx8ZPDfRC2ZqJdo2ta7n7TLn
	Jw5boOaealA3fgOPaNQdNbGTm9K2FkiOkwa9yCTGIXgHc5hbUCwQOSx5oVsGIK4B
	ckwnFuT4V/XElfYaHcT0z3TznEnciJQCsHn3PyOi4H0ds8oLx4IxmcCIF17wO4IL
	5V+hIZiSlNaWOLVbzgst7lYFDXkUekyp37hoRxSGwZW7uWjqSxS1eUphEx2QEJzX
	A55x/g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33g5g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:23:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-894662cba4fso13960566d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770121435; x=1770726235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYO3cR/k1KFc/9QYbB0PIjXcwT9hHSS+VNzE2GCCgfc=;
        b=CMZ3oVZfH5p4OTvp+N8orfIiyxcv30PJN7APWCIz+bbMRlsDVNvaT51MGPT4Ql5CFm
         k5K3mJUqxdVinvbNCkvcrn+90uI5YyP7AqySi3S+zkchHSYBKDA36QYEvWoO7hqW1mXP
         M3/hUrrP7KzkDTQCQmP2HB407yj1hablwwcVel7sVzpFU7GEfklnnSdo3y4MVYn1ARXi
         4CZjcbna135j48xM9eGIMsXSPzySAEH8/Jy63OnpSf+zIdHqW96dHwywHTyPE/5MFxhE
         0FsadUU5wYtbBSox38G3q9vYXZNvIGZ7CwEcOEledjAKzegwxID3+nEj6AfeiQa3Ovb9
         ZAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770121435; x=1770726235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYO3cR/k1KFc/9QYbB0PIjXcwT9hHSS+VNzE2GCCgfc=;
        b=XYdai23RU8Pa1LsJ6iv6ruUorxKv21VMTIFoFiuGV+H/WjtktK9kPNnXEgNyCU1j7k
         BGsaGXWtp50bInFlICtRgHBLcIQfvxFOonaCBVLLzXtuQwaSqbDXm5EeOtXul9th5Fj6
         rdf6dsRQR/lbgdelFC8WNi43qykXh+q+5Wg6D7KZ8QtfDyP0md11GIT3nsVP8WpxDpMY
         FCGanr1rtzaWW1tCftIS15sHtfhJmrNf1IJiUh7I89xxlrXJ21oRQawzPgCqrdXLV0IT
         Z7f0TVzYSZgYoIY8A8+sm/WTj8SaUFI1VDI3lBJeq0eQuEh82S0Zgr3i70p19ESDU+hN
         LjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBd9exRZFSUqqnlR+cpkzHXs5j7Yb2IAfjhdVKP+oEAKGaYUXkAaS03WjCmTm97kArRqkVBuq++jr0E+dp@vger.kernel.org
X-Gm-Message-State: AOJu0YxINZFF+F25DdftDHSm4cY1pbcfjeuoY8Zu3AKavTgVgWRdHFq5
	oUKoeUO5tCoAjnudkiVhRo/hUNf/s9pq8QlTQC01iNz9zbdDhdJFpb7OMbIHIgEnd5hbc4vQ1I7
	feBE01ErE5ZfRPRcgRkEoUpA5KLRPB8ekzLdHlMT60W6yg3SRJW/voGddPysKQtL2Tx9v
X-Gm-Gg: AZuq6aKQu8DnJzBYrPIwGq8jpZvzxLfX/RaSGWH13l5fxT3kyxj+3y06/5T/12ENNs0
	FJbikNfQGbSzxCJKdr1vlYUTcmL6zmPrmsrIyRqogP5eL1F3cXQ8EhfcCO0tOFQwU0yLxgeG/yY
	j0gGU8d5xkl+4E7atzUQm+D6nnLyJKqpBCN2ZO4vn1rJF0Hibrdurff4od3iOv2tdeM65ZnfalT
	lAmPE4KK55nILxw6AaXnwLjAZS6VUAWZgiSnv3cmnMhlmxFOrWa20dh4+NyIXtrVEb8ZeHebC7I
	Lq7Tp20OXxg3wVQxHhsH3FMXdG0PsAiLbCBEHWyaaCIYF1NXOiod9voFy73XIlkmOw2ftR9sNr4
	SlCPxEUQP8EtLUpNOcOnB9dswerQI04UzocqvgZmmuWql0MueI41tHW3A2Uef6Bp/g9M=
X-Received: by 2002:a05:6214:4d03:b0:894:6c97:691b with SMTP id 6a1803df08f44-894ea075718mr154409236d6.6.1770121435516;
        Tue, 03 Feb 2026 04:23:55 -0800 (PST)
X-Received: by 2002:a05:6214:4d03:b0:894:6c97:691b with SMTP id 6a1803df08f44-894ea075718mr154408786d6.6.1770121435029;
        Tue, 03 Feb 2026 04:23:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691e53sm9060151a12.21.2026.02.03.04.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:23:53 -0800 (PST)
Message-ID: <2d2bc77b-715d-4484-86c4-4389ebb63856@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:23:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] soc: qcom: geni-se: Introduce helper API for
 attaching power domains
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-7-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202180922.1692428-7-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=6981e8dc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9pTQncvtRyGiLAFmc8cA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: OdITDSVtzFGOMEz3WIDVyHyL4ZvNB41b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5OCBTYWx0ZWRfX2bkES+szcqSt
 FStFsZz1g+Y8TRy8hh3ZN0qlwkcBu7DGJE3GWi/i4sDG0FsdaoWHGbRUfZfhm6dEtkh4BHZ30I5
 PhNW368wfhf2W+AqO5aWX75wZChgqiG7XocF6tKv9I+H/kOhM0wxob1wky4D011lIJBj/8OX/p9
 Cvu74Up3i/e+FBuscPydemNvKroihE/LoIJR2rCqwg8rln+EC0FeV/+TkToHmd+uXfj3652Svrf
 vUUDGVyOJ/z4YZlW1ZJpgMM4gY3X5eJveK9qS7Y9yvyFQbCn8MS8kWgB7SJNrxrqjmc5PMfLJpg
 6GA280aRGMH+0e4yPWtxO8fLx+RHy7Wa10fCtThpDWdkeUGjp+lRtSP7328172EaNOlALgzAW3I
 z8gi3FfwKjuL96+7JKlnsCCMZzG9vp+WcJnl/R7S/IDLA8m4QagTJdZxYqO5EsKMRmxzWlf6wCg
 DYklzRZ4O1L5BFhEFPQ==
X-Proofpoint-GUID: OdITDSVtzFGOMEz3WIDVyHyL4ZvNB41b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91673-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BE60D905A
X-Rspamd-Action: no action

On 2/2/26 7:09 PM, Praveen Talari wrote:
> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
> the attachment of power domains. This often leads to duplicated code
> logic across different driver probe functions.
> 
> Introduce a new helper API, geni_se_domain_attach(), to centralize
> the logic for attaching "power" and "perf" domains to the GENI SE
> device.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +int geni_se_domain_attach(struct geni_se *se)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +		.pd_names = (const char*[]) { "power", "perf" },
> +		.num_pd_names = 2,
> +	};
> +	int ret;
> +
> +	ret = dev_pm_domain_attach_list(se->dev,
> +					&pd_data, &se->pd_list);

Let's use devm_pm_domain_attach_list() (notice the 'm'), as the list
is never detached from at the moment

otherwise lgtm

Konrad

