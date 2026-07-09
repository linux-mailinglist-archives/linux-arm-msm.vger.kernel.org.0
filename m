Return-Path: <linux-arm-msm+bounces-117959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +6lNFsyNT2pCjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:02:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFBD730C5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:02:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EE+m97Gc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GV3E8pSQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117959-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117959-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A4AA3027279
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744B03F54DF;
	Thu,  9 Jul 2026 12:00:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3CC40C5A0
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:00:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598419; cv=none; b=qVUgj7jTxiOb2evLIvuezEMteKeQVzpfhIchqgenmF1fUUZ3ODjIKnxpx2A0VxYBgpQi3OaLQmqCXbCKfxru6VcD8eyOd+nAFuEu+SzCJIlezEc39xaUBPQrmYGTc350OR42oyuGWw+HAypLizZvakQ3/d8K8wdy9/Z8i0kiHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598419; c=relaxed/simple;
	bh=Fqy9N5XcnM5H+GhfkYovZ70jYQ2D5WnWKy7vsBFwWx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeWUqwJRg1Q37N3CxJTbEbDlsNtWlXSHLkpm0kuMmzqqUgrwcWh2pBSH+NDVCMCheFMCEnksIs70fSrxxkv4xeuh9/7QeDLoJpl6dU6fyK/HkoH87Odz7Oc0d2vqTmfNHuelnHkwc08gWV+NdOjOlGcOOq8jfklhkq1RrMHNJr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EE+m97Gc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV3E8pSQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN4BW1450391
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIfOtZbZMrMEoS2OviVK9Y4/CgDoqO5R7WiKMYF1faE=; b=EE+m97GccjqkrB7p
	GhDSgb/jK0FjMLAMWVpctqFk35ljik7U/l0KauDjVNxczmKjMR+xiK2/YJRltCgJ
	1xX6wN5oV9whD9Zb6g0rC34mH7uOo9ij7hlZG84M9H4cH/+5xaTcUafLmKMXZ+23
	m+FXKpBLHNzrp6JRAI0nX41JEJlYzJsu5Q7UcpnHRYXILDqjJwhfstpN+JSX3IhH
	XYpAW8IriATc3HiRc/x2ohynbiueti+E4PCvMGZC3GvJlJeWGKrqbo/RUJ7h8f2/
	KaF0TTc5Y1Njw2Ckkli0xQ0EgcII28T/iXwNf2UFqgBjOJisovBhVcnsxRGkPe2L
	+DOVEA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhrnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:00:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so3874011cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598414; x=1784203214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIfOtZbZMrMEoS2OviVK9Y4/CgDoqO5R7WiKMYF1faE=;
        b=GV3E8pSQhHPR7zhO2QrY+q9cRVevt0L52YS53r4hqfnnwIdx2Lgh3W9l4Y419/2TkI
         G3zflpJVIMW8aWRhUQKJoZNrcWlm8M/EJpxkgZxyGQ4jsef4pYTbbWwqy1k4XnAcZKZI
         2yTdj5W9RIIopJYqVDSOLekksgnX85aKJ5JInPht0KdrdYEKd0ZIDDpGgR40dNeLjygM
         Cfk2E7GXIubBYjZSoTVQSpeToVDnT20lMA2Hf9yQ7GOfly20342SpkRK/Mbp6lA4XRu+
         zB2P5yELGb7q9IpiBeRGOIaW+iEvHSBsYwDDhFq3Tdxqx8UoBsIzE1G2bMCq97ZlLsMu
         5cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598414; x=1784203214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIfOtZbZMrMEoS2OviVK9Y4/CgDoqO5R7WiKMYF1faE=;
        b=pMx8APTOYb4KvceOKkaFGIuUwRK8ligyXTA6CPb/wP1t+xsvIDdRd0J5kvt2lIP/8Q
         yGSc97gRGz5C6bcUAVNMPi+gJ+UDqRMu95HLCUw75EQAWONOt+MAyKwWMqpl/d7Dez8O
         8gIRPT8oy8f4+gIiS1qLtobvuIVz0XXg8xcytoNkbL164R6ojtmLG+arFsvR3a5eeVOb
         49WuRzfvv18NC6yrtPEchF76JxWLHuW1KriRQFwpMdzY+wCMJ0pIudy6bfqi224qt31C
         oufn7QdqE0d/PneMIpXpPr31jGBtOh7MW9O9ilXgDSdkBtHQEx6RSM0ZDaPHcnHm+YPY
         TiAg==
