Return-Path: <linux-arm-msm+bounces-91001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA61Io3+eWm71QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:18:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841DA117C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF58D3021711
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEEA2848BB;
	Wed, 28 Jan 2026 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ju+PdE1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIxeQWmm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0B19E97F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602680; cv=none; b=hOhOGj+BPLeZ04Nl8BFZwW7ugv3o+PbUipmv4ciSjzSxumwy+WxFTxsMD4xxCUCoopL6GHtQGDnR1KXg0eCaFtNMPAPaH+ahQsC7em+lez6jKIjedk9X0uZg6oFDd50iQ6tLqm7wEq8EtQMRKN+44Tez94uI353HOeN/UHy9Uqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602680; c=relaxed/simple;
	bh=AR+UqhBKwpy4ujZJ7E1C+x9CVwvcSjBxANwM6Mg81ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8b1MGUXVafc7kSkTWzVgfMl29pbdsPUupaO7Gp/s7iXf6yDVnSzHi9HjW4s/EW7kVWilrT48wjckpnR2ttzNlSwAtv8cUAg6FLqmDSVMAEvaRc/bkNkI830vLfOHcHbAOVVyQ/KM/9z36RR9GGfgzdUcPu7zZGAFXayfU0lXPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ju+PdE1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIxeQWmm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92ck4041993
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR+UqhBKwpy4ujZJ7E1C+x9CVwvcSjBxANwM6Mg81ik=; b=ju+PdE1L3Fxthhg4
	FnaMzPwNWDADBTTYWV3ZUiYGsqgt9pwsKCA2bZy5zF1FT3EFz8GFdJrDllKqVHi7
	NS/TPFEX8xQY7hYFwToF9I+mbJlp+b3YeH8awJ5WrINa2nR0ghuHEW7AmrtOIdqm
	TSfLIHVZBRW7YczYmirCg0KDoppe8SyGaDYy2qmX8MpT0HJnZqrR3Uut7ZgX7gF/
	/McqoyBDSJNwe+omXlwunumw3pEmHsRoJRLCLqTEuqUWxQnyz9SIxXstYRFvgZee
	QzIznHTflwo68smLrbeVVpCWQll8GGL4iz6tRUhuKkwyUVfCE+LPqG3Dc5vj98or
	ZY8t+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355u062-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:17:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e518fb75so101244285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769602677; x=1770207477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AR+UqhBKwpy4ujZJ7E1C+x9CVwvcSjBxANwM6Mg81ik=;
        b=eIxeQWmmHkt0LPcGM9A6GX/mvQGhOE58/sz+0tFnUjJRZ8ZfkuVdmXbJBKEgK5zucc
         6Rm7fN+6MRDP4wpYbiaZXdcFnpsQa3WuKhpTeMoGDKPDWacV2a/ZZgrJBmc74VW2W51M
         jnT+hAhEu6DX1uhPcx9XMrD81rZ4cUEn3wVHr5BdUGMhuMLlBd5bLfa/MLcjtXdS/Npr
         8GWR5e/iIX8zZOb/rZTE9er7Y6Eges5CaOsbXCay6RKvKT8meuZ9iRHkxTfXC+eKkdn6
         cuEl3h88NbKo17ZZ2lKUk3wIh5vd+g33FOK5JAE7QU5HjIOyWJPIQ3kwsOvqvkCaX0xL
         PiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769602677; x=1770207477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR+UqhBKwpy4ujZJ7E1C+x9CVwvcSjBxANwM6Mg81ik=;
        b=jiKW3DFddwV8OpwTyo6Vbcetdp0X0I3YoLx/f1DnnVDP1cMSoIkZvjpso8rJ8KWuIu
         pMpKX2pEMzEZ/O/8WzO32SMcEKha+J0M0K+/4qYvWhmQ/oEES/Z34IvBkZj7GKovUzaH
         fbl5uMWAOKf//9HMUdTJAEQGGTKqTTmmjyvfdrQiZv4paXoS49iZnkCAm/tsOfL0pEvs
         k38S0gmUtC4fGT0zCLx0EsZYwfD8MwJX1bKkeCVPVkF8oo60hF1OKENGijVtwgVqjRq/
         3sg+n2iy2sZNldXwhVoOUZv4v9qxDcDi3En2ySEVODITrR/CJFfBjKFRMFtCeKpQuHsA
         FuSg==
