Return-Path: <linux-arm-msm+bounces-112499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HiA5KARtKWqoWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:56:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E966A009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LG8KypsG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bozbomS9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112499-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112499-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5D8F3003BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1801140963E;
	Wed, 10 Jun 2026 13:55:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050840B38D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:55:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099755; cv=none; b=U45mJS43JCLGyknewdmmKmGzR96E7jtC61jE+9ClEGAFWCo95AuXepp+slDPOdMo302gxqMkkSCuQZ0ER6jRYR0uSXpNhrZPxjnlY4fMSam+mO5dxRfBEkLJJVLppp3btfA5A0Jaiq2TJ/SUx8/LuvmwYuxIb891BZjcPr0yQGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099755; c=relaxed/simple;
	bh=cuq1c/6+WWArjcGSMbLiT1Y+RaBUXU95in/iRHvw4X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=op4F9uKYiVo+J9WuivnXHTq7jjBgaxBaoQLnNuMBygoYUxz3wsrrme3PD0EkkaWFs9jiUHRgEg+MDOJYZTmfMxHvtOz8Z1I9FCW2vDuF//dGRQ5CzSOW9hQmpy6lng9Q93ZdB3Rk0bSxZFVm+q1nLgisThyqYLjLK2yE4b7hNis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LG8KypsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bozbomS9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCMnL1554787
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BjQi6IXqSkEiDb1G1KVMnKAIZrDjPattnHAhdn9E70=; b=LG8KypsGhDd5E+SW
	lWd7og7yJc9jQAozib/7JQ0uYaxzmQd8JZ/CEPnOoIH3bKcFwup06dR/pMi4Yp29
	PmUiLfM3SsOLFFzYJnBQeaX7c+WqXxBuWSnOO6qUD1IwhuzuyT8AWz6v/oYPvBvZ
	fTwBuk8riqkutFWsyN37eL5iZMr+m6zlaP+8z0mnMM0wGerIvXPyTnZhtdZo7oez
	eY7XboTkK8FH8mDZiazvXMZK2T/5X1/kX2/4YyVXbBal9sbbR5GSUPlsbio1KWY5
	YLrNAtVUrmVhlAlv/SZrG1ZtTTRS0Yb8o90/UvP5lbE5rjO8i/DIeBKhiwPD5P9E
	U2QHYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnts8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:55:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51759082206so20141421cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099749; x=1781704549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/BjQi6IXqSkEiDb1G1KVMnKAIZrDjPattnHAhdn9E70=;
        b=bozbomS95nM5ZPrzx5zz9fGUyb1r7t3ABmZXo4N5r9FEY72BZDKo3XWTBSTRhFexb6
         DMKoPkwjV437DXJLXvdSOTXXzQgkV3f9HTYpSWUZn5K9pL+WPKBXvxUTjRD1W4aCN0//
         02879yoBjmpjyRri75rGexeKGtQJF29s1pRvm7yEX4H2Ey2xj5s2FqVuRZUFdEFSFrCs
         etf6Gu2gAfu/RQbgrLAb5y1A6BNp77kwpjrDkgxHsPbb0L+6MTFO79fL2sXGgtSGqaSJ
         vXhvd0MMkl4l1COEmaVN5sprpgjqynpf2adYJ1hpyTgqqQ59tJOKo3KMHfmtcx5/Xm7e
         5Bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099749; x=1781704549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BjQi6IXqSkEiDb1G1KVMnKAIZrDjPattnHAhdn9E70=;
        b=r9DfhVD3qq+PJ7euilN+YqTCYLMmKwkJZc9OaWCEZylSiXJlFOjapoS5RdfYYBOLwk
         Nu/iVgJInJSnPxCkblxGPojynuLDmmP3R5Dl9mNA+4VM6EP4VFmjd5M1EMOuZ06F29P6
         BQbJD26x1qM7sD13wyEsyj48xOtoOz/t0wodRPF3677MOGPOGxORO77l1EETr6GV8yS2
         2dVyuWPFnGpo0cM2K+LEpvmwsNk+xkWj06l1VNx5pumwgQEsVxrpRw3//3DCnRx8Mhjz
         0VaW7Am+cffQkcVJZI+ONd/xIWape1ff8vL6xBNCbO2ds5H9Gh39jFGl+LuoIkBqB4G5
         TXGA==
