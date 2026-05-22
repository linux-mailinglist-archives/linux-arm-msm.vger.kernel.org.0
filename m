Return-Path: <linux-arm-msm+bounces-109245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP7INqk0EGqqUwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:49:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 528895B2749
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEC81307A3A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C523BB106;
	Fri, 22 May 2026 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgaE6qT2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFkQYdsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F6382F0D
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446550; cv=none; b=QrKzBKL0rh2yNx/PzBRowMmtpi8DrfNWh6yrIdjJeS4UOnJ1O3Fd1Id/+esb1sQzXfk6YkWrHrnFnvs3B2gX4CVc92MutcZn2Z680vRGjWN9i+QM3BweWlfB6a917YKQwfBM7es0Eyg+HhZd3+vP+BOCAwq6FoNzWaQJDEd5Bf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446550; c=relaxed/simple;
	bh=aUSi5xoZRGRs4JsHTX1qc3p6aeHbyhlKHdEGsBEloBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxvMASYV/ltDBvxGpk+akGcgy5HFiuZvOf/6vY2CF7tHFf0MDrLO8tViptC/tquROf9tVpXX9RzrWzytpBAI9Rrb4rsBZ9h+tHWbloMjudgEDjvaPd2cLRBls8B550oT9CHn2xJ3YEsqTaAjyflNcpPgwq/lhyu5vz4bySrCgcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgaE6qT2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFkQYdsD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9H63X2765201
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9DqJ7TcwQLXud+3mI+dE7yiH4fHIlTZ5Kt01o+nXWQ=; b=GgaE6qT28IQAD12x
	0s3JT9kpF/NrbTG0oICEcG3mqchXlytX5CECmdM9TtrmbkpI4eTarLvT1y78TcG+
	AkNO2MmZr0f5oMuOYQAt2RZkYzSFGjvHjEtUQvl4L6wATPlF8z4K3eCp/ijxYj6L
	1hoIdh/SgvNXCezQFpDsI9ErT6y1OFBTvp8t/R99+zQwRDMLVeokcwqoE0N5cg14
	t8919ak6pvouVbSn2c/jQcvM77DvTA7RPtVBkkmXCRFFGqeoeJU7ADnNMyIlOtWr
	6xKGswyUE0WXT0wLvpYQ6qdwRVHbbVwKFxAitvVo/qJ4YFT97Wmvaz0c475ZQwjS
	lrKhTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7vk7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:42:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91345d517bdso158848685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779446547; x=1780051347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9DqJ7TcwQLXud+3mI+dE7yiH4fHIlTZ5Kt01o+nXWQ=;
        b=SFkQYdsDOypAhCb1ays3i4KTCwc62V7skkJiHyBkPs2Q8Tehro6cK9g7SMHospCu9g
         DpbmII03LyeUMC3HPkVJkZ360dFgfZW1CzMuLASdpZ6k/lMkAwRI3oOod9iy3aEGIWo5
         fRQR5c10YiO2TIwCPlIq4X9hWNir0xbIGh96abKUwH2shhh0DRZS/A5oRkKGBcQ8sHM5
         RiAMqRA0sk0xPM+D8medtG9vIn2CdrYEEqzieE+JUpI9CouAhdrlaCjd7BHfQb3Pl7J7
         c+kN5Ut1H9FOm+2vmkv9dIxerR5ZSgb3e0j4J9R1usC/yZRTIYMz9q2ui8q5GVAQ24sd
         SRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446547; x=1780051347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9DqJ7TcwQLXud+3mI+dE7yiH4fHIlTZ5Kt01o+nXWQ=;
        b=h9+t1ECLWTRSIx2t4sticT41ePFezxROhdBOLrAIiwzpTAA9Bb5J3Rny8/RvbSpn0Y
         SjOS7UdDMud3uZrOc6JLWVMSHGmODY5PuABbnax3qlN1W1coNF0IQXfuDdV880s+jhml
         q4pKEt64wGTava8prWL8GH+5C/CyBTHAXAQKoLS0e6q3TW76oqcuze4lFQLZ8nVHDQIl
         lIPTaW9fMepa5/r8uxVIGNkWUsE/SyoTxSke/CcJBRlqydl9ERXyNS5reFvvcMQEebCr
         fuQ5ORzPRtQ/DJa9GfjZfBCfVwBuoY+IeNjZPz12K0IeY/ubNZLGUyF2ovVCVXs0dDsf
         TPJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xLq8P++p5f27LQcC8aqFiL0RmVmDAgMvCp5k/j870BfdqvdSiQuB3x5OSNF85yLPGHyFGC6P6GFTq0K6v@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyry3RFvHNVeaWgEOHjI6Oi0cplAtM2z6UFucqVAM1xRkVj3d
	cCbW/KEb3Y0hqzjhG+xwpE5rhrBnMd8IWjYTZZvzH5BQtF4UetHt3Yh9ge/o+Mxy7FRkOQiEfSl
	8GBGkGd+SFqw7bxvtE+we7bTlp7wRpd+cT2qS1FsjEdY1cmq8iV0qrOjXCLKzyUslVbmU9PhLFx
	a2
