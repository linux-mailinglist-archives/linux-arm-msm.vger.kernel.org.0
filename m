Return-Path: <linux-arm-msm+bounces-109999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBKYIOLzFmquygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:38:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A0E5E51AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 191EF300DD7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE8840FD87;
	Wed, 27 May 2026 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHfLAHLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMaBncSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D7E40DFB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888783; cv=none; b=JZLFbMuZXa6zc2p7YDn9cq8Z5MekSSqSLStqruDZ96wuLokk5XL3p+zQvqEDbTyv8koJXVM/DFgs2h706pyzygTGGFovUWEJfQFuZZqiCQE7VoqnQsK9dX56VUezZjgmRhl1XlRzrEEnOXWhlZ6MUv3qIlOgjojS2BOY11mKJFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888783; c=relaxed/simple;
	bh=GeKLc7/+dJvLDIky390YOmE9RaNQtsnp6BD0MQMUEeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWAiGxMNPiVDuukGnJ4uuxPNzwKmTV32Ztx+SgAnYalnpaAfQqNn+2QvITnpKIIMWNcNUUtBA4HLaHLr63UXwJbDPo6Y9s7ofoB5BQivbiA51vWbWlXPRRyBHZdydxbpucfLweMNhtkSDzSIM23bUtfpQrZVaJv8L6T5UNIQB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHfLAHLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMaBncSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mWul2152353
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CL59JHQMdaZ9xSO2ZRHaR8OddiR/bapur84ZCcORKo0=; b=WHfLAHLXddp08c3h
	sDZgxxFDiMINQqglTS+vQtgTGGoCi4s6zyQWM9ft+o1zGgHOPqfAL9ufQmBcn0CX
	Z+C/ul4DgBa5BR7KVgqtzDmlvYDqik6jWm8gvRj1Vtt8t+G97DUNJQFM819RWyvr
	5CyIJiYWGpjsfHHXfZlmGyNbhe/bwFRLXwT4wqhfzuaxLGkCT03J+fNlIlpcTTGC
	rQlFVzv+oy+FbWzkzKuTt+4/QOvz7ImiBwkW4JSs88Evbn4X2ZcspqUhoeG/70Kj
	XbeNXO3m4GMXQyGsV/ggtSud/dN3/BHMbfGA9S2t1ZlFls4kcHTRPln9axtEI3c0
	CHJOZg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rhk5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:33:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82c84be9c3so5507089a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 06:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779888781; x=1780493581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL59JHQMdaZ9xSO2ZRHaR8OddiR/bapur84ZCcORKo0=;
        b=BMaBncSqr6ifLU39d2icZY0JyVpxzVJD/8EtWg+K2iLMyhpo29/Z+GqGbVcyiRQsgk
         S94JEbnh9sb8/PiYo3ZsiXPSZVXjE2r+tP/ZBdlj/LGjIKxXvCXl86TmE1Ya3jvSGXSf
         uoLwuXF7LnKrr51Kvrn0KvoEb9xaWnxJQBW3pvSfT3oYdGDk39MQnEGy0YE+oA3gcZsb
         f81VdlYTpObAZYgmmLy/zMP/s1pbxGLJ5WWB8ZH05Uiy8z6Yunc0DcR3zH8vVmGBz3+/
         aNGh5OECPF47rTkbBRFRp++jXz5w8F6/ISLPtQKmCXT+YEJZJoHs+OJo2ri6ZSaC5jad
         RJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779888781; x=1780493581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL59JHQMdaZ9xSO2ZRHaR8OddiR/bapur84ZCcORKo0=;
        b=lhzdDn2QZtaUHAGPV+WHaQVtpt1fMeP3qF2S2/uen8tj/cB7D/wNYljl16OURBGbSz
         PxX7oHfuDJt/vvOtnN3B2m2X9pz3wPTWv4ysCHjEwGbm6WV7MSppA0waYxFVUBjajDvX
         mIjUVqi4gdg9ilq64bhjhrsB6UuGWB9cF0IvuG112QXiOWLmJ/of9ITwLD2fbDtqyeoS
         7833ryhCdBEGoA2yhZGypLRpaL0KTqNQ7Xqf27hYUKSy6c5vvfC8GjWIJ4slhi1brvXz
         1RjC5jXpse77YZXUzG9snB616nDT6DBnpXiyJgOs3xBTN8TI/9Zis37nWuhYNfOXJeeW
         dIzg==
X-Gm-Message-State: AOJu0YzyFmWMHZcYfeBqZd4dGutcqHupBr0WrJBfeaJAQLOsjYPKXj5c
	UMmwV3EQNhCv8EfmA2ye/bNNslXYy8bvAP4cIvTjtLeR6YWwcp7L1N14ahKwghulXzj/JfAktem
	XamKrpRjI6vBYyAOJKrelPr6rdhTU6o34GP1B+L8pQg/QDANsvjn0xzJ4EORpC33gJW/W
