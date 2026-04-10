Return-Path: <linux-arm-msm+bounces-102585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xTbZC+OI2GmDewgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:21:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D73D2459
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B7F5301F985
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFA91AE877;
	Fri, 10 Apr 2026 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFm/x4IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9tKiS7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795E9278161
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798494; cv=none; b=DfKE1dZ8q8oWUAF77Lz9QdlEo2d8FmcPI/ff/BsI+mUz4NCrt44xrXUk5RhAjyw4bPGpmHgb3ygJEppoc8XD1MZs25+sIQqDU6TbZryAr8FFdqP7vnmGwiLPcbN1aSzXNSeTSnkvjBdNWDhCMFMrepjBZDHrUMt8mZSzys4Gngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798494; c=relaxed/simple;
	bh=yHvOI2JZgbxhhrS18x0i0G5yfw4r80zSgSr0hfssywE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=L7Bx6SZcEtG4dRVLOfC3+P/gYPN6dHNa9yS1Vr3IX0jmW/OulR4DwpFobjhOOir/WvkAwiVOgpmcbdHW+ncTNcemOOZigMyOd0rgrpmW2Oc5UqQG3RAiJ8OVlWs7NRti6gieH26zR57w3W2KYg7Dpksy7RZ3buuIREGqGr4m6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFm/x4IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9tKiS7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4pXgJ2698400
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IizYWfGnPeXguJY8VoN9IpzJy4a0fnMYo5oTTGL49d0=; b=EFm/x4IP1CiaFMsX
	dcZCV1zlJ7zw4ZmY4hK8WZwxwuVCDNGucrVuc0mIcwtyT5kxR4I3qSMHsB/e8/9k
	ZOIGrf7sxwAUcseroqYEIhRzMmFkHWMn0j4nO6/ZTaPap3lZlSAH6FmJL46xoz22
	p7K37GA3u90WJTAA0rYyobPwwh06Y25VCkSXYrC+6Pm+EvUisQRCT84NpwgoQXV8
	+yWdUNIR9EhmLk1JLFRsCz67Z/Sb+l6WvFTc/oljFmMsYNjuOk2ioI0rbe019zw0
	VHi0/r65bVSxH06T2bzgSUzolxBW9OZJDfyw5kh3ZdB/+yq1hwRiNPTthUuxWQwB
	7znu2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9sqb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:21:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso15746025ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 22:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775798491; x=1776403291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IizYWfGnPeXguJY8VoN9IpzJy4a0fnMYo5oTTGL49d0=;
        b=e9tKiS7n182sg3jyL8ZOmcJcQMbIQ51sAGYY+bGqnoKIQLpYtyJhQxBvrHymvlVU/G
         N5w0dp5tnquXJjGWJCH5QFLHRD/EnGghUCAOIVnqOGynd2qscQcWzlmHl6lJLsE2mSvH
         AS6iOFdQ2/5TNxtO6Azxc8AMxZwM9I5uWXenme7SGzG0gVP3I/tBdO6ZlfcXmZzSzLtQ
         QZhFFVYI/NIdoA/k2djnyfIZ89cU3ojb/LXV/r3xPwVECWgvcoOxo1WUgpZkc/lwE/l8
         46+Zctl03qacUbV82XBP5auX5ZD95divRcLf8npeVzdkxIuih5V99KmXnJeiOtMc9kl0
         j+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775798491; x=1776403291;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IizYWfGnPeXguJY8VoN9IpzJy4a0fnMYo5oTTGL49d0=;
        b=ZQMOOopy9r5LlUoaexFXoOq3qWFd6VbixFy0iRRyIRQzYDTx7KzxjVCuRhy0l7yxKk
         Nmtkb8+cxOZj9JUFBIwSa2XBJZIvE7fOhYy6JAJ6OAeoTtUanOrup9zdLDit5ReVwVbi
         p7RXatv0POXWRfrHJBmptfX6GLFOTg3nvO+FDaidmvEPg5y7vu/mCDHrC14nlb1mMD7b
         TFDQ6TTsYvofv5tFvCH+pUUju3/ghREYXmDBc0D50UokTnr81QFl2kp4ccuSjkfNwqpK
         Khh0tJEFgPqGFMcZUzVU6Whyl628eRrnhck2+9crpJyDouyKTgE6kHot3x6mFATiMWxT
         0G+A==
X-Forwarded-Encrypted: i=1; AJvYcCUvtnupEV7apKOdLqMBV2PhSTTCD8iC3iCZ4sTUqJ46VJt80Hd+EAr2NZRJGBl/KPpYKE4WKbjbszfvgFZG@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSaE0uLkwglpeJl/brww6hse/PkWuBwbtuXgcIzj1k3vexug6
	Xjlaw3ryaYQc1IYT4+SCCLozelxqWZL0nMBkjxK8/D/Ej24ZyCZ4rlHiuLxmIYqnhnEfpD6m9oy
	MfGuirceyAbGc/jJSnLbnN2/J1uuBrg51wRwXkHNf7ElmoLTTWo6VfXteiJqAyG5KPcnR
