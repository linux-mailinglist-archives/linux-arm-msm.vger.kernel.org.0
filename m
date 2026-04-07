Return-Path: <linux-arm-msm+bounces-102104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gERcL/PW1GnuxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7963AC84A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF26D300B520
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0653A7836;
	Tue,  7 Apr 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfHU6oNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBOEUZDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5F3A7825
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556334; cv=none; b=QSZ2yTDnpD/SENjM+gf8zjfl0FdpaU2Eid8ZIN1BRoNNg/8TD7+Vzcy50Z2XANq5DpjjUCkQPVz7fxMzZb922GUoSDChIeN6hCwwt/70ICMIVfMlt5+MJFEEzbX1RCHeDZHlsaL0wbW+RKB76nmM3MUGQVtBqh5mIXwyHTumoek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556334; c=relaxed/simple;
	bh=CAMD+0QiMyQXi12K0SXokqn2XIteIhoZgpCcPaIwV9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpqAN2IoROIcIAlzIUtusWsYQBhAoHlCukJTtLhBXaGmjYHEwdWNajF+rgPcmq8yxwB0CNGe+mrkwheMLXEGHmVbkRr68elxZUcyOxq6xHmG43BMnnMlXLzwYqlDtEIYT5Yqo13PKbOh8e4F+U2jt7LL9HzmwLMvOEQiKHsava8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfHU6oNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBOEUZDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376bK434009056
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cR8Hb0685ORXdljSkvFkB7MYYy1d73ETqakcf1ykWI4=; b=cfHU6oNdMkAYMT80
	jEnXEueTbxG7cnRBPaUkOn8Z+Df/ElwWFiNqEp7dj3KmccvXMtiTw/9D5meqylcl
	uUxxPIVSfeaJs73woTokn1eyATKCCRK+D0pPFlc+bLR8DL1/8iopjDnLqmvtZ7TN
	6O/h5fxUchuxMUCwP8A/UdDQLxscWPAcL0oG2C1azZO21q02xangKMuwXBYOObip
	vNgOQLv0NaAdis1hbfzfdEXbostZlFtgbCGwER71voP9PKH3VyTCbMZrcWbHc65x
	0jad6V5sXIjb68UPywacSowGJpmdb+mb3N2XhZdFrhm/b9qOcY52FfZVnd6Ji/Mt
	e9PaoA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkt615-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:05:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so19631106d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556331; x=1776161131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cR8Hb0685ORXdljSkvFkB7MYYy1d73ETqakcf1ykWI4=;
        b=DBOEUZDRPCK/rTbVqz+iYQ8AhyhX2ZBcfsgVU3og9j9Lx8Om3JzSEYm6oWpc4rUOMt
         vrufMVnkZntmVmgWZ9BOyayOwyTSFsRgFmcDFzV9pm0CVehfR/ggfEjmvy14ux+rp0U8
         ymf6mCN5bLCoSRV+Qaoj1Vtyz31fCLmmW6t60wT/cGQV1vLuDbYviy2MKBfGyd55Gt56
         OlzLMNOTqhr8gCy7kQTwsFRI+OkRvyEolzX3XBu5J/5AB8JGZ3HDf0S5gnULb2Bm1pvf
         DSIn13vrAUewJGejBikB/cTG9ZvfXJPi7j6ScLui7rx4K7bfr4fSFTke9kNDFecdIdUF
         3OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556331; x=1776161131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR8Hb0685ORXdljSkvFkB7MYYy1d73ETqakcf1ykWI4=;
        b=NOJn5qBrUY3GiUnsrSAjGmLjQzHW5T/x+cEvp7+ulARD8EONYeHNktpniueqm8C0l2
         8YpJd6EnInr7QRfSL47GRD+TnuHyTvHP1R8Yy5H0exbNEHo7WEIdcFcM7H8odYjfIZZD
         /aln4qlexUghems5FlcRORmz3ORpLhIA1uUWOZXaQzywob/Ds30YE9iCknVPxSIZibg4
         2UlaX9YM3ZYpK8J+AmGzwvC5NoYZSE/ceE0/KxlxwQbKtdl7CZCay8zc2q+nqpePSJts
         VLPhRq6/nIuz5fJlP9WTNofab//hPRkQ23Y3DD6cKg84GSC6UGhJBOku8fjRmhj5tVMc
         3YlA==
X-Gm-Message-State: AOJu0Yww18iPe3ab/7MDVXzTWRSMZlcuaujDoHVwnMY2Ax5F5xzzXxG7
	CBb2FRzxM9O9sZGi1CXQeCByF2+NVZG83D5fatJXrnGDMPA4RsXrIsE4DEg09KENFaSvea0au32
	PEJ/Rvh7Cffdp6aqiHNL2FQoS/gTqytEXcYKiEYvZz8umGHvhteXK0VeysmrMFnly2Z2x
