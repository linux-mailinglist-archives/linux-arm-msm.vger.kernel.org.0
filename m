Return-Path: <linux-arm-msm+bounces-106386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDjoIeWP/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:13:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C354E900A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9176302B41E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F1E3F54DF;
	Thu,  7 May 2026 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ry9dN/na";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDw3TazE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F5A3EC2CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159241; cv=none; b=NUcs10lEPDNZaxvcJeguz3z4bx7Vyz4qW+Qt2/zJ9nRnZCE30yrcQ0VYgDLODSou8cxVolQuHbM2JLae9x8cxsZrPD/UIkH0VxamRpLyRo+cH7z41vFtsyB8CPyRubOCPi/7VV5pVAnZbaSDvlC5L4BtUsdrWYE2Zmz2+Wy5roE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159241; c=relaxed/simple;
	bh=ZUyiKciw6bl4ENj0XCgLW65D5u6UhS7JLeemG9SWGzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7TOJhIjCau0UqU41h8/sUWCrutpY2B/+l9g4N2DzHvZvU0VYBaANbcOUfmog3uE3unbu21onzsJkSri4HF3VyRN+FtGzHH2A2G2QkxIocc/jnxeNoaq+p+YzCBcAfSOGAL3OXT5XfFjGw4eEB+Ny8i34fHdRzR5usvM4Qt6biQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ry9dN/na; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDw3TazE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pT3g1424447
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alNndE+DEmvOgK3PpbgZinouRSm3ht7GhqLFHIt1Qa0=; b=Ry9dN/naFMHXo24r
	R7poMpUOPzo4QPl8Oah7JhVdAawfqKPfw/eU56VIE9Hg0yUFUjMA9nXzeRCNxkzJ
	t63iNRElR3MN8Xn8V1QIbRyBJD91hrK9tsFx0fajwDSZFWEFvWc88jz4yAJuJVya
	bfRKu73reuoZblHdNZp+R6f4b/UgyGrPB2u8CRivKTDxuZilWlf5OIGTqdQ0FhTB
	CSqVKdSV4SU/ArOTuFrCiaOWfRhtE7MaoIpvDCZZR+4uU51AV0VvxAev73YMCSFe
	5ftQAp4rC6hrFnFa6EltRyHM1xGYrh62ylxsGrIymH2LuY9ybn4UURIczlrDNR6Z
	KRee/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfs4p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:07:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366015bca9bso660608a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159238; x=1778764038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alNndE+DEmvOgK3PpbgZinouRSm3ht7GhqLFHIt1Qa0=;
        b=SDw3TazEd1DVyPh72fWEhaOu7UuatlFKZ+rbrQUbyEZiDiZsLENWiZR8kgzbM3BTnq
         ZJw8pVXdFesyrbsEpRdL6FNSYk9BeeaA3KZtafcLia+aWrWDZKALIMoBDTQpzD39JMm0
         zvik1I+PJMjImp7+7z7RoS4SNY3Wdrn+zujsMD+610R/j11PqNz7QsdYQ4OEjtgL4m4B
         hN/BSrrgJ4lMq3uMYaJGgNkAxwpTnxXTMXcmpl61Oh3Bp2L3b2mhyTdjgvHq/WF9w5jC
         utL8SWUPSMyHHDJ0vBUOLWvaVYatTr03cGqOENv+xCf+0RFGfJzOSPELlaktX2JXo3L0
         GEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159238; x=1778764038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alNndE+DEmvOgK3PpbgZinouRSm3ht7GhqLFHIt1Qa0=;
        b=kgtcG+UZXP5hjGXVeHnatBj7+xI0zT1ObsHhMwlsX8Rf7wjKQ8axt+0DzP8S5Ucho+
         6wDkv6tlRbBKosTqAnl80fYn5XRUs35Tcv8bJL1CODtJO2Ui0h38D+eJ3IeDAVvKebaP
         ZrpiUpSPvbpORGsYML3lg7Bk0Cc9JRJ/fYpk7wnHhQWQbSjdLb26ePiq1pgk+Be9xjVI
         TQK3jaZ6xahnqWEs2MVidYOoeOcoR8RJyj3DRoRLksUk8KTDDExUjFbh3bf1ZOYLBQ7V
         Slwzt1VE4zgRt9ITn0ypDMEkvMPOWoH6NYmwcD+FVlnI9bz7nT1uM1nhwTK5AYxsb5Vq
         UnZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wu2nPSnNaYQ0dtjha17HjbJxLGgc6dOs//bOKYaVSf3kNkKYKS4P67ZMPWsi07d6nW7a4Ah6C1bjmmmpS@vger.kernel.org
