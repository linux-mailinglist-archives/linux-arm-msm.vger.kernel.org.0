Return-Path: <linux-arm-msm+bounces-93412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CAxFL4il2lvvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:48:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B121B15FBDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 286F33009E07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00C634105B;
	Thu, 19 Feb 2026 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv7xyDP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AR5xnM2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A934834026B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512497; cv=none; b=LQwnODKNw/GA8A2GR8O9OW4LVVlg9zOJAwhMkU6yPCzVk2mz368I3nl+zAtP0MQWhIIrT3idSyznRfSndTUNk+Ow8tpOgRUhuKumM3NsvDlaFcjJ6XAidGe3x6CRIpPYiU9QQvCXMSz+jaWNt7TB748QEzYdaZwrfNXMaPPRThE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512497; c=relaxed/simple;
	bh=agSplSd/enGrqJJZuVigfbtb3Q3utxBcL9jwX2fg4Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyCdpmKS951jKEQZX7Wsfb+1qapTIStWBGmZS3LUVPMG4ES0m1ftJF3kEuTtF4tUi6M60PY6a8M8oNjSaUGgUF2mmYWAoRMBFWzs/HtUDsFuRBtX6OwGpPEYe6KGvB/ZMiShCMsOeorA9dT92prnzdyo7cyvM1PCzSl82Pw/SmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv7xyDP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AR5xnM2a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCxHlt159909
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XBcT7y8QhFDm4R6m0oBnSylOPPgufl79tiD50UABjfk=; b=Zv7xyDP93EjGOkeb
	cSjqOX61nOl24EJwgwhtYmgRyuYF7/V85GvmfY8vjYI6rMNDrhdpQmr6/Uh0qU5v
	4Qt85FLrvmHq/ndjQvsdfJjeoX9UP7MPifmOQzVAXnJFz1uG2yJK2ijN+vDOasUV
	96zs2/V+TVxdrNi5JVJT5Pq/8Akk3OmimzEInXdPiA+vVZudFV5SnvU8jOR/mJIh
	/M1fm2MBZOdO0JrjFCOvTpGi3s8OzMZ1dCa6HgVgU+3BWlR8np1wO/PsIKxIprXi
	tFp2Fot6QxWoI9FagV3X2CzrIyftkF8jxj0IK2QVHYcBO19MTHNE3DTuJ4B1lHuM
	ELiBbg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpg9sy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:48:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6de1ee12a3so728830a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771512495; x=1772117295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBcT7y8QhFDm4R6m0oBnSylOPPgufl79tiD50UABjfk=;
        b=AR5xnM2aW5PxcXfI6UYKJRldPf2EkXKcYzGiadoSS6QJbNqmKS9bZ6ZmzHSXwiIKAN
         c5Z+i57Q/6Qch2d/d7/oztM+qmCjRsFhUpsXmmxrImlG8CGmf88laQU1LCkRlxxu6J3L
         OA32cxOTgZgQE/EjYVl462uNabqQ8MoV1RUxNqmWYAAO0MNqImhrNoyseD+nG6zXUclj
         zQFAvsOzMvK/Nmlw2MGCM1GD3On9mDrP7v026dDrY0b8MfCvbs8CrV1kSRpth4sV6ERN
         r9OeDDqutufGNnhRrYX0RPk9zl2jEB/ATXI7uHVquvKLDW+fMH8yNUo6i/eSTj71W668
         Kmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771512495; x=1772117295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBcT7y8QhFDm4R6m0oBnSylOPPgufl79tiD50UABjfk=;
        b=CCzC+jyPvddONsqU17L8uAfKau6HnQlCQXSxU+FqhmFnCeviscUejmp64jtWfPhb2j
         HsERBczaETbboFK91jpGbfgdD6pRsa8aTfQdyqUm/YaqHObFi6tUYM4SmgOvYFU1km7K
         VthQIXtcCIJ+8MYxq6mn2UcxBHenv9gmh6EOgW0f20pF24GIwVrrdpbQfVO1lJ+ibUhl
         oKmzkKrwypZHPArVwpHH/Q/sLRCOBVfapjf0WegxRhV5xQckSZFc/slTgESQjaLMQKT2
         wSR2nvJmdyu3JwM+yMBxtROpkNOSl1mUcMjbGqDFk8RGi06HcRKKFJId3BtiwoNhS718
         RyQA==
X-Forwarded-Encrypted: i=1; AJvYcCX2QxnXO2GbIKqPUDUfzjtkJfFRbiZaIXVLdcKrWz7MkfunKy+mylzHUxkf+1zmuNxsAXxc0lRl9Pqxe1vl@vger.kernel.org
X-Gm-Message-State: AOJu0YwrBYxHAdBwABtSc/Rm14JmbsBaW2QH4+1z+9FhtCuI8mB3LV0W
	cJPF+0fZSmC0VsUW3IWJw8f28fLMbvpbJlUPrJtD2qunLu/fhpltIeFWkgSGTf5XowpSvHlv23P
	o+/sW4wWqit9qbuAj93bXb+b/oJyv/Mxx0+v+ElaQdI888Gv8teboM/w5oqEF8h+rAk7B
