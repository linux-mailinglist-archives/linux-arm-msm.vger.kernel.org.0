Return-Path: <linux-arm-msm+bounces-96628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIPTInwIsGkUewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:03:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC6824C347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC6483078A03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B4C3A1E96;
	Tue, 10 Mar 2026 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRFdlVSn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUgDtMGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484CC38A724
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143582; cv=none; b=EqeLvFn90YH/mB+xLYtgG4nKpXVUFGX+K3dkgXWPGugEeEanHkL6NL0OBFPSXlYYKrSmQodORJ+YG5Zuk31KsaQ/2MCxQieTBG83O6rhD7EHX5ueI7YpHFD9EtvMKCRREPaErykSraQiCB6Kb/5VxVs/B/iMWlsFX0TkKkXUwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143582; c=relaxed/simple;
	bh=wuJfZ1J0cTMXd34ZZRaeXdJ/YtQQW+z7Rm2XWCQelHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4VgcR79yH3GGT0pV5Fv+WP3ro39phNCKglq+TD8RBtjeanPivvCF7KzPewx4CzfGEmNfEuTqPWGT9GEP9y/Xw6dNj0WlNRscg45VZZYySnUfJ8MW/Ofkj5U75cd1Ho8LDmh4mh1UFuTJH0Oyd5OIVP/xEwFd3qj2rlK7Ep5Ctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRFdlVSn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUgDtMGh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABHVOX3243795
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lWkfIqzV7N9yy+L+rQ8EQMvjhYy3SLPjyFTlUWehnOg=; b=ZRFdlVSncvrSsVJr
	WPO9jG2df6972q6LCOhxLVXp5jTSZ9MJpDAaWQUCBvTX+PdnNx3qEhk4iDU88GoI
	GWfDPe0rJKEnE9Fzxom7uTUbaPiZPq+9rnkgaoWAcl44kna3XLhYMlI6zSxm0Avt
	MMLKmYDSp4nWxgkrUcm3uJdAaJ3awk5f4Dh8Nq1EEOjmTLWp9Yh0Qlsm/yftB113
	gSUtDGCOh7j0eNCe2Z1zky5fZDEYPx+hfZTj06ZCem5EUdSKlF38Z+cutSU+QeDd
	3fIufFFgUsn6KE5FkchFPPVqfTlsGwtuhJ6p1BqoJtb3wMRa3On8C6MY5WJpSi4h
	Duon1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja283p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:53:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd90210336so66850485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773143580; x=1773748380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWkfIqzV7N9yy+L+rQ8EQMvjhYy3SLPjyFTlUWehnOg=;
        b=VUgDtMGhx0yTRPXNyRIbsMcn+mTIRFf3ihyCoQ87lAV0WrUOE3Z8DMrVoxtyZt2gle
         /ubeW3fqYOlckalK28lcl2WgviTIRk/ZcUFb1YFCgN4LaNlwfGy24Q4R2otU9BI6CAF/
         h/F+kB2He5xO2E9F2RBD/G13ovj2ABT4vGu83a0OxBcRMzOHaVQRwHiigBY0E6Dq5bgW
         DtEE4AgzYmtRNgxuubhJVyKQpScw17psn/PS2Pt3jxkmP3I61xs2/V+7M/D/hg23RZdM
         NPYdVcANtl2mjeSEdeRQoDVFOjAuV7vBAp/VVzwIUP9Ym/twixqNiu25+J7Ah4/B6DCp
         Tyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143580; x=1773748380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWkfIqzV7N9yy+L+rQ8EQMvjhYy3SLPjyFTlUWehnOg=;
        b=BQm+CES7p89SDNnWFTJadSwi3KUgqvf//XMuasLk3vO/bbaNSl5AzF97CqvFTGp6qf
         CFdbHtI3xUPA5zM8HiVgMcvpQ4yQGD4tpu7mHJjwD3ROmlk3m0I/hODgALffhFGwUzCn
         MZk0W4fN3FP4lbc+QwmJrjCTAYP6byVpJtOzuhaLVq2t+m8iYeDlz9HpT76L9nKBHDCc
         Mfur0MyH8AeciH2gwXQobm7AIo/rzVOKJBIUx/MG5BAeS3BFk/zKUwz/ZQPe1R6NKTrr
         rpF4+AyR2YkGDHkRxnlXSyFmkZUbxE03/gHHJJvvtdlXryFZApSS6lXA6NOxdGMAU3OD
         6xpw==
