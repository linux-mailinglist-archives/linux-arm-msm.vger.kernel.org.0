Return-Path: <linux-arm-msm+bounces-117993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sh6sJP+fT2oHlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:19:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC287317DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:19:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IOZ90CWe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wh9hPMrw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117993-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117993-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B46763022A81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C14257827;
	Thu,  9 Jul 2026 13:14:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5423D7FB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:14:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602844; cv=none; b=YPXpq5Db1I7REnYCGgg38fGPAvCW8587vrXfg6VXH/npLQRm+pLxNII3g67GwRUdQqUK9pJzMNf7Lkgsnsj4kg0OKM11uc6ggLBDjfuOHrdo2+IEBnNXKLqi9tkpT3/rAPghVwMJcTyXa2vug+UoxcxPm9dpJLEdQzT+UrP+Yrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602844; c=relaxed/simple;
	bh=Kf8KkyRwUi+lP9bS9Wa5ac81Fxsx5+F4rdB5Wyq9NNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFgVuwfjNfNUfv3dQnSUQDrVuR6D9iMeR2JKKFhvtdNCKIJ9GeMx3jNxLQTlqR7MbuLfaqsQHmnWNqlLBB/T7+sVFpw7qP0dZZWBEsMtiaC7HMsBkmOZ21ySC/5cwmLPtx7hVOpC64kbR2wFYKZT3Vmnotz+LWv8welex4iFILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOZ90CWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wh9hPMrw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNVgd1575751
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJsedTfAUnAGd9jf4WEWGKJZShzPIG3A0JMCF5nO4mM=; b=IOZ90CWeVl5nUu7M
	XFpYIEzmX6dmJ2uIOLQ2k/a0RZFoe7Gq9O2WeqKX+2/KuI+JwKcwmxNFwDnfOe79
	u/PewGO93pNAUPfL/NGqI0L7oo0DRpw0m1ywxRdGCO+D3szSGXFCDNz+KHjNFa0Z
	HJOOSOVhGP6a9qSf41pEaJqmEAGU7XNj+DKq5rscJJmbe0U0xQUobdS9hd56XWpf
	EDdbSHzlJeAegWQ7lQY8xDpn2Idy1vKQqXf12WHtjBRuRC7JbXfGWDHEIxUa4u9w
	u0PYUL97j4nvj7NdyO7Ws9nxPFj0GiOSwbUbvkmS8fr13TRNJrHuBxjl8rgay+ee
	G/Xqmw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcbua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:14:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738be9df36fso57197137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602841; x=1784207641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJsedTfAUnAGd9jf4WEWGKJZShzPIG3A0JMCF5nO4mM=;
        b=Wh9hPMrwxjZDDyoRfuow6eSkYHb1H/sME3dynMhHjmqjEdhTKSbfTlNQPG1XuBhCfU
         TZmcsBkYQlP6IGmy67+DHFpsyJxpoQrcEbx+64/lBGhAUYTgWtrcSLRoXNOBv6epIvoc
         k6cKfiGNwdI/Mc5V+P2H3ZbtwLk4OBsnFZTb51BL8pV/UV7EqmPIQQ2/UymUE/3RCXCA
         4AfV0KkHm5VYFUOHlciFbW9WvxmLNuk7CwMhqLAz6TMyWTfjqvw02X74BtJSn2/zInW1
         6K0O7bnPUFeEbNCLAXLYndWXQuazgdIeTpwq7KWBT7UhPRLt3zFMGNSuUChfTzXAy5dh
         lheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602841; x=1784207641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJsedTfAUnAGd9jf4WEWGKJZShzPIG3A0JMCF5nO4mM=;
        b=dF37Q7PWAoZemMYFK+kdRv5PfGJaLSHyYYIm+TtSj5lHs/Y+pI3zCpRGDOs7jlHhz4
         LmoVkgKZ7eIfe6YqU72AgXs/Fcwz21g9FOBQC3ACjWZUNNDlcGjCVhCKezSv1dtEXona
         f9Y2Y2F/nK6S+eRlCehnxpw9kk8xgwWCg/RcBOio8PUEuG6LQ7Ta2KyKI/Lvue37bNcD
         XO2Ra92Ve4lrTlg3b7SFMQEMLCsSiBL3ZFhvVI2Ivav8qI8UJbudu//yY4Bk5kUrqVSX
         l7RvFYg/pseuUieJ6VOpB/1hgTIZL5Npxj2zSWUZXjTO8XOYPQg8DfFZRy/59K4Cf5au
         1w5A==
