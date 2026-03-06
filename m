Return-Path: <linux-arm-msm+bounces-95850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGgrHRHsqmmOYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 16:00:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD9622344F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 16:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBA493078FB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1B43ACF1F;
	Fri,  6 Mar 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcPb6H30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I86UXxza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D142C3256
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809122; cv=none; b=BtV/WQJYy/budQPLtN9UK4H+l12ik1FU021QLpOLyXaEVX1Tzd/ORSxJxabBcqngMf3Ac6xjE3biF+s2oJYeXdYGj1PanUSANtboNGv5vj38PhC2XAZoGxSM2oBr87YerxXRWEY9FZUiDb8HnmItvqEx+zK+wa/GytKj7yBJoaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809122; c=relaxed/simple;
	bh=bwjilBTEBISnA9MRCHz5a28UWCOJqJK3s4JWR2vnaPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QS6z4nc1KTCyYKfbXL8ihc3E5+Nzc4ljleNWpQbrkAOEEgmixoDkR4IdWaeFopOo94Q9xcjovseqB/ozRUZEzcuw22bRXIJ6JstazPM7/xs3YsRR1+SCQSTeyltcjwVHHYmrt5rzXxIObvIvHOKkc6RxsRTsv1OFkZFx9RF99hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcPb6H30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I86UXxza; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BauQW3406336
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYWfBwn/reMz1eYK1IJk/FvySNHJ0NTJNTSO0VoHBCU=; b=WcPb6H30LOfVn6ON
	Zf6nnTrGLLSCIlO++fX+mMuWz3mWIwDc0FS5LiA6+Zlxh2jaDlFcmGDe3DfbxAlN
	WExNMrNPGnGeuNBsjh0qjb4apv6mG1gMLFhf6g85IJaW3KTeKCA890At3g0WadIY
	8hEsv0zDLkIEzSqv3aIDzzcEWxHR7+D3QDdAg9OHl71gDo6R0YcBUcR7Gy7XoAPw
	UF3L+lpk/epH2Y9R4l4uAN4rZaR8aqVUncmd5XR5yX0kqLNefrHkqlbKTzyxOkr0
	Wwj5EfiBD6ZRW+Zs0LkNvKz1J+tmaNgUb+v1bQIzWW8g476fP78C/p0XD3X2S/TN
	qTeFQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9066-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:58:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae49120e74so56617985ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772809119; x=1773413919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYWfBwn/reMz1eYK1IJk/FvySNHJ0NTJNTSO0VoHBCU=;
        b=I86UXxza0xH+zdbudVD/sKBP/HRoFlzr7D6YrwEKPkPXVH+0Io4EGCg44MU9R6jlbD
         ywuR3EF3dkvDGTQHQdliybilIv/mz2usCrmDyB26q93HhP3Lb1fa+4jsVdOOyxiee84Y
         HBdMiSwKtYR6PvpaQn2XQk3L9U3mhevqbx0bp6j52c4TOJKYiQ23NGMt3O0ErAKtjCCh
         B1FMkWby/855NgGewlC3NdIHGwDrN3Dgb0dBi5cv/SrwG1LlTJiiAlz4Hb6tdst4H7DH
         OgXL2wtY4U01rnpGy12N+yTRvT+fDRRPyIhCsdB8oFICxg+NFo8UF0KSM1a8cngMXRTG
         uZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809119; x=1773413919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYWfBwn/reMz1eYK1IJk/FvySNHJ0NTJNTSO0VoHBCU=;
        b=VCtU3kRVW4F+9Yorqoi65cQfalNUsm8dvZquzk/c2E7fgm7o5tAHyg6ThwfaOV7+JA
         n29K6z7iatT5D/b5wvakUk9FZRUZXaL7mf8t+ryor3nBndSJgyFD0Rm4tuit+pB4kuME
         5/uZaojR++jB/uwowO0hW33XPrvtfLeWbVTYmzJe85h9T3tNiMOl3CeoUiywPUi1nWwF
         LpKtwpxR53ZkarK4zraI4Ugl1IZWESBnB8YuNDTI58IOgsbEKTheZXyupe03MW+aWl/p
         luVrwlViQjgxWx/VfXJNpym65u9YkBRwKJo0wQ8Ti9PhZHrWJQqQTL9xpHltUa5Z6lqx
         KUiw==
X-Forwarded-Encrypted: i=1; AJvYcCUbO7GRPlwZfkpnlgOUzlRoaiNNcaxOkBb0+RGlQ0dTzNcw1ieYncIq7IwI29e8fjhLONgPudgRhYHexA+/@vger.kernel.org
X-Gm-Message-State: AOJu0YyXF5xgECaTk+Za7PC9z5TY4/Ijg+P3y6u4b8I8aWu9NBtMHsJB
	r+ocyflQauq1oybVpYnhbSOb5zfIxtKvd+dPKhVpwh3XmatJAKKXMXD2GC1L/LDhPl2rMwSKxU4
	GHR0lFnDWYqe1Wet/VtAZ3JLz3YEdoKhiajY4hCXXbXS0ca+R9A6hJGkpVeBKiwED3J/e
