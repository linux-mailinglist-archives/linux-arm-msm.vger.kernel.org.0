Return-Path: <linux-arm-msm+bounces-95852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIlkK0LsqmlxYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 16:01:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5C32234C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 16:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7F01302F4EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEAF3ACF1E;
	Fri,  6 Mar 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I751G9oK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ag4FfImc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA53ACEFB
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809168; cv=none; b=FUF5bPyMG84zBcvpQr4MQFu5Rm0WhWb+DuQAmFIq024hi8PTMvisL3YCfeOau537YaPRQHKBHWVTNfi1m7NkW4STVvt1G1BI5pRJIfxCT0Y68kTtGvrhaVvHXkKcNCaisaGMHN9Y1BKd+3dWujhCaLfM3GQEfPONVggY6Y/uQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809168; c=relaxed/simple;
	bh=Qf5SN8oBB6sk6mfEymupZxaOogkh5lbZYQn14d4RDwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rU2HGP1NwK7TVjnsrZjIk3GCaqFHoWSbhuZ0BJmHBd3WLN7GQXWpGNvSmK4jaPGLwC/Dyk4KN+gj1+drEYKh2Rj8eCbZklXST5a7As17SGzNLjQLc8t9P7fvZgrebYow3+uvX1ffZP1dOZf8t5vQhA7zzAM9UeUzJzWqw7PIu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I751G9oK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ag4FfImc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb2ve037373
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NjEZs01B4NI8XD+SfdF4XpRw3Cnculfs18u066w5K7U=; b=I751G9oKPcEcCL3n
	9HPArKCTVpJsoovLhEd4jsXch/XMZdPrGMZDdnxd6lclkdsP99SyOZJkzGNm4o5w
	mIg2r28qZIOLofFFC2QNInxN75Kv0KNiFomNWlmguXsCpZ9/JjMiZbbKGzKG+CMP
	Dq0vAJ8zZfx0uuiNW0ORnH0FzsQ5jQGgk7fgpaakSXQ3xB+DfO7l13V7R+1NOTmW
	83Jkonm0zfNj5NJ1Jimne7/srGBNqZgZohv4DP6PaOpO/WyJGCCh17rajy3T0rf7
	RSo1ASHuN4myBByeid+V1XR/TfQ2Y3uu++JA5seQ0DVfyTCuyc3SvvB/JIUwS86S
	iPcpkQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdt5w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:59:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae6961bff0so149317685ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772809166; x=1773413966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjEZs01B4NI8XD+SfdF4XpRw3Cnculfs18u066w5K7U=;
        b=ag4FfImcmzMjIzi5IhkIu3KPSVRJ8EEcZdAeoCVT4IwBrJDd2FQ+s1FsdqcqOtbZ45
         sCGPLyBQ1Zi5Vl2WOb8ZNPFZk3D8IgkxrD/vqtvEL7qLZ7bzJzgC0qYeXGKl+MRa4geQ
         haf12CfkjNIKS21wIzVzPsnJVIqQ1kGVBD1wfyivBTlPu+g/y34eN2wqG1qTX1UpUXP0
         MAxhE+xw5mYmR7jQlLsvnM6/eRrJMUuE35durQxxKYlmkazOqCoHeUtnMCgbVRvCbh3w
         9zjHeUa1lnemSRTRXX9vV01vOtD40lyuyUK5g5MYinGIsnPoxO64VEAo0YfbSD/87oYK
         v9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809166; x=1773413966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjEZs01B4NI8XD+SfdF4XpRw3Cnculfs18u066w5K7U=;
        b=ckvemQcoCocN06cfKWlNdPz4qzg+oJiXqxsiV8ju2RjT62jTQZfMHa7mw2NDAqQ+yP
         +c6YjUTjfIIZAL9R8iTu/rEuBLL8lO65dyJXIwfoInrmz/vJ4LsxAs2h/iKRgZ3h7ZjV
         BCggDuycxkqewGzvdztWQntBb3U6wuzvaWrH8RYMmH7kCNaVWqcmqsOOTW3NP213gP/a
         sOv0qGiFxOSZV3hjgbWcKospux4jjtDp25PdRwdyeX1RnPqz3fSXrM4ij4WLad86TLuy
         rmKFl7uv1+902wVUO03B31Jy8wONufUxfX5PkoPkxH9WZPyabnOSUYK9FYaguhawPF84
         s+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWm3en+WUxmO0zzFL83YmyMMGzo5R/D1Z+5jFPh+/zTxrMUyvoWGK3CsNNnK6kj20RmYM2PeDISOzbRdeMO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ipM+6peDqbTDKnI0VHug5Ud3zKWIA29J5vN+e7K2RqCaU1yH
	65C6v3vUQUfAJhBN9jc7hFwoUax3S/Agd8w6loOjOtgWdCfXH969iQuxjtpBv+QRxLhzZ7GSrIR
	X8dCYq6/6CVPJmFR1+aBGOxnFFmlsDTvW339PR8n10bNTL4S38CbZjPMIGaTyHkV7iL2A
