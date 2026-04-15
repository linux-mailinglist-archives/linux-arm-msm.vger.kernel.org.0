Return-Path: <linux-arm-msm+bounces-103262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG7WOK9f32k0SQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:51:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5BF402E42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28C1F3036595
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0612E33A029;
	Wed, 15 Apr 2026 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCMTYzUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRiAOyhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BDC2797AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246126; cv=none; b=djcJpmAfLi6EQn+XnHn+UuX6lf22bDFs5n/P83/sq14pVHHZuC4fLJg+O1D+zYmSJavFDrDBDHpChUDL2oIyzXJmP778OAkH/WiRs2gdbeGPDPADdXtD4Qx4cGXucK8a9ZNXGBruHzooEHbejsxTWbLGk2hxLpFpQXAuUEtFNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246126; c=relaxed/simple;
	bh=KboxyMTnclITlovOtCeHt/2q4Az468hfl1/29hD1Bpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWMUfPfntcEEIp5MPMv1RR5oRAlbXZGA6DjEUBFgDoDOIrGU0CFCx6nU+wHi9RDUY0Z7KLW064i1omnX8JzqXj4jIKIxqZ1maGrsbuNZp9M5OC53wOInaGcdPaRl6owAAf4tZedpuukUQ99wpr0gA+c0okMZ2osGVf9N5ZxC5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCMTYzUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRiAOyhV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4Vvii3059053
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=; b=ZCMTYzUdw7kLLoms
	3BiS3Nm3C5g4C01oA+Yx8kFfiIUsdntcJ3bZi0S3rVuWnj0tSglRgzViyXTWAyDl
	hjQUBHQcLxEAjYhXSah6NuSc0xG49gviLc9z+N1so3PA0+wOuHvHJn29ozQGaWrD
	1aV62Qu51ut300p2i/R21a5ZJp0+JBJ3vFwVXp/q8X3YgzfRpGFAbGxMkIpHVMRB
	T2RZzH8uKC5I1MPicRBtzBjA9SIU/gXwfKnNMkKrSiVlB7280AanJrp3mtnNIBvi
	jQRN7FM3iB3ShxsWiBB1wL9SySpptpLFC32Oo4O8vrvkE1R2SAlDiFDdN/3FQodH
	32v9OQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhteptmqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:42:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d0095b0d80so191883685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246124; x=1776850924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=;
        b=LRiAOyhV8SkWgE1LlsYCv26Rlum/Xo1jgC445etmkuk65ArjnX0VLweHhpgdiRbenW
         ursycaUW/GhTwSMCTq38sM7LQY0SF1/pjSSjhwVl5QxBDCiSjK+Kd05oO/INzF6x/1KI
         b/WojQdRuXEiDI9h6U1U7n67tvHFFmRCvwIifJOwuFrwZn/O5gfu9x9J5R7c6XUfIVeN
         yajRCGNUBTbnJK1kSO7O8ckRmNSZzPMtpmtbHHQ0pemYMToYQY6/bJPDCZJW59N9VaaE
         B+lIcGvWn39HM6ogGgW3fkZcl5h/wpjie54NUYvx4jUof3XbnnTzVFdU+E5uagnwzGIV
         fyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246124; x=1776850924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8au+N/1MLaPhi7Q+5KjJ+7n0ETdu8nJODsL00VdDp6o=;
        b=MCDvh5w5UqYdDdegD/5EBKkyUSEW+AnihPtsbNh3pn5hVeUSR0qq5SRgzwuu5705Gc
         9RZDypyRIZ+DYgHN0bFkYxoJwAAzoh86P8rZq3qhpLehjIWe282fgUyh3mmRbe33FYyq
         ZYYKWQpjju3PyGUX4yMn/kWDYTfGaoicZi8mb2PgLYp5kbefXCYvn154lBEUuZfaXO4D
         tFT+4BNbpqys85txlxbyg2/bKSXfkiz51Lzy6fuCIGXzz1ToJJsmn79G5Ld7i7UM8ngb
         JPO0UVLszQHu0pD/Rj/o0XYr1Xu/tQ5uJnFD3vC/PmWcZ0VXCn0x64zpTdyGgxluzzlk
         h9Lg==
X-Forwarded-Encrypted: i=1; AFNElJ9hTIynmLWWPoUczRimcIxh2XmZqeQQoWj6BAtfUYYxeVJ6IB/d7fWMgD3zweC7J7bVXfyXL/XpdMUMbcLp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2ym2Co+HT7IroT1cB7zmq5jimRVhzii22oQROt7yDiE3mg3l
	Qzdu1P0TtUMkB8cgdX6qmdUsL24DzgSncYxbMNsksoGorGUY3nClIi4iI9cGpINj+77NjWGdTZY
	3GotRkndRuWIyrPhww2aJ9UavL8p2I2fuNs8khUNWnStxzmPCr24lqTDY7+PaRVd9XMMt
