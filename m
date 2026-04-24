Return-Path: <linux-arm-msm+bounces-104436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNT0N/pM62mSKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:59:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D745D6C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44AFA3006F38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6E73939D3;
	Fri, 24 Apr 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bbv8eb4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVoUOVON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8CC38A72C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028343; cv=none; b=K7AT/AVIvjtA0tg+AVzZxb44iq5AF52pwLHIeDe23KzEN0xlGKstNru01UNPOVbsYxMyWBl1IWL/+LzWtOMz6s4qrGpjSwIkdNHnnwvuI61LZvcXVkG94go5lLuxPnEDlySXANFipb/zLbKXq8HsKASIMzD4J4TsEwYFZWkNul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028343; c=relaxed/simple;
	bh=YKWVo4hTTh2VVnID18YaPKZMYn8hdTJn/00Ifsbtxek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqB0EX/lKVC/Mx/h+GtZdOqWzOBDSZAKvXLptFYMDwSeylUK8z2uR/ZMwiiQgnibdtF4omRNKZWz/uPUK1cW3bgvyVldLPGvfjcpx5B13BwLiWm146i30LjXixPpk0LdZ/7RyhMMLBdjsPg5pdnOPSFaDHPfqRUVhgwa7MIlOPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bbv8eb4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVoUOVON; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O86ShZ4012120
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53ASJo1GxCRSOJhL4iV96kkrerGgRf8DfIhzfgftXTg=; b=Bbv8eb4aR4PzFDVW
	hrnB6W5hD/XfzoBWLEGDhbgX0bf67OPnAlaWWuo3HNYFCWI7FIQI7hD7mTDsHMFM
	YBgztv39+nm7ngkigwPmx24Y79MKgUnAe9YvxkoDv+X2NBfmZ8TVmdXftqLkXBTt
	KHo+tcaNqapDVTtflDcBWz3l/+dhz3U/6RWft/wOQyCDCDvR4I9VuNHktF1uufoS
	9w4HMVZcLHwY0GJTlwK6Zma2mxwI2WouWq5axKJpLYp9dn2xiybXtO4jPYJW/stf
	2h3DmiNI5+mE9lfW3lYM57iRntvHCf6zJOBCfkO7NEGdSXBsLnbghwXXCJF9n+1w
	yJYMgQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9v0p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:59:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca5b32b89so22403986d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777028340; x=1777633140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53ASJo1GxCRSOJhL4iV96kkrerGgRf8DfIhzfgftXTg=;
        b=IVoUOVONkQE+TDwX4tmMOrTp3W5vfIC1F+7M1y+KztIFKJpzKu/r4ZV9YlB0n17CKM
         xn8SriOWJ5EIivKb0fkxYtf2OFs/FCtEgoXODwkkeCawOiBwfOGHJZXiufwi+I5WyJrw
         6KNOaM2lpxxuqIraZ2jQHOyK4LJ2PBnzG4I6hbsIEsN+q72kDUXNHKxacP77G+adeDAE
         u6JrF0Lqqz7ZvZxcedpZJsYQUy0nbJ1NnLfdfgR6l/oMgwzJf4pNcN4qcbtpHuRud4xf
         ZHTj8qOrb9V6GB/9T0a+Fo7BO0Evzli82BtGcNSKhUcS4oWLBX1Yhw6+QRY5InIoNj/Z
         HF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777028340; x=1777633140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53ASJo1GxCRSOJhL4iV96kkrerGgRf8DfIhzfgftXTg=;
        b=WwUi//EB4aEzGsg0ZyGF37izu7LE0qOt3nnRenaH1nuIw5mVwF899qWzwVq7Kut9o7
         bYSwFNr6euC4PNXqbhUczOixo749K2kM5UZFObeSy/QceYHtXTiOc7/EUV3oOXn5L3sa
         tJsnve+zEfVS6Ufh9UYiZRyUXw9n7qKwnSG0VMMaKmGtn0JGVJPhLa57O9DGMe3MMd4K
         7IZoG+OIseXjX5cC/rgGccj66AqdsDMKJdKza2zWVvRO9t8j1Y2H3XjMBlVbKtXHbUTM
         rRYm4xk2RMCawqGztfVfYhCnzKiiVuNIDTnZ8ytbDlDb/MHgCPadairgpb76Qbat4meZ
         LMkw==
X-Forwarded-Encrypted: i=1; AFNElJ+SxTsEbWD6zzSdRc+goDEejUM2qdz7Wz1S2GeMEh2iTAFqELz/YM1C/yG34t9tkputx4TAU6fs9mK3D/2t@vger.kernel.org
X-Gm-Message-State: AOJu0YxPIbjFwANpQSQ1X/7GqjbrLDZZz3xOV3HvVY/vjOcsNm5gJSLc
	kCKM7FrzoUINPaDx9OSaJYDxDGDijOqlzmiGn3PA3tdcKhMw+LHr3QW0pIJOjTkE7kxVtMEwtQC
	YeazyfN3C0ZY19SB10YqKNPU7+ZkQ7eNZwCFiQoj6g3259Q2POHNKZDlu7nQykb/fBS7t
