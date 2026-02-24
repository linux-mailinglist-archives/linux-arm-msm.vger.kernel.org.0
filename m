Return-Path: <linux-arm-msm+bounces-93997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNh2Ig2qnWmgQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:39:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC1187DA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 003D4304EA4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4303C39E18D;
	Tue, 24 Feb 2026 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGTLrYGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWKOXaFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA35539E177
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940316; cv=none; b=hTnk2Sawf4bBZlew2nrjWXbXMTshjAZJLf41szjLID+BSH6oGW4RU9swJc1MaBBQ4wREWhCCfgh/HA1JbkHDez1MhlBEKVk3nMETwT7u7zIC6YcVaYsYHagrawgyCU3xSt78A2qEIckEYHA0AWJ1k5GbZtxtVmw/TRzDQ9DRxAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940316; c=relaxed/simple;
	bh=RRHaJrQjbqVQed8zDQo6wtkCqIAyXF0KnuFmP6oFYfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQ6tOEdJeUzfuulgJw+/7arXnu1OXkEEblOLFIiMNlAOFrBE1ZMt4VQbgbhx0lo05gyXk9MIxkUHhIqMncM3Yj4fQ/FBEuFAVFOGJOtseRKzldVslGFTDBHLhuFCdHNzq/tnU0jhSGUjqWFnVqgtyOP+tfWktTKkGfIeYPBGSwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGTLrYGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWKOXaFk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFLLp2560017
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoEOEx4Y0WhNvSWyPsfQfKmKDc7kHerfzdp+1pHAfkk=; b=fGTLrYGPR0BQBjM8
	SiirKEPcnhlqnW6SwX6QeC+gtNd2e+8pGPnJMoDLLoAIvRJQrNXkGh3kbc32Lg31
	Y1SL9dHAlSDMdVDwBT1qEs/t7gC+y2kO82vJ42TPYljGUdZPWo+YVuUWZ2i9LfEY
	l/3c6rVnrvvi33ucmh7AQk8MEC+aEvd6i2AT0vw8ioX5MB51Gw8enfLI1u1cuQd5
	lkRpeVPqKV0memmq/LzkOLhj/SeUwuNEDAt0hgi1m14f33IHk78jXkA+WbBQenlJ
	zmGHM+LZZSe3gnRTFlFJn2itJlLs74s2SGUMHcgQxQc9hhy7Lku9GBTsyykbBh6V
	Y+qU3w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e39hyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:38:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so60414106d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771940313; x=1772545113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xoEOEx4Y0WhNvSWyPsfQfKmKDc7kHerfzdp+1pHAfkk=;
        b=BWKOXaFkBv8O8Cl5ijsyw0Vv54Ivo3etvO5p1oKsyTK+dYJpQB0ByuIJ6u3EtmLge3
         ZyEdmZHEAqG1aDXwH6kdxqW0+T//u7IDin+LQBj563X7v+U5kvgTI4LklHCMjN2XK6IG
         gTxSNUkr3JaQ4mUvCzS0BVT4euojglCVOieFMVazTTkm5aTewElWF3nI5i4YjbE2Byvb
         c4Xx7Px/6q+kuMGQrpf+hETQ4Hhq//Ecn8D6/2WyedQ1JhtXYXvZ1IF8Wdq3eliQr2aq
         KKRSSpQf/sHMM8euwSXBcduGP6cVvYVI4XiWHWiq6ZKa7Hy3PhYYsiPuOneQMSnQQxAg
         UsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771940313; x=1772545113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoEOEx4Y0WhNvSWyPsfQfKmKDc7kHerfzdp+1pHAfkk=;
        b=BY6tOYwYvngwgLkYKAESE0mSSO2vILjgYBxRPbpf1pszwkcrL7NWKPCsTwUbcNIBo/
         wcJ7Vv6CJsuqWDeEwGSthuWGRWmt8sKlDMpo2GgCgZgTpSwYcW2DCkUnBorCMSjrMM67
         hZZkXB1K9lmaRJEnE2t3QUBZnaeeuWS01L41GFn2SY4u1F6gE/ETNA8+D/TNSuNNx5by
         AWsAozxO3MYfzTjvBO1EtG0OPdtfQ7O0n/uPsahmRQdl9qgrXjJ3Vzg+fhqUbDbt23A+
         uHgERACO7gEiN7llhXc4wrgo6SODS63Efrj1sGxAaczOXWYW/rqear3Vui849EKseAIJ
         p10g==
X-Gm-Message-State: AOJu0YzZLR7B56w8RVIJ+lyZdQzZfc8O/Q7VpnrfTfW70yX+K6PvaWkF
	UoEZaLOhu0Kkwwt6kIFf8fbyFhAL1P/M+SxdsKNphyYLlq2Mp4tpVXJadapdQ8GASjwOp53EEj6
	KTs0t8tmwIGMbupKw31oRp4OCBigsQPKrrIudiLgrXzz/XL16m9hqIzTRy1CRBcftHg07