X-Gm-Message-State: AOJu0YzbH895eUgqVp2DL6vBwDrfrz4fcqKgl7b1NfK6LIZlMpsDyObd
	LJ6uNFQLZ9ust+nKVVzuak3lM11cWI4qBzvUXQ0R57jLG/USzK1ND8SpXg064AcWyHnYvey/0oQ
	vgWoVvjHIT6xIIfmYmMX2c6tPDbmzHAf6G5zsl6ojM+DTMvPft6j5zdouPHpnjbB2v+61
X-Gm-Gg: AeBDieu0k5U5h0yoSjPKG2HC711s7VBEnobTjnGwPD9m2GpTP5BxgnskN/dIfGkVjzh
	utQFx7IQxXgGPYeOUXiTwGUT9meAeVVtjLc7X6KCi3phR1N3uSSzBq+9JVx1QIo411nYPtxdT4a
	bZBhvyitzlcoKm4VZckbvwlKuvGnq6qJO18aJ/of3FDNYAPaK1f+Yj6MOW3NT9eG3IivhV8J6Cn
	Q/mMJvI45nnv708FAX82zgEpemgY72l6fCbHao/eNIZDEDsnyL7/PItZrrP9MDYMHRMCqvHaVMp
	yzDEBgG/dUgcn30ls/Vre99xI7R1s/Rgr7WaHWntiQnTF2758N21O4gvglBviim1FKuXnJjAK/i
	KTr/orjHJRQWQ/a5zDTh51JIAlRg+jCWfnIo/8haTMIFJUlylXxRM/DprK7bYCOEJ/ZcoVrbQSD
	915g==
X-Received: by 2002:a17:90b:582c:b0:35f:c6bf:2bba with SMTP id 98e67ed59e1d1-366055e33afmr2306794a91.11.1778159238384;
        Thu, 07 May 2026 06:07:18 -0700 (PDT)
X-Received: by 2002:a17:90b:582c:b0:35f:c6bf:2bba with SMTP id 98e67ed59e1d1-366055e33afmr2306747a91.11.1778159237855;
        Thu, 07 May 2026 06:07:17 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365f01a4f51sm1816381a91.4.2026.05.07.06.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:07:17 -0700 (PDT)
Message-ID: <112f80a6-40b9-442b-8aa2-a374fedd978c@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:37:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc8e87 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-LUH1mPZw7eumpYd8pAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfX42Cue6IHi5mj
 XSEOseg+5ZiY/xvK4/YW167a2NVZpEFekTnKcT+PIpCG1McQVLPlbY/v62gQzLoZK68OOz7Xw3h
 JKK7eTSCbhyBbmSrTzYVGq7urSPFsLnfOmM8aw83G34LZEmzithLQ9P9qMHPeiGFQgb4CZ651OK
 wsN0pxNhb4HzFm1Z4oxXbh/uxijljYbXkhnZ7YCZ4mT9TBDSGqoVgRgKEen8bYe+CoKxfyU6uZd
 cxbQy+ZSLoIHaaQM1r3h9HmicIce/sbQ6TuxVmhILGVvdSp65wTDjdIa3W5sd5P88+eg8VFFuuX
 LaZr6vT86JTjwi+8k9tkMgVI2Q8TXKOt9rREjjC6sp3kF3YsQcj896N4YAXB1WdK92QrEAgV6HQ
 s8Zs+HZJL2CRqbY0qsNBIm2oK41KRh7xWkRkdGX2RcccvFYPGhUi/F3rbksjo1G9cHcvfbmpKwW
 SeXd2ZIlX2osttr700Q==
X-Proofpoint-GUID: PUXfITUsv1Do8GxkjWP96ntcdBzw7YrR
X-Proofpoint-ORIG-GUID: PUXfITUsv1Do8GxkjWP96ntcdBzw7YrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070131
X-Rspamd-Queue-Id: 69C354E900A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106386-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> The set_preset_registers sequence is currently shared across all
> supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
> programming would differ.
> 
> Move set_preset_register into a vpu_op to allow per-device
> customization.
> 
> This change prepares the driver for upcoming hardware variants.
> No functional change so far for existing devices.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
>   5 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

