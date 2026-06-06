Return-Path: <linux-arm-msm+bounces-111536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LPHdBQCHJGqH8AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:45:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D664E537
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:45:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=COVJZgo8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MYKjmTvQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111536-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111536-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6266B30182AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 20:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18FB3A59B1;
	Sat,  6 Jun 2026 20:45:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B697530D401
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 20:45:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780778747; cv=none; b=AnTZy1Rsw4Gfd5sGAXOmd4qeAd0L/YxLGjWsbkesPbodUt5WNy3FJlvVuZ09iVdnA9S9SSvdmsJdapLKq84npPRHOO2sDMk/O2vwGlVqYGaVk0YIv/5HLnxN2+TDcGiOR8UMpQS6Ig3Tb/Sn3EAjrrej1E9d+DVTb6KeWQ4nOoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780778747; c=relaxed/simple;
	bh=tVWTUQkuWw5hNrTItWgRA2ldO2VwzHh+EOu7JXnSQ6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgjzlIadJ0k6VTEtOHgWybZCthmCc6vTidiInEbE9lEiQxnxfGHEP8D9gedU0aqbeyLNk0NlOed+6Hj3jQ9m5eg2pEuCa+Qhq8Yexcq4SegPHei0MZyGYloBkJBPLPX2MegxyhbZNwfLNtCPCe+vdwRACnqaFhAQhyvO4uwyJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COVJZgo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYKjmTvQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656IilbR2681933
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 20:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2gWv+f/fbwdkZymYojg/4SsthxrpUFT8OVRqt0SRylE=; b=COVJZgo8TKzGwP0n
	yHB6ExIclAwo32gvoR8AxF95ZouKIhvTYLSnxyWT3F/0/inlRgvPXo5TG7AZ8n5Z
	dmJbMzgyCKB8qhDNQHUOazrOLaR6cN/QMuR32XEFM85SpxLYguQOnRluHKqObHSn
	3jthKpW3KtwOxqnmCpHIxVdGuB3ApYdTwYtYOBqgty8weWGScBur/wwmkEaFMtb4
	tFuzXQ2l0NPdPahPNIk0nVGQ3DpR+qdPgLPTTbELUP+lGZ+96byXcVE0a8GX74RP
	eIGHTOxm0dYqqzWf4FhIBMN5VdoefIQWyja9LAb3Y1AfzIkjBUfuH7P0y4UsIJWu
	5PtdBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmra6nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 20:45:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a99db8dfso37075625ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780778745; x=1781383545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gWv+f/fbwdkZymYojg/4SsthxrpUFT8OVRqt0SRylE=;
        b=MYKjmTvQmmqGpHZUU0W7rq4Tw6K0u4n2855YukKOstSOd+hyb35khoZcvv7N1I+58e
         Df+Q8UjTf6duHUsnxIkW3+BaX/DGQMl/T/3552dcQfn93AImlu2gcxxddwJbu3k8p+F/
         4hzGlv3Yx7SU6VYOB33f2WcfB3Uf402biHGByNGvSg5n+/Q0iiC54cf55Vp5pOX9ck41
         ltcd9PU/jIzv77omG532yiy95N3FKdPw3lNbI38bX0r13+HbU8lbBZxV5Qqry6vNq1fQ
         4ZeqknOVy6zQHFmbA7QX0AgQcBy01f7qYLdQb7Xkhsd9P8C6u35Bv/azi4l1zRiAlMqR
         WfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780778745; x=1781383545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gWv+f/fbwdkZymYojg/4SsthxrpUFT8OVRqt0SRylE=;
        b=U9eaKelLQNNVclFzXFcr+oYiNjLUZLs1mTK1cLArk/HBVXfj6s9T4K1zCzP5CncFhG
         JiADx3ZJVKhJrOmzH4I6bB9lQu50tLHVWQqEjErVZxAsYvNFLtzEu/eFuJLMnkAhC+BG
         uI7eF13+bf6RH3CHKX2Ts0fJghN8QU5muq1T++0evp2YL8pqCwlVHW6mw76bY+sDuniP
         Wk/CBKS+5hfEUqsw5LBanm7Mo14+pwKH5+PZLoi6rdGj0u5Z70vr8fETN9yXrWI7ayHe
         o4k5SV3p959jNGKeH8UbkuHsL+eK2P3J9g+WagsPQMfcFlwe4YvEeqd2oqaR4fI5zrz8
         TGmw==
