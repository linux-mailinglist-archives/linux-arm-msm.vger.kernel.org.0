Return-Path: <linux-arm-msm+bounces-93350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCNkHazVlmmVowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:19:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91815D4AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCCBD300BBB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B3C334C0D;
	Thu, 19 Feb 2026 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMFW8Jee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNLPFLUd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DD133468F
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492777; cv=none; b=SJxobEFSvExiGJoz8YrCG2lXBW+nfhN2L+Bd2FUtLExNJYhDOf0H23nIhSjp1kDt7G/cw+utTOwhzSOEhIZEgNWLI8Jswa9+HnSxzvbC6rD/1FrGLrNTnyfMccEjQAiTxQqxMrkSHndV9BnWR6/10fn2K4TNUXNFRP43retN0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492777; c=relaxed/simple;
	bh=kisVfgvpDR5taz707UhZIUsAYFSg3p8Ww2QDn94jDMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCPTlDtsSMhynDmX8VhRz/TohxgikyWFCZhG2xBzF/VEo3c6UJWhtp48QqmgbGVpapxN2mlgmuPflo+87rH7s96omI/De4O2yvBEiEy/M2ytr8oc+B/qVZP95JVt7tPpyRJ1Ek4Wql640HJgi7VdzQdNWFJntZ8E+oyYts5Jy6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMFW8Jee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNLPFLUd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IL5deX2004682
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=; b=jMFW8JeewWdvnNUs
	/3IQLKhEmK3rN9bFq5sHoq2+hiOoH3bhUmKUZk0FESRo8v5IlxWkfsHdkdc/7+JP
	Y8AEhN0p32CZYkQuFmyRaPQV/Qa3QLDcxqDQaDvmx/Gu1Ky+PoZvhv27RjlYngml
	kMBgTGgYlHL7L9CG+0jRqsz4TQoZo6wwxNvZvY8+FU1eITwG85MqA4utX16QwE7P
	/G5nEHkTHPmh0ycdBXuMcch8vNSly9I9cteZRNmfvkP1vVkMADdKCVZBXGWQ+xnF
	knTTafXbRtvXp1DBYosKk7kdgBxr48AuY5lVHWzuPyD8pp6xJ3OGbW3/oOBExO7G
	kNnpRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qhcqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:19:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so68882085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771492775; x=1772097575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=;
        b=SNLPFLUd15/sSIhi05d28Xfwq3YVJR9SMiKtsYD7VAHdqAknb9InMXjDNomKpKQgK0
         l+uIoRQG2ggdb/AOXRtNsHWlvVFNb6Yn4jqFkPL3pcd9bp9lWaMzK/gbL6u3fpUvXyNj
         tPWsR7KZ00lq7t2L2u0rOwNbJH4/G1EMyYFbU1nwopjmeCCNJynhV29N5NGZKIVyqeP5
         D0nkkG9rlI8zk0Le2BeG4vkdMAMRQHonJDdrIa4WPb8HqKvleR601vvLb1poiZkv3dDk
         /LYGru9t5zfnqiN9vhvL4fuWbKjt39FWvU03nn9Cu531nPICcnmeleR8oS0M+mLPt0n1
         yR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771492775; x=1772097575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUa3BE0u4BFm+LYlkvToA5YziCF+XeAij7ya4biirpo=;
        b=f8GpC72ILwnkArzQg4TkuIAoL/sDyDOVUSfaRz51vOSy09Q2Es2Of4XRSMXquVdQoY
         4Crcuwg60Eq90x3el6rbZ1jO6Dn8OKgsHw+fOFuKuQiMUxN3neTptUdbKj9jOEfa8VyN
         xpu333MHYX7banyubiJRiJecKNmw78V80Z0Ocbh2AZagbGeovPI/2uciblXDepFKVogP
         DBdL8Z6R2jPVnzPA5piZ9sHfapBrDBTOKgsEFNv6WIwV5e2KXmF1Hxvdad3FPf4G2Rto
         6RzEYSxUx4QEUv2wOaZH8FYxR0CtOqbEsd/NrnhGnheHrfbzcjccVAlWrD9sZPxHycJJ
         Eu4w==
