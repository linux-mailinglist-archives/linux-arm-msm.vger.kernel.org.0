Return-Path: <linux-arm-msm+bounces-112734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0y/fB+ycKmqEtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:33:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E96715C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:32:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YKmGp2w4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CHN14sKo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112734-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112734-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 736FF30A0479
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC1F3E6DD8;
	Thu, 11 Jun 2026 11:32:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD43CAE8F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177544; cv=none; b=cPUMmSCBCStuhNO3ETLsekO6uFssL5iQYICRlLFYKGq2cQVmsziqEixFYVhE2w0tkt2I044yD0G0e/kN5zh62Zw4fnF7L11vVp7GrEovyz6l64FM9gWiqP5Ix2oCufja0qk+zgjoEGT7qjjUKcAeHDNpigGwVCTxMj3ZtiidX1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177544; c=relaxed/simple;
	bh=0StIhegVocrr0UB01yU+UcOspZ1FBVgbSkPGYjz3Acs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VneW/AzxbiD1NnHPM7zVsJcYGEb2TOiapsHNdjN9yQu5oc71MqCQ/mLEwTtSOJmUqgpLeQryuMsAEhqmO8iv3zevMzKp8OdIJaVlneHKMD8W7idRCr/vC3GCz+Cg69z5nr0YJUdya2NEJ0WcR/wHjh3IPxFOKLJpNoksMHCWkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKmGp2w4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHN14sKo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBo1242661
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=; b=YKmGp2w4Uw9sd1Lv
	n2/3v+0Fvg+ZGtp4HTspljqxGNIj9yWFgrPQFEJ8L1HtgcHfEFzcoHO7RWeqJfB7
	p/SavtBwi/Aw6c3XmHPakqA9zb4wXeTQbm8P8nYzdLjckTD9F3qRmTrIR7wvLh62
	/+nV0ddbYvknnbcX7Mt0lKLT2nYfyhoRdg8sNdBOP2FJ8KineipZeIE0Xd5rQ5Nt
	1cEpcMoBvrPdKLg/Ml9jotWen3SSuIdKSpTNhA2qZfmwPiL7v7s6jUg++lSS1mqM
	jqVNVnQXFfaf/OGMCxj/LHjL/nJcfNTIzLZbSEDwck1vR/gx6x3pg76ISaqBo9ip
	GRez7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7036na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517796be724so16371261cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177541; x=1781782341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=;
        b=CHN14sKoGZadYc9af023CA0NJNIAg3Gk2MmLIFjhjuCKjvKdHWjbAT5J0kjJs5jw32
         udRbYPYhVeHGvdvFdGA/bfSNo5D98j3WAT+yxWDokaKPFD4s2sTHHqUCLvE1yArbRm8u
         G2i0zM2jC3mAB37fpprceFB2hpakQtQQfIYgLW4jw6Cx8sKV3YCugSq+3xljl9IuJsol
         lXsX3NxGjeUrd81QW5K/medhfkZs/miwZxdRl9lQJPkoW7fBUd/652fqpLeesTwxG/YE
         XTVhe8BeQgIAjrZctgiu4TnLHdxCoZ2Efe4lUVZziNJt/DV/j56RAQz0WUGj+rkMPS3W
         VN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177541; x=1781782341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=;
        b=Pd5ngIpvkWe5rJVYUlmruPCJNg3jaT5NgOhkJIGEabxVX1Sht8ZQBxDpWBZxZphtJZ
         R/tA+lBc8prNIsjhTOd169f/keJ7ZrOb/SHrQkrYoQ8/tzloXGqZXJsg4YOpHSemt94P
         2XIAuHK2jUJdkEkAiN/RLWn5d9XllIGT0b/gIES+vr9WFr+AwtecC87qsbE8y2bAdW/c
         prsDaH3iKjOcsbtyrf9h/YTZKEcYJvSNYT5Rxpf4pxisr8eb59P+ZHKlwRqof7k31h19
         6GdgSsP8FEtXeAE04ec32qViYQcKbi0kU3U5lCP54IesDBkeOEkHZalMSDgzSCrw2BSc
         247Q==
