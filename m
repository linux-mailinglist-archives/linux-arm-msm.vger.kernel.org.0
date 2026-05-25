Return-Path: <linux-arm-msm+bounces-109655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CkcHUZHFGrzLwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:57:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A875CAD02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8397303DD2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0685383996;
	Mon, 25 May 2026 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4WijiTT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvXxRQpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E5F38398A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713711; cv=none; b=rjlYlMbm9IOHrBc3Y6ZKbPK8Tdj6Zu78mHYqNn8Cvc2hwJBotK2ZLPxxBbqadHregoPQbKJd7Ey3EZVm4Jnd9dt15kL5XxIzH4NpipRr3MAFZgJ5N04rOJGbHTnrQPz//d7M/4qnKKmwWnWqf/crTjf9mlzhhzZGukTVIqOh6mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713711; c=relaxed/simple;
	bh=jrPHDUm/+lT1kV/7BLXHI5qniXBpJQbPWvYor1QGy8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8CVxDMgX/wWbysE3lzwx1k+zx8CNCpgfasoRzqRYea6iEAsSViv0kKotF3oI4kPCFrMVwqN2tkK7Yzu4nk4SFYy7naZT4cmGOIFxjG+8qkf8eAbuz/vYI0MT4sN7M7ixvnrT034aW6fUa/FidnumqETMSlOIfibkD64gPKqrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4WijiTT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvXxRQpr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P8FwWU3962875
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8RZuW+ZV8JwXDg+pkBPy+nHPlIxyE92twuTWRnC91s=; b=c4WijiTTAlmEp0+w
	/W9j6w2M5I4CbSLHhOQhb+GKTEYs6b/OyTaOphOP74L6RDMMf3sEf4JnH6f1Lb4D
	Gbad1SpCEyDbZNfP/3IEQKmwxEziephhfeC6gGKPOxzb3Ix4mIXvPXJV662XC/1p
	gnf9FCQfPD8KVVAauCuWkLJKmnR4m3jA11oKs9BYn2Xca7R+8vo+f77CfwNKuq+l
	BvHCltqO7wwY/JKd3jpNZgfBKOhYoyuxZ/oc9AGEyXVDa4/Ds3/meBl29qAIaeS9
	ohsd4NVxhiPI3Vdeu+MvPhm8l6uqv50zNVH7lXYN5l6Wj3aLA1xl62uM32hC74Pv
	onstzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6v0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90fef17f6f5so214546685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713708; x=1780318508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8RZuW+ZV8JwXDg+pkBPy+nHPlIxyE92twuTWRnC91s=;
        b=kvXxRQprFh21m87JzIZHdzrslb1EVeRg+FDQLLY1UZs14BhoBo6JfmtcijT0HoifMu
         woJmWQk47P2iWqace2TfImQ9kopGb4FUyo+FQJTUEGZxnt5EfciCKvd3YyK8JYj/zu0C
         kbUKbaOgRMqZraNvm9t6rlIlNjCFixfNKwaA/bNqZbQ1vlZmC2kZoAueTE3+D8EVMCEt
         PGXmR9yukg1jzeMerTaHL5TPj6mdjRaB2KWZv8b+sgyU8MiAiRzXXoev+l1uxzLJsKtW
         EDECNp5Cd8Jg5ADfBT7JZv4J2OxW+JOOuKIBer64+4lmuq54pLBqSWLu3f8DvRAK6ADS
         wNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713708; x=1780318508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8RZuW+ZV8JwXDg+pkBPy+nHPlIxyE92twuTWRnC91s=;
        b=h3MERJrcLQmnlS+skhmxQjeQQf18qqai32tzbPHGqKjXn6/m6SW0NcAnRyeQrOHk/a
         7KoS1aypFuKx9kwEXJU5SF7pA/bOAAdsOYaIYR8S6z3Luyl5blVtZu25eDnS+dPZrJe/
         gnw1ADwzQGTAUT3jcybHeQD+s8DZQdYSzgbsR3ZIOE+fpBuwhYYZXV7gTlfKHKfvuM8M
         kbqJVAjm8J8KuKeRAqc4dN6JIcWXlYzOdene+jbFHK0IVg4R8Hf5bPah/GOCTiRe3vDn
         ORU7S6oMqUopG4FOg0nxA+J29dAmaI4EQhSZuoWVTq60B7B8qqWgDxgAuN6W7XPb8cN8
         Ph0Q==
