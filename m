Return-Path: <linux-arm-msm+bounces-92197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLxtK+VkiWnr8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:39:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 531DA10B962
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFAA93001FCA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 04:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C949E2D1911;
	Mon,  9 Feb 2026 04:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqx8oCuA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZhYXTE0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025D2C11C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 04:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770611931; cv=none; b=Wt5y4P6SovIFcFoZJkCnQ2b3D44jvcffFSjTLf7nEuD4/+hbu9fFNj7JVGAuwvrxcr8Uj02BOw9knHfvOvWEQpW/PH+wA2av0doJqoC90eHaJ39ZqiB/k/1RU3uL5/LbLN9YNQRieVwMcXQP+aSyD2F52LBnmvQcQBX5Eg7Thto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770611931; c=relaxed/simple;
	bh=9cynKYQzZEPRYZ1C/36Q3oVejsbaM7p1/rPUrYfW+RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dl9sSu6jFrY+hbYln/u/V2/1M7sg3imE0fdFj9epqDRCrv6T8LJY6RvALke5b1x99vt9S4AeWFcFAJ+S1ijqtVdiKSyw0ncLp6GV1NkMP0N+g2LnP4ftCSgnND4ZqYCWvatO1QfZ5vEr+Jieb/60XLXQKft9qFvgZoJWUBiYHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqx8oCuA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZhYXTE0h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194TDrw2600207
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 04:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qha1/tdZKmtmj/rOuA32EhgsiJirYZUjhkxqDfdqKIo=; b=nqx8oCuAXCFX/GGv
	is4LOjaG28Dw8VOwnDNbtxDw3HrrcsBOp0UFMlYtH0zHmvQTOSUC5JGGCD/XJBcJ
	+le401XQ8Sjfusz5ujjce01Kzgsfz+azoFRSceR8YF7N52yMGs/OrCsdikyvc2Ba
	5+nazqg4lqDJyGFdTbJp9YE4A+84iTznpIYoehZ5Ij+Pe1pXLsV6FxrnQ0Ia2M5a
	Dbo/0EIK6Vg0cSJ+F5OE3tfNEIZss68bLLj1Kuvp5IDjtejR1TCwO20qzhAIkvjV
	X1zWsaNruJ+htvWVmOWvXByKIRafPAve2tC7snNxC8P9CCqzMOVN04zKsMKb6RTR
	RhMqeg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78kh00n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:38:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aadeb3dee4so34279735ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 20:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770611929; x=1771216729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qha1/tdZKmtmj/rOuA32EhgsiJirYZUjhkxqDfdqKIo=;
        b=ZhYXTE0hDShx42eQTRsYwfumjCbx0F0RAYwH3Yc/j0QexH51XGJGjwOenHnV6mQiAs
         4G8tI8OZijY9Lj8A/corWnUPEh6J1BCcPg+8eKD4dQRGzQ2bFMHeYz5zm50VT3evKOLI
         vputiipn2NoH+jH2ycKelyqrLX3dN8XMnVEG8rZZ0YIu5TRi/IhUPHlqksogDZkDiF03
         NWU+1f9+t8mMdDMnEa6Q5d8bDPFTD67TavoS9RrJLQUXWIB5q4YCDEw0wKcncLvWm7vO
         E4DxkBXgiNgmvrCqhiL2DRt01Q+ZZTqIIzzmoXkG5HpuUlC3V6LVsHi+izfsYp5wI0aF
         lhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770611929; x=1771216729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qha1/tdZKmtmj/rOuA32EhgsiJirYZUjhkxqDfdqKIo=;
        b=a/TNi5KtYnFOkgfeSqBxBnJ6AcNo8P2INlc6x3t4vP7U4PjKL+Fv1fpfiqHzPeiKTz
         fDPDKpLgSEyaHaEzQ/xXa4ZJ+z2RmmdoZnjCWz1VAOnQbEe8nJsIgjhIOm40mftem6Ii
         1OjFNmplf5aW4BcsfbA7IxbDd7W6B2exAUFBU+fRYJnmPmAEod++AjfL+7hly8T2hMWW
         r/6PkGOAa/S7x7dGhgHqDQL6Vk+EQTRwNxV4Hb9lnrjVjTtDQMMlOyBcbP4IPb0mQXPI
         Scq0RpeRhLu5QEfym+ya+Q8PQgusWlaXoRrJEX9sfLbB1UxjoS2UNM42hroG5xLzxWvW
         hFTA==