X-Gm-Gg: AeBDieslWhUyPiaBHrt129Y6On6Y493GKIqjajsACrg75qVEER9HaJqZN4xzi26LmwW
	M5eVuqcmrcSrMcERE5zF2U3dG1/MJ+t0s7LafFvr+LLB8zaZTN/PjLoh63UjywFSW8I6kQvFqTm
	0CuAvEqBMa8oIOHkoJJGZ7q6Z6DbbLj1gyYCCYixWMalmCcJHCX5QSJV4Tj2zCzaHlqSyzgTE8i
	1nKMwDtUTnwqmOUz6c07tauda6sJ+KDOGbz0UkfP/usm0UMxLSNoW7LY5Cs0v8eZLWFppcZ5pT7
	TtiIDXeA0sOav7Q5wSEF5dAU8ehYvdm/5ECNYTxQIKaksdQYujP1UAPzaC7pjlKbNJaRk0BwIrY
	aZr5E1SLq/dPZjsbIbZeSsB1GN/Eti2hpUtcOhVYB7aRuujmtOLSc
X-Received: by 2002:a17:902:a70e:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b2d5a1cbfemr13291265ad.27.1775798491279;
        Thu, 09 Apr 2026 22:21:31 -0700 (PDT)
X-Received: by 2002:a17:902:a70e:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b2d5a1cbfemr13290865ad.27.1775798490717;
        Thu, 09 Apr 2026 22:21:30 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f469casm13692445ad.81.2026.04.09.22.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:21:30 -0700 (PDT)
Message-ID: <a6b18da5-4132-4a76-9a24-80e2978af86f@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:51:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
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
        Alexander Koskovich <akoskovich@pm.me>, Rob Herring <robh@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
 <873e8ad2-50cd-4c09-9a51-20ad745fe8dc@oss.qualcomm.com>
 <2b71dd68-ff35-411e-905d-3ffa2ea3efe4@oss.qualcomm.com>
 <36b4fead-81fe-4b98-9de5-4d524f199569@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <36b4fead-81fe-4b98-9de5-4d524f199569@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0NyBTYWx0ZWRfX5pgskZYtmZDV
 QAx967tE9jXDmp3o+2ltnJxv3b2o8F/vaiKUreBmhh0iRL5r4WasOGvXPTOs4JigVigGnz6W7AF
 poq29aGQEToOZRRIXGohavZA/+i7Vhr3FdF2wLDHHKLLysDClGvhh7R2dh0mPtuCNZdYref58Ft
 NgweisTPBWyH/mVy2uoXA7QhVAlAnILTIjFwpXAG/iCMnbJeVb5zkFyLMK4biTyN94uNAC8Uz8u
 HfPY99bKvekdILio08MGEQWGDmx15H1YJCvN58h4odMZjM371ZqSvHSm/tgB0xkzkAn6ClJ8Ykw
 Z1YFwbyaM8v++Zp+9NcOYTpipiVvKGYZrdaAlVqJwegiktSP+/vjKOXaDBsaEjSgZ4xpzIsjG+v
 UYPtzCGzcP/FASSa3SRJBCJBNmL2ssejSSS3tDwL9sZZVNInghRfBYGuXzSRQs6Vp3DICd98UD4
 MBD3GnTOEA0Wb1fAG1g==
X-Proofpoint-ORIG-GUID: yDkQ4gnNQUHaIoJGJQQxTekyRVAIouNM
X-Proofpoint-GUID: yDkQ4gnNQUHaIoJGJQQxTekyRVAIouNM
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d888dc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Z7d3RZfmASx9lX5pdYsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100047
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102585-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 858D73D2459
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 10:28 AM, Kuldeep Singh wrote:
>>> Hi Krzysztof,
>>>
>>> As motive here is to enforce 2 clocks for upcoming targets and keep
>>> minItems as 1 for already merged ones for ensuring backward
>>> compatibility. Can we do like below?
>>>
>>> allOf:
>>>   - if:
>>>       not:
>>>         properties:
>>>           compatible:
>>>             contains:
>>>               enum:
>>>                 - qcom,kaanapali-inline-crypto-engine
>>>                 - qcom,qcs8300-inline-crypto-engine
>>>                 - qcom,sa8775p-inline-crypto-engine
>>>                 - qcom,sc7180-inline-crypto-engine
>>>                 - qcom,sc7280-inline-crypto-engine
>>>                 - qcom,sm8450-inline-crypto-engine
>>>                 - qcom,sm8550-inline-crypto-engine
>>>                 - qcom,sm8650-inline-crypto-engine
>>>                 - qcom,sm8750-inline-crypto-engine
>>>
>>>     then:
>>>       required:
>>>         - power-domains
>>>         - clock-names
>>>       properties:
>>>         clocks:
>>>           minItems: 2
>>>         clock-names:
>>>           minItems: 2
>>>
>>> This will ensure for every new target addition, default clock count is
>>> enforced as 2 default.
>>> Please share your thoughts as well.
> 
> Hi Rob/Krzysztof,
> 
> Were you able to review this suggestion?
> Please let me know if need to update patch on top of this one to
> initiate discussion.
> 
> One advantage i see with suggested approach:
> For new target addition, just need to document new compatible string and
> no need to update another list everytime.
> It's easy to miss adding entry alongside eliza/milos and might make
> wrong assumption to authors/dt-checker that 1 clock is still allowed.
> 

Hi Krzysztof/Rob,
Kind reminder!
Could you please share your thoughts.

-- 
Regards
Kuldeep


