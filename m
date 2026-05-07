Return-Path: <linux-arm-msm+bounces-106334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YECfBnhn/GnPPgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:20:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52B4E6AF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 058E2300DEE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 10:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91873A5455;
	Thu,  7 May 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIuYQE42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3klX9YQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318573C942A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149235; cv=none; b=TLP1WyWtVlWYN6FifloBa7iFdOyQLBV4O/xbTnwq7Gw3IpzGlL03uksu4d5qFhCwx2yDRBmsRJLvDdNUQ5OE8dwoQCC70swgT72Fr8KO1CbP7OodfSi7HbKNC2wv5llBGTc8vmBVtE3zw5nVQqNxcnJ4+uZLz9durReVfnekdnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149235; c=relaxed/simple;
	bh=2avxSsvk1as1FMY6RZX9B99PtZTW8XOT31jV6eVZ6xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1l5ecTWfSoUycQugZZoRx/zxUfFdXnWd6UeqnAuYpTK7APdUDHiy6T3sI1YACAPLHXidC9aTDNwyzm/XjnLDeSmhAcSNJATmQoB2t7HJR1gdjopJh8JkwBmVYaD8iFCVw4osNchfD7tXBN5pqKzcE0cwDWRyJZic7bvV0xteHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIuYQE42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3klX9YQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475AgXX3925083
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 10:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5khHSPAj9LWxns39r4VokImHha4yMAwLlWdMzY6C+E=; b=SIuYQE42z6i9X7IE
	qd1RPC+RB7OGD1KAd9WbNTvlFgF6j+gF1bnLfGmPzCWi1DlC97FXwcL/3aebILz9
	fBurTT4pMlR0tiji3AsPG3GyTM1PstZWk/uAhvNUtnnE1XJeVE06eTKift4tN5iP
	LOrU7PWK/oWztzxL3Gql+YNg9f78klXntPo7aTvv5rlExtIbs2ze8Ij6ZP64pow7
	PW+6russqldCZ+wQX8++Ej1gV79ILQegULNwUt9DyGDTIkRXZ5QxSUyUFoQinFH+
	TlfWLs16veUtpHQTE0jaQQFVQTkI2YSC3X193c+pFi4aYSTJqh3kRPkxe4MVrUiO
	8AYzDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88an2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 10:20:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba7662827fso13393235ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778149232; x=1778754032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5khHSPAj9LWxns39r4VokImHha4yMAwLlWdMzY6C+E=;
        b=a3klX9YQwsQxBrxiS7TYWH6VUWhMNXfZve67ATRHutpSElJlwnN9uWhvX9zpc5vK2Z
         hADkAvg9hO7ntG5V2t0TC09WYsF+TuqVPdT2Wyj4LSd6uzmNn0J3xpbN83z1YMHvUOnH
         F4VHeTOUgy/CjCPpwexe/WF3TXiJChdzyI5EBN3qx/vN7UKdMS1p5cx7gwY9ZrH0lJl8
         5x4BL5uiSGff6KsryeGkfDoI3NdH440ODnHsqxMzA/INlvxYe57YMPj0SnOxR35qw5WH
         ja3+dC7SJsvi+8olBHpqbmbgX5wq44U1lTqlJhTLtVsDI4aZPc2Q5fTwAoSBri5Mmg1s
         Nxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778149232; x=1778754032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5khHSPAj9LWxns39r4VokImHha4yMAwLlWdMzY6C+E=;
        b=VPDJUkAGmxCwjv4r0zl2IVG/ui+GnIrm8o/BtcwIzWLC2QXbJHRHZbn2Dmu5sTLNSr
         cOwEL47LMb/MHAnPQFt8k7ShC9kLSVut8h2KwnkmfwB+eZX4GMp9AzQ7kzSg/PlsQ7RP
         6bbVKgNBzhwyG4tMBFamq5LoZbk4NpvQ1qAZUxhkHQ0DOu91Wzes1Osm0UbjiJ2hORb5
         KXksiX9pWiN80Q6aXnzNU0BFUAV2IIE3YJ1NOezvOxpoO6JyjSTXoJVD4WiIiXbuixbE
         ZrIilKjwuJmNZhrXmvOK3S1Cmj8urJs+klw0kiL52ovpjMFaXRwnZ3qq1AQIEhQRGprR
         CAAg==
X-Forwarded-Encrypted: i=1; AFNElJ+0NhMCDZZ7IPchlYMw+J7adasP0739SvbpoaCA/SNGGM2nOl7vGeOAGT3v9e463fHE1WIwDzW1suv/sjpj@vger.kernel.org
X-Gm-Message-State: AOJu0YxTOgrt+zBJ7o3A94dqX8G4+EgDfgtcfcT4XPQEPWIHLq1xHTnW
	2Dys+MvUkvbBiHI2+s6qwh8y4ufzFo3/fzAXL6HZEld46MVSs7N1BN6q6vbCa1yNlVGfMoy5zd/
	HyPMxR1Bc1KvruMU8VuKXagc/f+mhPC0gWM+O2Hnug2GGs9RIqnGMDQBBcZ6Pf3413TBy
