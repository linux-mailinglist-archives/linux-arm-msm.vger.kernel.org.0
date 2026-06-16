Return-Path: <linux-arm-msm+bounces-113404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bx3sAyJAMWqvfQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:22:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ADC68F43B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:22:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T5Ji00lZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JNZ7kJK4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113404-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113404-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84A66300CCAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F52346FAE;
	Tue, 16 Jun 2026 12:22:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE8332E12E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:22:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612575; cv=none; b=DnYb2dcd0OpO8DSK5WN188+7IytdA+XsRsExNQsE89hMw/0UNeyMxuKnp22L7jUc+rU47W8nLtpCmK34bWRu9zvxa4yxWaT6HPOn9hBQgIsvBRmjeNT7O4On+rJyO3L9bnKS+QHUnrZwRhOF+Aw0ls4Pc6Hrl3DIBW+G9GLgXFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612575; c=relaxed/simple;
	bh=D7NXdzkCcINECpn3/BnF0aqzW8DC+JtguYIvQdgYpTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrVTHPoAwr93h60v7e7su2oFL4o6uzYYJKjjWSLY57qOiEoRg2nFv2J2w9Lv9Pvie7qC3wmXWtfBZRR/dezpDqCHxBJogVtBFxOoSz2V5ZHwWeITPdb8aUUYrj9lIkpiapYQ/CIee0d2wdL78BY+pLBu8uLcAXh7Tvi9RAvEU0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5Ji00lZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNZ7kJK4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC1BZ3256277
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcEkcPtMtutFQ0nojyplD+yn0BA2r3GEybBSJI5Xbag=; b=T5Ji00lZ0+MfQp6X
	1Czl+gt8xy30ur9IlOuLgACtwG82+77wZ42OSb4Xn7bndEYGfn7w2pVwuRWdW3kD
	fmFL9PnPEZQKtabuuqogfY2fRhc6bhe1FzoeORITtmmd0RNGMMIKyyWiZ6W2CGSV
	4uxNhRVOEoMRVFctwqkOt0mUxSzPwMuve5Biexe/SxIBXNB5uy5/87SjdpUKbQAa
	4LNDjsZB1HCpOvFGhMYWqhH1YQeniRk4gvip/W+pSEfUmhSpNruOr9Q626Q1ycag
	T4SQuxVAqRgEhaWL6mRcqujeOtuFj1Yuw1s32MtGxiuW9NJmrcIdnSSda65ZZqGs
	TDQOtg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9pqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:22:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915732517cdso16225685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781612573; x=1782217373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcEkcPtMtutFQ0nojyplD+yn0BA2r3GEybBSJI5Xbag=;
        b=JNZ7kJK4AU0fYxQ1VJt/PgO3IbGIzCJ0aCf9/pXNEqd+wqGydnuJAGL3e0h+vGKvKl
         ZKUfFyuQjo7QvYclZ2XlsfnCK5BBSUb7LMOwDv/hm/Grywj/Th8eG/3rsuNCT3c+Ks1J
         aUpwBnkEOqnHJPREc4iXiCEM+GBCNNA+owhWVoDt6aNzZOZ4MfbJYRi+gzQRXkeR8kaG
         yFHEWShq94k4AFYG6um+al+Ga5xGj97MvrFXf8UXIUoeKjY9iR+8WbSX3wVelauGXeNH
         8XLimEvuI2tuhpzUBvLivU/oArlidhYJY8A2ECjfxezA9hHhQPm0EEht6hb0IQKBBx5w
         hy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612573; x=1782217373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcEkcPtMtutFQ0nojyplD+yn0BA2r3GEybBSJI5Xbag=;
        b=lWu0yOckxuFOOnEK20zdKmXqNeoYv/oL/xcIxcPbuc9Hf/27Xnst38Vg7AnCMHTwHi
         esxmXdEICQuyDyY3X9S7b9UNTViPdU2r0Cv1JpX5ZW+dHl3Ar61SijE2fo/MXvfYCw19
         cSwGXwW0Tc2lAePyTQOtMNJ4WMjIFbpQhfzoCTWS2oAlEg8izQFCLloAZkmk2kEsVWMu
         SxaPJtN9rahFRI2lk0A3eBVWpci40N8NLoXephjhyx4NdsbG4oHJABnUy1aKcqu5GBuT
         Qg6XYYCJ/kzv+pfAIkCN2x4DlfQM8KyL3sXZ7r7OBxT9G3cvNG3I8cD/ps+uoMnK9OEb
         oMrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uVYByRjOfMUtssDqxfvtLfND5riTqttdGoeXJNxMQ0+Ba0Kmb8vGqOq3Z1HQ9XBzY0vQSpbW6T3j/crpz@vger.kernel.org
