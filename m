Return-Path: <linux-arm-msm+bounces-93169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ9iLaNmlGkpDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:01:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD9E14C445
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3271A3013DE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4A13563F0;
	Tue, 17 Feb 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYrVuSbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnwovr/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A108B33858F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333238; cv=none; b=b0UbUSEOV9Ko9TpS/R4X3hFiNKC3omzxFSqoVoq7cxTQSUwtlbo0yl+6rScaa26qZ5LGfvx9HAPgFH3aYBD8ecp0F36pRh1zz6XuIF+MSq9l1UHrZD8Cwoc/Q1W8FOaPg6908n4NcwpVBNxIwMsiWiECZgdY5hgKYmR9LgGk8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333238; c=relaxed/simple;
	bh=38zneP+037Vy7Mbk+7KlLjFuG+3hjob8r72QOd9MDa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SXbsecx7ByuU3g3nLhCLFDsSg8Q3sxHhutkiK0969Yr8Z9MdPehzY6LONq06kciwR0xGYp4Vzuebin5G2/SEy2QA2QC7X5zGTAmJzRj6Rh5/hNwTppLKagfh8mP0I/+tCsHyctsd4cGRb0kfT/g0pnrs7OWYvGsCWuEJ36gVxxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYrVuSbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnwovr/O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9CsqF985203
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=; b=lYrVuSbrApOLwhCz
	UhDNBwK4CmZi3q98P0SI/cQJyJ9Nh+Q4c3gd8E6ujSRIYDqS1uuyt2d5nV1L2pXu
	mm5UG9uDq6ELDFB8CXb9Jej4KbmPemT+/dG+qL3JdheAAVYjX33VUae1mSP4nvKg
	5S9HobjJ5liRuUHVuqFy/GG2nM7yQBZUOMuvQfzDP0p6yvFQvTxEg7bFTHl7XOS/
	4ufJ6+iBRW5/aMwyhhQ62CzwpE3Zxh1Ix/bKxwyBJkVoV/hBOQfyq+FDy79Fpkhq
	DkXy8nGlQBChooCoIDXqvxCWm5SPPRuzesMib8cK22EqB0vgpUcKSAdt/IIrkKn4
	IyjPng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap2a28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f5c90f07so43198436d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333236; x=1771938036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=;
        b=jnwovr/Ose8SQuLnD3yL6jQahDSyEp8Jx0bf9ag+dqQ2RGrLBBdA9ewt3PtV4KavQ6
         8CieAanw51dCJjXCKBLUfoQbwRyr+rkUz5HAX6D/eIw8exlXwqMqUMmS+WV5ClWtpvI+
         t5sLjzKWT2ZZ/8wFhr6rzCuwMm4VgOq+x04PZN3BZD+kTJXNyd2ziDkdFKJcbh8X1S85
         G+UeuM/z/8+CX+uWMTFMZPHA1d+Dg2tnYoZxOU0LOgQQ+R7Jc7T9xr8f0m5PQzxUYDo0
         zDoOCFVcjtdZcSSTtiiH6tYOS1GBd9EEU+LOpfoBsXGGeEULl6PdHy46YC9GhzNivh9B
         TIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333236; x=1771938036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=;
        b=NHydIsJovgdLQBegpDtP4A6A6ykm0Ic7rU38C18CoNsbTfFw2JPOLAuw5IMWLSjn4d
         Km64co9l0S0atC4A0M3ElIbja26Dpt/1nBsuoWcUbuA9pfZFOS7MtrhWq54tW6QIOAQN
         yUe5aLx3qCJVuxYXMjoB/UuJNhdt2guj3h73JoOPvn6ie8z9dreAVniWlxUs8fPTxQNz
         3o8j0Q5KhoF4/X9NZ7r/EPzeQYERYgOPp6CuNu94MWBSb3kp0ElODbwD7U2jKaDQ+G2Z
         zylAim5Q2EZ4CpXVVHPLzL3owsTIckdCo2gnV9HPLYV9iYtRYmU1OicnZCQEhF+CUBwJ
         QLkw==
