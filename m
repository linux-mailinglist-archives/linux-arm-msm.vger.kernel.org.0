Return-Path: <linux-arm-msm+bounces-99837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAAiKC3Dw2kVuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:12:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC49323B02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16334308D8B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D983C4577;
	Wed, 25 Mar 2026 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGpa3P+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMAINK10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A83CBE7E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436974; cv=none; b=GmRbDZ6usWO7Omxl/ivfuZF4KRgMQdG18Kjq0TF3LItMWYfYvNtK8ny5O3qXB7wTgiU0MBfFihGyZ51MC9Ju5hVmaTprM54aGbYkEfSF1Z0dy24JJPB0ehQZ1WdNUmvkoWkjT7/t+ee8I4asz2lQM6gVOABJqWFhIAvOJ9K+ILU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436974; c=relaxed/simple;
	bh=skMDzRGLmL+RLYn+0YoUEH0DRrPOB3C3eYsnAREruSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9qBJqLrhxt32y9sRAm9GH0uTBIEXswadbkBk2h0Tm7YAIuI19XiTM2DRxlwkXYsEuAAlEN9ZEZdBvPKbDsDYN5ntuHmVxn/hltXxMdks63Tr3wAnjxIWtajre7VUjkCIwjX1DRAxkBD4JI0tmYbRPge68muOws08Ku3NNm790g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGpa3P+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMAINK10; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA4Yec2932155
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfLGrQX0KfBi3itj/xvxgbMtp+4f9Cmc6FRNiEiB3j4=; b=HGpa3P+s7lV+2Ulv
	Nd2NiMtFdlVmSy+zdbpwPqlBJS5EogBqaBjlQxMsx3X9dn1UPi2vHnoPTyO/V1q8
	PHqI9Q+ogNItYJ8KmmhhfXkMtwtuBVTj/ePO/nuLDUSZb6vZjC/25laZ53nwSgBL
	sbPNEtsp8q87v1oENn6akoLXfisF0H4q/ePH0HH0GMTg/GNlvKN3BvrLdNpdBlkh
	73/AxTdrlaVCziC/3/PAoInxGONHklNiLeR/+2NJq5cv5oaP03oNYTJ8mDMDStIC
	TCFd2urIXQuWMRi2LRgHoQ33DjEL3QADsV0d0uVAkdtLFFPeXaub5fHw2RAAQoub
	CSkaJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpr8g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:09:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a081737bbso66684846d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436971; x=1775041771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfLGrQX0KfBi3itj/xvxgbMtp+4f9Cmc6FRNiEiB3j4=;
        b=bMAINK10PTLgOvwWCFxi3a8XQZ6CKI9qTH5A0ejWOe2+V/TgXH08xhQHQY7P2z8Erd
         4MwBBvb7GnbEaF2XszrB5pDyLUn4s1l87cvsHhSVUsqdr1cguPrjqO6UVCtM/Aom6g8o
         mdoq5OzU4TL9cw2kRdnI981yWdOoMBG52A++60bM3+4w6hTSbrzmHjgJmgUIQ+GSyEkO
         K5tJjGBHCpZruQts9uUxkd8/JXwt5XNCzJlJ8DWUnLKo87mz4kR0rgza6JqfEk9L6HWl
         3zuokELzteuRTkfC6YkqO3iUygR26FU3cz19zWiC0T6TLlt+WwFy4cbchSiatmox8FsG
         +80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436971; x=1775041771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfLGrQX0KfBi3itj/xvxgbMtp+4f9Cmc6FRNiEiB3j4=;
        b=O9pMR10QU0iPfvEPRO5g6lQNkDPA6zf3IsH+J8O6ky9R2bBH/OU1Tik5bGDbD7GTWN
         oj+El+2g69rVwI7bEQZhfdBEGAvk0ct9kHu6LHkgdy45HPH9hzG82peLtGCdjNQZeBCd
         loXRCkhWEBSvbzky/YlffEl287K85jIgDs67iFYYLO1ZGrqnJJGbTRqW6Ieb/aFCxFtJ
         wPeoO0sjAqETKdqSbau82CNApFGgWnzEka4o5bsd/IpH7shcbKcAFuFg4J/NS5wmDoK0
         lRqZQ3hn9ch3NfKyCIX1KGjdA04FsvusVzY5j3wBz6AYG8XtP2kCwDiDw0MCFbO5R33F
         em9g==