X-Gm-Gg: ATEYQzxMsk8S+uxIcQTqOzhwqTghydJ+7hwdmJfrteMrV1nsCreDeH4QZQne1jWf6DJ
	MjbCSH1GG2+9PA1TRGo4TSXt2G83+dKjQlhwFC9SFQeBz0wFqECUrdI84hUgObZNCYiOqp9j6Rp
	1ZnXOmq9XlXpW7TY+AQZUNqOyZttxBx/faFDinNNPQSxn7QQ5ALqWtcAAeDIW5Of4u3J1+ITvnt
	IC+svwwVGeyC3/ZsHANTE9LjTyvhwQopL858im9LQnJNaMavhRuzZQYMGNuDEPd/9RZBDksOJuq
	ncCX4jwm/icuqDLgLTVK8VZzHQxl1lxbj7iG4+oeMrhu5OLTICriSyIuaVS89dlCsdqiFnq4+uQ
	AsZjpkf8Zg675tBoTsqv6f4oMxcO67FgUX+VBLNlnnplrM3A3ZDscv4wQ6WfJ5sDWqwhr79/1ty
	15NgVhs0mW8N0=
X-Received: by 2002:a17:903:f86:b0:2ae:4029:2196 with SMTP id d9443c01a7336-2ae82481fa6mr24068625ad.47.1772809166558;
        Fri, 06 Mar 2026 06:59:26 -0800 (PST)
X-Received: by 2002:a17:903:f86:b0:2ae:4029:2196 with SMTP id d9443c01a7336-2ae82481fa6mr24068195ad.47.1772809166059;
        Fri, 06 Mar 2026 06:59:26 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9b9c6sm27652635ad.29.2026.03.06.06.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:59:25 -0800 (PST)
Message-ID: <706678c5-254f-4856-869e-2e54761a1686@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:29:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-4-dbbd2d258bd6@oss.qualcomm.com>
 <47049136-db4a-4ffd-8cbe-9d1362b783ad@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <47049136-db4a-4ffd-8cbe-9d1362b783ad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a5JGrhIVgrPtg1gMf1NbF95u1qZDhAwa
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aaebcf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ev7iudrIffBU41L7XcUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NCBTYWx0ZWRfX0w/ZDWbqtmkf
 qri0rCnT5FWuEpz/AyQ14FTay55HlhdHp979KS3/lqCPxkACFsJGpDdsOOMLOL7l70LFtkbF3YL
 OaMrWaC0Frn0u6av1xBf8cMBs+P0SNzSe5hSfIRyIVppXXbrEXcUIbo92lwnnY/dAaSn0pP8NVj
 6t+3/mBA1ZoibYjMnScfuOIQi/vLKfSjXOK8Sbw0GbJRGkPyDeyYfHPp/zsYKYJDJQQR8h2k/XS
 onKJS1ccN7RG5mn+hABUPxa9h64DvpYCBb28edMAF8vC81zE+eFtBba4b8gH8qOh2i6lneOx2M2
 hJQRg+PIrUV2u6kms2BBdP6ZcCxufaGU0Ww2brZfBRqBqHKW0geHxc9c46J0WkdKBZt6Trm8C3y
 zOGImi0Adr6Z/x0Oplwo03+EJn5Shmrqay/IkJwRQEBIIISh6e3MNvzboKHo8DoBek4hQtLkjCt
 wk16zLz09/NFtZNzFaQ==
X-Proofpoint-GUID: a5JGrhIVgrPtg1gMf1NbF95u1qZDhAwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060144
X-Rspamd-Queue-Id: ED5C32234C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-95852-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 5:28 PM, Krzysztof Kozlowski wrote:
> On 04/03/2026 18:40, Jagadeesh Kona wrote:
>> Add support for camera QDSS debug clocks on X1E80100 platform which
>> are required to be voted for camera icp and cpas usecases.
>>
>> Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
> 
> NAK, not a fix or describe user-observable bug.
> 

There isn't any user observable bug. Since these clocks are not added
in initial camcc change, there is a comment on v1 to add fixes tag, so I
added it. I will drop fixes tag in the next series.

Thanks,
Jagadeesh

