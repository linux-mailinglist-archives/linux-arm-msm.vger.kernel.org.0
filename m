Return-Path: <linux-arm-msm+bounces-90330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJstGNdWc2kDuwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:09:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F1774CE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A2A8303989C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF5E30F52B;
	Fri, 23 Jan 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWd1f5xz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCLkmT6J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653EA2E62A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166263; cv=none; b=CwH0jWIZGB4VAjtj0STS9EDUbBVylVs0JwMiPWytIHaLvkNb+ezrKYDWrNh6oUUFUbjpParH5xsbelzf84zzYih1rdAjDMrxehSWAfJcdoR09BtXfBuYNWRhpubftD5s3OzVM6Zwq0srukSIaLRLJUMqqT03Ib1TtnqnFUm6WVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166263; c=relaxed/simple;
	bh=V9JffqzBSVLCxeiE4aSeC95rFTCcg2DPDgn0D8LIo78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPvKIkQN4b94Pk8KgwpoSG4UMwltMZh1mDvq6wsbWZU2CMFstmtpi0pnaAFSpr+f1BnNORDBir4+cTNn2JCfQouh1GboVHyPfdgHTC/Gl9Kk2FpCJAHBYcjrj9PmxcmpS2vKQHUlucspSAcdCMislOQDUtE9f+SCLI6WhxItmE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWd1f5xz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCLkmT6J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NAWgHj3503792
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlLa28ZTX8VgKWsybVROjahqDOm/zN8s2Uxi6lUBMRY=; b=aWd1f5xz60va4y2+
	o0PdM4K5eDDxp2PUwkkjPydMwhlhd41s/Zus9In0aWbBHSeQIaSm+lZM0MfReKiv
	ZNxPrd5BMYiNlSkJP28H0TGm+fEnzDeD5PJNa5XiPMlMdvglApKhGTIPm2E4sngO
	hcGZQ5m/FpqIVSf7fZ0T+gffKrSfDBL/LcE+Ug0z5deh3vFqSMR/TiljmyVkxqcc
	GWH8THhQzQCLm/uQkmXl8c17FSLv1gnTa9eG8ji7p4jU3CFuZRjmWPi0HUOo0ikV
	Beb/ikf+nAxK5U0eOIL7KCTc4FLBwzkKrHqh97j0Nv/GHGfDZkLKE2/tbmg4msV3
	ODwckQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bus9832hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:04:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f2b45ecffso30512475ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 03:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769166261; x=1769771061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlLa28ZTX8VgKWsybVROjahqDOm/zN8s2Uxi6lUBMRY=;
        b=XCLkmT6J7RVJVmP6NVXiOc/U6z46rQ/p8pKmgI+Q/QXNuT67Z4cePp5Cm8vSaqh/X8
         YbXxcwApd381sTqV+r+FsPNEDD891uTMBimgKpUbLH33ntui1z4ZVgp6eTRF1HXnxJ/D
         zHwUVOu5GJUVjXoo4yzq43HM96/KS9VTH+6x9SvISFKY2LIYMEA8eh1jUEkKvkSSJwxq
         Ibl1i8cDmr1rhCmBvID99rzXKumrAT1yoOdF1XgmnwowbyF0qVTfhTmQnszGrfec10ja
         eDFzosCd8/5C2cldzPlHXU3PyXOW+tOMvLDEWPnT9uxSGxvbsdHUSgNmo8cKViwVfUAi
         Kr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769166261; x=1769771061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlLa28ZTX8VgKWsybVROjahqDOm/zN8s2Uxi6lUBMRY=;
        b=eMd94Ti2bVpPaHmdQehxXNDCA/9uzsKuF6vNRBrwr2LqltUC8FpvQY9e8CkD/YnHY1
         QISzxO0V5pENwJJnKGNbWWv2yZRuLCKrMMyeGhZiIHczwX0zIEt3Kx46353n9NhzmcfK
         a0bQ8YZ7PlS0Am7CUYJHMF3RNcwx+e/+qg1XQN9ahv7HNN5+QZbUn37T+OwBt0duFwsU
         8JjhY7Mkc5Ky7gqjVZF0Pu5aed9WrNlDVFgwgUysGXe0kIpHJDNQL28VqMQoi+qdsMaT
         9pyatnymgCMAOHkGHK3ShWcHDXbmTu6+4wGB3FXvZ3MBLjHHTKtnxWUgcEcvTVcBBAZW
         nnsw==
X-Forwarded-Encrypted: i=1; AJvYcCX6sQvyPV8RKShRi0ssup+ZAndI6fylVtX8mndxDt3/A5K66o7fllLQPsRLN61a9W/gjP+5m8+95KQtGfyy@vger.kernel.org
X-Gm-Message-State: AOJu0YxdMeFxWvIrKHdwU8FnSJlEng5K9t3S3jTQjP5QwU5xiH7B5C3I
	+2g4hfxrZ5qFcGoCIJMxGCVa9V3wHXFXtmxxRohzgPvqdnKjTQFPRTwPEU3RQY5SWplKfxAsXm+
	9A9k7/zlY8AqoKD8ONErYw/C1PxHNhdukTLN4tr30lD8cCaWPrl/A5uj45t7X8LUxsMoT