X-Gm-Message-State: AOJu0YwKn4RLUKERPkEbjoe43yQbXh7ROR+8wGrQzdr/C78aquazFg/Q
	85NxmMlTcpNui2GskbBAiH0peVBoom2sqagAPbOlMXHWFpLUd2i3FZ7HAHskNW2MCUZwpsPOIuj
	EgMWd2SC/2zgMQGSNDzBy2ZeG3vWYwXKmi7T0e2m/J740BB//pKTLMWoJU/ir3X1PwTNsUHVERM
	hP
X-Gm-Gg: Acq92OHLhaTRdzMI6n8iJ95nrByZ4x0BD7hiNep5wpQhRMXHwJ0RKDwcY7nN4mg+d5X
	OEJ2tCTuBqGbHgX34mr6eJ5Hw4SYwoG3oD6Xb1DXWtvFAeZN8CX+gz3olN596cDN+mzEtVPrS4b
	jSW5oP5U5cjk+5eRnkfVPLTlB5v616JxSM2FTCYtfo72Xf5Z2Ne5QkD7qRfVAA5u3TzOgdQvuiN
	N7KPPluhP2x6ao1ySD+L5q9P57tgA3nQdKj185aipKNqbWWuywQxrlVYzDPl+adsJpqiGtgt8DW
	0bA8K3FuadENQmkExMqi4fogmX89IT2Gcq/t7v9w8QevtweIAuAljgGP2ddt2dP1e5VRNjx2xSy
	GRWXP6q2c4szCcgtawqLpRDwmlyTf1KsXtmmyW6QXoo6eaDJO55rGXMWFod9SN+Q=
X-Received: by 2002:a17:903:7c3:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2c1e8214345mr67680575ad.36.1780778744738;
        Sat, 06 Jun 2026 13:45:44 -0700 (PDT)
X-Received: by 2002:a17:903:7c3:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2c1e8214345mr67680385ad.36.1780778744313;
        Sat, 06 Jun 2026 13:45:44 -0700 (PDT)
Received: from [192.168.1.8] ([223.190.87.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664950aesm125445745ad.69.2026.06.06.13.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 13:45:43 -0700 (PDT)
Message-ID: <b56341c8-eb31-44a0-9385-778b5d24ff36@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 02:15:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDIxMyBTYWx0ZWRfXyifxxrVpH/t/
 ePgnV6TlNfntle3omVhCm8X6DwYNonJwhkOIG3XY+Br3v8EW62KB4quAZniC8o2GvH0lzKYskrj
 ywJI/0qWeRLEujGgg0y5rLPUirPjyHRC0wk2/NKKYC3cTgLh7BelD4nXfM5mdarNwJ0KnCrRvU6
 vgFa9/bqlmmvkLmKr7OjwRDXuDLiVDhk75pREK48mUMhoUlV16HXqNIwwUJsVubshk3dQD2cfKp
 SbMHM/Q6yzQ7cVeQW4MHde1rP1HAg7Uv5kEMJenTVS+XikIAJJxqrq4Ob9iu6QmiPJRfM4Tan06
 2rmZlnOGE2GUmBRatGiY0R0iF/vBbxQpcWbgHGSrmQIsHoeLnF+KZ9VciPlep8Ht8ZyIQPoCWcb
 IwnbPUoIgtP8dKAumhWEDPIBdmwz4T3vxcEMTe4UeY75yYOyB1uYTf/DpvBT0agXdfEj0NtMFJQ
 1TkJumkniDiyEadhHiA==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a2486f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hwwt4TTrG29xD97kRhuzDQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xhZcOr--89cURCpmMK0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lzZQlAcoCPcXx7vTWeZa-UIICQEFtncL
X-Proofpoint-ORIG-GUID: lzZQlAcoCPcXx7vTWeZa-UIICQEFtncL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111536-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 560D664E537

On 30-05-2026 01:57, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS device nodes for LeMans platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

This patch still needs patch-series[1] as prerequisite and cannot work
standalone. Can you send this patch in same original series just like
other DTs are updated?

[1]
https://lore.kernel.org/linux-arm-msm/20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com/

-- 
Regards
Kuldeep