X-Forwarded-Encrypted: i=1; AJvYcCXuE61/fdjJWHsmJhsYqAwfkusXoK02QHvYz8qPR3C25GpqZPJ1+Xm+EAU7LNZ0ZzSpGiBOvue2uN15XasT@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3H+giUFbjyP4Gu7teHfsCLj/hqzw0+O/PZ0JMlKln9CLtCPT
	gFZvMLXsLVrlPF377uIj1R75fy+uQOh80zLbn1o9y3y+meJiE6Q7lIeXB+oIi0y6fDKE8WuEFKu
	fi/axwJnsSBfZgM5HcyuaZ1iM+LiNDnvCiJHAkoKsi+I0PWD0Qi3zjNtD3BGe2/Psx1QM
X-Gm-Gg: AZuq6aKM1/cZYYat8pUEzwUVjCb1zIsKYj2mtDU3oB7Teyfu9uxMpmTS3BmSXVWT9G2
	weQqb5CYFkoGkFk9Ye0ElYl7M26bL7SHdFrFTWSIOE35I/CQ7QLxUKUfmRtxr1MXqDwVt552qA7
	IMCyWbGJBvU6cpjiMDcS9R1yEo2tlbNAY1W+wbfQ/11rpUt3JUYIcaEE5ufkdjRVXKdxbdw4D3i
	xyhuk5D0an2rvRXS83fsRwfXCewXrf2vcKvs8pJY8V0NYeZ82oSDfeJtosWBA2AbFpARB800/ys
	mKNy17oVi2/2GUcVkFmKWGUg7ZLjFFP+I8Ht+zwW1ayK1qFvvtmrxXfbT9gvNJDjGdoJ3Mr1FWB
	5DsUQqL6ZiQ18/+hKfZPUS5lzJcgec/+1+cyF55Udg2rX8PBXCw==
X-Received: by 2002:a17:902:cecc:b0:2a1:3cd9:a734 with SMTP id d9443c01a7336-2a95170b8d7mr86924025ad.43.1770611929375;
        Sun, 08 Feb 2026 20:38:49 -0800 (PST)
X-Received: by 2002:a17:902:cecc:b0:2a1:3cd9:a734 with SMTP id d9443c01a7336-2a95170b8d7mr86923835ad.43.1770611928885;
        Sun, 08 Feb 2026 20:38:48 -0800 (PST)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aad3c91fd1sm61688725ad.16.2026.02.08.20.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 20:38:48 -0800 (PST)
Message-ID: <8111554b-6349-45c1-8169-a91ce1c42858@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 10:08:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Mahua SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260127-mahua_icc-v2-0-f0d8ddf7afca@oss.qualcomm.com>
 <20260127-mahua_icc-v2-1-f0d8ddf7afca@oss.qualcomm.com>
 <20260205-cream-ocelot-of-courtesy-c9ebdf@quoll>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <20260205-cream-ocelot-of-courtesy-c9ebdf@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nt7cssdJ c=1 sm=1 tr=0 ts=698964da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=m9TVfZY2K5xz4nmuSrgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAzNiBTYWx0ZWRfX/Com8Jm85fbw
 eTnLILcDJ5z2D0QuDRmN14O6XMmWjmj7t3lke2pnN10MjRTb7pZibmix0risrH61RblRXCl0rlp
 2d7gm6uNepa9iHSFTxd7I14fPyf4fMdFSg3Ag+uZq1LdilVUXjgzHIq3qdUTANFx5+v158yxBYK
 SwYzQ+Ha8v7QNjzlpxePBjfhxX1IzsOd0RMEStvqfvvZCkUg6568Zyv4ExuQ20GFL75f68NRIKr
 4uYbBwlh5KT5nAeFSFxFODU7EXCKqFOkZequiZpOFEMp/reqamyEYs4V8QwsxKLSPmnY4A1AoDG
 JoJTSggol1Gdz0NwRmr2g3he70AJvB3hDM/7SrvB57siM8yKv6Mfl8Rwc16qTtivuSMh3M2F/LB
 kcqji257KdF9xoJgxzjFYsJTc8jdxnqiy5CtejBfo31tAkR4h7TiV5KOU/PKWsDD2vBRus8cXno
 UVeh0fEiQEwKeZBRz4w==
X-Proofpoint-GUID: taT_NGzrc-XHev3C6C-XJ3j1bege0gca
X-Proofpoint-ORIG-GUID: taT_NGzrc-XHev3C6C-XJ3j1bege0gca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090036
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92197-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 531DA10B962
X-Rspamd-Action: no action



