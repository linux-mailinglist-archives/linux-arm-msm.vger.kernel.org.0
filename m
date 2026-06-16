Return-Path: <linux-arm-msm+bounces-113434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t3qNDDpZMWodhgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:10:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB5D690454
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:10:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LuGUpxpM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XALaBfLx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113434-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113434-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECCA23132FA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C710735CBD7;
	Tue, 16 Jun 2026 14:05:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDBC334C08
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:05:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618751; cv=none; b=MN7fbcH5l83KK9eouCi3TWerY+aznOX2Twmz2nO0Ca9hIHzZTqhabxhPt5YTbvuCq8Pdh0Q57e26QqPS3H1+s2a3SOXdQBYUiHplJxyJJYTxyR7jdfYComz8ReIKFf/er0AD6ngDHL+swzHjKT/PTFisruMtBgF3zYexF3FJtmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618751; c=relaxed/simple;
	bh=nbzR++7XCb9Z1s2RaEI4dZuKrlRPUN+JTbifrcoxnUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bhi9i11Vv3EGj5t9EJmIb56pvMdJ+KZs/jqAOc262SBw6KG7dEtVLmjXZkbJGmED/tCoQv7hd60lnRABxAhbL/buun8Xaq3y+H2B4aw9FhH5xq8CLAUhTbCOlygoI9M9NMwVgPGxFp894JDPyoF6/oKpWwb5sHGQrL/d98kUcP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuGUpxpM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XALaBfLx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxeFc3920680
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UgIGSZvL4pwGhTtVdZPQ2gca9pBIPfHY+k5s1E36o8=; b=LuGUpxpMKZA8G8MZ
	TIzD8/Gc/OynOZHiqHNAafg0ADsjQMWbJAT5GchT7NN+dHrPFIg+V6e8t4dLxv1C
	L0yX9qwRP8n+rct0c+QONr9EsMvdjQjSr9/FOMmsk8ENYZ6kU2Rqu6I4XzIOaDPM
	HBr3rfPzoyYFf2wFyDEgC6+siTKAUYacU5mUQPL9Ckx5Q2q5cnsEq+A6AEbmfWWf
	5u/hUCLLhv4MFInJH1vnCev1jMH9/EXRHd4SYbRIcgQv9of8SiOLe9gKAVOrILDn
	QSvM+A0HTxWmoHxHq8RMCo4/XEM/IeIwDHl4Yi60hGrIGjj+wV3RNwf/oOregv91
	pXlIwQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09ga7q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:05:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c4b898e8d8so219533137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781618748; x=1782223548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1UgIGSZvL4pwGhTtVdZPQ2gca9pBIPfHY+k5s1E36o8=;
        b=XALaBfLxq8yJF2yMPn2wM9xhsKp0uuMsRNSX3dO3LXKfSjuYljOQKmIG7f1hZYzwCi
         r9VluarImHmkQ4gAnQ6nTzRtBgGKlYteantJR5Csky8myAuxzUoMLf2XYgPPrmKkBnHL
         pZG7Mk/p5XoLKrx3RgZDenPW/aMVQhD34dNz7loRf4T5c9713SsupJemgy5qJjx6lVpV
         x4yONet6/ATHBJWAG5KNwdDBI8kNOrZKEK8MemUNriAlXx5L2sK2N3/n1lvSRjat7Zd9
         Q9LWP0eDc6oqu2wuig5n/i1lWX+vMjdE/aG3mBltV9rzmBNtVnIDL+meXf5EyGy/vLh/
         SQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618748; x=1782223548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UgIGSZvL4pwGhTtVdZPQ2gca9pBIPfHY+k5s1E36o8=;
        b=K4t/7Z+2YpNdzuwTECV3833Xe8Qd865w6InEzXbKTg16v6l7D2ksQ0q2cdCDEI/ndb
         EHKormMfSvHj/ewF7zBmws6qxyiuVEKiCNIphg8NelL0qNKPtnsVFCzt5CrkpnbPK/8K
         JDa5oUf1CbWlDxnK39rs7BvxrYb/vdQMBVQZhT+Or3+MfTSBrS4HCwZQdX1QjnxaXu/U
         QkMYjxUe6WsWFTizVtEZvTi5PUQE3DRM49ct6lYhBTcOY3D4+T3MMUR1kxNHFO9zhvUs
         IB5xZqdH3VW2JcOjSh0xbs3+bbc1DcygEdrcureeOnijup8mY6mUeza+o3nnPDSA9PFj
         TuDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7tkH7Lj0CRt5rOTpla0PbUwY+SQVmxWNZWUNPBo9uxVLG+hl4JIx0ab4Zor2ZP0qXGqzFF0MlNM+CW9TQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzSG3zEX8rHg/WDBPn8uY0KsQSApIi5jgaVPo+PW36MBi20cX2i
	Ok9IPXT8YxhbX+QVv4bMyBqGFgR5PysFmtugbOkEOvaLsh0z3/OQtMxq9N3hv1QElmAJENHDpcz
	2ix8AmrW4b7vvB09eFPPeljKC+XZIQrg+JPlPJtujiKAf/AWxsHE5YZVXXIq01FjLJbuGLT/Y6b
	bx
