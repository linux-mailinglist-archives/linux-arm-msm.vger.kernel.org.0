Return-Path: <linux-arm-msm+bounces-91678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPrmHzTwgWlAMwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:55:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB980D96B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53F3130DE6D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7814F344D85;
	Tue,  3 Feb 2026 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icni1UEx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXKZ3X7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17180154425
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122899; cv=none; b=l19lAvEisdM1Nf1X0X08afV+wGGo3KeD2uFdPbUGHn1G/6t1/Qs7l+9G/OxZrK2+ZlA0Zh4l2VEuaa0WlEKeo6CO4231XZE2WDXzZ1VeEY+ta9BP95/07nS+x6b1EIinKgeAImqCSvM3OhyXsyhju4XUVSSYapGqHoESjAah8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122899; c=relaxed/simple;
	bh=TsBycMBF9tmAwhfR9s/Ou+SnZGtzHqmnz4gVFu+lt1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwawXmgc8e0XFq7mMRFuTzKm3A3lh/o9oHH9OKDvxsi/8G3vkCJxsgeiF78USG1JJqFZ0iw9/IjB9oIMAd6FLBAPuFQbMOnOzSjyJd/DEV2Wqt/0kZt4wh+Tey/oROe2uqkkFd8toALhHLg/Qv8FaSlRqKRCMHSuM/K56TiVnkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icni1UEx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXKZ3X7O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ADGZQ931271
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5reiRMxf7eQPz/r0JsXzDKnp3PHnj9+4R8qPa+QT20=; b=icni1UEx5BbtmfoD
	WQ2eRYue9Z40/HVaG8XNwZFFrgeKyByNqpl6gaShT4fRWQSEvtQRaU6zyXu7rEg0
	c1fLkj21pYApOtw3WJzy8Ibyoj0IJxMUyNQZ5/fcmz3yU1SSV6e1z1TlJmJWlGCW
	O5d5NOYogkfaGf7xlzNuvtgv3xYts5tLi4LBWpN7w7BCHcp0ngPhBvL9gpljW4Pa
	n9aHyacvOaDVuR5wwOC1StU0cAPfo7e+MH8Cntu/5TJvytWmVSiFDGZ7gxiUl+OG
	Xim4uFcbna5NVVBC184pJLQ+pOyQWZ7y9bN0p6TqPvYHDbVTP6fbb/3EutJ4FIFY
	R+RC0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu1mjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:48:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50146e00a23so9945131cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770122895; x=1770727695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5reiRMxf7eQPz/r0JsXzDKnp3PHnj9+4R8qPa+QT20=;
        b=VXKZ3X7Ot30U0mo3xdWmbbu6RX08sIHtkB7972xzcukQEdPeb0rxNXVDX48mn7q8cM
         YFC5nVDEfsSGx3irk8Z1Bn6sNkofza24icS16mQH3i9cFvSODtiyZ3mB5m9sc36IMwVG
         zXec4HJezfDmqJGDFkUOpXsLhyPmDjXyjJdH8C53b8miA8KxYBUpmbWfMMbiQYK1ARs2
         lJNah3sDOb4lRUl/6MX3ovGPko8Btfr61zH0X3cY77r+7H7pwaoKBjMw7S9gHL8qWa4D
         qPKCbeHkZI9n2C4q0/dA2+b3sXNCW8uKjDJAxBISafyrNnYyuvDZ8MCxGcj5oy90vKXQ
         ghhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122895; x=1770727695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5reiRMxf7eQPz/r0JsXzDKnp3PHnj9+4R8qPa+QT20=;
        b=K1LZri0pxsy7Ha90GlwqQ1VqGRuNaoCiw+0O+7NPNirjRRRH6DYBLZGJJclb98AdXk
         ePTSU1kIwne1B6J214yiVR9JAwfwlWHGcyQxipri7ezpMsLc+vpGYJIcXFJYR7lKviFv
         pX/Xabgy2m5wXChabcB9sOhB2zl7G72DBl0U5M8guEGictj6oRdry++oueYUTMaXOTde
         EMibua15R4cDxDYfkTIZBZe4mN7o/oYigZncpj5D/KliV0T5y03ElqxXvkHgRUuHTHyq
         VV9nMCthxtVdWzo6RZDp/dccOmNB+V7gWieInGwT5lCYsuKeWju/7SGurU4nL09j22SI
         0S9g==