X-Gm-Message-State: AOJu0Yyu4d7+bZ/4RGjvnwENcy+8+0Jd5NeUQHxReT+ySsK28b9PKwum
	KAYcGgdyd0YWjHAeDz+tCUzWQUxavQBw3Ha/eGxhaP1uYsD0QjkSqfPLasUR+x1aL3fupLmrPlF
	FJ4QO53nc8ij0BhoSbPj88vQybfaaDkW4pcWf6niWyQNpCN+Dgov/HGq4ZmXcKlY+aSPT
X-Gm-Gg: AZuq6aKRM/mU07Wqilnh9awkVNZmOsWfYUaTze93LJlZ6hrMRXFTP1kXUc1NVkoQq7U
	ipETw7kjmtihonTeBQJ51jE12xfjg4gQCG0HJalbUh6EA7zcZ2oo73eang3WXb3kJksAeLlvj40
	jLNCygjMhNRGSw2OJ3qJ9vzESv7cAMobKrpBhlVMY5DrnWNUUNfbdv6zSKPat2cu50i9GY5Y70l
	cWHSbqBXnWc29Hco6S8E+0lyVqlGh7HKMJa9VbzY9+JNr4dZDeoRP4CLvg9j5fr5Kb/zXtge2Rx
	sYAO3nndfE7RKzDGbHUp1X1dGzfPszmDDfG0lo/YRc2eJl5wlI1xMggXX5EY785PN2n6uiQ6QgH
	JSfOaxNXzM30alZFgd3YJD5IHZB9jFPcqEo1fyIiO1YdQi6UDbvgwmhDct8D7Ij2KKk2a6vQfAb
	A5Bv8=
X-Received: by 2002:a05:620a:708e:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8cb4091adb2mr1898499285a.11.1771492774694;
        Thu, 19 Feb 2026 01:19:34 -0800 (PST)
X-Received: by 2002:a05:620a:708e:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8cb4091adb2mr1898497985a.11.1771492774235;
        Thu, 19 Feb 2026 01:19:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bf20sm3877565a12.5.2026.02.19.01.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 01:19:32 -0800 (PST)
Message-ID: <872d5559-5a8a-4943-a8fd-07fc934d29d8@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 10:19:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdm845-axolotl: Drop redundant
 VSYNC pin state
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-3-2799b8a4184e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-3-2799b8a4184e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wB0bTnbL3wjZ78P9y3NaciNK3l9QulLg
X-Proofpoint-GUID: wB0bTnbL3wjZ78P9y3NaciNK3l9QulLg
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=6996d5a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=NMe5sQuIffPLTvoV0ecA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4NCBTYWx0ZWRfX5Kse+lrCGF88
 Hu4UIHWkcuQb68vPeodOAt/c5H/rAQEjHzWSOeELG3ep+OpG/2A1tVUxLWVrC8iTelOHCC69cqZ
 GiBSrroZnNe5hQl1CM35ERQ2FdHLzWJeTupLAMR904EGa2id2JNjs8xLhqI3Ko803mQ1PXvv3h1
 IkqDsHXfpoR9chSmGYdYMpx0XiffiUFwmwK99h8YQZQG1/XqoTw8UpYnzuD9z5Q5aMLVbYBUJyi
 0GeDsQaVdwMY9SesrRdb3FxpkLDPX6EYEIHYYKyrncx1S2jLN5bRmbR2OSHNee+T12yjR3+AF80
 2zXJ6RuoKJPP/l+5FIPMK3MHyHdrCEGVWgWjaEtvSVy59Eg2eo/ODOHkkWzL8QtWx/3EBHXu8kC
 0sFDAgcK4s1lY2gFSlQC0JJszFij+aIXkVR3odKx8SS+mleq6QDCIdhywAgFk9JCPhdaUe5Z2Sb
 Y4T57E7jUVwATigjIgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93350-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A91815D4AF
X-Rspamd-Action: no action

On 2/18/26 6:24 PM, Krzysztof Kozlowski wrote:
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