X-Gm-Gg: AeBDieuEUo+ozAeaz8aZllFSIhHXwt5l4DjPQePy0p7KkudZiRCDWWlMjggrueHp7BK
	KM5Ib3LpjE61iffz89D8DKsWjGcjwt8Zmu9k47SdQFe3075VLoUB9lLzs3Mw/TH+XL5RIqEjdkf
	BYbin/dlxWBZWOS6MKCeHHgUTjhcAgJpFqKwbWE4V3Hf1kTL7+se/dioA7BsKvNnhn3KBqE33CA
	seQrb3UpEd5VkYefE6grhzJT+/Y7d9z0qahJNPBQarwBBdtCgffeFaxbxCfYgikVxM4HlCTy2tM
	6o0iqHktiX67T5pZXOW3hySl+UJVDWbGXzFRyGJoTeZr+YJd8H/sN6bYPnPfFmAxV9q14ZcWFBV
	VdDzXbAZFkV9ad8SdHIxu4EORB9UJ3Soq1BtimQYWNpZI0O76Sw6M+QBwfQrx0Q==
X-Received: by 2002:a17:903:4b03:b0:2ba:21c2:d6cb with SMTP id d9443c01a7336-2babd4bdb6dmr19838275ad.16.1778149232144;
        Thu, 07 May 2026 03:20:32 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2ba:21c2:d6cb with SMTP id d9443c01a7336-2babd4bdb6dmr19837785ad.16.1778149231620;
        Thu, 07 May 2026 03:20:31 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadef254sm20528445ad.61.2026.05.07.03.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:20:30 -0700 (PDT)
Message-ID: <b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com>
Date: Thu, 7 May 2026 15:50:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
To: Bjorn Andersson <andersson@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
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
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Neeraj Soni
 <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com>
 <afmuncmBrrvddHTU@gondor.apana.org.au>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <afmuncmBrrvddHTU@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YF3oZZocTzaiCyVO_h9Bl4xJyW6N8vDP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEwMiBTYWx0ZWRfX411lUWj9I9uf
 f15vn/hrY5s//h9H3wnWELdVlSV3kowvhXk4CHkXstXLtQBA/DmKgkz2YY4vgout4C+osJ/42Sg
 D+HZgdZL8zOzwBO8042bVMAV4skm1YGjfMdFt4rf1AbgdJh6ABbAhs+dkS797v3xiI5C/2iz3J4
 dPcn9Zfil/PBo9OiBEdODOngolEnyJeoCaa2Skbkp13o0iwVrx48NkdMH8TsSy11XUgi2cHOy6k
 wQ/lGJSZlwZhAHPgmzmtkJ79D3yF2J87mn8Mxw6pLylQD0uQuBpzNG9qKT8P5G3shtHPgnyTzTB
 dx6qpZtdtCjfpRktP56UYIrUv+5k6TUXAKzKxt1+yVyXCk61s9D95uIed0GJVafizCHOjYRdvpv
 /I0mOADG9s7c/SDSFrkMJJWYPaipBclU9ak2MI5yWZyetbK2dOXEO1hwsFMFA2kElB0yNGoDY9t
 S5LHc+51OvSLodLRNzw==
X-Proofpoint-GUID: YF3oZZocTzaiCyVO_h9Bl4xJyW6N8vDP
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc6771 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CMx50Ybjb1gtcuyIV48A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070102
X-Rspamd-Queue-Id: AD52B4E6AF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org,gondor.apana.org.au];
	TAGGED_FROM(0.00)[bounces-106334-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Action: no action

Hi Bjorn,

On 5/5/2026 2:17 PM, Herbert Xu wrote:
> On Thu, Apr 16, 2026 at 05:29:18PM +0530, Harshal Dev wrote:
>> The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
>> power-domain and iface clock. Without enabling the iface clock and the
>> associated power-domain the ICE hardware cannot function correctly and
>> leads to unclocked hardware accesses being observed during probe.
>>
>> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
>> power-domain and iface clock for new devices (Eliza and Milos) introduced
>> in the current release (7.1) with yet-to-stabilize ABI, while preserving
>> backward compatibility for older devices.
>>
>> Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
>> Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
>> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
>>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> Patch applied.  Thanks.

Herbert has pulled out of picking this patch from his tree.
As discussed, since this DT binding update relies on DTS changes in commits 12 and 13
of these series, they should all go through the same tree.

Can we aim to pick this series via the qcom-soc tree to ensure the binding and DTS changes
are applied together? Since the 7.1 fixes window is open, I am hoping for this to be
picked up this week or the next.

Regards,
Harshal


