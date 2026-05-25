Return-Path: <linux-arm-msm+bounces-109554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N25M1XjE2qkHAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:51:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7FA5C6104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FDD030041D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 05:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E56356764;
	Mon, 25 May 2026 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuUsyAIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YabP8PU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7F33FE0A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688271; cv=none; b=PXQNXI2U2ZbScXen172L6hUYgzx7p+nGGptlHMKYQNkZDR7Qj3bC9urlduw+8Gu1ECRI0bpBUV/tdYXX5ACX0JcEpjqQc1YDCbNqJVrTK1wZODFi24fjFM6Niz9zGqTCqEgq7i2Gkr40hrsbA9JaFGvGVrsDn5S+VVMdbQP/rPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688271; c=relaxed/simple;
	bh=vl/IvMjHQaPAG9h0CsmqVgUy8/dTJ2JHEUpBkVfgozE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rkcx6gzoDsTb2j8oQFN29F08aT/R/EceufuNYObH23VDYNliobdjP52ukRwnpsMZKW3iJ4oCzuMkCbk1hnhbi057q1BkGiV/fGnz1NNy0ORIaBsMlZ10Oejvnju8/aqzWrfP5yco9ZjIubuQ6xQZE5maDZN/zo82jxEGXLShKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuUsyAIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YabP8PU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P4v8KH168750
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=; b=WuUsyAIWUlyQijQk
	8xCNHknZt3TjwD55WSqnMX1np2l7sh+fHzt4zgIlDmxQK/fvVpOohPz6ojnzDERH
	sz8+MASuZZKwlTLiRJA1ApN2ht+aWkRUV+upRwABFYLkVFk7C/odOhX9kcxdolxO
	8TSxJHA9vAPr4qDpG5uY/kViS06gf3AcUro/OJi+zEya2nHJv1uYgO8d367JKa56
	zKKxL/2hSLus/0luPi9VUs8kLLFJ+kFIoYw9euFE+LTEj7acavFD5Y35BGbNdevE
	q3AxveC5rtonLlNfU+gq/rYoxXABihQSoxjrWoKk6ajyvjvz9fV+Itq8hlsbfCzw
	wSX1/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0vbn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:51:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso101568925ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 22:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779688269; x=1780293069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=;
        b=YabP8PU+vQmGuLw843AvYJRsknPKbPtbTDz8MdiatTfLU7jD7MvbGrnk/w2nk9tK0g
         8h/GbDfk0cYHRmqrI6iPOHc5TjWSsK+3WbdiVNPzeqZQdEEefoZWr2pkixR1ISgH6wFP
         8bDcGOHDj5Zxh2URrUf9W2qe+Tpmg0nXLb9R9NSURzfWvXSOe6KaWSwjrud1F4SQI+O2
         DSoSzKL58C/9TzgIVYc/11KZAWQr3tLNQuAkn9hdtAbndh8gtTuJFrHTx4hhtuOgqqbd
         KCUJyB+GWV7eidIzohPHhUhtarkcxdoGqIwCeFgCb+2wpKMzbpWivLj0F+sro2dRc9Aw
         o4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779688269; x=1780293069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0NrB06rrKegh0h82YKmeB1//5EOvAGt2u2s0wAxFrA=;
        b=kCSZl7OwArUC3bdS4lS2GLrpP9hyTzujW+9ehJS6CuK5YYNrxnVFJg+HYOZ2ekX6XI
         am8D9nh3kzP8725w2i4f1og2FyToFw3U0ICFrmKSiQfeArgnc/CdmFG3GsS+gPtTtShr
         VE3J3TkBTSQrCUWpKGhFDlcEER61ykC9COAafIFL6dpCznM6XCTAlWDe9eW4zukbzNL+
         GEy7M0cQGLyPjr4DSktdlbV9x96D4ulEzGWvJ/6QWWzGmPjk4NtERGmb7ju7KbAPsxDh
         iN41AI2u/A2WwzbDQzw6FFgtgfcSoiZPoNNB/8oRRnfW7OsNgRpFCj8quy9QAv30qvje
         Nn6A==
