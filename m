Return-Path: <linux-arm-msm+bounces-109625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BAGNbgmFGrfKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:38:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF35C94C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44D28301C5B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA6D35B64C;
	Mon, 25 May 2026 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsNHIcq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFYoLbAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF78357CFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705511; cv=none; b=LRVHfWlQ4LU62z0t7Vwx0OLY2sZZyALElj5Es13ClprSNCl10lXuW6siAO85AABa+guycJFtvzTcMNIhMNU3Pn0LbJ67jhYlSOJUMzv/W/FFBvD3O6A/TpZaUiNDn58Tlgi7WC1CvHTbqKuy+4lAXeJuwr8/54MTu5NlBAq42F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705511; c=relaxed/simple;
	bh=YSz8kgUpzc5nXAU4kAzKN2Q06f9VZ7HLu7NW7kG1/SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBEhEhBzJDUpKT2lXfUtm4rCZqGhIzMVmXhkGxych9G3vkxjTRQcIkFshCGq514qTa9zl25Tk9Olw1iAJunJNntYmc1NC74L+xOYo9FNmTgXcDpUusiik1wHNh/JEQ7EOeTnJIS4j1xgcvG786RxRAqhEA6QFxo291t3hJXyKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsNHIcq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFYoLbAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P5ZKCY2460030
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=; b=IsNHIcq+AVy807g4
	XXmfIHyW5BPrLDfl3RunYSkoLFhWFVmhUyUjDQMmN7oIU9RlCgo27AgeyyH5uQ7S
	08WfMHu+tyOkeqnugJ7DWyNG7nqsqgDIxtmF9GtIfEogAXCG7XZnV/KJ5Ig+pOWW
	iE+70dCBAAruiUWSyKhB6Sni0SaQNKLa+v5XlJdq/z7XjwyQCV0AUUeY9KMfJPIB
	gLSwp8S7/zVs7nmEUir1OFAKDGqikMwndVRsVzvtCXKCLYjbIH8t7XaawHc3NAex
	gbJdbg/zliCPv7dKXOQvsN9G5WMggLfMWIXN/Pyfhy1v2VRvtS8wcrsh03Fq7ahQ
	w2gM+A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmpp8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:38:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82751074c8so14161229a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705507; x=1780310307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=;
        b=VFYoLbAAVOtLMENrV+0Xrqng7UvWw4p7DGHIiRmwu/4NvoNop9uCCYBOJGxzH6+VRs
         LclKQcPTFpfir1ErJw1R1+pyBWmPxkPLPUG7n8Jvg/lwRA+n/5lcFwGKqPURaQYPYbyn
         rCcfWkxXXwE7QXsvvkGtaDxhHOH+r4BpTtypcu1IpVArQu6ZYzJ1TrJReJ9krWwAGCpN
         Kq8AnzmrKwLMSVdmRajDLxvIXivV7EyzmekoeKU4txwnixsoXFPGAmU9WO/VdqBkt/9f
         33lwPHZ6nKoKR3N27zh8ykYhQBmiN0/DftBVQhkG6GVxeq0l0ocZAeonIVzAxp1iqdyp
         wCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705507; x=1780310307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WUL3QuzTsaS+rp5HQAAMFewSggZ5TAbPDLuNhZlb+o=;
        b=PGOeJ+SZ76pqni7Y444IKA2eu3zXHhkIdTjRH2SCcqteIyDLoDTBz4bFyO4bFw96Q9
         YeTLRv78qgGyR6mIqDyVr3EL8eVc8FfEwMuRpnMNDxnM1+43W27WM2UAEuYCRaFhvUpN
         /fiQwd8JTBdSg0BJioqDUgMF1gLFq1HGiu5Kk8gKuQD6dqDIe2OBTpdmzy0gKHm9jjbe
         3tDRomts+Cvccu43hJN/mr1fpwyggTHQwdy5FSptny2IT8896EgjFCwWjv5y5kujVJUJ
         dp/uDu4s4vuZ8z1x1lrljUQgnxmuX/JLKHZ/ZhM6tRynYUx7Y3MApLD6TjQVwopjd8wL
         w5ig==
X-Forwarded-Encrypted: i=1; AFNElJ+F3efgKxcG6dEX7W+JCG+NliubvJ3YxDU565wqqaKedv5ewl6Gg9T3794k80KxOQUGIq4ops98aAviyCkw@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnE2Go/b7PIpGvdf4utmNt9+H76DjsS3ZNMbuQZWEcOxraYDS
	RK0JL463lz04n5TG/2wm8cRJaIm26I7cHzx7rWT0bR5cpFJaXdWw5GHFmbCmB7O3KRuV8xWuIfI
	vAJVptGY3z4/VsiUlL8To5jmVAJLC2iZ3PFtupOR1CQr9sp4Ay4qsfVG4TiusLFHHgonN