X-Gm-Gg: AZuq6aIv6No+aedJsOitlLdGxYLuBXN1W+uxvkg7YfTdNDDsfjgYlRd/noCjMOsNuAY
	tBGsp9mnZDfgdUwoZwWdzPg5CN6OAmQEi3xIM5xP3GXVTY9IhUVki6xRv/dbdaIlMiRaNoHf2en
	XVqTbT/Ity4g6ovn8Hu8rkr7n7vEUpE22MS+CDPbBVme0v+z8RkhtBXta+sLwUhuen90IXgCB/g
	ASOtMVRyue0p+oQ2zk5Xn8Yf0/HoyWtqlgXhTFjHfvbw5IPTYFDF8bNJ2fsrobB3ipbSulAVcnM
	PF3DZiMZZzSKPuXdQGfimfmsMpH75tPByo7SlYMBFniUL49JCOmuSlJ/1vteCBvCp7wToJVBrmx
	RVlxKoGA8Y/7X57qDe8FO3DWxuPrk1vhYo7gnaiTpy8EcWcO9MPtvQA==
X-Received: by 2002:a05:6a00:2daa:b0:81f:9907:e503 with SMTP id d2e1a72fcca58-826b662ebafmr2671982b3a.16.1771512494589;
        Thu, 19 Feb 2026 06:48:14 -0800 (PST)
X-Received: by 2002:a05:6a00:2daa:b0:81f:9907:e503 with SMTP id d2e1a72fcca58-826b662ebafmr2671952b3a.16.1771512493953;
        Thu, 19 Feb 2026 06:48:13 -0800 (PST)
Received: from [192.168.1.6] ([49.204.108.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a4316fsm26731201b3a.23.2026.02.19.06.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:48:13 -0800 (PST)
Message-ID: <84f46d61-ef92-4a44-9420-a29afabfb5a6@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 20:18:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] i2c: qcom-geni: Store of_device_id data in
 driver private struct
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-13-praveen.talari@oss.qualcomm.com>
 <3b9821b4-68df-4f2b-a384-912a2dc98bf7@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <3b9821b4-68df-4f2b-a384-912a2dc98bf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mfkZgHdvibIqIgXajYEw-DatQfxF2FfT
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=699722af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=SEi2w9hYDuVaAARFuk79KQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=bzct_qqClQXo_WY-SnsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzNSBTYWx0ZWRfX2DXrZYuUteKg
 PLeJuAM/vpPdbYdiiRUFDF1sOrGB4DaU91KY7MLDWENm/s4TxK+2GC5/XkyM/oSynV1HzfNnXkq
 nzuyEcuyQTP/o3vm75kEG+gFcJCI2w/UO/3SgKWhUF4o84XxMGn/npxB1DP15M4R2HrVkii3gZZ
 tN++Rfx9niterSardGd7Z8vBjWyj0zvefprMGp7PWgCmIVdn6UAefzyZdgDJpVPYkE6G0X8Juva
 fkPLmWZk/jr0l3mlXuuOeFV8wtM8JbDw3QJT8I547QUqaR7NFcmJq+gENX0V1frpChv5JlFsyE4
 3v/P62vOUdVog+E1LPsRBNw1iZ+XV9qHiXX/t6ojzEC9py8SJ2fY0u1AKykNY6dUn9rx+Qdd1iG
 nWhd3X2JdjNQCyRMgmJmeh5ErfB6Tv3ATyHsSCRKlUE0Ou6JPsJVa0e7SuugA1KgUdZ+Ui5xA03
 WjKWKYXwk7kNLMBGWKQ==
X-Proofpoint-ORIG-GUID: mfkZgHdvibIqIgXajYEw-DatQfxF2FfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-93412-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B121B15FBDC
X-Rspamd-Action: no action

Hi

On 2/17/2026 5:16 PM, Konrad Dybcio wrote:
> On 2/6/26 6:41 PM, Praveen Talari wrote:
>> To avoid repeatedly fetching and checking platform data across various
>> functions, store the struct of_device_id data directly in the i2c
>> private structure. This change enhances code maintainability and reduces
>> redundancy.
>>
>> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -	desc = device_get_match_data(&pdev->dev);
>> +	gi2c->dev_data = device_get_match_data(&pdev->dev);
>> +	if (!gi2c->dev_data)
>> +		return -EINVAL;
> 
> This is an improvement, but you still need this:
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index ae609bdd2ec4..08e5a1917933 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -933,8 +933,8 @@ static const struct i2c_algorithm geni_i2c_algo = {
>   
>   #ifdef CONFIG_ACPI
>   static const struct acpi_device_id geni_i2c_acpi_match[] = {
> -       { "QCOM0220"},
> -       { "QCOM0411" },
> +       { "QCOM0220", (kernel_ulong_t)&geni_i2c},
> +       { "QCOM0411", (kernel_ulong_t)&geni_i2c },
>          { }
>   };
>   MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
> 
> for this check to not fail

Sure, will add it in next patch.

Thanks,
Praveen Talari
> 
> Konrad


