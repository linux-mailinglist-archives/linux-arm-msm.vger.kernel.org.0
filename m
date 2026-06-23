Return-Path: <linux-arm-msm+bounces-114248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AuMMMoGwOmqxDwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:12:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BAF6B89B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:12:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bFQ4y553;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XuhpWTJf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114248-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114248-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D37F300184F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F7530D3F4;
	Tue, 23 Jun 2026 16:12:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECB830CDBC
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:12:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231163; cv=none; b=Fgs0wnkBsjKRqpOYYH9D9dP2Oz4tw2Fq6x01NAybS1JxP50ka0yFwcDCXb4WXVx0eBtqRq1PXlhOjantZxW/vPIncsIcASYymlvC5v+bVPeWiGocsUoLSn/NP+wuYpaXP5Sg32exE9Jf20C3/xh56yJc7xwUeAH7xX5L6pzkgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231163; c=relaxed/simple;
	bh=OvrE28mQ6d3na6t/REXqRcrQw9Eosy5qUj9IpwYNXaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZlcJ3Z4AsUpHDKqSIIOsn03BLtctUd0e5gJ4/HB6nEjdoJc9d5z0OBKsgwzYogB45H91Cw1sIu2tSYwxa6+IjDvgvI3PCw+XW4UgoyEBukUi9kEp0Adn+9kjsxM5FhPgx9i2dlwS0SxqmNL2kyKxwasH5nDDqGvu5jp3qvCYnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFQ4y553; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuhpWTJf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXWYC2308415
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gecbAwohjaARZqbQURawjMipEUQQYR6zuTbVqRvKAx4=; b=bFQ4y5536/69ZTPx
	L3Gtbmpw5WEptlcAB12nFyl6e0zl799tikAc6eUQEQcSvBoQxKtPkx3rrlSuX+GK
	Qk4IbylRxw+1qiZ1moT/WcHRJ0+XkYI595grwZXjb+gkDohmSOaxlcyAywheMuE8
	h2fsr+6oqA7HdiuPwbb2qkim2GtDhJDItLSn5dp4gCFGmV9DCf6A1UaHnfSz84+I
	CV6sO2c8ud+HU7BfkQRQjb0V2DmZIXDYFP1gWro03MxVnbLiU0Tx1fxV7XHUpmqo
	Rk9yx3WXWEDE3GWkj+XmprB9CmesyUseh+5DVgx7Rdlmz2s/RLppaxii/l3xYlO3
	qVCuVg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gt4e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:12:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso108066b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231161; x=1782835961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gecbAwohjaARZqbQURawjMipEUQQYR6zuTbVqRvKAx4=;
        b=XuhpWTJfsHCUBPpSwAL20ojik4/jrP2CuKzBCiEjdyomdhOIFvF5lN8J9U5pB0IB/V
         02AJWZQDZ4pm+mbmCqoYivRGzJu2WBGjmhZbPa5me6MQtHNRFw3L0dwsgkXsIrnmYeER
         HVHJ2sGeFI5VSJf9V70MdCK6zuhOJBMA+1n7UrjsptXdtgu6JDqv6lWLzSbU8fTI36fM
         t+MdWI/wLSPiBCLa01uL+8MHNwT376cecYfnRDpYejNlpo05jii5VJI8phc8Xj15ldJ9
         nqY3LJpgnGdeBEw7DQCdEQlE5+piw0x/7p2OIra0XxreDST4IH5fkFUDb+HJSsSFDb0E
         8aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231161; x=1782835961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gecbAwohjaARZqbQURawjMipEUQQYR6zuTbVqRvKAx4=;
        b=pL8B9ZVZmK70m7TDHN6msomseG/60vwpVoXPH7qPCVnuShgRoG3hlWNSgBINe/fdtH
         5GZr+t3fDY9317pu9EhiSeMtkf7ANLPPqQZW3E2OSwjWPxiQt2eQsEoy+5nGxLRnebRF
         PPOwmtPjXNoAwrBoWcDSd4aw2j3w0daXLr5+ixDg8L5kmSQgosFO+qNWn59sBCyjzfUN
         Zq8z/fOE5Ghhd+oh9a5jExtGbnFXW5+41R43ksJO3umL5xKOe/8nouVJzSQ7u1KbpxRi
         UKhfvjJ711eJ0ptfZNYpE7r9VqGDG+tLKLRF4OjVyP37JuppvcW3c2b/3s3BO6hQJByo
         Is0A==
