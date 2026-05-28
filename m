Return-Path: <linux-arm-msm+bounces-110127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HaaAGpHGGoUiggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:47:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C875F2F5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4949302AD2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741B026B973;
	Thu, 28 May 2026 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ehdx3hoz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwf5z9y/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CD821ABBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976023; cv=none; b=nehMl1VrnyFwvUhAK3b5LpyCh9KpmJvjU3dsjK1SvO9Eokro/BLLe+3A7temryWdjy/bFv+zS49FzCqQ+zZf1HMBWre6eMtifI/Z2IMXgka0y/LQYwivtJImVfulclzKAvibZj7SLHXi801y6qlNWGWmXiwGCO2K/QeZ54XRgQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976023; c=relaxed/simple;
	bh=OkFcDZ/Ato6eXuGKS9g9eKIeQ3vGBtWHLlH+2CqUe5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLnbMPeub+IEduvlKxtMADqF47znTJIDZaGKImV5lxPuXB2HZttOUdQz/jePHqMxtgmAAoUQ6HioNqzLHLOlianhLez1Tfiwf4dWSFFoOxx/Lrm7DEFnOKn1Sp3rGATe5+z1hQRmhLxaUcLfR6WovZAxKYplRHbJ34QA4h9Yo/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ehdx3hoz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwf5z9y/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vOba2793653
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0D/KkWHTaB3TOoB7EDGNMthVvl8le95oSMP8KQVCtEE=; b=Ehdx3hozrhm+7JT+
	U2vWAN0G062Xfrl1KnrlcgboDIkhrLnVfEsLGpoWyFr0QVparikIGzI3W66mEVBR
	glgMz5lbjZGA9SBPmlfjbqOguv312sbQbpcPYPY+6sC0lCkPLLsQ2TmR3QM6WsYu
	shMJ6RXZp2sDQdPsCZ76OoW4nCwTV7uTXNYpn7kjMOjlZ2F2C+DooidFhsgl8+Fa
	iFtHLGKq7U8PnSNTv2ddh2C3y8I3JfDhj3C2bEQrHGvUthpxZOJPQ4C9bM4/z1tA
	WJ9NUs4eZ1o1MJTM0gYiQ61YOqNcMXM2Tm3EIDJ9quKl68RhiYMoYdC+shPylrEg
	fDD1mg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1tyn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:47:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2beff6b6e74so13624965ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779976020; x=1780580820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0D/KkWHTaB3TOoB7EDGNMthVvl8le95oSMP8KQVCtEE=;
        b=cwf5z9y/QKs8XbIRprt12klPHqQvjKbP+XOC1mJUOgKPZY2qzKnS/M7tGLr5YpMz01
         zPBToGesePnxstqy9HhlO2Hp9mIaBPOLwFIx0BHVKg78uOTZZGIvxhYsbvuFlIzocmYw
         z60htOw/uaQZ+YgQYtvFSwQIflg5pEJvQOogTsJLpYmXElmLf7xa4m1m3eWk69qPc8+k
         POkHzTEelimO5BkcD6aaCF8vORkLBbjGbOSYUSUmaLSZCzlkwmbjRbFuGruSrehnbPRn
         BBWlFVJeoLt0LezisFTn21Q1eC9UsmbprpqQ4Vwy8WB4BkqWQ/0SdzJO/bT2BCAR/SuP
         GUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976020; x=1780580820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D/KkWHTaB3TOoB7EDGNMthVvl8le95oSMP8KQVCtEE=;
        b=S7p+9jIdE2ePmJ73efCzWBV8V4hCA+J9Jndq7ApXDOFjRjfrX+SjG7TIZu7DiHGex1
         BjnoFGA7hYrJm2//l61Z9cKkr4C0l1YKe8S/VlBP2lzN718ZdQ+orpovZWx9sbsjh3cM
         cDq7CrlR56WP4kx7fjF2GWM7s03JKBX/NGpoZT/JUZiWHZWCVGnVk7BfYsijvap/e/av
         QDPqw9BCQy/GyT/LAWejmlCL77C8+6zcEW4NxQzE2cwX4szFtJpXLiUE22WOA4y0DHlW
         4IJSR56pcxGw0b27eJAv8aqhJTdB6Ywd45Ni/HfWTw5bJMwnVIPD6Jq/YyLWxEyb0gWX
         mlLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xceVtHSINxe30nPVlb+61xkWUBm/AUldkcuXPtfSHwassUbjOy3j8bOLVjBYzID7IQrQ+lhrYheDBmh0y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd7JAeRNJ5jfDZCuqkqPYDARMn/noY5C36YzIvySPET8RwyiII
	vH15dBaGE/I4Ie3985aAR3F5e13cadvlCip8utD3z+xDeGGC5vD53hXVgBioB5jfHmsxDCzDztr
	/XMaM8eA2xTHITDJ9xuK2s5HADvgnSjdmAyobrFv6zoSt37s+J4xMfNzFNUngaIO/Xi9M
