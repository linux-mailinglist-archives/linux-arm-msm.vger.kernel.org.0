Return-Path: <linux-arm-msm+bounces-117112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ij43OfmGTGpNlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:56:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF97174D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:56:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qewgf9s4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a+QOqDHW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117112-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117112-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C87D302AC1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 04:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DE035E922;
	Tue,  7 Jul 2026 04:56:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C2B23183F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 04:56:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400183; cv=none; b=mJcAtOAx9dGVdfOV9tnmhTLgjat83IlIOSju/BVB4FjOMOZMUaZiuprUKAyx7j+BpNE5/A3mKgAa+qkd1uK+ZhBxMcC0QUDUsgMfJnu8uyhdH6mDvOcTZUabr2lTaKCtJlbuqdx7OHl5t8XkxSsvMBlfYTpAXjU/d1VLlbK/88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400183; c=relaxed/simple;
	bh=AJ53eWkj8JoeZLOZEeHTwTI/FEoqLL+HtmJAUY5Ecfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0MwzEcpHZxkJV0xg5gVVqlVWIYvl0XJF2uwiYNaKQczd7tK7wb2yrvRn+oMIFJ5GISjZ5TrrydfGpowztlyvhaIcrCiYvbViQQaRC9lsGneYckCfnlrZkrpqcc9o0L01fX1xietCRYx3UJ3n2Jnkba7DFFlTOF1XhTdNU+sIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qewgf9s4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+QOqDHW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748lDk2674810
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 04:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=; b=Qewgf9s4jd2wuv4N
	TzmobBV5k1e9udwUBzL6rJlrUGLTMewp7aXAmkzkzTVpgyOipzqBIMJLASrAjfQo
	/uwUR3nRvZ3PeSJvn7Sd+dxEjOVrF61G+xD0AzjogMPFdnihrDFjBxB7Vi9HN0pb
	enHSZ1UyZmX17BAF0HR6z0uoKZxCgMO8oyxxqvLhcZH58r5mw9MlB/6qGlpS2QbQ
	ENg2nohR0P38cbBBg5yX1qmeszF/EMjHkNZ3mZa6NVbVL6c8Qz5HaiTGjd3G/QtF
	hV38EHpd7QHWwM4mo/LR0uTfnTH6IYiUNEzpFX7KpcjlTaF4dtrj+F21V7LQOswc
	4jlrcA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj78mf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8482b95574dso611356b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400180; x=1784004980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=;
        b=a+QOqDHW1dZbuzH1ihv0oNU5X+ccX+CG7oVEmF9nj1sZUxAkjhi/R2XXh4+4O2k0Me
         biQh528+RAHED36vzWyPqzrw3VklqQ1Qxfh2wS/WBzIaYo8NUtiaSAzUBws0+bqvdaDa
         gJxlGzv7Y0BEmFq2xfIAPRzUE3K/y14E2pMBRiTVL1XTCgcOiFUcUe0TRp9eMoR8NuQK
         iLMVLmB0K5V4boIiWKdDgP/RQTO1p1O4HUU3UcXUCuETkJyGAiAg67m991Fvi5fXFOtj
         Ok9ConYDHzYjqkB5mu6lCi79siHEAT8P3ZUVUnJhrt7pRsBcrV5SAJx6EI4nx62IFOuh
         CwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400180; x=1784004980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=;
        b=YgK6JlZUHhJ8IPPb/oWATy46JoHdnu3VBlwF06+nZtCFTjFfNRBpOgG97STZBYB0gJ
         4YrNumiecQxdSMTJoEE3+Jb8e8p0EXRPJW4WfBZc3Npvp8w+Mse1QFAv6py182IYuSxT
         MwX8zCun0wh6H+ftCiFXJjMDLT652O5jzlyJU4qhJfMKikr4LF9NUy5bRg4KJwMNxlcx
         juHLpCGAYepETPE+ZCemNcJGgnVsyR4WIRQ/wW2xCLkd3basszbwIwAhJdGDPRysWHoA
         EIEUq/CgOP1rtqjNbWT3MuVqkrv7dt22IDzEOB8F/u6ABBGgtj4Ygnzr5ztGV/DCltcu
         lazw==
