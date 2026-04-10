Return-Path: <linux-arm-msm+bounces-102621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAFzKg6/2GlVhggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:12:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 310EB3D4921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85862302EAA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E393BE155;
	Fri, 10 Apr 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWFSWQBm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MoylOX6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197253B7B8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812213; cv=none; b=gIkpFeC2mE6CFyj+4cveTOvyGbXak7A2GlNWuTV3TVXMowy1Ofgq3NPsfvkGvyI0f5+Z8lCiDrmUqr9vNBTdT8sm5XVREjrKfZoKPlg/xGoQyBRgYZ7pEMBTdPCMr9ZnqxCzgJQ9Wc65Mzhe2Gm5u3K8yAHpwbfJDZxjCr7yEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812213; c=relaxed/simple;
	bh=Psrx61TUoFgd0gK5ncauwyTvJElY2zDRp4L1h5J7AC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+w/TTO/UehYUmlz93gksdgvfH9SzjVjayrR4rXwFv7jX7Oo/hOuM51UEmJIEK/p00hsFSJKHCRwegtvKS10aYfc+rWR44Na9bDs4ZtZ4O/lIKwjNLmUJ9ZrJgekcOzmtP4X9auk/t+NqqY+1CB4v28c/g6BP4f5I0CvsvD8Zmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWFSWQBm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MoylOX6o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A3qPue3352647
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HeWJDpf/jEaq2H5kJP7cmjMlP6y7JiR8ICEcd/aRfBE=; b=eWFSWQBm93WyXfY4
	ccUZcQ5dKsfD9bYgHnlWbJF0WldIeb6QPRy78Zsr3qXszpIBlj445mWU3nMm7YSF
	2a5ZDAAYUEX9XYhk+zxBNzZdNJMKFt8qu/zPpzckW8WbHGLFo8K8+30/0/wR+KGC
	ao7xnUWMthbqILbiYgJiD6VP/szTehQ4HWoXn3s6A4V+EyOjhn7wVjC81oeYLQH3
	FPWymrqUx/jqUjhM+HVytCCK56C6uAU9QHrYwVkNl6oz7BhEbQFqYL+ony64rB2a
	d3zgfhUw8BXNYXKhMX4aco2UJJfSIhWIzyB4oNgGU/SeTtzHFSFmk494eOoVbahi
	YRFaMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qus9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:10:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d56ae62e86so45471785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775812210; x=1776417010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeWJDpf/jEaq2H5kJP7cmjMlP6y7JiR8ICEcd/aRfBE=;
        b=MoylOX6orpQ11karBH5444zNIOjXijhFMj3t02EpImONK/uXhYpaMYrviYqBTtokto
         O+4E+gRxYQ47zv4BilSgo0mpMCH0oo1EMQwaCL1JjthTgQh+kscOddl9qsQIoLs6waIK
         AIVJ8horZtnsYAUJksqzXTexAhGIzsmpfrhfIyliDSuxmZpkzlYPBPDmUwoS+IQgZ1p+
         u2YGFk0kPBzvDmetQwoaoglKPWg1J/j1rrfd0mcoM4yHoU+9+3hPX+X7sONVAPV3k17B
         KB7p3aBroRkxZxHjcsDvEs53NoWiowZDMvamDJvix7Wu+EWS4ByNfky552c2BN5pHw+M
         h5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775812210; x=1776417010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeWJDpf/jEaq2H5kJP7cmjMlP6y7JiR8ICEcd/aRfBE=;
        b=PnSjBzDbcpSJMDqQbdxU0RSYyaBfCEfnpwOoukj2Iu47q/xOWMTe6sNlqQVXai9Z99
         k7HFXnz3olb9oBQcSf6a/MnSpzeCigt+ddAAEZIYabmWdhnk4RAvD09DCKjsEnyksJZp
         COz+abPewlJtYtdO5FNWq8JadmksH42qSxNo4H1y3DK591WAjGepltaixKyLgwXwhjeY
         1f0XrZj/QQbjVTtNsLRsihN6ACsFK5ijiaIFvJPZYFSv2VQVu2iisQvOifdZYs3s4Ny7
         5uOcHY0/Qw2Q4B4V2Z7MmXH2Xua6QY1ltZXAe5JwynfJvAu+zVGaVtySlXrpc6MmxDfB
         td/w==
