Return-Path: <linux-arm-msm+bounces-92439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABgwISD2imkePAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:10:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E5A11898D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A045230078A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65C133F383;
	Tue, 10 Feb 2026 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+iJpxFx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4nfpybf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB533F37F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714653; cv=none; b=unzXTOMlOKNuhb6NJ2nCn1xPrPR8NQG+6ECe0W27XgqAFfUXfOsHJ0VhuO96W9nx+mF5pt+DwSKA8C/be7O7E+eZPt4HzynpeN5GpSyyhLeZBhm50pQGSa9mbhMnmRb+zfnmHHrz69ffwbAHDWDqFBtDv3d+Av44+z3iXO/FbcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714653; c=relaxed/simple;
	bh=XK66Jj0ro33gPZNkCb3QlDScSpwkfpiEC9ZAdx8O7og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GD9uUpwbLq5p+wGQM+UWJSlIrgEzPkvJomfQ2p6dSrKFc6rRmwXnTo9MJbI0xiVEgbVjTnhDt+0sZzEut3NZ5aM2tiarjCn9yxoOwhNSuIISAFh33yaNTUWxHurqlYtLnNHSHL3EKxIfI4sBLNJ9Bbpl6vR2SIQYG8jw5hkDc8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+iJpxFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4nfpybf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3R7G81172336
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XK66Jj0ro33gPZNkCb3QlDScSpwkfpiEC9ZAdx8O7og=; b=m+iJpxFxnpPUI5O8
	nQHwBNRU9x0QJe2x17chgULjpaA5chcyvWbXWb0LOy58bubsFBIAaNDZINojYlCN
	EQn3fgE2/8fDxmmmFQoCwolBjJpifW/ztlt88RNmYM6UBVFZpPo+L+7yYzR5arXx
	TNOq6wRXgYouYHjOiuXZJtaixUNalJQdeQh4eXPhQJUX5UvgDGCY+lzkLMSq9LTh
	YhtD0wtRljqc2x7hcR58B5w3jSzwi9Eodxfoxzn7EKWbE2COL/oadeOIEsiwrNV+
	eFGx0P+hs+vqbIHvCkFOo3nxAXRwH59yT+H0oLjGPko/3omouNEVQaneOcZ/yAQ9
	77IvaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7kfttw17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:10:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53892a195so102558585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770714651; x=1771319451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XK66Jj0ro33gPZNkCb3QlDScSpwkfpiEC9ZAdx8O7og=;
        b=c4nfpybf/aJUuiktiUnyN6S0UtSjiVX4qxZMBi+wTsmudoo9cwd9jXsagTP1rYnGVO
         DNIEaVxuH9urxu+WKKsJQeZ7H3jA7zOmlVOnfGH4PbqHOJUzFHpx62yhenCrO9FMJpLn
         fOTZZ90uxWsmhUUB9naPmD9fIkoInQrxdjH9Ki731CEfEbMaDBC1vRj2AbIvYbAyICqD
         R21jTXfUliSq5x6G2idIEcFok9gA+8Lplfe+lUlOTUGRqOOuAGdUjlYCF+yhFeQEm6/4
         ZcToHWkQwq+56uC6rL4/7nVrj4ZPJ0oYUplY9D7yF9L1skQZ1Z0ASLJGNugh25ae2CaN
         RFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714651; x=1771319451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK66Jj0ro33gPZNkCb3QlDScSpwkfpiEC9ZAdx8O7og=;
        b=c4ct/aUCsBPCTf/W8fs+K6PEXkVH2HQKJwem7UJXHBzihxvtc4kPv9m4etWiVqa8VQ
         j9HDPI+T9lF78UDdQ8tvVu3ZI/uUQy0K++StAHr1rjn+ZiXJOcMRPpj/Iu35k6bHclki
         vvdphBO2CuhsMwLRVxwfZrFY6erWkFLTVaJ0WLfu87OXfFX4fruzbdEAk20WN8Yndhpn
         Pi4IrM6ZTNRtF+cjMvSZsAviwQutKRkBoWZnfvUg6RWjxIptRobuklmh+x9Yd0aIghIM
         yc+OhkKWg2Fz6ol/oG6YoE50suLM78TorUy4DORTDkoqBtlef8QbOxwYgsrnJivWe8Nz
         z45g==