X-Gm-Message-State: AOJu0YwNMr4TByn8ZRLQcVRhgQRoIFGTyBcAmWt4lQTR77pyD4QVbh+m
	nsWxHTfzOgKoidQILNYn/q/Vl57p1mXmVZSvUI8sS1HbSpXkHLocZz9SXT7pCKVbXIe+cjCKFOQ
	t8/CKT+GrPvTEpQF80oXaTAotk00jjs34qohgfxhqk2Mr42jzafy9LQ64VapiVkbTo6vX
X-Gm-Gg: AZuq6aIaYuSL10D35HUiVvnESVj365GiF0eWYE2q7+I6XJlpKzsiJPvtuY6lTBNRw1A
	sy5Eh+yY2yd838sphfLFaNCBXtEtKX5D6dDcvmB1/NTsNOVpDd0DDFivYkwvXBHtpngaZ+Lt/Rx
	w037alkjE21ecaJkOl7DrQ9IKkhu+8/YbYocvzQZMPn4Zi2yqq/D74SvPmdSBI87qXoh9+AIV8R
	SnhPdvcOcCr9OCrzRDbf3FtLS6c0pLEzvkocjRi5IRfzlqDRJ1B/+YplBBDkhWmy0faAnExx/vF
	k4k7grSNAK1KBCmorwyV1Fi+/9jHCXsA9P5S1SEA/2RINllU7GIkqETRXhcYiNz20Y9VlyJkRLG
	1UVHreDsonISntufy1a3uaKpplwuyyh7IqU9o1ECoac8JsyD1ndEsYPcey3gQQNpYIEQ=
X-Received: by 2002:a05:620a:459e:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c714be5fefmr131717985a.6.1769602677556;
        Wed, 28 Jan 2026 04:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:459e:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c714be5fefmr131715585a.6.1769602676980;
        Wed, 28 Jan 2026 04:17:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc8f96sm124366366b.25.2026.01.28.04.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:17:56 -0800 (PST)
Message-ID: <646d0b50-e138-47a6-8127-f3014a50b6ff@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:17:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8650: update the cpus
 capacity-dmips-mhz
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org>
 <20260128-topic-sm8650-upstream-cpu-props-v1-1-9fbb5efe7f07@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-topic-sm8650-upstream-cpu-props-v1-1-9fbb5efe7f07@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=6979fe76 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Lkd2wKE8c_SYazGGAOEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rhO39G_NbOwv8hqfnGA3Tl3tyCWk9GZr
X-Proofpoint-GUID: rhO39G_NbOwv8hqfnGA3Tl3tyCWk9GZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMCBTYWx0ZWRfXwtxeNu7UH/5P
 JhQApJ9bkzj0qP30QcegU2AbAz7Sw3KkBXogFYoae/kbpH9xsqZ3MCyZAdl7VcxwMkwf4gJebHB
 8HDqK7S+AE3znvlUNbcx6hK86G5ENeXwPkjKBPRatcr89b/xZBtXnXeIH/eTBWARkGXIA5d2fNf
 Xxsmn/dBmYAESAHZOUMp6/8aEtHUIWkx1OUQ+PD6EDW0InTZCn+KHGTGwvlVC/GopAU3efLIY+v
 k+bsb7yrPfRGoeJmOA5WpmySszcxWNwBkLUsFzpM0VXCfTmZnBxIsN2AB91nTckdF7BCXQLgLsF
 s8VxVz/eW7us+YFHndI57QiR+LdpmyP4OBaVCm7IrO28JODXDBC06FWWrnipe14jcpVCXg5Kdyj
 vn75PBzaWq5O2e1adDbOpNOXih410kd4FDtXtjbRhzvOwcL7TpRuBFoCUc0Kvz2yUw4IA9Hj3vy
 NiIPsxchrOXZEQyMlGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91001-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3841DA117C
X-Rspamd-Action: no action

On 1/28/26 11:33 AM, Neil Armstrong wrote:
> After some more advanced benchmarks with Integer, Floaring Point,
> Encryption, Compression, NEON, ... on the A520, A720 and X4 cpus,
> the median gain with the same frequency range is:
> - 281% of A720 over A520
> - 126% of X4 over A720

While this is all magic numbers, I am definitely willing to believe
that x4 is 26% faster than a720 rather than the currently stated ~5.7%

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

