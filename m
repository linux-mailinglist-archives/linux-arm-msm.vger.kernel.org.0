Return-Path: <linux-arm-msm+bounces-110250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAcRIINrGWrGwQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:33:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E25600E2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F5A130B59DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9078D3C9ED5;
	Fri, 29 May 2026 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnjH83pm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8lK8B3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9353C5546
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050423; cv=none; b=br+fqLSdGazHDswYSATOqP0r93LUB7llo5hzU55Zo3dHGjOuArsKfZDHM40HiYGtja0ZEnhX3LznehdF3qmlV93JkdDCwy+NOE0RDpylpttavK0JoYWkXMATfN7SXhUGpAFI+QHG9awsjtpDJfHYB3SvXzvfA8i0VvOXzRqS8h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050423; c=relaxed/simple;
	bh=GoudkZUV5bL6tBLR1WtpWYzy+F1/jpCD3JWPQneE1Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGvoUQzzj09r2GW2AAGQ9anZjv2pMPyFZTBceyfz3GLQvswK6mEgrLEENeUcPxVx5ySkZpPmHMzUk6BMrdq7gc0oYeVtQN95bdaHOdFu8CThfzRETzYNIgEbWRgbfpL8Aw3nJciduJ+5me7vIYFpY1CRJzuLjGpwgCORQ2fsPFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnjH83pm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8lK8B3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6GGvL1540321
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=; b=RnjH83pmAiHippPc
	S8Rpcc0JtoOlC00V7WG6iwGfN7zy8LACGNPmwF2lj4ssIkCSQKTe2lp3ydgghZSh
	2vsEzkgpI/6d2JE6zfXYawhB4GdsE94tpo7cEAsIzd6Tf2acI5kOq4wrvBuxR5q8
	qt2f/tu20x7cOvyoK9ewN4wRskuWQCnWCTIe6xFr5RDLOyHejlf5mraiVL4RbuOZ
	lfHt6yeT68OKQOrphefe0GhutNGdUwhbBeRXpIuep7mB637G5zN8bKrtTl8ZbJFq
	Nfh3BqAD1JpjIWdISZLQ8PVQtJ8S/96C8neK05tGTeyJ0zcklezAMcWXOYiJmUcS
	Ay1XlA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4uneh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:26:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so539799a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780050416; x=1780655216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=;
        b=R8lK8B3ZkyUEuDcCnRBM6yGa4S9nOVQ/2OAyymih40cF7HYQpRlmoomqAK4eF5UAdh
         200aCPaT74gHnyM4JF9xxcfcnfmcRMJbIDs4en4z9ajPcsWnwz7C8KoD1dSFuz6SBXVj
         VkHBzX3CxfP/lPZv6v1uF5uaCIWI5OMVAuH30aPZznXt52cy1N4nZpvPGjHq117aCdDh
         e5IQP/+1HSEBQyhTQQgarIzGSZaN+tjXuRqQJsyKIflrG++jttNsif+B8iT/tbUN17Ao
         xsLG2XmGWxUb/wVhZRsCPesj/QWw+1V8EuOcHg7o21DWztKt0N2BfcCmQv+LE7srHIe1
         /flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050416; x=1780655216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKcwd9MWaUtPKni3P9v2KO6dNdslVHLHPQmpmH4aFvw=;
        b=ByBYJGsOPVi6N6UwqUdQteAk24yurCfEM62OKwgCrBWO70QIaKM55AhJknDB2OL45s
         wkNhedF2RQ2qAFxNJeLyz2yG4ulv+SPZogG74Z4FwOMl4d2pF/SYJbrNbq5ShD+6hrdE
         4oi3zSsgJMX+8nL1jzXnQqBCR8OOqBtGuJYwaSZSDILWNkt8TuyjwjS9xXq7I2k7KJUi
         RowuwrmCv7cOO+B99JLHRcHRXiz+wAPZtUOf+zAdU416OWusrm0geefGM5nm+CQ4NUJG
         EPyMzrP6gFYcKmFxbY88fnASTq6oijqN54Y1Wi2KQDjMsl+zLIBGvDhGO/esnvS1F6J6
         3nJg==
X-Forwarded-Encrypted: i=1; AFNElJ/bSIhp1WkALGl+iOyx7hxQsmHQMgQQ7PYF4DxIC2kTkM8JQgnxrhJ1V9yPCWlK/Glm7Zuz8uvXNyEIeNL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yychy1vEg+N5g6RWP3g9B0zS5L6sJhdblZeHQTAlVYo+9wuTm7q
	6XqADhcBbgB65cIwT0WvsxgXXO0o6NGqbYmI7IqJAbMtfBdaOKNdc+N0a4pL7+jaH6VCV2PQQB5
	0d7gHjXhFLf6MH9GMOZLQIIzZSEmkjL8sTLl5ISwl+1I+BX4GkWUPJIr/8k3igo307Opf