X-Gm-Gg: Acq92OFEuC/rPc24xHmdhrI+jjjbOh0N7ZrwSb9cTktHy5O5jAnaaz8ELdxTtayqEG8
	TysojXLd6GN37sDq6Cfq3KsaBV3apr1qL0eJcpVTJoIc/lkUQhnLgXhFiy3CL9cIPYpf4u4X4nW
	H325r1R5f8QW+vjNeXei5F6RsTcx7ii/xtR832/Er0tjBja7CYPXeXPuFCfDogQhwQLUnc+NEjz
	H2KIZRLeApEFEKNrvGIn8UkOOALC7w//X+qv9uVguZ/FkRBKdn/e10Dyb1Q0K8WnmeDablnbTlh
	YfvSUPKvD8zIhd30o7BwxJyKLSkgORoCHOwDLaNqb8ziewA3RVPxBjsFzRO0ONVz4sI6ZW4WKSQ
	+qGUIddqoIhLrdIpfz7qXDwpq57bvI7VxzDopms8vSzXxjrAlae9jEOm/zKk=
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr15349716637.47.1779705506601;
        Mon, 25 May 2026 03:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr15349682637.47.1779705506118;
        Mon, 25 May 2026 03:38:26 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164affc22sm9242136b3a.21.2026.05.25.03.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:38:25 -0700 (PDT)
Message-ID: <d4473a79-0629-4a62-bb59-a7b7a917594b@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:08:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
 <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
 <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d8177e27-7cd6-43f2-b88b-2dbce936421b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOCBTYWx0ZWRfX/DrXTI+pdeIu
 euVWx5o0jgamwd6vBLjW9Twn03yO2pMI7NS6NKVuJnlmLMeFGGbHyA/T2ZpPiHOVVgglGAWIkFH
 82jMQD7uP1oINkItpoSZYqWKS30Hw6q7F8EvLtayzrIaO2Ykerj3B+gTomNc6uGxhVUa1LBj9l4
 cDtxM1EGkVzgWjqa08vM7yyze6E70OnynXuNjUVuWVB3/O6CYXG/5o1NCZV6TC27uMTrIBjm5wH
 catcNSznk/X2eFnQialsaEqxyTchYv7vjvXRCEFPvRVhQNbaf4LEbwFV4eIQKndV5RpkELZ21Kn
 x33XyWMPvihV3VojREgH+2dgi+J12RVAevBZO4vMmvYgTw6VAgM28beBNjbIkUWYVEMzj62jPIF
 4x8HyEqheRD2koJnInyxTOpkgGQLXNAasSucPtz3BypVyPxda3bzsE0UsvDxBtejDGMf6UbLH4X
 Wi/Z6ZwRNQOBSIAgc8w==
X-Proofpoint-ORIG-GUID: 3nSJxF46JunCqsPmtWMNl5lzzVtHaamq
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a1426a3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=plRfSYbjXIbEfgUgcesA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 3nSJxF46JunCqsPmtWMNl5lzzVtHaamq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109625-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FCF35C94C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 3:26 PM, Erikas Bitovtas wrote:
> 
> 
> On 5/25/26 8:51 AM, Taniya Das wrote:
>>
>>
>> On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>>>       .halt_reg = 0x4c02c,
>>>>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>> please use .halt_check = BRANCH_HALT
>>>>
>>> If I do that, the clock fails to power on on boot.
>>> [   20.324488] ------------[ cut here ]------------
>>> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
>>> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at
>>
>>
>> I am hoping the Venus driver has enabled the GDSC before requesting the
>> clock enable.
>>
> It does. From 3/9:
> +static int vcodec_domains_enable(struct venus_core *core)
> +{
> +	const struct venus_resources *res = core->res;
> +	struct device *pd_dev;
> +	int i = 0, ret;
> +
> +	if (!res->vcodec_pmdomains)
> +		return 0;
> +
> +	for (; i < res->vcodec_pmdomains_num; i++) {
> +		pd_dev = core->pmdomains->pd_devs[i];
> +		ret = pm_runtime_resume_and_get(pd_dev);
> +		if (ret)
> +			goto err;
> +
> +		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
> +		if (ret && ret != -EOPNOTSUPP) {
> +			pm_runtime_put_sync(pd_dev);
> +			goto err;
> +		}
> +	}
> 
>  static void core_put_v1(struct venus_core *core)
> @@ -320,11 +410,35 @@ static int core_power_v1(struct venus_core *core,
> int on)
>  {
>  	int ret = 0;
> 
> -	if (on == POWER_ON)
> +	if (on == POWER_ON) {
> +		ret = vcodec_domains_enable(core);
> +		if (ret)
> +			return ret;
> +
>  		ret = core_clks_enable(core);
> -	else
> +		if (ret)
> +			goto fail_pmdomains;
> +
> +		if (!core->res->vcodec_pmdomains)
> +			return 0;
> +
> +		ret = vcodec_clks_enable(core, core->vcodec_clks);
> +		if (ret)
> +			goto fail_core_clks;
> +


Please check this sequence is taken care or not

Power-up/Boot-up
1. Enable GDSC
2. Enable clocks
3. Request GDSC to HW control via 'dev_pm_genpd_set_hwmode', true

Power-Down
4. Request GDSC to SW control via 'dev_pm_genpd_set_hwmode', false
5. Disable clocks
6. Disable GDSC

-- 
Thanks,
Taniya Das


