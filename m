Return-Path: <linux-arm-msm+bounces-113953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ws1POSIBOWoclQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:32:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E06AE403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:32:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P9fMRmyz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WZjJTVvD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113953-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113953-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E0F030575D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E339370D63;
	Mon, 22 Jun 2026 09:15:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27876369D63
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:15:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119734; cv=none; b=bz6PgpbZO4nBAT8x0haYJkizDQX3V5fUcTO3OU9XVBX8PxJeDmi2mj1zEWa48T6I8MsxtqOtanpBi8l1ZR2/9uYRhyiBaK+ajQ/GWzsi4MCwrtwtTY2xbsZSz15OIKGoY3U2XnME39K49vZh5AZNOiW3qjfMDRa07TH3NRivUiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119734; c=relaxed/simple;
	bh=Tlo+7Wj26o/tczDevrBsrDRZR65r9QEfQFDFfnmJgx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2kudz6kquCcAa65NMVTEDXWcPunX6cOwfLbGgeOHpR5HWW93QpjxuiBLVXpPgrvjxja9rn9XECN3Bj7i+WpVpwNlEQhCfheAB61hK9GWBFjJ8Ho3wxB8PS1GGrpD881rGYN1kCY8ctwmTlLM98yaVNdXKJ6C3OqkmZQsdq9zgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9fMRmyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZjJTVvD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59MBA2428376
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzWtviEx2OSdZ4B5CRuGR9Mw6mjrODSpp1ouLLCU9Ok=; b=P9fMRmyzJsnMwAkb
	WBAiN5P3g7xoDAa0PmPTkxN7puluy91zVjJTqyklSHgMTLhm3pcdaDrSq4pdE7ew
	aX2h3DX+1/BYMaVKSOwChObcmLUXVtxHl+SPKw3CHYL/elgb+i0sBW6CtHa3kCqc
	g87zGUUyRtqzhaimLPcHoEW40n53KapLJSUsLTf2tI9LN+rdBmT+651SVGUDPTt6
	yZlRC9yGDVWN2V9hLf4cV31sgdFwkSak1n9kKO4Bf9/Lr27y9MBoe2NFTuYqg/Tn
	7QtZ7FH51iq7fXU2EGBQ5AhXgUE3NS4VsxsDgvGG0KXqobY6AK++LWTZu3TE+pR6
	jqoFBA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtsdur0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:15:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dc31c51e92so9468746d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 02:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782119727; x=1782724527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzWtviEx2OSdZ4B5CRuGR9Mw6mjrODSpp1ouLLCU9Ok=;
        b=WZjJTVvDzJlgOZSWId4u6TdLQpI/d0jhvtKq/+nnq5JtF5yCi15PZPaHQzdVFTlEvV
         fQ2qytXL6Te1Z4BWb/mmQ71z4QEFxbApkN6354Abn8KcnmCfrxIo8vCztGAtQrXcL40c
         TTLkDL+EB8FoC5UuCcQ0UB7tISzS1g6eqHVRYlLbh80o8j0FplmEltFmR5N7l/DNsmkC
         wdmYFXRfc0ebLrbX+JHzuANYkMxCkIZvz/jxclGZthjQilSpvA72yoFZPDSNn+nymXIx
         djoCbjd7fqdXe1olPlbBJXx/t2WDo4zgWQTBxco+rMt+ZOGNlbSdpEeY2Um7MWazVUvK
         ecFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782119727; x=1782724527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzWtviEx2OSdZ4B5CRuGR9Mw6mjrODSpp1ouLLCU9Ok=;
        b=E+6d2g3oYzARPMEW3g5CY9xpCva/5ZklnzckvuMOBevcoUX6I2WsLRZ3Qndhz6BHr3
         KgkCClvuPdLbeF5zMTogelZ7IHtNkajieh4vyvPjMKBj1y0udtOZ4uoUmREMo0wVRXaB
         s2bqVZMpBwLHOG6CxTdQSlwM7FBDcL5AgEOIk+ZVWeKx+2mzkEIQA3BmbPlK2fTcYO9l
         vuWsJ4AquhhlcrtCIVinNyMhUpy5xdMu3xnHvdE0AOWKT1Qj88c7COKmDVBegxllGrRj
         TEIBjfC5cap7CRrDntVgPrGp1Qxl7kXan7vGL00Ktw25ksAEWixr3FUof8TRTk99vChD
         ++Eg==
X-Forwarded-Encrypted: i=1; AFNElJ/yYm6vEQSYVErOHWji2JVLnf6m+QBCbGrhN4vPIRvp3LttiKs923r+gNQCE42MbY7hji1XpAM6tdvCt8F7@vger.kernel.org
X-Gm-Message-State: AOJu0YyAi7q+mUQ6j1xSoKOQsiSRfBleG9cmYV5+93JaHJ0dRZRTSKcj
	HLJ7krFyHbmOryExfdHRVMFJP1cuG6YhQG5HhSPcMwWNNkssl8q9zqswGgduOMkRjNDORPKETgH
	I4PeSeWW4rUM24gRihk0xgfwjU0bgabE6XfOZTu4HI8mmnyb3ORQ1aAjC5IxnHUNXwvP7
