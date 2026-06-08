Return-Path: <linux-arm-msm+bounces-111749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id puNnHGiCJmroXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:50:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB965436A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:50:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=omQlZx5F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MggCa+Lc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111749-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111749-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D01C4303DC9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1567C3B47D6;
	Mon,  8 Jun 2026 08:38:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4CB3B0ACB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:38:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907901; cv=none; b=GLxv6+aJrV97ru0T2XrVvwRaFZriFn5ij5TVqRYVx616LWbXtDx9Bn5NFqj7m3pJf4ioxXAQanvJB2GzpioON0UqHFYqA4Fg9IyPrZQ/E+s7ugvwJOyfyhcCux3ats2I5nZGxaPqIhS9624e2ludy0oVOCsywhO6GBgB5M9dgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907901; c=relaxed/simple;
	bh=uGMS5nj9pV520UNC0QBWOm1DjLUZRy/yR1ldZV5zuMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hk0m492A6rN6H0z8hOuxOsyLMXdu7ti4mHqPA52DNj9WYdQRj4Kz0U7MEnsemJx9KOou8vm8ClFh7UqZV4Ys/l+ZVAYKiU853+rHg3jWWhIsueRJcQZ1vYMLLdXJmhZ0VLXEWZXby2RfHnechu9nhCUq6FOHKwWeFircEI+6bNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omQlZx5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MggCa+Lc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586P2KM2833646
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkqSyrIYraoXJ1SkUGLDqUFNi9bzRAtX6dVnUv/1FcU=; b=omQlZx5FrLncfCfv
	cWALk+569ybUS4QZjJsTMPFOBPw/2gNlcucbo3tgMPPPO7ORyZON1QRr8uCzI33Q
	gM+cjS+b45hmAEkn10wxIV/QY3bx2VqNDe4gCz1OcEl2B3LCvooj9UQyWd1rKxKN
	RqstLmDL9LfDOn9EOyd7q00i/YwPZ2S7pAHfQ0xAzlRWfZ/gSnr4UuGvlKp9l4jO
	k/KlRjVn/bdV17oX4z+gIBH/2oXJmZ7N9taTnTpLmRyPHMmmvPkCug5Efw+/SPEk
	0LLSUasodXb1mygirbImUUZWF2bTFpAnzdrIT4aUHPfPQdWimOdpH8/a2YJU/VQR
	nagDUw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrew5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:38:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517741bcc53so11175151cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907897; x=1781512697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RkqSyrIYraoXJ1SkUGLDqUFNi9bzRAtX6dVnUv/1FcU=;
        b=MggCa+LcV4qAjizgdl17IMNm60VWX4HmHjyefI8i/I1EDEHVf0ivU3JLPpRqd4FmSx
         nprTqMCk6ZMWirc+vQnOG8puyb5k6gau1Bcc0nrcCmZB43EHtSo1IcBMF3vLJPXBCZnU
         7bfrq6HIUCksq0NYIDUklwWhCrnteoB8um6G3FTt1g+jgRg969E4S+4sgVCxX+VANaSx
         QZ/CU5mOLpp7VejzZNXfxD6v8CVC7nA/5ESED6Z2mpIvhgQuMz219s2dlI8Ky7pK7bdC
         EbwDyK5yg77grYWat2hBpCzuGpMpY9gBTnFeUbGajb/ziluOMkMBry13p3wdpzN7lJBq
         sMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907897; x=1781512697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkqSyrIYraoXJ1SkUGLDqUFNi9bzRAtX6dVnUv/1FcU=;
        b=k69a+BQBGEQdVqS7gb5Ogf2sXmNjAV8lFSXxCYNR7oz19BHZD8ZPIRfdVmeAoojkmh
         ZCpFuC8G2crrqWQLkOJIkG/H9iwk+ReLlswsQ/0glS3+yJx6OlqkcTZoW7NoobESBtZZ
         EFJW31Rc+8I6WkTqEws9T6yOWshqrCQPYq8kKCXJQ3C9EPUS3WpqXbi3pg0QP0/xhnNC
         g1vh3yWUkG38P3Tc204PXczDpmz8N7h0SWhnpIRiaQ+cfXNmGnCH9GRuLNCP2negPvzN
         U/nowi8DdHlnxu9z0BXHqp3zfu5qajYNhnZSj6ZU1tZX9Wx6dIQNzAtbFwkMXMaNSQqU
         Z4iQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7I09lJjfzXj++0XmUGlzi5TqYx7i16IxLH8Pffx1CXZr9AkL/Hm5hbAZNqL9qf0MrrgQKuLV9uKl8mAWj@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3jFjfMTN5OhbtKK1Z8Pn8i95S/+Coem1Gnm0BwynN26C7EnE
	WbRN4gkjMfF0WkYqUU3WQM4YuG+d+tJ4KzdDGN4vlIs3VvVCBziN1iAJow8Hwxu23mZ0SXJWS/m
	pqYOAMBaIBSEGHk8g0PYHtz8z4dEvmn8Doc8laIJloSwrwPRIVqdMgUL+8fPFpcFMUNKt
