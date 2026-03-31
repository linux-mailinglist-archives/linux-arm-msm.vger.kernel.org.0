Return-Path: <linux-arm-msm+bounces-100996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEMrLUiSy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:22:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D2366F68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4CE730CC908
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4AB3ED109;
	Tue, 31 Mar 2026 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpvhDN8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilUoY+yH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D63344D86
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948511; cv=none; b=f1jgBHTpYuzaJEfaRA2hySMjFj08GmPizL/lCtzEN00iLlKeI3l1g+tPqLtZ+WRddbTE8K0usDEGtvwyaItYQRz3BmiZnUIVEDqO1nHAbjVdyzk2AM7Kfi+VVh5U/9HfliNfmy1EKzxKRBHlbXIiafHvWx4DFPi1tQEp5q0c5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948511; c=relaxed/simple;
	bh=7I8pgnyQRdO0BWjCySzAKVzNEcTZwP41eAknZ2uNTnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzAtKkBD/h7N3nrKbG5kY3iB096f191O6yv3xTlVVLG5kGtmGdkARF+ZEJ/g9O6iVyq9M+0DbEJeB9wmgXZ7yNV6nCpvMVxMvfhW6WbMFzWUlF+ZTe+6IjVuybgclsTZk/8HDEKzREgsR39w3EncJdyotmoDDGXW0yBQxSMFx2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpvhDN8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilUoY+yH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5uZCa2408178
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=; b=MpvhDN8swqnPX4ql
	teCten82I5A52Ha7ymmO92XlUNrgPq45Udi2qc9Rl8ONGXgbEcpDq2HMr0QCex8/
	Lgcrus8BhmK+hHIjlENGD/H6RjR/6wP53HzF9hDZBlOmu27eIvjee9yMGwhGYw0H
	q/L/pAKlOI7dseEO6KNVwHiZaqqsVFXpYO6fTCZdtCw2bSsT4ZwqWOJjVD8w3eEu
	G8JAIRjYGsKQRxOBdYZrQ7ETI/d6tTHW99akpMrqTDF0lc8AIETMAXXPK9PoqVk4
	NRvEwD+mauFKpK3zQ9BodmG2/o/fPyDVvC1phGKsnsvh9I/E3KFjl+Sun0XJONKg
	WhyhFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hetbm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:15:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so20308401cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948508; x=1775553308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=;
        b=ilUoY+yH0qx/7V0ipBMOb1RFrRTu6FfnhM7nUQ4lxgJLFNHgAA1z5iOnoBRwBXeC2w
         W52kRNQXVHHmYQVF52KGmPgQ4wM/0A+Clq3raJ6ILejg3SLQRdS2cbgBE6TZNDxaD3iz
         nhGLWnRsBobx/1jBOlKbF8de3Ry+bM53xYgoRPz6DcpCYhKRhSiyHMT1vUOp1bJdilSI
         PXRNC2JWoBTJb2aoqplJCcj49G2onBzAxZkW0LH60nEiLtzL/sbM98iVPa50V71otW76
         3L6blV6BJgEKDi+oJ7/ZT078BvyfxlOb5naverRfCiJe5gAxrwkoW8/ZGt6WvdRECD3K
         eEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948508; x=1775553308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbwdIaXcDCZ8n+FwqzQDt59cvTDUlTONjPmNtjHi+kE=;
        b=hVnAI2lI4I3gEWD0jowZKel4Z3+Lp7dZHlo+PN2qZU2wQMP/MMEe11fscHn/q+3ljj
         /dkzN+qjFbRRNh5Stu/EnTYtdwj/VFvZ/nnOAuKeLBPe/J4wAraGgwiqQEiqbNwiwGAO
         qETvM9BlDMeyF3QIxBbLaoz7Vfy4C1LZOCy9pCBAP5/JnOQcYzMsMZLx0YoZpoHXqvSk
         2fjQBOmSB2QBls7lLCm3bBjPaSP9qaRp9B2izi6GbpA/bFNu/5oGhTsLD6nOeugnj+Y+
         jd1ZG1xBmzDL4t/kFGwUptzFszeyhGXI82QhZQ0Ik9v42s7ylKttWJm1uJJL0jJ27IrQ
         /LiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCrIfu68/SjhZH+39Sejbp404hrgcin25rjxnftOhE2SIyTnvkIt5CsMrn3xLDIgpae6LCNfR9sYjrJdLt@vger.kernel.org