On 2/5/2026 5:25 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 27, 2026 at 03:22:06AM +0000, Raviteja Laggyshetty wrote:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-clk-virt
>> +          - const: qcom,glymur-clk-virt
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-cnoc-main
>> +          - const: qcom,glymur-cnoc-main
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-system-noc
>> +          - const: qcom,glymur-system-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-pcie-east-anoc
>> +          - const: qcom,glymur-pcie-east-anoc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-aggre1-noc
>> +          - const: qcom,glymur-aggre1-noc
> 
> All these "items" blocks should be sorted by the fallback, so
> qcom,glymur-aggre1-noc is before qcom,glymur-clk-virt.

Will fix the sorting and post the next revision. 
> 
> 
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-aggre2-noc
>> +          - const: qcom,glymur-aggre2-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-aggre3-noc
>> +          - const: qcom,glymur-aggre3-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-aggre4-noc
>> +          - const: qcom,glymur-aggre4-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-mmss-noc
>> +          - const: qcom,glymur-mmss-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-pcie-east-slv-noc
>> +          - const: qcom,glymur-pcie-east-slv-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-lpass-lpiaon-noc
>> +          - const: qcom,glymur-lpass-lpiaon-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-lpass-lpicx-noc
>> +          - const: qcom,glymur-lpass-lpicx-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-lpass-ag-noc
>> +          - const: qcom,glymur-lpass-ag-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-nsinoc
>> +          - const: qcom,glymur-nsinoc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-oobm-ss-noc
>> +          - const: qcom,glymur-oobm-ss-noc
>> +      - items:
>> +          - enum:
>> +              - qcom,mahua-nsp-noc
>> +          - const: qcom,glymur-nsp-noc
>> +      - enum:
>> +          - qcom,glymur-aggre1-noc
>> +          - qcom,glymur-aggre2-noc
>> +          - qcom,glymur-aggre3-noc
>> +          - qcom,glymur-aggre4-noc
>> +          - qcom,glymur-clk-virt
>> +          - qcom,glymur-cnoc-cfg
>> +          - qcom,glymur-cnoc-main
>> +          - qcom,glymur-hscnoc
>> +          - qcom,glymur-lpass-ag-noc
>> +          - qcom,glymur-lpass-lpiaon-noc
>> +          - qcom,glymur-lpass-lpicx-noc
>> +          - qcom,glymur-mc-virt
>> +          - qcom,glymur-mmss-noc
>> +          - qcom,glymur-nsinoc
>> +          - qcom,glymur-nsp-noc
>> +          - qcom,glymur-oobm-ss-noc
>> +          - qcom,glymur-pcie-east-anoc
>> +          - qcom,glymur-pcie-east-slv-noc
>> +          - qcom,glymur-pcie-west-anoc
>> +          - qcom,glymur-pcie-west-slv-noc
>> +          - qcom,glymur-system-noc
>> +          - qcom,mahua-mc-virt
>> +          - qcom,mahua-cnoc-cfg
>> +          - qcom,mahua-pcie-west-anoc
>> +          - qcom,mahua-pcie-west-slv-noc
>> +          - qcom,mahua-hscnoc
>>  
>>    reg:
>>      maxItems: 1
>> @@ -63,6 +133,7 @@ allOf:
>>              enum:
>>                - qcom,glymur-clk-virt
>>                - qcom,glymur-mc-virt
>> +              - qcom,mahua-mc-virt
>>      then:
>>        properties:
>>          reg: false
>> @@ -85,6 +156,20 @@ allOf:
>>              - description: aggre PCIE_4 WEST AXI clock
>>              - description: aggre PCIE_6 WEST AXI clock
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,mahua-pcie-west-anoc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: aggre PCIE_3B WEST AXI clock
>> +            - description: aggre PCIE_4 WEST AXI clock
>> +            - description: aggre PCIE_6 WEST AXI clock
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -132,6 +217,7 @@ allOf:
>>            contains:
>>              enum:
>>                - qcom,glymur-pcie-west-anoc
>> +              - qcom,mahua-pcie-west-anoc
> 
> Messed sorting. I don't get why such trivialities are still happening...
I will fix the sorting here as well and won't let this happen in future patches.
> 
>>                - qcom,glymur-pcie-east-anoc
>>                - qcom,glymur-aggre2-noc
>>                - qcom,glymur-aggre4-noc
>>
>> -- 
>> 2.43.0
>>


