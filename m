Return-Path: <linux-arm-msm+bounces-96616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O+lIV0BsGm0eQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:32:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B73624AF38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4644303E375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE22F38A728;
	Tue, 10 Mar 2026 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="De5oVRMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2jrtKhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3B73876DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142000; cv=none; b=Sno27eL95qbHDqKyVBrvtOU97iGCgw+Yp1t3/PxinVBClAB8X9CN/Uoly8fTlBO2+aAi2+BUR2m/n1mLiJv1k1teo4YCu/MBD45ZIDh220AtZ7U9QgiLKZsKvqlAv2sqNAqJ/R1DQxK42en5UcRoZ+IYj5DVHf8+bsvjllbPnms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142000; c=relaxed/simple;
	bh=u4cpgBsAOPuxLzwpHwDVepez9bn5DsSAub4OHQKackg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D5yfs37ErTEY2weXZ8JEOQQDEYk9HW+IvmXVe509S/VZmuv9uXxnQmyPIDjBJecoqDQGa3L+1H4A80Q6BLYrbVU67OZex4wyAOs5BAl6luIfR0t4ZiWEHKK5myiAmq6lXpF5GOLuX/xXYHaLxmVe72yEetByoHFWdXpZoxIUzJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=De5oVRMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2jrtKhC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ABQ2mi2021638
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilmEub04l/yoNaj3hejIpgA2R8zZZzja5wJSgrJl5VM=; b=De5oVRMZCvuNi5fA
	CcrA57pX7Zv2KvwQT1Kc+x2haO0+Y5ufHPePobOdeUbirYLvJEzez9z4Cr6blAbr
	9hboCMNd0jxyDkfgqyQJi0QOjL3u9ZhgC0ooaMIorcExKzK2RLGc7Dwr4W/uBhu6
	dYT0T7+wY0M+oOcrlhx1gXFq/71GXR4NbBQ1yo2O9PnUTh9hOYbtz33sQdmDvG6N
	0L5XVEpoP7h9CWd02VOFSvznUrPr9gbNqWUHI2Mv4FCptxmdi9oocjQKVzp4QEid
	4kyG40sLgRrIxQjHLTK0ZsZdHUMAmspT3GqXtLGq7sDus3qc9rNw3z9XMAaIXc8J
	NS+xUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w93ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:26:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd90210336so65874985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141997; x=1773746797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilmEub04l/yoNaj3hejIpgA2R8zZZzja5wJSgrJl5VM=;
        b=M2jrtKhCVczIWNpJemoufDRlDuSNocs9ML+p8Cwq3PYaJjTNPKnJ7JjU1i5xtqb9xc
         tVks+crE2zwlW/jrw62au8UdWdE5o5WQhrvl/Z0Uf00EiKIhjzHgd+yaywbm5tVH9I8S
         6qD12wgD18xRlpeEKUKMU7+wJ1tkD6RHIICYn77yqfwk5POxpVLGyKgTTQ7GO5ThElyV
         upSsiKVXLhiUm7jjxSHNH9ZkzumM/lSkvcU3sv9wjAw5rhNN846l/SZpTnhWWfbrkbLc
         aG5wu5UoBc3QWbPN5nct4u58ZT6JiJuxNtv8qnlC5sxckZmrWqjCu18ATxK6OFanPJy5
         8Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141997; x=1773746797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilmEub04l/yoNaj3hejIpgA2R8zZZzja5wJSgrJl5VM=;
        b=Ktgsz7udU/Tlzo+/dNhcFhsoEbP7Mj7AdWLVhVcf4XHKPFtkihHfWGOlhSU8o0ZlyQ
         7Xm/r+hx0vB/dgbnA1MHQPGsOMfP23kL+aUvPHgSuH0PQWSGP0EwarkyfwhD9Q/ENMTf
         2SwosAIft7kgfbol1gIEGW0Xeq9pQhvXS5rebnQigCwNGGzQZDyxklgwIqbQGhUtcz3s
         /AHgmqo8Ljc+Wsz1WNWIfjxV+ASp/tZYS/BPUMI1kWM8RJVgJ5cRMwCK11niafgB2b0d
         PCRIPTrlc8yOxQiQG9LCbTudxwUBB2mRU4Axo9jngOrRW5cGPhwjxgKSFH6By/DJQ9xR
         oAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlj85Qk40YZUJzZJhrUieJsNj9FWPvQq9oVJCEgqyhIljPmp5HQBvG3AXJ8eJLN0DYACyI6AoqyGXdrgrd@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxHqTZrWIYJ5Guf0oG+NAxzkjrDdYDkwSEO7ZRe5nVBQE2L6t
	KJCAqbk2+coYuw4f0GNQGSeAD3SSQHA8kb6ZJxaDlZmjxhZUa8qx9trhuNERiEgM7AYJVkX3gkM
	P8uxAEeWcin1Pf+rp6Uyko7GaOsY5dTiOW2GrDopx1TLJvPsXPi5isPLj/41fE1ojQkKy
