Return-Path: <linux-arm-msm+bounces-114879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /P1cOg4sQmpD1QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:25:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E76D77AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:25:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G3ySc27H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Yr/2JhcW";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114879-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114879-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA9B2303CA4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A173EB10B;
	Mon, 29 Jun 2026 08:19:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248403D8908
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:19:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721199; cv=none; b=Y+Zl0Scla6pklKWnZ0L3Un2ipqa6YPQ07p6zbKLUYIns0uz3krJG5qq/HO/oznYVkuic6CvDErKachdgZZXB+7qK7Ol4yw8Pfr30o2Y4paIt/c/T4YdjlbneD5/g4dv/d0Q4wiqvJJo8odH0krHyKlPdGEZcJlUpufQANykdBys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721199; c=relaxed/simple;
	bh=3oyxaf5erFOhHykBv6HtmESVGsNR2h4lJpscx6T6+9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqnL+7+1H62qAKXB8jCn35UN/VVo89v6IfpWQnC0LnRovepagZYUlnFxPXO/V2twt5/VGknR4km+hipXEpz8Hvw+hFaTS7TEzC4A+orqoFExkLojcwFGDjKcODi9P3Wr7GZfW0pn628DctWOFJKIE4fpzzzZgen8tEihJdeBx1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3ySc27H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yr/2JhcW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rFbu2135817
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toBqkSlpEnuxEeN3/l6Md6vmEcsTSD2UHosqtiVFXJc=; b=G3ySc27HESXrbKXq
	QSZnYe2sQESRHcoY3QZ3NZgE9jFVfzp5ujbLGXFTql1LqzLT6HGGU01t5egh+QAJ
	auFObbnoxJoLb8MvJxOJcdgFY9RIXhD616A5s2wIKYxrRYYpFDok+xxXnOwPkPR7
	SU1hZOSuk4n4hTI/wocZZKCDLOuzvxh5FBU03LC3+dHXlh/6o0li7/5YVg3LFMb8
	ImQJqM/MaSJvxCz/lpuTJ/O056tp9W7rG+MCxlD0g468lfpKdUp8D93wFRr1ocFG
	hEY1Pn9FFw5R8CR9TxTeP47J+ZviIixjLLHe9+/DVF/7A7h3C5zg4qCJBEawlDbt
	FvtFaw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tunbnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:19:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e8e40a8216so8306906d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721194; x=1783325994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toBqkSlpEnuxEeN3/l6Md6vmEcsTSD2UHosqtiVFXJc=;
        b=Yr/2JhcWYp11Sja7foCojiMqMAH0Q0DhSMc8X8gyLAqq9+qya4JN428nhmaVFoEwxn
         Vb/2qPI8qMY81Q68nuH+K6Xde+BuFUq11DBpWLGeWqXtd/FoFQ59RFXCNqq5sLCLdJTx
         p06y8ZyjPoSp4aOQ08qrT2qXaCZM6xqMFs/eqawIZrekKQlEL58FZwrqq1zkWAlnPA1E
         mMSNDDCFgpX6nZoEsXMNStrIJOblnF7RYmUhVFqn1B6h4b8pEX/LP9Zu3vVqx5L013T0
         r/wNEy8txWJXBzBdrMjdxvi/Jy9MvYfa8aX+/S7WirN5a/y+e6Y9FhZqqO2SsBHvB6X8
         ML0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721194; x=1783325994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toBqkSlpEnuxEeN3/l6Md6vmEcsTSD2UHosqtiVFXJc=;
        b=E+0d+yAlQCWn7iuPdf1sFVObvI8wADkCCEQUVRa76dBXl0Pz4exQ7uuNIPJ/5vSNHO
         bYD5HVy1QxI7DSQcTm1Zze/sXzC1cw9rjkk2+Yf3f5Sq5Ojtky/G+O9ACgTtR6yhvH6c
         hDsMaCwc6nSV5xdttPRzZ3/lN3sI3lVsR9eDXSvXmSlr4YQ5Cvbu0ZSOCPG7dvzhb7lt
         XafQf1FKwhmVhPWgcovc9VXkwwXzlnlYirvK1L8VildgmiRmXvVlIY/1VMvT0PNioxM3
         fZyb6qQqKGZvhG0y6iRvSEICtuiujQSWy2P0p+PyIugdES/pJzh/qySohFBfygqRKOci
         /jXw==
