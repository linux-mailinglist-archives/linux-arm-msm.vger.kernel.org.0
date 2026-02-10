Return-Path: <linux-arm-msm+bounces-92501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ExbOgcli2mTQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:31:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA111AD9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8702300DCEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01AB2BCFB;
	Tue, 10 Feb 2026 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcssv0iU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kz8CNtcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44A8EEBB
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726659; cv=none; b=YaauGJoc6UZdFNlk7nxgaqt/Atmnqaq0VwyAjz/t/fn/DZSlio4FjBkbsz0szcIKA49cDvLzkvHkXd3Z0ougaBRH1OurhTTxbpMNw0pX4F4z2zLpdX3SGg7C1qKwew2ykvZExZlm+01qorR6sdS8tS235/l+q3E5vfWclyON+f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726659; c=relaxed/simple;
	bh=lg+yclFuzxE5QOUV3TCxMaCrAfCGTTotlyxf3OLKseo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwerRSb//dLRhdtkkNLcphjt75pqrar96/QYFU+tnEQZzDWAn8dn+o0I72L8sQH+OPT4/haqyDCcf5/RWT9tjPMW3vf3MgmrtdHB6ZBZGSRrEhTz+vhoEJ+FFBf/aIJJQSbNtl0zmWyieweL1vUcYtSVJEDX9A73HXMqVF7Xsk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcssv0iU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kz8CNtcr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A776H01151832
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WgGxsAH798d0Fb4vc7N1MNqK
	Gzn8wg9LUKFRfpuVCNg=; b=bcssv0iULIuA2jNIhz65RL8DrM3Zf1ebcwFTYheT
	B9EizwIWiNGuS+qs+I9KcdMxLD+wsGdxrYuaTC4SjXpT17A8+ELZFQUKdXONNOGu
	JpAc2fLqgU/l6homh6cj/hWYs0qEZ4P31+yraenl9NaBF9la5HFLeeyFbsQQE3c3
	K8OfX72nbStPuSrYbmmvMIzs0/vjOlQ0zPPLqH8/pI2NyPhIdRrOSAYmOEEJBa0s
	WA53K4nCq9++TTmyiWWwtnCPRgKNm4s2Ddzhzz0k8G6aTzSfsY41cZJVw4FEwDUW
	z3cDgZiI97UGUBMbg4u0sTIsFI9Obtt9l0PVS+wzF3svHA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j91jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:30:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5eea68151f3so2989633137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726657; x=1771331457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WgGxsAH798d0Fb4vc7N1MNqKGzn8wg9LUKFRfpuVCNg=;
        b=Kz8CNtcrUJwAm+Pj6FxZfdOEZoIl34TlceJJRnWVJm3tw6LKs9v5OjCJFn2C2SFKgY
         xuECU7VRLQ4lFmmyWjTYjxsJLbjl82hQSsarLsFqjeh/qSX/7MQrAi29EZm0gMNKa8Pb
         4WTE5cRTtnGJHucDfiK6idmGkYZSICUzolDQXhls1AuMjejbT1yuhYCIhJIckNQjJSdK
         b/4gYdots6DIbWnAD56K+SV4e2wRkzstU968aze+mgXWE4dqgzwK7tjJLYrohMrO3Kao
         1sj3/dB9gKldIJt33vOs8QIG2/119GG/Qu3lL/HJHGEupcf3Tl8TdNpk2gqyhQDl74Ml
         W1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726657; x=1771331457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgGxsAH798d0Fb4vc7N1MNqKGzn8wg9LUKFRfpuVCNg=;
        b=sdFNZ/IywRVdA5jH7dak/UiuFMHvPtvM5T7XmUulojSK4g5cgDEehPEa31CWfRLXTl
         5Z5/IEtiGFEi0k3bRoA2CDBL8Sjye/uP7NSw8hEfM87Yw9svOCLbHkVv9/X/vurwP1Ef
         dsoXvlGyNEJfaAfVnRy76wSyh1iGcXWeyQBBg21ZhP/4uSZzTfLzi0EMleSlThpfAdSM
         5zy2I0FeVa7vtFg34jBSm2KYdXZCtbQ6sTxC5+fdbWKveyN/D2FMwGjvY9Ad47o6IhVP
         LUkg1qR/XLcBRlgHCUv7l9Tu5/l/r792cfmJBpLjJ1/yt+e7l87j5J8y/z5fz02JpipO
         wIzw==
