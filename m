Return-Path: <linux-arm-msm+bounces-91884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hiDhHklihGkK2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:26:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19548F0A6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34F0B305FFCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A870136EAA7;
	Thu,  5 Feb 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCNAqrUT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YipLTBJw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B9362157
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282649; cv=none; b=ajTEq1szVJih4BdmByigPmKnuaazX+YzYSd7drknR+wqPO60/QFFYl7C70x6FA1o9xhHXg2vIwRZ8whvSnfC2Z8jov/fE1jDxZUqdx/qSg6DitUzqWBOgR1PGqHqlBbKN07gdGi/FqlK8QP0x/K2/8oQPRm84hUlEwII9B9SJjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282649; c=relaxed/simple;
	bh=ShG9qEYCcBrvC313O6Tl4TeAhnqtmCKfXwjNNT0imU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iL6SuhhUcpxiz88k3BmcmeirvxyssKld2HfWyeqGUCkXZz4wc7JSWKe3NqS30Ou3FjFIcP+C7iIQAzsrlpWhD7HPy0UiPddNPChqPKhDV1I1Tf/h8J3BMk761/hdpiYRVYHLRWpKKzwddt3XNp6Th6Tq8lpoAI1Cm0anPCBCp7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCNAqrUT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YipLTBJw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dmhV3397129
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3J4yFBQQdrMA4k0JPQpmDeXe1MfVcsFd2a2CrDEpIw=; b=bCNAqrUTNB98GCrH
	Lmf4iL07lncWGMk6npE8ZGmxlkH9sws1PA1VRaViLmCbOp6aVjcmqnkRyUnhKwJL
	vdZI+kOe0GRhdDhbaetVBLYGUVOEZ/spRdpDKOyAJOFdxf90P7QvnRc869PtGEiM
	0DO2gZRwCNvyMDL3KtKmWgNxxOFswGwgZ/1yhVUsdGlEPgmfJnuNFVFtJ9zecIn3
	hq0BvEv+qsa97TGv69k8lkc0+HlSDR+lifgm6LS9s/vTLBXO1CyZ7Na1U5BkcIOL
	B9j3OfUC7ypHQ9NsdQssda6/ryLS0t+d4ypMndUR9ibjwEjYzkrsPzNuXdCLMXry
	pfLv2w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh3wha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:10:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so463122a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282647; x=1770887447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3J4yFBQQdrMA4k0JPQpmDeXe1MfVcsFd2a2CrDEpIw=;
        b=YipLTBJw9Of7WlB1rSQwthxiN9QfwGz/ckrJFDEBp7WaTyejPdg/AHo5l6m6FIV1z5
         0WEJFsg804+1oaE2n1zM5nlTiHccb5HZ08brvLPTSCMlW8Wi0CAY+57G4vEymLKE6bNo
         b9RLO72kb6/VyWgNzh6HYyQTtFjxUogpo9NIf4xK7Ad9eSYAyqjFsnkZ8fdw2fofGW3G
         OAOZ4DaiKh/LW7KkGzvsRvGdXKL/a4mZvoSvuch6VNkH7+Ko6NFy6Da5beofU8u0sWw6
         nYVzEwO2VChi74JligdMc7g+eyqJd72/nd/QV9QtVJZK63ENIdSU82p6k/sJSyCQbHgW
         Wcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282647; x=1770887447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3J4yFBQQdrMA4k0JPQpmDeXe1MfVcsFd2a2CrDEpIw=;
        b=oyRBKNjg7n2or+ysP0cBkpLTcKw0PGlhzNT9lI8XMpm8fD94S+4qCgqyK76S1HXpXu
         VuNabxJoif8CM9bfEWRtpYNYloRAXLQ2OXlMRbZbmJuNVdLG017srf2O8bY+A79stcHz
         +gZI6ub/n98BVeGfGguFhNdV0LzM5aC90O+hmgfvSIM6KiDked0dnphM3A/p4UeW8DiY
         eJZDr6K1VOJv70Zao6m+3ZEGSs3QlM1mEBPj2RUJbXT6VlIPkeSi0g/LGkXiT9IgxyZ0
         J9WacbCtlc3gyYHcCXEK1jclbA2VWV83fHkcnSpQGVykyMwLv+u/UA4xFMzcnTmQY2us
         hh/w==
