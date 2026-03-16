Return-Path: <linux-arm-msm+bounces-97915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGmCMPbit2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:01:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 652CB29865F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E79B5301F9B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6E13909AE;
	Mon, 16 Mar 2026 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKa9B2de";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDxmykEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2121FF38
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658596; cv=none; b=Ekn3iqQZe7mlZtRZBr1m+ZlJX2IrHuri0VMsfUNxb7EU/eAT4VhoxtXPNSu5z05FgqyEDnkPqtOWmAwMkgAYKs+6oGj6Te8NayXbxg72QSPMPm9l75I9WPM+OBv1g0UCQnd8i5oK4oYVpOizMyxrfnZmgaTNz5zXlIGj4sK0xN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658596; c=relaxed/simple;
	bh=hXzTpM2Tf9bjZTy7Ife+OSpt4rnqkBMKo0z7sfLlGCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9U3ysliBmhAW5vgDD73zEsHcSIOTa+lnuIzGeKie3y3+3hfeVFlp/w3aiNcEdL7JT150Ae583vQhmbVXkqXn3hcxxX78zmfOp16WSUwTtdjJAY3uIcxq3op/v2qdXzhXiqFyeGDKj6hK3oCSnVZV1JSRe261H3qzsdwwjIHrv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKa9B2de; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDxmykEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fqh1282126
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y57dvznnesnOFOCEA9bp6s6C11GTzXM09NSfe2xDwPY=; b=fKa9B2de1JYD3qvS
	RbLtKpYzukeQc/e7BgRUeP4Pih87C0429Ay96fhnm67BWuy1SRDDM3ksmNiW6Oev
	C9NKEI0xYeWyIGKcVMjAxwsOhTQf3mG781FeSIkKnUjYSrrl/JmzRVTu2Fr9i4wE
	mKjknPrxsLQ1fkyCBJwewIS29wn0iVIsrwikYpyf5Ck5Z2OIZBNNICVYKokZM14N
	b9KXh9Uh/XKMGKYLL07I90l9u8fE5gcypjG/Y0+5ooUOLCwF1UPIfHtPwTecQ3sz
	f9uE3agoi/O3CWCiq5yoa9sPmIT8ZKhDXKDjbPPO4yNognxO6fpjSidsdItcu1iK
	pWdkuQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc57t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:56:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b05d170cadso6225545ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658593; x=1774263393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y57dvznnesnOFOCEA9bp6s6C11GTzXM09NSfe2xDwPY=;
        b=KDxmykEU2919/UQlrs7ohBnq80Zn2Nc8Tj088nULBsnvwBJEpX2zLAiVaheUD6MFq5
         QRzQFBKs5WTATTordkZFquJhMBnmMTYO9PzjM1lwAL+8VuV1O+n/oqLMLUsBsn/HbInw
         pOgFMN/amQvKJ20VAxao00C2utF5KModEF9C1LbXZRfOieVM6SDYMPXWJ1wbVhd210GO
         8CwbUm/qArhwdJBwK7twQuXnMr3UqQvdtf1QKRf+kAkgsjca3HtuigDr5ePsS7FrbWMl
         7B59BLYpTM/9KY/GnT9eQo2NqxkDQVcUhssnYj8mS9HOQVweVz7Bvc1zWhbXhA++08sw
         nxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658593; x=1774263393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y57dvznnesnOFOCEA9bp6s6C11GTzXM09NSfe2xDwPY=;
        b=FOoKvcMGG3+0nsP1USMiIa7hn/1w+hzYsHn+jPJctmO5+UCBWMB/BpYKdBCOOOnw9l
         QB63M5j0fpJdgzuLV7A+R6iF2sf5hrU0jbw+obZX6E0+Qm6PZHuQqk21IgZ/McztKVwe
         J6fXM+u6US0x+GkhSk/qylOJhtdHncmSiycshBv3V04skHpH/QB56ABuEmmW4rnjkwqH
         vc56UGM4yTC2IyEdylaR9EUOOb6UWELFZdIHlZArk4rywSABhPZCNB78VQFi97a+Fa95
         eEKxf9Mke9KF63AlNm9ML3DCWjsLapkIo7/UKYfdaVkhVxSyuAWlPWqzmOayrkr0fB85
         JCvA==
X-Forwarded-Encrypted: i=1; AJvYcCXbkKm0z6CKA0GESftAEJQkNxh+ogT71YZnRRvBHJ3f/2DpSiAJO4FsN0FkoiHwrB1EU32saV7FrZpb3B8d@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuFheBeg6awvnstUQPgkfp2w3xvYwmzHcChnDvfOhSoiMkGrw
	ZSMpurtEzvxoTJYgoJdR2kpNATnxN8mzdaEM1mRTpK6M1tpKDxylUI9Eg4QZAWXF4WcwDjYndsr
	TblveABTjnY0NcgQWpjlc1fDbu/xteuZaWnSbFS1eW/KZed3zGlDKcb2ChIfwVUekGofV
