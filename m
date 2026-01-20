Return-Path: <linux-arm-msm+bounces-89906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AR1DpsOcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:24:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8084DBD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E83765EEC9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB3344CAEB;
	Tue, 20 Jan 2026 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XF9FxYhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5KI/bhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66823E958B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947919; cv=none; b=n60tSVUep+pUevU2qWYYMOYms4NvtUJ1Jpqr809F7o7772pgxJG9jucxWXzTV5R7S2iJSb4NU8m+tpJmtihNnH8jr3JT9+ZGnkZvX/lwOCJeY2qMGa7kxa9Swszj/HeahXV8ozjvGgGcSAeVL9Yk154KidGH7wmdi3ekbq8U1BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947919; c=relaxed/simple;
	bh=cTj02y19SgXIrX+rAaKBOytUNYsqq6rgn5QzgG8X0Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzQ0Kba9PBuqBW51XpyF4YJeM79RABWfu2JoRdes6o0SuvTLmE2Z6e4ouuTl/fZGDe77t4J89qQ3MWHs/mERi6dEaf8HA1ozKwYawuaOawshSIc4zEKsuiGjdSnVRFhK2ubNVUHEZcR8I8Lqngpj5xlYWHcKHekzZ8KSI/VZawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XF9FxYhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5KI/bhK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KGdffv3256443
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eDkYb7KCyW+8CDys9pwRBzMB
	3hSM6daXL5ZW5dpm8ts=; b=XF9FxYhQdNyg5G5ufEcDNsxVXycRn9qJPN/etTd2
	qln2FjVqm4TR62yWsoJI949z+HLIxucKUaJ4gZsIZW0jUGB9rO/dvDdT7wQSbzm8
	i6U1GkPEWvgCtTHvdIo1IMpqJRRXTabqqSbTh2KrTcWmWh6uOaEYqHiJtByDZaky
	Qk7Q0hArVWjRYgfwJo1C5MogAdTAXLtisAitZToEx93Pz2NivmySahlMCDDT738n
	rhbzRyiIncE2K8HmD2rpFJR9TJwMy29tl7n5v1cLojxvDAWd2nAhT8Adg69j3A93
	EeKllOrsJfV0JU3adZVOvY1Sr/NtFCjBuc2XJ61Z3yfCZA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7thak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:25:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a360b8096so140738406d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947907; x=1769552707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDkYb7KCyW+8CDys9pwRBzMB3hSM6daXL5ZW5dpm8ts=;
        b=E5KI/bhKo37uCOx31Aew5DATZgffk/DfFZfMuYP5DPsfciliNFcOoUTMgli30vt6k9
         I8spAmw68yLACNAiooHqfHti5WeIvRV32hBiM28qEJohq4buNULwLAI7TtW0yxfFE+tc
         X41rbsoXmRH8yklobuNgpNaVwu+ws4GINJUdTHI59Zz9TjfqU/wCbp3LgadRKivCc3Cj
         E1/qIl1cide+6Hkj26PxaFqfcsXarPEImAGyVRdv9tqjO0xk6avjkRjQS8XsVV52Y39i
         IrQH2YIaZTqTG77rZXL/emseRgkpbk075uR5dvIpGE1ly6Bv5yHO/l3f3rC3ZHh0Ih9V
         04HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947907; x=1769552707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDkYb7KCyW+8CDys9pwRBzMB3hSM6daXL5ZW5dpm8ts=;
        b=Oel/kJqjXOkHiHRmm0m3L7Rx9gPMCaCa9ckH4Mt47N1/8zxYx52uGWltx8uKMbbbyr
         k1o8v3uVQFEgnp7zvItiTEc+u/hIFx+peoQsgml+Nqv2R5DDXPVLZoOizbNGjEKjaARa
         3HwXKob4tIrFf7a9OD84jV4TlIWH5hFDAP4+j8yar3rkIntT12Q4NIxrTdoJbFsJfed+
         HVc2V3/X7sJ9pY6BLVvetBG1a+GOLsmpWAzJ6z784W0nRiZ8ZFHnJ8djm1Ru/o/P4Emq
         ykWjH01ML1G5/x1qiICd8Lib1Cj0lK6r11jGCwBuQBfiratfF9iIIBzG7fR3u/GAcMRl
         FuXg==
