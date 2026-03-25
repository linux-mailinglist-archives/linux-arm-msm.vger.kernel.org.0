Return-Path: <linux-arm-msm+bounces-99882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOA7CVffw2kgugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:12:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3619325839
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 14:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C10AC30FF96D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5CF3CF69D;
	Wed, 25 Mar 2026 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnEekR8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AotpVWps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D877F3C344E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441370; cv=none; b=tRM6zD6R2i41ejTt1Uwq2lSjL83v9mLhC8ExViD7Cl3vzNvXykoLZ7GdrWR746Kb2uHR35Z3IacH4r7pAiDCGi1P7qMidpqZobj91n3c6pk2RVviZtZjPeEsKZQ4kUQdvYdAhgIrrW2UeLBqbZz8eUkSLOvnAE9xIS7wJiKAT/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441370; c=relaxed/simple;
	bh=TMCmlT4lKjvdK6c8V7F2YZZugxH46iQSzcyJH6JlULo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoiNRdtVc6rEjVwf/FWQvD5kGSCqNgi7WaNJ8ftsKtZdfiA85OapWQVC83IPIrU9ucnzC9QDedt8ABB/enhZXApe8EkkJAmctVfHb7NlM4kMuVhmvNZHJ/k0am2XVM3vr1Wig7F9Q5sRrS9NrDnVptfH148wh9SgMfkNOwBpCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnEekR8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AotpVWps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG7fP2993666
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NiH8h9FCcRDmHsbMCo6PaEBlTF7I4rvPIJvh7gacFE=; b=FnEekR8YsCA18qut
	VRAlxXzs/fDwu3HCeG6YQrfeofTBVu66zROcFaT1ZDpKBdB3hpUU5n6VUBMopYEl
	wxcrXWw713X/575rL/bR9+fO4mF85iJFO8B4jII9DNvoOVwGrtWJnj+1S479fbAb
	ZZYhNctx3+rbEvjZLeTPdVqmlLzqQAH1TkEDfe67+FA6yzA1OWMxPxzUXcfZNfT/
	0ubNWF53KgDd65TVk2YiHN42PgLEFyikj3mNXyaedzJKm9ch+DxmWBjtpkICYjjV
	HUHbH872Y1K5pl4ULB1U1hzQSjiWNK3KQu6yW0pLil7IvvHA4i+/8dI7OvHuqvyh
	xtaoPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4gcnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:22:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cbcb48003so8244996d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441367; x=1775046167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/NiH8h9FCcRDmHsbMCo6PaEBlTF7I4rvPIJvh7gacFE=;
        b=AotpVWpsf7/ICSO28BoW8zs2Mkg25Wlwl1hnQx7yPV9MnFuIuFRCEtNILoNSWUStvU
         7Z2jj2+lWKLCJAm7BZvwa6SPOkZ/G/e+guS7CNWIrM6Qp16A75GvK45bRUlqQYxeBI9R
         t+gSQPE6aT/fya52HFIu50XPIvzMQqVy0wEWBtDo16C5Tp5bEAlJtHAVMK+DyxekIaSs
         J2pY8DiIID7J5jhBGF8pojktUx1uKDhXnp60sT1K1d/eOhtcCfZ8ag7gku7XWnHMdSQI
         rRSo0pn8UNi0dPSuZxf5jmAc2r2pkcedf9+MpNe6I98MVNjKYAqp6lKPHR01p2g0z0LO
         AzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441367; x=1775046167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NiH8h9FCcRDmHsbMCo6PaEBlTF7I4rvPIJvh7gacFE=;
        b=MvxO5dvnZ6mO8lCVd8YLZeb7YaqFC1bnrlDoPImbPQU98yBbZiwAB49t7tKmeGa0Uw
         lSMiuSp2kYBHcXVtbcR2YQQDbDo1Kx/+rgxuGpiIJDUXiUNxfXLkFNE8BacVfR4qi3VU
         P8ooOpB+Cb7kCqFWVLj02EXfRgI7yj70GpSCFAOf/o6vaXT4Bfp4W5oV8zuJx600JpMB
         hgKUOeSbs67z4yLFXUCep1PfYaGlqiydnxKS7gchmvOOs8a4LH4qKJXhu4LbsJKgnj9j
         cIkck4ssI6D5bJKTFil4TI0GU1UGzLk54WLxzhVSLlr3Glf23XVlwlMdFZxcwi9kyj6M
         rs1w==
X-Forwarded-Encrypted: i=1; AJvYcCUq4SYd6o13D9oMZB7+9opYAP65dSzofrt28rPDdPbwKhbEebi3n//RLSrJ03RGVDB2G2xUoC5VCvOyO8lR@vger.kernel.org
X-Gm-Message-State: AOJu0YzybknL19ksJQPwjSIio9oLnJAsC3j6+KK4xZ55CT6C5wuKnEI3
	FP4KuuEVSJLnFbZDxDZpvPPEov0SqCoqV3ogSPQBJ4mc0arvBN5ObseE6nR6rGjrfIbdALHRP2a
	VacTnIBquTIik+lZHUSLJ7Z0D/dwU7Os1miJAtv8q7R7ePTVS4a0Xusgif0xeN1US8POm