X-Gm-Gg: Acq92OHCvhRgVYw7/zAi2EFfsBbqxn8Tf5c4Xr1d0nlq8GdqXFMdKLIJaeNNt97m07D
	syS+dHm2QLvfqJR4wqkVVJykpkEah1qy2XK3hNVktfBhy94Gga2q9vI5M5z69DtNKxCaWICUIGq
	rdH7iooaJ5RaMz+QJIdJwytiijizxmfMmMBpXREJZAl+wWtTJYuJ+pHi2gPljI+6G0M9aSGbMQJ
	VBBlc8S0+ExQvGS28S83bg7HsCVB+N7f9vfIPPBj+GfG0i0k3pj5MY+OosAK0vupQfH6Wl/7Z9o
	AG42TF3hKgtLH89xniVM4smqYGl7MEw0zkpwG2WuO7lt0XBtOtQb83eMT57ubltwisy+zDfQ9QV
	pYqR3ZelcKN/2nDWzps3oAsZRstBuSrMRewtB36jbgyRSSw==
X-Received: by 2002:a05:6102:f07:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-71e88dd8cd2mr2916785137.6.1781618747873;
        Tue, 16 Jun 2026 07:05:47 -0700 (PDT)
X-Received: by 2002:a05:6102:f07:b0:631:2be3:b6e8 with SMTP id ada2fe7eead31-71e88dd8cd2mr2916747137.6.1781618747389;
        Tue, 16 Jun 2026 07:05:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe5116f409sm620047966b.23.2026.06.16.07.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:05:46 -0700 (PDT)
Message-ID: <1bbccb16-b91e-4116-a4cd-213a46978fa1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:05:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
 <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
 <ol436i3oqgdns74dliw72qns22gqfgygm6qkz7mo4g7oiywlsg@johrhdyv4rqx>
 <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ahk57lEoWQtkGsJt@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfX1vYNa95yIBtr
 BX24xiic0Fa/jhVQc+WNbOFRqUI+IrlFQx8Ch5Ch8BGQLMgJDxtJTID6p1hLjxyGwR1+8UP9XQF
 PHieh0VTCs1ljQt1kJnEXdgLdWlRSvHYLz7bhLIx1db9kwhgyR1pt9w0KVmjzy8Ie8Cx1BFCD9g
 NBGDdClqgVpMM6w88/+yrXMobNqFUJ4y33RZi4E6lViQ1ce2F4I4XJHhk+NJWz2PTe4l1k+KkMQ
 Zotjo0TE+RPxz9NnxE5875wSoSLUTaEnZc7GJDfGDWqcbKmJm5vAm5v3jyGXHRvjYHmzE7KR0XG
 TgdFPwK2/xrDnFopgHGnG9BJVH/GGjc7blzz6P6nwSxU65Wbey+tdv2/1IslG8v/DHwzxiipZDU
 HBPPmB9ZOoxdw5ExP0+WC2Fa4NzqBG0fWMf5gLghyl52OqzFGaeyychB4/7Ej23K2nVO35jyvRA
 u79677vWQx1+MYANPdQ==
X-Proofpoint-ORIG-GUID: Rw8REgsxCyOYqVbszt9L3vzn2Qz45BhU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfX0xiX3phWcTk3
 bTDAfxcqKLdF6grw4IY4gWwzuFxd7BGZI6A+ahrYG985tOrJPZtbBwnCrMKGD38XM4Jpo8Jxywq
 f6k943Q3/vMGdo65KDapR1BurSQB0Ec=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a31583c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=w-i5jriU0KAIvmwf_0wA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Rw8REgsxCyOYqVbszt9L3vzn2Qz45BhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EB5D690454

On 5/29/26 9:02 AM, Qiang Yu wrote:
> On Thu, May 28, 2026 at 04:48:24PM +0300, Dmitry Baryshkov wrote:
>> On Fri, May 22, 2026 at 04:27:35PM +0530, Manivannan Sadhasivam wrote:
>>> On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
>>>> On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
>>>>> Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
>>>>> under a single DT node, each requiring its own pipe clock registration and
>>>>> DT resource mapping. The current helpers are tightly coupled to a single
>>>>> qmp_pcie instance, which prevents reuse across sub-PHY instances.
>>>>>
>>>>> Refactor __phy_pipe_clk_register() as a generic helper and reduce
>>>>> phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
>>>>> qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
>>>>> mapping and pipe-clock setup that will be shared between sub-PHY instances,
>>>>> with pipe clock names parameterised per instance.
>>>>>
>>>>> This is a preparatory step before adding multi-PHY support. No functional
>>>>> change for existing platforms.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
>>>>>  1 file changed, 44 insertions(+), 32 deletions(-)
>>>>
>>>> I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
>>>> end up having too many single-platform, single-device specifics which
>>>> don't apply to other platforms.
>>>>
>>>
>>> I don't think that's really needed. This shared PHY concept is going to be
>>> applicable to upcoming SoCs as well. And moreover, the split won't be clean
>>> either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
>>> driver and may only end up keeping very minimal code in
>>> 'phy-qcom-qmp-pcie-glymur'.
>>
>> Then splitting makes even more sense. Let's not clutter the existing
>> driver with too many conditions and options.
>>
>>>
>>> If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
>>> move the SoC specific 'cfg' structs into a separate file as that's what
>>> occupying majority of the space.
>>
>> No, it's really the 'shared' part.
>>
> 
> To confirm, are you okay with some code duplication between the new
> Glymur-specific driver and phy-qcom-qmp-pcie driver.

That's a necessity, to some degree. See e.g. qmp-combo and qmp-usbc 

Konrad