X-Gm-Gg: Acq92OE99sORI/dfopjsAzuSp/s4IcZ0yBxgvZiIsA/OxY6smCmjy0f4jM1j3bciqxK
	s56UipHLJJQ49X6FoD5L+RZ1vBKt6yFhTBQX/ERi3gmI44dIuXKZBYyvnvPleVEA1JCAplQ6hKz
	NG6Szy4Mf9Yf00HJgbbxTtL1H2OWX33bcHjQgrbCV+9YlWPQxn0CKA+uw0NlY1lSE+d9/5FKVAU
	GV6oniDZlytnw0vn54gBwP8LNi4x4Q7Cdjd7hgl15NJPS4ZnpHhUrXbSNtmL8uDOFbu+h6A8F0a
	XuI5LYj0jVUp1pvqAGlqltAKqOGz+QyYfLHFCw+b0URFdX/jXB6oxbxZcK1KUuEr2aISJTAX9FZ
	W6AaBytQuDM+Lp+70r4Z6USr7eOl2DLe9Ts9T3LCZTF/JyhaNud2+QCK0BZprHRD41dW9u7b7Lx
	RFReLVw9TbL6wnTCX9d+k/Vg==
X-Received: by 2002:a17:903:2bcc:b0:2b2:5099:2f3e with SMTP id d9443c01a7336-2beb06ea859mr298323585ad.4.1779976019738;
        Thu, 28 May 2026 06:46:59 -0700 (PDT)
X-Received: by 2002:a17:903:2bcc:b0:2b2:5099:2f3e with SMTP id d9443c01a7336-2beb06ea859mr298322915ad.4.1779976019194;
        Thu, 28 May 2026 06:46:59 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ba00csm182564155ad.22.2026.05.28.06.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 06:46:58 -0700 (PDT)
Message-ID: <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
Date: Thu, 28 May 2026 21:46:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
 <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a184754 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=IqM-ao-owgBUIpmU7ckA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mHPV9VlJknVY7FWGzoVcVs2Ix7Yln-IC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX207frGxl1QWc
 wGWIuOGOcX7WzO4R16J9rWoG6bPUtYbNF9RNLn12MPXT/WswTS6VLx47VJL07U+abpmGGj0xQaY
 t5z+LwETOeSmzZR3UGHi0wC6qg5nV3ftIikvhtJKlBI1SVR3SdrrOtuEOJGx8bkj8aQuoTLABd7
 4s5C+x0wmXsdAyBkNxfF8MoKeI4wSuc76Sv5gT58TPXN/Lr4lxrP0EYwrFEs4ZC606DCo/6EG5d
 JmxRaMP//OfmSoyFvI46MVWTz+iqsFJu7y+Z7VI3KIdwaXu4CyKE0UI4fG4n/S9EBH4a5LhDIC4
 EQ14r465xzuqet9o+SNm7vw0nxWFkrjKP4HqjnGM5PH19RNEfdLytCu9+ArKTqpmDJfKQ3W1ePw
 AUnWQ9tSPcbyw0HVIdMLDhwWPaXBPeO6aRXE8Q4SJhB3wNBBAfPl/hUw0qftI7N2VKwFXmPTbIF
 +H2qjipWwl7w2elRKPw==
