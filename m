Return-Path: <linux-arm-msm+bounces-96260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DFwAb7BrmmRIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:49:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274E23924F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF884300BCAA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1C13B8920;
	Mon,  9 Mar 2026 12:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtQYuGpU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9UhjqFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05D3B7B7C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060097; cv=none; b=TsHRyH7KKAzEutPM8NdhNf5PurLNkY33Nu8suOJYRA39GUgAZoCduq59uMjmPvgT+xvz00ZukdmotI9TgMN16lD6cyIEuf82hud7fTWp4HzQR5nUET91G3iKR95pWOJLuJMG1wNr0XNGmfmzKZci30glOJUgdR9nucuVjxSsC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060097; c=relaxed/simple;
	bh=dwxOFF1jIfAEdxzcMU7a610M9f/ZzdmCVIYiAVML4Lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CeqzV6UeyPNLKj/bx5jb8CUU46lavXsE8TWRJZCcxBBV0+XkPuJ83Al7wTIj8yHHT+exi0Qe1r5YI1TOLPcXAndnT8/JoeQ555UnX5bYbVPAGgEwA4vFGecdFeUECSwJXGdMYUl3EyP3uRACIUcc0jznJXQIW144s4+AB9i/138=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtQYuGpU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9UhjqFA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AjhCn1968932
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voh86L/vAqmB+vDtOZ/7vMT01dDlIpm0Ps/jEPksfNg=; b=MtQYuGpUMCNwSB4P
	w28RoLWAfAdxUgoxEZ+jQVp+CflWsyyndYJrUkAkl9z4MUoeB/hfiqlSNhzdfh/O
	xbTUG3nZmeL1Z44ivYqcaJ81MML/Z8kx2X4HkSsFZ2tYZNI/rYCj70zMqoeFBDSK
	kdnLaAeohg6AspFpanp+cDJ0t64rEwPb/4T+X2AbkFm+265o0dGVE1ZTKwxXQZpB
	Mb5KbuvA40eDAOoVc0n9YFBrCIE/TlhMv0DTVXvYT9KJ9lTnuixmkNj6FLlhtPhi
	/iOyuSChL+p0LWw9gNy1By2NuGRd/FZczNZuHKAUgxTz9igBpUgMKkrHzY7/x4WK
	xq399A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrnhks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:41:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8ea43d4eso27475685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060093; x=1773664893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voh86L/vAqmB+vDtOZ/7vMT01dDlIpm0Ps/jEPksfNg=;
        b=J9UhjqFA1a40BF/ZXT6y2PUXzvOZxpSkRjF8wQKZin3TVL368Z/KUhbjQ4S88DC/JV
         AHQxK/7aDiu/j2kC3tf8sMaWzU1hLpabi18kHmXYSDyxnpZgn5NqwA+nFwOGB1TaawX8
         caRGUdYwBsqV2E9UxFGL7KJC/MIBv4OQ4GmYKXjl4HGYM1xPkxJaWVc/L8VLMWsyo1Hn
         VnVCg0IhOtRp5XdvlS1vqCF2kSesELwd6Mez/GpKpiswFBqdvpJjPLHFN/Azl14U9SJT
         Ifj617HhWe3XOmKqCzY25xzMyoY4KH6f/CEzx0oAzGm16LeghnAXw1HqNxxL1aV86rjV
         Y8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060093; x=1773664893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voh86L/vAqmB+vDtOZ/7vMT01dDlIpm0Ps/jEPksfNg=;
        b=R8RGVQMt4FVgSBjiX1v5GLiy0qkLdnpycQ7xhxDK2vMXokL0xkvXqoBplDyNDqKHSS
         2tH2FPapkiUsNYizE2hX1/bBw8EU9PmZlbv0t1MHFhDUyAWMHvyc99dFjx3PItAKm+R3
         19dhCGKdn7ahLf/MSnCcW4Zypy+JzI8upFLd2AWiASLSV8yPfsRFwyfHLTU77YkAW1/8
         9wpWsYvRInxhTQQtFQQeP0pbdhSp0oq2hHPU0IzzUo+jLCsYvHtx/zj0FJQ5o3HHbCSa
         PU2hE4DGFeC30882RUYq9Ss7rIu052SUuevCVVNKM8mrHGq0RXjmpJSnGdDv9qTQiaCq
         fDiA==