X-Forwarded-Encrypted: i=1; AJvYcCXH/4bdPmisFV1h+FTzK/Yw/1rJagRwvXhs0y9mYYKmJo5HAqevtpMleIVQ9gN3+kZNtxeutsIyTKQ1WaNG@vger.kernel.org
X-Gm-Message-State: AOJu0YywDaSl9Jrj5YpcWso8/zhnvIiQWLLFnxM+vOVAMcGkpcKR3nRg
	DGl2CCRxhCsyszjkiMcNXap77xpsvG87U4jMKYiOFViFyzchqaRl7jXlLnQ+GNHImlYcY5g1AiH
	a/JxzE4mXecWbnOlhPl6miEl5JBpn2zfMSGf4NG205BK+/XjCnLgauvOjnR47eT3LWO+7
X-Gm-Gg: ATEYQzxlRhX170GsUS1g9IZZzM++pb+h0EL1U4chjK3t0sfAHTtoiuo6oheQ4wBURwp
	8VEFex/nzqdJ8JlbueOc0UuPE79cVVPhAXvRNnRrcS6aJiJyUFjqr4bvawWWf51Gqdle6me4ZBT
	LGH/A9cONjHzMQ05r1Wf332yulUdBYkkffl/qitt4Cvk56R/m+mCqEuIdh0aSC6iL0U0llKBgCi
	B1bhX/qxvrVi4xJPNcwO+FdWh/dOzP31ag6/shroqcb5gFNvQDlsnXUmg5qqMlEgeprmeiULabP
	vtmbcVYKfPygh+iCWhSyN7YYoJwNmd6Pw7d7s5/Z0dcf8Yj3/ysKGIBj6H2arR6IONJQ705zmKD
	G9TjLFCkfjw4et3Q7HC+WGQCKBmOsFlHGhcffoWpmPerog14Oaf8Tv7DyhJTL68W0+MKAbyxg3H
	xwttw=
X-Received: by 2002:a05:620a:4151:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cd86fa37b1mr722191885a.1.1773143579594;
        Tue, 10 Mar 2026 04:52:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4151:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cd86fa37b1mr722189085a.1.1773143579151;
        Tue, 10 Mar 2026 04:52:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d6dsm4189837a12.6.2026.03.10.04.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:52:58 -0700 (PDT)
Message-ID: <966f9187-50c1-40ae-a964-db1b19eac7d6@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gcc-sc8180x: Add missing GDSC flags
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-6-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010214.224621-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0061c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=YcTtKlT3hu8PWQJ1XPkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: R1-p6aEc0Ig5EazgJhThOWaHz22bfuCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMyBTYWx0ZWRfX4Jy381ZUV6iD
 8BzKtjauS4zqSKDewSnoaNQIacNA4WBQb7UkOuz3zcFyq4lRL4G9zKlOH/rLAGBYK+RnBhuXfdh
 CfGk4CCHPA2QFvvcnIt41LhrmtpTY/OBlcV1JeNxEUZE4d+Mva+QF+X1dmainWJE8LPYM8gU/Vn
 tBQtEysnv16JI/itzE30wihZzlleFZv1drSWJnhIgMmMgmTh5m0Ijrwl5wuGXcK+Tma+s9RXZ+u
 XATsb9q5/Amy75jxX7RRcQ59utk3gLO7W3yQGncWbGHxIc8183ZH6kUxSc38u9BrgCclwGmbAu8
 7iui93ScXj2Kr1QmSh+t9cj1HTDeHyq9f0bEdcz946C5YvXLV2oSzShozd6O+AD6QEQG+FZ42hA
 mzyP9gQbllYY3VFRRBWjiKtZzTIKen0rX4jcMKS7IygQnfQaPn2Z3qtxOmjyCLxYM1QiVwmI/Na
 tTIicGS8LVVStkYBcsg==
X-Proofpoint-GUID: R1-p6aEc0Ig5EazgJhThOWaHz22bfuCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100103
X-Rspamd-Queue-Id: 4EC6824C347
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96628-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,packett.cool:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 2:00 AM, Val Packett wrote:
> Similarly to sc8280xp, the GCC GDSCs can and should use the retain
> registers so as not to lose their state when entering lower power modes.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Platforms before 8250 don't seem to set this, let's not do this
unless you have good indication we have to

Konrad