X-Gm-Message-State: AOJu0YxiFmIak8oQ8waeavNjOaSXQX/syN/0uKiAEl7/jngDyu58Meor
	9Yl6bWIhfpuVQgMt5WtDycneScIMZTOxbVN59Jy9Uk0Q4Tkcfmk0R6XEBIzb0PSZMcVWfQtEBrL
	mmFqms5grhlCxAIXhcdcZ5Y/roRuPDgOUKwbJeXeUQgRnudbSS5lJ360yI9PvZFUxiPPG
X-Gm-Gg: ATEYQzyI3PW7B3l0XMdG2I6ZERT8gU0Z/tyakbHd6eGt9ovUGJFNxFvAyQyGWNEJN5t
	CtqxzQgxtrx20qKGs6GK4X9spaHH1r8tikun1K2DxUDS+6zRID5BXCpIOY4VPVRz27yuMbcWSkn
	c9ygGfcKGqRUvT31jNcrR877C8JTYyFSiXuSbmUmY+sXDZXcKrJETvMNBlC+BJSqS/J3pE66Ozm
	CoFoD0F9mhC392r9DsoQ7FllN+QkLysB2lqV43ChcsR5aTvRnUHF9EHYxSZm1lmghuiZRKEgJMs
	3cAeFaGwoyoFEehdDWZsKBbHi/MpUAFwo5TxGPQRpP9r2Zr6nDcrQO+KVS9vFgIUx/nlotqLNdo
	1Rf4VfcQTluKkkjg5iR1EE+5NxwVczp9M+ZJE5fY8npz4vuadJzgIv6Uq1F3+W147ZaMFMQrpQx
	hct/4=
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr27279861cf.9.1774436971071;
        Wed, 25 Mar 2026 04:09:31 -0700 (PDT)
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr27279481cf.9.1774436970567;
        Wed, 25 Mar 2026 04:09:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a33e0fb64sm2042794a12.12.2026.03.25.04.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:09:28 -0700 (PDT)
Message-ID: <919a157e-84cd-4588-8557-64542fd08e7e@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:09:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add AYN Thor
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-6-33a8ac3d53fa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-6-33a8ac3d53fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX6VrH7CpreTS2
 Q5vlHsO40+obgSRPsR47LtAUAHXZ9FbOTAQdL3e8jU2M/OcFu66Mja7wyjnoCI5WCNvDe0qnFd1
 4NgYwHsI0HymE5DmrgksN8fQE7LmWgskKOAPRJQQUVvWH9NknT9uMjof6BSs0s978yvWovqeSM1
 +Y8VWu1f9ASwtLcXorsChuG+3y7wY8Vqk3C/3B9DLwtKZCqGAXiBOj0fzmodvQbekNGVgkEGdem
 cINqu0u75Umer+qXvxWBddNwV2mHfCz7oQK0klz8YecqA2iK+BEdf+Ml74aC3iQh9NwY0U5VDgd
 jUEIbtEbkUwsAOsCIBJoHluClb3CBixByEqP2FcjV2U5dQVdhoMg2TSAf578PWnv8w45q1Mn3/Z
 unM2VfREBdk3Uuz2ehB3cWQ5DI7MQk/2rhaKhLEm0wE5T+ovOrSWb3lvIJM+GrDjzUio/E/FsHk
 puHfh7zlxhml9+cW2lg==
X-Proofpoint-GUID: NMOzlVNC4DS0RS2LVmRcEZWCybzivora
X-Proofpoint-ORIG-GUID: NMOzlVNC4DS0RS2LVmRcEZWCybzivora
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3c26c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=I5Wf6Tv452McHZCWETcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-99837-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DC49323B02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Thor is a high-performance Android-based handheld gaming console
> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> AMOLED touchscreens.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

[...]

> +&{/} {
> +	model = "AYN Thor";
> +	compatible = "ayntec,thor", "qcom,qcs8550", "qcom,sm8550";
> +
> +	gpio-keys {

Please override gpio-keys from common by label reference

[...]

> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +	status = "okay";

nit: Please uniformly keep a \n before status

> +};
> +
> +&mdss_dsi1_out {
> +	qcom,te-source = "mdp_vsync_s";
> +};
> +
> +&pm8550_pwm {
> +	multi-led {
> +		status = "disabled";
> +	};

Please override the multi-led node by label directly

Konrad

