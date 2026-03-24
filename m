Return-Path: <linux-arm-msm+bounces-99688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC0fEWOVwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:45:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAD309A4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8FF53014415
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324C13FD127;
	Tue, 24 Mar 2026 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJW/QyDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/ekz+xx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F4364044
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359590; cv=none; b=FBJMxc3wrp6Sp+QC+6uBh6nhGG4envJRzn8xb3aOcpga0UC3LprYRaro7pUeBkwicm4L4K2JBoWTmntO/ksCr+/jvKZrmsSG3j7ItZYGdYqT5jV9UbiFCExVYLvNDmTuoVzoE+TprV8Z3+3WWtCKev7JzXgqBoGg6MoSIM1ynqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359590; c=relaxed/simple;
	bh=dr1tvWY7ZMmEmWK8yyOSc6Ec+cf+WDspG2nMVqEu8mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUoL33JJFV1PxoHDTShWsEa6hUVIQeS5dW7VratFFExcHIBythiIckfeKknW9xt5rwzkPoaP5LhIq+3/WToGDr5aVIsKHXlEYWJj8TPSkhnmSPijksnlMCn+GqZdwdLy8sXp83DdSOM5lh5sHFmwRQDFGpTqsAtK0JwMQ8tTC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJW/QyDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/ekz+xx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xqGt2323409
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=; b=aJW/QyDXCqnqIZb5
	y8nl2vSiaU9XVtMhkQY6JCmkZiloxRRBteRKdIPMPxXz+QqkIBn83sA5TTU76az7
	FNu0Xd0AQP0u7Nr4tku1DpYweb1ObOFzL0SvIfEhNBzufLA8KYavDb7AEnHLwaXG
	McFyrW4qnDRhCqezXD0pd2dtQSLGqIIpYOGBnP6m//Dc8kjKBms5I5xeSZtfvPR3
	e14jhnOVPqqRhpLHKQAZBkzyqg7tbNi2VT9qGP9FGL0kSy60XzV+x0yh9B5MEZbX
	NVnL2zYkFp6HVliNDv10jG+LABqtIy2kyiEwQjuXjucfCmDCroha3GBqiKXHtvA/
	wfclVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkes3r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:39:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so50882881cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774359586; x=1774964386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=;
        b=e/ekz+xxImacvRN41X2qiJfn3M9WUjlKOjqG9hPYOjgG85qQzizKBR7etGEFMITQ4R
         f6MGBkaYQR1AnMyP+ex+vZrkRgJGdKMeP3PfYvnAPdnAZlNcJoEhgCd2BUD93jscsG5R
         YRLC3a+jvUDo0SEfGEBmIEY0ayFEdLJlOZCgj6ltO9Vak4B4Opef4dd8d7ezVRV51U2f
         sS4Wzou6h9gQzB0KOFe5sdYJWq7fRFKuhtQZNMVuRs3QqKgaO8oK6Yt8i8iE0BjqXg85
         In0oQ29ij3LRdo2suTW+YjnXBnwuXNBd+RRMItSTbqeZ7a5zfqQID8NTaeTIWSXwx35G
         eKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359586; x=1774964386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=;
        b=IXVeh8Qgpi6hkd74er1AN1Kv1fRm8GW2VVC5LY67OazH0OZNmjA9hU6sZfbaYyzgLs
         R6ks52FZIUlpJIk/p57wM+XILliQJrzhlj2gENnvxlabWB/LCAx4Fo6XgR20MBKwVPws
         55b3guEwMu0mjKFXSlckGlWVwrOHzoT/xISyhmkX6La5PokT1knanqAws/uZNc3xbHV7
         f4sUcV0cyGpZGxt7m2Tg5+vUCxkQmkpN/FyOf+jxh5Y9VzYAm6A27ZIKHAYsTjGYXM/E
         m9IS/cUTWhMvLHNGjY3N6b71jOpXQpbSkg100+0W2M9/69pzPGklFSkg51M6eCEnlGkC
         XHJg==
