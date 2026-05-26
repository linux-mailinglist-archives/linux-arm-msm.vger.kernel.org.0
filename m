Return-Path: <linux-arm-msm+bounces-109737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GhlMyJOFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:39:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3125D1C59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 974C930254B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DB03CBE74;
	Tue, 26 May 2026 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cx++b8XC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eL1Wo5KG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928463C9EFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781149; cv=none; b=tJ9o0FTnJghWpqXH/HRJG9V7G1rZmQjK8PZSuMEQs1ZRwjbII94JY7IfEkKGqwuFHQ4WVjOD+rI5gzYNHVNmpQdobzkOUV+hxuhakmMzMqsQoLPjhFPOXHglCevNGdjvq8YgQRcss8VkrEZzMM+CUrohcFkXzlg7OPwInpQTJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781149; c=relaxed/simple;
	bh=jYUeaFDseK5Fp/dghgWSFxLEk0CVbLZJPTFDMbNLqd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzoKyMtw//YBUlsL6gH3nBWJ/r1D9ADQWa3tzOnrpvV/MajGk448d3JqZ0ti9ZD+fdVv61k/AjQ5g3kckKMbtUoDonbCHa7n1ZjPhFj/0ABRsxol6B2IbZLswRQkIj8vN7/NBqxrrzyGyRzRCSRxyfh+EeZnl/aE9x/gCFadSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cx++b8XC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eL1Wo5KG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60dsu1763329
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=; b=cx++b8XCklPhciSK
	vr7SPUArL25TyFtMsFY688yzED1l6e9vNXiiRuGZnfUCIFiJOOffJnzWEYCehc7n
	y7LyM9HHHCK+dSNnRq4aiDdZybFLKn1mPJ/O4qpbbwFbJwniJ5Q1ToNdbmhLZqH8
	WMCq4FzqpfcXxCigDNmwfCZYxZ7rPxvAA8saV+QVS5vfh/echtNWsa8F0uzPDL9W
	bUKF2rPANg+dcmDWY0Hi6fjHSKQE3EAQpu7fOTh8xj4hWKRKbMhu2a59MVoFCMjb
	BZVortQPraM1qcd96N3g3YjS4I1CK8vVaVKofuiBY4YjNYXv3qFFMIuaxi58qLtY
	wz/uAg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggbrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:39:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so11380852a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781146; x=1780385946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=;
        b=eL1Wo5KGgud6YWinsHdOLLIvmKYW8OQoJDV8RbtI+3DzCXRdYvkxdXSK7uzFc1xyBq
         sQrlV4syDSNoaqGBj37bqlvS/kpvVmsIwMqstT8/xbd3Hw4Zf2hfqngq8Y4cYzMxcJHP
         sEbAb+O8M0ibVVhOpZp458FzJe8mtPfObukUQE/sTosGXkkt3djbfAGF8jSSCNSu4vUu
         pNHTSUteqji69GJdw4UWiWGWAXMnZ81g+n7eZ2WokyX6QGSDW6mYxrddHd9dB47U0DMw
         rbgGqE/Rn+8+bWtcA5wceM07PmtsKACbHIF7sEJu05iAuF+LkgVimWp+NlDHm6/ytfEq
         jWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781146; x=1780385946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCbmsmXWy3W9IyGvQLLiDoQQ9qJebEIMsm1jE0eJTlI=;
        b=sQbsdcZa3kvOw3qokB2SR8+ZMqec9m+xGzuS+V/7MrhMEZCxZF5i/tU05TSUNmj0n/
         pHGnjMNw3EARlBvEDZkCSPsiDlnhkK0lT/IwaAbnQyl8gDc9qh6QhQDLcQl5mF7ezqTn
         pLlAeUoXjaXw8GMFc1KcrkpJndE7jPMAB52CJ/RdnTEJHIpBRmXRRYAS/thUQLWUZAMq
         F62O7nEF4Ao3f4zMHsiEpy3sGgV7mrjwg7AC0FxYruVPwP9BbGHycVpDsCiFXN/E6xn1
         xk0uIGw+kL3GXluaaFkdqAytRs61p1evHAkVWA8U/bgbXBCmBUPUsZ2V9wKZFYzAsHKq
         sAoQ==
