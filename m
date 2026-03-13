Return-Path: <linux-arm-msm+bounces-97557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJoJLUgytGn4igAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:50:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D7286581
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA8BC30095FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38393A2576;
	Fri, 13 Mar 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGFwQZAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyPuznaa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD5E3AE1AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416630; cv=none; b=ucWK3sJ1uBOi8kpR/i4yCNfkYYyyS+IUq6zDP3oJu5QjCy01f0S1wtUXV8zPSUjTjIRjXfUvjK32Z5tK+JvS74p0Y1ATHQA9Kooq1vQVgqEunWB8o8JPXcqY1SLQjcO+IOjLW/yCOMXd/apPkPSZSVlB/BFO5o/s0AJIb2Ngv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416630; c=relaxed/simple;
	bh=JDYTZmmp+RwHvLu4/7i79b/b+oJFG0ZEW72WLkiQBDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQK5BH0jbxFR+WFVwRAYwU5LpQtxAD2c/q53ICExKtVwuqPpqEyJNxocMHm62kmHhzdSN2ZqZ2QbT9+5aafiCoHkAhUmc7bZUlXKwftZ7Xovgic2OZF36aHRmnzvKphRVK9/6JLTZqiPoHanqZERiB4BONHlaMNjbkXdX5QQYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGFwQZAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyPuznaa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCOOF03229726
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJNoS4MbT1HPTfRHtWQ+yAMRpe3IFATSbeGFJ+YEsug=; b=CGFwQZAC2r2SKUeW
	vTqxfVqM/wqq24rSO9bxXaqMl8IfQ4UI8xndA1PGyez0SiC6703ahRNcPugUSHuA
	t7RoTlqkQmQtGomL3b5r5wdN4veHdOx1dsuBHwHTmaQ1+YR+HG9mGA068yU1c/eu
	+ZB6r276caZaR1trTT0CwDqH/+gjTbRljTqk/s56hHWaUOAqZF9jAHFEWX72/GWY
	L1KABc3ZRpTQ2G+KdCZA5d3DIpUylHpicW0sqttFxlyZH3iP2rU+tsKMpKpR6C2D
	1hYCG6D9OIKsdiVhjkQm8RycMbhyHzC+Kj6MKqUINbJgEzv8dvix+6xOkjMa2OfW
	ZEpaQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7jt0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:43:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd84943c76so2255406185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773416628; x=1774021428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YJNoS4MbT1HPTfRHtWQ+yAMRpe3IFATSbeGFJ+YEsug=;
        b=DyPuznaazqSzzrI8DVuaCWqoqNgFmS7lF8vbSOsE/BAS5uQ5Q4tUMXslKCtJhPi5kY
         sb1HPFG3BmKuAXAfBNCqEgl3oT67yNrOGr59unp1cfLG07RZ9uQu0hm5G1WbnMBO3RVA
         BDqc1XSbuswd4kCmXWIWF1u74kXbmlgU14Yo9qEE2LxxhQh9A05zBMGAGqLrzu2gc0ig
         NaPQWXLukSyyzVhCyyqdouik3DInb05cww63ZBXnP50ji/rt84XDBswSRmIKlB8tmlrU
         eS/jei/EtusOtwY+LnbMrR7XmbElMQ83TlQzZ0ifnD54jTX71f1EfZCY4lYtRqk83RUi
         V6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773416628; x=1774021428;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJNoS4MbT1HPTfRHtWQ+yAMRpe3IFATSbeGFJ+YEsug=;
        b=ToL/RBzYpZ3yfIgP1IT5c/hkYarjzKEqSZf86oaR0St0wXpfpFpewPR9LkxdLznp1w
         LLCITUDGdIiA9gcu908oeVws5oFM5zFjaYhQ9sKRoTDt/YEiR9lhaDMNAnxHHPHgcvc3
         eSo/BL67abyAIL7MFB9oONN0eIJoK1N6DzodJ64BcbkniVxtOfIbwMMlzdA9frYhASaH
         16aMeMHq3HRES57QDqdO9b/ezOGgcAyIwp4DYsOPv9q/zdLasC+HSEyRWhzD/bOrfWc5
         dZO/2eexSlPKXK+GZgECVpMxeXCDjw7b3mJ7rQtUXNTNHKHuWvw76u63D0dwWy+AOAfT
         ovsw==