X-Gm-Message-State: AOJu0YwcFIsL3sFUdfraCpa6yyVhG8UR8FunX2dk/Dbb2mxARb16x94X
	fIAsqPjWmm4dEPveMuC/3yQ13ZcnTUDD73dB/QAzMBmwwgIodBfdx3SpCSqxJ7dzHEGsj8POx0K
	kJXHMBKLFxhbLhLMsNHtkdlGWbGLapAm4BbsLxrS1pZ7xhtWMtXRus8tOAQIYosEtEre6
X-Gm-Gg: AfdE7cms//hUYMDbEPscSXQepTZ8GbiUrgrnW+lWfMbfCHxRVGw1RZ0ade69O4k1GPj
	j/a6YNM1nAAynvQ2+DlDlHN+EX5d2h8fLmi6Zm4Mnod6mU+2QYXQSY9hnq6ME315fHXTSnl+D1f
	t2a9wADJtzupZZQjNgM8FeFqYyebKNUK4e6JDRpBrf/dMSB3eZgD0HFkQJ763DQwRetRq8hlMFA
	BAaRUCzrQQjUsY5fokpNvFIYg1u/sCyRrQOplhs/fkh8q+7lSj3I7dfRnXmROI4PrAeIUcNTM5D
	IbQFw2VFT0PvBVtQndtKeH8KhrS+MJgFN23tEmUvqpAne7PI1KhVMGk84g43AIeKPw9WQ3d6FHF
	IKzPImVwqxIS4BGiM2nz9LtF3YAcFKqSJ9IQ=
X-Received: by 2002:a05:6102:370e:b0:633:3bf6:977c with SMTP id ada2fe7eead31-744dfee6ff7mr1595671137.1.1783602841311;
        Thu, 09 Jul 2026 06:14:01 -0700 (PDT)
X-Received: by 2002:a05:6102:370e:b0:633:3bf6:977c with SMTP id ada2fe7eead31-744dfee6ff7mr1595650137.1.1783602840812;
        Thu, 09 Jul 2026 06:14:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84483csm494374366b.17.2026.07.09.06.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:14:00 -0700 (PDT)
Message-ID: <494e89a9-5588-42c5-bbf3-22c9baffe0c1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:13:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com>
 <20260709-shikra_adc_support-v2-1-8dda38f7bf3d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-shikra_adc_support-v2-1-8dda38f7bf3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX8j83zLREW9lb
 /zXJfWPGkicNbGlZXv0AdDNPC7/UfnlOxldcCHBSIIeU2X/X7THnQegQSWrB8k3L3FttnBE10cx
 6l73CU5Ed26RHAxKafRvjGfGUPQ+xU1v4DD6T4FSDpHGGdyNMWEit7JlNGJjoq7EqVMym7n7mQb
 DXqYgXTIDmEqD1lQNuSLsmzXimMig0oxU+nO0Cl1Hrbtwa3O+dbJrF2rNmoXr3WPkXMH9CImwU7
 6r2OaOaqYahNlZZreCiq6wYbKvx9iIZLYpljTLb01THAZ/bAMYHtdI4oPdX3cVlnqjKs4Dd5UKd
 2oUynsqnbi8UJ6zQ+1gLYDLXcuPt8dZv/IDP9mOFdNIwcVi2CGgApwKfXB9qXGDnn7UEh/k9V9U
 wTQcohPAgvq9nis8hh1KwO6bMg3zVnxZUiCztOlp900OYlwzj+Eh7sH4InDXi+fAxPBsARPU4GA
 PaOLw0AbLL39xaw9i6w==
X-Proofpoint-GUID: 4htc5SDu7ttACRLFuWzEQG2qqac7tKxA
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f9e99 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZcKTkTG6BgqM2ItiMp8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 4htc5SDu7ttACRLFuWzEQG2qqac7tKxA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX2kLRP2amecd1
 BCIwpmsqOx+rkg+je/wK9upwAXTarMe/YHkLgDfkNUGGHhajXXiQW04Rj1kL5mjhCEp3Al2fUxd
 ocw8P0VbtkSmc1Fc8fTIV/a/3Z91lag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117993-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBC287317DF

On 7/9/26 11:44 AM, Jishnu Prakash wrote:
> Add VADC node with some channels under it, for voltage and
> temperature readings. Add temperature alarm node, used for
> PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi | 105 +++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> index 542e8fe030da..62f101fe5353 100644
> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> @@ -8,6 +8,36 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
>  
> +/ {
> +	thermal-zones {
> +		pm4125-thermal {
> +			polling-delay-passive = <100>;
> +			polling-delay = <0>;

=0 is the default, you can drop it

Konrad

