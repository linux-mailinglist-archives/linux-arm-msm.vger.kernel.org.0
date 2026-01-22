Return-Path: <linux-arm-msm+bounces-90222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJoQKX5AcmnpfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:21:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3068A2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 16:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A8DD4E7722
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38CA315D5A;
	Thu, 22 Jan 2026 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcR2YXG8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBO8liV5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DC2345743
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093609; cv=none; b=QFGHOxlFSMgV9gZ9Pp79ggmBWYIxrPzt7TBOJ1vxnn6vl4HWX4raa9YgdRntjND6Guk0LgUe/FZF0VVpyQ7Hlhjud6M6KKqGZ0WUJtMJX1Hym3eO3q7EVuaHcFXe11OWe98Ru0q+tSKqid+fxlQdYlBz2BZyTwjZEn1RzfE8gHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093609; c=relaxed/simple;
	bh=L9T8UXH1NYSvIwtzU+qeqQBwpQMGhgfJGZjMj9x2vAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVJTN7SVgHr81DClur/UY4qEmS+RhgF2OUUdFNQ3CManzrjkLoQw388QtqjcYoSFRHYFhxJmwUdYw58WUP5a2lumIPqZ0pYD7WUXAVPyN/V62Uw82pGv7uxyHN8n8j4hUfoQ0It4EwkczvY8i3Ss2xbVf8lcehp7OikEyV/FEUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcR2YXG8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBO8liV5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MAlmnW2915326
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxtDo5SgwuWHnRwxfuO2BKsV2aCWWPlFFHbTYu0ds58=; b=EcR2YXG8A8ju+AHA
	nDmwaaZPWNRPytohkICtbztnbWmoymmHVrBxlCbfGJLuq1dsMhyphsVWi+Z8myZm
	14HI64CfOrCR9K/g//GVkjyu4BV8zdtR//2fTXNodux9oW2vMhtNIilAoONV3BtL
	h4Ba7MWHEyexMiUoYn+VzKXSQSL7jHM2tD6FQkWG76/Sii1WMYK8PaCmtxs6poLs
	5BLYUbTWRleFrP0FMfhUpYLU1xF31PxsL2noPhNlInj7+Tj8RVv6qBJx410Z+P+3
	kJlLDTlUdqoiNfwc/vZ39KnVnfWJT26U1rRwOBqKFP8J/4uoasZdvI1kBjy7gfv2
	m6aHcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujf2gpq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 14:53:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5265d479dso29479685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 06:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769093606; x=1769698406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxtDo5SgwuWHnRwxfuO2BKsV2aCWWPlFFHbTYu0ds58=;
        b=BBO8liV55T8ZIiKhWcCCX/Zi+6dl3NmnnBlRhik2YGWwNSY0wPBO3IQ8pyIXLnDweN
         /M7I1M+Tq1hckCc4cvlLwhLQ0fOipuqSltFM4IOLV3oQULtCyZgF34H6CgSRXf7sh0TG
         S3iXJWuVsSXR13Jm3dH+s5dWVvk9/7C5xuq6LWT2c6Is1Uw1hKYo0Z9LHfQkX/thxm7L
         HKvgznaGSejSq7YZx+HmrplhhmY8+7D9FFO/jqHVyOZ1oPjyywGWALzgvYcm+YiNY0Kc
         gtm4KkD50G9f8iGssvLUd/WHmOms8qS+fNubfXQSX0LSidxi2ih76xEVoJlte9Q1akoc
         ze+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093606; x=1769698406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxtDo5SgwuWHnRwxfuO2BKsV2aCWWPlFFHbTYu0ds58=;
        b=QModSpbZ2I2yiqsDG2QxHzU51s2154DwlQvj5se3by0RJnlWJq59LhVTS2p1qFOhaV
         j5nEDEdBRi49JUwvGKj/0T+mdm9FjYfqabhOKGqmI3dLiPqJv+TT26H5ccFOZiTbdBjs
         +lMejZeQYjtZim4P1syj/YOD3SkA1FOPEQcysM7ZiHlpLIkkETHpbTRDvZbK9T/koLkt
         8EL/Ia+nDfAe9JEOebplbosOzXGU7JJXAaR7bh6R+XHxq1mKhS2E39VhvE1PQfWnx9t0
         R8lDbBLUOacMqg5Mqf/0LVT9W9kXskJJ9gWTB6SleY96ypGw9dIJfoG13IjPDkfJTc/T
         2eXQ==
