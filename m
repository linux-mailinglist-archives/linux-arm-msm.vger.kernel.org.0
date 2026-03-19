Return-Path: <linux-arm-msm+bounces-98613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PmuLLYp3u2lvkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:11:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B3E2C5D35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 960E33025C73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61B02E2679;
	Thu, 19 Mar 2026 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjC99iJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6CVNDYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDEE29E0F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773893510; cv=none; b=OBjgAhIMPjzOSg2MXsP0loS2sO5Pzscup7uzplKrLnofBe476u8WR0MXeqf8SuYAFRVLVROhLIHP1pZEz3apLcCCGaI4hSrVmDxY3p5tdQnpBHfYWGVPU6lOltnEkFQQFw5Ier6RyzGr5hD9B05e6QP7D6XVJyybMkTCXH8fFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773893510; c=relaxed/simple;
	bh=OrrVa3RlyBRJbuooFuRtCvVVa6sulwRLWbRfXTadJKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nojthZRM3v1DddncYByU3aHVxdKIZ8IVz/lcAujhtaw7o/KsGAiHz9ONX1vOiv/Hk8GlQueZfHs/r9X93ICWfvGvIkbN+acyiDEaSbrAylMw88m5xbxPmmg58ZRbfzC4E0Hm6BVMX0DjxuNn4kNJya+QKFDZUO2KCo9TMYbVa1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjC99iJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6CVNDYp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J3mmse1623010
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rn53s8MW+s5M7tei1g41X/kI/I6hFNfxSe0bEI8Ru6o=; b=TjC99iJbMztljMro
	ivPVqSDUZBF3qS+BosGQXhTVsICjXdANlhl8wiZDXOCT3ztVIXkzFb+03Q05u+Om
	nxwh4Jbd4T/rpm0Rva7Qs9OlN5wIK7zz5PkwiI6uSRN/9kKVKISMhIjotLBUZ2pr
	yp8ZDCvih4Q+RbA7SpU/Copr4g469xuqIkuAkn09X3N/yIWlW7av7sH1UcxKLj3m
	9DXtP59Bu3Ec+SSAC/eliYCZtbGD3aCU7YhnSbszBewtjrEnDLOzqDJjHOW0Sn4a
	Nb2cwnG5NBh2SG/pTLwkWJS+o2rYu9yr92cx3yskmrH+tPu2JZlPdJh+zRhtBZ+a
	wz5GHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9hph2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:11:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b064f043adso4539855ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773893507; x=1774498307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rn53s8MW+s5M7tei1g41X/kI/I6hFNfxSe0bEI8Ru6o=;
        b=g6CVNDYpxreBnB1HzONdNDX5UtOddNCzXambOM3zp9f7unvIwgszu+BRf+fW8T80my
         R8iELvwaf1/7Q2j13cF0IeNN239SZuVe7YLebmAecMKQStzCsixQrfbOVawDNf7kLgNG
         7p3rcqJf6dDr9Bu668Oqeb7NqOfjw11PvlHSVacw/SHTtSrgL+rXtnViZ1e22pf1lE0Q
         gpVCrVCjFOrNfGxUaACqiXlrpaTYtrfodX+NvuFUAsDVRiZmy9Vm75ZAPhP16N13+MGy
         bhn/emWnowmPrRvBeWJXnHn+LCKkM6GLQIN5S8GsarBQA3/833fJfy8PSq6ORA1pmhhx
         zGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773893507; x=1774498307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rn53s8MW+s5M7tei1g41X/kI/I6hFNfxSe0bEI8Ru6o=;
        b=pfEBBWTxX2jnYnodnbjQZzLMbuv3QFgai9tHTcEpHIV5cZYF0usIo1fBlbVlruX0Cm
         iKsCuKkHMhc9z1VrhG4FHSia7i8PXHEYg487H061ZYKdomYr1bLrxBofdp9kQuLGG0Jh
         Bz61Guv3CUJ4JbIUy660rHajYt1SoFX/orbzmtm07rgNAGlTaP7VpWVxuwTdxItdPUfQ
         PtGEPRsrjBTJz2mXZnAzjNxuukgo4LKUcls0Kt+dK8D6S4D7zs5MgpG3AcLmFxXpg+0G
         ic4+fLzyCKOPHY51yUdL4D6xHcog9r5PpTrEni5eHEIyD3KwJwPHqCPj7NmlFaguUUkG
         3CnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhOBtkShdN/pwmHMbEaAkrDTgD+oGD+r63/EI/aMFBqTm8ZjI0xlgbH1dmLHrcixBvZMRoBkROlpNXqT5C@vger.kernel.org
