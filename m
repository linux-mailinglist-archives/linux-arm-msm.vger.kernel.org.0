Return-Path: <linux-arm-msm+bounces-91470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MfeKa58gGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:30:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D253CAF53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10CEC3038ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89A03587D5;
	Mon,  2 Feb 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTuI6cCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCVtdW7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317333587BD
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027821; cv=none; b=B6mdDRcl/AEYbiDFZAHs+z3MTWtTXrwb9Z6HFOoSRkwkHyanlUIbddKQpNp5acDdyA+9ip4EePynIQ09KqStglfFJyaiaY48iNXjfFopnncbBdcKKmhJ/9Su1yTEYld8JPMvmJ5Q8mlVGt9fxfsS4PPG5uXah3DYaixg+xtF6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027821; c=relaxed/simple;
	bh=pIZITcj25wsKvhmdYdBtu6+GgTflgSEUTVbI2jUl8XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOmazY9q6PPDUJvA4GyjkTXoH0tGgAgTaMTyK9K6j+9KlB/0KJmU7ht7PH/ohjsT0HBXoNeP4uofubfqTyzqTzsLk9rwNu2BUW/x7yepjtmvbsCoZ8eLMjYa/X8sFJox32jVzADwYD8+eUl57C2flEMzqBeKTUcH/H1Fi/p/pko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTuI6cCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCVtdW7m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285CMC683681
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60Gtl61u9szV23kiNEfQyeK1IjsNzPwJCAQmzlir8q8=; b=fTuI6cCGly41adYu
	yLjItYvxpBFlyEdQ+v2cTHJlDMiQLZJbk4LL37y2TwZ5gHcK5lmtNq/Bg4VDPAf+
	Hc+rw/HeeW8lZFUXpjvkmuh8sLQJUh75FnFkwMnwcT6KtwDtakDlBUFfR0g6CXQZ
	F3/4dmcCdTd4Q8j6t0qW6EtdzxPWv4BRIRu159EJhoe6/hmCmRbhA0UZr6t3IQQh
	8V0FwMlqGuIlWfRm/xc52wfU5U5aJ9woEtd8a+Z95/ubamM7obnP4NmQsRvskiw4
	u3zTmTd0Usqn7I7ULg/9erZUBkghYcffTvBIIcCYiWU9UwneQPsIWf4h8qOba8zJ
	kWhZCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx4ynu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:23:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso91963085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027818; x=1770632618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=60Gtl61u9szV23kiNEfQyeK1IjsNzPwJCAQmzlir8q8=;
        b=WCVtdW7mKD9wtdVYH/uzQqYQQeXTR1BdnkrIeRekZqblc8VI/r4nXeCqUS7Eh4jIol
         OAqUCV03ON98tMPrLgeAAVrpQsCbvD8i99ZdbrHpRfnKsmciiDZVufq6WfqWu8/Y2bOW
         rhPOFJvq2YiMWGFa1u58B+4pgbNmEWjHHL9XMtogGIBVLrNsd2iHNpJAekNVbr/6Gh1e
         Ju4io5msnfp4vYG2XGHCDtQmW6WrEHJ1bw89qTjlzjzFNMuulRoVm5aE706kXD6DojWy
         6AqdyR++dLYHH8Wrt61eLOkaimVASmdYBhLYhvDBsSH2faoZWRamB1gVBZFf9AAHrdC5
         /uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027818; x=1770632618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60Gtl61u9szV23kiNEfQyeK1IjsNzPwJCAQmzlir8q8=;
        b=i4rgr83uMJvp/y21mxDlCy/Ekg/f1zhd85fBhj8dOjFhG27sYpFlTkPO7P0Kj+ZUvk
         8dgB2hP2AHUCdYURp+qkbqjH4DGQElzhoV/Qa5XrtDsJsREeNCE8f0NbRZVJ104cUSGF
         kNsAweDlXHYJVnZv0aSHoo5/SVw+nPb5fbxmOUENtU8x1IctgBJ6yi1ZX5awuxwU6lDE
         XYPGZ+iZFTWCEcjx142pXfIpmceUYrQFYYvOrWpI467Co1OMiU4UVakm7WT42duntE8Q
         2OKUHoeq4reOIQhxBSSTXfrduo+sRIBysRz6NBnL2mD21ToEvsrjVnXpRZMQxB3Hnd5y
         +6pA==
