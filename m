Return-Path: <linux-arm-msm+bounces-104990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNoUJzWt8GnOWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:51:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ADC48517F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 764F33103C0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B19427A1A;
	Tue, 28 Apr 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EK6vnmMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2fgnxl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67BC421888
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380189; cv=none; b=iA+WOlOHLpfrhV0xGta/IykL+3Xz1iYyqo/q0nxBXkTy0eBnjD36WDWmOqrqCND2Us1NSzyJiQXvTKtC6V039eCNw3Avlj+Uxx66BdcRxFY7ApsHz9+/xS/o8HSCPTkWBxh0miNo6m/UDfA9uEMD2YsMN0nU9i+o+AoNmjDYzjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380189; c=relaxed/simple;
	bh=QhYxX+hsAoh+IytWxE2GOVHTh+c7B4jw3R4+HSXbbAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ylav1CA3tpVlX7G2EHj5G1sKN+KqsI8IWCzEFubMa85sTsEbQFKbe3o3NW3qfpLK0XdCNq8FC+eq+cH9QkifHIEz2BvRX3U5YiP2WDFQbSzZKCJZMQuf31F2Ruk9Y3wvH5ptf8nYyBTqdYW9i7P92Pqx3wFNo/OrOQ1v/srD+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EK6vnmMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2fgnxl5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA3tBS2112620
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9bXkVOl5qRuRv39RpxiZQpZ5CLj/sf/FMrv2RxS5Is=; b=EK6vnmMFksH8J8s4
	LNIUaY4sNNYT7d3A7uzttMcfKhYv4iIXLaXBD1gTLEJE7+KnQgfTQkxIXFq/PdNU
	61ZbHMi1dzlP5FCRdRCVGh/BBpGfSkC87XqIOZpHafZHyCCeBlkV0EJs7vaKHkvR
	LlYBGSbd3f42wdNTsxigbivooKmN3S6+CmgP4/zzWtSJkf7LBpOCmKujwjuvy3IO
	ZwjW0wnZSFOne0nedHEQvjjGuoCEzkJOuG3Jw8YdioF29TL+jciuP2B5iecbZFJr
	YMrd+SVIKjhmOe/fzS2OB8Ki0TY3BKJhNQ3EPmwN6BUWQLqRjWTWjQftpFSwMS0a
	WoJFyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbkj9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:43:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ee23ab9f14so108642085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777380179; x=1777984979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9bXkVOl5qRuRv39RpxiZQpZ5CLj/sf/FMrv2RxS5Is=;
        b=E2fgnxl5TpK6BFQ8S/6Kw1x8b/uc5jVXU9nSBTkgk+kCmQqoJ1+AxRd6nn6KPVYQGe
         IjDT7K889G2XtNnOIerIm8srYpYFdeZii1fDMVkHWs+7BEcDwPVA3DC8d3u/PDtJ2mL/
         qJqsEEMtDDYPWADZzPRIOzIHi+2jUfTucjMWiX2cgUmJRu9DHdI2jThMFVxAtYPyoEsK
         fTQBoQaMivCly/Cb4N4TT96Dc08GN3UDDQXXjsz31UplMtfwg9DpMRogVjSRSDsO5H/K
         37aRTQcKVSe9goHsuFBmATdfGx/63o2R3VKc7R7oHN1tNJ5lBUzI+5UQl+YWiFJLbvAt
         +LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380179; x=1777984979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9bXkVOl5qRuRv39RpxiZQpZ5CLj/sf/FMrv2RxS5Is=;
        b=XOX4PESwQvg4IYPIwWvPhl5sWYNZJ2pI+GTIQ9iG4WOt1LBSM/x3EED4EwduvLzKU0
         Sg2nWLsDGfClABEpj5BiiKlIad8f+0SVlywP+rEKoHwzvlw8i2KtFDKLbS/Ed2Pk5MyL
         V9jCcGwZ/5aqsZE+NQSOY4TGHxVOYC+SGjJKHi6saJZucQWsLMHWuDbLNcgPCP7ibx6n
         ti24uNAsBIQRPqbovHt7WnxCaUmgrdQeviyMzPQDYUJAYFmlt6m6NPw91tHJMuMYmUkX
         mu+nSBBmEevghg7sTuXifqLL0He/+76Becv8WKr2hKM2982jHPKiQCsT5pencEN0ZoAA
         3ztg==
