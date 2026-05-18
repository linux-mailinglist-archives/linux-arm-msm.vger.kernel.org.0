Return-Path: <linux-arm-msm+bounces-108128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL/pJjLLCmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:17:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 419255688AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E3C730028BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6033E123A;
	Mon, 18 May 2026 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0JFrmFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsJ4Vrd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435623B7B79
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092243; cv=none; b=HZPrtzlFX6rHuDvW2CIWTgBUBuYXsVT5gtrEeS7QMOkto483X3ntbFFEd8kl7S35s1wuF84bmFA4DpgY4TezseCViUnL4qqRIJmMvkb7nKwzLeh2Jl+4FzwEdn/859mfr5oJrjurG7BR3r3QYouiOD3Ay9p906u9l0rg8FChrG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092243; c=relaxed/simple;
	bh=hnHnOVBpSZeFkIWLNG9w0ldAaeesmrJh03Ccok8WI7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sX9SYSMAhXfRkoS8UK//qwUFABugRFGPeTutlsEtg0WF00efUz/qjV6bN7zfJ0lucvUaF5NmOOQbtUM9AqgPJs5dWROZjk3yEZsOdVtAlxVA5kL2bJCRB9Y/XOcsvGMnQYQ9eOhxphHHwU15UTMAX0mo2yC0sY4kiA1Q5/QPnx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0JFrmFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsJ4Vrd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I2V5sR2260316
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TeC1sum79htyY5/MRpV/MwGyiDGW2vSHpi60YrA7AQ4=; b=X0JFrmFMptg7TygH
	4uReMr5XF9a2SItuVxjCHMc5Uji9KvkbP40payCzn5PtvwYB4HgOpuUzZ58igkTL
	lPrjNusZxV7Rw+mfTS7GWAJpM9NhpzQO+G/NwkQtvs1qSgMFCi28lILqgvkOr8d6
	KkQeANuo2fNTtY6193hTmECpGSih7OcxagSTlpf5gwAANJ0eT8mX0qvzEYy2Wctl
	S4kS3CTTPeh3sh6zGTMOHEywLmKvJ2QtVtkbd1St4fA0PKBghXdSYh/m409//caw
	Ucnyyv6MQBZgmPWNUEKDWUZlbRxdqe/5eVxZDjCRgFfAIbvPJavfTq0gibuDmH+X
	K/SJYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqwfm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:17:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so5561951cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092241; x=1779697041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TeC1sum79htyY5/MRpV/MwGyiDGW2vSHpi60YrA7AQ4=;
        b=jsJ4Vrd08toS51XT6blRt8g8XnENZzAm/RHhWk1xM62HJMBxRN8Nha0E5yVSVb0fYB
         jN2AEbnJzNXEKtfUydmD0ZeDPQeBRnuGRbdT0mjCBF1hR8cx75WkjXrz+a7jXSQCVzef
         +RjCLk+c7seHwWEUjBwu+CYIKpw5bP7M1RyU0T5GqWIAHjqw4MftIEhF4g+Yus8u91my
         mK57u0ze25o36VbNB6C66HRITFt/Xx/T/UYaT0fY/HAUbMR0uz/7omaLIcSIlDPABqiG
         ZuaD0dWWU8t4fXLFoPsT6eKlOy3jUG+kptLHZu/hOFxndZrdW8+6M0Q9bcq9sPyXVqe8
         vPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092241; x=1779697041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeC1sum79htyY5/MRpV/MwGyiDGW2vSHpi60YrA7AQ4=;
        b=hJahM4DYvwgv36QzQc5Yksqbp9K2iVLvawXd3L/okOlZZA2rrIEeTY6pmeTcLMUUiq
         GwNX6iNXYiP7//JsImz+ebc/BYVEhNBKFs5pcGJTrGdVySaO/OP7B2haNw4v/SovYNCP
         06skGIFPt0Fy0j4F4e0a/bHSzyuGkuU0tz+4pl5ggvIJrIO7QwpJJwNBY/aG9Q8JRuM0
         R2vb4kBsPqvbMMue6KOVq/CP+PGJax3JfJKbHAF5tsqVbl3TAGauTEJF3V+fL16n23R/
         NygupwzURev5Y7yVMoSLbDspOUQmYFL510ckljcJ1p7bcHo/hDMMnLH+4LR7HRSBydRa
         drzg==