X-Forwarded-Encrypted: i=1; AFNElJ/9YnrBt1ltlf5nrrfG8KbCNO5kK4PTorqAZtstJQSM1cFANtXDdhrUZeSB7tc/zv0wNiFp5Ku1xHb92Waj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+poNHqyRHbGr1dKpnU21H84exTXHUl5H3XPd34YB+o+l4QnxH
	QY7f0IpBkb9ZY2uuEr+A0+743iyqrD0d+V1TO/kfCeKdMGfmb3ikQfTjj+9rtXQYP/Wu1bnVmyg
	l1hapDsuj3fM58Y1Y2gk3pKDNXhvCdJPuqQF5RO62LKJw4ZYUrHcZyAfdJKQzx5r+dK+C
X-Gm-Gg: AfdE7cm/jH21ablUj8ow7E0h8vhjBhA+9WJhcMcq53OPUwUi/XNxCV+duvH+ukmrkn5
	y7q3j/G2MzF+8qN6UCGK97jlZb/p1ie4eUXJeBf34k6w/aYxxl5+vzTE0+4PLMKK2EpUCLJPeW0
	ck1s6iJiimgajHt/FZWY2kfpypNC2ilpGRCe3fEhTZx6xwipojelalbPlwJYMRS++nh6uMt40y9
	7lki6+gafc8QuJOVmFO3xttjm0QcV+1Q+cC4eY+F56tdeGHY9cqB7gOPTDpGbEFSNRg/s0NIefP
	jrYwADBndfIPcw4Pn6hIFL+2MNnAyT84GXRhEb0V5Xp//B8EBtMgDaHEUXC62qspiUba/cYIStc
	l3EP03O9ms7y99H+vckq2k394R5GVERz3FQZ/Dw==
X-Received: by 2002:a05:6a00:b50:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-8455087bf08mr22324879b3a.21.1782231161259;
        Tue, 23 Jun 2026 09:12:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:b50:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-8455087bf08mr22324846b3a.21.1782231160830;
        Tue, 23 Jun 2026 09:12:40 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74727sm11049918b3a.39.2026.06.23.09.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:12:40 -0700 (PDT)
Message-ID: <816035fa-229c-4469-845e-758373afca52@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 21:42:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZXfqvAMei7L2yW8wk1o00OSwhdNtNodE
X-Proofpoint-GUID: ZXfqvAMei7L2yW8wk1o00OSwhdNtNodE
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3ab079 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=q18lXC+Bm01JYF5cPAQq0g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fFR38OxDykJNwau6z64A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX9ji6mzefS6Dm
 AiL9zSxFF6CWh+6GfMHSHiub5DH+YzO+IpEh6wDcD78On6RsVkYu5ffoP/ZG7+vwawXTx/zzcst
 xC/k7t4X48ZOhGchP84PIfH6TQQvI5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX/vZKKDh8eXDt
 oYld3Wktg6TMZcb9Lgjq3xNRpJTAjS7Q0AlWig0KcBpM4i2qmxZMfsqKLtM5eR7yW3rlqAeJvm4
 qDA0rm6UG2jrJShpD5TpCqwkHRaw6fO9YEUaikERnBq3i+vif0v9oK4FAcGyEDG8OzsiJCGtJ8w
 dIUIRyiV2P/KG3GY62lUhDePkz2eZBj5bjzlVAlhVTsaxILRoZqUKUzi2rwbHawG3NyWjmDjKeg
 NhEZHea5+XqUqa53VFcRoA8UWuULINphqVtXGlNjySVRFSdWR7NtmnAP1a3P5rR8cI7vJHL3V7u
 dIJsUYe2dE1bonbk5pN51w9Jk1L7gvJN0dDHc7giNyk3ycvEbY970a9RtWFKQFBhioNkTSNtoUR
 fDTLW8fRLrvZpDNNxV08RYslsD/4//N9DQsDReHVWQ+y12MbQdeAIhKoy8r4jLutECX+uwniIAV
 GdjQy7NxAyQIugXmLGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8BAF6B89B2



On 6/23/2026 5:26 PM, Krzysztof Kozlowski wrote:
> ---
>  drivers/clk/qcom/dispcc-eliza.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
> index 479f26e0dde2..e31c24125274 100644
> --- a/drivers/clk/qcom/dispcc-eliza.c
> +++ b/drivers/clk/qcom/dispcc-eliza.c
> @@ -757,7 +757,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_11,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_11),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das