X-Gm-Message-State: AOJu0YzI4TrRer+Hu2xuo39bwq6BlM56eDVFWy8+3KBS6JuOy33LOS6n
	nb0qvRZcIiYEcojMziyMmPd5D4v0D/k8LertHhmj/2DSR8Y1zaX3BzA3/6Bj9DY/xGHQFMeKUhv
	QSc/0x7rKy0LaAQTQL8XaS5ULq0OaQlKD+nkjMwjEl0aLVK66QA1X9feS2m6MoYWT/1t2
X-Gm-Gg: ATEYQzwTlimqXkWHimC9Tch13oA5Ep93dDba/+CkkG6Nf+GGpUNam0N4+BJ/eeFOtwJ
	kHS0nL3Vxx3p99h0l3hhs9+g6SAFsk66/hEm/VYiZgvcy4wqHkFmfYPqu8HFSRis//0B300i6w8
	h0mI9yIcd5BFFdYnph4zTwlM31k4Q4o1zzuxkIpZywDrx1fZsPZR9MtuEXhBBvmxiaBtMpyxC4m
	Lt3ovSPcpwsMOsncqj8XLa9gjRS3Hgv3Gphm9acZPavftKPpvXObvZXBOm5t5/WCDKbyrTJOj5w
	aX1nwgh4DDW39xpRmns5KxbvG7jvXEO9Hhirg/2VNGhOzqw8XE64Nj0AsVpECsIjJq4rYsaBYas
	dp+I7+8FoHFtd2Ww99A6exR+zOlKfhY4fsjOeS6PQmz2OcNx1gkn4HgFP8bBiCqGoDyvQMHTmkS
	BJeKVeKpgIMYsvcbDD
X-Received: by 2002:a17:903:37d0:b0:2b0:5cb4:d894 with SMTP id d9443c01a7336-2b06e349cd6mr59894555ad.13.1773893507204;
        Wed, 18 Mar 2026 21:11:47 -0700 (PDT)
X-Received: by 2002:a17:903:37d0:b0:2b0:5cb4:d894 with SMTP id d9443c01a7336-2b06e349cd6mr59894285ad.13.1773893506638;
        Wed, 18 Mar 2026 21:11:46 -0700 (PDT)
Received: from [10.133.33.168] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e619428sm42387695ad.68.2026.03.18.21.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 21:11:46 -0700 (PDT)
Message-ID: <82cb8d64-09e2-4121-9317-d1308b260534@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:11:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>
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
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-6-0a91575e0e7e@oss.qualcomm.com>
 <abEnu_ID-wIMYpMB@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <abEnu_ID-wIMYpMB@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMCBTYWx0ZWRfX4W1Hfg31CR7k
 YuAVITFoYjtJYkA2OJfEO0v0CPmV6dB7kjONLRcZBchqdN24X8FQ28iDJHSt1K1NL+tMrDQA1ky
 99kwtAfBt4aLUEBLVdk5KijQDbDZyYxWz6PECByZwx4jJAYR692VZ1T5HGImV0+HPsxwiOaUezE
 1WdhqngFeZglZnIqgACslXuciSGjeG4mImeiB+1iZR8d5ZxfCF//ELnLQn5SbZQEk0Rvd8E9A+J
 NQE6EDnd4IOJpDtl9fC6fAnqFw+dwChArIjT+fgi3V8hLxb3top4YIqhKSnu/8Tua69YlSHq87Z
 XE1M1UaGuHUm5pkLtvA4cDE5MFbkN1u7LbL0AXUpdyhzsG+YP+gAhpdP8mU5mEXYwYgva32C3vX
 IVt45rykezN3B8OVbS5H9kQAKwyvLQGZDj+iNoXzDWnoTdaGcu55MBm9b6q0wlRn7DcB4PNQmFU
 IZYaabk3ILvcsT+T6+A==