X-Gm-Message-State: AOJu0YwxdodCBuk+L7o0iS8Ovr92z+0xylwTjqFckC9k+LMVo37TwWDk
	gSX6e+7uDGTSkQyiufDmhMGLYI6gPD04TzE3QuClIDIoSz5jw16gssUId31hjF09Rsp8nzA1OYL
	aD1QW6tVAfvqDSBdsopQ/S0guQGYFSF1m7OVqnjCTu6JBoFdVUOtuE8hrLmySZgCcivAeJYx4sV
	ge
X-Gm-Gg: Acq92OGKqYUtCUJDC1mUtOScgrIzp0jSIdvf9BujcKcudN9QY4snxodwm67dYKQrqxp
	GK9SYaeiFlkvJatmmHLiTc/kwYjrhDk4IlduGJlT79WpxzSzfawiWJJgo77q/EAt2jQ3IowdNBw
	bzY9k3nC1BgKY/guaA2i1srVcoomEpjWPfSMnnPxuTh92U+oVhb1sX2EFe40R94sEF9ptR7DCEY
	9Q/NNdl0bkv35uagEDYnmZaeYJnH10UeVR3d4Noejk8HM0PfxjYPyKwYuzMm1mx+AvXBjR5sFKs
	vLOtGPOmDEgFsmIpEsGgyeMqynjYYwTnttczTkHLkFpO6N0zri3Ee6zGGF2CFYwRmFRDtHgyFlQ
	1BAsgAXjZcIzbW5KIJs3pGJdZg4N5wjMA1GcQIBU6q/2r7rEeeJ/Ik+a4
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr20214021cf.6.1781177541011;
        Thu, 11 Jun 2026 04:32:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr20213461cf.6.1781177540438;
        Thu, 11 Jun 2026 04:32:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14cbdsm52606966b.2.2026.06.11.04.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:32:19 -0700 (PDT)
Message-ID: <b6fd22ee-a063-4af7-b21a-5f6268c65b07@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:32:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX5MULIvKBF1Uk
 S/lJBvwld6vn6y6qrZY7glR8XVp72o1UARFM0rtDtotmtGMtmbv4k6D+hgaCQrAyGDUqfBesKPg
 J9fkoYOpYVyJPl5s9lO++9R7W9mSA18LA27o2tYdlZhYj7O7zL5PoxDvOMNC58tVlsgi8bTuNlQ
 7Hw4ar5LY3n7fMaJKdQAHAu6p+UR4ejrTiW9d0wO6vyc/uBghd5fQUIG8jOjkHrKvIOClJ9Cymy
 oA5C1WKHY2YwSxCYW1vcdK3mGJPUopeXccxib4XEM1qEVOobXZNqD0gRQ2ZJgNMLIaWXCh2HtiH
 wTICjSyC7SbSlM1sL92S+cMLN7Ch73PZRNFJgEVv/Pix9ZEIORapn2GMNYi8te8E4vtZyynq8wL
 ZmLsYM+MG/gvLs6U2w9lge/hjYAiJ5l+DXN0Vz2J66K8ehqnDxaj6/L769q1+k0RkKl79Qy0s4T
 11l4kjDi9aaysIcTV1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX5E/Sbw8oO0nS
 1fi4n5uqEJhm5GXCX6ttOm6Ja4e/9Ko5sp6OVPpEL/AlK4UwdtefeRotBzDjFr6a+XMUS5+bmkY
 23HJvRnwYMk8qxVO5YERFRvtz8r/3DQ=
X-Proofpoint-GUID: aCJNghlA6RLRTFp7Jj7HDZVIuMCLO59Q
X-Proofpoint-ORIG-GUID: aCJNghlA6RLRTFp7Jj7HDZVIuMCLO59Q
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a9cc6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lq5VANsAAuRygiiSL6QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112734-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:iommu@lists.linux.dev,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 943E96715C3

On 5/19/26 9:16 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
> 
> On APQ8064 this can fail while claiming pinctrl hogs:
> 
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
> 
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