X-Gm-Gg: AeBDiesrIRyzqR4sAzn328uVwH85zHnIyYSVVVFI7ZEzzbOPqTEcBqcnO8A28QVkWhI
	cHRAbLIPWdseh3xU8G4KrtX7+CZlaO9QCus91kpZnqQ6oI0SQVep4/AMtA/3YrETfm3VshBcxNM
	tAkA2RVwOYP+5CzF8EPSMtVO6ZZLjBaEoF3zLWQKHX2z5P9f8wHSzr3qMaavImMy/rIDcJxESXD
	NSS8QKpwo9BZ1UXwpeiytU7H6rarvDMiB2aDlWuK2vYXssvCgPws4OFA+1DqozfaAPTDVl+rmXS
	NgyEPtJdANGPYkKrH1/12tw/3Dh0CDE0nZbibRd6eXBpL1Xj7uZl7BSQEAMhZyfLuZQZSU5YhXZ
	R6Om5uHqPXp9pP1jDDcZ6Bkjr6xP0N5NrDrAuva3aFZ5H0mAEpXHfnekemTBpNqr0WILJ52iXS4
	yECxZSHeOB3pCBbA==
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr343234236d6.7.1777028340466;
        Fri, 24 Apr 2026 03:59:00 -0700 (PDT)
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr343234056d6.7.1777028339983;
        Fri, 24 Apr 2026 03:58:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e26sm772516066b.8.2026.04.24.03.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:58:59 -0700 (PDT)
Message-ID: <22b97f4d-ea71-4838-98cc-470dbca728c6@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 12:58:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] phy: qcom: qmp-pcie: Add PCIe Gen5 8-lane bifurcation
 support for Glymur
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <42a9dd4d-eb96-42c0-b836-dcd7cb9405ff@oss.qualcomm.com>
 <aaqdv7Zx5AODzg6P@hu-qianyu-lv.qualcomm.com>
 <fb75023e-8fac-49c1-a8b7-2eb8b70fda3e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fb75023e-8fac-49c1-a8b7-2eb8b70fda3e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMyBTYWx0ZWRfX0cS57cBgZavg
 nTFaEb50dGkhiAsIUkstPci+48Cq0hmtenCwSFDojzrRLN/efSqKDQDlqLRmrVKwN2dRPkko8yT
 Om5bNDfMmYUuVu+J1U517Ct4gcBJUMAFJc+gy6H/n40oWOVuCBVA8fc6Znbw20e7canYoCdNK/8
 bfY/iRXM3vAyctajsz65f2LSfdFi1GUlQGo1eSiAIdb712E0XP12wDaUtEu1yiCAtepE1AmXh77
 522aPOitWnAHC3lO08ZNM4/pMdjisqDG5gYCvBoSRS56uMiYUiK/+yI4vV0GrD8l1fAzJ2zAChI
 DnmiPrcZl7QCMVYPfwvjtfzrK8droPOD0Pn+IyWFAHWhe/87G5ST1UgKn5XMDuJ86/NrRkOsG7j
 6QPxBwuO9ZsVYUW+t18uQoUm9hZbRK6IxRvkPQm6WCsC3Up5AE/5LnI5b9obXCJl2Z2AXX+Z2AB
 zntob067/wiadx+admQ==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb4cf5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Btiq9F5UgLBRDrkW77oA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: IKoTTikNvsqDuEhsRTnuA7NOVhcjVCCp
X-Proofpoint-ORIG-GUID: IKoTTikNvsqDuEhsRTnuA7NOVhcjVCCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240103
X-Rspamd-Queue-Id: 519D745D6C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104436-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 3/6/26 11:34 AM, Neil Armstrong wrote:
> On 3/6/26 10:26, Qiang Yu wrote:
>> On Thu, Mar 05, 2026 at 10:14:05AM +0100, Konrad Dybcio wrote:
>>> On 3/4/26 9:21 AM, Qiang Yu wrote:
>>>> This patch series adds support for PCIe Gen5 8-lane bifurcation mode on
>>>> the Glymur SoC's third PCIe controller. In this configuration, pcie3a PHY
>>>> acts as leader and pcie3b PHY as follower to form a single 8-lane PCIe
>>>> Gen5 interface.
>>>>
>>>> To support 8-lanes mode, this patch series add multiple power domain and
>>>> multi nocsr reset infrastructure as the hardware programming guide
>>>> specifies a strict initialization sequence for bifurcation mode that
>>>> requires coordinated multi-PHY resource management:
>>>>
>>>> 1. Turn on both pcie3a_phy_gdsc and pcie3b_phy_gdsc power domains
>>>> 2. Assert both pcie3a and pcie3b nocsr resets, then deassert them together
>>>> 3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock (bifur_aux)
>>>> 4. Poll for PHY ready status
>>>
>>> I think we never concluded the discussion where I suggested the
>>> bifurcated PHY may be better expressed as a single node with
>>> #phy-cells = <1>, removing the need for duplicated resource references
> 
> DT requires strict hardware description, no abstraction for HW, so if there's
> 2 PHYs, then add 2 separate phys and reference them from the PCie controller.

A single device *is* the strict HW description here. There's a single
shared top-level set of controls (mostly in the "COM[mon]" block) and
8 PCIe lanes that are (roughly speaking) unaware of what configuration
they're in

This is very much analogous to the USB3+DP combo PHY, where the USB and
DP parts are reasonably separate (you can turn the USB or the DP part off
independently), but those are building blocks that are sort of just two
"front-ends" to the rest of the QMPPHY hardware, that process data from
the otherwise unaware pairs of lanes in one configuration or another

Konrad