X-Proofpoint-GUID: vy4imuo2fg-pwhlyWPhyadJHU1V8YzyU
X-Proofpoint-ORIG-GUID: vy4imuo2fg-pwhlyWPhyadJHU1V8YzyU
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bb7784 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tektXMGjzHmvKWkVxE8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190030
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-98613-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22B3E2C5D35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/2026 4:28 PM, Stephan Gerhold wrote:
> On Tue, Mar 10, 2026 at 03:03:22AM -0700, Jingyi Wang wrote:
>> From: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits and performing ping
>> test.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the
>> subsystem is ready either at the first check or within a 5-second timeout
>> and the ping is successful, it will be marked as "attached". The ready
>> state could be set by either ready interrupt or handover interrupt.
>>
>> If "early_boot" is set by kernel but "subsys_booted" is not completed
>> within the timeout, It could be the early boot feature is not supported
>> by other entities. In this case, the state will be marked as RPROC_OFFLINE
>> so that the PAS driver can load the firmware and start the remoteproc. As
>> the running state is set once attach function is called, the watchdog or
>> fatal interrupt received can be handled correctly.
>>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5.c      |  88 +++++++++++++++++++++++++++++-
>>   drivers/remoteproc/qcom_q6v5.h      |  17 +++++-
>>   drivers/remoteproc/qcom_q6v5_adsp.c |   2 +-
>>   drivers/remoteproc/qcom_q6v5_mss.c  |   2 +-
>>   drivers/remoteproc/qcom_q6v5_pas.c  | 103 ++++++++++++++++++++++++++++++++++--
>>   drivers/remoteproc/qcom_q6v5_wcss.c |   2 +-
>>   6 files changed, 204 insertions(+), 10 deletions(-)
>>
>> [...]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 46204da046fa..4700d111e058 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -36,6 +36,8 @@
>>   
>>   #define MAX_ASSIGN_COUNT 3
>>   
>> +#define EARLY_ATTACH_TIMEOUT_MS 5000
>> +
>>   struct qcom_pas_data {
>>   	int crash_reason_smem;
>>   	const char *firmware_name;
>> [...]
>> @@ -510,6 +521,80 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>   	return qcom_q6v5_panic(&pas->q6v5);
>>   }
>>   
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	int ret;
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +
>> +	if (!ret && crash_state) {
>> +		dev_err(pas->dev, "Sub system has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +		ret = -EINVAL;
>> +		goto disable_running;
>> +	}
>> +
>> +	if (!ret)
>> +		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	/*
>> +	 * smp2p allocate irq entry can be delayed, irq_get_irqchip_state will get -ENODEV,
>> +	 * the 5 seconds timeout is set to wait for this, after the entry is allocated, smp2p
>> +	 * will call the qcom_smp2p_intr and complete the timeout in the ISR.
>> +	 */
>> +	if (unlikely(ret == -ENODEV) || unlikely(!ready_state)) {
>> +		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
>> +						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
> 
> I have asked this back in October for v2 [1] and again in December for
> v3 [2], but you still haven't really answered it. Please answer all
> of the following questions:
> 
>   1. What is the use case for this timeout?
>   2. In which situations will the start of the remoteproc be delayed?
>   3. Why does the boot firmware not wait until the remoteproc is fully
>      started before it continues booting?
>   4. If the boot firmware gives up control before the remoteproc is fully
>      started, how do you ensure that the handover resources are
>      maintained until the remoteproc signals handover?
> 
> v4 looks a bit less dangerous now since you don't enable the handover
> IRQ anymore. Still, I don't understand how this would work in practice.
> Removing this timeout would be preferable because then we could actually
> support firmware versions that do not automatically start the remoteproc
> without having to delay the boot process for 5s.
> 
> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/r/aQHmanEiWmEac7aV@linaro.org/
> [2]: https://lore.kernel.org/r/aUsUhX8Km275qonq@linaro.org/

Hi Stephan,

For question [1] and [2],
We tried to answer the reason why the timeout is added in the comments,
but seems it is still not clear enough, it is a design in downstream
code to avoid the irq is not received when we check the irq state, but
indeed it seems like a redundant design and may block firmware start.
So we will remove this timeout in next series.

For question [3] and [4],
I think it related to how to deal with the "start" if "attach" fail?
As we will remove the timeout, we have 2 proposals for this:

a. attach fail ->  keep the state "RPROC_DETACHED" -> if user echo "start" -> call attach() function again
                                                    -> if user echo "stop" to set RPROC_OFFLINE -> user echo "start" to do firmware load
If attach fail, user need to do "stop" first to set the RPROC_OFFLINE
and then "start" the remoteproc for firmware loading.

b. attach fail -> change state to RPROC_OFFLINE -> user echo "start" to do firmware load
this is what current code do, if attach fail, RPROC_OFFLINE will be set,
next time user echo start will go to the firmware load path.

Could you please share your comments on which one is better?

And qcom_pas_attach() is called by rproc_add() with auto_boot enabled.
if qcom_pas_attach() return false, rproc_add() will teardown all the
resources, so in rproc_trigger_auto_boot(), instead of calling rproc_boot
directly:
	if (rproc->state == RPROC_DETACHED)
		return rproc_boot(rproc);
we will schedule work to call rproc_boot asynchronously, like what firmware
loading is doing now, to make sure rproc_add() can success even if attach
failed, and we can do the firmware loading in the next step.
Do you think it is okay to do this change?

Thanks,
Jingyi