X-Forwarded-Encrypted: i=1; AJvYcCWrZmrsPGVuIP9wdmT/dkJBAjA2+JQMB5rH25BDD44wLpT6F5XiA8K8plnFUvVCLx6idhoFfetelxwiOX/K@vger.kernel.org
X-Gm-Message-State: AOJu0YzUWsmwZoJbPxDytrKAT93JD1GwWq08+I7HONoxrXPQN85CmLdE
	rjjo5/Y+u4fke+OSwJR+mq1lWlLrSmbIaDM1XIHRx8TqJataW82L+4x2XJdyTUBlxny2tuzjR0j
	zqmlLf0U2AiEol5ngjWqWK6yWIGVhdGM77dAoeyrrY925Rr4aSvkCnOhzPJ7QUoWAR6uq
X-Gm-Gg: AZuq6aJvD/mKsU7pTij82UCnPP08v6cCV9LsACePLiorSMWQRNMvlJNR+9dmjIM7fP6
	QqXFRDnlVCdlu/BDR7CxBJ4mrwggC4CnQ2gLUGYEW/9fLnWmhN3otRg8kTZ84gZzn52WvQLhFrE
	rTC7IxoW6x7opy2JkqjVroTMZM23V6v2lqM9OWCs2eiD+XYGdtxrYKwof8zsf5szSrlEzjyB1F2
	szKktue/Ol0Od35rnojTRs080DfU86VEe3Gou4NdGTzizu8X/WNJo6cAr3MohUFf6oFYka9syJv
	9F6lsJsFXJqKOrUcGP1nB+9AxwchLtsUCorDUrD29sbwujn/+USnd0YIRZqYgT8tYJUuMZUYSFi
	UkXGGmSXbzGtB3TBcrVQH/Fmggz7TdO52OPqB7s0Ecn5F
X-Received: by 2002:a05:6a20:2452:b0:352:7cc0:93b7 with SMTP id adf61e73a8af0-39372427748mr6441317637.40.1770282647140;
        Thu, 05 Feb 2026 01:10:47 -0800 (PST)
X-Received: by 2002:a05:6a20:2452:b0:352:7cc0:93b7 with SMTP id adf61e73a8af0-39372427748mr6441279637.40.1770282646413;
        Thu, 05 Feb 2026 01:10:46 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c85729e2dsm4097610a12.34.2026.02.05.01.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:10:45 -0800 (PST)
Message-ID: <ec4348fc-b27c-9b56-2967-222e4e280c8a@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 14:40:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <8c5cd9ff-e549-00ab-60c6-814b52f50949@oss.qualcomm.com>
 <rhsmmvbxjzb4ylxryo3n6j6wf52tjpxxon6fww6tsfhxttc2g7@xfsnyfkqh3ke>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <rhsmmvbxjzb4ylxryo3n6j6wf52tjpxxon6fww6tsfhxttc2g7@xfsnyfkqh3ke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=69845e98 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SfZIM4WqlS33aqDva-YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: sDNsSItpJp6p7FokpG02KnKEedGKkn4R