X-Forwarded-Encrypted: i=1; AHgh+RqQR+Y1YBvmjxkaSwrvNTJ5lt2PkDnAxsakZ72x6EOEGb7lT2XaDPfuWaOi5DHCJ34p7YhTE214BLCmOWv8@vger.kernel.org
X-Gm-Message-State: AOJu0YwW1ws3jODf8cZ5HWxs/05CZuXOEsIQVvMM1SCQgL2u7Q1z19ui
	FsxDa+TN3Op2cwXw9Ua/CbDp/CNownTfYOcbSTXkWUuUMPU3fpf8HSk1gfnJtuxsuNsZ259DZvM
	N2Pkhs9kMmaO87Tu1NxJ/eFrCYVVkRTr+ZzOZS6tQvhKh1j7xwHZwD5heh5D8cPeCm5oK
X-Gm-Gg: AfdE7ckidPPwEFgenKmDJOt0CjMQR/6o4YM3l1DdrwRh4tqqkLCjKoQjxLqZxLMwiEo
	Kf7V5UL8D1Elb4LIlIbpuNNrqMZWtdoMMqJzcrOAqdlmSsDAekSlQmeGJBmyuttJw0FECBBR2pb
	yBqkhw9zfgdnyW7eGr0vaNS1SNMXdlOXJGyeQ82jxNbQRO0/3oSYJhNra6Via1RJnytskPG3o6U
	9Gfc9pW/hxlhkgtRaem3ghZ6RR6n0KrVkhh12cV1Tm1z6ODaaJR56YXqcKHvBmuoriCb0HwJ5R/
	AXD0fRFGGrE+b/8GifVAf8m/hgX8akaNUCCYU1+DVMhbGkbrhWZS4BNtY6TKtUjR/B21XiCZEed
	NY8bdAUf3N1HC8JYh2PawiYgJsvX0BszfF3q4jCQ=
X-Received: by 2002:a05:6a00:8d5:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-84826df139cmr3337866b3a.29.1783400180283;
        Mon, 06 Jul 2026 21:56:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d5:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-84826df139cmr3337828b3a.29.1783400179800;
        Mon, 06 Jul 2026 21:56:19 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8482b333d4fsm614686b3a.54.2026.07.06.21.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:56:19 -0700 (PDT)
Message-ID: <7333fb05-2a9d-44cb-a548-c8d2c26c1a3a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:26:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
 <4c8d6b13-6cab-4731-b3af-bb83de9d159f@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4c8d6b13-6cab-4731-b3af-bb83de9d159f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QGSI9SQlqTbso7AN8205aLI_Y6tZ8N7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX2A2cR9+I26YT
 cAx976NVutaZ7Yn8TzBn3w9QIg3+8XwYvTAVkyMc+NKHuwrOjVtkN9HfX7pL3ZNGwdZOGz8AUaB
 OeIQfp7+ZVY6V1WU9rc+T/tmOiTUs8P0yaN+BZguFsneSsQ98+Wi/M8d4QvWfjtuY+R9Kp0DJYk
 ZrErHQxxBrTgOIX2a4UohZdb/KtY5nuLvl/N9hBsaDQFnI7VE7vQOf+na7zPGeffbmwBWUnOHwa
 H65BYd3bh+GQ8YO4AoMr0UQKITsKt34KVebigsbVJcacLN2d0SAJrIJ9OnyJoV9c/lalEO79GPK
 qqcOzRsCUFgqZykT3ldAOgn+jkDkAacb3SJjiwylBhJUjfPu9IhjKZ6px0EwnQWMICFF/Mtb5df
 fi8I85fnvnjnsv7A04La8fVvVNe24ah6X5rYRey53+8QV5+B+MA5Q1rciLNuVY0A0iFG2wObk5r
 kOj/4yFYOLuB/UljEVA==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4c86f5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_JUvI7eCtL_LupWHxwgA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX2wjHhrcN5jad
 q+cnwl2nBd1mxUbo4t3R7veHR4kB7PBF2j2LaocOGTGCRzebR0SZhCXdge0AzYbhdiLdrAQawvw
 AnPQFhkF83OJ1hkZ3fdWVcf0Ou0FTnE=
X-Proofpoint-GUID: QGSI9SQlqTbso7AN8205aLI_Y6tZ8N7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117112-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43EF97174D3



On 6/25/2026 5:36 PM, Konrad Dybcio wrote:
>> +	DT_BI_TCXO_AO,
> This one can probably be removed, both files


I was reusing the bindings of SM8550 and thus kept it to align.

-- 
Thanks,
Taniya Das