X-Gm-Gg: ATEYQzzFppF7YyYKp77QbLfWbLB4We2XLVAB/4J9GocOooV4UMRuMpD47JL+P1xn0e+
	D7mYCeaX098klUIHD+LGQ6JpdkCwUve+d9QRT2EyUfY3BqO5jJp/JFWwXoYCoZY7vSIlkFDdJ77
	H3nlJbfsoahCHCIZDncK41Fv5+np5Pe61lvleD2RlY3PhhJZvTKLJsrUiR4C8DcuX90EA3/wWls
	kUuHdIgGEM1zQFDDtQFmtDzLLOQpE3yXdZ7u1EJhsmysVzsJ/M3pjODtPlnnCYv8KSxCow629Yv
	a69Lj3/UOubvHSM+k7QjX1PUxEkyCLUYt3mWNQk9Jz8qk5h/aq+Qpgx9yiqZbFdtx369f49m5DX
	0Z1ldiGBHagWoRH6XKCo7Qtk4WwxUBmyp7Yz8EkaSnUWjlNtoDg3b5opLSFDcJ2TvvtLx9y2OQF
	Yisjo=
X-Received: by 2002:a05:620a:1a28:b0:8cd:9446:cec4 with SMTP id af79cd13be357-8cd9446dc04mr240534885a.9.1773141996904;
        Tue, 10 Mar 2026 04:26:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:8cd:9446:cec4 with SMTP id af79cd13be357-8cd9446dc04mr240532685a.9.1773141996465;
        Tue, 10 Mar 2026 04:26:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b970e8ac4f1sm101640166b.29.2026.03.10.04.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:26:34 -0700 (PDT)
Message-ID: <995a76be-939f-4bc7-be42-80c51de6087d@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi
 gpios
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260310012446.32226-1-mailingradian@gmail.com>
 <20260310012446.32226-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310012446.32226-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX8ypWuOjjJKKn
 yTlIDJyZf7Dhd66GAwQsLYZehFCeAbsjH/SXHcTu/4SkvTJOvuOXX0r+L2KJ6YjFwVYCwfPWU45
 YseQN5eY2n1f+oWH0CCrC8NnOMo/D3hD89xaYp1fBDVh7GWVxgTkk5xtNezD9cLJiPI9mfNvmgu
 vgSsMozumnsatniwgt11qTB8+ZJytWroPUsZQi2d8tA0Mk+WOJznHJGHWWuOlB3tWH68uIIYEdj
 zmzGoddqtPPm3tXJ247pkijri7jfOnHPMLpuy7kGo+44gLwNJhMxJP2ZJcWfsoi9NXUKWqMwZ0m
 Xfx0nL3etJn/5MBUed9mepkrEqBkDgcw2zfph9FAupD2dgrWF4F/WmPBonFK4vHNhjnwtq4TdWm
 x3z1FYz2S6W0vlHYxnh0js/6EZwvpoVQNJwe88zezTXO/vqhV+TqFwgd7H7PM4yefv4MbWQC5BS
 lrr0W1QVbieABGO6MtA==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afffed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=lZi8hNnBo1xzNWG_37UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ABftGoJ9mQerF24-jWIBISnKGnaJv65a
X-Proofpoint-GUID: ABftGoJ9mQerF24-jWIBISnKGnaJv65a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-Rspamd-Queue-Id: 4B73624AF38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96616-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 2:24 AM, Richard Acayan wrote:
> Some of the GPIOs are reserved for sensors since the ADSP also handles
> sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