X-Proofpoint-GUID: mHPV9VlJknVY7FWGzoVcVs2Ix7Yln-IC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110127-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92C875F2F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/28/2026 9:06 PM, Qiang Yu wrote:
> On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
>>
>>
>> On 5/28/2026 10:29 AM, Qiang Yu wrote:
>>> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
>>> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
>>> register controls whether refclk is gated through to the PHY side.
>>>
>>> These clkref controls are different from typical GCC branch clocks:
>>> - only a single enable bit is present, without branch-style config bits
>>> - regulators must be voted before enable and unvoted after disable
>>>
>>> Model this as a dedicated clk_ref clock type with custom clk_ops instead
>>> of reusing struct clk_branch semantics.
>>>
>>> Also provide a common registration/probe API so the same clkref model
>>> can be reused regardless of where clkref_en registers are placed, e.g.
>>> TCSR on glymur and TLMM on SM8750.
>>>

[...]

>>> +
>>> +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
>>> +	if (ret)
>>> +		return ret;
>>
>> regmap_read returns a negative error code on failure, but the
>> clk_ops.is_enabled() treats the non-zero value as enabled.
>>
> 
> A regmap_read failure doesn't mean the clock is disabled.

Do we have special reason to treat the error number as "true"? Its 
worthy to add a comment to explain why.

Thanks,
Jie

