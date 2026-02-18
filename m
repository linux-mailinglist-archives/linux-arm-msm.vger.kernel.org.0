Return-Path: <linux-arm-msm+bounces-93314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AG0DtD+lWkDYAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:02:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB91587C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21944302A6A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD27B34678C;
	Wed, 18 Feb 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awMQw61/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHlwwATi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C632C323
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437706; cv=none; b=BtYzfifFDWfOuXM4bXN7v6R6YR2VJ/2JNWTbG6ph0DT9qmN4UwyMTqjriMN+H1RsgyrkI+Qfu+TrsBM77TXTfRb1F0Ayf3yyhl0mdnJNH3UexDGaXmQJ0hXPO+VBJcTx97JlIJQy4za5pvrgFbqRGSOCJxpTi2qugz3TbJd6kbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437706; c=relaxed/simple;
	bh=5Hjd/GgMWGq/1ik9LlAgdtTX4tFWBsFoKz5AYROBM9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCMrdTmTIn3EupZWy+6VN74x8D+L/87PGNukzQ9ObShObQPJK2CcudKDVMHpiWe7VrSwyEF5dRGOdSDCAJbyZZsKXGDgT/MqWEv3pFVePlNbiqDiBR1tm64rYXfgeayQ5JZjxFCNbokp4307SahDzt6EHQVey2adGpPCIs0OlKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awMQw61/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHlwwATi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IHt1tj3380120
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCXvxDTFX2+zxnukyEGGjINVY8WETx03y3Q+tzTWJDs=; b=awMQw61/2orikPdc
	1qKADZHO+GezvXSQglAkmslDT7coV/Ntcy93Hk9SO96eR4hMmRI+XlJ0MkpHYAZs
	t9yJKJR2+HkgzMmBOhIA/OA8oqDmft1vMkK0eG2hvXdgJMt/iY1JaQ3DH0evCTVU
	1L52SmiC233GhtM6BQ+By6EWriCr85GljP6mE6DbngraLEK+I5M35NYVeuAoESHI
	h4JPVzzDJR2hfBGj5qosMn/TnRidc2qLCbRlvmhT+3sNrfcUIqTnm8DxIfuo20b+
	AC+q7QgxnLEUcGGyEWGwj2N0pt6GyKoj1sh9UXaI3YFqGaIGt0TEJAadxqCGJUlo
	h4g8tg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyka94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 18:01:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aae0d40a47so1788345ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 10:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771437704; x=1772042504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gCXvxDTFX2+zxnukyEGGjINVY8WETx03y3Q+tzTWJDs=;
        b=fHlwwATiXeeQVjlIDiGAj1KtTDQvrTyiprhCnpeodPZN+AX3IewuGPCOkPCIbQUNBC
         jeGHF+mMeel+QSElf8zLvJDWRLpdHWvV7/I0Hoo7ZldZzXO6HSnhhSdJyny11Z4nf/qu
         ahKc+F2VtiT8Yf/HRf9tAQcUoL6qxz4WRyv5Vio5C00aWtgK8Zg3w9Tqm+huYkKTa7R9
         acoSfWS/iDEQgqVhDeMxnc23Avc0jsQ/HgCEqlVLpWTgUcjbV833n30gCBgGDWP9373O
         OpeR1Xv97NdU4kXjHLkDPV0XUBnnLjwPOBp089+LxG5iq3FwyAoYIQ6TmwgOxwvYSoyT
         5Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771437704; x=1772042504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCXvxDTFX2+zxnukyEGGjINVY8WETx03y3Q+tzTWJDs=;
        b=Fv8cY7J4K6388xRuKAdYWPL3WZQ9JizeJu2gjMnEbh88xoubdwXKLUPDhaxPAOnlgB
         ChmUnJIeEm3/jUukky7V5yYRgKX9bFEzglSZbHz5lhOewDvI1Pt42dZNz+S5pZVZIVbf
         6XWUJZbR2Jo8dHb31Qfgx/KefuaFuBeXhcO3OqKajc75syvuuMzp7Mwo6Ir52iHhG+5U
         KS/ZfCAbYFlMMN/G6AhW3XJfTEGmOhnp/u6MtToFTeXraJmFcniiW73jkv/eVjY4Iul1
         dh1JH9NkMNk81bbDG3nab9L+FwtPCAWztiS9o9rBtuVvEbNkCiFQdj2vy47cHisjsHkJ
         mVAg==
X-Gm-Message-State: AOJu0Yxa8TvfTMtBoUlHl76bLLrIvTkEEVqTRvkGchp8B827eMJqHTc0
	soFI9/lLPHSOXVfCJrRIO30UYNG2+6uqXFPe8gdA7WXKhpCgKDtwsWj7Ter9kOjJMFcHfsfqN7+
	Hji/WipllL72Ykfo7J7+Uwuwx0gz8MLa0BgRE/zHHDaRlSckj3rcuN36UkRNK1pgCZUHU