X-Gm-Message-State: AOJu0YzXaKu5ExFZJv0QH7BUThXQtg62eqFNC6VutqL9MtDQc6w5zDA1
	/G/9lhC/0gHXUiXJDxBKl7ykKxsxBB7PjeLTmRoj2zkiWN1OI/LTDAVZWrBtCyxCCue4qWrX8od
	wbYJ5vGNhLEmfLteqIFPE+uhBAP4TYLiHjaIQ6LdhrMr5dRShvb0M1JEKkZPGVC1fyEtCBcxDLu
	gE
X-Gm-Gg: ATEYQzyf+XQiUgtb6/cqREENzIM2vg/tNSGg9jQR+vlydcqyAQQ7MR++87c8J4m8yLn
	ywT+B+z354ZIw1IUPoYJfoW72U6J8p+LFHV4RCr0rh/ncEbM+pVOuIQotxnjfwFJLdipLuOVvTT
	f/aShPDSXvRsL2QJGlhS8wtsHnKCA9HauoixHo9ENgROy0wP6Md3rgiS7MFFuj5NtjHdfRNioH6
	C2uU+ZFTBM3TOgBGnJbFAp7C3lo2+skzbPF1M6ATrRUP0dP3u7HZLCilaildvSZtzBHdH6lFbFf
	3jDkg3ZWMgArHAlBMhldr0KccgsndT0WohXWMP3iLzMXXetJk/4AJ90sJn6xfcoFngHwPF7ahfR
	KHIjSa17JeIBig+A1luF08Z/iG/yV8vWntHe2ouSbChw25NzmacFmxIC4UK4vzJW/VGBMmgg0zS
	HV2qg=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr165089481cf.1.1774948507937;
        Tue, 31 Mar 2026 02:15:07 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr165088881cf.1.1774948507432;
        Tue, 31 Mar 2026 02:15:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225d4bsm381743966b.60.2026.03.31.02.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:15:06 -0700 (PDT)
Message-ID: <690b0263-3379-4776-b073-18abdbf94489@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:15:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
 <20260331-purwa-videocc-camcc-v3-6-6daca180a4b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-6-6daca180a4b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cb909c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=w3l1uDNNw06S2l6T0SEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3z24mquRXDNTjW_btRUvD6akQEbkgb5k
X-Proofpoint-ORIG-GUID: 3z24mquRXDNTjW_btRUvD6akQEbkgb5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX/Ocl7xDZNE96
 Kc/KVea28c6ColYd5fNn0eVPOl425aYMeC11iz7d0XCO3+LKmOqWMlEPzzeBAJrNucColNxWFyE
 8M3DDof4qR2cXlZelgUQGHLUxLQ3U6I7OJ3/Us4ZO6TtlTuW2LL0deNhhUrOrPQX8hv63UYKSXJ
 RDPWmSyN5Yt/vfxWsI0PeZJIkCHbWIFYPFOR8cliVNOE5YH7MDWgBZpsebU3I8NMZwOl5HCdl/w
 3iIWNMBMPlFT1dO9KZIPFwjEGSVQMfM+IdilR5HBrF5328yQcqi8u9BTMDG5ghThm8yh6Zhpp+C
 M20Vdl6nIm/S8ob6pmmUpINdkSmgKT6FUQnB52HwAPqm1/nMEmgiMHDwcYBND0pOdUWmkpQWX7Z
 47J4H/eNVkuREZuo0CGv6Dy0kNEnPqUmI3l4dHN7xdQlUSSkLAnx/aTCAOc/ju5gfapTqTJVxas
 /VS8PulNpOLs/9sR10Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100996-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 496D2366F68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 7:24 AM, Jagadeesh Kona wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one. And update the compatible for camcc and
> videocc nodes on Purwa to match with their respective Purwa (X1P42100)
> specific drivers.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Can I please get a definitive yes/no on this?

https://lore.kernel.org/linux-arm-msm/382725b5-1e72-44b2-b9ae-38aea1f7a976@oss.qualcomm.com/

Konrad

