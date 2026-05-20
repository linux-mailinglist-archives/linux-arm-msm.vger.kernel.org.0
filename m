Return-Path: <linux-arm-msm+bounces-108618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zBSNChMgDWpptgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 04:44:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC74586EC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 04:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6AF93008E00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 02:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FB930DEA5;
	Wed, 20 May 2026 02:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXSkq/88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9jG4E0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4C30BF68
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245072; cv=none; b=WnIJhO8m6Uc7RFuVnKKYGZ+fFiUnigaq7UVXHLxCkJPqHZj6TEqsqpvpZAEX0dEaMRw9y0DxXKdLjZ5ICg41JG6TEfEH0C2cBzrC+D4l4Y1LCA2zcYRbXby0OGZJHPcKORl8BvNecyqIY21Bkz9dLjxQu2GHwY9UcQ/+KVoyptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245072; c=relaxed/simple;
	bh=DaRJ3NNbsbZrzfDzFuZvPTcUEpD+OYjkRzh34FLYT9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikvJ7AYE/NECOorf3Uttj3sk1LzXIkM4R8wAoDbLi9SN6X92bFyA07gaZlhLtbliE7os1PfKZkaPVTLOO4xszRwptLo91SBPD+pc/dP9VpTdOUkH7gqcS4sMCXvUWbhiXbvRaqBa2Wjvw0nlJylu1WXx6OXEJir3QnIodap+T/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXSkq/88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9jG4E0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JLqi322983956
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=; b=SXSkq/88Jb5NzbxK
	neJnSME7YELrLujNEzuYhfx4w2kuMBmxkg+MM8sTxXlhUV/jsFdiWTKzjS8PdOy8
	AY/HQ5AuuhewHNV3CBNwebxj03hzEeExVYSpD/Q3zuPO8kwCIdekqGvMLOxnxxS+
	hw630nM8Ln9D/8E8R269M7VrkM7wC3dJJMW0GRJCTPHKf7wIhsiQZThHhcscJ/Vo
	wgO1an0Qb17w5yT1jlIjwTBRRWGkYRnjkzBb8sUCCa5Gwzd9pk7WDnX0oKtRPBb5
	P7ZdRR1hZkfvzjUSAV8WrO7kBivI57/7W8OmS1LJVCJQqEu/WwZV7b29qjBR3Zlt
	XgCe4g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t2m1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:44:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83ef22f8e8bso2709507b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779245069; x=1779849869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=;
        b=R9jG4E0Hd69+oUrVZkW29Z9Sx8cbn5nykVmVyECNQCdM2+xR8uL+sDMz0NuN6SvWEq
         eLk2Ib7Y68TBkkYILvEJvDkC1ZHuySquaZUiX9QzlWfgnFuoAHOp3ae/yORpWLyG0K8S
         EltkWZD77ntji5NWtcpxnVomfksXCmL64ySVLVKAyJL/hW+PsqGpuDgw8tKS3wu9UNhG
         8V62rnmKcphczePYgOxcYhCZTEkf9I5osAi388k8Rz3qF6HBV7+ZPDE3sJJ2b/vxaN92
         2a6tWGnLhuLpc3MGf3aqQgx2bMpEf4qiDlcwkCY7GlYWF7u/S+DTZpmqzwObKw/om63h
         Nalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245069; x=1779849869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=;
        b=g7HsyEvRdur5dMeni83iJBOAHiAh3oU8RYiOSib1+o/Dz66TgB5JPNKGeT0Pj2ZNs3
         OAPDKVw0kHeIZoLqY+/pCcdzewKm9dS3XxAHzvDoIExRjIUyQm3kIUi2NlXPEnDW3TFR
         h8s4UASvINgrjOS18s5MXnnZ0zKTUfBf2fJfeljrcSwrGhKN/De8zdI9uqKbNKw/rnYU
         XRa+cUMB2shvxPRfSXHdf3k1pAox6JrRlX9evfHqIFamflq2a58Q6DL5FZBRtMC4MPk9
         6ipi6llhiwpW+TuZndzy3OFUAdtx15m757S+I5jmqeM5RlU714tx6jngOa5tPQ9Vy4pt
         JKGg==
X-Forwarded-Encrypted: i=1; AFNElJ9Y7HgdBWo4ebNnVcPcPH5fBq+UL7He0VUOb5SLSEAcGZY3K4iUM8JmKntvx40rftyhMYqB8nYy9MntDfTZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bgfImAimyYN56KL2SGRUSjCMH0ibCvJWRXRRCmOtdWkTUcOx
	hsRuahpOoCnGfcZ/nDQ9/JXufVjcg8wMHunKGn+x0dVn17SndKVlR9HCwAMGGyGE2z/W4/qpxiX
	BKE3OncJDWcMxBfaSH8QyqFEU7wOegmBOmeZ7bEYC/n6eEGCCbF7ZEhSWKE2qHBeNxyVOQYQIcb
	1xxeg=
