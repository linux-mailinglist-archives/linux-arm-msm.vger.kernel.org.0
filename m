Return-Path: <linux-arm-msm+bounces-114521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y9elEOcZPWoUxAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:07:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B93A66C5621
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:07:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S9EcgqNl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OU02l2rM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114521-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114521-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34C3B3010246
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE963E0080;
	Thu, 25 Jun 2026 12:06:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A33E00A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:06:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389209; cv=none; b=g+sNjGklgE8kjpErD4gH2IiDHYAVwq3rtnHiIJArehpmk0pN5Ecy2r5k7gFJF6mnog6P5rhXx7k1BzebqOk5BXNiTnkfMUxFifkvUU6OtOtZkrKXWKgARW6ElSCCAGfGkpcyVnEW6xg9yCFtt7NLFbN769M44gejloK+kE0rw6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389209; c=relaxed/simple;
	bh=ikVP8vyVJy8q6fBp6aoS9ZFZaajQoxpHQdjadgsnrgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qt1hDdPxuL+l4jKTEz46p3ZMKZk71gmm2Yu51Qyne9hhOwCLhjoT2VjI6GBTDO/XFAXZyQBWH1mR3xDm/Wps9x9b9cpDXyMKj7lTrYcfkerjWDQ9ycsvKB57Wq9z95R9tqoL0LDSdfY4R4r1pp3IwsnXkNYw+lyarG37aFOhnzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9EcgqNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OU02l2rM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9juxq2046505
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTU92ax5OaGynEXW83VzPxNT70Dj4b/PTr8K6Ctdt/U=; b=S9EcgqNlL4I1yw8k
	L/EsxUvuLHxWNomRvVrXQxH1+seSzh7Xnuik7HahKmxxPQVMVIU8rOcPi3Kj/q+7
	hbJyYYrhedFmexKnkW7I/BLEuRPaUaZZ2gOx+pqFVacXitOHgReXCf8OA5xukXWp
	s/cPeuIpcsiK4o4e7hGewcEzUludznu9OpyJN8Ly20wPCUU6G2ghIDFLU48nq0SV
	J/pTzdNbYJOjqHhOLrowkm7PsIPu8gJDHM2hLotoUeeYZLM5Ue4mwxXiacflt+HL
	+6YqNNK7bN9KRrG/2g6ji+iwabVHtrMN6YA/snbm+6yimJS6q+6e+S7FEXbp7zLu
	oJ9lag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhy3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:06:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-920f826bcb4so47178985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389202; x=1782994002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTU92ax5OaGynEXW83VzPxNT70Dj4b/PTr8K6Ctdt/U=;
        b=OU02l2rM16WwIzXY5Jzwmq+6aI011DY7YORZrPEV2/0HfVmFQLXtzukvEwPYY/UOBk
         xnIXCrDE7WEHHkb9MMpiXTCdb8XpvtCfvpTXBmdidlOEcbbEdbMyEycGsZHxrS7vjV3Q
         C1zOZNXsGbjZXf1Ot4BP1Ztp6L1+j+442u5xQSzq1/7sIAD8sVGX0Yvw2ougAfZFdRoG
         EYHp8QJk7hVf7BFHoa81buZHWZDbF/uM7rPM/QNF/8vCo+nPeOzni2Atviim70LjYJiZ
         PhMGn326XIT31JUtrFiQ4TW/2Dj7W9phzmmEE2HvcmT1a0A9RwBH+jJyS116qCzrM/a7
         MbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389202; x=1782994002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTU92ax5OaGynEXW83VzPxNT70Dj4b/PTr8K6Ctdt/U=;
        b=FsQYV1METrB4sQ2lwdjny6DplFmbIOUEi0/DGCleQSKODoH89YY+lMjG0UDBlYH+KZ
         A1e+a+INKtb4jRGSHwwwOoYUyd377edC0RXxFQ/90Q4n72ptoFgVnHGYbzzTed/uexKi
         cChxmL0u0iA9BgqdPy5zZEhxWmr6e1wcRxyBlTCGlEe7Gnd8S0ijcCUcfN0ecksENouC
         LIDx+ZZfkjIBJ+U/1qQDvOBtRoelQDElEqz7yTe12RcI5MbBxh7S9InEFIesC6+XgtNV
         94RTtqJgoC2qDSsu2hk+ats+Knocs+qveJjohUJ3hu874HYvOzTkZgijZDRm8LsOdvlL
         r5yA==