X-Gm-Gg: AeBDies2MMucdh4tFmMKL6RLz8zGq1mjl7t0QhJjIDSlMm8YHj86Zb6FPz92jmeK1Fo
	jjcGIuqYjPFcT3jABJ5Ai5Lk942aLfA2EUJhEjZFIBUdNZPkzAivbLURVjI+DGhfAZMoWpXT16E
	WdGCX9gi5vit5P7TYAf286vUS6lEUMweUTvssjDcna5UjHkSjxsLidlEG9ZIEupDDKtw9Qts2IK
	D1FbD/8j3mOriFnUrEvqU1OFEMgTXihNAhgTdV7M35LUzPiueUcx+keK8yCkUQ/ai3P5BJAM+2X
	gZFWZwNXDZFQTIZr8gRjGri2g/GP8d+s712TTeF+h7QKgcKQb37DD86b/Dsu9ZjgvU/yPj6UT2+
	qQKS71KXgEDMZcUMtOMG1fgVkLR0FI6BPhCBmRdNT5CmglvCzWD9Ijm2/NRuybcnPInJBIT35ij
	lXDaU=
X-Received: by 2002:a05:6214:20a8:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8a704abb8d4mr199168286d6.4.1775556331216;
        Tue, 07 Apr 2026 03:05:31 -0700 (PDT)
X-Received: by 2002:a05:6214:20a8:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8a704abb8d4mr199167886d6.4.1775556330776;
        Tue, 07 Apr 2026 03:05:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c3csm552293766b.29.2026.04.07.03.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:05:29 -0700 (PDT)
Message-ID: <30ce5340-ecd1-4116-80e8-8a0bd54a3601@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: qcom: clk-rcg2: fix set_duty_cycle() integer
 overflow in boundary checks
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
 <20260406-clk-qcom-gpclk-fixes-v1-5-7a14fe64552d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-5-7a14fe64552d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4d6eb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=2qqY3NsWhw8GdsO7NmsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: g8EAgDl1seZdXtN3JrAtmWGgNL2fS0iN
X-Proofpoint-GUID: g8EAgDl1seZdXtN3JrAtmWGgNL2fS0iN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5MCBTYWx0ZWRfXyFKk42vxyUGd
 5ldy6P4lgalTJw67Alkj71V2lirzGFXbt+FvWcYVhj+bvBN3kWK/eSo4ev3jOtgxWu/5vf15Owa
 ZXCWWDBgQ8Zpp8IgUcDr8CR4JTFq8TXoBppjZ5rSpiUwShzWyvpsmKkfYOtdKh//ljLpFEv35G0
 S1Th/rua2LLCLYyBA11XXyBhfFjN8TnwQA4T2LLLBanTOiO407hH/mX1yM3OdFcUmfGssxM2dEv
 2yhVAxcEScciyC4y2TvfFUB+Oi3H8N8Tbw5W5O0Hb4oxuyn5raTv9+ItdvUtv2fBnFsPQLJIo9M
 FQ6F30NzDnd5vWguOioXBOKiuvk1LzZQiy5Ga3ix4O0aNqqGjnL2XblGlPSe+iOVAQ+Whrg4yCi
 YnOP7ABeB9CUa8e4vfVlbLQSfLtlYIe8MHDZYj39VNPcKN3fQakpVkY/h5VcLPpaVtbGATZasNl
 1QA3IvhmrYYq16aRMaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102104-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,baylibre.com,gmail.com,quicinc.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB7963AC84A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 5:54 PM, Xilin Wu wrote:
> The duty cycle boundary checks in clk_rcg2_set_duty_cycle() use
> integer division to compare the 2d value against hardware limits:
> 
>     if ((d / 2) > (n - m))
>         d = (n - m) * 2;
>     else if ((d / 2) < (m / 2))
>         d = m;
> 
> When d is odd, d/2 truncates, allowing values one beyond the hardware
> maximum to pass. For example with n=7680, m=1, requesting 99.995%
> duty:
> 
>     d = 15359  (raw 2d value)
>     d / 2 = 7679  (truncated)
>     n - m = 7679
>     7679 > 7679 → false, check passes
> 
> But d=15359 exceeds the hardware limit of 2*(n-m)=15358. Writing this
> invalid value causes the RCG to fail its configuration update, the
> CMD_UPDATE bit never clears, and the clock output stops entirely.
> 
> The initial D value in __clk_rcg2_configure_mnd() correctly uses
> direct comparison without division:
> 
>     d_val = clamp_t(u32, d_val, f->m, 2 * (f->n - f->m));
> 
> Align set_duty_cycle() with the same bounds by comparing directly:
> 
>     if (d > (n - m) * 2)
>     else if (d < m)
> 
> Fixes: 7f891faf596e ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

