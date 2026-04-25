Return-Path: <linux-arm-msm+bounces-104506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNipHP2P7GnHZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 11:57:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D83FF465CF3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 11:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8F523011A71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD803939AC;
	Sat, 25 Apr 2026 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzUj1w8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kevyq22w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD98392C51
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777111032; cv=none; b=Ue7R4RLUeYZKvVbgOwqbLEqIr9MQnKuQFmNk8TVSwBiRftQy4S1jNkSFiM8j+ARC0xvbBURGytdAAnIGbDI4HundFSHLnj3GTXvxQaOC/xyCEdRXahnQL4FBMcsRTikbGDyRtq9ZrqB7YBbAWohRyfbGXMNUSHLmrvDlXHRiXmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777111032; c=relaxed/simple;
	bh=GZbR2ACVh9+gp+nilqqxNsrf904ahFQUCCu4bpKzwYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agYg8Z6Tj+RlBoV/LT7v/eC1/d4mCv6qT0BY/qGozP5Wr0PGv4OtNETywpXtVKCMsfNnsK0n9n786YOkunainOT4WgxPPc+OViLHXHuxgESFbGmBbPbjQ3OmpiA/kWIlSaMHM4iJQWh5KDz5K6qVDKqhrDnsdh2hYR6dMSzDAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzUj1w8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kevyq22w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3YlQK622705
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 09:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=; b=OzUj1w8Q2ssnZpj3
	HLB3WZSeCEilZsnigNWyXXkh2qTKpaa2IkdQCRhjOIUUAWvrBAqoSEUC/rQ9/4qj
	doNf0Ue666/ghX/bdSgXlNM0VGqXwWpU/D2bCrbQN9qXTw5SOzJmzjEm5wJidG22
	o/DuhbsmWOY2hqgjSysxpSkQg9ZvcjYFB1V615nULS1UvlujcZWe6HHD4xEZqG/o
	1cBWGGkWjxRTxn35TktvymcPnVMi1y5QtfzKmovJ8cgtjdAHoBjrp30TfspJIuGd
	B0KR7OJcUmVFQNklk3+zaIkkHMrtCo6kA0GE+k9zRO1L6nYxacv2F6QzfFmhJMA2
	Zd6KxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2rmj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 09:57:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9429f49cso10637441b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777111030; x=1777715830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=;
        b=Kevyq22wK/2NJzygX8mYwyb+npRGoR+l0DaZXybh+GxmHarCUrxbTUpS3LeCCuHDvx
         JyvUH/BZ9mHtBjlxGdQmHuaPNIwI4CP68SzLa6JsvlsxgV0DsdqZ63pzkZMMjBLzCoQS
         jFMCYPtsWjS5upnaFEC1ujg7/2lEjwNIKSq51Lb9jCYIskXkzn2CjzV6ub6WlRBOr4Yh
         tcVsZ+NfxqnrC8p5KAT6mZrYaRPb/kYX4DO6b861+B4zvY8TCVRXKKlZ7i1rMt0/wZVY
         I5vLrhv+1ZumluYXou2UTa8G2R+mUQDlY/XKiJWRbZkZ9WOK9INVsSCw9naHypL8EV7v
         rsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777111030; x=1777715830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=;
        b=FJJGO4lb1P72kTiSXKViQ22MwPTL/cCg/9ylKiNeWji00pVL4alGN6b/9CKFSa9zWG
         tVCu1Qc3iE/DdfGkEsAMQk9nkznkyaZM9snlay1nJvNbhUKvBitSsG6ub9ZhS0yQdDQ3
         p5U1OeFtDwwAcZWJ1C+aqoPZdnLLJVf9GUlvFKoV3FnxvmO6ds0B6C3Dfkf0ybNPdyB/
         eyZQJK0XPzd+tEq8rrbyRwzZZAnRyfijGA6OxzjFs4YcHKvht58aZcdOmdhJbejXF6fs
         u+0WN7P2S4DcNbQF2oYbCG130nn50KAIwU9xC6O4wKwIQ0aUw+AL7uDn8HiPRYzd/SmJ
         n5mA==
X-Forwarded-Encrypted: i=1; AFNElJ/jFQRfyfxzb4I8EQ7mbbDSzYkfsmmeiLPq9fT6OUuorGNV/T4pj5ZJ3ZokQcj3xxExol96bf6eAeGVedxH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3RWup1Nb6aSk2yVkeEqYW5viM3E7fkmoW86/M2DXX6/M3gN9
	+zASib0rcTL9xl/K91zid2bab9y174/n3EwchuMqa8QKzrmphE+/6COV/s4byuVMJFnJe9AlQeK
	nlXdxZiYM83HcOIUNOy6QynHydcaKn6nwCnsICLlabC2KVtVHbzXONxPMTFPRedL7WUFq
