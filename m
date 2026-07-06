Return-Path: <linux-arm-msm+bounces-116973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxpsK5fzS2pwdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:27:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D0714808
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:27:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DFEjFBui;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CX33xUW2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116973-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116973-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 251C6356C94A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474FC3264DF;
	Mon,  6 Jul 2026 17:08:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2B22F5313
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 17:08:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357708; cv=none; b=L2b1mMq+DKFP586geRmY0A45xdMPJi9Vun1qnqim/tz016vvBwLb/wZFWEJJS0d8LRh/E0ZnTWgQiMpsBzzLnVf34o7BZDRMPQ0MNCqokJfE/Q1018d0d+eMjLTiwhL4PFd+JtKY1yha6ntpyFU0l10DqZ1RmiOEedyJ9bHUMBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357708; c=relaxed/simple;
	bh=IZGbYaxH8ggjxoIMYNl+yupFd97qlolubyfSMaIcNTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmE9fzmscKmren8qQvioE49JJL0aTz4a9hVeyV1O9VlWq/1kJZ5/LpyuZU6fRaZxUvqF9MKAjMx/+qlacVGJzsyBBfLTlnuwkWRVIZdzJyBnlYBFsZbTglV7b2GjFyGi8Ke1dTUCc2L4KBu7w5ux5bBtbXYytW3W+Xj20Th22Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFEjFBui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CX33xUW2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFD3C990337
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 17:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7OEXeTG7Fk3+hIiVqx+oEcBHQzWnJhCqfnlrjuWJG/g=; b=DFEjFBuiaow3l3KQ
	48x9uLdVslT5J5BBQoMHLDn+doJBpQLrKQ3YPrHT99ZdJoiV0NbNKc0fO+cHToB7
	RZUYNlWA1W70yk5CxW0oye2NBslonJTYkTgxmfYsxONa1ro4847V0LDOETJABpZ0
	HrUNwjFAwFQh4VPntkV5ZLgsJMa9vc53RYoKfNsH+MTsUkLfLq61ylwmGM/7IXUB
	ZVUGRuu7A4VtbVn7D9na0NpNJaqvHlgsSV/tWXFhydCQedZ41IhXXVIQLEF5lzqD
	e+fSoZn5/Bx2af3pb/Kx3xpR8RdmagdBHoYhFjMoOwT8/c/X2AJZexg1Pih31lLR
	cdhQ9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gt1ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 17:08:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so73127451cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357705; x=1783962505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OEXeTG7Fk3+hIiVqx+oEcBHQzWnJhCqfnlrjuWJG/g=;
        b=CX33xUW2yLNfqEVIDpU8r0CgIBtZCo2JA4sdQvXkyYpYLCYVWDvoDdf7BMD7ioUVg6
         +x+Ed0W5UTjimTMEsYDO/i3qBKLW9G7HvCYP2xu5cH+Q3jm76HOvJrVZrVYS9ZrM+w+u
         TNzwf+B6UjuAooJkZmLHuXU9FQVcFjSZms00KwC+CrKKDTgp8SX7Y9NkL5BsfRH11mW2
         lhA+WPfG8re+wGCYG8eP/Enoq/7FHRp1m6TfJBM6FuEe8Ky5C1rqZPu8SCyhC5KdSq2U
         lXrOtcOe6HDVCc5ZtNwWd63yt6Jj41fQMh+cYBmK5VicQqjgW7YgymPXH66jkyGmCsYy
         Qk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357705; x=1783962505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7OEXeTG7Fk3+hIiVqx+oEcBHQzWnJhCqfnlrjuWJG/g=;
        b=Xr5KctFovXRVZoYcHE1I7O7UDarTcvmc/7XfTqdf+zVbArFnYyHyT8uYD5h6KXNpxr
         pOgjnnKep2GDLnYVVBO0J83CEgAauSHNl/qnkZm4TzKpOB/aUstaA5krHIxhUHOO51aJ
         g6yAK2wEyoCkeX7uxQsTBsEZgGBf/4x4k2bNNvnvyxdpE3RY0Qfn+OcuZsst9GT4XLZd
         UlV+4hRMN7jzT7D66whF8SlbaBeGb8RX8F7fB8dU527DvjZB3kQQuQzQ6/KsW3daT9dB
         /Ko54LKQ36t9k2ctc2ZvoL/AxrCfdZRjnnY9Q1glx95vGQmhtvRaliVvwqoUOvPiHpig
         KJug==
X-Gm-Message-State: AOJu0YxmRJgxriLwYlowe0vUVmufGiFTqRy8OhDelVHjgX1r/SyCQCqQ
	qS8fxvkCBnJTWF03VECnLWaNPJDXlj21cQtH7MZu2bCuCkDmHb1MgzNvQs12DWuJhf96AiG07qy
	0Zm0ciAuA8NDdUhvZDwISMGSa6aoULK8fBGE8kPH9KXvYzmVfe61Cel9Ca/m/6mBRBJRp
