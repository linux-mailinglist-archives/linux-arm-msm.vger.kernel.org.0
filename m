Return-Path: <linux-arm-msm+bounces-96460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJmyHRWKr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:03:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B1244938
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33DD13047092
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3FD3B7B70;
	Tue, 10 Mar 2026 03:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOdozkCs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cyzh6IHV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694E53A872B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111803; cv=none; b=eMD7HRDGrWpTxGkWIa6x6wHhUrTrZmcwOAmPSfM4/WwQIjoqdNmXScY9X5TrwofpNbB1GZUZyU7wWpYUIcK9pAhkeRHvmAcYshKbO8pLszhCJbz2VODgFf0jzpzdn68z5h2RJJUO9KXvr4Zm5jwcuFogBhkabJT4hCpycPby6ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111803; c=relaxed/simple;
	bh=t2hQRdgGbYx74rKpJUZlmjpa6gqXMeuqZD2quztaKAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDJsd2I+EeKl5JQoFY+jhTXuieq5E1CtZsdFmtpHXYitkOCbYLYpeaEjr7pxOD1KUZwpBqBVph6jRrn/fG2dB0ALqIOY2b0rBUDjun1m5eCIfKLt+/XvYl6wxu9IYjedEltONTrgsEPs4aqqgqXhZUDlpj7VHIQkMlz4WPIEc2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOdozkCs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cyzh6IHV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EM1C110855
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3pKDvUPvCEfyOzyBACg8qvsQ
	G8+QAHKva07I6Clvx1U=; b=fOdozkCsPpQh5t5RBrEm6zb3eQaGxpubIx1Ub9gx
	Sa802PtMhverTqdavRdOL0wrV295Ugu3eizoHX6sRJK2jsrsNunZ8W3YoyvFMYvO
	fF9cTtI3TuNBo3USQxCkNcM6xMIMcAF+yPmX59C1YVoGckhqFFLEwDDtTvZZzCg4
	+U/H016huvazDheaZjRM3ww9IKP2IWcMK30J1S/V5ZHxo0amDbSC39JwlFaiGuki
	l5V+zSR2kaSVTdjs0VRK3HrpK9lXztVp33FI6/tqBx6JeF7uHThXmtkWRHvl7LaC
	2peBzzeVM+8hi634Zjl8lBDM3S3AkrDysg7xKQfmdiWdJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5ub0p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:03:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd722c1a69so1742867885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773111801; x=1773716601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3pKDvUPvCEfyOzyBACg8qvsQG8+QAHKva07I6Clvx1U=;
        b=Cyzh6IHV0m0txbEnqD4udjAjrODTe7/ZvXj7FQ4r0nUW/jSPThieamiDU1YZkJhKCM
         E+5WnyO3DKJIjqJkPuA4p2Ast1AB3oROfxwO90faopteulRdpldatR2M8yzpwUSMCpPp
         SJcIq7WfsXZgtiPsxxrXML6G8J2uzMfDvJuKeU2alw7OhbZPMMjzu1sQo9PmAGfBSaR0
         +/0KD7/PxNAWDHwlyISVgNmNryS3Ra6s2nlPbB+4C81KVFtht1/cGRWQAEuOMSIVhifg
         oOoJ2l7hu0qKrf6jjeLtXNsR8hgK5ldhoxG7z1M//tRdg7+Al4zhbkfL/uosit8POX+8
         HYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111801; x=1773716601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pKDvUPvCEfyOzyBACg8qvsQG8+QAHKva07I6Clvx1U=;
        b=kxemn8z9iFrtBXNdAyh2ASO3Hxw+ARqnhHL1orh6ZPSGA4fA8YvIr1A4X2hXJ7AQBx
         o3E+otPho//3ZO61udz6srdqK6S5IGvamGHtbNVHNvUCqaSkXawk55XvJ0g1hQ1NH5v4
         YSLqp9ISi3CuVh/3SmFV0KVw4XhGQpMLu73kgwh6F1kljoBpRfQD12IOlqpkXkcQcT7M
         +JRiv84/N+32wf3AccnoThfi1w+XQON11jy6QoOHLqVKW0UxtZgSk5yromf9ZZFJDiHP
         9cZFYhXFHnrMq9pYsbeHm4Ta73sx4wJI+zQz9GlKdLUclLkynPkzYGKXffKwElUEmy1c
         gQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUD4yRKtCsy+Y+6AHa2uL9RdtGyASucjq6hyDIu/HLrihVpKoqBuBqsamvl0JF+378ttzGueaoG4aWHLMM@vger.kernel.org
