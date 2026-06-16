Return-Path: <linux-arm-msm+bounces-113361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vWr8NScfMWrhbwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:02:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA268DD63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:02:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="nyfo/zpa";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jBldJcV2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113361-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113361-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F2A93004F39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDB0356765;
	Tue, 16 Jun 2026 10:01:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426BF3AC0C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:01:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604118; cv=none; b=QUhvGpOAzlwSQ5VRBcj5wEVdOg7ZqC1VvXRprBMjUftN2PdKDRrIQLzwH+VZwNqjPz19m2lyFrckjuxhpwaAfYHyIncwuEQuKdS2Q8xDRufGES3/Pt/eiaUfqwRRhN8QFL8iIXXOEbrEogAVEWWfxbxuSLRVGOV6bPkB6TdkS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604118; c=relaxed/simple;
	bh=01Fc/ADSOZDZ1YOUFiGsh2Gt6FB2lvIRgd4lvAvm/Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnC6in72Wqc1bUqOKaGQ6aOFu2IRqKp/9FWxlNl2r3KL9bQZDsLad3DpRKZroHtv+mn0NIRDusmhWICHBh+bn4DoJxC2NS251Wn0Nk3SkFxF1P6DBNjnGPVi/x0RYqaYct2c4IfAgk1GgdAWZVLe9EWr521vpeyAMd7cPTYiaAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyfo/zpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBldJcV2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64OWA2289608
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZH9b/PeVYJfBxYJerWUqFojidubZWZ7u1DZcm4xfGc=; b=nyfo/zpa+QHaMpyU
	DpNbxzv/6NZIVuDfDz2ASWwLw1jnjwCvfweaEBtHtGRALNvVCIYHX/D5lbtfqlbw
	1YG9vR3Ixy1cX/1b9y/fxWp/3c8GjOu+brdlW3e6oOQslfve0Nm9RbRGKocJa02e
	PFlgFZpQsRG1XxlZyNfTU5opoyJPYbGFlCpP63SMcBBnhPF7EMuTTx0z+XTJJnaE
	nwpc1ofQczzbdluDkQYVbxqtGBFLj27+jXBYyl2yqCGK/zlDxNPeiD+Ye5DBV3fn
	DKQ9PpymV1XvlYKT9ZsonEBOrBjeRqtX2nIhYW+hku6txEV9llM1Bi7hHtk+M+8O
	0sGL9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8k9q0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:01:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176891d0a9so10708271cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604116; x=1782208916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZH9b/PeVYJfBxYJerWUqFojidubZWZ7u1DZcm4xfGc=;
        b=jBldJcV2F8IHeFzU3gqikGn27aVBGe+I2jEA3nb19pLdEvGtAxC4pzy7/p0F5rBzDu
         5KSgKHsaWRIV88tXH87yltKV811M4t45y8zGa/LrhUh0JAEqEfTrYunL/kXyX+dScSQB
         fLeuX4kcShmq8e7Oo12r0+nHRA652GMJGYV7xLIWHGa4uiAwGi0LUfVuz8Byzz/z4UaK
         XZ90cynEQJOmiVQESwlXmq+ewgkdCOSjpVunM5jPjSsjq4IWZGBuoka+W4yOyNRAkJIZ
         tKeQrf5Tdc+k5LagDiw18zjXBIMAnXHWt8iMk32AmGMfDEVqtHlgbd1ISNfhW/CjseBx
         WxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604116; x=1782208916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZH9b/PeVYJfBxYJerWUqFojidubZWZ7u1DZcm4xfGc=;
        b=pffogdcqkk3QZpzIRdl9cp0w/7jC3Mxt8kEL+lfAr935HjpbOUmhKrb0RSMwZNp0HE
         ce122ch8gWIgDwxQDLwEzDmMvEI1oyigNXohQWyjPOsEUYJ/GhLz/BwqytW795nChHvf
         WTjJ+Z1cfsQnzZ381IBIK4iiC7s7d4tzHcOnrMGNL4Uzhb0oAB98x001e5So1DgcqSf4
         t3MzyGRjeWl75CEb0nJOFJ7MLURBRbcnGmseqtbyl11fjmwL67NVGWIdHJtcRhzq9WkT
         M4vV+Digj8FhHoHP0L1v3/Dwkk8QnKguCfuGsJbkG/WWRI6/OeZ2oqb8VCJd7PGfdUuh
         IzOQ==