X-Gm-Message-State: AOJu0YxilqSlFbLOWeZH+ESerCMxaGHaB7QqUa5pNs+F4HjID3EZibWK
	Bn5sBUyCG2sjf+LMkjEwRucMLmryv3WD4MQ3FwXiBt3zRTu0QxxcTAe77oblxs2poAltAAuD+5C
	qB8hbyrFlwlId9H/0aNEiKiqN/DllegtCvAwUfVRwdne24Gh6SN39X4XcOrm35qLZ68kq
X-Gm-Gg: Acq92OGnx1tAGfcLKk420qJZNTcTwjLQ20ORHhKLaUPnJpfgxsGOQ5doldXOntayTtt
	fgneHNl6WwVTYcb7s3J3jgYqUz+VawZ5pocHkmC8VXNDZgZ48NopoLROaB1NZ2QFvcpg/Nvo4ay
	t/N6hVkcnQUCfRkxU7gg3O8VRleP0uIiTjbHKPFun4xOCU0u+X2TCkgWzR5jzXJ4g9ijOrjozuD
	rf9zHNUMQ4/wZhYnVQtkMYCKOSUt6LppK5b/UjU6OfEN3jrGzHaDCGSAbjsmzVLA/m7tZvxDepw
	K4nq3SefoK4uX39XnUWBHEG0BQ+xhXiy0TXGrzHRKlOvPYIY/0VFtl/Kj7QVKIqvV5mfl41yLie
	y43nQTdQgWKtsETgNSQSaGRJu81DvVa6w4WHijsafZrqzOw==
X-Received: by 2002:a05:620a:40d1:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-9161bca6345mr1765199685a.4.1781612572818;
        Tue, 16 Jun 2026 05:22:52 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-9161bca6345mr1765197085a.4.1781612572365;
        Tue, 16 Jun 2026 05:22:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5103710sm636854066b.22.2026.06.16.05.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:22:51 -0700 (PDT)
Message-ID: <38dcea05-581c-411f-9196-caac9562d412@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and
 l15b always-on
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-4-mike.scott@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260521010935.1333494-4-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNSBTYWx0ZWRfXzmQ7XHWxuoLn
 i1me22PLkcMwyNpewP3DRsTS8WAproVCPmtebkL1pk3qicxexJJu99KrvWyXNGXNoOSWwB5Or3I
 5jg+9d4KmeL3GLswF0HMlT3g59+qLxI=
X-Proofpoint-GUID: UxPOHHpCkaWnYI4l1nZKu8fSmGC2A5jq
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a31401d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KdsBoOkKT-vHJQxM7ZgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UxPOHHpCkaWnYI4l1nZKu8fSmGC2A5jq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNSBTYWx0ZWRfXzRjaxigglRX2
 IDLt+6TxAd8ZBLocSfadA0IBdlEC/X3LYvcv2+S8mekcC1NxOEcEY+SEwNL5rK1uoNGd/lJ0fLV
 cRBhg0qoXF9Icdb1JoYs2sas//yzZR7l+XVkNffww3f6+DLA12DdhDJN3/R8tDYpHST3jNa36iU
 14PXNk3jYi4j4xBwK63VQwTIfvnhjcoY6fXOwER321rJaa+ikwaKcDBd2+nE0jmJP20tGWC/Pgr
 xTyedtmJDJqw2Uq+BTTFQG+b9u2BYe8TxIqVhv2ds7MUMcJNGQR9kJF4cUgJEJNlLnVZyqBvmx3
 XPU4g/G8GdpxoxQT7CqSySF7o3UicX+ayJ1HEKJ5f43eWH9rZKL1R4GSdVkcKyqEUiCZUa4yogL
 MhnPvvL+mHJi/jYgK1tl23AO6p5+knmG0tJxi610j4TxFGJTUSWj4qD02zyIeK1AuGU3sXFl2hC
 aKPwX3U2sPS5az+xHxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-113404-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mike.scott@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:abelvesa@kernel.org,m:faisal.hassan@oss.qualcomm.com,m:linux-phy@lists.infradead.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:val@packett.cool,m:bryan.odonoghue@linaro.org,m:laurentiu.tudor1@dell.com,m:alex.vinarskis@gmail.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76ADC68F43B

On 5/21/26 3:09 AM, Michael Scott wrote:
> The l12b and l15b supplies are used by components that are not (fully)
> described (and some never will be) and must never be disabled.
> 
> Mark the regulators as always-on to prevent them from being disabled,
> for example, when consumers probe defer or suspend.
> 
> Note that these supplies currently have no consumers described in
> mainline for dell-thena beyond the audio codec (vdd-buck/vdd-rxtx/
> vdd-io on wcd938x), which can release them when the codec goes idle.
> The board-level gpio-fixed regulators that feed the Type-C retimer's
> VDDIO and other rails are not described with a vin-supply link, so
> the kernel cannot keep their parent LDOs alive on its own.
> 
> This mirrors the same change Johan Hovold applied to every other
> X1E80100 board in a March 2025 series; commit 63169c07d740
> ("arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on")
> is representative. The dell-thena board file was introduced four months
> later and did not inherit that change; this patch closes the gap.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