X-Gm-Message-State: AOJu0Yxz4n7FCGGQoZWarvAmrCxPm4tnsaC2tFToTVu1yzcoCsmCiRbG
	QVJyTZlMmtq8vWQRxpKW15fkLjey53PosfDaAq5OgkhmY3lOrgNqi43B19h850GdF9bcVtK4Psa
	OV9+xVkIcHxvrycJvmR3dWFYOuOa5Fvc2fsL2K1sV55g6CMqjfOcEMW4TQXKkGKUhGdEc
X-Gm-Gg: ATEYQzxLCx1vR7v6NwF/lJa8/CqfKgZV9uVI96KkOfXlk1hrbllacDC42csxrpMG4EI
	YkhPoRluVnYtZ1AZ3NZ2rARDSGxL5vMM/TlLmpXyJN/EYCmNCQQrfnkz0KlwqqbSR3sCN51Sb/4
	GWzHHuCTrm/2V++3+gTKIIXXVL1UaKbvZiHYrQWJqiX7qlg3TK6NlV4HpigvUPOn0v2XyXVtJaw
	UBBvprywb6Bs8PAeKVHG1Qed06Zq4LcG4dhQbUaCPv5ETaLE2HKccmOMSWV6eR6LiWkvgx3+dKo
	OvY/EY7HQE58d/3dK5JmJCtd9vr7vpfF3jvpQ261ySZJRE8NxBvjXw5OZzsaU5alEQ/DO8s1VEy
	qTQ/Fd3nSRMNFETllSvdD0xVoEMUsFcKTIAFvJ5XFbXkZGkK4qCV+ZSxinyLlZ8IdKs6A/FqVu9
	mVysA=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr201484161cf.1.1774359586394;
        Tue, 24 Mar 2026 06:39:46 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr201483631cf.1.1774359585842;
        Tue, 24 Mar 2026 06:39:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de3d7sm648605866b.36.2026.03.24.06.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:39:44 -0700 (PDT)
Message-ID: <012280c4-48af-4b3a-83a3-c93f01e52625@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:39:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/15] arm64: dts: qcom: sdm845-lg-commmon: enable dma
 controllers
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K095oyd14Umr2TBT-7psYF1_G6wgKXb7
X-Proofpoint-ORIG-GUID: K095oyd14Umr2TBT-7psYF1_G6wgKXb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNyBTYWx0ZWRfX9mk3XTugf8nF
 oJWC2FuS7TPMs42rgJ1cHnCQ6Awaqh4cghL+ysa6nBBzxc45g0ARsoi1OnAQ6kafCfrNcwDzEbO
 wTUTeBHQ2ulBDv+mYHR7SPd54nuYZtQHjQCUyplD36PwvFzCm72Z/vr+J1Klcn88nn9fbdtPqUZ
 vbtjP8OSZzISvRTd7TkOaHTn+4lgxAPTbiUQGOY+TYHd+oJEzPpCzXty968u51tpmL4f0rXGJcE
 w6DzDdVcCz1Z4c8l+0v7FaWIfD+8zJxXLG+zuo5Cszj3LtO//YAMqqlSy4mipnr/SwCpTjAalYQ
 Rx2oHEgmnZ3n1zDIgP7PVwfZiRmgwHJcQLmhd2Pm+urjczYvx5iCk4OsPzhCutB2s/A83ado++L
 +L6L6BxMVZLn/fR1vtTn/IqvOiI6I8fEW8ikC72QYBgdwl++5pHNmJMtNhr3nVUjw/GcN50prfM
 p2jd4gQH5FvXocyGmgQ==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c29422 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=nrrofH4WB8OeSbHxBjgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240107
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	TAGGED_FROM(0.00)[bounces-99688-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,postmarketos.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AECAD309A4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:42 AM, Paul Sajna wrote:
> The dma controllers are referenced by the geniqups in sdm845.dtsi
> but disabled by default.
> 
> This was causing issues with the spi touchscreen.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