X-Gm-Gg: ATEYQzwmxMfdzg7EW4qxVx0HBzoK6ROCh+tBb0Z7WMcCLtRS2ZdR0+0b20eoRM3RQdM
	1m9MmUhVi4tOxPhJt71flgSuzhshJrp6sU+uFxgn2EzFx7RZpAyhUVbCvz1QxAb/FhSJF9AvwjF
	0VXNTCpT6yGFE9AxxTUF3vbYL9BB6qprEg4KYCINrVDHtQab14PR5/wAQkYCd5RgX9vv5+O29vq
	lKNVFHwiRM+57ERLv1ob9YYCIAUnkkwlgIkL7/OMH7wygZYIY7EnR1dO3D7vseHO3om4FEmdIxC
	RGuorZ50Q0+DY9lxezFdbEMFnrgfqVQoc9JHUq3Zi3rLdDe5+2tUdp48+K/a0wxqFZPNE2EfFAF
	haLuNpgipDvgNxCxZ26VeSj10dThz+xBNjBRJDcIbWUpgOuqS2Bk=
X-Received: by 2002:a17:902:cec2:b0:2ae:4a6b:68ea with SMTP id d9443c01a7336-2aecaaa88damr134743875ad.43.1773658593395;
        Mon, 16 Mar 2026 03:56:33 -0700 (PDT)
X-Received: by 2002:a17:902:cec2:b0:2ae:4a6b:68ea with SMTP id d9443c01a7336-2aecaaa88damr134743655ad.43.1773658592934;
        Mon, 16 Mar 2026 03:56:32 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05b4ca68csm21200455ad.79.2026.03.16.03.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:56:32 -0700 (PDT)
Message-ID: <48daa237-aff9-45ef-919e-665e5ed27f66@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:26:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: crypto: qcom,ice: Allow
 power-domain and iface clk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-1-b9c2a5471d9e@oss.qualcomm.com>
 <2ac2efad-3533-490e-bb42-f21c4e950277@kernel.org>
 <a2d6c630-e4df-4cdf-8b10-64d87d24bf8f@oss.qualcomm.com>
 <b2d852c4-9f52-4ad4-a916-ced19c599938@kernel.org>
 <972bd9c8-4671-4151-a3a9-d7eccdf83913@kernel.org>
 <fc3d1ef4-1a0f-41d5-a742-81305ee7f521@oss.qualcomm.com>
 <87fe32f1-b2f2-4b9c-9e54-03be35c921f2@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <87fe32f1-b2f2-4b9c-9e54-03be35c921f2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7e1e2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fxH43373OejRyu7CQr8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bHK7X9a9GBXX_W-7bnWUaCO9Tpzpc_9b
X-Proofpoint-ORIG-GUID: bHK7X9a9GBXX_W-7bnWUaCO9Tpzpc_9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX5rlcpQzs2lz7
 96cCxFXBsszIwrTj0Vwsn8NpCYP1KBWohSurt/+KNuKqI12U1wb+o7S9f3Lgs4dgkFtickXBfVy
 5vcbr3gaKzR2AgdDKL/LjJofSCzQWd/zZGfvC1jgADQy/O9Ep+OWg7Ky5CdQZJhmth4rPQc7s+I
 5WdP5oDCM659tTMx4SjHW/x37TwU5bDbHNnCZGHlHDurp6K1N/piigJtGqfipXRxHgrbwNjgzqp
 qL9Tjaevbq6BiSresDFSQmRw6eVCm5Kh446wkYx+N75zTCEGa68BAbhPvuzW1Vll9GnLxLtuPps
 /wh2CNh8v9YUTC4fSErZrCuuGJSNRcEz1grLi5+1wfbXORA3zNDRDPmI4Op1pqXvf9lf+f+06v7
 zjpX/EpM+FZ2qnnGNy21NIToVmFgpIGNK265Q5DzXZ5pLZ4K4aWHtwR6Zm44x6nlyg2pPTPYzoT
 GIk3ra1JiGo+SjRBfEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97915-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,oss.qualcomm.com,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 652CB29865F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Krzysztof,

On 3/13/2026 9:28 PM, Krzysztof Kozlowski wrote:
> On 13/03/2026 12:45, Harshal Dev wrote:
>>> Except new devices, like Eliza and Milos. And then this should go to
>>> current fixes.
>>
>> I'm not sure if I understand correctly, do you mean to say that except for Eliza
>> and Milos, new devices need to change their DT binding to 'required' with
>> corresponding DTS changes. And then, the patch updating the DT binding also needs
>> to be back-ported?
> 
> No. All new devices must require this. You only preserve released ABI,
> so fix unreleased ABI (Eliza and Milos) now, before it gets released.
> 

I'm already being annoying, but I will disturb you one more time for clarification. :)

By saying 'fix unreleased ABI now' do you mean to say that I should add another
trailing commit at the end of this patch series which marks these resources as
'required' in the DT-binding without carrying the 'Fixes' tag? Specifically so that
Eliza and Milos carry this constrain.

From what I understood from Bjorn's comment, the DTS and ICE driver sources will reach
from different trees and either could be merged first. To maintain bisectability we
should first merge this patch series followed by a subsequent patch which marks these
resources as 'required' in the DT-binding along with accompanying ICE driver source
changes which fail probe when 'iface' clk isn't available. Of course, the subsequent
patch will not be back-ported as a fix.

Many thanks for your time,
Harshal

> Best regards,
> Krzysztof