X-Forwarded-Encrypted: i=1; AJvYcCWLcVJxkSxjo2TD/DXydkiz440oiYVNB8DWRVPqJtsMjeFF/WDeGksQVwVrYhzR0YI6+eCnxRwtMHWaYZH9@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYubA52LUYj3Uwqs+2PR2wsTjh5eMdZtRc29gNWB/fOV7i/7A
	QemL7IA8mSGWo3nxSf2dU9I0D4IOEQ4S/HQ4/4SgOQ777PWUOJ5JueVJsWw6cjfv7+IvJn1NKlr
	MyDGZle7Z60bO398cghpyfLLiEpLlNDfj1mrfmR7ohs/DOz8Znqx2TjrCUGCgea9D7u2e
X-Gm-Gg: AZuq6aIgUn58/1d8s9MqIOE1QObDsP44hnps+qebh7G8ySk+Md6Bh9PkgDyhLdFdKqU
	kIRXLQ4M8tmjSKJXMklAdhwn04yoRCYmGhNQXNYZWxA+XAafXF+9r2p7iVs2W+CAPr1BWGTlGuX
	Cpz/o3InOt+v0E1sxlaguTOhiKySr2f13offxMViOr6IaW9CsPt7OOoPsS8akRqkLMhffxSQhZ6
	Gtb+9vPtaiRyQZ42KNK+Y06OIfuvFysfNi6snqpURqIZyUhDPIaBScwk1Q4SJvzNri5WtuHP1z/
	ZK5ziuQic+B5KyCwTk+nqO3CGDXsMx2SG3bB/dWIUWuMU68WDqX8u3Fu2RyY6DAZzeDmgP3SvWR
	O8cLvkYPRUl49eG8fP3DpB6WUXsSaCByB+GTou+VUckYMVZj/KgY+Swx5d+oIJUMHz48=
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1081612085a.6.1770027818370;
        Mon, 02 Feb 2026 02:23:38 -0800 (PST)
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1081609785a.6.1770027818003;
        Mon, 02 Feb 2026 02:23:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c02d0sm827884766b.55.2026.02.02.02.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:23:35 -0800 (PST)
Message-ID: <70517c7f-92c2-4b2d-ada9-9cf0fe9371a4@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-4-e10b886771e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-4-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aBpftifWtt-M65PALR3jyoNji13SX2fR
X-Proofpoint-GUID: aBpftifWtt-M65PALR3jyoNji13SX2fR
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=69807b2b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BT5F1K3s8IvAzqF_nA4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NiBTYWx0ZWRfXyNR4qzKB+U3j
 3KnzrwEQhXbsEBKTJz6I9AK2e2bxvaz7WKUq/LiZW6row/jxr4clM3OVvXzisL8/a8Q0UUF/2EN
 TrhkzGV8FAbYYbssHmhtaNo+0tvwcyZtK7se/ZC9mwTwP0TLdOUncYdS8vZoTW2STcfTEspv1IO
 vCVMlDjP5HRVopivxTn1SA8CbxKL6gY3oD5Zhih2mrgfD+jIMxwU+hp3S60j4imZmce3xnJPdQd
 V0FIz0VM8wLul2kGQr1HDj5HFoXfDafs1hn/M3j3zMuS1F0R5YZ0f94PAzUlpAYW2vtAJcTJ8Gq
 fKTGbAjZUbubRvmZ+tgA0Znl3iqM9AFRw4tp/l5+/cE3V/hpv1Dm2OCL9LZlVgUbEeBivVv5u5x
 rBmpVsI/h2Ebg8jLQPS0NSXGXCykYw7obhzQlur1cGO99TEHIhJ5qAa+hv2DF44np1qI1idPnNr
 PF+ID4L9UHA8z64/anw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91470-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D253CAF53
X-Rspamd-Action: no action

On 1/31/26 2:58 PM, Dmitry Baryshkov wrote:
> Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
> and increase H265D_MAX_SLICE following firmware requirements on that
> platform. Otherwise decoding of the H.265 streams fails withthe
> "insufficient scratch_1 buffer size" from the firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Since it's matching venus:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As a side question, is there anything wrong if we allocate a buffer that's
bigger (or say, vastly bigger) than what the fw expects?

Like, if we allocated 10 GiB for $reasons, would the fw just happily
take it?

Konrad