X-Forwarded-Encrypted: i=1; AJvYcCXgPyM2qb3OPvYGhK817pjHibri1AhHgcm3e7BNJzKlZOIF3RpuQwu0W4wGlwlmYw/FKv25WYUv9A0V476e@vger.kernel.org
X-Gm-Message-State: AOJu0YwE1bKHWydALQzWJG5wXJLA+14SF3BGoZGVtnE0KTP5Mdn4LTqD
	4OBdz46+U5BhOXcU+9AGxLlRVflaG7LtpN2IIsahn6Pk9U4hUAzBHcxncaiMESI6If8PcugDZ1K
	WIfZiJS5WW46Adcp4hFqqSm7Fi4MEUwOEebryOaoedsyt5akPLfq0Xv4CAEIWORGPeCjK
X-Gm-Gg: AZuq6aLTrVdMO5ljKDfVmI3SEei/saf7m1p4bIvSYEoyk6PdD5mWfKZ1EbMKO0Ta5dJ
	8khdBkG0iJRkul0adlCtEMJD2oYp1b7mcCCpIkdoJRm9MJH34sh6zydZowdAIaPgDomES3GsouE
	uN+AK9E1nhoHpfOC29tYImXUB/mJuP7o/oHw/kJaL5TZk2/vLbz8bNsbqW1L6MTJsRrQqmfAm/6
	h8Lp0VsV8Z9ARDPl6TIRWmD3wBndOt8AsNtDIDOtsDCzOAYmkU5PevhZhMWDyO/u9scI6AQH6Og
	rPgGCublQk2NPN3HosqRK8uTI95H7F+xIibHTKbZiHW+IF59JG6vIk915NG5OVDkIpg8vnYQmwh
	H7BB+9HNH41k4ovEp1cxJGjJ5NpnmyreeLlCAZutFaVNG8VTH6XKGCixcVtTgkm0TMlT0CrRqL7
	t6NdE=
X-Received: by 2002:a05:620a:450f:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb1ff48dcfmr99979785a.7.1770714650868;
        Tue, 10 Feb 2026 01:10:50 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb1ff48dcfmr99976385a.7.1770714650433;
        Tue, 10 Feb 2026 01:10:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ed6fd27f3sm498845666b.0.2026.02.10.01.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:10:49 -0800 (PST)
Message-ID: <037d0771-a802-4ca4-86be-5b032635395a@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:10:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add support for pixel 3a xl with
 the tianma panel
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-7-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210023300.15785-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3NiBTYWx0ZWRfXxBcPum36HL76
 A+pMHVn5qKbL8PYpYumw3i67z2zPssE2CcpcnJAvsCDFbP2OsHsvQyPXd+yyJn7ZE7AfkZvluMq
 35ykARWbluGyXBzm1lNARlnzmb6a7M6vcjvuN9xsrCPTzM5st6qptijdar4/qKke8Sa/4Qw1Zjz
 Bb3gXYhC3fI7tyHE5mlOgFRBZJIQrWcrziK/Fjg/9rywAf4PBt4kv+kNm5DlDdNXkTx49tdRnUR
 /DZsogUE86kZj3kDy/nYp46fRIO/y/O5Zh4iDtdXrcAEI6MeW1FS15lhB3YqEDcZn1QohfKSBCk
 +Igo1vXBFxC3aUsE1jLey2iGQYY5MFFwpl5J8RkggeqNUivZRjnSqufn3Lcq0xN+2RXdq1mNn0P
 ZuVZXEslEs46VEDx/WWZaHYA5VA6Sv+pDz4POeffWPEgUPlwFwxHyDbpxrswBned7skoxAeC1kM
 2AJA83Li/ccK0n+YKdw==
X-Proofpoint-ORIG-GUID: CjDr-mZ_ecLtwj0LIl-2LeSQdVGDusqj
X-Authority-Analysis: v=2.4 cv=XfuEDY55 c=1 sm=1 tr=0 ts=698af61b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=nkUbddICNmq_qF48:21 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=5zTHlj9xAhvqCqyxulwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CjDr-mZ_ecLtwj0LIl-2LeSQdVGDusqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92439-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33E5A11898D
X-Rspamd-Action: no action

On 2/10/26 3:33 AM, Richard Acayan wrote:
> Some Pixel 3a XL devices have a Tianma panel. Add the separate device
> tree for this to support these other devices.

There's not a device upstream for any kind of Pixel 3a XL - should
we anticipate a non-Tianma-panel one too (i.e. are you sure those
are out in the wild)?

Konrad

