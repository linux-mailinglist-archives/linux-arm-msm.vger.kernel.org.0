Return-Path: <linux-arm-msm+bounces-105729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO3zN8uZ+GkAxAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:06:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1C34BD6AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D8B530154B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC603D523C;
	Mon,  4 May 2026 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHl7vNZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iU5uAcBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AAC3D7D95
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899796; cv=none; b=naPlzR6wTNjPol+44BUhKpBhCX6sh+aWWzaXb1QhbzA1NngO/32T/VKLfYvFsYEVye5VFnNN0I/sHJkUH0Mg8uMw2wfWMzs/ZZTchGwcJxxcHA1/QTMBI3bJWzbUVeeBad8DXq1gX+TaJEuK0VCaESFquL5+n7nNGXDvyZVAuRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899796; c=relaxed/simple;
	bh=wLV3QMhBysu5BU6gl2h7dYWY9fYB7rlEsLU9wG+Tm6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHZVBngB4/E13v56wTpiEs715dikhc05NV5ZOGA2MCgitDSrrGL5ajvVT7X7hgsDPZ27Zx/G4v22sKrx50LIDKKuYvN1KoDleeHxGUrNH2iw3qRuWSXkkXQXTWEanGJIo0axcKdxnpb1cC1imScwsxN3C3f9wTBsQtppCSLLWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHl7vNZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iU5uAcBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4DtI797723
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 13:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JEtCjXtga1JNt5qAIhY+RK9mEt1ejX7uidveVx9G9oI=; b=UHl7vNZqNP4lWzHT
	KGN47JRjFHhBNY4Yv4YRZAQNRgVVfujinGXupfaJzbiCkg5YG9iv9kSJ6qmaR7/8
	1HkmeZR9tGTRMNpzZTV3aG2nZtlrLLjmFfvfhdpPTBaXFazBbj0k7PE3ToeaFio4
	7fnf1VllbhqXWF+958Z3VaMDG6ad318rq66Zmn8fvkF55kMGkb1zEzvWNZHUvgGo
	wMF5/6qNLI/vvqtzPYMTSjQfvF/RLflh6+ROf8xT2pcSpZgKo/fO+wyXJjhl+qjK
	ReG4oJKI4GizmBN6eoGV/4q4V8rKv9/HmqqN4Bt+oortOBn4qaGkuYkYhx9pezw/
	9EQsQA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxnqy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 13:03:13 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-47a0421dd35so478903b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899793; x=1778504593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEtCjXtga1JNt5qAIhY+RK9mEt1ejX7uidveVx9G9oI=;
        b=iU5uAcBLqjENyO1XyKkSZ/1tghwhs60hI+M7xdNhAwuNTaSocG0514uitdxcf6w8+W
         IPcJ/ilmXWt4AxuSWBT9uUg/1Uf1CaiQAfpr7L1vwZkD6c4uieO4cTWhAwXY8LXLadDL
         C2HOtSvaqQDTa6WVkwLNCgfzn4FLaV4G/+T87s6Zpgd6M4E2Fi9GvQ0N3uE9QHpA3z+T
         WDCECNhV1U/iEyS1y/6DQs4Z5U8wSf1VMp9+A4FD4X3ibBjWxth4H5iEW3tgOat+hxq3
         cDiVqfm8PBK9l/XRXa4vjQudW7Oc0sQDa0hiBggbRHg42s/2jx41WHO4yE1ayJLEImJ4
         zbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899793; x=1778504593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEtCjXtga1JNt5qAIhY+RK9mEt1ejX7uidveVx9G9oI=;
        b=NPVwszjV9htf1tJc4LNfaBD21ZXrO5ZjoRT73/32agA3QmkuAT3A+alIzjpAtbd8/f
         aKX+GXyq2zeR66b078hlWd1J0Y9ewIMazZg05Heknc+ETgT6NgwfBmZr31yY4P4zMiEz
         ju8ihrA/S+zUIIVZqx+vY+h3hBPej4CReFW6cLeYvs5JdlJpEXn/usnPYGX6WbX2LA5D
         h+2sOHQTZrSfCpHsQENYU5lFeoqV85ke5alqLeqiawJq/IXWF2cWZmK9nqP5zi5S7RNo
         w7LlvmXu1uq87Y0cHNBXOQKopFN/gm79urQJA4Pu/CdoSUp5oI/rZ6m+f0olxnQIlPIA
         kzAw==
X-Forwarded-Encrypted: i=1; AFNElJ+BoUYRTLEtqHd/GeOUH2dauHmaGVi6K4XMwnmFBh2hxDRmujLlM6RfvqRTEGOa7XVNHUPkE849EWUE2Z6w@vger.kernel.org
X-Gm-Message-State: AOJu0YwxbodDXNxh80UoG40DjvVwiCPlJSGFaS8VarrQ3EfY/F9+f1D1
	+0QOg4LEmu091RDGoGsqRQpUv067yQWxFR0M1ICuNyUj4fkybazxOuBkiTGHcQAPJRUahwbNmuX
	WpTNs3BcT52eFqzp4NxjF/Ckmk0hxPtoFr6VzyuTO8CKL1XJsXBxsu1TfSH/+wunJu4p6