X-Gm-Message-State: AOJu0Yw5ZgDEL0GlonD9+Zl5pWr8Atb0OwkT4oaWvkTBZdojn5BnSGBo
	whcVaxmQwJnFrDVDC1gdRE7zLseUoXnhmIX8YgnoBARqeqgKHcb5CIi5xw8+memJOmAq8nVfvdA
	1/vujNFQTCBDohManSwnReEU/NwWEZK2DjoDUiX8zz7GdR0Fg00kfpZgARcSerIDOJvMp
X-Gm-Gg: AeBDievawrw50pR6QMVpiUN+/r0h8gw2ITdq/OdBQdMldJbfGYLK8PydkDj8aH7Yvkt
	ZK/2ORmTVMxHwk2cZxuwAbqg49xWTdq09Saix8PRQHVIciOIw/MpibAJgFunYBXcIj6W8oWdqUf
	CpNk2h05hIoZ7ieMKVGcMjlUF5aFdmreoqzHKWt/9ePO6dGFJOgsgDPQbJC7bK4d4XDpFIsS5hf
	6sKnwjqlQ9A7KYFoFAXjQ/SbJ2fC/004GhmDSEug9I6CLvFvZoB1UkNHs9U4uJP19uc9uwf+IWr
	Ras5a+F8kwTO3xv7afAsVTKa8Pkg/zodmUAgKMvZCOF8CUp4fUhfwmQMBQlqQ1fmdtPZhASgXvC
	sJ9qfc/Vj1jFvPNvPtEweveD+J791Bt7m+pkew4CmrkKuS8JMAomk8CzgIX9C2gjlbtRZ1V675d
	cmrkc=
X-Received: by 2002:a05:620a:2902:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8ddcf4b4dd5mr213325185a.4.1775812210203;
        Fri, 10 Apr 2026 02:10:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2902:b0:8d5:ddc3:a3ab with SMTP id af79cd13be357-8ddcf4b4dd5mr213323185a.4.1775812209813;
        Fri, 10 Apr 2026 02:10:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706251f0sm419733a12.15.2026.04.10.02.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:10:08 -0700 (PDT)
Message-ID: <35a4c379-0477-475a-b6a9-132e02c9583b@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: soc: qcom: smem: Switch partitions to xarray
To: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        Tony Truong <tony.truong@oss.qualcomm.com>
References: <20260410-smem-v1-1-8e94bb5416a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-smem-v1-1-8e94bb5416a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MSBTYWx0ZWRfX3Vza0jXv7RuT
 oaJM2StFUeR+ns3B2458JaycG/XviNmOwRql9y91FwREx+R5O78Fjstj/QZF2Hx+dBrJAPBS7D4
 uCYzGQBpqv5pNeiw1pdfqam2O/aFaUmEuDTKar2O6kJWX7fyV4Bl+iWgHm+hWXtssWnJu7TrFno
 Y0s5e47nktC35TotyYkh5DJFH1IZ3fRKoL4frrLobrx8TiAhAqB4ejVEs85P/rMT4tVupsdnTnP
 vFeccjBdnrvIAypkvQk68e38rVt2j8o7suuevhKEyQ3QtmT+76TQ9QFTv5D3HAH3xkSSF7kaQvn
 nTZ718bu2FBzRRuod6eisczfmy+sXsnNN3IyGzBDDuWIn9kEyrPfXCBLuT2nX4Iioq9yJUhbiOR
 wgYTL5kuLgSnWq9kYgdI3POWlcVDKYXVYmGbJOPZ+XQH5NWXJbY89H269IKn/pDXRjP6a7qbBVR
 aA7SZwY4ITFeT7hgtww==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8be72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UXCI7_oW_s4cHWwpH7UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8YmOBf1EDnPn3s4YWfXCB-nrvF0ROalC
X-Proofpoint-ORIG-GUID: 8YmOBf1EDnPn3s4YWfXCB-nrvF0ROalC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102621-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 310EB3D4921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 7:32 AM, Pranav Mahesh Phansalkar wrote:
> From: Tony Truong <tony.truong@oss.qualcomm.com>
> 
> The partitions array is currently statically sized and uses the remote
> host ID as an index.
> 
> Future protocol improvements to allow for more than two hosts in a
> partition will require hostIDs to be bitwise significant integers.
> This will result in large, sparse host IDs that generally exceed the
> current static limit.
> 
> Switch to using xarray to efficiently handle these sparse indices and
> allow for dynamic growth.
> 
> Signed-off-by: Tony Truong <tony.truong@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> ---

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Glymur CRD
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