X-Gm-Gg: AZuq6aK++m6FEOX3TIyIuqLl7z3mO4rRRM32bBNxox8dmtJ0hHRHQV/7tekBTdZhgZ6
	JpzELTCzc6f3c4Ni/eNxcwV+T4a8RIvSWSsECpyXwfLkXQtXOlNjG7vaLRbRJV3oojJzATSdPmP
	HYlx8gtyhZ7A8SjHKo6dMxPlz/sRPsd1mm3tIMMWeX2bsILmkkKv75jrjhNGdAksEPK2gGKir8L
	AKLoJtvpRxwdvmzquCNdwzbr17j/sNe5HH7GSAcQfhTlfHrj9lNwMjpaFXUsPKixN5qpppVAWZs
	vulhG2Ev+tsjZwnrfBe0XuRKij8Awwvhit+873/+AfxGCJzJ72WGn+KFxvyPFbsIcQxNSW+g0CY
	j1JthQY3TAecSxVL67xqxDXsZw3Bu4Mc3URtlUJCGri43Cw0RZA==
X-Received: by 2002:a17:903:1b04:b0:2a0:9755:2e97 with SMTP id d9443c01a7336-2ad17461ef2mr159711955ad.15.1771437702399;
        Wed, 18 Feb 2026 10:01:42 -0800 (PST)
X-Received: by 2002:a17:903:1b04:b0:2a0:9755:2e97 with SMTP id d9443c01a7336-2ad17461ef2mr159711555ad.15.1771437701750;
        Wed, 18 Feb 2026 10:01:41 -0800 (PST)
Received: from [192.168.0.195] ([49.204.28.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa229sm134974425ad.18.2026.02.18.10.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:01:41 -0800 (PST)
Message-ID: <0d105b2a-a32f-4d8e-b067-0adf7d4ccfee@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 23:31:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com>
 <20260216-eliza-pmdomain-v1-2-c51260a47d6d@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-pmdomain-v1-2-c51260a47d6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ah50mZqD_8yuv7bkdkUduXYMZd3HbFqC
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=6995fe89 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IXbkkVN8uJs8XsqYossUiQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=mLiumJ44E1THsQu98UAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Ah50mZqD_8yuv7bkdkUduXYMZd3HbFqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1NCBTYWx0ZWRfX5cObcGMLViql
 /A24h1u21g0MD7yepa4w1+v3HhLfe6ltW1hr2e0IkgG8gEnhW+Znew/0QJsLk/m2bKBKhvjq5MA
 pAJ6ODkB4HQNsWXI4IjuTNQ40+qjIZL8jeeBogNC8EwjPd7fX1pqMTRvzD7naOfBiTqUMC9EjXF
 GEjgeGt3kSkIAR1+AojabhzHC/XCxxXlb2HY+tgHlg8J4URqTu7hspTj2P+2bssLrC9/a6antk7
 LLLEvyrYHOipN4UsgJdTW/qoCXSpgg1X7ohn24kswDpPZvRi5wsSUQgiP2C/1yOzVdvT44OmwZj
 2dla1d4zOfHjMnZXhgkWLBwqumbNrYar2XWCcG95GfP0toV0DmcyOsgCVN8yvR8hPQ4ctOOQuQV
 PPbDelzrZ6tRtqzdIfiOr5RzSegTvN05a56DPMQXFvu36AVl+FIdfdZXy1dgJmDSotxWL+s3ER9
 wMEIv0gulXc4XYTm5rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180154
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93314-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6CB91587C4
X-Rspamd-Action: no action



On 2/16/2026 7:53 PM, Abel Vesa wrote:
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MX] = &mx,
> +	[RPMHPD_MX_AO] = &mx_ao,
> +	[RPMHPD_MMCX] = &mmcx,
> +	[RPMHPD_MMCX_AO] = &mmcx_ao,
> +	[RPMHPD_MSS] = &mss,
> +	[RPMHPD_MXC] = &mxc,
> +	[RPMHPD_MXC_AO] = &mxc_ao,
> +	[RPMHPD_NSP] = &nsp,
> +	[RPMHPD_NSP2] = &nsp2,
> +};
> +
> +static const struct rpmhpd_desc eliza_desc = {
> +	.rpmhpds = eliza_rpmhpds,
> +	.num_pds = ARRAY_SIZE(eliza_rpmhpds),
> +};
> +
>  /* Milos RPMH powerdomains */
>  static struct rpmhpd *milos_rpmhpds[] = {
>  	[RPMHPD_CX] = &cx,
> @@ -795,6 +820,7 @@ static const struct rpmhpd_desc qcs615_desc = {
>  };
>  
>  static const struct of_device_id rpmhpd_match_table[] = {
> +	{ .compatible = "qcom,eliza-rpmhpd", .data = &eliza_desc },


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das


