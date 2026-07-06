Return-Path: <linux-arm-msm+bounces-116754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vkoWCCClS2q8XgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:52:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC71B710CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:52:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mqXVDrH8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WCmA8Gmq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116754-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116754-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5223B3604C20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D493A48F6;
	Mon,  6 Jul 2026 10:59:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D8E3033D8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:59:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335551; cv=none; b=qzaU6eV9/0ICNC+IXw9JGRAL+FsAu6BOzJV1L2aBPZutHSXaEPXLHx2ner3slmqWarAkITEOoUO4DuOKNEOYudEoKB6Qy5EX33Cc3Wm2P6DaWC7eBHD2tWzzRk3M+2jdiL3ahmy3Z7NsID8ReqNQa16+rHe4ovxJSk6FpbsQgbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335551; c=relaxed/simple;
	bh=qGk4JEA9zX7+IqCMcPoW2yFwuDrGak92O0jlzYQye4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OP6tmhoGO/T070wfne/kM2zMfLeY1bNiB3301zGJ6AHAjZCM1b6TFbRl1aD6KB59/5weioHE2s4+dJPVST3Uer6P+g0M41Ous9Ri+TCfUnYAGSU5ADALyY3eS0pgcjBA1UC8h9l5M670tgeD27AdgljgWBzQN3qTEdCNICQiZ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqXVDrH8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCmA8Gmq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669p10v249653
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clGJ1VVkCtcn8+Xr390x8/3JkGKe7Y66Pv3Op1UX5Co=; b=mqXVDrH8BbFkOQHz
	e6ZHFHcaIK5a1xu0dtuRQUgGS6eY+UMBVMTKymmIWLRj0vlK6Ub1wD2q2Ya/oIsg
	HAh2/F6oQEpbcsT7O1cXHKqB3lMzko3AqRMnNytnpyBquxP9kwjlqkQYWwri0Esm
	SxQBzQkNigQWPeBPl2lZM4z8FN1OGlBBG91d/UM0jhvkdWrEaAogdUmd6qqqhmPO
	k/Jqdp58P995bdYIiGagdqWRxaenLb8QelPpUnw1z25nJi47S1I1h14NL7gtf0Gi
	RIkzDsNdDMiAX6qMsqBIqtKSztAl7R3XgzIOU+odjW8rzoX85Qry9TQvLT6O9G1e
	XKtM6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr7xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:59:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e59d97df1so12548985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783335548; x=1783940348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clGJ1VVkCtcn8+Xr390x8/3JkGKe7Y66Pv3Op1UX5Co=;
        b=WCmA8GmqhsIEcWdSXWVhPv7uh851gbgU6pzBUJ8S+tgVbY5+HWxKmtx4lHYzrS8HC1
         jF/FKiXfhpsZgh/k2X3xmhn5Nvs0yB5T2W5BA002yoCvQti97AyxmBndk5rhTSBM8aV+
         9gVIMw/TGVgv8jzPqZ1sgtScTvQg2fSLfQw6zv+NJoyPlNTrE8WP72pA3uPXeW2WsVBk
         LdJC/uAsReUmph6nSXimLK5z6Ly7TUYJfC6rzKpFthIAK0t+/UBU6qzgyM5jjE+mi8Hj
         SKiXmnr1/t9L+YVbLSZCTxiAyCJJ4LEaK3qI+eyy32HV+isqCz5N44JFHHqkZpzqnvVT
         rMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783335548; x=1783940348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clGJ1VVkCtcn8+Xr390x8/3JkGKe7Y66Pv3Op1UX5Co=;
        b=npc4U/iwgHWqNLrnONecCKzRFssbOhP1USxgnll6l01O9dse5Rcps95Ym3IS0KDjjM
         LkodBfbFXzmIZZU0tl/SM8uQdsl1ntc+Q0Psv5742HfVDI1qR+jLQ1V2RDQO50SDDRXS
         gbAMowhC/3PAji7fz0VwjkDNVgMl9uJSoL4YNzHIBwSckhzx/NkbWun4toOsoPcQQa1N
         55dLKuc4nlXS6frPJzZgQcu5+z9FTDmP9K0aKauFVJGIam0ywrAKXZ+J3Uo5I4neVG0L
         hnDgceq0UIWGIst6Wt23c5hXQsgY1kNF/99FEAg0MuL7Jevzkdr5X509zL3gMQPSmBzH
         ZOTw==
