Return-Path: <linux-arm-msm+bounces-117122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8uasH0yNTGqCmAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:23:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3271770B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:23:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gqYbHEkU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GVBNju79;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117122-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117122-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1C723016B87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330F33845A7;
	Tue,  7 Jul 2026 05:23:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE26E383C94
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:23:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401802; cv=none; b=gS3BEkaiznTJsaeNbqvyuzC/9X+oiP0KIqdxldU7rqKUGAe8eK7YUdPR327mwufLFNo/pto7nbAaExm59jvsjNKuCHLq2dhJGfKvxALKFq3wzFu8IFEREg5XRL9YICA6Om7h6f2Vhmrx/dEEK1OZILrv2/uN6VrQ3JvHjOFCthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401802; c=relaxed/simple;
	bh=peGGlS9T+0QGAn4WZoFX7AM8oGcbad4sPBi8yOdOmGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ex+1IiKO1ybJzuvJhbCTYBlcj18TmXEhcakgVy9L7ENAnBKDvHjp4hcwrObPE8gz4dmigQz49y6Q4K08oLsiyXEHit3HHWXcDUT4CrAtkaXcq96bTHU1oLCSLGVKzY8XjQJorbebiaXwnwjHPcfj5gQnnWFaL6y1AlRNDa4NFbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqYbHEkU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVBNju79; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749GXd2658259
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7pRZOt1/C2Ak+fJkICIGu2A8CugiPqfodDTcjzFu/g=; b=gqYbHEkUQi/BF2lr
	aJXjM8Ba6jvYOnAMaU8N+HK1J2fGyzErKUM5dsZP6kzQTDJTYvsg7/edkE6J/6ob
	/3w+y2HMcQ6uQZt3jCup/rtCteSYNFhGTo9hzUDqEEG/JBByTw8P+42LSGkBVwut
	cBFM44qOZI2sPVtwzawpk4vxVJR5Ap8T+R7sp9ZSKl1QF3DcLdse8SkR1s16dy52
	vW0eX71WC6z3XcYM4LlTTIcwumWleJsC3P2EQN78yeqluiDX6ng5ur0wsbY4pdjR
	x4JhsBwHoHFiaT0fQVShvt9XvzbNl4y0rnZTB/ILlVWMRBdahdjNXWeZg1FH+bTf
	CsrsSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r469x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:23:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso50663045ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783401799; x=1784006599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7pRZOt1/C2Ak+fJkICIGu2A8CugiPqfodDTcjzFu/g=;
        b=GVBNju79Q9RbhfLvoecjoI5W7uy+3+xnN1j7/6tOG4eA25zLCce2fVqN6nQ+TuSzG0
         4DKpvmUWzvIRyIU1DKUaIW1bf6d3JIcT7Rf7DJdveqkWeKocjP2igBpJAwO5ajt+q9Xg
         6OCABIPsk9e1g+GnIRUfsi2WttAvHPa1KDs4N9zDl33oblhe1JjqKbugkUZbGQ2v+Y0T
         K7IoeITBV5VcDjZGUO4EK919zGVjGKccnBoprwrOzCNDvZLUwffsxkuVee73cRS6XOrd
         eByjxxYuZrPj7vn9jVhp4dhqzvmriji6RYX++Z91Q7Gw8+nk96lxFAw262clHzOdk+lH
         duIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401799; x=1784006599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7pRZOt1/C2Ak+fJkICIGu2A8CugiPqfodDTcjzFu/g=;
        b=rrrpWh7JxJKOYkAYfUFq3Dv1kFShUZs+h7v9kyw6uDMMT6vAx+PlxCiNgrO4uCm7zc
         96SnIM+/zDUUCwQ+e95GFzp9HlFZyCECfsvpDYDmORFVOrYVDXq9cq56lrmrhe7WLDQA
         WKYjFqb0SFvnnGvrWz1QVfwBSq9trPqYRBmd1UBMPY2agnOQADijmkIV2ps9xBpenZWT
         guBjF0DKNAYQ4WUAhaYWSkCx6nw71XBzmjDEpOcFNSeLT0P3aHQ87PrCjnwune3L8YZs
         G1s71jqaNb29TvXqDylm/5uvq9uXEDyfgc4PRRP5+ogI7gQuGyAsLNh+tU9r81rrOmWo
         og4g==
