Return-Path: <linux-arm-msm+bounces-104917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ItYuK1SD8GmPUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:52:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E0481E67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E51A230827C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8177D3D9030;
	Tue, 28 Apr 2026 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bb5E48/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9EVzJjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9923D8129
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367568; cv=none; b=sVul4PiRc1GDrRwJPOX6HTUSrr6ywCvDSvXgd/zY8zW2F5tvN6a1IKJqLYKiuM01ZHnnd60p5KxDvU/MRJ1WTtO7PDDNOd/SOAg+WE3Q95nROGqgv9ukn2RKYPR5wcEYX4L0gE35S+sdzyafdvpyCmXN0Gysijb8iX6hBAnKP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367568; c=relaxed/simple;
	bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIgOhuL//KqFCbzLzFxeXm0+XE9y0kk4OQws77dJa6rSgFZBH7MFYrsvuRiY96o/lJGIdP2kujYvD8yU33QFdZ3/s4pQV5RabvRkSoUA+FC1mLBnepIImdvW30xX6+QqrRE3piLGLJyi377HPQVWv2yO0E04zVcW9RJqPYgnrRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bb5E48/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9EVzJjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6M1Za1625044
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=; b=Bb5E48/WHkMcUQN5
	qTc3Y2bO0rNm4QpiICkyhIxbVSQZ7j87CTqWYfkkF3R6sehoF7awpWWV0dpH9v3Q
	JZYe/+Cl3SngRS20Qzim4iVJk+oyj2/9NJRgKXl2Z9aRZ7+kPjw5I/ZYEdZruxuE
	AmjeivTQxK89DsB00ofLhTOta1/BPjbXjx9n7+iki7em6ZV1teecxIaJ1Q6oYT3c
	/90b+TqoDUChueM7Ohao1+8nyv5ZO8n9crkSR4MRqeprSoviufuyGH69G596DCuk
	3OyXJA48gVW3zbsxnGDVOay/GDcK38kKJcK9mNJ0qRnaWwIDQ2OKNhMSa6FsyBLO
	5uLtLQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsa64r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:12:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so8573545b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367566; x=1777972366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
        b=V9EVzJjUemFEExHHNJ2VwarSNdhHC4xRGTG5NjfNPBCzxI9XsowbdtaQ2WIRnw3rUW
         J6aHoHg50ef4F9zLftA38t5Ux2aagPPx8dtEfQ/JLgln/BMP8qDFez8/0Hu2xkB0ioec
         ILqIeEOpPP5PTXzzxwm6TWC99OUYBA999d2oeKFFynNCGs6nlTdO1xxRtb9X8FGKmv0+
         aS6rwigY2ZklQqtF4yuhY0+uoMktroKNS3RYUfDM1uKSqFumFoNrDg/AnUlhTixgyYVy
         2JaO+/FkW5ehQJ8vQYq/+jK6iHht3eO5XUVLNOKI257CT4qdfBk5v+QZEL5if2SYO2bJ
         a1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367566; x=1777972366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
        b=fd6StFLfoHaCY0dqJyOvd9WMfDUVP0o40QSY8bJG1z0T9dv0gXny7BNv7VtuKUBY15
         Y7LLISOVn1grGKxeQnhIGJLnaP5A6T8n/41IceWqdmhqW79p7lDEQAvWMMqSgF2Vyttw
         /dHYe5tS18Oxap5fYBPYwgeDG9h/ADnz29U9uyNWXeKh0Rd1IqVDmLWNEHEZiQ31DEje
         8hshl+/4D2rOvlM3lq2T/B36vJNMmhJz/SF0v73XcqiLe98QTF/JxvDmJXn4RDGXjdjC
         soyds3FHBjVqPu90vsVUhDblXmMhMYzl2TNP247pVpWPfWsDOi4Kx3X1R/VEhvUROAiM
         xi5g==
X-Forwarded-Encrypted: i=1; AFNElJ8oZ2FtJbysbXp0ZIU3OHBS6lBnT9/FF2hTeV7qFmWMDvmnl+eTiZ6ahav8RTl3s1zPQ56c/SNc1GZnTLJc@vger.kernel.org
X-Gm-Message-State: AOJu0YyA4a36pzdTI2X5RkXCHY1xg282K000x6bQv4XDYJpHegdK+12k
	gzDEXX5BcgeKhbXxztrhXKr14Vv/jKaQsC8OUi2kgdLQ8uzNGU+jHTlR+y9UJcXJ7jOEIGFovbA
	+JMoaG6ncL68wDuBkP+5Alo5Kdu0IwNBYjUY0aXQMyYQN0ssDu/Qg6klNY7tI6wY1wtvB