X-Gm-Message-State: AOJu0YzO03e+Fmh4kjGDiqXDJ4k2wZSqjIXoZrumnHb0EplZjmpfZfn1
	kyzHcPA63g0knnNQOkz3pjUv7y8px3IiJNM9OTjfnnMgn4+rHTue21MgcBN+uQg4OlpHE7771Yh
	PRtRY3KBetamYXianLsohYyOP3CexeZlISYEIuFvK717+iKeHsWtgrz7HC1I+iLBWrkzm
X-Gm-Gg: Acq92OG2zKnJnvJJsykgS2tIGrNlDyJcg/bHaJvnth79gWv+WZXyuYxGZbgpYriF4w0
	g+ImR5tEcNzM2o+anLt1p8Gc+cliYA5dYZfiF5BzQKcRp5mu77PR3xzBbW+xF9Xq+24Kld26Yxx
	tUnESE5flDmLWhv3N98hjhXG2mD9XLbbzYxBaF8/ldilRs2PkXwVUvHvacidXWASyaEUDsCxw0P
	oXqjZWp/7BS2/YX38zyYKBswbwT2h39D57g/v9Mhn3HpZWOVMvmTks3juOs8/rfd4lDecnN2UeS
	A0D0Q8a5bomAr1vueVhmFbqvmevTf9KDetRhvrmt97s0eedp44ECJ7QlwNwxWj4X5f/G5RMG57+
	IWkjr7quwMPv0yVqIGpznvi2AEkmWX4AM7sFiERzmuzIhZQ==
X-Received: by 2002:a05:620a:8011:b0:91c:9d38:30ac with SMTP id af79cd13be357-91c9d3836a4mr138711885a.4.1781604115493;
        Tue, 16 Jun 2026 03:01:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8011:b0:91c:9d38:30ac with SMTP id af79cd13be357-91c9d3836a4mr138709385a.4.1781604114924;
        Tue, 16 Jun 2026 03:01:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693791c5d33sm4694035a12.8.2026.06.16.03.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:01:54 -0700 (PDT)
Message-ID: <8b8fe93b-3df4-4dd4-acd6-3e87401071f9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:01:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260608143329.252033-1-zstaseg@gmail.com>
 <20260608143329.252033-3-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608143329.252033-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMCBTYWx0ZWRfXyYJ4x6CzfBUr
 KiLhu5OKBxA2UKnDl8KNNIjOolHPwIigcfQtMfhJ6L3y2Eq6ZUSBMSQFo7h2rhad5tniY4m/8rw
 SXdZTbtAno5/G1BKgjFzhy8g1xBiRXPVboP5Dg+VVfQjB1s5nlKCacobBoyTYRBkBEGva+YWufR
 uVb0IfdGQ+IF6PhiwG9lDCMrefD8cclnffdK4ztwYtmexw4rl9PMAUqcwtSHfclKWkyHQHPgPaC
 i9WjDEZDJDbZp6ac9H81AbBMr2/NivSMFRmn8Ba/vvIMr4qdvWJgFYxE5jOI8cOJ3V/BfGkMd5O
 7x0+dmPgnSSqHzHl5XAm2SxqxETBjrNcG1rHuv2wxP+j1iRUjIIgVygu2Lw4hzdMeboV9s1UpQN
 Pi6t3JJzKcAUWMNjfRe7Lp8q20sTZBrxarXkCGsF+5YWtSh6pK2+lObJnexVIOSViMPO7ryAoTd
 AQMKeNfuLMbEnJ4JdIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMCBTYWx0ZWRfX3jVp53XpSbA0
 vQRgl7ocgK/NlNg+AAgPcefHjkQ9eEH0GWvyLiXyauuKJ5MJZmITojzc5HIzmpB7stViaPeGtyU
 ZO7+gtVJghFd6WeFlyWSwGDSR8pb++w=
X-Proofpoint-ORIG-GUID: OpcFoDypei9m_A8ypdrpO9-w2Ik6TMAQ
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a311f14 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yr-2ec9jEi1U7REnfNwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: OpcFoDypei9m_A8ypdrpO9-w2Ik6TMAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113361-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zstaseg@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66FA268DD63

On 6/8/26 4:33 PM, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

[...]

> +&ipa {
> +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
> +
> +	status = "okay";
> +};

From make dtbs_check:

qcom/sm7325-xiaomi-taoyao.dtb: ipa@1e40000 (qcom,sc7280-ipa): 'memory-region' is a required property

Please fix that (or disable IPA)

Otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