X-Gm-Gg: Acq92OE0mADZ4mLbrTjskzBE/7VrIn8CesM8GE18x7/DDdSm4xFSpCp3tM5+tAsxmpX
	rd79eKSNLdNJT4UxGbeONZqDJDynMK9l5j6OyrX/TenNID+KOmCVgpgloV6rgvC8b9l9cXh4sZ0
	hMcetWDK9TlqafM5b615H2V/7rhvcwh3p5BjujcHD8wfgApryrEnsWBYvTLg5ReNr7YPBXOECfj
	oESpJOfbmygRPEjzjUjHSue3bHAHbfeN56qjUgj0kMaWQfybb/G3BYmLZOIL2GkXispcKTLIK1C
	DD4Go6oYfn1CGmR7StX3N+7Zzt2aqDiChvZ/IFiuEbPYsXYIyE7nSeShR0qXJ+kDLFDCPd+/Nzm
	YARMizFno8RRb2oy53QhSGWGvwRIGyWRtRnwEeFJf319wLyJZ
X-Received: by 2002:a05:6a00:124d:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-8415f3a54bemr21955241b3a.45.1779888780749;
        Wed, 27 May 2026 06:33:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:124d:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-8415f3a54bemr21955194b3a.45.1779888780182;
        Wed, 27 May 2026 06:33:00 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e80288sm2663478b3a.10.2026.05.27.06.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:32:59 -0700 (PDT)
Message-ID: <3758be2d-4553-40b3-8ae6-bc3e502d0531@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:02:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
 <63752557-6468-4aef-a847-06aa39ce108d@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <63752557-6468-4aef-a847-06aa39ce108d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16f28d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ze1idgdxkBYruiX_gtsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMiBTYWx0ZWRfX0UIvZ9h4mIGM
 RTc7zuQLbG/pYH7YvXJoGORbwc/btfdhhOTu0jBN83qqcxeD55o8xkiP6/iaptBSfksINMgTMvQ
 DtL0qQ0gLKr/hrfNUTgzEJYpzxIyb76ASjbRcYjNVMmoqtyeF5xTcZzmxttSfmFwyH9HmlPwHGv
 z6jodpWE0725X4eDUsfb70fs+pFd6SLdg2OdRU0fgGcEv5t/iOv4xqr/o6LWPGeqKgq2xk3rGSf
 FShi/K9TIwI1hIFBJoae5OUaLBleM/yy0vplU70iBRv5glRg5Cjsr19227n89OvKrOR0B+r3ve5
 Q5trbS5ENfA2FTZl+4Wdp0niJ0JbiQCbgWMBgiy7lBd588NVTHWZ1fEZXnMZSmvrv5rnXjUPzVV
 9BqTSgXY1+aDlPiG0IONQz22+SY4zyzHXXYBWFZeBkjjTBuAsE4ijfQHP2+52/s1GgpOz7hZt9O
 EKet3s/ToNsxgCCaXNw==
X-Proofpoint-GUID: x6YSRMXmHArc3wZHqZ0Zs3zrutmAbJ8Z
X-Proofpoint-ORIG-GUID: x6YSRMXmHArc3wZHqZ0Zs3zrutmAbJ8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270132
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109999-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1A0E5E51AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/25/2026 6:46 PM, Konrad Dybcio wrote:
> On 5/22/26 8:02 PM, Komal Bajaj wrote:
>> Add device tree include for the CQ2390M variant of the Shikra
>> System-on-Module, a compact compute module integrating the Shikra SoC
>> and PMIC for IoT applications, designed to mount on carrier boards.
>>
>>    - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
>>
>> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
>> regulator definitions specific to this variant.
>>
>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
> [...]
>
>> +/ {
>> +	gpio-key {
> This is usually 'gpio-keys', reglardless of the amount

ACK

>
>> +		compatible = "gpio-keys";
>> +		label = "gpio-keys";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vol_up_n>;
> property-n
> property-names
>
> in this order, please

Yes, i will correct this.

>
> [...]
>
>> +&pm4125_resin {
>> +	linux,code = <KEY_VOLUMEDOWN>;
>> +	status = "okay";
> A \n before 'status' is customary

ACK

>
>> +};
>> +
>> +&pm8005_regulators {
>> +	status = "disabled";
>> +};
> ?

Already there's an ongoing discussion over the thread [1].
PM8005 regulators are controlled by rpmpd so it's not expected to be 
enabled here.

[1]: 
https://lore.kernel.org/all/20260525093453.edmqryggp5kcqxxy@hu-kotarake-hyd.qualcomm.com/

>
> (also double \n below)

Will remove it.

Thanks
Komal

>
> Konrad


