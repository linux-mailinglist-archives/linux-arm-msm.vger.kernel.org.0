Return-Path: <linux-arm-msm+bounces-109011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF9qNm3bDmrmCgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:16:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0FF5A3184
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8021030E1E03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CFA38422D;
	Thu, 21 May 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BETFWuIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrlplDVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58186383332
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357531; cv=none; b=jnXBKYUBAsrDcq3G+OyRe8QpqrIv0aH8lwpCCDL0hrT1X/0b/IovPDs52QBevmf/lCFaXOgKqmKfa6pJMz4yQPFynA2VDlsCk9N+F3juNOFHYSGBZWzJoUPoswabJQFjsozFmSSwjP93JWGR+50ZwI5UJ8ZVQRduofMDsGk274Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357531; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5F0NZUgewWkXhVOc6l9RO2c/L0Xsv1BWaIbCfg4OOGD9X5tjT1cZ12gWLPZG6A+kpRM17jm7PK+pk5coC+nQoH8hWn1M+ga/3h8hqKR3DgQ2m3ozOFPXhKCQC/JYdsZfCB0CLJ9cT+aHWu1DJ9+VB3x10IclMi6Zg7/EVzQyHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BETFWuIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrlplDVC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AM741731237
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=BETFWuIfh7Tg1vvP
	0h9gY1AzbiFMcm15U1aDx/VwdST+SIpLM4S/4Qi7+ab9IJKCjRG/rExsOW6nKS4j
	R32ZRUUCpqtgz2zDiyW/EEqcOE1JTsPAUGkdGy/Vt4CuT2uPREy7cegZ4iCl8xJ2
	aBkLif/yuevSUDOWe+KKslMpGG/Y0UmztwXKsAjRGKsHmEYtmtta24bAT1UGKL1P
	pZ+mVFRirLEHTIcMIvgrm3mwAaFlnpA6DA4Kbm/QOSQLCZMvVVDEAG+es/8sXrI0
	e+odx/wvKAZA4Oahp0vS1efiwnrs5/A/5/rsNaps6zrU/4KRd9YdLK6kcwH3rqNK
	ZLToYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4t94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914ae409b05so347485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357529; x=1779962329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=VrlplDVCXmv6wEPfff15iz5aldt2ze/2b1wgCMI60BgTZMNlMKEfBaESQjRGD5FkQi
         dpCbJ29mSW6fJ34FC++k6O4S0KZwEZHzcFaOLSdo9Xy+9YhyCDvUI7vaVXHSyFEAS5EP
         d/RxgosNqEiAHWN9JqeBH1s2YGUMP9dZulM73Zfy7S6rbcdbz7fAKKI+Ho7GK0anpoY3
         dXYNyDt6WEfdlzqOQkY65/quCjhZWbfQY/fltrZOd01aP9jojPpkq2H0VhtqbqkrbgL5
         bFOkEcsNWVNZJ7d1M0L+fsXPEVp9P0aA0GOMnnzjM2KCXIPty+hRo0751mzXWQb6rBWX
         k9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357529; x=1779962329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=qzOVwm6jZTmGr/CvhQBi5Nrsd0ympfS6QNIq+dPZMokoo8tQTtTchjMMfRJ2fbYpNC
         PKVqV20hSQ4sa4AyfsPY6tqj656NXjc01Qk95rX9gQrm9wMu8DyixjAYleBuQr+ILfju
         qFnZ5EIQ/TR/Vzybt6xyioCiibawxc9EXxOMSTNdcacG0HoleThejDSgchCsJU62Zav0
         Rtgu4hQjTDg9z9yDMy8MeBo5XyZBBoYMD3HPEUFpGn2/uJIfqOPA+eO1Mwi2lT8HL0o0
         KioY3VLAPDHJyY5FjI1P5nerJfE1A9C5xG0nijudZ1O7w1zeSGxzdBIvmNTEaKI9rZ2C
         YTyA==
X-Gm-Message-State: AOJu0Yxg+MTCVBCBgZj6x2+O9r1jZYKcu8EXXlG37TqS1AgciBuUEJnF
	YM68T5DdJDFnvRZPPtaLgFwB4yCztwZ/3ScK7ZGq4ubeHyoMrS4CpJVcwcpoUqf2BveHuNaCXFn
	yyTEHW6V3k6cjtbRu83Y4fk2EbKnlQwbRJQUa9I2jcLS5RO43NraRSdFyDQ1OUmHmbRTX
X-Gm-Gg: Acq92OFgRXJLFrfIfOb9s5DB9zDbN+d+JG34xebJluxXlfFIiylH7Eubj/yHmQoLOle
	VB/HewbaN+E0Ogw2hXpib9YnXGcbNLOXilG0b936Zeukdy+PS7fn8qBDRePwwSfnL9W1N/XOULe
	V57ixKbhveXgY6hTHnHTGqkRyyZUVeF+9w4oHRE0jEOBBbsJB35q8BapJ15ziRvEEbpptHyVLtz
	GZUzAO8pa1/0/o+3QpT51OM9wFNenraaVwthCAFgA/e/RlO+dBPjDjJBcpH+j9AIcc9ugfosd6J
	I2stht0G6NPu1U2dzAY6NxJraImW+lOnakPYZLtI25XlYFt/+7OBJ5KDrJ9swTA46UM0wWIVzvN
	JK0uZ380QI5W1vW4yFdgwGqgxBKRmUNk3Z6yV1x+f4tAgATdmEthYOTtsANw3BS8krzeq8O/zw3
	Db8tQ=
X-Received: by 2002:a05:620a:28cc:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-914a2d23772mr170015685a.5.1779357528874;
        Thu, 21 May 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-914a2d23772mr170013985a.5.1779357528500;
        Thu, 21 May 2026 02:58:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm9007743a12.31.2026.05.21.02.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:46 -0700 (PDT)
Message-ID: <3cf31aef-5fba-40f4-872b-9c4814074421@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8650: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-5-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-5-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ed759 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: WADxMDijGtwjMI9uph1Th-ZZtrGtLG4v
X-Proofpoint-ORIG-GUID: WADxMDijGtwjMI9uph1Th-ZZtrGtLG4v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfXzfcpyDP1r723
 Z3Mer9uBxFJZTu2zrShqVqMF2HBU5GSdVFtQExkMLZzkIAjULwx5izWbNT5htmSsmKDoZKPXuJy
 E9ekrs1Nwoy0PiHRXZoc8dESkFW2eJXn9d+Ljd/Xj6Q3fjSJeoy5Kv10jX798/wrcX/om6yNoLa
 QsPU8vZZfAorH8tkJYKHHXh2pIaeYQfMtG6Wj06DDjREwKu/xBLlVnCLqGLETfq/yUx3hvNHN6d
 FJenpEAB9RC+JQaxxSxsZrbPeKmzswa7TlrvF4S1FICyRxJwwP8qj94w9hHVbauG8PW4bIbiLUt
 bHEgJ4DFIUtqbBK+UT5cYfRVCCoAdymoxVukWGovqRYa8gXLg9NQ2XHo4j/OXuwDWyB6YQZaH87
 47wJfbumGVQh52jJmFB1Nhxg12lx9pLlGSVRBChh5YPHtfRcqaIL0LLPlPAs8bf7L6ZD8VdZ29r
 zhFJk7AnUr30ECyCVjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109011-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB0FF5A3184
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

