Return-Path: <linux-arm-msm+bounces-98399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zBOhLFd/umldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:32:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 517992B9EE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3726D3013958
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B55036680F;
	Wed, 18 Mar 2026 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IH10axvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aziNxNNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B74E31987D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829968; cv=none; b=Ebo66bHu4EukcT2yiu2lOaz2lQXO+oCZ0AKgmu29Ilt0Iqzwrex1IliYKR1eAolIeh6O6OTdtgYbZRDXMGEBcUHy64iF15aeWt7Piu936vLQEnZLe/vjvQFKT5HR7q1ltDbZXz1LJDrQX9xDtMwSyRvFA3ZUo9FpYZMUoOhhrdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829968; c=relaxed/simple;
	bh=okJA4/r2gaoYw0ua1vM28wt9Waeo3cqzGJKL6uO/3H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxN+BPbEW60ppd6JO2hHIdVhK4++b3IHMpEeTBPED8q0AFvb7VV5Jb0gaZMdLjbyAlFRQWxevsfL3u5fF+P++JGspKPejElN2CwnplyYdPdhgDsABrYwNIwQT3inzemzHT2Cp6fqHELH8AIjku+jRMMoN0veOJX99FSGX45GA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IH10axvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aziNxNNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MvBO3358523
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzdMmpvsAIDS69rtM/Jnx1k+GVl/CMYeNLOiAyJ+tQ0=; b=IH10axvHmTzUaSmy
	dW9JcmNBz/0KEF0nuyDz0CuUzLHAa7qX5Uof1O9v92D0cjqwvHthaWuHA74EH3S4
	IYeXyNiiAMZEN871whbNdWqym44KsJFceV1SD56b4C22sPJvEI2IrVR49w0ac9Pk
	4IU0IQjL1KUT+OKvuPp39IXC5hUxlwuOiJP6j+eIq7+02SXpls4hmdLab21JSz5L
	LqRhArWwkESLXg8AA+10ypJbzCMWqO5ZxzUNMOVpCJz6YxWF/DJBpA56ChJk+/e5
	YWyhPRV3dKQeTYNw0jQ0W70pSsskI17iWBrWWka8SJWk4xAHW/hjlQ1s+DRpsCo/
	rITurA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb08kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:32:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829fd367abfso419909b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829965; x=1774434765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzdMmpvsAIDS69rtM/Jnx1k+GVl/CMYeNLOiAyJ+tQ0=;
        b=aziNxNNSDndEdb2qj9wtU/AADXmbNJWmKkFrDFzpodGADxd8IPs9DuEY6wDV6Lmhu9
         UmyuY4mfRrSde0SnUFMHzCVYKJm5HbQ1GzEQeFvTu1HHeA43opqgK9c1QZHaMxq9iKWf
         WK4nFi47bl5sLFSI4yOrGkDHUf3WE2rMD0H0GOAQH/nDrAb70LsRPpxyjlle+dXe0Pey
         1Nmsx3ZG05xBpjTHL670evQ9uhGKBmg5VSiHvZmqbyCfTtu5w3oGHLVq3Emky8IShogi
         a03527tb4J7Jn7xK4eCWdFpz62wwEqrDnEgzWfLFCDBaevLdCYLe/FLdwF4qJZXiC34J
         BPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829965; x=1774434765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzdMmpvsAIDS69rtM/Jnx1k+GVl/CMYeNLOiAyJ+tQ0=;
        b=YQLdv7wV2kzgXxFkzrP51lnLM+7uxBSPNeUAsmH3RdFtiKikkXK8XEQk742HqpkEvs
         Dt69dpvlERwKwOCsgGlu2FBDQfglHlBdkIzrJhOk+uvKGjhpjOt2XpfdyWOfr0j/9LGJ
         XJIvlJ6IXgmGTh+aar+CQAzy3x2LWJiE7jyI8Lz6AkhSvOSwAMR+dhAA5yH0h7CZ/neQ
         TvgKGifQyuLVzAYIp5b/wj8urXXJC8USQvjFYRckUJmdZ1oYcq2EpV6wb2EqQjvxc+4n
         yDoZiczK//HbPPLyFGA16vUMGXyF6eeKyhSuuWntMX1f7PqDbySr3hbX2U50PE8Hc92r
         jh3A==
X-Forwarded-Encrypted: i=1; AJvYcCXJMAwYzXQVTpN3u5R493BEUCIIY67yb2S1WASXPzMKTTbpLxc2e/jvv3xvMn3V28+4nXjg+lgNC4YLp92s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp9SXY/hX38N8+QHU6wB8UpgIbMFK5fmneJKD4D4Q3t9Cjik+B
	AGOaDq1CnLoybfE5LQ3ar7nk+1M+X35jRcfc5HfPrSB84MSaOQzIrY70IoN/Bt6FibIRqEzpVU+
	sgYxr1nSTPsFRn4eXCD5WcTF6bhWLSYNFJ7R9yJPUtzLDG9fieXzMZZ9rEspkM1XYDANA