X-Gm-Message-State: AOJu0YzX8bHcfiY1QQbD8TKFRtpjHxAWyd8hRNNw4WJ9O4EjDtd5nmUn
	BFtkUgDihd9bzsNroR2HWhUmJJeZKWVLCzNxTOiG0+k1vJzI20CT84UDRjDtoVfR9Zg7IVrG/vx
	5NUxVFRBXms4FD8N4d1cWR6O9zM6NfENpM0bTTiAaaN1v5WjX+VYLuvXFknjbitG9GguM
X-Gm-Gg: ATEYQzzxPVhGjTuoBqm3xx9/XXC2ckLCKb79tptCjJ7fcvv82i/xq9dXY4gHxIpMgMo
	USyo+eduTpOkdEa6INE72AKS5jITGIncANcjjFWwe4b7U+XzSw8SQZLDtb0IdobJ2hIVrrkhBxD
	mrK2+UZl15wxvPUtqIEf8OsLN5XlvCw2bfjxkG84fEWdtdYuEvd7vRsPGbPmxL4frdvI9J1mBBY
	SQMr3GXxqXo32xFhXsIuHd7ZyhDWo3KifRKsDAuqi7ttEadRn+uqhV77ib/4QwH5rwst6wL94ps
	LF9odPVzlrHuPd140MAxgw8vbP8NE5tpekRu671lvs/m5KTZAuJGiaYWtICv2YFB50WEOTXzsBr
	xzz/vnCaunjPS5yLfkalAymMDtosIA/9FIuc4q02lnOg3Bsvr
X-Received: by 2002:a05:620a:4041:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cdaa7b6b03mr933768485a.15.1773416627888;
        Fri, 13 Mar 2026 08:43:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cdaa7b6b03mr933766285a.15.1773416627465;
        Fri, 13 Mar 2026 08:43:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm19492808f8f.20.2026.03.13.08.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 08:43:46 -0700 (PDT)
Message-ID: <b4115d76-d3e0-4f0f-8ec5-697e116c6584@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 16:43:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kLEuGN4cV6IfD1aZHU1ocaG3mRC5A-ZO
X-Proofpoint-GUID: kLEuGN4cV6IfD1aZHU1ocaG3mRC5A-ZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNSBTYWx0ZWRfX/y5SrYoG6IYO
 HbAZ0dvkE9YWlwMhRifuJktHSDHfsQYtr9i7fM+axRTnNQLhWeQ0DCkgFYHGlWZgiPg99YvLaNn
 AdIpjLrR6QrRTZp4yAw/yULS9RFLOKNJ8sCNTXJ0tvXdnAc3Y6TmMRHc1TODzWSJ1jEXG8d+K4N
 LYcEAWNXE0QKtubvaUa6jlOu0E4d5DI097B71lHLWAfTix9aGtuOptyiSqOsjCQh89JOQ1RyHH7
 C+OW7Wq2krVc1C1L9cy3wG/Ka4OchAYvlc6hy5Uw0wmzFv6vp4IEVMfHcPf0a5flPUMbzTvG7uf
 i71jOERB1TpB6liUMZCwaGNQA1Iut8GS2nSdCYO+9NZloBok2wTJgIw+EqARJZ6h3knHSNRJssq
 vuK6f5zmbuLki2I/nIuuaJIewtbQ4eG29v60LaXbrlxk9QoU+pwW2CdH+1ynOu7pn849ftC36gT
 9l5Udp49qaxLs9AY+xA==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b430b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Tttp5-Z2nsBgywmGlB0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97557-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC2D7286581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 14:19, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> This patch depends on
> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

If you actually implement my feedback, then you don't need to keep that
tag. The tag was given because you were pushing your solution regardless
of received review.

Best regards,
Krzysztof