X-Gm-Gg: ATEYQzzzC825ixfMRYh+DpzusLgMVnDvv0h+M3CNrmiLTHGA8Pe3OaQxiBRPe6bQFu/
	kc1EWh0yqVtCDCD/1WlGk4ZzTGOKBnIWZsHv9DB0BaNzfiXb1OtTHc7hOPf1cRmqxFeydsGvI9f
	SO5W2mqeBZR3ooQ1gWY3xvpRwq7yqR3wSz3V0/LMmcWjdPYtkcdbZ89reXPuOuad4uPDymJ1vXk
	EyGHTUuSNHckCbYrS/TU2abzKUcylychL2Px8llJWhUzjv+YjfFldh4T/E4Mc5FYqb/+r9hPSRK
	IbVnIIAF22n2YBI/1moYa1rRpfQQH31e1GHF77BrxckBgwEZ7qhXu9KLipEoLxXZhx2G0F+hSYt
	GukyB3oQ6F6LEjtFncJAWYrmKub6DrnZqrRKxdwNqhEy7N12hXuBmrtK571f3HfOJ5nKBHDtNph
	fc7ys=
X-Received: by 2002:a0c:ef86:0:b0:899:a83f:a8bc with SMTP id 6a1803df08f44-899a83faf34mr11450466d6.5.1771940313183;
        Tue, 24 Feb 2026 05:38:33 -0800 (PST)
X-Received: by 2002:a0c:ef86:0:b0:899:a83f:a8bc with SMTP id 6a1803df08f44-899a83faf34mr11450116d6.5.1771940312552;
        Tue, 24 Feb 2026 05:38:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084caea29sm421594866b.25.2026.02.24.05.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:38:31 -0800 (PST)
Message-ID: <f52f3f86-5ec2-4d3f-98b2-5ceddc7b71bc@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:38:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pmdomain: qcom: rpmhpd: Add Eliza RPMh Power
 Domains
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260224-eliza-pmdomain-v3-0-6e13d3aa70a1@oss.qualcomm.com>
 <20260224-eliza-pmdomain-v3-2-6e13d3aa70a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260224-eliza-pmdomain-v3-2-6e13d3aa70a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699da9d9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uL3VJkIVk3A2ITQRuggA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 1y7XMz3qmvjHNI7jqKRbQVwXWfq_wUlj
X-Proofpoint-ORIG-GUID: 1y7XMz3qmvjHNI7jqKRbQVwXWfq_wUlj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwOCBTYWx0ZWRfXxjvaVkuurty1
 D7g4GwJM8kju33TwcmdPDkPRfx5Y4E37L+iQ9lfBCZ3essF1kDQKiZD66k9qiUUuS1WOS4A3JyC
 1zDhRL2mrdjS9ThnhqDZwmYGcEQgH0BwsmeYxQT4q+ccY/4gL6ym74C7eTkYFw+5Sli91IiTprg
 PJUYdZ4uuUSSHXG5JPG91EQXrJH9nPxqtNXjPIQvT1Xq/KhS68D8nwkd2Nh4sx/NrZ8nwfDHQFP
 45lWGTnShw2gqH8Xk1z0jUT4Io6PtJQMZZdvw3lhiFo8vu3L4ut8rvxmy+OHg7tpX+tiCaArS3Y
 J8TdOwnzVqPGVO2PXLuz3IMwQ01BXdTsLcuroUa6fSkyeqB2fg2aNDIszZldT6Z2s3lx6mI4z2p
 yChg64leOlfo4RXIpoRKBUQO645LkKgvNd7t2szGE9SzUFETwWOH1lwGLULxP1BnwwiA0Gdt2i6
 l8ih+d7aAx/InCljSDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-93997-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74AC1187DA9
X-Rspamd-Action: no action

On 2/24/26 10:49 AM, Abel Vesa wrote:
> Add RPMh Power Domains support for the Eliza platform. The list of power
> domains is taken from downstream. Even though the cmd-db does list MMCX
> and MXC, they are not used, so they should not be describe.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 19849703be4a..ef2e08c6b454 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -217,6 +217,27 @@ static struct rpmhpd gmxc = {
>  	.res_name = "gmxc.lvl",
>  };
>  
> +/* Eliza RPMH powerdomains */
> +static struct rpmhpd *eliza_rpmhpds[] = {
> +	[RPMHPD_CX] = &cx,
> +	[RPMHPD_CX_AO] = &cx_ao,
> +	[RPMHPD_EBI] = &ebi,
> +	[RPMHPD_GFX] = &gfx,
> +	[RPMHPD_GMXC] = &gmxc,

GMXC should be removed as well

> +	[RPMHPD_LCX] = &lcx,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MSS] = &mss,
> +	[RPMHPD_MX] = &mx,
> +	[RPMHPD_MX_AO] = &mx_ao,
> +	[RPMHPD_NSP] = &nsp,
> +	[RPMHPD_NSP2] = &nsp2,

And this one too

Both are OFF by default ICYWW

Konrad