X-Gm-Message-State: AOJu0YxHiPeEus65j7GCqnJkuVmxd5sNj7AGyGab15eiDAoXvfcIhtEE
	GsmwCwZh9nj86LjmDq6jNrmMahQ2iT23vfc5J1uuF17883MWV3jbpJqiuVuU3Ib/+V8iwMbSxwu
	/K62PQessuEIud9cSCTo4uXNzvpxmA/Plv7klv7Tw8zyqPsTi9/pdXG/pxq2JCT0vJe+/
X-Gm-Gg: ATEYQzw/5f+dWSZ32GCppUKILs0o/fyE4Yo5GtNuCdUX0s6f4gDgAnWs0DEAoVfpOBF
	caC3NKw0+X8n3QJGK96exXkpdP0ZJN7w9R5oavUd3sPNFqcT/NdRgrHvUHJrYysVQ1uQr3+sMMH
	RQfz3Ve/8JHvXCHsb/8I5B/xfelP31hEmfUULWxk6BcgzQIGCKl2tk7/bwC+uQoCJcSeApCMbHL
	0b4G+Py6UxFKif2BjgLaXxbo6W7V878c+sXy4sbXr9yzNsEd7xnEy9aRoVKYMWtatDHdVDZsAsb
	35ftLt2BUJGqDoItYccNlBRWZKpkwr4/JKgjPLxSw1ElcCbSG5ALVCMWcmDGuZ5ClueBP4YJMZz
	eYplxCm9nc9PjsahJJ8lsV9nzAQq4g4p1l7c33xL/zyL764xtFazxl3vGlkIeC6ohMzh1U4ZMUZ
	BXMHb9NzmSvKaz/z2SRs+8BrDHk5juj0WRzvY=
X-Received: by 2002:a05:620a:29d5:b0:8cd:8569:b957 with SMTP id af79cd13be357-8cd8569bd6fmr794239385a.43.1773111800776;
        Mon, 09 Mar 2026 20:03:20 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:8569:b957 with SMTP id af79cd13be357-8cd8569bd6fmr794237585a.43.1773111800369;
        Mon, 09 Mar 2026 20:03:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08ce21sm2480729e87.82.2026.03.09.20.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:03:19 -0700 (PDT)
Date: Tue, 10 Mar 2026 05:03:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8250: Add inline crypto engine
Message-ID: <eg6nhsofxz3v2vh3crcbtivunszfuxkmirn5ckjxvuw3w53fkp@kesjd5jc52dd>
References: <20260309-sm8250-ice-v2-0-0c8c46ccc814@pm.me>
 <20260309-sm8250-ice-v2-2-0c8c46ccc814@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-sm8250-ice-v2-2-0c8c46ccc814@pm.me>
X-Proofpoint-GUID: j3Ra45ENxdJLuVCspkjAggC2SKZ2RHl6
X-Proofpoint-ORIG-GUID: j3Ra45ENxdJLuVCspkjAggC2SKZ2RHl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyMiBTYWx0ZWRfX87VPyynojv6z
 RXhS6KekbQvUzdtZpco8PJkBXFGll/7okLQhYYeMmR3tpQPxUdo7IV29RutOk1yDVdt6MUGNEc0
 PJ5cGy6lPb8H2ciWeXdUDwNG5axsnHzmUAhEaD22/EK6CGTsTGcjvHMRG1IO3mVtPJK4qimGaV3
 ZA0+CvRe0qJUnJ558xXAgTzEoOLjNWXJ55JXgBJzMEQPZE2ZnFj7p2qcfw/2Li7aYc2T5wItsoZ
 rSFrmsC9XEOUTfOSYwhQRv4KoxjhKN+bLNcRJDPrPkgdAxUS1sy/ic90AVzQZA7BAXbDSSx+HLL
 h/F3KghgecUX/XVdCFaDRQLQEvjoVfCYlOIukMx14n4b9cA+SrhoRusyxCkx+/uWtdT4i+4r2X/
 vaWAq4/zjyNpnyKehiab/0Wbr0pShWie4uI5/UWg4WMi/aq6FVU/EeG8m4S0SqAw/I2atG4RwBH
 0t4VvACMOBqOqd8dKNQ==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af89f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=F1DPrRZ4MOdNTT26lOgA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100022
X-Rspamd-Queue-Id: E34B1244938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96460-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,pm.me:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:50:35PM +0000, Alexander Koskovich wrote:
> Add the ICE found on sm8250 and link it to the UFS node.
> 
> qcom-ice 1d90000.crypto: Found QC Inline Crypto Engine (ICE) v3.1.81
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Please pick up reviews from v1

-- 
With best wishes
Dmitry