X-Gm-Gg: ATEYQzw+9oO3nFPi+RUAXhiAlFCAjCZTBZMpRaqFWUQa0gR0y1yyCD/GY5wdHReKJ+Q
	T6LQNMpbcvXUuAwicSTNjQis6OP5OZ5XIIFAbLi3IleMTrtDH8TBbYa9vfGiGL8684QAjYFx3FT
	Ht2jlyfPwevikE8yGXczAqnGkklocwr+ffsERKTMl2oYkX5jOn0wSX7wcGwlU0dyA3h2pruwLMp
	Lj0kzNsAbBIxcQU5aFI9ZE0YPYnnmqxXjTdyEbvWTGSGjGzWZM3VO1fkHX9bb6N/SH2rrxbjS4H
	NlzsCB37AtuTlydNQQ9Fh/cr3EeET8GlpfCXFndsZfwNy/gqi4mcToufyujbaZx0YA7B6chtBoz
	8mXtZa2HShp6Mqiimlgd4JVWChuoxjXPlSrVRlVQRIn1Kk6EwlQas/XfCQmyhBGL8dAM5w9oa8P
	2KbPxacSp0xFM=
X-Received: by 2002:a17:902:d48b:b0:2ae:3d7d:d903 with SMTP id d9443c01a7336-2ae824465e5mr26588815ad.18.1772809118982;
        Fri, 06 Mar 2026 06:58:38 -0800 (PST)
X-Received: by 2002:a17:902:d48b:b0:2ae:3d7d:d903 with SMTP id d9443c01a7336-2ae824465e5mr26588485ad.18.1772809118457;
        Fri, 06 Mar 2026 06:58:38 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575f3sm31997295ad.8.2026.03.06.06.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:58:38 -0800 (PST)
Message-ID: <d9d8f959-9386-4460-a63c-200fa3853f48@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:28:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-6-dbbd2d258bd6@oss.qualcomm.com>
 <3f69539c-7383-4321-8cc6-1f5a8cc23822@kernel.org>
 <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX4FUV2t6CxjDH
 24ygzXcB6NKnps/e3RzAr26EN/O6mlJNhmZIWHBaaTWReDzd7hMMUX4IHHG0p6S1kYVqEtPigwF
 hS5zd/+yuI26ZP/55AEGm3CikpoMwag+/QtyRLBRkiJHk4ipEiG4rADpZybO6dEmzPsmrjx5Oyl
 xfCv3g7jDTpMPrfcil1sn5Kuu89pzOSDVMiOlnhiDP8IL0fS7vmvtavzWi+8ekB47YOUJC9Uf65
 iq7uYhEsOkWCE41w2/SlxkIkHOhekZOW33Jubfba6jFESRZCMXnA5glHYgB7hGWfOoVk8wWsQsL
 /dvex7ay4viPLeajoMxutFK2SLaSY/OPJz5sBWEOCS6zvnFuwtFd2Lis2nJwe66Q4VxztkXMiQo
 WHItmmI+1eHj+M+xdJBurGWN1eeiyxQ7P4pSw+jT1cUK05FjllPegH5jOhko5GhNNtsNk3fqDHF
 RWOdxRJ0DAxO/akSf+A==
X-Proofpoint-ORIG-GUID: 0_-rgXzqVjVozs2G85aNlq-8yXsXXNRk
X-Proofpoint-GUID: 0_-rgXzqVjVozs2G85aNlq-8yXsXXNRk
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aaeba0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=x1fEtfQZAWo4FmDVKCEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143
X-Rspamd-Queue-Id: 2BD9622344F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-95850-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 5:30 PM, Krzysztof Kozlowski wrote:
> On 05/03/2026 12:58, Krzysztof Kozlowski wrote:
>> On 04/03/2026 18:40, Jagadeesh Kona wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
>>> of previous CAMCC blocks with the exception of having two required
>>> power-domains not just one. And update the compatible for camcc and
>>> videocc nodes on Purwa to match with their respective Purwa (X1P42100)
>>> specific drivers.
>>>
>>> Fixes: a8a5ea012471 ("arm64: dts: qcom: x1e80100: Add videocc")
>>
>> How is this a fix? Describe the user-observable bug in such case.
>>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>
>> Three people reviewed this...
>>
> 
> Actually I checked now - all the people reviewed commit without fixes
> tag and you just added.
> 
> OK, this starts looking bad because it is more of such patterns from
> Qualcomm these two weeks.
> 
> Stop funneling features into LTS kernels.
> 
> NAK
> 

There was a comment in previous series to add fixes tag for Purwa DT
change that updates the compatible for videocc & camcc nodes since Purwa
was using incorrect drivers currently, and squash that patch into this
change. 

Since I squashed that other patch into this change, I added fixes tag to
this change, I will drop fixes tag in the next series.

Thanks,
Jagadeesh 





