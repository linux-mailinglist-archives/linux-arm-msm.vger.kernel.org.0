Return-Path: <linux-arm-msm+bounces-109598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J8wIn8TFGoJJgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:16:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B755C86B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D59F2301C6FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5353D7D83;
	Mon, 25 May 2026 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwKPDWhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhw8N1lS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E61230E84B
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700531; cv=none; b=Ax/MF7wbgbah/Jo0Rh7SNtSKozj6ics7qHaTt99iZ/n5kI2ufdQkVrAFGha5/xTxoXTBtQbvqrv9nRpGoklzYqg2td7g32sgoDy96JcrAWccyM6YgFzJ943pasLyucXSx1fd1wrjKkw4U/3/5lY0YPwuqunvKxypVLiN6Xc7jeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700531; c=relaxed/simple;
	bh=f1Fu0W4/g05J3Xbr4kGQW022COOJPAbs9zyPkKyp5Eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHZ6IStoA7S38pK8L2GFhq8CpBQB5ggqQ1dIZNYmDDXF1tTjnrqNbUpCB+oM0dB6rDIgIfKwwBf8g9duH6eYRqIvJ3KQowW5BaEV8ZtpJtZyH+q/MiXB7KNGX9RyJ2UgF98iHOqVfdgH0hHE/Iaj8tt78KiGbRXWrA3JybPFYU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwKPDWhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhw8N1lS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9ERg6079361
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1c6/1NCI38NvfAimZ+NOaPQCpF+xE7i5bvHagq3NuSQ=; b=NwKPDWhc83dI+WI4
	mpTmMqX8sh8e0nnx0NKMbFt2VCfCqC7WWv7ZvtsLh4MruPy/eXks98ofEMzjy4yO
	W8gdjsOOUmtFmn/E9iwmdf/Vz1Bg0SJxAlHVFIh5DG5Afopsu9FCvFMlRM8RidE0
	k00paFYAZ5kNXIVM/LoA6y3ZKme6zMFdtBGpgACV3w0ZDzDINtMzxnJ1v0dftu1j
	iCXlPOuYBH7jc3sUvTqPTRoO0iKrWjVMb2KEcCPzGnYQPyxO4yxnrPSmQ+Xg6Jc/
	ajFfo/hzyLUIYf0YZSIz3PwF7sy1Grzn/9oyAglrH2sI+xQD/BGle0gDEN603YFe
	dCFlSg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8047-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:15:29 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e3a5fc58feso1581449a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779700528; x=1780305328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1c6/1NCI38NvfAimZ+NOaPQCpF+xE7i5bvHagq3NuSQ=;
        b=fhw8N1lS0TKiNB3JxpnW63e1ytQJBNJu6rklcZ5S4/XATlT8+hzwWOj/+fYmGYJAXl
         bsV6ECErql9LkSTw0CHwOw/bMefcrhYfEVStc1nk1APHdzFvj4Pr+8Nq2AaKb2NAjMrL
         97s+5lRqHxZw0rQQUvuCVQlmIToDg4xcrOH1tBiW01s1ZHSTBVMciiEDJKBjg+l2nlcE
         KM43AiovCux/trgt3tcW6AMd3OiTec+Kj3tvnS1vHW4WAs7lCdtA19jPo0Lcc6yX1LTE
         yOPlayKvgzxVOPecPVhBGOT8jg1s99quJ5ban5pIsojEAYXAHbH8KDgIhUeSjQ7gA/Ni
         PaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700528; x=1780305328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1c6/1NCI38NvfAimZ+NOaPQCpF+xE7i5bvHagq3NuSQ=;
        b=b7+Vy6+NSU81knAA43F03w1JqjfJLuZO0NW2TFBtjOFKMnnJgVWx8zGx21gogJArIH
         Lf68k9nC2SqMakgQcohC+L12aoUJbJPWEwfLADIroox7aR3jSrtXy/ayp+uyQj7bAKAa
         7OlG9IpwTIed5OaLuNitxMy6M+nCaG1MTveqNuiZTRu+90qaJjZSAyRR0ZR6K4xi8YZ8
         P1Xt7TBDKwlkdmzONYIJ6HfXDbGGkq67U2Tn/ewfbik93WEAxkLpv9EG4C3CDkmsw5MW
         VJ8DakXmUWZ79nMTuMEO3qTYe4m0hyqER49jGpSXaScvm7PZNt7rT419m/mOBV92q3QI
         wGxw==
X-Forwarded-Encrypted: i=1; AFNElJ9qmLZqgrhfUHPiBAWWGNdvTMrmkzl3ghdqKNAoaQoKb8pxcf3L4olvc8HlwK1h9DEcuLFX273RfHFR/EKp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3K/bZ/BYxvFYivn0rPUhd3GhSBeOhrUmaZeNRqcdSjU+qwmpt
	+1NBBUKe2xe9rMB/O0jlJhwuzDaAmLB2bPJgBPYDw01N4EiUCKWxSMSpNnKvwPUi68dBrVWz2zJ
	Jfq2BRH1WUt6Vjslgurig7rRB5zHFstHQ4Ac04o6naaJcokfs1mCbXd2mskDuSoC3QjZEWGP/te
	2s5ps=