X-Forwarded-Encrypted: i=1; AJvYcCXI+NeIJvaEEcHrLdkdf6i1lAEHyQd/q0ekzaUFaiFkGVYVT0mHHeB9ZNyIa1PWcP1AxtAWXnpSsXN0S7XD@vger.kernel.org
X-Gm-Message-State: AOJu0YznS//G2bwCmLnKIzL8FewH0CK5mQvPKb+y312dMMHgRQfrI0om
	r3sWJcsTlOfGhp7w8Mm7YCEf9l+OJvfgwLn75N0TUNbmq+i3zfcaMOLvPYN/Y78m3QMBwkyV+cl
	UFVG0jUdiU4rlE8bUCeS5Pm0wx9IIK6UzBljfLI+Wb3EJuI0mW6zabll7Pv2b7YclD1vA
X-Gm-Gg: AZuq6aJzfXfEhCkXmEqOSg12HmRB6+gQ4APO9qAVrF1DSiPqrZiGxtPKGgxprcN3r8o
	INCUv0u/9bl2FcZt/In2VhIq9e4zYx0Hw+ECmbIkfY8V8hjqn/YyTb14lg+qnTvL2qdLz+vZSKu
	eLpqA4cPoH/HxSKr5uMt/WVc+anUfZgD6PgSsKP8AQaZ0h2L9gw8lPM9tIOdeh3a/r35oO5GmFT
	XSZn2VRNulpeHvTFLeDGUx1fHJVjTDraPJgcK4Z4tc7B9Ms2bRa+PCc7cIKA5mnU7TZpxkhy/Cc
	jFYh9SDqZ/UxHQVH6wBpmPpKepj6kAOHbxPFaebVidJw5DnS3l3ZeV0MYxgLYMqyra0NS5h08I3
	2NI1QZqH6LCgyYO6lXQqJ1ktm6OqAULn7RvCyOz1eGx0yEibpabd1F9QZsnj+qhrMt1utNf4uVK
	fa0VE=
X-Received: by 2002:a05:6214:4f03:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-897347ce6f2mr139776136d6.5.1771333234616;
        Tue, 17 Feb 2026 05:00:34 -0800 (PST)
X-Received: by 2002:a05:6214:4f03:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-897347ce6f2mr139775526d6.5.1771333234128;
        Tue, 17 Feb 2026 05:00:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76b2580sm345885466b.64.2026.02.17.05.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:00:33 -0800 (PST)
Message-ID: <45683e0f-a49c-4da2-9be6-a79623fe12c5@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:00:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: interconnect: qcom,glymur-rpmh:
 De-acronymize SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217125819.281209-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217125819.281209-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX7/5+9ZaKo9dc
 up5tjRBW3P+Eyy7v9boYV4rPAhqLOL0IGDoxcnX0sd7Eh09zypr15AofPpAZgfoqEQrPD495Igu
 eeyCXfu8V3JtuvTnOBcAMpCqiq6qWzrBPK0jr6J0vidyBd3/s7AaT5Qb2ESm3SRB/QZfrdlCSR9
 WZNzhBqoS0iMnwf3auLcOd4cSIEKIXG3QOQcZWjrJ5rFrCQXA5p5UbVKLFho8t0ANkCaLKgH9Ym
 DQnhNOQb4Xx2PTM9I13tdrRr7IF9VCnb3zdOD30wpjAca2MQWfJxEZO1qgXm+vvuJP/CfntfdAI
 uyhQR2Uhy4HQKga6jCVv1hs9tZt9dj1a4XrjFYvxq9BS7uHmHTsCO6B4b6AXwN9eB+diYou+3yv
 xW7UHgjnCGT/4wtDrUwh55ciLGE6GhewEGNRVmGU+t1I+mT2GtQIbyveglJEnKD3IcqrZpiYPTL
 7iA1Ib5q59LcmlP+vGg==
X-Proofpoint-ORIG-GUID: NJoU-oYm6YsjyrpN8QChG14asR8qR0CA
X-Proofpoint-GUID: NJoU-oYm6YsjyrpN8QChG14asR8qR0CA
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69946675 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93169-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AD9E14C445
X-Rspamd-Action: no action

On 2/17/26 1:58 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