X-Proofpoint-GUID: sDNsSItpJp6p7FokpG02KnKEedGKkn4R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX/RbVzfDEPM6s
 60jrF4qkcRvR2+01IMWvI4UUj4uK2tpJOAWRWXvhubSy0bTIFI02R+O0nwTjvV4PkxON14qfsRs
 ej1U1GE+XQgimoYp1Jm7BjMcvYynDdlFzftvznsf1nG3nweusQwjTJDrG/K76sQ7FAeB9TY/+b3
 OBSpU+Vni3fyNPpMhWEpauh23EJ1U3o28wuEvqZ5u6+xiEZLglQC8titDU6Yzc6lwNQ/Rbmnayi
 0Pd6U03l2IL/7MV6x1Ir5PAtJVPvR5m6MkjCARM0PVP89ilcSc9pA39UKLVZjrDW/zHJo2fLxMi
 gJWsejlhpcbnWuxfFOf3NQNU8B6CYztTADwR4mXP7o4t7yBc2yqX6uRVRvH6pJoxzu60XEwdIaA
 6/ve6Ec7D7tyK+B9GY09KjHv3JlyCON2cNaM3AXeQbg58dh4jhFP8/H+XJFy3Dw/RbY8KD1YT54
 F7r+Ot47t8HvfiliAxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
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
	TAGGED_FROM(0.00)[bounces-91884-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19548F0A6E
X-Rspamd-Action: no action



On 1/31/2026 12:58 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 06:46:04PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
>>> SM8350 and SC8280XP have an updated version of the Iris2 core also
>>> present on the SM8250 and SC7280 platforms. Add necessary platform data
>>> to utilize the core on those two platforms.
>>>
>>> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
>>> driver is enabled, but SM8250 and SC7280 are still disabled in
>>> iris_dt_match.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/Makefile          |   5 +-
>>>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
>>>  .../platform/qcom/iris/iris_platform_sm8350.h      |  20 ++++
>>>  drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
>>>  5 files changed, 144 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>>> index 2abbd3aeb4af..2fde45f81727 100644
>>> --- a/drivers/media/platform/qcom/iris/Makefile
>>> +++ b/drivers/media/platform/qcom/iris/Makefile
>>> @@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
>>>               iris_hfi_gen2_packet.o \
>>>               iris_hfi_gen2_response.o \
>>>               iris_hfi_queue.o \
>>> +             iris_platform_gen1.o \
>>>               iris_platform_gen2.o \
>>>               iris_power.o \
>>>               iris_probe.o \
>>> @@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
>>>               iris_vpu_buffer.o \
>>>               iris_vpu_common.o \
>>>  
>>> -ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
>>> -qcom-iris-objs += iris_platform_gen1.o
>>> -endif
>>> -
>>>  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
>>
>> This change is not needed in this patch, pls remove.
> 
> It is necessary in this patch. We enable gen1 platforms which are not a
> part of the venus->iris transition (they have never been supported by
> the venus driver). As such, iris_platform_gen1.c now needs to be
> compiled unconditionally.
> 

Ack, I assumed you have this series dependent on the other series "flip the
switch between Venus and Iris drivers" which has this change already so
won't be needed here.

>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> index 5a489917580e..49dba0f50988 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> @@ -43,7 +43,9 @@ enum pipe_type {
>>>  
>>>  extern const struct iris_platform_data qcs8300_data;
>>>  extern const struct iris_platform_data sc7280_data;
>>> +extern const struct iris_platform_data sc8280xp_data;
>>>  extern const struct iris_platform_data sm8250_data;
>>> +extern const struct iris_platform_data sm8350_data;
>>>  extern const struct iris_platform_data sm8550_data;
>>>  extern const struct iris_platform_data sm8650_data;
>>>  extern const struct iris_platform_data sm8750_data;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> index df8e6bf9430e..c99ff4d4644d 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>> @@ -14,6 +14,7 @@
>>>  #include "iris_instance.h"
>>>  
>>>  #include "iris_platform_sc7280.h"
>>> +#include "iris_platform_sm8350.h"
>>>  
>>>  #define BITRATE_MIN		32000
>>>  #define BITRATE_MAX		160000000
>>> @@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
>>>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>>>  };
>>>  
>>> +const struct iris_platform_data sm8350_data = {
>>> +	.get_instance = iris_hfi_gen1_get_instance,
>>> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>>> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>> +	.vpu_ops = &iris_vpu2_ops,
>>> +	.set_preset_registers = iris_set_sm8350_preset_registers,
>>> +	.icc_tbl = sm8250_icc_table,
>>> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>>> +	.clk_rst_tbl = sm8350_clk_reset_table,
>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
>>> +	.bw_tbl_dec = sm8250_bw_table_dec,
>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
>>> +	.pmdomain_tbl = sm8250_pmdomain_table,
>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
>>> +	.opp_pd_tbl = sm8250_opp_pd_table,
>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>>> +	.clk_tbl = sm8250_clk_table,
>>> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
>>> +	.opp_clk_tbl = sm8250_opp_clk_table,
>>> +	/* Upper bound of DMA address range */
>>> +	.dma_mask = 0xe0000000 - 1,
>>> +	.fwname = "qcom/vpu/vpu20_p4.mbn",
>>
>> This firmware is not compatible with SM8350.
>> SM8350 firmware is not released to linux-firmware yet.
> 
> What would be the name for the firmware? The downstream uses vpu20_4v
> here, so, I guess, in upstream we should be using vpu20_p4, but a newer
> version?
> 

Using a newer version won't work as the firmware for SM8250 and SM8350 are
different binaries generated from different firmware source branch.
You can give it a try, but AFAIK it won't work.

>>
>>> +	.pas_id = IRIS_PAS_ID,
>>> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
>>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
>>> +	.inst_caps = &platform_inst_cap_sm8250,
>>> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
>>> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
>>> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
>>> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
>>> +	.tz_cp_config_data = tz_cp_config_sm8250,
>>> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
>>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>> +	.num_vpp_pipe = 4,
>>> +	.max_session_count = 16,
>>> +	.max_core_mbpf = NUM_MBS_8K,
>>> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>>> +	.dec_input_config_params_default =
>>> +		sm8250_vdec_input_config_param_default,
>>> +	.dec_input_config_params_default_size =
>>> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
>>> +	.enc_input_config_params = sm8250_venc_input_config_param,
>>> +	.enc_input_config_params_size =
>>> +		ARRAY_SIZE(sm8250_venc_input_config_param),
>>> +
>>> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
>>> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
>>> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
>>> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
>>> +
>>> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>>> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>>> +};
>>> +
>>>  const struct iris_platform_data sc7280_data = {
>>>  	.get_instance = iris_hfi_gen1_get_instance,
>>>  	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>>> @@ -446,3 +502,58 @@ const struct iris_platform_data sc7280_data = {
>>>  	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>>>  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>>>  };
>>> +
>>> +const struct iris_platform_data sc8280xp_data = {
>>> +	.get_instance = iris_hfi_gen1_get_instance,
>>> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>>> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>> +	.vpu_ops = &iris_vpu2_ops,
>>> +	.set_preset_registers = iris_set_sm8350_preset_registers,
>>> +	.icc_tbl = sm8250_icc_table,
>>> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>>> +	.clk_rst_tbl = sm8350_clk_reset_table,
>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
>>> +	.bw_tbl_dec = sm8250_bw_table_dec,
>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
>>> +	.pmdomain_tbl = sm8250_pmdomain_table,
>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
>>> +	.opp_pd_tbl = sm8250_opp_pd_table,
>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>>> +	.clk_tbl = sm8250_clk_table,
>>> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
>>> +	.opp_clk_tbl = sm8250_opp_clk_table,
>>> +	/* Upper bound of DMA address range */
>>> +	.dma_mask = 0xe0000000 - 1,
>>> +	.fwname = "qcom/vpu/vpu20_p2.mbn",
>>
>> this firmware doesn't exist on linux-firmware.
> 
> It was based on the assumption of having 2 pipes. If Iris here has 2
> pipes, then probably we should still point to vpu20_p4.mbn?
> 

SC8280XP also uses the Iris2 4‑pipe configuration, though its firmware
comes from a different source branch compared to SM8250 and SM8350. This
means we have multiple firmwares with identical VPU and pipe configurations
but different origins. Could you propose a suitable naming scheme that can
differentiate such firmware?

>>
>>> +	.pas_id = IRIS_PAS_ID,
>>> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
>>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
>>> +	.inst_caps = &platform_inst_cap_sm8250,
>>> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
>>> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
>>> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
>>> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
>>> +	.tz_cp_config_data = tz_cp_config_sm8250,
>>> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
>>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>> +	.num_vpp_pipe = 2,
>>
>> sc8280xp is IRIS2 4 Pipe.
> 
> Ack
> 
>>
>>> +	.max_session_count = 16,
>>> +	.max_core_mbpf = NUM_MBS_8K,
>>> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>>> +	.dec_input_config_params_default =
>>> +		sm8250_vdec_input_config_param_default,
>>> +	.dec_input_config_params_default_size =
>>> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
>>> +	.enc_input_config_params = sm8250_venc_input_config_param,
>>> +	.enc_input_config_params_size =
>>> +		ARRAY_SIZE(sm8250_venc_input_config_param),
>>> +
>>> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
>>> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
>>> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
>>> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
>>> +
>>> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>>> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>>> +};
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8350.h b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
>>> new file mode 100644
>>> index 000000000000..74cf5ea2359a
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#ifndef __IRIS_PLATFORM_SM8350_H__
>>> +#define __IRIS_PLATFORM_SM8350_H__
>>> +
>>> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
>>> +{
>>> +	u32 val;
>>> +
>>> +	val = readl(core->reg_base + 0xb0088);
>>> +	val &= ~0x11;
>>> +	writel(val, core->reg_base + 0xb0088);
>>> +}
>>
>> you can reuse this from SM8250. That would work.
> 
> Hmm, downstream driver was explicit about clearing only these two bits.
> Is it really fine to clear all the bits?
> 

Yes it is. We are doing the same for other SOCs as well.

Thanks,
Dikshita

>>
>> Thanks,
>> Dikshita
>>
>>> +
>>> +static const char * const sm8350_clk_reset_table[] = { "core" };
>>> +
>>> +#endif
> 