X-Gm-Gg: AZuq6aKet68ba4N74X5qlVir5L9Xx2o3QOBCvF4kxu1Mv6CdZ1lv24HocrVCpYKQXff
	MipOnrYQ43m37puN5KfRIsk/I3PZylSygQXPRGJEzAVLo7aUubgkJeDzsMnOeva+tADJpPi2wn/
	VxIXhFa0EORl45LTNZrO97oXfmJKG+lXyTMgX4jamND3euW7JghlabVPhOCkDK7WUOdJ6XW9Dus
	yVbYN1/9mMyv+7+/aB57WnrQ6ia3RZcuW9Mzce8pJ20patB80tSNrly1cwhiFR1ChsajOe/yopq
	MfDWvIyWFdxmtqqLaNpM0iiEqsBkhF2FSp2kUcX9muyWWVmYwsQmxGVgot6ig57njWLEQsxrLEH
	cCbCRACY++DA+TmI2B3nS61X22C3i6Y5ZIvUshNY=
X-Received: by 2002:a17:903:3c50:b0:2a7:c6c8:2cf with SMTP id d9443c01a7336-2a7fe56cadbmr22449545ad.22.1769166260816;
        Fri, 23 Jan 2026 03:04:20 -0800 (PST)
X-Received: by 2002:a17:903:3c50:b0:2a7:c6c8:2cf with SMTP id d9443c01a7336-2a7fe56cadbmr22449325ad.22.1769166260221;
        Fri, 23 Jan 2026 03:04:20 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm17259215ad.26.2026.01.23.03.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 03:04:19 -0800 (PST)
Message-ID: <06160c6c-a945-467a-be82-7b33c5285d0f@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 16:34:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: crypto: qcom,ice: Require power-domain
 and iface clk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-1-e9059776f85c@qti.qualcomm.com>
 <14a71b33-4c10-41b0-a6cb-585a38e05f56@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <14a71b33-4c10-41b0-a6cb-585a38e05f56@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4OCBTYWx0ZWRfX2o6x1xt28f+J
 qL6NrTLekey/z+hceJrVM3y//CKiEZLWDcl3+GVhM8k3x2Kk0t3SpM2Vm0r3ojD8rXi3dBWz1vf
 7iezmoLneoEdJSlOM0TvrcVYFe7Yg037q1rFczf9qLmddKUYSuanuqVtDkq51zfqKFaT/cp2XdC
 UKk0NMlgalAJJtd+mydaSmi32fFQC2QI7s4PBffISBtn8BsMrQS/plh/eAisNsVHz7G5dRC6GA+
 f9mhXjzDn50EAszd09gSaS16AER9M7KwSnWmb3twZpmqTW5pvlqUigdBSYxtj+JzjXRg6wdBAin
 Ahb54FMblp3Nun8r6NmTcMudLotRAC/NOddBa+iOntTOs2W/R8nhG9ZCsialGUgmHOdrgVHMQ1A
 btENuVA8XJrJ2M5VJiEznNw/gyeuATbkzcUmS1itYMiLM5isupUhL36NAJUzC4Lg4D7YXhNvHqu
 a/BrXzE7jaZPkwWV1zQ==
X-Authority-Analysis: v=2.4 cv=JuX8bc4C c=1 sm=1 tr=0 ts=697355b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MVwZJz_WKtXOECYJnuwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: OH1VQYNPPiVYC27mJOH0ohsHPZMlX9xE
X-Proofpoint-ORIG-GUID: OH1VQYNPPiVYC27mJOH0ohsHPZMlX9xE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90330-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0F1774CE5
X-Rspamd-Action: no action

Hi Krzysztof,

On 1/23/2026 2:27 PM, Krzysztof Kozlowski wrote:
> On 23/01/2026 08:11, Harshal Dev wrote:
>> Update the inline-crypto engine DT binding to reflect that power-domain and
>> clock-names are now mandatory. Also update the maximum number of clocks
>> that can be specified to two. These new fields are mandatory because ICE
>> needs to vote on the power domain before it attempts to vote on the core
>> and iface clocks to avoid clock 'stuck' issues.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml         | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index c3408dcf5d20..1c2416117d4c 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> @@ -28,12 +28,20 @@ properties:
>>      maxItems: 1
>>  
>>    clocks:
>> +    maxItems: 2
> 
> This is ABI break and your commit msg suggests things were not perfect,
> but it is not explicit - was this working or not? How is it that ICE was
> never tested?
> 

I took some time to educate myself on the point of DT bindings stability being a
strict requirement now, so I understand how these changes are breaking ABI, I'll
send a better version of this again.

As for your question of how it was working till now, it seems that
things were tested with the 'clk_ignore_unused' flag, or with CONFIG_SCSI_UFS_QCOM
flag being override set to 'y'. When this is done, QCOM-ICE (on which QCOM-UFS
depends) initiates probe _before_ the unused clocks and power-domains are
disabled by the kernel. And so, the un-clocked register access or clock 'stuck'
isn't observed (since the clocks and power domains are already enabled).
Perhaps I should write this scenario explicitly in the commit message?

To maintain backward compatibility, let me introduce minItems and maxItems for clocks.
When the Linux distro uses CONFIG_SCSI_UFS_QCOM=y, we can do with just 1 clock as
before.

>> +
>> +  clock-names:
>> +    maxItems: 2
> 
> Why "yellowpony" is a correct name? Please look at existing code to see
> how this is done.
> 

Ack, I will try to list down the acceptable clock names here.

> 
>> +
>> +  power-domains:
>>      maxItems: 1
>>  
>>  required:
>>    - compatible
>>    - reg
>>    - clocks
>> +  - clock-names
>> +  - power-domains
> 
> Another ABI break...

Let me avoid adding clock-names and power-domains as required. Since for scenarios
where a Linux distro uses CONFIG_SCSI_UFS_QCOM=y, this isn't mandatory as I explained above.

> 
> Best regards,
> Krzysztof

Regards,
Harshal