X-Forwarded-Encrypted: i=1; AJvYcCUfTYC7hWt9Tdl3dpR2ogeVS7K62iFcjyRCSYS5CIgcqxFxP47MQcAJhqb5cwDEIRIQ/jBRRJlvBqSGEJGl@vger.kernel.org
X-Gm-Message-State: AOJu0Yywkv2mO8u9OBdTpdoHa16aTaqL47lb/oMnRC8gmAMZZcPVxr2Q
	pBJRCd0D1N/UthaCQvD/88J9ZDIP3Gc1uTQiHKAsSHQcwrDxpzMVhsEQF6Ln2u/5HekIP8PCA40
	oN+iLgeL+7WbNhiMS4pDo3vDuMqpa6dEPkZCiGdjrdK7bom5WMfDI/wEMTGbPnOs4m/TH
X-Gm-Gg: AZuq6aImWK/Cx0mtbaPNBqbGrYpIUvL2pihFvye1Ivjp8sEgomkN6LDVK7VZpnGz6/V
	l6EYz4Xuk9lo5TTfnFdqw8RvRe6UdirFO9OyEOrhtXsTPl7ZTMDYaRaUEi5kgo2Hxm4QUxKfaFB
	8VEQ9NAw7CFhmuoSNpmrIqmpBf7OnW9HYGNDTErWfSUG9BiJ4630oW57JNAVk0l+kFI1bvfgF94
	amc3SkudBK190mM+JV40utr2purd6dRnx43K+N6rMLBVDr9DLVerxgT01sLIhDyLWdEHdgNPna0
	DyAY30i9bf0aUnT8XkB2OqoKWA27J1xn62vyhQ4AElmpbU+Mztx7HZWWmG4CWIA4mlUDc78qH4E
	HbyVV/PzFSp4BogZ55PsWdJlABRSg3Bu4XafWHVSzZ/crLhVKd9AZdaBRb7dmYohG3XYva6ik30
	Ac6pmPqebXbfLVKwOuXzYdR4N+hldSXMMsgAY=
X-Received: by 2002:a05:6102:4414:b0:5ec:f42c:79e4 with SMTP id ada2fe7eead31-5fae8a2c635mr3797000137.12.1770726656690;
        Tue, 10 Feb 2026 04:30:56 -0800 (PST)
X-Received: by 2002:a05:6102:4414:b0:5ec:f42c:79e4 with SMTP id ada2fe7eead31-5fae8a2c635mr3796987137.12.1770726655878;
        Tue, 10 Feb 2026 04:30:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5a1418aasm20808e87.64.2026.02.10.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:30:55 -0800 (PST)
Date: Tue, 10 Feb 2026 14:30:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
Message-ID: <fslxl2dios4zbfchm5egnwrspqszip5teyp65rbihdbriyodtt@q4mbsmdhnxve>
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfX1/SJeHwvNEWN
 e3HOBOGlKI64R0NhZ4S0COwEp4Dozl4UfYVUmcewLFd72rIwudbsXnBNXhIhsufB91Gzce59KX+
 RtMM6xY1/pSU+KpCeW+s8/eSpJyarVRttgJUbCZZF5ZIZIslMDBYdHSV8uDKLuygcyhWFOUTHSg
 B+3hbj8Tb9fTLynJCCqykMSIVa9EI/k2XIQfyEW1GRs6Va7Vs+1KogKgXDuFjuRTXaeVubtP2qm
 Ivd8gX0Wccu2QMsIpkvhhzqQ2rM2gFCpCQVF0YSCV1CFvBPmxMSs+xl3jco0QfXvKUS1RqiChiZ
 RB/Gv1mqUI2VFeWTEUnn+H6a27BJ/TsC6M+X36ST/2sZvvBi7sb5hA2zZfMqXytjcb2rn8EUWSm
 OzzfsQb+KToS2XNLhsBuv2fvJN4O798I5PAiDxrJB/JLKb3pVNR5ftXMFIUssel2LV6vhL7eoNS
 DxhwzaAVHeLLuaC6zFw==
X-Proofpoint-GUID: ZQ62zXXUea3s3hAwUM9nuudL3QEQqMoj
X-Proofpoint-ORIG-GUID: ZQ62zXXUea3s3hAwUM9nuudL3QEQqMoj
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698b2501 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=l294Hz_FD5paY8OFZukA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92501-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90CA111AD9B
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:08:21PM +0530, Umang Chheda wrote:
> The Mezzanine is an hardware expansion add-on board designed
> to be stacked on top of Monaco EVK.
> 
> It has following peripherals :
> 
> - 4x Type A USB ports in host mode.
> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>    - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
>    - 2nd DSP connects M.2 B-key connector for connecting cellular
>      modems.

I hope to see these being described as soon as M.2 bindings land.

>    - 3rd DSP with support for Dual Ethernet ports.
> - EEPROM.
> - LVDS Display.
> - 2*mini DP.
> 
> Add support for following peripherals :
> - TC9563 PCIe Switch.
> - EEPROM.
> 
> Written with inputs from :
>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../boot/dts/qcom/monaco-evk-mezzanine.dtso   | 189 ++++++++++++++++++
>  2 files changed, 193 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