X-Gm-Gg: AeBDies7eX3Pu+JhIIgDi4Zl/NMIoSICQDCoN5+rjKF+C8QxJ2ePG7pIbyM2bndjMQT
	xk1kr6qqqvtAyG/rVk3giY7e9nNGjUyQRB1AjYJh782oUXtKc0OmUOpDtyyZWhTfTABU7WU3hKX
	WOZU+IH+4kj70/yAyXV4lbzvh1qhsM3umaVJamIpy2AGK33jjv9RUukfLAruqSfnUAR8+MM9bkn
	fYWIZR7QcpL4v4vzpJKN4JwTYFqDAtgnVEjYLsYDdxLGooz1FdSV4W4PUNZpF6WLC4fTfIAq+Gp
	ZnG1hhXO5CV38n3DjXlhLTR6I9+58HNkgdNw2G/+8+JvKxF4kGdXCadpoDvwHGO97XyJjqr88w8
	O/g5f0NGvyx2wFZlYXgnUt03qwACbL6hYerGJWkVZ0dpsrYwl57P1LEJaPSrr92wcBw==
X-Received: by 2002:a05:6a00:2da2:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82f8c86b594mr36379976b3a.17.1777111029804;
        Sat, 25 Apr 2026 02:57:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da2:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82f8c86b594mr36379925b3a.17.1777111029289;
        Sat, 25 Apr 2026 02:57:09 -0700 (PDT)
Received: from [192.168.202.18] ([106.192.38.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec037e1sm31035140b3a.54.2026.04.25.02.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 02:57:08 -0700 (PDT)
Message-ID: <b89eabd9-3d0d-0128-eb56-99ab2ead2257@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 15:26:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/13] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-4-0296bccb9f4e@oss.qualcomm.com>
 <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M7noxK1mFY_X5s9h--s2Z3DpHB-HjvsX
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69ec8ff6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=zt2h8jT1BUEQU1rgsTrZfQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=yXM0pRxr-LgjvrZoWBMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: M7noxK1mFY_X5s9h--s2Z3DpHB-HjvsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA5OCBTYWx0ZWRfX87zer1t17PJ3
 7QHVlHeUtK2Q4LTxvPjm8tTRtwp+R8XgM04BkQKWr0xVs7odxt5IU1fk/Up7/qpbqMmmK5YjsR3
 73kQOgs+OCuXmlIV7wAVAougcvqDJRUsu7j3zuTEvQirwMW3z4rvckqceXHsF0t3Hf72RYCPhnz
 cBT3w1FUFTPgCFjE6piPJojbDrie9lMGPeZcUHR3pxWrZNFHj4BqWqNjlgdwSnAJkt0w9M+DBU+
 z1DzfAboS6Oe7Jh+zdUz9dh+kpzDn0iTrfKxf83XuEPObV9aEEvTlPIrvu2p0Fjc+asBdSasVzN
 D3qYX8vHmWLGcJOvjC+yIGzGEMwW6iJWC3FIqFEVCSTOb5zo7DHFyeCijr8uncS0xNnEbHSTbs/
 og+CKIgVC+PfmcEgEzxzQjyDPvZVFHTNNX4WqHEZUONCF7GoGiFekyAs/NhLYgfxKXyS5gs3AYn
 5wX1HzV1SbTKa4wtk6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250098
X-Rspamd-Queue-Id: D83FF465CF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104506-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/24/2026 10:39 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 15:29, Vishnu Reddy wrote:
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - interrupts
>> +  - iommus
>> +  - memory-region
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
>> +  - reset-names
>> +
>> +unevaluatedProperties: false
>> +
> I think I commented around here but probably not specific enough. You
> miss here either reference to venus or usage of additionalProperties
> instead of unevaluatedProperties.
>
> If you intend not to use qcom,venus-common.yaml, then explain WHY in
> commit msg and switch to additionalProperties: false.
>
> Otherwise, you miss $ref.
>
> Rest looked good.

Iris glymur platform have more clocks and power domains, which exceed
the maxItems limits defined in qcom,venus-common.yaml. Inheriting from
it would cause dt-schema validation failures, so I have chosen not to
reference it.

I will add this information in the commit message explaining this, and
switch from unevaluatedProperties: false to additionalProperties: false
as you suggested. Will address in the next version.

Thanks,
Vishnu Reddy.

>
> Best regards,
> Krzysztof