X-Gm-Message-State: AOJu0YzaXDn/khDsofPIJn02QptHRf/ve9jvUxaURK2RvToiuXqWFBKe
	Xkpmt0pvO7pzonJDZfnIBtO51b1Zzv79BjFlOtXrfCYrZHGQfRv42aXxAGG1LHVCmlFLdbwTWaK
	jrMQgzKHOxbUGnrGhjCKRg+JcsnXmwG6/kGWTFAK9pz/9tmqiRjdGD35SpdFaPN8BavnJ
X-Gm-Gg: AfdE7clH8JyG7YeWg/Sn9ZX/G1Cp28t9zy//GznTo3WuBboDC83OdQhXA2PY7ZlIB6s
	swDDxiv1TNdW0T+E3IVAUCOLY1qdRx/XsNIfU6OXXt+q4SwhWUSCrSwB4dT93iW/cEPuwynDAYf
	oFq2pEcQFcVzR2gE7UtZrkL7P39w2T8unxjz0O2JlqEkDJN5kOEbq9f3R6ZSbg05QFS30qhYFlB
	XT5OL9QS78ytDMdKnfIyT8CtvQK8BIG5+0un1yB1zTQU/OVEjr8+N0dzTxARZuEbX6ha6S3gCJ8
	5h1IIpJRyf82TV/2XBnZs8/S1s91jAAg+hwhNBWCcPr9xXXsRHLAqqErjLqqPXcBCFLHdAlvSqG
	8iI9ZmT1szZr16wnKufdZUrkl3yoHDp07M28=
X-Received: by 2002:a05:622a:1450:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51bf40b343bmr34093461cf.4.1782721194076;
        Mon, 29 Jun 2026 01:19:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1450:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51bf40b343bmr34093301cf.4.1782721193583;
        Mon, 29 Jun 2026 01:19:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1254b1b366sm209386666b.35.2026.06.29.01.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:19:52 -0700 (PDT)
Message-ID: <3bb61c2e-79c6-4f36-a1e3-59c2fdb249cf@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:19:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for
 Snapdragon SDM 850
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
 <20260627-sda850-v2-1-44bf46ade42e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260627-sda850-v2-1-44bf46ade42e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9EeiD7NcEK-p-jKWTQ9Aa1pnNOUZqZ7Q
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a422aab cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tM2yjQwG1dvND7ghf3QA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 9EeiD7NcEK-p-jKWTQ9Aa1pnNOUZqZ7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfX3OsconjBNeZ8
 McD8WJ2r8IG/bX/UI7dktFaiat8TjzzuPtsFhmEDY4gnX/HxCJtZejLTnnMg85GUR3Gj9nuF23W
 ga/ocdRkBpI3KauWlZJhFTeszQDSq5t81ZZrxIr1YUrEZIaajLSQ0knvZifa+kqxmplu5Uh8svS
 w/rIwKZ2kQvxc0hYGs3JG2Fp1F2jX7oAVX6OfwRP9Mpq3iUf5YxnJ6nG92FPr6ZZmC4I5DY+IZO
 yMSclnzIDI5zS/ZUIgeO8voBYParInefWECtk2yh4VTYpplDX3v89E+DLbwziYGsEQW1kOLLEa2
 +Ab1jKQGVwvwJPU1xSuFqNNGFZiu2RlIV34UsvVza+SBplGWXfJshsw9hGXaq7rtAWM4VyPRq3O
 BgbNgBEfEAO4v7gxGPgDfGG5+5nJHCOZGCGXGhSCLwxTVpNmuSC2QHtBt2R/Bf1TzWIJi9U5J0N
 AsOV9NgQqYyvL4mCBQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NSBTYWx0ZWRfXwV408f2ljVEe
 SrXoaDm2AX9nBNsNdyHgqjmXNAGdlnyfF14IP2ukVkAX6HiO8hiHkn8hQ8dDCXc/sixC83d/qMw
 8V5hMHAZ3m7/NAbgAQggjpDfUnqIgbs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290065
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
	TAGGED_FROM(0.00)[bounces-114879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 3C3E76D77AD

On 6/27/26 7:50 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add SoC ID for Qualcomm Snapdragon SDM850.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