X-Gm-Gg: AeBDievZzW4KqYZG0BpaDsHKdzTRrmQKRFvvquhUJA9ZZjkQhfMVOKqdqZRZulD88OX
	OaldyVX6/vcV+pELeIrZbKEhj/V9JUx9Vjo9QqnmOJY7WpAQlqBtEdaZWEfFeYzksnqwf4uKel8
	+6/WuTfnysrGsS1sTDgnuut0K5UzRixRrzlepVLlObaZR4Ks8EASF5Srq0VjZruSkA5P+gN6K62
	GXn00MR7hq6JqaG7kCy1iw+jznb8yanOB6NrsGkDHacSfU+obRVFYIZ/8gElBLq2w/VnN63eV8v
	30EYLRd2tUnkcc/uP+CNDXAk4n7UXtDJVyrVLKH/G2/UPRfZrDDe7hPUiiH1fhHCdrMxuB8c/HN
	mmPQVow4s0JBDfB8cRC1IBbWKk0UdjH7nrXaa7b02rTNQQfpw3kqW4zRobOIAZfSA
X-Received: by 2002:a05:6a00:4b50:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-834dd246ac1mr2019038b3a.3.1777367565613;
        Tue, 28 Apr 2026 02:12:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b50:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-834dd246ac1mr2018998b3a.3.1777367565123;
        Tue, 28 Apr 2026 02:12:45 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00e40sm2480834b3a.12.2026.04.28.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:12:44 -0700 (PDT)
Message-ID: <6ebe28dc-b8a3-db92-0e66-3f0541e23e13@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:42:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/12] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
 <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
 <20260428-nifty-quaint-hoatzin-6de65d@quoll>
 <97aa5f18-d1d5-f082-9075-a385255f2e97@oss.qualcomm.com>
 <7d775357-c7b1-4cf5-af90-012d1364e773@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <7d775357-c7b1-4cf5-af90-012d1364e773@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TREkTrtPVQ34FzTg2rc6LeGQvMwxI_KM
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f07a0e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=H8TGg1LnFfWU2mlYB9oA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MSBTYWx0ZWRfXztlmkLoXx6mA
 5jmL0ZDdUQ1apZM0LTqXhmNsSFB27eX1k1tRJM7+J4PkMaCm/h9skpGd26x++TtH5d3hOsWfSls
 y34LP4M0ByZd6zhj2T4bBCC0uBE03KEIMorMqnlKZnj8uUFQkmBOETF9lZ37AWsQigjfbzjACSl
 iiIkSXMxDzx/WL9GtRglqCe3+4pb9Cq31lsU+TKedHF5PG0wBHjA4Q9e/f5CepeTqCQgynBamUd
 XVPnjR7cy0khqU9sJsowauQjEASKmWexibk8ycHVwlQvQ7JMJpMp7ekRxuVyemEFOkwnTPP4Dbe
 hcjI01CXSnEh6hHw2Q92WtZ0dUyy4j/uY58ZQU4nv/Z0tOMAwicHbqmiWW6pVqpbj1EEO37yBXu
 2Kb5oVgmKwkDK4lDmaSbNJm5gTxm4maOIgmE/pgjBeRS1vdHRfizSF5DcBPMoHZxMaQ9TKDrIQX
 rdGPx9lWdR0Q4mFux+Q==
X-Proofpoint-ORIG-GUID: TREkTrtPVQ34FzTg2rc6LeGQvMwxI_KM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280081
X-Rspamd-Queue-Id: A34E0481E67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-104917-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 1:58 PM, Krzysztof Kozlowski wrote:
> On 28/04/2026 10:08, Vishnu Reddy wrote:
>> On 4/28/2026 11:44 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Apr 28, 2026 at 09:24:08AM +0530, Vishnu Reddy wrote:
>>>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>>>> is a new generation of video IP that introduces a dual-core architecture.
>>>> The second core brings its own power domain, clocks, and reset lines,
>>>> requiring additional power domains and clocks in the power sequence.
>>>>
>>>> To accommodate glymur clock and power resources requirement, the maxItems
>>>> constraints in qcom,venus-common.yaml are relaxed. This allows the glymur
>>> This is a very confusing part of commit msg. You cannot relax the
>>> constraints. Each device MUST have a specific, fixed constraint. It is
>>> your task to be sure they are not relaxed.
>>>
>>>
>>>> binding to inherit from the common venus schema without duplicating shared
>>>> properties.
>>> That's obvious. Why would new iris device schema not use common venus
>>> schema? What is different here then that such possibility exists?
>> Glymur platform has a dual-core video codec architecture (vcodec0 + vcodec1),
>> requiring 9 clocks and 5 power domains. The stricter maxItems from the
>> qcom,venus-common.yaml takes precedence, making it impossible to accommodate
>> glymur requirements without updating the common schema.
> But so does every other device, no? So what is different here?

The difference is in the resource count relative to what qcom,venus-common.yaml
permits. Existing platforms like SM8750 have 6 clocks and 4 power domains,
which fall within the maxItems limits defined in the common schema (clocks: 7,
power domains: 4). So for those platforms, referencing qcom,venus-common.yaml
via allOf works fine, their resource counts are within range.

Glymur dual core architecture (vcodec0 + vcodec1) requires 9 clocks and 5 power
domains, both of which exceed the common schema maxItems. Even if
qcom,glymur-iris.yaml explicitly defines maxItems: 9 for clocks and maxItems: 5
for power domains, the stricter limit from qcom,venus-common.yaml takes the
precedence, causing schema validation to fail.

Glymur is the first platform where the common schema limits become a hard
blocker, unlike all prior platforms that happened to stay within those limits.

>
> Best regards,
> Krzysztof