X-Gm-Message-State: AOJu0Yx9vTM96dA+8qU1VJLGg1RqK8Dtn1sAiNUQyAmuDX3XFMBWbetu
	3KXymfiXfS26BJqE8QNC9qT1wJJh5iB51RaBvHGYl8GXDmaB/O4BHS0qVmgItGsyBsy87b6PDVs
	Oo9j3y3HUUrX6bT38KYGyEYxqKdiieReFwb0S/k5Hcj3Nl9IzNxBbgztIvfC0paDU5GRx
X-Gm-Gg: Acq92OGiE7Ms2ZACE4/RdNid5QA3B+TwiJwURNfgorye2dnfo2ClO4Ejg815BnhXNrh
	JXPCyZRis4AFTdDMYnN5pkc/pYhF5Gp6mlvrN0YabEnw5Rd9CpK5a5JDbsdd5GBuifr4+Yy/p/j
	F6nJFh9wyW9AQVAhKOH02HWllaCzCCNNFvPuizCTc1u9Hq1wcbM7ySq4573cP6T+GGjM3UFOyIP
	BddTAZFAtPgJIHGGYpcjOmZY45nhqqmnJlNWy/uaNqr3b6LnQJ0sxn32PsfFVOsTQqf/4a5ubKy
	KWQZZlxkI3oazBGqGhV28kEEhRqBoViAWTRudbhM736o6GQvT07yq2NfVuDOV/ZvQ+ELnv8/RZt
	GkvcZ7FV7ekWG0Wwjj5AdlBW0RkuW1aeaVtBpweYzTIVprQ==
X-Received: by 2002:a05:620a:6230:b0:914:c589:7945 with SMTP id af79cd13be357-914c58983dcmr702815785a.2.1779713708475;
        Mon, 25 May 2026 05:55:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6230:b0:914:c589:7945 with SMTP id af79cd13be357-914c58983dcmr702812185a.2.1779713708003;
        Mon, 25 May 2026 05:55:08 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264feb2sm397057366b.10.2026.05.25.05.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:55:07 -0700 (PDT)
Message-ID: <78ce80bb-e8f6-427c-9620-53ae1edcb3e8@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:55:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] arm64: dts: qcom: shikra: Add cpufreq scaling node
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-4-f51a9838dbaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-4-f51a9838dbaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lJb1nT7DHk1Nw5YM5I60HAhNBMfgN_H1
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a1446ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gR7PYC-x2pxtVi67x8UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lJb1nT7DHk1Nw5YM5I60HAhNBMfgN_H1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMiBTYWx0ZWRfX89R2ZxzisDtm
 tIlKh5eKGmJpGvQClqZkeARaKbgh918CRIc6kER/ls+8sZx5yicwywPd5V1NYkWVVM93ukgY/K5
 4znjZnCIk4x90eqJ8XZOWWuHJ5sAclIo4ODXSMNvtSMKs65d5GayPuR2PLrNIywZMpLv2eu5ynY
 vaqhFVjEcWynMMoG9bkdthqfI0hrBCpQGpCdtLHGRB8Hj5uEXHmeQbKxwChX1guB/qnZNz3ip+V
 XD+idyS1FvrY5uNi5vNx+iarLsCAzgUsG4goe4XTOLNPg1CUGOYpS+VLvZoTxs3OFH263rukga1
 stG0TMh4IPWgMQkJaSIVo3CxocP6KxumjTGcuC9cPD8cmgiCvv4B1jigCiGYkb5uvSoRgaYdpg6
 K154EYKc2p331n14R+cZPJqoVpopH7hbTGJipq7yXHa66RU0C2itdie2r4FV6VtK7VddsSEFkyw
 XKrP2HiyU71XUKKD1Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,sea.lore.kernel.org:server fail,qualcomm.com:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109655-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0A875CAD02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 9:49 PM, Komal Bajaj wrote:
> From: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> Add cpufreq-hw node to support cpufreq scaling on Qualcomm Shikra SoCs.
> 
> Co-developed-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