X-Forwarded-Encrypted: i=1; AJvYcCWZX0N8lGprfJ4A+xjmtRzo5jn8aGQu13FsuD3Q2VCBeZ0/8pZU+5BI0wmnMx6IXL0do6wPox3CRVZaioCd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PdmDsMnQwsih6PGrK1vNg4m06CFboW66lel6mc4qkigfQ7Hb
	iYwC6vD3erz0zvfz6nJUKlSLFhJZ/IrBTObKSvK0/DyqTcoZcgI7G+Xlz10lRUgBXyMX5CNKE0I
	RNCne840KP9hXsUbSrQQP9jJyee6qGS5eKE/HVZzUJAsh8DzCPS4Zgp5LpNQ/DvWEBdbF
X-Gm-Gg: AZuq6aJiXzv8bcI9SJgHiWFocT0ymThzx8lcfRD8dyNgZG7vJt4xV0MK09PaSHKa2Dg
	Q2autvfJUKN+pe+QwDzHYH41AVq98L0ES2kBkPkKj0a1hOm5wQVdietFvEfPTpNTbIZ05upiwRO
	A0w9mZcE6UtP6SZV4wDkHfaaa12qDTPKOoal+KBOb8WQjHaAvRCFnvNVLWQjjY0VUzSndSqPbtA
	VGjce07ZU6+vUlxNe4cTb+PCGeWqETkM51BSK7Mir0mX6BZPFdXOjFIEi0QebQcowPW7XzuFixM
	xJdhWGJ0luybAkk6ckxN59V+ex5b5HtHFnAjysXHeki4aJZtzL23wg3vW3qbpg4Abe966hPoUd/
	tBscGfYHJ+BiF8GFIYB9xEwcfHOrz8wX1nOcgrlAYcx0QYgUF7wJZEXEsCtgvBILv/fU=
X-Received: by 2002:ac8:5f4c:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-505d213bc9emr154675651cf.1.1770122895403;
        Tue, 03 Feb 2026 04:48:15 -0800 (PST)
X-Received: by 2002:ac8:5f4c:0:b0:4ee:4482:e838 with SMTP id d75a77b69052e-505d213bc9emr154675431cf.1.1770122894914;
        Tue, 03 Feb 2026 04:48:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e0a5a3b1asm685936366b.57.2026.02.03.04.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:48:13 -0800 (PST)
Message-ID: <7733eac7-8158-40f8-8887-44e458d33e9b@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:48:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
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
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-12-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202180922.1692428-12-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMiBTYWx0ZWRfX7t8owKu+OYob
 f3IiSBtFKqV6/ZyxcV043j0R99dQEKbfPD+ErJuOjeBbWbldW7EFRc8onqQ9+kAjcMV8ZzjSdxF
 mudxSn1DRFt6IZVN7zRqIx7otdv4FFagnSvNrmlIAozwbzap62TAcxzemAM+aVy2qTYBAW3st9q
 Ibns2nOMZTWaO3E4qkZU0UZg2eT59zpO/zncrN0vtclfYngxKSsOrybey/SOm+8uEYQEfyGM+pS
 Hjw+3OUvg0UguvprOFIlFPFTrs7ifX3KbyFFKRkWMvF0oGYo+QvCU+tm8OdJeuhiMBkefmEeq37
 mWfRvzs9d56WyaFEJEQKT7ZrTzEJmHi1ZRlHTmBx78jCG8nHzpKmyaheF3FlkJEUiQ+9+M52wLU
 pvbfnCFf9gg6heC6dfKDXICguSI/+MQkF3YGNTXVKuE/H22BtwvnkF17ctvE4wbMh8GJrwEktZF
 HJ4lTgsSx9EHAH9i/nA==
X-Proofpoint-ORIG-GUID: ET8l-J54ugUhOyje4B-srS8G0rwAiPrd
X-Proofpoint-GUID: ET8l-J54ugUhOyje4B-srS8G0rwAiPrd
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=6981ee90 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gzD-2WDeCj_JQFVUwcoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91678-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB980D96B8
X-Rspamd-Action: no action

On 2/2/26 7:09 PM, Praveen Talari wrote:
> To manage GENI serial engine resources during runtime power management,
> drivers currently need to call functions for ICC, clock, and
> SE resource operations in both suspend and resume paths, resulting in
> code duplication across drivers.
> 
> The new geni_se_resources_activate() and geni_se_resources_deactivate()
> helper APIs addresses this issue by providing a streamlined method to
> enable or disable all resources based, thereby eliminating redundancy
> across drivers.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]


>  	disable_irq(gi2c->irq);
> -	ret = geni_se_resources_off(&gi2c->se);
> +
> +	ret = geni_se_resources_deactivate(&gi2c->se);
>  	if (ret) {
>  		enable_irq(gi2c->irq);
>  		return ret;
> -
> -	} else {
> -		gi2c->suspended = 1;
>  	}
>  
> -	clk_disable_unprepare(gi2c->core_clk);

I believe you can give gi2c->core_clk and desc->has_core_clk the boot
with this patch since they're no longer referenced anywhere

Konrad

