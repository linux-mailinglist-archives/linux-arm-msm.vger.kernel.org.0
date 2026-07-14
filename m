Return-Path: <linux-arm-msm+bounces-118963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EQiXHzjaVWpvuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:42:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADA75195E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:41:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RazRFTX8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qq61X0gL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118963-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118963-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CF483013713
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931C43DB336;
	Tue, 14 Jul 2026 06:39:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5FD3D6CA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:39:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011176; cv=none; b=NbAqo24p/z6TVg85G6Sjm2RnWb1yEF+P7Z3suerU0+0tNZ3XwaR0s6H6xON+9ijAeLlHgXRPPxzcjY0rc9QuqSiIPHrYx3xM2qeFl2gSH7yX0WKXL7TX9XScEuifQnAYJHCgXPN8u4rk6DD+VeF0El+0y7kug8dpyJ+lGs9X7jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011176; c=relaxed/simple;
	bh=//8iWiFvKogEgxg5aWo8MICva+eCyTt+/xwkksFvMWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmDtNj+gPwEDA2j9Rc73jQqBFf+paTTeM8JzZSjhqGC468nfQAej+R8qK/kx5X12UsYGm27PQvzkYPQoo0SXiy9ItutvddQrF91XBfxG1cU72OfERP95xLaYs49KNcTN4+uDNUowlmi44W+hAGlMWrZAGRWrz7B3veRo34bLajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RazRFTX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq61X0gL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SdtB3837656
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9AsF7cM1Gs5GLeueG8knt1J9qI5sm2l+JPHS5gcbxE=; b=RazRFTX8yxRmC/Ev
	A65GVIWv5xRVpLVckKTTJqLCPjCU6A6EwozTT7SSTMINXy2LeaRtgy1mOqgqYC//
	tkXBou0EL3q6De+yiw15XOcfSt4PiZho9G+pE9zEtHyPBy+ODF8cftvi34S9qcqu
	Sw+NisFIhwUmlkiJukxBWg9rxXOPKom5ScRxOJkoCUxgnPljRkAq3p0dxF3pBa8O
	wsEbiCKtKWisvXKrY31hHNwo/7iYs8JBLLjLY/3gJu/HcGY3iW7oyGOHp8HoN3VA
	l4TCmGGlYeJeHR6Xepw50tfnu9QR62RZGSxSuMIK+uRE6IZWEfdQ1ffN5vDr2gNA
	bZF5Dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4v5r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:39:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e69a569ffso80642885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784011173; x=1784615973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9AsF7cM1Gs5GLeueG8knt1J9qI5sm2l+JPHS5gcbxE=;
        b=Qq61X0gLKGkpJ+vsPFGRzNppefv5ANFefSCQ8UnBG938BAafyLmhw8Tf5ogYHv6zQF
         wzb6zGjV2Rykfvz9+yqNUMR9L8N/B8Tt6mBhXDH1S3SdZu78qjOpj8rYCrKU5PVSQoOd
         AWgYPZgdvOBf52L1qFhNFK0Ykn7/q1m0ME5hVkp0ZvHbJs9vdUkGlZujL5z8zLVbClPO
         PDmdplf9CaDAadsmTr8blm75N+g/WoSf94Q+mhBwsPixpBnm1x8ZboyGABw6ppd03LJ1
         97+Q9HIfAJC+dy6xdHOq0f6NpwjyO54NVbJUkQCnqQu8H+z+PQv2ytkvxHMCl9+tr7Z+
         G51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011173; x=1784615973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9AsF7cM1Gs5GLeueG8knt1J9qI5sm2l+JPHS5gcbxE=;
        b=WIaRWRUDRMLgTvcOsbKqTOWdUfnlBMObKJlhsnLwxKbVvc44EOQW3yS7uz2vy6LGuG
         12R/TofcRDmsHBqt5EIRuODq0xzIVqiMd9ySF3IopSUVM9MKELsdtXJJ3NKpNR1zrGSC
         sE47+jZEVqT+xYsvimX0mTHvelNfnAs6pNdRKXHJP+YyW6Yqnd6d2nwWG+3plPujVR9B
         53wcVXTItSJImzi/x9akQeFitOXerTiPwaY6cOg0NchTqTjgxKdqFY7yr7h9JOi7br6K
         Sr64YHz3+5wv+OwqwwToQcNJsiVReRYRCdD1w48OdjKrITvYJxnypYYFW1ZejlQvGmxR
         SrVw==