X-Forwarded-Encrypted: i=1; AJvYcCU2KufH1K5PpSs3b5a4g5cWe6ORa+fmaSNVwvOqxyrHw3oLFjI/ck4DSiaos0SW0cYkS66xcGdZFl1ytk8h@vger.kernel.org
X-Gm-Message-State: AOJu0YwxxOfJT16gNkGsK/ATK5kZKycckkxfVeQtEsC6uK/2kDQt76Wx
	FEUSHgYvQuPZ2+IYK5u2xa5P7GyHOjsjuv7PtISgyb7X5B3cCdvAQqQzzKcMiXhN0EgGNH4JJ5I
	gzvRLGtm1yYHtuD00dEYobTfdB0QCKCibAmrqmbZlmxXA+q+Vvwfv5Mp9QYRTUnfaJ1IcWEvARB
	gbmYOzdg==
X-Gm-Gg: AZuq6aK2P3sx1Kns91hfh9TcG/5FzWeldDod4M8Q5UH7BYxdkZSX0w8qqycqi0C3YeY
	m9lkvejA1/nJw0ZW3CjjLc7+qh/mQFc5xksucMfCwL1frdJJFJtmlEwUzFjQx/PYWY0gjA4Jvb0
	P/qXK/AjssAc5VwGlYA47RDr6j+WbvTxFHAgWaRvL7yPiNn3fH+0m0rmUM7B5buq/xGVb0/hVa+
	jOn2aniNsiX1+s4w5pRldV7iJ7DBN8nRIXkREco0eGJa+G1FGswNh89ITa3PBf6AaijV5mtsPP8
	YWIUY7Br1FY1NwEBoWfK1l4Yvp2IELXbESBHSEKTjJpCNXCqzrOR8Fb8iKY8mls5bw7RTqoZ/TG
	THK1rJFk6XQr1PgoRee/Q0mdr2K9X9tBQrmDC9GHlP11utHmtC1ipZtJWCePvH9gmwYl4VPGVSR
	MbCV+TLJDJEAMlXSLUPtqt0SQ=
X-Received: by 2002:ad4:5ba6:0:b0:890:8aef:2b3f with SMTP id 6a1803df08f44-89463eb1965mr54611236d6.65.1768947907322;
        Tue, 20 Jan 2026 14:25:07 -0800 (PST)
X-Received: by 2002:ad4:5ba6:0:b0:890:8aef:2b3f with SMTP id 6a1803df08f44-89463eb1965mr54610856d6.65.1768947906926;
        Tue, 20 Jan 2026 14:25:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c45esm4318138e87.82.2026.01.20.14.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:25:05 -0800 (PST)
Date: Wed, 21 Jan 2026 00:25:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC ID for CQ7790
Message-ID: <azeiywnu4lzxkcf42lpjyu5qe5g35bslcc5bx3vek2npb756lt@vwngidfda5kx>
References: <20260120164706.501119-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260120164706.501119-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120164706.501119-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=697000c4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=L65tXJRmyiXgDxE9kDIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NiBTYWx0ZWRfXwGjLIpp7HB6q
 qbMB5pd3Wy5Jq0VWZXLFLVh9XGryIUJiUal8Fc5PDcJH2r+uf/uQw77A7aI2mM1lic/7R2UkzOX
 xPTl/RuqUPKpukqt/hnA4V/JdcjciD3wZoD2AAWL6vt4OoWROQjbgH5afReB4csVrxwt67Wnge+
 N42dgTFRJpAhtYOLSNYFVMDkCjD1EEh/FMilPaljZH0sLtQ2k8MisLiIiu5S1MWBGKIiNqfyE1x
 S5g3k+rxDV9BenRdvi8LSFlGFN3n1PcX6XcM3iq+cOhZT8aP3kNr5rlfkvEw63ZjT5eQXo7samt
 mgoNJ04nuyv3D7sysc129oM7JqdMGiD7ZXfXtDOrMxGF4Ibs3YLKITlo6L9KJFgIQglrapbyf4l
 fdDkqyeagecmkeMf6VMkh2ev4aPDY03D2iPhQoCBk7Rns/SE7tWywBnm/UduXl2QlqNASKuRESa
 XqWQrZgrS731VOFDQPQ==
X-Proofpoint-ORIG-GUID: W3Yn7M4iBKgrQPZHef0Nysp3zzhP6Xh_
X-Proofpoint-GUID: W3Yn7M4iBKgrQPZHef0Nysp3zzhP6Xh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200186
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89906-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F8084DBD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 05:47:08PM +0100, Krzysztof Kozlowski wrote:
> Recognize the CQ7790S and CQ7790M SoCs (Eliza SoC IoT variants).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add also CQ7790M, extend commit msg.
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