X-Gm-Gg: AfdE7cloi3XjK1sbal2FfDSlfhfWzRuZ0OPudkEg3E9E7bXj1rB2df0HXvyYyPnGC07
	ZsPN//SND8kIOMjcg7FzC2QrlshKhZ6Few02tIu2mTtqd/yiwZddWbj7rxt7v4WZ/Xt9p/4FRXo
	0nL0iIdj4Z5m0H4A0SHdTXlXKBnbZCe9MvuLZa/t6qR8M7Bi3/ObP0n9+rk/VIwZAN4sgYZ2aNf
	fHJK5JT1EvtUs9DlY5nwO4HQjOVbOf6XlHoymry9jYlCR82tcYQT/iFWcZ9sJ+VFc0fVHSLRN8c
	6UP31nwGgxwRwDlbNDA77khQTDjnU44uo2aoILhD3EH4WQdDroLqe6Qjx+90TuftFTHnskmdUpV
	0mkV/BMyey5AI+5Ox6PYwa9tct7b5zny2VIs=
X-Received: by 2002:a05:620a:6082:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-9208d0f9107mr1295813285a.6.1782119726883;
        Mon, 22 Jun 2026 02:15:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-9208d0f9107mr1295811185a.6.1782119726516;
        Mon, 22 Jun 2026 02:15:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e9994d5sm323364966b.15.2026.06.22.02.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:15:25 -0700 (PDT)
Message-ID: <d104d52e-97a3-479b-8dfd-ddf41a3d05e4@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 11:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: qcom-ebi2: Fix clock leak on probe failure
To: Ruoyu Wang <ruoyuw560@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260620080406.1970447-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620080406.1970447-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a_3uJQ6mfk_VoYDugM7WJo_BKydruih5
X-Proofpoint-ORIG-GUID: a_3uJQ6mfk_VoYDugM7WJo_BKydruih5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5MCBTYWx0ZWRfX0k15XUTTayzA
 UhmuQcg4yUolJQEIBRqB4hNi3/QKH7eAxBK9El6lrXJtO/3WKKOQlPbapWeLD67xrZxBnQ0CxEY
 vZe/VCEtJSXbTIJsQ8BNsZDtoiKWMoqja2clfKfv8lE4+rIWhqoKO1310LKLSI/6Uz15ao3cO0y
 w3NTrY1MB7zthKbOKUs0KAuzgwLpcPbl2omreZLFdttpecO//RBRnickBJTobJzIyC7mc7BE1UH
 1+pILlOO/DDkQlaDCAS9UCn/taAKYJFDWpeP/GHzJntsDLAycKn/iOMlu0BMhlvsiEgdHcjp6JU
 qax5mtvqNb/QIZLz20mpl+5oi7Kvj7V3cln0ayjOqMIVovNgEiHQ9OoksUMHWAbtEET/mZVyhD1
 +fp4GGeGaabmRxIsBEMFiz6cmhcVmG0cKVSWbUvS5fh7ia4BgKKgYyhdvoaJ/9orquvc0koWhrB
 h31BivV/UhjlSWczMPA==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a38fd2f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IA0wh2spAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=K0X2F306fXUgid1TeWIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5MCBTYWx0ZWRfX3lcWLty63F9i
 U50Xjh+1jENMY7W+n5dHfqtaaDbI6d18J0yHUrzbeQLS3PKmEQ/9lyLXhXkkkqYzsDLTVWxhgK/
 xHvxa0NvTPL+J7GkDQ7N+yA6OwFNGyw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linus.walleij@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113953-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 343E06AE403

On 6/20/26 10:04 AM, Ruoyu Wang wrote:
> qcom_ebi2_probe() enables the EBI2X and EBI2 clocks before it walks
> child nodes and populates child devices. If reading a child node's reg
> property fails, or if of_platform_default_populate() fails, probe returns
> without disabling either clock.
> 
> Route those failure paths through the existing clock cleanup labels so a
> failed probe does not leave the clocks prepared and enabled.
> 
> Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> This is a minimal error-path fix for a previously reported leak. A broader
> devm_clk_get_enabled() conversion was posted in 2023 and reviewed, and a
> similar cleanup was posted in 2024, but neither appears in current upstream:
> https://lkml.iu.edu/hypermail/linux/kernel/2305.1/00605.html
> https://lkml.iu.edu/2408.2/09536.html

Someone raised an identical patch last week

https://lore.kernel.org/linux-arm-msm/d1882207-4756-4e65-ba30-b47ccc821fd4@oss.qualcomm.com/

Konrad