X-Gm-Gg: Acq92OGeiiiVSxJThkUuO8JK2J5zXH8/WURQbIj3EvVS6U32QTSlJOhJ43d148nRpuv
	M2ORmuwGMIQGfA3d7u8t9VC8Gb05l92Nc6WNrpRypDz/NWuk6AhUxYn5yJxAhR883xS253rELKZ
	YafhXTSOoUsrDZssBuYMu8v4eZG+g6iitC6WwZA3itvNHGYaW/+Z9O+Nb6AZ4SGPcQR98X3Upsw
	uODJF3d0zq1sViPKWPl8incpoyrqAsao5kJh1fI4WIq8y3gVT8NVHV3qezmB1kIAGEt38z27ZRU
	XJXQdNiZGlMnhJuHqbVfSq6EvVKLMatBbHGur545Y17RZOkGd6mCN2Yc/dFenzzUHg7C1X6AAiz
	Z5wbTU8IP32CYoSWM/eOWgKi+yhx3aehQ3IFBMvU9ifwp5w==
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr291354585a.6.1779446546981;
        Fri, 22 May 2026 03:42:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr291352585a.6.1779446546515;
        Fri, 22 May 2026 03:42:26 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd45sm42661166b.1.2026.05.22.03.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:42:25 -0700 (PDT)
Message-ID: <1b499f23-213b-46d3-b4cc-3b5aae2cad7c@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:42:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
 <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
 <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a103313 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=knVCPYfzRBhieiZ2OR0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Gqn_5nfLSUvNaOzOe_Pg_q4NVZFf07Wg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwNyBTYWx0ZWRfXynEFw0xdNMJm
 UJ2pi5oYb4Gofm4nFjqdRayOs571TaeUq5cEGqfqWqiNYIJcF7haUov22KUGezi++q3pbih7fVA
 AaPNu3aFG9XiFC+eg/xUKuRnE1/+jirji6lsh/9p6EHZurSiXnXWJPvJpw1+3ftIlo9b8tYxCYZ
 Ti2mZaPmuBIPoynT/aHY9CuxIRrtLPP0gG0PZGoyXY+0L/KSs1+0Fts0DPYxzGL2Qjkb45bEFsx
 zVghkeiDZG7VS0JqyIO2JxzUFQsYdjlSFge5jNnoO7lpp7o+pBKrwCQHHQTp2sXer9rw8rZCz3t
 aLy/XSsZ4EPSlE3Rwpg3s3ukLZ9HymTF1nSM1bkJR7plHDjZ0Ca8QuEEO+jjnPLS4BvnZpQaKfb
 4nxCZffJUqTs3itLjfeqfnBax+ZuKkDW80INd0YwVJELIq8jkvuw18PzUEJBWNb5FivhT2Ol8j5
 o7uCw/Xkdtu+vvGOw4A==
X-Proofpoint-ORIG-GUID: Gqn_5nfLSUvNaOzOe_Pg_q4NVZFf07Wg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109245-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 528895B2749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 4:33 PM, Mark Brown wrote:
> On Mon, May 18, 2026 at 01:47:36PM +0530, Ajay Kumar Nandam wrote:
>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>> for runtime power management.
> 
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
> 
>> +	ret = devm_pm_clk_create(dev);
> 
> The !PM_CLK stub for this just returns -EINVAL so if that's not enabled
> then none of the clocks will be enabled, the driver needs a dependency
> adding.

This goes for both the drivers

I don't think I have other comments with that fixed

Konrad

