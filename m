Return-Path: <linux-arm-msm+bounces-97882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KhweEF/Pt2n0VgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:37:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9BE2971DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B54FF300D609
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BB838947F;
	Mon, 16 Mar 2026 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXrGPEhd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFF3PfS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E2388E7B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653849; cv=none; b=g26iDzHbkDkUH8nYGR3PQmYvHyyaT3Nqtzv1QPuCKp4x0Ln4bfiLhlRhGW3/mlR8E7u6lfz8s140ZvH44bgV/DB1Z7scpvVl8TqqhlAgatElWP4k936T3TCOV+nL0wVGXvDZSJlHgs2H72Rq5NnmMylaXoupGlqZ6xAAohBSQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653849; c=relaxed/simple;
	bh=DbvCh94rpXDv7WluBYY0jPnaT6bK+G4/fSGmypdNLWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxDXCDIQ/F1KkbOSss1obj1VThTLjVGnHMxQh4cJPBQFGFPSj20KNStHnh3MJkRBwJ82FyTUzIa+Yt15eqEPG+GpcbK2OKm9D0vzkbHYO8Ae2tkepBbwg3Eet6TQD76AYAdcM07icwHPrA00KyK/4pfa9Im+aMn8wyj/MkQrCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXrGPEhd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFF3PfS+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fZ5538850
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vL0QFFEBT4HCnrXbSuzaMv26nwLRIwkg7ItBWYHCTmw=; b=XXrGPEhdVCVgz8gy
	tBUuw4mAsye4Rzy8JRLsrKWQHrc/dOuqFBtj43aBPfI+oH2OpN8BR9cHcsAOXf27
	ghIcwGPyo3x6cLnmvGFFSBnXPx7VM5bE2ilYfu5uexAercdLZx9FJYua/b6I6tfq
	5TRhGz0W5GooLJYsA3wVewwaCatvZEI3yI4sRqAPf004cy8jCLnZw1DfXw2Nvksc
	hzwAJBgKUk2mxRtQdKmNt9FZUGRWpHNN/0PvD8uT0Foka0AtMi5bPLGk9Xo1VrVr
	QLJ1VppyRyJinhwo20w5Ied8dtp6swAKwWk0lXLNiGKLdMPgPSTDsmCQI4M2bAW2
	PR2LrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5n217-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:37:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aec805eec4so28396045ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653847; x=1774258647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vL0QFFEBT4HCnrXbSuzaMv26nwLRIwkg7ItBWYHCTmw=;
        b=VFF3PfS+w2vKaBMA2coDKnxumgvN+m2r16tk19Ql9X8Yh5acpmTGhyRGH8aLXnDunn
         +QaTOHHQTNdxrGI5dRKr0XSzhj/vYI0wBoV/oC6tyArxdUc9brFE+B36XJHERmphu1kK
         cMSsXNCavTwJ2tNlw4AdPp89Yk5ITiDc1ZnmgS6xewUrNeaAmZwZKY76vdUSmrIX7zr7
         6fR1xh2hqb4bETokQrU76FPyzOkyth5Mua+7QBY/ePCGZM6vH+9NtMayAnwhQN4qIJUv
         LxKiQCL6ZH9QENkPYfTlpRqj8sf3VWJO570OWgfeRMUoKmoaqQulGY9fi/iu32qc8xUd
         GRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653847; x=1774258647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL0QFFEBT4HCnrXbSuzaMv26nwLRIwkg7ItBWYHCTmw=;
        b=SW81S5ncUC5KaPgUZa1zuYzk9QfgZNi6pQkhKcJjAeqez4MbuVnPrQBDfoCedvv1/l
         jP0CRpJwf9SDZdqF4hAApsBEh1jOgGSa2d9eiHymSg2PxFQCNgMU5mkR7AR+tyB5t/Wf
         RbBTOi3YyJ+PXurN9DrDVRx4CT+HNupMw5Upv+grjfnX43xRkWMF7FxHzUXn42dmUK/u
         WQ4cVoPTj6br8KbUkWJhcuaG22Q03b4e/l1O3dEQCJhDF7euWQ18ApjgDDwCcGEKncjR
         0jtAUSxbgtkHDDY/LSJtU8EMGOO/rtVegRpRbLM2x+JaILzrA3az17R8vibBFG/KlALG
         HtYg==