X-Forwarded-Encrypted: i=1; AHgh+RoY/A8C/K1q9o2fQI0yY2YfyGmSPwQuzsXEaCmemWa7ggD7XYAIuDLZAJMv7ypZfJJkEals5r1g9GMpA54D@vger.kernel.org
X-Gm-Message-State: AOJu0Yz172d2tLbf45f0QJ5hsiWaLrq1nlzMsX1l1z3bTkxd+I9+OFhE
	4k1FQKfHOOLMvc8nvoiYp55F4sY0TIlPNahyUjSCZAs09seC2QczWmOzgr25VG0HIiy83OWUo7P
	qz3mlg9J7CKbvbYvCExRVrVYbarNRLj3VrbKCBXmMdYQQcF7sCaDZ7GsPj9Zz1b/mxF09
X-Gm-Gg: AfdE7cnUP8f0kjC0RjFl7aVFAnQ9NzvojkwzsVa/kefT7AMx8PH7ou15hb5JEbtAy9J
	R4v9LpotJZV8HbMH8N/TKvJcA6YaUYK2+LAX+11yiOmiY5SJxoq4BXB6omlqmrpfBpzXF33mFLy
	j+57sUPHuft7rJhSynHbjpOkvTvsqRjzj6E9XFEkkEIww06RzznC2XGwTzHZ6xDtaXv+jRXVNQz
	Ri2VDaGkzEP6/nfyzGVtjr4QKdErvHnadGsirbq5vY5bZIH3du1rH+opKrpw4RuZha2R4Cfns0L
	C6PGTU5CdseD4LJFBD5oFpwJ6m8RlOxY4rI56PKCfdXFOfJJl9W18HX/Jr/jmsSGWKHZErK5oP1
	hDi4IgqRlNrASBh15Pb1Vw5w0SfpgcEBefyA=
X-Received: by 2002:ac8:5a4e:0:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c967b4132mr30171241cf.6.1783598413712;
        Thu, 09 Jul 2026 05:00:13 -0700 (PDT)
X-Received: by 2002:ac8:5a4e:0:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c967b4132mr30170781cf.6.1783598413095;
        Thu, 09 Jul 2026 05:00:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821ae3sm464086766b.5.2026.07.09.05.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:00:12 -0700 (PDT)
Message-ID: <8db91103-fda4-4b24-a88d-a2901968e0d9@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX6jF0n2bpSPM3
 YgpD1RZYHormcrrR1qdN5eUwPuq3I6NmBzyhFg9Aw/RNCMGfjEE2nZpM5+WciPSYt2hM+U/tscC
 PEWLioxr5349mZkWXtVdfcPeq2nvLC2H6m0j/p/uxcD8s7Q3UsGQXHYmMSNGYoMuHPXRG7FOuca
 YPgd+eLIytL5J1eTHXVRl8g/jNeXTUmV9fhRFoklQB2Sh8pHLhHXCsBZR9FEMCNAD0e8IBwDuib
 OTl0yS6l2J4E0DBU6wcbbC7keEdX/8CrarzdXH92/g10XCoi3r/v3qkmpQUzC1eHoWATFVuebed
 KHP12kvMv4HsTU2EywUoVHBA19H1iatM7V3d/lQVpGwnOlof0aaT0u3HsYYMVKy4d3hjD3PF4ts
 nuj6moNqoEpa6uUYN+PK0QnQsD9n1IIkU3rSIV9NYKVz7ONncU4k0n5aq/+JQ4srdU4Ylc4E0JL
 QWVxRSI1T9GWbA15B3g==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f8d4f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TegkrtGQps0JBSonG1sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX0bLe04+38gC+
 BThnb9ys21iTOjT3xdQK07zl7oyo0s2Z8kecGX9NLGKM/28zR/IE4//bODQSumoiNhXWDR3ewwm
 aN+h8D0oPm27KepfFm4qnAT1T6Hu9OM=
X-Proofpoint-ORIG-GUID: YPPh67TMGiVkXU3VUTvQHJ0beiuqxMRt
X-Proofpoint-GUID: YPPh67TMGiVkXU3VUTvQHJ0beiuqxMRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-arm-msm@vger.kernel.org:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AFBD730C5B

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) and Audio Core
> CSR resets on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