X-Gm-Gg: AfdE7cmxG5o0ZuRjoeM7yIx0ySg011NI0Dbwk7LCoexUWeWoGP6CQN9QR0fwZFGx6Ih
	UsS4wYrDxLJEkfKNMr+bxHbafrS+rIvM/EgHByYtr8/05nV90KRXqeQN+AWLr4RgznliekgAo9f
	O2HoWLZYxyufP8rYcsFS9f6s2difZrb7fKtDqJ9s3o++eLUoPFIezs8I5kkm/mxlDbOrjfkUmx0
	pRzoE/HrWfHVOhbCDRkI5yZgMEorbHt/BK7DKA1awqn4ZY6FNXRfO3otvyOM/Ie4q7QbsCl+s/n
	43d57BKa0QsC4UEOt0ApivGTKHmr5KN5ZNe8yVN0fqtrS94DyYN8rmTi8ffdcithZVn24O9PnNW
	QtdEDE7CeSrcybncZ7yS5DXwa+H+oQEUbRSEtsKCcDw+p7zA+KDXJLH2iBJdz5SGNQNPluepLtA
	==
X-Received: by 2002:a05:620a:2991:b0:912:1206:ddd1 with SMTP id af79cd13be357-92ebb52fb00mr210913285a.1.1783357703593;
        Mon, 06 Jul 2026 10:08:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2991:b0:912:1206:ddd1 with SMTP id af79cd13be357-92ebb52fb00mr210907885a.1.1783357703111;
        Mon, 06 Jul 2026 10:08:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm686999515e9.7.2026.07.06.10.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:08:21 -0700 (PDT)
Message-ID: <d9c6ec58-930f-4834-ad3b-d9beb4e21f6a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:08:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] remoteproc: qcom_q6v5_pas: enable QMI TMD
 cooling support
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-5-3882189c1f83@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-5-3882189c1f83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cbUWRzzWdQpQFcmgP3_yRYnE03zhry_e
X-Proofpoint-ORIG-GUID: cbUWRzzWdQpQFcmgP3_yRYnE03zhry_e
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4be10a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gAhwoHsd_6a96UM4EnwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MyBTYWx0ZWRfX3SEzfLtU7pWy
 HBmdzz0n7geaaAdsVQxX8dn69Ybq4k1jCf22Su1ukq6FBPy4eZ9t8+sG0gM3ZV/DMYHlGItY2j8
 usgUcHmtZpjjieqEH0vB4pDh4VzbMzkF/dorFjpc0hI78u4x3wKWreDbUHfhVo5n9XI9VluBZe1
 +8Qp68am/munG+sPJaEWKXekXqq7sWdSDKOWOiLM5+ghGbOJKXMdKUYa5XR7OIeg9C2I1v/sLr0
 o2rnaYw43gUpmGtgHcHlydOWUofuypC3z6Uht8Xwp7IC4x6AdKMXkS74SjRU4uMaE41MfdhbRlH
 wJwkJRpzObVsHs9OP28WZZp0MjfwXMKIMxKtcKPDxBaEqxFdWxL4HflW9yA1pD3Y3vKiajao/pJ
 r66h8wqLYDuQlDp8eFWDdWJ40IeDm9cCBnWmrrxcgMSDnhYt2XGD2McxGZZimanv13yDiMS79ac
 Gsdq4i8aZ4N51Iad6lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MyBTYWx0ZWRfXzIkuXN1H47lz
 Twa3QeW+Iv56t7O8373Qh0poWWJ2kQ4qQnL88UdkDzaZ032/FdcuteCOI37JIRV4dEbqJhZeOs1
 L4m56+sX6k7p4LejhvE5ZcsYT7MpZ/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116973-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 517D0714808

On 7/3/26 07:03, Gaurav Kohli wrote:
> Enable Thermal Mitigation Device (TMD) support for PAS-managed CDSP and
> modem remote processors on platforms that expose the QMI TMD service.
> 
> This adds per-platform TMD configuration in qcom_q6v5_pas for:
> - Hamoa (X1E80100) CDSP
> - Kodiak CDSP and modem
> - Lemans (SA8775P) CDSP
> - Talos CDSP
> - Monaco CDSP
> 
> For each remoteproc, the configured TMD QMI instance ID is used to bind to
> the TMD service running on that subsystem (e.g. CDSP: 0x43, modem: 0x0).
> The driver then uses the corresponding TMD endpoint names ("cdsp_sw",
> "pa", "modem") for cooling-device registration.
> 
> QMI TMD identifies mitigation endpoints by name, while DT thermal bindings
> reference cooling devices by id. This change provides the mapping
> between DT cooling indices and QMI TMD names, allowing remoteproc nodes
> with #cooling-cells to act as cooling devices in the thermal framework.
> 
> With this in place, thermal policies can request mitigation from CDSP and
> modem subsystems via QMI under thermal pressure.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>