X-Gm-Gg: Acq92OHpVsvFWT7H7e4VNi5u3LNEJJE8AdBskUQtFJK+Vldf9ueCStnDlBH33P42RLb
	AhhNi8z3/7aE8LxM+Uju2PDSS1wK60Kj0/kGOXA0MpHKr05FNTthm8VR+hNDrqEfcIUIM+5TFfI
	WxWyd6bZgoXKyTCrcxuA8Frz7VWc/ISobelm4Pbcq/rp3W3YYVLH6uRL1SIXq12u7fd6kvNuFnz
	0ONErv8M7NjUDwDoHlmaFl1o5qvJldDBtLyBZ6cC2yEIEj0r5D1a+fR2S9U6YsRkKrxcoOMHSfH
	3d+a95SJUhDq0VLbqnmVsQ7Gd+qRAdJJbV6YCabIPHFMY/u7CNjrc/z/zQbalrWXvesaqthKkUa
	xP9LYo6sQ7rY5dnK+HR7d/wogRF142wr59CuP1kk1liAjHLl0o9Gtm12e
X-Received: by 2002:ac8:7f4d:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517959fed19mr128565261cf.1.1780907896964;
        Mon, 08 Jun 2026 01:38:16 -0700 (PDT)
X-Received: by 2002:ac8:7f4d:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517959fed19mr128565091cf.1.1780907896569;
        Mon, 08 Jun 2026 01:38:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054dfe3aesm831911966b.37.2026.06.08.01.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:38:15 -0700 (PDT)
Message-ID: <2982f74d-85ba-4bb0-b99e-75f58eeed349@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:38:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: a53: Corrected frequency multiplier for
 1152MHz
To: Phillip Varney <pbvarney@protonmail.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc: bmasney@redhat.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260605005502.313928-1-pbvarney@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605005502.313928-1-pbvarney@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3OSBTYWx0ZWRfXwQJ4cNvKmDOE
 hXiWcnrJeBL8Ov70YwRo7cS33cBfbmI8cxggi8oMQZ2avHQ0C5FHUybIqd6acqMr7jEs8S1X2NL
 74qLH/C0wNFAwPRZp/civogsq7TLmPUBhtk+aEnpvwiiOwOshkdE/wqTOXGHA2y1AkfYUVROAT2
 CnsiTcaXJtmb9Y0bERxIk+O2ZEGAckdga9RS1nxTdtdXIqau7gLv5QUE6VOBV2M8e+IOTozFat5
 P7CjPA208R6gx9HvS45WZRvC4cB/OWcfrYD7qdp204Vr7T34C+hehi1MgRInoHruzLo64tYuHMI
 NtwOJdz5LytkJ8AdM0nhb/8xwqDdSWxZKDlXyqsTW50jKjIS04J0yfoKYvu0CsgozUPOfQSq9MM
 Eb5r78SCHBVd8WnJXLeF3j6z+au07mjxaJUP/k/ivraomkt6rM93xRK3EU1AQkR58Iu5GbkcZC0
 G4i36c2Vqne2IsLCabw==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a267f79 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=NvhBEFXZ57lHVK1JQL0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: 65hMt4XOPmKLdnur2uwU_6UYZ2JtDG04
X-Proofpoint-ORIG-GUID: 65hMt4XOPmKLdnur2uwU_6UYZ2JtDG04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111749-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbvarney@protonmail.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4DB965436A

On 6/5/26 2:55 AM, Phillip Varney wrote:
> The 1152MHz frequency entry for the a53 currently selects a multiplier of 62, giving 1190MHz. This changes the mulitiplier to 60 giving the intended 1152MHz.
> 
> Signed-off-by: Phillip Varney <pbvarney@protonmail.com>
> ---
>  drivers/clk/qcom/a53-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index 724a642311e5..0549b214fcfc 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -20,7 +20,7 @@
>  static const struct pll_freq_tbl a53pll_freq[] = {
>  	{  998400000, 52, 0x0, 0x1, 0 },
>  	{ 1094400000, 57, 0x0, 0x1, 0 },
> -	{ 1152000000, 62, 0x0, 0x1, 0 },
> +	{ 1152000000, 60, 0x0, 0x1, 0 },
>  	{ 1209600000, 63, 0x0, 0x1, 0 },
>  	{ 1248000000, 65, 0x0, 0x1, 0 },
>  	{ 1363200000, 71, 0x0, 0x1, 0 },

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

what's more is that msm-3.10 also has this entry:

F_APCS_PLL(1190400000, 62, 0x0, 0x1, 0x0, 0x0, 0x0),

which seems not to have been used in the cpufreq map (but exists
in the clock driver)

Konrad