X-Gm-Message-State: AOJu0YwhGRByx+G9Q1tNNyIDcpvHLWbgvenrSvLzuUv9HPjzJNc7reP+
	0XYKgd5lh/Gb83ocjaAtEs9oeEyHcj11V7dMWGPELSOmg7EltgnQvAnOxGprKLkJpnizJoEZYgs
	e877OEtHI/XGnTJa0A12o+/38d26zidvmE/yw7wtu5pJzQnuuyE46M7okhEit7eKQIBKN
X-Gm-Gg: ATEYQzxuD9U9fJCogDNVLRt1GJZLlKUWrdxtlitkEDY7FCvOyWb1TIfTxlc78nwssbg
	ETymS3UkTNZdEUMzce4BtFP6vnzfztIzbUrqg3v5pqL0D5s3HDPxNLeY4oRrhmS9cJ4aUuLSEnn
	PBeR6Lwpl8WtFrIpl3FBghD5c2yrZm/pAKPkEnuC3qMyL9THtvWhCXJ2NaCGkF7ldqgPLziB8jX
	aTZ2x1J/SpQoclrI9U6C/o1rwps1a9LQQiN0v24+dsavB5cJ5YAcA/aTDg28WX8iG+nr8+OpKGd
	O3bthvIHnFVyPngsoOUJ4zk9MKEWmtb0W1JnBe1UnRHh7AZqckr7G077Doins4tGsIA8xzJRi/I
	eYVUE9sCUTFTcaOUfEMeZQWo6K+aJx8ZlEvFvpCuhWA/sXyDubHoQrYrYKpPT7Js/s2GoQQJyqr
	OU33sBIvC0YJjowfinCJoPRngTMyw051HrJw==
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr114987525ad.38.1773653847106;
        Mon, 16 Mar 2026 02:37:27 -0700 (PDT)
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr114987095ad.38.1773653846553;
        Mon, 16 Mar 2026 02:37:26 -0700 (PDT)
Received: from [10.79.197.144] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05f0ab2b7sm15664115ad.39.2026.03.16.02.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:37:26 -0700 (PDT)
Message-ID: <e72263b2-fcd8-436b-b283-76a90ae0effd@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:07:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-1-ca9d0efd62aa@oss.qualcomm.com>
 <de539038-7e9d-488b-a6a6-45396247bf63@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <de539038-7e9d-488b-a6a6-45396247bf63@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FOCdb_kZI9LlWDzzesS9EWDMVgVCo4Mu
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7cf57 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=yKxla6SPEuOvPVJYePEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: FOCdb_kZI9LlWDzzesS9EWDMVgVCo4Mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfXzDLNHx+HaZ53
 I1HLiGusIfE474jMx5LXXKU/jnsu3p6H2ZnjtT7IafRtZNH3WJjgahs4zTwpcFxPRxQo9X5Brqi
 hbN/bAxQhyoZxqbDpMqpXfX5c2pB1t6jlFTdbwfiNor6hrPiSlO94/dmb8HGz/tSYNCxkuV+g4O
 i+4lq3bpgCDPAVqyfSJC6CCTy4QjyWLCphSuc1SPU1g2VrB1TXkMPUvWp/Awlmq5S2HU+dYXVBB
 dVOiezOusk/0Ne3ti/ljz49uVwxED+N5Ly5wCRIoKwrL5Yez+t4KcMIwHzXyvlkcrSlh+zEeEHO
 QxKVp938n6Taykc20u9hWEG9CmkAhfvaPqY0349XjI0geQaSAJ4TtefwAREWSxQcnfHdQTUx+sI
 1c+6ReCS6q6MXJP4txK+HSa8NkUxbZ4oHPHW/Of/g+DvXGhbEmQTtSwU0UIUxbY8NpOOp1t1dHP
 jlRjv4958RW2ZlSgDig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97882-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,bootlin.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F9BE2971DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/14/2026 12:31 AM, Krzysztof Kozlowski wrote:
> On 13/03/2026 11:29, Anvesh Jain P wrote:
>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>
>> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
>> reference devices.
>>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Noted, will fix the subject in v5.

> 
>> ---
>>  .../embedded-controller/qcom,hamoa-ec.yaml         | 56 ++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> new file mode 100644
>> index 000000000000..baa95f06644a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-ec.yaml#
> 
> Filename must match compatible.
> 
> This is a standard review comment already documented in kernel and your
> internal guideline, no?
>

You're right. The filename qcom,hamoa-ec.yaml does not match the base
compatible qcom,hamoa-crd-ec. Will rename the file to
qcom,hamoa-crd-ec.yaml and update the $id accordingly in v5.

Thanks for the review!

-- 
Best Regards,
Anvesh