X-Gm-Message-State: AOJu0YzY/GRy5NtFTlFJDL8Fz/nBLcWrddMSQ5BeA1GEmn0FkznsIj1q
	Z7EYHdGfS+tN4viYGI3O2+9dwMMP9hmKlBZXwcM/HMJJLij6bS42XNxZZp37sw+HRNZQ/4gRKoT
	PHgf2ISj56XGNQNsNS3SeHgZy9ZfKKUsExqyJ9Ql2zXtHDzpe8+8B56h1bnhX5O0169KAFlD+vm
	aC
X-Gm-Gg: AfdE7clmBGMnV7oM7JxfUzsv4gSMpzq26PB3sMRZdEBqgvXCzfOBYz2nS81omLlVdcn
	fWGWaNxrBqIYnC/PHohwy4mweAakiMd6VoDQT6ws3Jz1OmD3l3CZD3eCWk6UWsEOY2X/zV5tmZT
	4OJERouqF2fhCaJMkPYfOJmoTjPwqtQX2h4qXiwn/UDBRyRVXyUbcxNdgnIll7q2CfhfoDMqmYs
	s9qb02K+N8m6cFXUp4Njui1oYt07hrRCS5DOToDDbq4GIuLoe2J0520sEdiibmarABe5GRqJHVV
	roD6JOkV64O4YaIk9Pybbuyy5o/xesiNi12jvW0+pCFUDwa1PwjvODhB5+Ubpf7S6u4+6luqjer
	zNyOOcuKE+oJPlTrfBrhur0j46KB6dxJp8ec=
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr972080485a.7.1784011173631;
        Mon, 13 Jul 2026 23:39:33 -0700 (PDT)
X-Received: by 2002:a05:620a:c47:b0:915:fad5:9096 with SMTP id af79cd13be357-92ef2c63c94mr972079885a.7.1784011173242;
        Mon, 13 Jul 2026 23:39:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15edfcdb9dsm722235066b.61.2026.07.13.23.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:39:32 -0700 (PDT)
Message-ID: <95b5ecff-eb84-4f06-a375-7a76527d5641@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 08:39:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-glymur: Add const qualifier for
 driver_data & CBCRs list
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-glymur_camcc_const_fixes-v1-1-c635123ebbeb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-glymur_camcc_const_fixes-v1-1-c635123ebbeb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a55d9a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=N3WnDGiB_xMuMcIe1xsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2NyBTYWx0ZWRfX70/oLRvsGGbs
 sDcHBDRE/3nE3ZI/I2B+4Ll5eRbFvfP1TqYrNaxi2MyGeC25ogSDyXBOytcIvijvSOiO5utNMCf
 V2XVFCTG1pX1Id6GqeiK0/ZEQ5BZHtw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2NyBTYWx0ZWRfX01Zvn6OyZWPu
 uRWxlGlg8uE1FUP4yAb5A/Dfx0Zbs/0Z5JFeea1KZWPxFimr6czH+q9SGrRJSdgk2MCLnIKhQD5
 vPMwBl2DiVn6zOLnyGeRgFFZhYezI/2I0uNRmVkt/nl2sap/3T0LFxPmkWv79HKM+hfenl2tvEn
 eY0DTTRIZNpR+740XbTgykWHVTvQQUxAsF9lbnl4WVLjxk8AsOrNNz6TiPvc3Ku93ohI1E7wDsw
 k060VS/GyeVWaSLrzQN0BBdG9zdmbbbj6kX+IVPTidI1JGqbi9+YZSuphqXXAjQFhuBVvaXwBcp
 Eb8erRn0ND/ePeyqXi00+wxVWsS/CAfdvHo/XYmVJtnp9l/OWhidn/lqsqxIliMysuGSHFSDCwR
 IbJbcKGM8fPNHTzXh8ZHVPw8uAb3QNQcb/z0BylZ4M0Xq+OUC4N2iHVjttfUVM7eHFhqJOdX64o
 JsqopAb5LzY1llWv8UQ==
X-Proofpoint-ORIG-GUID: RBqBsPZ1z5kjO2vNbx7cFhTovIxhOzue
X-Proofpoint-GUID: RBqBsPZ1z5kjO2vNbx7cFhTovIxhOzue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118963-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jagadeesh.kona@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2ADA75195E

On 7/14/26 7:29 AM, Jagadeesh Kona wrote:
> The qcom_cc_driver_data and critical CBCRs list are never modified by
> common code and are expected to be const. Hence add const qualifier for
> these fields.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

