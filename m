Return-Path: <linux-arm-msm+bounces-108998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BqEIqTTDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:43:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D695A289B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D598301A319
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A5637F01C;
	Thu, 21 May 2026 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgV7CS5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THn4LqTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8E337756E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356576; cv=none; b=DH7veLq3zkJ5VASdDnzVdnDxLL89Ras2xM+VRdBFqMmSCj/+hxSvs1X+I7CTfUE1A6t8y9OUg7CvvwkeDd7uC3tiVDYn9yk1ua03zwNBqsEnsMdwJxVmUnKQ5j3xSZzr8wGqUFqjBXTHrGKtubA6Qr7jeIe0xBJU6vESX9NLYxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356576; c=relaxed/simple;
	bh=76Npx/Dj2IdUOT2bSfFas7IgNHimnQX3IkL0WTge3eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bLAhIRYOcqtB72RBfoYByX40paB9wUoklxpvUQX04EeMgKL2kbu5tmGqUedtcBFfMoN0z7c5O/gAxKOg9Nn4bYUQVDslA8ho/kYFlcqjzwPH8jNKkjUw1Wsos5DJPFmW4obhzqzoD3nsWNa7W8wwcw02rQuT+YPT851LQ82nyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgV7CS5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THn4LqTH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99xZQ2632717
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DBwUd4KHsO7tlBa9Aw/UBAV2IQBpN1th6rKIVuFZ6rM=; b=CgV7CS5ISRGlcJc5
	EPIcW6ld8HANe0+HZvnNfMgu8mjJ8Ux3P/RP2abyU7W/17z8t+KhUjwmi4vr3fFO
	M6nKuFr54Y5n/a8/7WEtdb+rtckZnI2tTxRAiH2yoV0ysiLHwcjFpt2D+0v8MXdw
	Hm7Sr2jorymP541/aKH4NiiCUQHKGrHOoezZWbOvdAfpn5smEaLxNaoYkiUTSWk+
	bpRlOFYBCaLpTJNXpmx2zGdQ3+FPgMqfiqq93lovZ0XS2SxeM3H3VpPNbYYsq055
	bOYR97uru5SVTK2d0ckmy3mQyBI+bbrWHeLUrXFIPg3wLnZyv36ra7tszlDE/gQX
	69KIXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8caqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:42:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90fef17f6f5so153520285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356573; x=1779961373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBwUd4KHsO7tlBa9Aw/UBAV2IQBpN1th6rKIVuFZ6rM=;
        b=THn4LqTHy17ewf/GlnrpDuQCv8mkcQVz6sofDqUNb6GbPb4q0AhvM8IDe65Hl6wz+m
         DVkWvuECQT9aVc+Hurt1k3lIsQJqWTs2xkfPjNirDq3q5ZR2TCMjW9TjFOSt+pkfwemx
         YiSP4LhVeJ9Cjhb5muBH8LanF3lUfEH38OMKDeqOg0fpTwbzcuIHwFlibhTkEQg6Q33R
         u/mgjwlpu/BolQGkvxtr3+5zAEuNFULMuDJ47r9Dzc8DvyfFc5OTmyu9rH7gF8WrMxPf
         iX5vSZmldrPnysBX94cVeEGyG+qT38VDK8hVAozbijsbch30y6XGefMbxWu/1FoCawqb
         w18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356573; x=1779961373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBwUd4KHsO7tlBa9Aw/UBAV2IQBpN1th6rKIVuFZ6rM=;
        b=V9XrNlHA5wbUoHDLsGTZ72CXTkjJIvavos9xh+olkpcbUEyI3dAwCKuUIUAb92PHZc
         CfOC5y8PBWOGRlwug9YC9sw3PG/5wiv3g1E48VDWIMeyoWAkQ0eRA0ZynmeqLNwW3SbZ
         dS00k0HlorWTAUTqJxF8JKdxGTcKUNdR09isEOPz1wSkSEOuZizP7Ni85yMoRrJUIeBP
         qstLIBKGeoxNDbalNytFvN/ym19v2R9yBxbXupmHUVy/VS27ADphwKFIUtUlZmRKN4D4
         b7UkYJF5kz5l2UFj4fGtCYZBsIU7rMKwFWZTfao/7FNsr6Gr31/pD1ddJL2N2+zex/h1
         PYCw==