X-Gm-Message-State: AOJu0Yy9Vv8HyvT7jxIIRCEu6r3BkusIYW61JbrR9LIjhle/hFA/td6q
	1M5rZ9+YI2aFRBdRF9yt+NfrCd50cbWEtgBbL260pgbBa8jBy3QN8k1VcE+6t9d8MM5VIMFGqql
	ngm3+KF1+C3ZqRTI9dayXQ8ixk71vFftcfc1xNJg/K1zQy6k2J6tF/HLCONSKwYOb0BbP
X-Gm-Gg: AfdE7ckzebe+Zy5eW9RLrHfXJgK/TcAXL/RL+F0vTnm6MIbwB69UJifiGdY7ZnEdz+P
	RRHh1f0oJ/hWWifQrRyQpc/EoPG504BZGK/ApTH6yNuXZtLIgL4Y/pOy54ubtc28r69fP42JM+y
	xOm2FbK79CBf/XGkmeNUlVHxDdFxrwKkNQXQDJD0DXgaAE7RQY7oph811DWAifymdjSq5HCWvZT
	lJWC9iEo2771b0BOgngFBEwvoxv68aiussLR4i4zskwaYToHQCRIOhhQgj+GCys0uPUo02W0N5K
	VCrlXuLydvm9PVaD5Fw0OTj6qAEtgnD0geeEmZo81BrTbpxVU7Lh/+iuPPrqDViw6V8MeKTyW0P
	oxRC2cgC/kJPvuCRzmuPvsMn9iQIgbB6yXGl+jqZu8ZGSPV0HrSliIAxIp/ZdM+ml/wiENw5mHA
	5z60xj
X-Received: by 2002:a17:902:ecc7:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2ccbe6134f4mr39951845ad.13.1783401798787;
        Mon, 06 Jul 2026 22:23:18 -0700 (PDT)
X-Received: by 2002:a17:902:ecc7:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2ccbe6134f4mr39951445ad.13.1783401798269;
        Mon, 06 Jul 2026 22:23:18 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm5020325ad.49.2026.07.06.22.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:23:17 -0700 (PDT)
Message-ID: <7e4c6924-f217-4b43-a5af-827cc3c517ec@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:53:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: shikra: Add PCIe PHY and controller
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-7-e1a721eb8943@oss.qualcomm.com>
 <12e86cc4-d96e-44f5-8c87-87a6df321115@oss.qualcomm.com>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <12e86cc4-d96e-44f5-8c87-87a6df321115@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfX7/KsfB9Fg6My
 O/EXxBObjBGs1Iw8Kx5b7906SZj2MQcOvPwqjX56jfHcPMYmmirnbCQEyS9bsJzTrsr5FL9qKBv
 TkyB0aChrrlCxk38OQXdwi3Eflz7RPhtd/Xl8FBSe0PumpWR2eH8mexcwZqHXKPu3OvgNxN2+l7
 A1H1W+dcNp1ny23HiAr6pDvIxwSGg1Hc9hZTGTWlRLZhJ6nOZgbEiXVNOE726CYHhFDGYcpuzMm
 q54Exsv2uXr4inpk2DjH28jYHefDNgwadNAVrHcTGSUgkQ+2QBL/ikTaVIIDT2NpN1oaolshWrk
 4h7tOJxQMK8rdty12R7sTGQWCThDgcRouhMnPzoZScFqW5odMMuel3O8moBphYDkuUhQkw1pR7X
 fZKKLpcFXCa6XnRuIgO47EUYX9ODTZFqfSII+0ilgxk0j6JtsVtgalk6o8fefcFKEvnGw1HYbex
 8SRMXVbdw0YV4hYkkSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0OCBTYWx0ZWRfXywbZxINKb5be
 lyaEVFmUrB9JUy2bDt7sm+PjiHvugSoYh9OxCwRqC5rvCNx2zDzdF4uCt4fRRdxp9UcqSMJ5aBd
 jb3OCWsMZOtVTPeMHTNEhqIV1Urq+5M=
X-Proofpoint-GUID: fVkkscCp7SGHOgI6nu5n1DEW2RyzcYhF
X-Proofpoint-ORIG-GUID: fVkkscCp7SGHOgI6nu5n1DEW2RyzcYhF
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c8d47 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=A2pwc-5Qy5RiWZamnY4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117122-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAF3271770B


On 7/1/2026 4:04 PM, Konrad Dybcio wrote:
> On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
>> Shikra supports single PCIe instance with  5GT/s x1 lane.
>> Add PCIe controller and PHY node for this single instance.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
> [...]
>
>
>> +
>> +			max-link-speed = <2>;
> Please add a single-line comment right above explaining that the
> host supports higher speeds, but the attached PHY is only Gen2,
> so we need this manual limitation
>
> Konrad

ACK'd.

Sushrut