> 
> - Qiang Yu
>> Thanks,
>> Jie
>>
>>> +
>>> +	return !!(val & QCOM_CLK_REF_EN_MASK);
>>> +}
>>> +
>>> +static const struct clk_ops qcom_clk_ref_ops = {
>>> +	.prepare = qcom_clk_ref_prepare,
>>> +	.unprepare = qcom_clk_ref_unprepare,
>>> +	.enable = qcom_clk_ref_enable,
>>> +	.disable = qcom_clk_ref_disable,
>>> +	.is_enabled = qcom_clk_ref_is_enabled,
>>> +};
>>> +
>>> +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
>>> +				 struct qcom_clk_ref *clk_refs,
>>> +				 const struct qcom_clk_ref_desc *descs,
>>> +				 size_t num_clk_refs)
>>> +{
>>> +	const struct qcom_clk_ref_desc *desc;
>>> +	struct qcom_clk_ref *clk_ref;
>>> +	size_t clk_idx;
>>> +	unsigned int i;
>>> +	int ret;
>>> +
>>> +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
>>> +		clk_ref = &clk_refs[clk_idx];
>>> +		desc = &descs[clk_idx];
>>> +
>>> +		if (!desc->name)
>>> +			continue;
>>> +
>>> +		clk_ref->regmap = regmap;
>>> +		clk_ref->desc = *desc;
>>> +
>>> +		if (clk_ref->desc.num_regulators) {
>>> +			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
>>> +							   sizeof(*clk_ref->regulators),
>>> +							   GFP_KERNEL);
>>> +			if (!clk_ref->regulators)
>>> +				return -ENOMEM;
>>> +
>>> +			for (i = 0; i < clk_ref->desc.num_regulators; i++)
>>> +				clk_ref->regulators[i].supply =
>>> +					clk_ref->desc.regulator_names[i];
>>> +
>>> +			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
>>> +						      clk_ref->regulators);
>>> +			if (ret)
>>> +				return dev_err_probe(dev, ret,
>>> +						     "Failed to get regulators for %s\n",
>>> +						     clk_ref->desc.name);
>>> +		}
>>> +
>>> +		clk_ref->init_data.name = clk_ref->desc.name;
>>> +		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
>>> +		clk_ref->init_data.num_parents = 1;
>>> +		clk_ref->init_data.ops = &qcom_clk_ref_ops;
>>> +		clk_ref->hw.init = &clk_ref->init_data;
>>> +
>>> +		ret = devm_clk_hw_register(dev, &clk_ref->hw);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
>>> +{
>>> +	struct qcom_clk_ref_provider *provider = data;
>>> +	unsigned int idx = clkspec->args[0];
>>> +
>>> +	if (idx >= provider->num_refs)
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	if (!provider->refs[idx].regmap)
>>> +		return ERR_PTR(-ENOENT);
>>> +
>>> +	return &provider->refs[idx].hw;
>>> +}
>>> +
>>> +int qcom_clk_ref_probe(struct platform_device *pdev,
>>> +		       const struct regmap_config *config,
>>> +		       const struct qcom_clk_ref_desc *descs,
>>> +		       size_t num_clk_refs)
>>> +{
>>> +	struct qcom_clk_ref_provider *provider;
>>> +	struct device *dev = &pdev->dev;
>>> +	struct regmap *regmap;
>>> +	void __iomem *base;
>>> +	int ret;
>>> +
>>> +	base = devm_platform_ioremap_resource(pdev, 0);
>>> +	if (IS_ERR(base))
>>> +		return PTR_ERR(base);
>>> +
>>> +	regmap = devm_regmap_init_mmio(dev, base, config);
>>> +	if (IS_ERR(regmap))
>>> +		return PTR_ERR(regmap);
>>> +
>>> +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
>>> +	if (!provider)
>>> +		return -ENOMEM;
>>> +
>>> +	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
>>> +				      GFP_KERNEL);
>>> +	if (!provider->refs)
>>> +		return -ENOMEM;
>>> +
>>> +	provider->num_refs = num_clk_refs;
>>> +
>>> +	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
>>> +				    provider->num_refs);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
>>> diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
>>> new file mode 100644
>>> index 000000000000..09e2e3178cfb
>>> --- /dev/null
>>> +++ b/include/linux/clk/qcom.h
>>> @@ -0,0 +1,69 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#ifndef __LINUX_CLK_QCOM_H
>>> +#define __LINUX_CLK_QCOM_H
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/kconfig.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/types.h>
>>> +
>>> +struct device;
>>> +struct platform_device;
>>> +struct regulator_bulk_data;
>>> +
>>> +/**
>>> + * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
>>> + * @name: clock name exposed to the common clock framework
>>> + * @offset: clkref_en register offset from the block base
>>> + * @regulator_names: optional supply names enabled while preparing the clock
>>> + * @num_regulators: number of entries in @regulator_names
>>> + */
>>> +struct qcom_clk_ref_desc {
>>> +	const char *name;
>>> +	u32 offset;
>>> +	const char * const *regulator_names;
>>> +	unsigned int num_regulators;
>>> +};
>>> +
>>> +/**
>>> + * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
>>> + * @hw: common clock framework hardware clock handle
>>> + * @init_data: common clock framework registration data
>>> + * @regmap: register map backing the clkref_en register
>>> + * @desc: clock descriptor copied at registration time
>>> + * @regulators: optional bulk regulator handles for @desc.regulator_names
>>> + */
>>> +struct qcom_clk_ref {
>>> +	struct clk_hw hw;
>>> +	struct clk_init_data init_data;
>>> +	struct regmap *regmap;
>>> +	struct qcom_clk_ref_desc desc;
>>> +	struct regulator_bulk_data *regulators;
>>> +};
>>> +
>>> +#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
>>> +
>>> +int qcom_clk_ref_probe(struct platform_device *pdev,
>>> +		       const struct regmap_config *config,
>>> +		       const struct qcom_clk_ref_desc *descs,
>>> +		       size_t num_clk_refs);
>>> +
>>> +#else
>>> +
>>> +static inline int
>>> +qcom_clk_ref_probe(struct platform_device *pdev,
>>> +		   const struct regmap_config *config,
>>> +		   const struct qcom_clk_ref_desc *descs,
>>> +		   size_t num_clk_refs)
>>> +{
>>> +	return -EOPNOTSUPP;
>>> +}
>>> +
>>> +#endif
>>> +
>>> +#endif
>>>
>>