X-Gm-Message-State: AOJu0YzemwA6qjGws2sxe+Rj256805psixIy0xXo74a/FpzMN6QLz9HM
	LvAhioJdtvQVEjwRj6WLnUblr3em8QMnl4cZDf4r+4EwvH8ITpezEhqHPOD10sDiztVUjEBFVp7
	6fhnHgxUWnEAeYNH+m14GMtbB6TIxXumTx1EGhXe81lLJrfM84F149DpHGk4bzglX1UfU
X-Gm-Gg: AfdE7ckO+ZkYqzsKSwtknaNWi89MPgOUPV43o+KS7dr3DzEeO573tGxqK9Q6VdNfdg7
	EDx5M3UZx3m2gh+cPpJ70ka9MPUwCjaTURMCoX8HxWhw+WeNyeVe71QiOI98bBmxxLCpp8Pvqs1
	vdxv8Jrtrn+rB8lIRM3cp2uLQi0ByLrP5iaupGl3kEkgVmOXRPcsT1n3U0CyCaFpx8/WpnJJkK2
	/Lt2Stfo4d1QH/XTOESKeixUca63yheW8CvfPU295Is+7Zj0vzXgR7za+n3rHODruVdkkBjpdOy
	/vXFJ35Xc0mfyW3se+TJupWKSaSuBpMMHTRs5TpPWgnvUhMPqqTmjI/GuMfQusrhlbnmkyapaTi
	GX7SHx3AidNp1tEPFBAAgJoLTIFamf08Uk64=
X-Received: by 2002:a05:620a:1a18:b0:92e:5023:78b with SMTP id af79cd13be357-92e9a076fd0mr808862785a.5.1783335548139;
        Mon, 06 Jul 2026 03:59:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:92e:5023:78b with SMTP id af79cd13be357-92e9a076fd0mr808861185a.5.1783335547766;
        Mon, 06 Jul 2026 03:59:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1d4sm707084666b.39.2026.07.06.03.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:59:06 -0700 (PDT)
Message-ID: <8d025adf-e943-4e99-befd-40f833d8045a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:59:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: Use tab for indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v2-2-90c781ae0417@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-2-90c781ae0417@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wYf40RKMpfwEEqH50GtFK4rerXsK0T7i
X-Proofpoint-ORIG-GUID: wYf40RKMpfwEEqH50GtFK4rerXsK0T7i
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b8a7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AZJ-QSGf8ivbqnDstL0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMSBTYWx0ZWRfXyiWTxHM9JVbD
 Ai/362iFL0zS+ZB/nALZL8TSqBmfuyjhhvoxdn9ovWPozp2S3HM6m5nRB2HbDzdhJyBsMT1vNTn
 eb3extn/TEDMtjSLg28sY8Vm+45Xm37iayOWIkYzAhFgkdUtOMmsOng99D4pMXy+C+ShSryQXuU
 kQsFKett7tgX7Eb7GKFzbdOcULC5UabNiT8qtB9HhwT2b6KGVgQth0jGzfJ6Oj38fmuyg8+PCnU
 r07ZVKWexhI3syCC4Z+q1vzRDtbg8uQCF4pfisN5lPHjagDX6VENwXawVjqh2n6lWfQSnYGNKHU
 CAtTAyWpKKy+D++ZcYLN/01p0eMYUa812jZSzaY+L6xuvzABNB07LpKkptP2iMo6NDXKzclGFCM
 ZjVfQWtXziNmy9XzI7+VmUQvftGdSbe71sE4LBToztlaWPf0OeWbEfbuM5OCDt2BCmgeKA7CD7v
 CsBMQS288ikKP+JqhiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMSBTYWx0ZWRfX2NNCMUmc7f/N
 fDCz5/TlR10VyFVJVMyTuSrDgKUYHElMTA+3HBMgaEN25C8IEBRScEIwKieubD48N3QDRepyO+o
 tCbzmqqyLefB+i6EBieJLwbLSo0/UtU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116754-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC71B710CD1

On 7/6/26 11:39 AM, Krzysztof Kozlowski wrote:
> Correct mix of tabs+spaces into proper tab indented lines.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