X-Forwarded-Encrypted: i=1; AFNElJ+2cioaITotiSMsuPn6Vt/96Vhfhu69fpTsjEryHSZiHrxKXAWwIaIx+6KiwWS8+sOlu/6AsrUwGXS7aSEd@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNUXt6PQIllM3GUpwCLkuuStL0HGR9Y3nHj/JzCmOwQT+578M
	csZwvA2RFG3svjiqoOIDFGwuXgLZwhkvnaQ1u/IkwrvycGybCSZbzlPNTSlRzTLddZqKEmy9o+A
	IT7YFNnuz2FvMa8vge5Wclr3x29v7uv/oGzOcq5Uk8qe5R10p5Ny2J+YPaS1AjVOyF5ke
X-Gm-Gg: Acq92OH+MvnWPW5vN7/EEPZaZRNIJ5Cbw0HIjKepu/kJjq9Iu3mllkGteJe8owSGZes
	afG9WryXMOrl8OPuk0dXONrMJKo5wpH61RsxUZxfvwjiTZ+3ZQZW1iVTeJSlf/N/ZlWsD0SQ+eO
	4PyoCNMsoXA8SlDmMWJ5mjarNGWnVVcn8OuRWVFJ6HJnVK7D7vLdxk+1EKFeMAuF55Zn8AuEl7n
	LQwsQX5WUeiLiqVe1NSSNaJbWnaL7gXcJ1qDOAb72F+I/fV5aCKHtOhg6cO+14EisNH5b5GBZ8a
	rS+Gy0kKUGKhfoPQREOibiECbP9cqJLO/c29W8pHV9ROqr5E3jJQIirVtS8jzy4ywRB1DCv0vZz
	zvuq7xYt7j72J3Jjihm2nF6+IJ5KH5WIw+v/u9ONtOBFFqItgeK0AX1U6
X-Received: by 2002:a05:622a:388:b0:50b:3489:5495 with SMTP id d75a77b69052e-51795bc9321mr220428081cf.8.1781099749522;
        Wed, 10 Jun 2026 06:55:49 -0700 (PDT)
X-Received: by 2002:a05:622a:388:b0:50b:3489:5495 with SMTP id d75a77b69052e-51795bc9321mr220427801cf.8.1781099749023;
        Wed, 10 Jun 2026 06:55:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b57c66sm9823929a12.28.2026.06.10.06.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:55:48 -0700 (PDT)
Message-ID: <2392323f-0b8d-499e-9a6b-9823311ae595@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:55:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3KeInjtijQ7WVNnVEL2FMME7DirsZ0tV
X-Proofpoint-ORIG-GUID: 3KeInjtijQ7WVNnVEL2FMME7DirsZ0tV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMyBTYWx0ZWRfXzur6XhR1fOvu
 +YPqoyrvPPd6Yo6vclfq9azwdisPqUjLS8MQgO3apP2V2nV1Bja5StEr7ytKYcgac3Qw3fxkl/A
 ryxbuH4WDR9MIvHWlZODDsFaNoV4pG7sikDnRYeHLRtED/trvRsbaoxDtaOfqrSI1ewECzKEw2+
 p+n5zgs8+kKmvcy5G3bPr/WCaILmPnkUbOHL3xJlMpNR4cAMLmqZG3rP4U8BsiXXeO5CqvkJ7OY
 F9y9nkp6H+Lolvwi8LLR8tsLR0c4kNqAVh5IF1PEt1TcWBmG65tjG8JNM/p2uEt3261gPcwSH9v
 fkczLy/vyEX77vSpIfaMWQtAIVBhqspXAqQoBDsYketAOizokL2CQs1y+DnoTDROMW7kkHmb8bb
 ey07Xpi9U7MVkXl9AFqY54s36SymvH7+2QvWuIic49/TnAVni/maPKRXlehrwK1HeVobTBuukap
 gfiYMXy6jba90lGmvjw==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a296ce6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112499-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 977E966A009

On 6/4/26 7:26 AM, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