X-Gm-Message-State: AOJu0Yxv9C0tqS905Jh6tcn8KGKiAst1u/obyIjb2Fe3sHHWUtZupBfN
	Be0V0L9uIG1LGdlcD607wm9s13wpv4GZ1ijORbTRBRqat95Lbolh37UVpyH1w25V3uTpLPrAlh4
	qmFwoYS7Pc+w4TtbSx8kUi0ULEzuInpOjoUMcYBkfM4lk0XOEqG0qbvgv/d9vzfqkd9aH
X-Gm-Gg: Acq92OG61gYwC0WSSUIKdbQTA+ggEobBuwbOspNWSIUPLdTAvc7DGRxA07z5runR5rC
	tqHiHsGkaDBXiOEjaTtUpB4zRyhzvVNoIuG2RsAXB5hwDlOhN3t8KQwIC7ALmBkIgMEXLuhi51i
	HdbOcvGzoGQzDFo2+Bh+rYce9JQ+GTmiU5qGyV0RPpMPWs/9pEpvic0VWx8zE4kLfDOeN6BgMz0
	8AY0Pr4aWKu9y/2Ajrf7026VPISfn3IzTgzzgf+2rZ38omoHaybquAO4fez5WgMlIaq8Fq1Nsdu
	IJwP6OjUvw6M4i5Oc0JWLkzmEcBGyGpX2xxR1xJdvqGC6LjNwFg1f5cW245pjpdFKSXjK1mmrlZ
	owkzX0c3TH1tj4v9JqdOG16lvgeQYDnx/oCHfDXNmt2eiWDzQuGyMNnCSAc7TQHJDm3Uf0A==
X-Received: by 2002:a17:90b:5188:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36a678479d6mr16527199a91.21.1779781146307;
        Tue, 26 May 2026 00:39:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5188:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36a678479d6mr16527167a91.21.1779781145837;
        Tue, 26 May 2026 00:39:05 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b91c6sm9474650a12.14.2026.05.26.00.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:39:05 -0700 (PDT)
Message-ID: <dfe1ab42-ca78-4a2d-9ff9-899c5274a01e@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:09:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Document IPQ9650 Compute DSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
 <f214d60d-a0a5-4f5b-bb65-8ea9d0bc858c@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <f214d60d-a0a5-4f5b-bb65-8ea9d0bc858c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a154e1b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=LDztB-CtngGDq4veg7wA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: rovlMizaWgbDXCSW8_SCMZa7k83uCH7c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NCBTYWx0ZWRfX9UakOmUzh1Nv
 Dw4gsZurDJ60r+p+vWCBJfYiGzEdRYiIDX/DHPjE0AGGh91Sh9+NN4R0teLdUnaBo9CKftgZwt9
 k25GzJyJDSuFAs22DbDSLNCsOuFEev96z5IaimW2pH1H9AGjZIFpILHXcXKE0XFUpBax68MUZyZ
 3f2m0w+u6JYhi1DBIBIDUkRuegYKubUg9F2Da2j1Wu9CzJvXdcomCCXY4aMDyFaj2JJenriKULp
 Vh0DdaLAeVbAWHneoIcZupET0t7JQ5XnCgvcFiecIIwAg2AinvgI8xYYQ/ufuHgMX0KW62lwPwB
 P5jCwj/XNIrZbYQmdZY/00lR1WLtZ16qZIEsBShoVQX9UmgQzMdyDoJMANg6MWE/vCFUN6x33B1
 iq61mf5XixfWcw6D2VDY49TE4mJ5BCyRuAtk9i9xoWSu2+ct8b7RT4OP9ZWvY+B5T1i5n2ZjL2G
 XhkmOOYErjTOIBDcq2A==
X-Proofpoint-GUID: rovlMizaWgbDXCSW8_SCMZa7k83uCH7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109737-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E3125D1C59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 3:36 PM, Konrad Dybcio wrote:
> On 5/19/26 9:26 PM, Vignesh Viswanathan wrote:
>> Add device tree binding documentation for the Qualcomm IPQ9650 CDSP
>> Peripheral Authentication Service (PAS). Unlike existing PAS
>> implementations, the IPQ9650 CDSP does not require power domains or an XO
>> clock, requiring a separate binding.
> 
> Your other patchset made me believe there should be a pair of required
> supplies instead

Yes, this requires a pair of supplies (cx/mx) but does not use the
"power-domains" property like other PAS implementations.

I'll rephrase this in a better way in next patchset.

Thanks,
Vignesh
> 
> Konrad