X-Forwarded-Encrypted: i=1; AFNElJ/Jkpu97uJezEdvx+PdlR9tdSUQ8qVFTSBA2BzgpXeURLy/mjY2V1XSVxfHO4LKGy2Hs4J0JpOH0Xa7U2Bp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy2ggQUgJpDyZowHv6LzpAwgmkEDN9/IAC3RB+ZegBAkyh9YbQ
	OyMpVos1dnMkHzGJeUsgVp0y4z9HU8VNV2Eu6ZR+CXTw9IdH5VHiQxKAqlFxHc20aCssjhePsSF
	wlropVBYEv+BRgh8ViU/uMn/1cpn5fOst1LD5w7GtLlyouvdudh9LzqshAVVpbLP3w/LE
X-Gm-Gg: Acq92OH5YFgdHAh3vEHCU276af4aUBWsCm+ux1TyaJvNF5gNW+zov6on7r7cIBPjX01
	5qoG5MD5htthxlkWZA8RQ/IhisCQwErltRd1FtBDrzu1QtB6UegPnuN1ehg+g3DWtceQVY/bG7B
	Bb9/+zDqLgg4leorJs9JCtruUzu6SEqJRxQXlQkosKIsKs4sr8/Y05Q4K1I4Qp5oEgCYqD1bRy9
	BXR0weC/OAoSwAsrxLSLicjUanXj3KekBRvOLsshcv/Uvvm6gVKp/zi1jaSfQp27d3LLa+iSpEw
	uhLtHTS+JPCUp6g/TT8P5KKIfkXN0GtRQPBosvZDxDmGAR2uI1MQ+YRf329Eem1bzDG0snkgbzq
	CiiqF30PahSmOg4OR4/A6HSLOzbIwGutEOAgAARRj4EWsYL/MYgJ7cPDeDTyEPynBL12cs1dhC6
	ynahCZlbgDUvU2xw==
X-Received: by 2002:a05:622a:648:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-5165a004137mr125819191cf.1.1779092240538;
        Mon, 18 May 2026 01:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:648:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-5165a004137mr125819021cf.1.1779092240072;
        Mon, 18 May 2026 01:17:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm534494766b.59.2026.05.18.01.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:17:19 -0700 (PDT)
Message-ID: <915bc9d8-e5be-41a3-80a4-c883ba77ba00@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:17:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] i2c: qcom-cci: Move cci_init() under cci_reset()
 function
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
 <20260515234121.1607425-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515234121.1607425-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U5VS0hbtduVagTqKGlmRNTaXyfJOvSPs
X-Proofpoint-ORIG-GUID: U5VS0hbtduVagTqKGlmRNTaXyfJOvSPs
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0acb11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qpnuY2EOznYSXkWEZdUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX0rIc6mlodQYw
 4Ius8wlHvmO4c53uuQvrECgC4ysR1p967PTtvzOxt+7MNhuMXF8PuCuXQgE6Q97b76lzz2nYmhB
 UelfN92l+6Wc0K5szckcj4IF0/nqIpumN1+z+hmNcFYIwkkc1EkshIYscCRZ43OJom8Bvu/oLMf
 EBZGWYig8nofOaOp4BPlTfoUCdk8pvbo8PTcpUl888v1MLCEShsAsjRaPBEkVhge3gZlasUG1Gs
 NEcR2BcfQ1rXUy+iB8giKW5M26WHQEq841y1gkIl7kB/ks2/YN1PAe/ZURMpB4ncxhAcWtKvWgm
 0pTl5xGq1MWdE3+TPuRL8VeEM/RzlHPhTsm2gZb3tvXLl7sD2SCmmlIJxlMCKqrKm7LPg669pWe
 CGmZU0q1mUtAvt3WUF1kt+iYx4ehTJ8TaVKapgdiPELD62XZ8Mq9Q9v7AbCyrYO78cD0EWaCBT3
 hakO0Ul5sObXR+ttP3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180079
X-Rspamd-Queue-Id: 419255688AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108128-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/16/26 1:41 AM, Vladimir Zapolskiy wrote:
> On probe or runtime errors cci_reset() is called and it should be coupled
> with cci_init(), instead of doing this on caller's side, embed cci_init()
> directly into the cci_reset() function.
> 
> This is a non-functional change, cci_reset() and cci_init() function
> bodies are reordered.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