X-Gm-Gg: AeBDieuJk8FHUgHjrVTphslyWsnUBeopUVF1dLt6RXyc0ksa5Lj/pdivV2XGAUxp6Yf
	vS53sxInVLW7P1528NnR121RT4/yBGlgizey2c/nLM7F9qW49i5LW3gv/anqQHgcdTjmwXcB9V/
	4tyzh224IhcdDoRNIWb3m0w8J2ghWjSwLe83m7CGUnpV641It/MgXc7dzwaYPtML43emgW0yR7I
	GP+VP2H5uCrLfR2s8B24ZE8aHoB9CgpnINJ8VE4b7QSl31Gmck735f8FPcl3q0fqlmuFYj0/Jyt
	Te3D37fuNX/GHQZxjOENXhK1lLhmS+UZfwMMiW2F0s6GAt3bMkrkLQ3HFM3grG0WCYAstJiKwUq
	zL/hLjX23+067CvgWGif2UHjzSbOO52oFq4sq78jjdIJtIT9r8TgD7bTxSROjEcAIgz1FYz4e9I
	SirZJi/TPbqRdOkg==
X-Received: by 2002:a05:620a:3186:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e4cb303470mr158105285a.4.1776246123928;
        Wed, 15 Apr 2026 02:42:03 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8e4cb303470mr158104085a.4.1776246123537;
        Wed, 15 Apr 2026 02:42:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67238000e68sm249860a12.25.2026.04.15.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:42:02 -0700 (PDT)
Message-ID: <5bf3589e-0ec1-493e-ba10-db8237a18d6d@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
 <RAPaPhpxA39W0ykm-Cr1KaDiJKpRqdQTXUeEmt5mQn4lJBHEGaIS010ejjmhUYEBsHjzrTX41Ek9zLU2bae_YA==@protonmail.internalid>
 <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
 <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
 <U7Oj0BBSw7MWOWSCyP3-GGypXsAALySEpjzoCVQD3P9O_ZWJqO4GVKLhzQn5JD4I3okCCp2F4YFckFRJ1duvCQ==@protonmail.internalid>
 <6d5ebab6-3c4e-4a1c-9578-6e926cbd96de@oss.qualcomm.com>
 <6ea214cf-e68e-44c6-ba0c-38aa0a644ae9@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ea214cf-e68e-44c6-ba0c-38aa0a644ae9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DykM1orA7rI63JejHX1q0xoxQiv6BdFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OCBTYWx0ZWRfXwENdW7WkM7WS
 Mr1tgXXVboPar9x1lYN27tRzOFlXXenRbm8Ldd1mfYgU6Q0SDO/eZIlTrOmd4GIYp+S3MejL097
 2eTr6iZzmqIzO9ESYDFribD6ILgE2mTaaDk/SlMVkjoUAMmZfxnSJblv8kIJAAblGE5VH+uFovB
 FLEpE03OAZelGIQ5VRQnLRT/0sUceM3eRkfEPLiW//+fszGlq3ePSDQ7RxQ3QmgNJiLRn3mdE1A
 SvOu8svc0DJZ2weh/eHD8ozmlJ+DLdEtXENPkU69RQQYCqf/RtUxPkWOSMfWPM1v/7AxcPcfArL
 krQvSEYQGW7TLTf3PWSGNy6ZfIp488uaCEY+nwW2XJNV6+QaSatPd07m7kPV/p7CAiaguKQMsQl
 DWSWIILXmdxsA4FK1UHWNP1YvKRRe0BZeAP+n5NoeMiOCraaD6iLkplF8mrom6DRoHR1maCG5iE
 oQXLTph9EevzOoZTxqw==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df5d6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=MidpbNYMP4jx3VwMSCAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: DykM1orA7rI63JejHX1q0xoxQiv6BdFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103262-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.15.66.64:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.3.232:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.152.150.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE5BF402E42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 1:41 PM, Bryan O'Donoghue wrote:
> On 30/03/2026 12:34, Konrad Dybcio wrote:
>> Let's take a step back - since any CSIPHY can feed into any CSID (at runtime),
>> the resulting nodes would either look like:
>>
>> // hardcoded, m may != n
>> csid_n: csid@1000000 {
>>     phys = <&csiphy_m>;
>> };
>>
> 
> Well that would be wrong they can connect to any CSID. We'd be churning the user-space ABI and imposing an artificial constraint on what the hw can do.
> 
>>
>> // determined at runtime
>> csid_n: csid@1000000 {
>>     phys = <&csiphy_0>,
>>            [...]
>>            <&csiphy_n-1>;
>> };
> 
> This I think works well and actually maps to what the hardware can do. This would be where to talk more about Neil's mux.
> 
>>
>> or we could store them once, centrally, in the "CAMSS_TOP" node and
>> pass handles around as necessary:
>>
>> // camss "catalog/manager" driver/library provides CSIDn with PHYm
>> camss: camss@10000000 {
>>     phys = <&csiphy_0>,
>>            [...]
>>            <&csiphy_n-1>;
>>
>>     csid_n: csid@1000 {
>>         // no PHY references
>>     };
>> };
> That could work too.

I personally think this is the cleanest approach, at least from the dt-description
standpoint.

For combo mode..

I forgot what the conclusion was on the sensor-to-(CAMSS vs CSIPHY) connections
or whether there was one, but in any case, I think that data-lanes and bus-type
could be aggregated across each PHY instance and the final operating mode could
be chosen based on that, at runtime by the driver that managed all this (say,
via phy_configure())

Konrad