X-Forwarded-Encrypted: i=1; AJvYcCUgIGTwgI28jsfR9DX6rr/9NNMux/ChdMtEDz5H/xYioDPBNt9FoOAeeeRCeFFvnsd00vok9q15KHai9MTU@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOR4JNIehJnxZxIEr5ilc04w4/84Zecq0MvCgL5Xdo5uEJOAn
	HkPMbiB8SoU+YP0+S2//c2FhW7KMR/V2NN78N+l3emE/qDlaniNgxtuO0E/0S27xtD9033XMh6f
	0CaSU3wBXzF3htdNUuGyz+kNAneRz2MMMCuLPFfdUqk3qMH62FmpQgU/uC1UPbvxeDzyT
X-Gm-Gg: ATEYQzxI9eC7iaUxSX2WGY1Sxn06WW91qyDXf39rpzIzAlMnBx8A8FT/eAWaAGNQGV+
	7c/GvAR+g2yC0ZWc4MCixjK7Md1RDrnxNoWAATKlnqyQykrA/RhDsPc0dRqSc1E2ZcR1FMgqPaM
	2Lui9xF1bnkAMk7dqZPW0CYMBbFwHPb0wdMI4nFEMo5U9j+Tagr4oIijmizy7i5DvK051D4jKg5
	NXwVE19gCrbIFBvyaklTgWWRjSrdkqS3EF+q6dniv5WI00deoQK+TEFHZSFacoHD25EsdQdUerE
	nFDrHhIOzdn/xcO1NxjG/prELjILzcO0Yif6AXcgsMRWXnWaRWtAe8nU2EgwaiHS8FnaAmHq0QE
	I5B4GdeXq5yZoX4gS0yp8ZNYvP4RkAnAYlUYEcVT6xwUKe45rRlCSvmSemhRudCgbVQLtXwWEQn
	1cvho=
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr254714285a.0.1773060093625;
        Mon, 09 Mar 2026 05:41:33 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr254711085a.0.1773060093214;
        Mon, 09 Mar 2026 05:41:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d6dsm3210909a12.6.2026.03.09.05.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:41:32 -0700 (PDT)
Message-ID: <9c11fb4e-70b0-4d01-939c-853308806aed@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:41:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom,gcc-sc8180x: Add missing
 GDSCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-2-val@packett.cool>
 <20260309-soft-beige-shrimp-28ac6b@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-soft-beige-shrimp-28ac6b@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aebffe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=O5yhVQSBzkC3hkWOAnAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: AMAv2TFyhO71TL685cAhO93W7aw6OJSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX+jDeSCBWKd9E
 pDvhy55R61sEU3mUVVIU1XA/ibLyDyyvluVJadA/25L/n++JpHleMXVkiuiGmYF+eXdNz7Vrn8t
 NTHjCWQyEZymJDk6biMikA1HDwvdF+vbjGAy5Id0jkq01neb7yaG5+oaHUakEapBiKZ21kLRoqf
 TBU4PJLaqvRRdEXThvcGK8PASK+IPFIl2doJJplBUUxfXOlhxnAY8JJGjCz/B3DKyt/2NABDAXn
 N0ubS8VJoDuXYFU1fKLBOW8bXj15AiQNsdDKzyeRwC3gf2Onwiq3W3+B+cOAwj93BSVIr9iywlN
 6qJQFGGeoJHFuvqSldofK385XGs4UckEa5zZJcoriNMwwcuJTKhOZo3z3X4Cjw5lsZL0qWwCjyD
 GkcwL37ETS7R5GwdFLRFpkbU31fmSn0gZotrrzDNEWAhbJT5/I35o+Um7ST3CfuXkCogXapVcDv
 ovcW6vJ9myAX8fhJqDA==
X-Proofpoint-GUID: AMAv2TFyhO71TL685cAhO93W7aw6OJSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
X-Rspamd-Queue-Id: 0274E23924F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96260-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,packett.cool:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 9:04 AM, Krzysztof Kozlowski wrote:
> On Sun, Mar 08, 2026 at 10:00:23PM -0300, Val Packett wrote:
>> There are 5 more GDSCs that we were ignoring and not putting to sleep,
>> which are listed in downstream DTS. Add them.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>  include/dt-bindings/clock/qcom,gcc-sc8180x.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
>> index b9d8438a15ff..9ed7b794aacc 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
>> @@ -322,5 +322,10 @@
>>  #define USB30_MP_GDSC						8
>>  #define USB30_PRIM_GDSC						9
>>  #define USB30_SEC_GDSC						10
>> +#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC		11
> 
> s/HLOS1_VOTE_//

No, this is the actual name.

Konrad