X-Gm-Gg: Acq92OGHAP/upSUYdfq0cO17Pl/M8t7CyYjSYB1F/844NBj6hbuKNu8osUKT5r1rL3h
	V8dD87kiBfXLhKRiegDtir0Ncv7K0KzruBXGpqthP89psjMC/evinr5b2ca35UDJwEm4iBbrpWn
	WYor7nGgV/76NN+Z731rVHW6ZCDmG/7I+j69qsZrB3rzoLJ9US39UF4Z3U7WwGV/TDaiqnrIaAr
	mPHdvzQA0iTerGTD924lAfv7b9a0CCvoZ0htlmH+iXJYSOomRf2HJAVknQk7GZLzswtOsWk55fo
	NsLoCUOgX0GP7sHofmaDxioEIVwTF4vZ4mc7Y1NOorYhcYXzExD1JbojNVcRRLYHSAwm+iWxYBM
	B8vO/Gn2c1O+XYQ9eMRFOb9RJ00dpeklN2b7eqxyJiz5oJLQ4NuS0DjKjcEnVdSt2W20eMNGz8w
	Gob9jHZ/lkAFfDDGV5
X-Received: by 2002:a05:6830:4126:b0:7de:5bad:ace1 with SMTP id 46e09a7af769-7e5fef5b201mr9716879a34.12.1779700528563;
        Mon, 25 May 2026 02:15:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc4:b0:83e:3050:d0b with SMTP id d2e1a72fcca58-8415f0f095emr12883061b3a.1.1779700148333;
        Mon, 25 May 2026 02:09:08 -0700 (PDT)
Received: from [10.133.33.202] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8419a140893sm2855272b3a.46.2026.05.25.02.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:09:07 -0700 (PDT)
Message-ID: <b7cb43c9-53ca-4829-99a8-cd2fbcd5a201@oss.qualcomm.com>
Date: Mon, 25 May 2026 17:09:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dt-bindings: soc: qcom: Add Maili soc related
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
 <5k7sh2yooj4yn4wtpifyamaw2dglk6xwbix623rvt6i2idkxr5@63rbo7ncduym>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <5k7sh2yooj4yn4wtpifyamaw2dglk6xwbix623rvt6i2idkxr5@63rbo7ncduym>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a141331 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1JtG_qnnveiJe4rXrqQA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: fsgweb0RVmDcuMnvY3gONyuEBOrKHmrL
X-Proofpoint-GUID: fsgweb0RVmDcuMnvY3gONyuEBOrKHmrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5MyBTYWx0ZWRfX43cUscY6ipFp
 hwObaBOIYoF/BEwZyh/S1vKormh8gSs7+7RXRO/N23JVogQD3xEfd4ejtPUHeiSHpT2/QNcFUX6
 4DsywA1enYTMqOzycuaI5m01fYdmU6wX0l+BpDbZxTVSZM6KRcZzDGEjhVQg3c2Fxz9i8exkc7T
 qfclSYqrVKikhUHb7wRY40lC4Tori2d7ZBxdmCC673UtYtB+WknnrGczOkJkSkAnpbqoOTm8gSU
 fprDQQUf3m43Q/b7VMuq7+hy0ENQM95KzlHAP8Ge8o0JnvBmjet//xGjl2jRuGHUcSdHH8D+rsC
 8cysMhXVb/o9lZ01C0XwubJ+5Zvmx0h1/b/r+RlJBjqKSHZeT+Rq7sRrzzBBU6p9k1/RYmfLaEl
 Y6LGpLlEomwAr4LUS/oMbg5CDZI7TnCua5aSvtzGVBfW/uuEH5GJGZFpVgk37mDKtA+Cq0YnZaD
 ApYIVt8wLtOgMdaG8Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109598-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01B755C86B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 4:35 PM, Dmitry Baryshkov wrote:
> On Sun, May 24, 2026 at 11:29:43PM -0700, Jingyi Wang wrote:
>> Add soc related bindings for Kaanapali Platform including aoss_qmp,
> 
> So, are you adding Maili or Kaanapali bindings?
> 

sorry, typo here, it should be Maili as title describe.

Thanks,
Jingyi

>> imem and SCM.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>> Chunkai Deng (1):
>>        dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel
>>
>> Jingyi Wang (2):
>>        dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
>>        dt-bindings: sram: Document qcom,maili-imem compatible
>>
>>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
>>   Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>>   Documentation/devicetree/bindings/sram/sram.yaml              | 1 +
>>   3 files changed, 4 insertions(+)
>> ---
>> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
>> change-id: 20260524-maili-soc-binding-2a2287fce578
>>
>> Best regards,
>> -- 
>> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>
> 