X-Gm-Gg: AeBDietvNLxsr5hbzIbr/9t85fv8Yr1f1ZZ6e2lMZZJaS36GMRd1JP20nLd9sF/pjC5
	93ndkQuHuYL60XPMa9Q8sbQOStHvtWHUylu5te2Q1vfC4uSN0TzVOVizaU51CSVT5SXXHrNf9dZ
	Ej1AniTEBS6OXqEOL1AM+CysJogGFH5Z4UxDsnEW7ByQKkQKnvqZxCEF6/5IkNzCNaDrosy/7wt
	/PVg/zUmjauU52WPslOH3W7t6Otlk1KNnmHKuwk0fUg0NX8siAFOi+nniIpQR4TENWycF097SKt
	MMfE9H4VM+uris4g2iE3xn5lMFfjJ868qHCxTLLiPrvveqzcMqbNWarS3MfLgo5LdOH48KS9f0p
	4m0QNinEnMHeIs7DFWK5YdClWsyadxS0WWcXwLsUYlI4WdzfmCRXq8SHj9v8Zmgg4zwTFcQau66
	j8c0GxEuM4zKMc/w==
X-Received: by 2002:a05:6808:1454:b0:47b:c013:1519 with SMTP id 5614622812f47-47c892ab898mr3025066b6e.6.1777899792924;
        Mon, 04 May 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a05:6808:1454:b0:47b:c013:1519 with SMTP id 5614622812f47-47c892ab898mr3025007b6e.6.1777899792329;
        Mon, 04 May 2026 06:03:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28ef8sm3353612a12.2.2026.05.04.06.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:03:10 -0700 (PDT)
Message-ID: <7ca11333-3c56-43a6-b62f-9e93b0f5df13@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: eliza: Add power-domain and
 iface clk for ice node
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
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
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
 <e9068e98-1d6e-4cb8-8885-aa5831407b3a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e9068e98-1d6e-4cb8-8885-aa5831407b3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8xyvHOuHi9T04gqigHFmLTu7Y9Jjk_17
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f89911 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=YGhfrQ-tf-JdS713w1cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 8xyvHOuHi9T04gqigHFmLTu7Y9Jjk_17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzOCBTYWx0ZWRfX+zn8ocpCD5Gf
 nAwv6LUVRns0i4P93Ke/cLBejCmOWOIbblfYXFlYacvX6f+4+b45u/PU5ZLq8YJY/y30bPp1UHp
 TblYLzNXX3GpEjHkyXfx2J4U2t+JVIGXhWwbygp3OUjEIfHlAgWxwc4e8jNjt3twl0E2SskcrGz
 RI2NzBrdJ2/soRxEgwbspURyxbu0Qg0HQrdf1WoLHpAFTDPfgsflXUI66M6z3DnnLHGlSYlmV7G
 GJjXmQKjJbMzhd8MHl5HbGcVG/GYdtxtD415Mmtn/TT4iX6p5EJ2OuRRoUz+Ml1Z20CwYz3+mk+
 1HlbC6iPJvuQKHXBzskc5queXkCikquYOU6q9VI/SZgeUC3quEf2UdBvCSdRbnRGc4fG2QTP+lk
 m8E+/dHM2GMQ0NAMu/ot1zhIUgifUwBNHx7GsDstFC6f2Y/ukQB0AC0ySZ/1EM3g+t8aYmQoZag
 /tU15rwE1408o5PC7Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040138
X-Rspamd-Queue-Id: 2E1C34BD6AE
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
	TAGGED_FROM(0.00)[bounces-105729-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/21/26 11:38 AM, Kuldeep Singh wrote:
> On 16-04-2026 17:29, Harshal Dev wrote:
>> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
>> for its own resources. Before accessing ICE hardware during probe, to
>> avoid potential unclocked register access issues (when clk_ignore_unused
>> is not passed on the kernel command line), in addition to the 'core' clock
>> the 'iface' clock should also be turned on by the driver. This can only be
>> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
>> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
>> eliza.
>>
>> Fixes: af20af39fc09b ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> 
> On thing I noticed in entire patchseries,
> https://docs.kernel.org/process/submitting-patches.html
> """
> If your patch fixes a bug in a specific commit, e.g. you found an issue using git bisect, please use the ‘Fixes:’ tag with at least the first 12 characters of the SHA-1 ID, and the one line summary. Do not split the tag across multiple lines, tags are exempt from the “wrap at 75 columns” rule in order to simplify parsing scripts. For example:
> 
> Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
> """
> 
> Fixes tag need atleast 12 chars and I see other submissions specifying 12 chars whereas this series specify 13 chars.
> Not sure if there's some hard rule on this.

I think the general idea is "the more the merrier", although 12 has
been the standard for the longest time

see:

https://lore.kernel.org/lkml/cover.1733421037.git.geert+renesas@glider.be/
https://people.kernel.org/kees/colliding-with-the-sha-prefix-of-linuxs-initial-git-commit

Konrad