X-Gm-Gg: ATEYQzzKs6sv/HI2BIp10CJ+i6D1zyITSncCBvXZiaEkUwv/ekCnKtCWR2VDQM7r/m8
	WW/541TI3XYV+S+3z0vTbcb/fpQKCEIE656gngKWIuy2IudC9yBTyed6rbWXo38FxFJbEFA52kl
	byxI6RL8NkURyVCSz0g56HgF6sv5cfMexyHR6VM96FJs43ykWv3aujNa1XwmiRQUzjXorT3gs/H
	IafqZCW999g3qMg3jtPgWCpxmGSLJujIn3xRpFM2yTu9WYVTsgsMVpOusQN+NmJDnvW9OC0EDpJ
	DM/p3nC5uLaqOjWlGiF8POOof00X71ZHSiRey5nhC+Uk6fFeDoJT+yCl80lH3BT+bxh5IraJqLi
	bzGeLXX6bxPWM5j4BhC3drJdfCwrwCXq8hOaZKbI4zMYTKmiL9JU=
X-Received: by 2002:a05:6a00:8007:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-82a6ac11ccbmr2422013b3a.8.1773829965010;
        Wed, 18 Mar 2026 03:32:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:8007:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-82a6ac11ccbmr2421972b3a.8.1773829964545;
        Wed, 18 Mar 2026 03:32:44 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b56de13sm2877864b3a.20.2026.03.18.03.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:32:44 -0700 (PDT)
Message-ID: <2b144a3b-4edb-4ee6-9ed8-625b75686955@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:02:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: crypto: qcom,ice: Require
 power-domain and iface clk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
 <20260317-qcom_ice_power_and_clk_vote-v3-2-53371dbabd6a@oss.qualcomm.com>
 <7dqo6qbpwgltnf7xfgiogfdpb6f34fpwsxuksdpphjqjljzsr6@hwqv7wjarob5>
 <ce0213a0-ee09-4c09-a974-ea490326607f@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <ce0213a0-ee09-4c09-a974-ea490326607f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MpxD2uHEjesiEEAbuM_rsiEDmsp8IpNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX1mb3hfRM63Sc
 MpbDMM/o0rXnSHeB+7ka3oCPMLs+t26/UFBJb0eDwvSSasq/gPxC+AQNi0990bOX/ALa8vJ5weT
 Ln43yhD7BuXr5eCM0+ZLUUtFYLwt14EkKdwILiu0QMVpQJGRaGSjY6lcDw7Ec9E4s7E24SGf2zu
 d5eoD2xbI3ntPonmq6FiuQTPoyxIlE+FYXxVLfMaZ+clcXY4PynQnlBIYQlElNP23xpf0Q4WatK
 WxAT5OVm0Z/g6WZSPmUD8fskP2GGlXX/eXUBNe1ln5hslUhBO+GXNHklWQPelUzxZi5uOHIaiCu
 ZvIXksbW+faloJvXQD11Dr/CvnVEEfWW+ESU4ZwiUgh1UqX+VDqhFNfIBR3LjhS+iKMkmjGTDUc
 JUzG3S50fMO7/nZ9+kXpMlRl4CnXdBJ3/bFySgJIxfBY9kCmyclRdXteYDDI1klUhHxgKB5LJU3
 azpAtQjttBGog+uAbbQ==
X-Proofpoint-GUID: MpxD2uHEjesiEEAbuM_rsiEDmsp8IpNA
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69ba7f4e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Rh5YJenaxsb_U_NeXlQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-98399-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 517992B9EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 12:57 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 16:13, Dmitry Baryshkov wrote:
>> On Tue, Mar 17, 2026 at 02:50:41PM +0530, Harshal Dev wrote:
>>> Update the DT bindings for inline-crypto engine to require the power-domain
>>> and iface clock for Eliza and Milos.
>>
>> Again, this mostly duplicates the subject (and your last paragraph).
>> Either drop it or move it there.
>>
>>>
>>> If the 'clk_ignore_unused' flag is not passed on the kernel command line,
>>> the unused 'iface' clock could be disabled by the kernel before ICE can
>>> probe. This leads to unclocked ICE hardware register accces being observed
>>> during ICE driver probe. On the other hand, If the 'pd_ignore_unused' flag
>>> is not passed on the kernel command line, the unused UFS_PHY_GDSC power
>>> domain could be disabled by the kernel before ICE probes. This results in
>>> a 'stuck' clock issue being observed when ICE attempts to enable the
>>> 'core' clock.
>>
>> What's the difference from the previous patch?
> 
> 
> I asked to POST A PATCH targeting current RC. One patch. Current RC, not
> next.

Ack, I will merge the changes in this patch into the previous patch to ensure we
have one consolidated fix for the current RC.

Regards,
Harshal

> 
> 
> Best regards,
> Krzysztof