X-Gm-Message-State: AOJu0YwLoYl0Vv88wwG7T6O9seZUIwFLUXczbVFYDuMaQeyhPfZqQVmI
	NwO3dSQuNbwtHHJopg0dRVSL+3KRlF+bujWeguFmUZQUbuWo0gsIGT9jZGCeNncT0l5kdSpPmKU
	w/sIK91Xta0Ax9pCN8OlgSIQdptsZmf5lGGctIWHusdb0hfaAM5IWkkcDmLHBLOz/pw6I
X-Gm-Gg: AZuq6aITteZutFxxS+AqHS6VCldWT5z0+nExfKU9tKTdEBdTojCgXhNJB9V0ejqD6oM
	v5z/ouo0PQ5hBm88GZPNlENQgt354iJLmCSkLHTFzXRkKiI7CkG8gV6liA2Dm/qTe4xAaymnPLc
	/TyI+/JiX2y5FyxQiycNNe5UksE9NtbU6xeCBJSxcitLl0SHsZAfbar9RrEuP8xqt45I3wAllmF
	EGZA0spq2ZRpbPjPpAwUOz3FZz7ZGBh2ps66O2krX3d5Li4ki/T8zMsq+lF1zpubsdVSlONC+RF
	zyMIrfhk+RdlWhQ9/rGeUAVBKWzQiPS5NU432EP9XVcrKmAW5d9eJ2Sr1eC3LWu0EVHhuQGPB83
	XH5hgxfN9tFH5YMaSRco1CENk41dBBHwFHFxqim6oKa2ggqWoWtZqC1GcPUv17Iaj1sQ=
X-Received: by 2002:a05:620a:44c1:b0:85a:8fc6:5c28 with SMTP id af79cd13be357-8c6a6797f81mr2197654885a.6.1769093606082;
        Thu, 22 Jan 2026 06:53:26 -0800 (PST)
X-Received: by 2002:a05:620a:44c1:b0:85a:8fc6:5c28 with SMTP id af79cd13be357-8c6a6797f81mr2197651685a.6.1769093605441;
        Thu, 22 Jan 2026 06:53:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e8d1sm1757410966b.2.2026.01.22.06.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:53:24 -0800 (PST)
Message-ID: <de5b23e3-81b9-48ae-81ca-508a36626b91@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 15:53:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] phy: qcom: qmp-usb-legacy: Prevent unnecessary PM
 runtime suspend at boot
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, vkoul@kernel.org,
        kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-6-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121142827.2583-6-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GLfYMr4ggxwIjJbTr8P4k1EaxDXqVR_f
X-Authority-Analysis: v=2.4 cv=fdCgCkQF c=1 sm=1 tr=0 ts=697239e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExMyBTYWx0ZWRfX6EV7lCF9IgF7
 XA5lgX13Dv//V3rehMHZib343WkoPuRvq+wD661GIbgoQdIvgtfyNZC/yugTG8CHZG//weh74m3
 CHOkV9aKCd4FnpaMLOcgbuIRG8VvpKj/2r74BWa11vpLnyPaXd4VFH8ESr8DMU5beueE7Anxg0U
 QM4nQkkN7oUEhtoVzBuhg1vTjtX/ZYzC+o3oZnk3ig2lqBYWvPFGLs/d/2sQiYZBPw4P7nROaI7
 rTK1TF++gSy8mu5wGYaCa8Hhf/tDbIGWeSf/dedHgoA6vy8wr50uPL5foIyQC1bK/pIN4YtLfe+
 DXwYFaDYp2/+q+nIFQpPnqZJRmunRwtaZS+gTvb8/uA6v2FnLNLcaQ7YToyqE8KYCRds8E3AkR2
 +zTWGticTWYmgm78sxJlhAnozpS+Jgvd/35n7Fh2FS+OXea03wmWu9vcrnREH2ODXGimV979vp1
 /fgKBIK2N6NYPVGRiNg==
X-Proofpoint-GUID: GLfYMr4ggxwIjJbTr8P4k1EaxDXqVR_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90222-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16E3068A2D
X-Rspamd-Action: no action

On 1/21/26 3:28 PM, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