X-Gm-Gg: Acq92OHRbIIM40KWli5xIXuh/aVCMJLJu10BixMhdtUsk6eBPfDes6zJX2PvdxUOpBU
	QYkzaCt3WMZRzgbInWSVj1vet3Ha5NNForc9kVE2zHKDFK6Z7iGbe4VJvEs8QOhSzimtbizsT8+
	yT+WzQEEQFdNSj5bm0btrRzm7uMKonOl6mB50hOh0lvWj8ZskHjAcCXzFEgJuOm2iMQBOLQLtwP
	a7hmSNiRyZC9tgrXvne1D2WqaDsf73Bef0+pd0uF0zIGYOc+LMyP36aJmZ+JrwJyGfe2sESHNxS
	hTxf61Da96z2xXhv9C5e+nc41vw/BqRtgPn9I3ar53sPdDpvcAXDJ0G7V6Ry3Z/AA0DoyZZbT05
	8hN60z8efZP2hHQ7CTJkfeet9BZI3KjZFMIV4Xhx84N5x/ZAEdhg3mCkSdMunis/EysQYZS4Nkt
	riNNsUftmwBncjEGJ+
X-Received: by 2002:a05:6a00:b4f:b0:82f:44dc:f85c with SMTP id d2e1a72fcca58-83f33de9efdmr23286790b3a.34.1779245069126;
        Tue, 19 May 2026 19:44:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4f:b0:82f:44dc:f85c with SMTP id d2e1a72fcca58-83f33de9efdmr23286747b3a.34.1779245068609;
        Tue, 19 May 2026 19:44:28 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c39esm22560389b3a.36.2026.05.19.19.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 19:44:28 -0700 (PDT)
Message-ID: <08f8e935-1c0b-4842-a5c6-60598896f07a@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:44:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
 <agwjP2YNVeVtcYB3@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <agwjP2YNVeVtcYB3@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d200d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-51UZLpHGQMOatVTR-gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 2Lwim8ARl6y_3tv0f1IV78V3iqhJ3B8m
X-Proofpoint-GUID: 2Lwim8ARl6y_3tv0f1IV78V3iqhJ3B8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyMiBTYWx0ZWRfX36NW32bygkca
 ZlLlOSv38TlMdLDGcSEbcYu5g2jhc9ElhGknFWk6W29FVnnuatNFiBhUhna2XZH5k3Xg/yBG0Zk
 HNCJXi0VStzq8tV5jMd3I0a6KJuyWDlMYsUznOpjvWHydc4RxOXWbKkUFKaRihdG3kDaNmz86NE
 +WfD/DVrU/4a11tdpmrxVeUOZ1FfxVM2MG8ALJseFCXekLLxRMh8onev0dkcdb0rbYlVNKYT5HR
 v2gCqB02ldYD7mu54pfr/WfR9CLR+fxGWuv89e4n3cZY6/vC2KLG7+yrw2Dv3E6D0T7tig5l1Ty
 VUwM5bLhS6CjhgGaaZ/JZvJBu8SreNjb2QVefh2kEqj/eBeHAOY86I/VlMXSu92nNaK283vWpAM
 oy21fPme5GWih8PHoVON6zCxsZFxDqPgJ7R6Zq0xRacdzsMj1V00YFKuhaZNI2ZmDWvGv4fKFdu
 WHBEfWsb4wED8aPOQfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200022
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108618-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AC74586EC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 4:45 PM, Shawn Guo wrote:
> On Tue, May 19, 2026 at 12:24:21AM -0700, Jingyi Wang wrote:
>> Document the component used to boot SoCCP on Kaanapali SoC and add
>> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
>> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
>> and add maxItems constraints for SMEM properties in the documents
>> that reference to pas-common.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   8 ++
>>   .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,milos-pas.yaml        |   8 ++
>>   .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
>>   .../bindings/remoteproc/qcom,qcs404-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   8 ++
>>   .../bindings/remoteproc/qcom,sc7180-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   8 ++
>>   .../bindings/remoteproc/qcom,sdx55-pas.yaml        |   8 ++
>>   .../bindings/remoteproc/qcom,sm6115-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm6350-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm6375-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8150-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   8 ++
>>   15 files changed, 263 insertions(+), 1 deletion(-)
> ...
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index dc5a9981c12c..e81ef400555a 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -46,13 +46,17 @@ properties:
>>     qcom,smem-states:
>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>       description: States used by the AP to signal the Hexagon core
>> +    minItems: 1
>>       items:
>> -      - description: Stop the modem
>> +      - description: Stop the remoteproc
>> +      - description: ping the remoteproc
> 
> Just a heads-up for Bjorn, this will have a conflict with Rob's phandle-array
> change[1] on linux-next.
> 
> Shawn
> 
> [1] https://lore.kernel.org/all/20260507201749.2605365-1-robh@kernel.org/
> 

Thx for the info

Thanks,
Jingyi
>>   
>>     qcom,smem-state-names:
>>       description: The names of the state bits used for SMP2P output
>> +    minItems: 1
>>       items:
>>         - const: stop
>> +      - const: ping
>>   
>>     smd-edge:
>>       $ref: /schemas/remoteproc/qcom,smd-edge.yaml#