X-Gm-Gg: Acq92OEFSsDQBu7+Ioveh6XMGblLCXZv89qjpaE6UeHTNfqSrN24rOnpZPjd09qLd9n
	TNsPAwnTEyOxhykh/S4Cmgrho56p9jFUaoeMBb/5zyLR9wVKKk/jm6r7Y5K94RRauPf0oQnrNq4
	gMwHoV8ZYMiJVoThyHWBT0X5CVBGiTL+yadVWvHLHEJvvehFJSeZeEe/0oDD6XuSB4Qe4sr5xHY
	17bbjBN3ITfaYOLPYt/YL9+JY73adDwG8cLZZ9rHdPwEhJKmM9VGTmCzgrfFubPonE8Y6JeVL89
	LufMaGN9RoQSCM+xPXKZliywdsORWaamG0KcI/l5liponzrR+oO2uqpgrHCFflLRqIryMkPICGg
	nzmFWs+GUuSqo02U7FY9ktWYJmfBTzU2WcfF8O0sbvMyrjqzgZj6Lw8Vyc+QWUjG601cg15624j
	yn78aF+35su1qYejU3J+PeTQ==
X-Received: by 2002:a17:90b:4ccf:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36bbcad635amr2645395a91.4.1780050416342;
        Fri, 29 May 2026 03:26:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccf:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-36bbcad635amr2645363a91.4.1780050415867;
        Fri, 29 May 2026 03:26:55 -0700 (PDT)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02b8b57sm1804194a91.7.2026.05.29.03.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:26:55 -0700 (PDT)
Message-ID: <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:26:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rPMActHa9ReIyKxqs7zwp5p8LwSoKWa-
X-Proofpoint-GUID: rPMActHa9ReIyKxqs7zwp5p8LwSoKWa-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMyBTYWx0ZWRfX8c7ORVhAFZVI
 uJShrXZ5ZQ/ZUQ8xILq6AdW2WQtKX2dytwlV8l9NaU9qN7veayKs/nctRT0ViGRCB8aw+yC6RjZ
 /1ghiT5VPO8lj8Fffqz435v1KbX+m8aiT0ijBZJFhzQWL88YrzOuRywemidbvjafWiq3QfxECyp
 COCmX2K+y105diEjYHDzfPDw9OjVsJzklVs7bvC5sYuCkwkxxzwlyviD05ekifiqhDvajAvUbZa
 SH63j84L8TV9LzfeosEaMIEl2vzf+tZ4iH4tYFz43SwtHD00DMLqEVRb1QmkaBZFnO0AkG4EGne
 RVt5ASXv/waku2S0LxDCA4PYpJ1dEVHOuRDJQ03gE55B2HX4YOa5z9klV7/HNakWZ4JzMXUscGg
 2fHvnLxdsu07k1l3kbanFrfymKWjLhNvKSg0hG4jfQX5YhU1uZl6S3YH1PHp7gnX5PupRh3ZOaC
 z25zkhxNQbMloquw3Jg==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a1969f1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=nTQ8HVyESOUA6E9D-IoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110250-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03E25600E2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
> Hello,
> 
> 
> On 04/02/2026 02:22, Jie Gan wrote:
>> The DT‑binding patch adds platform‑specific compatibles for the
>> CTCU device, and the following Qualcomm platforms are included:
>> Kaanapali
>> Pakala(sm8750)
>> Hamoa(x1e80100)
>> Glymur
> 
> Given this is predominantly DTS changes, and there is very low chances
> of a conflict with the binding yaml change, I would recommend this to go
> via soc or the qcom platform tree.
> 
> For the series:
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Hi Suzuki,

May I ask is there a chance this patch series could go through the 
CoreSight tree?

Thanks a lot.
Jie

> 
> 
>>
>> Since the base Coresight DT patches for the Kaanapali and Glymur
>> platforms have not yet been applied, I created DT patches only
>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>> and Glymur patches once their corresponding base Coresight DT patches
>> are merged.
>>
>> The Hamoa‑related patches were posted in a separate email, and I
>> have included them in the current patch series.
>>
>> Link to the previous Hamoa patch series:
>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in v3:
>> - change back to the numeric compatible from hamoa to x1e80100.
>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v2-0-aacc7bd7eccb@oss.qualcomm.com
>>
>> Changes in v2:
>> - change back to the numeric compatible from pakala to sm8750.
>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr- 
>> v1-0-a5371a2ec2b8@oss.qualcomm.com
>>
>> ---
>> Jie Gan (3):
>>        dt-binding: document QCOM platforms for CTCU device
>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++++ 
>> +++++++-
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++ 
>> ++++++++++
>>   3 files changed, 340 insertions(+), 1 deletion(-)
>> ---
>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>
>> Best regards,
> 