X-Forwarded-Encrypted: i=1; AFNElJ8uUA2aaGLzqmqMqSMJAzTRsAkBA3kQkpykkjp1vO9bdYqkPoU6C6JP/Xd7QFOlCRMdw3uJmsNkhSrYVfoO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/pXCKVgddEv4z+wSiz3It/b9Kk9ajpLrIuLhBBZefsvMGgQno
	w+DbNGlcBymsExXuOwOu8TdSKNiGC9FkV6sJGxow1NhEky0lmrOe7f2HFdaxZHF1jvG/wp8D8/+
	AG0P0D95hJcg/YUjBJVR7AS8l+yJ2BD1WVfuHmIWuUKKS/REM5z2tpCp3BFJ61fvinzOq
X-Gm-Gg: AfdE7clNsX95dPqtuwVqv6BMTGRw/YCwbcf+UtTowcIgJ/pmIABEuB3NX+ieQ/AM/pk
	1EXWK5z5avzN94VY3HZMbSLEdPJc8C5OCVUNPWXil+xbtQnCAfEqW/jpaCPamR/ykrV0qQNYV0l
	IEIaWWXCcYzcAGK9klxVJJr3l4vOWsaril1q6tbmMhJYZCuDMsYwsbPJD1SXXVRjRurOrTRAap0
	41qgawmpxA5oDLLTMe587dDyFSuECAk+rctrWSmhD4Q/uMCgehBuBJZ2hGxPixs+9jmdqPJ2wPu
	RomfszPLy6bXA8vb8q9ML0pyFBkuW9UH1c2sSCZtW5NaA2FPnlIocd6idyQQIIeHdX3jbny+OTf
	ZheojhJabQ+bfbosKIJvxac2hP4p1Ko2yvEs=
X-Received: by 2002:a05:620a:44d3:b0:920:6579:bee8 with SMTP id af79cd13be357-9293b18b593mr195790285a.1.1782389202300;
        Thu, 25 Jun 2026 05:06:42 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:920:6579:bee8 with SMTP id af79cd13be357-9293b18b593mr195788285a.1.1782389201939;
        Thu, 25 Jun 2026 05:06:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbec37dfsm168492166b.56.2026.06.25.05.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:06:40 -0700 (PDT)
Message-ID: <4c8d6b13-6cab-4731-b3af-bb83de9d159f@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:06:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4b90GQkPxtiNEWBcjtt9NEq-IO7Kwn4C
X-Proofpoint-ORIG-GUID: 4b90GQkPxtiNEWBcjtt9NEq-IO7Kwn4C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfX3EO20A4cznT9
 LZVK4KLJrcQrXhFt9ghnW9ZN6LnTxwDfS/1woU638rDHkFj0SCPWQUp4eGN+Rbh3CDw4WuM5nLf
 ohl1Brk3b5CGnslIIig7qM25hZwreMY=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3d19d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PSJN4lgLe9xo7xBllQAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfX1W05EVZosI+k
 cREDjrgYJEufdj3I7hzSmQTkt7vCUckacJBNZQyN+ZdDuJhak6Ih6HxfjwRgG7jW2kiu9faM5vu
 2KElVXsS7zZXW+xFKJbkTYAVXqXrQrI4r6wbmVVtQwX0ylHcUtPnaWYSQyAKen5DJqsEqeSBCRF
 Fq56oIDyqG7+FcKxtCdtKsTQNo5pOTxofHItu+1JREWOx2WyZafOW74xMRhHcuPXHz31U8G2B1K
 9pX+St8lg7Ur775TZZPmiZzGhkNW0t4KZppz2Vm+mFkGxE0O0eK7beLmd5ZmD70UlQbWAoJnjH9
 tGjmlEg3JLdMugh8/nY7jRz4dC4ToC2B+PHHII9fOTL1ar4RAXN0cRQ53nCZfKaepPCdG0cUbMo
 my0WVpVZ83K6wU74R5naDmv//zu0JyHwIH/zzVNPWvv5ktYwUU6X4CB2Lj1L38D2y4vad9URKu2
 5Ow8MckAbGRhVhkAmDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114521-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B93A66C5621

On 6/23/26 12:54 PM, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,

This one can probably be removed, both files

I think the rest looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