X-Gm-Gg: ATEYQzzVtQ/MH4WdywjPSyUWiLUPTOazjGUn/a3MLqY/GmxQdtFG0zWETI8ZJRq2u6r
	QW1D5JLv5TXKBCnT8bTEeCsTAF6NbBos+YlJn67shzGpCdbm2/rjtz6fFcx57+OfiY/816JxogH
	2jUvErdUG/xdcw2nCreRsCJ5hryDDvxtdmByHeJR6KjKr6LuTZbDaJ5cExnHyEJWBEMo3qhetwG
	X3baiM5EsVYluNbNCz4O1ukbqpWDz5fQdagSfhyzjeKkQRVyONV0EnGewUULQLWIKVKl+tkolRN
	IMVdecupeiqBYdZyIBlQsufop7h0a66LzaCraRAp41Wh3ade9jkZDQqo67uSG9x838rPtxLclbN
	xl8nn8kVkFhtsK6bZuk75FRJIBGIGItD8tRzEA3Iak6y5wj08qkovBeJhDB6I3KI6JFN9gfQs0r
	kvvUE=
X-Received: by 2002:a05:622a:6a08:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b80f115acmr22935681cf.9.1774441367220;
        Wed, 25 Mar 2026 05:22:47 -0700 (PDT)
X-Received: by 2002:a05:622a:6a08:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b80f115acmr22935561cf.9.1774441366798;
        Wed, 25 Mar 2026 05:22:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66aa65a2be0sm204618a12.29.2026.03.25.05.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:22:45 -0700 (PDT)
Message-ID: <e2060a91-e4e4-4aa3-9c72-330880c3acba@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:22:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Enable USB OTG on functional
 Type-C ports
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260313-topic-x13s_otg-v1-1-cb2e4a08e25d@oss.qualcomm.com>
 <y7sxgdmxdn6fthnxkmhs2ja5hfw2mtbdl2zfqkfocn6pwnwxq2@cuoldngtvuht>
 <0dfed5a0-1c07-4e7d-bca4-8183e44c3ada@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0dfed5a0-1c07-4e7d-bca4-8183e44c3ada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4OCBTYWx0ZWRfX9LYvGv0qB9E8
 xnNB3LbuZuKpzW/tar1y6rsTzoac8dGfrrkCJ/Jr9zLzXfTPt2itGnkcDjF4iJufUB1sE0DQFf/
 P/D7295hiKPo5sPL+tudA5TRx+TTiW+yRbK/nKv2xeJ12V8IzhvL1BIWmvb7QvSclGVs/071U/n
 JrAuM6qfiBYZiWN+udwRxOBA8u77nWLVBeJTKp/iDQ0hIy7f/QEES+V3X9i0B1lNl694EmWjpxE
 4SYY3+bhJQ1un3So/E+W3xJFDN1PdZMcH3Lb2i5IddCpHPHJ+H6h9WnS5j1xj01twAvJ0gZF7op
 3avd4L1m952obS6RihTkiDoziwH2DC9q3SB/R9ZVAqPQYshZ5Y+hhF/FI1TVhQd3eU95dmOMNYn
 qKE2mKAvKvrk4R8eTp/mjPMnXhK7ULtIE1oFS1RQYAPztdmD/JYxrJhJcbpKhdXZxaq0jcKS00O
 f2G/5gR7AUa9LjPzdZg==
X-Proofpoint-ORIG-GUID: qoHSPD1nU2UjlYhgDra48_tmZBhZrLK4
X-Proofpoint-GUID: qoHSPD1nU2UjlYhgDra48_tmZBhZrLK4
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3d397 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3FMUunFS8DJlY5xvwZQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99882-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3619325839
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 3:45 PM, Konrad Dybcio wrote:
> On 3/13/26 3:37 PM, Dmitry Baryshkov wrote:
>> On Fri, Mar 13, 2026 at 03:08:03PM +0100, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> The two non-multiport USB controllers present on the platform are
>>> role-switch capable, so mark them as such. They need no additional
>>> plumbing, as tested on the X13s.
>>>
>>> Enable OTG for all devices featuring a data-role provider in one fell
>>> swoop to prevent hitting the edge case where UCSI code would time out
>>> trying to get a reference to a struct usb_role_switch, which wouldn't
>>> be registered if dr_mode was set to anything other than (the default)
>>> OTG.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 8 --------
>>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 4 ++++
>>>  6 files changed, 4 insertions(+), 40 deletions(-)
>>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Unfortunately it seems like that while it works, it makes the x13s crash
> upon resume
> 
> It also crashes there if we flatten the DT node and I'm hoping the solution
> to that will fix both, but we have to hold it for now

More details: it's (again) USB_0 causing the issue, and only changing USB_1
to dual-role makes the QMPPHY phy_init time out upon resume, without a system
crash

Konrad