X-Forwarded-Encrypted: i=1; AFNElJ/theQ00Or2o9P3g3cE8jWjjZFtck5ZyKbVsHdMSeIiKIET/bITgkDSXNMTI/3C069D4V5kRzb1wAhT3uSd@vger.kernel.org
X-Gm-Message-State: AOJu0YyX7wUsHoY1DyVXqJ0Bjk7VUMOV7AofV1AQY7zvT/RF4MQ3UgHT
	EkQ3g5EWjcN5ivrj+tkXj3RuuIAFM8kmGhhkORL9NWoQE1fgLF677HKFYQ6hATIubNqP+ahXRCD
	Ai+8bI8xMUPlWPAn3lne1dDXNtIst4jEJcomOfBXHIFqqcMkuBfKOBVgwl5Bxhvd3gVA4
X-Gm-Gg: Acq92OFEGrFzobVoKbEqnf70sfrd/X+54mPpdadV7YeafzLy9v7ANl36cxQmA7Mfv3U
	hDHBBcunl80vLnIxJz9bFgb8gQWW+ODdSsXu6v6KlskfMZ+qJcZaA4COwiKBUSChDLLHy7hG/9V
	ZZYJJMG353rlQeIf4Sub377y9s1TC+I5LDGNPKNaDlJwugZfFMmVaOIy+8oixtkY3hNyYeO/KHz
	2vni6FlV/smWFVp5VDyATMx6Jl8jNVBh46mWv6cdNhBNldacSBZvWU+ofcgmcy06JBlWIf4LyBG
	ZzROVK8F3uJlrNmPGoKcPZ93cXk5z3D8a6u2f/X5gaZM/BDgU7gtwDdAxhGA44u7RphnoQrXLW/
	7l5KG1Vszyc1w+09BySCcm83wsDn12ax2xY44678nf1yi7tAD
X-Received: by 2002:a17:903:350d:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2beb05d2054mr152233375ad.12.1779688268657;
        Sun, 24 May 2026 22:51:08 -0700 (PDT)
X-Received: by 2002:a17:903:350d:b0:2ae:826f:2c50 with SMTP id d9443c01a7336-2beb05d2054mr152233085ad.12.1779688268163;
        Sun, 24 May 2026 22:51:08 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dba7bsm80743675ad.66.2026.05.24.22.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 22:51:07 -0700 (PDT)
Message-ID: <ecaa113a-02d7-48b6-a94e-9299a684b0be@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:21:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
 <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h-Xqf96WU_iWvwgEZSuGcJM_PHJH98sA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1NSBTYWx0ZWRfX+yNcDL6UGmqw
 jYx3rbmD+QPzhq3ErTwbFoX59lL9oiOGRG7q7MsdQ2ULdPrl1i6LBFZ7zmIx4eonwmUBAzTo4jy
 fEUFtdRDPJtxAn0km8Y2opYi5UdfKg+PHga9bq2+zF++fHdEc/+FjgJNn3S4VJbPjI4qcXZQeE7
 scHLhABDmdz0rXi8sZE5ZTk1gf6JfljyvrI7mjYy072/ttfmxROY8XM+KF71oYq2gy5lDs3u1vA
 cA/XruJMvueb/wdawEQiyAJmZNMTi3MYK6cp3oZj+YathbH+RCkn/r8Cps/GSpfugcpG5/4OWnH
 3S6YEWAu4osCRa0WSf9cvtWEUKFfsv/HsGnRLP1TzksOULu75zsOrkRbwdHejw88u/EY+2jtN4E
 fN1509zDT1cjQCPzre8WE58uZyTrEv8u0nYlLFKkvGAQV5Njf+/SWhPFdKuHxXSXVAu0+Oz5Afn
 fpYIHoQi1Sjqlixmv6w==
X-Proofpoint-GUID: h-Xqf96WU_iWvwgEZSuGcJM_PHJH98sA
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a13e34d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4fXVvXKQPWswVA94wWgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250055
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109554-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E7FA5C6104
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 4:18 PM, Erikas Bitovtas wrote:
>>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>       .halt_reg = 0x4c02c,
>>>> +    .halt_check = BRANCH_HALT_SKIP,
>> please use .halt_check = BRANCH_HALT
>>
> If I do that, the clock fails to power on on boot.
> [   20.324488] ------------[ cut here ]------------
> [   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
> [   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at


I am hoping the Venus driver has enabled the GDSC before requesting the
clock enable.

-- 
Thanks,
Taniya Das