X-Gm-Message-State: AOJu0YxjZrGmXotU8P2MNXlJulGgI5vLB4WcLk8BstGNWBfV6XBWvsth
	qlh5/WuXz7rGUE++Le9qmG77n9C/eyK+nvgmir3pfLG4/O4Bit+MwVpu2Amj8PWfKjbS/7CkQeh
	lzKwUURv99EKynB8hDhRmB/aLqemZzDxCzTCpCCONDbEk05HIVaMRWkEcMRMyYpDRKzYY
X-Gm-Gg: Acq92OGnDMeKfbFeq4/s9ydaeCeoTtI4WixfqmJQppEawZIHe9/u3go8dqjZ7J4Oyky
	/TO+PaPPEDhqI8u29MnGrUp18RaxuhMfCakjaznLFIIweOTNgmDTz4vnjsPNTrdQlisPgH1eF7y
	iZuDCUkxpHfVanqCuNNkehbLFeKUWxVlDuXAGkr8mpprDDFz+84pnEdZqtGYI7furhc7CZLxGSy
	DVERGwCdaHjBlewKA9Zk5sMWhNF5cxV4cez7adUlbWY2ATLvHDZaFBlgTPqvT/jj5ZgTT3na7ez
	IwSpO789T43jeuYLGBhHlEMnlDLM9QZbcuyzUF9K4oF4/XzJC5D1fb1tmNeeeCfp3rmkQtoYWcQ
	k7/mCNZYrFuxZhsnRUZcFRN8+1XE8QIxMprH654zduTIgOcyQOtJ9tgwnJEhmpBhsV3ActAJu3l
	GPZHrRVObob4uFHw==
X-Received: by 2002:a05:620a:3193:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-914a2e3e411mr167449385a.8.1779356572738;
        Thu, 21 May 2026 02:42:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-914a2e3e411mr167446985a.8.1779356572203;
        Thu, 21 May 2026 02:42:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aef37b1sm22701966b.55.2026.05.21.02.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:42:51 -0700 (PDT)
Message-ID: <907fd71a-7053-49eb-9547-592ef63333e1@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:42:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] interconnect: qcom: Fix indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
 <20260515-interconnect-qcom-clean-arm64-v2-1-adeebc73596d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-1-adeebc73596d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5liytzcHvgaMO_hqLHci54q85Gzihjvq
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ed39d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ewqw0S68lcnLxXb8CmkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NiBTYWx0ZWRfX2wlVscyUKbbb
 7H/cbs8gxDmeO1MW85wXYW+WwZ6wAoHaQMcOZn2kHvc5T4KOzgQMlnBtOtOQzwe6AH/I2fCIY2k
 ef6q6eWDBBhdBEnEtoPnDp/8S73WdjHT1oDIiXJojGYjJ5Iju8wmZc13UuXUW7+TRIfpYe+DITr
 0lx+jdTIeckl2Qhn8tCmEJwlzoHk1HeQcfkaQ+5Sg9r8gb7JnvvNhakgxYWBqUrojJLKetbxbUU
 JdeSaLdhM9YGAxKlEPj3lrro0+2jgdnyyfkX/YReDXeOPM/TqeUcuxRvQYIns4lc6OUJlgUrGPE
 jlCxz/Hk4smuRftVHkhOHyMgX0wUXyF6gO2dUq4KjMC/UrmLELjKvfoLt0miW18cp/Akp5xrF1R
 Otpui9PpXhLZuQr5pZJRxW+tLPN4sC/G93ZaBldqpwgXJHy6d4K96HRAnCPqFTxYQZckk/1Yz5F
 dNCregbBlECF0eXnf9Q==
X-Proofpoint-GUID: 5liytzcHvgaMO_hqLHci54q85Gzihjvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108998-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51D695A289B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/15/26 2:11 PM, Krzysztof Kozlowski wrote:
> KConfig entries should be indented starting with one tab, so replace
> spaces with it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