X-Gm-Message-State: AOJu0YxW6x9mSxdmq1RR/wRZcxE7ZaRUmHzFP1b+1MUqxdeUbocZygDs
	eOCX8s8EOgZvaFqEbGZDUCOd1RLhwhRLVMxfDP7oeuJdTYQsy9e+KeEjow6GNQ3s+OyRH//bV1u
	jeKYql9tccACrXTGzABsWG640oUtb5ENemkPIx1VjaKSb55IxQOpH0z+GYoDYF+L8ezf7
X-Gm-Gg: AeBDiev/Wx2DXDZwOqQlNJnyG+M5hIQXJUOFxYsTKc3V8jGdcpyzptWosuM8DwjkZM0
	+hLRhKzxl5QkVaj35LLPU6h6qyvUm+NouZuv10sYZ51/KE0daAcLk5XvqI1diDwmhEhVkBW2CjB
	ghJYfIbt6UM3d27BCfhSxgUJ7817g+wC071HVB8JaI3HFFC+PsCzvlHjBF/XtEH3ouQBgQW+34a
	Dp57uALJiTZ7d7fxAaAvW66yd3fyKWWpFMCHm4anoM61bG2awyLJNr201hSDFk9RzBbcGS7GK33
	+CcHRuvDMtO/qTzbN5X2zfNV367jguCfyfVUAaH7A9Uq/6/1uFnIjiIruMiZNuTbvFx0k+xJIcj
	FvA3A0gCZ86liVrdFlLu9ZlkJNBUDiwSNz5DKupWFprjeD+dhYgJMDYR9gXJQh6YSOxSig+Z6/L
	QicOhJP/cZFhjIWQ==
X-Received: by 2002:a05:620a:29d2:b0:8e8:dc40:90b5 with SMTP id af79cd13be357-8f7b49cb658mr290567385a.3.1777380179138;
        Tue, 28 Apr 2026 05:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:8e8:dc40:90b5 with SMTP id af79cd13be357-8f7b49cb658mr290565185a.3.1777380178724;
        Tue, 28 Apr 2026 05:42:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67638ccsm766233a12.0.2026.04.28.05.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:42:57 -0700 (PDT)
Message-ID: <4b52a34b-7c4f-4a42-992e-1afb317f8a11@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:42:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable LID sensor
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-glymur-dts-add-lid-sensor-v1-1-470cc168e70a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-dts-add-lid-sensor-v1-1-470cc168e70a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 75-wZs6GqyTYMsaX-slLX37SZkur1f6t
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0ab54 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 75-wZs6GqyTYMsaX-slLX37SZkur1f6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNyBTYWx0ZWRfX4d8QEILb1EPE
 kXsWMo35fWdUCtrH12JOg0tjUt5aXtsmHzxDRaBdVcqymSzImgz0+71249BA0Jc6Q96rpEPxs+A
 krshI3lxBP8oFrKHJi938Ugyxq2E4SVDJabWvu9MQhCMaLqsFHc+k7WZtdWzTL9ccbMWWJ91XuW
 B/dWiA7jd5gOSNFSByhtRMvjk+HUmPS+Z+kUPF5dWzeFbDoiGjJugoI5WrBUG+fyDBdID5rqzDM
 3HfhyM3fJchpx8MwER+1D8z/XtlDGYNZ7LSwTSjKAwGQhsgXt/D3kEmIe/Id6E3DiJhduZZnj0M
 GJfsGesN0vnNSsn+eT2YgRsS5aZjW/bnc6cGgp0ojdC8YJxuuSQH87kcdBT9VsrsAeOAd+kH8Dp
 hDKFny0r9mijik/zcV4EM5FuZ4yb8ApgIink5Z0210FnMPlbpoa75LSqIA6fqNGGveBFsY0ZFrV
 tu9NvlZpgqS30Unga7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280117
X-Rspamd-Queue-Id: E2ADC48517F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104990-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 2:32 PM, Abel Vesa wrote:
> The Glymur CRD has a Hall-effect sensor used for detecting when the
> lid is opened or closed. Describe it as an SW_LID gpio-key switch.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

