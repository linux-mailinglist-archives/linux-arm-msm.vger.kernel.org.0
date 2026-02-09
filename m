Return-Path: <linux-arm-msm+bounces-92208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GsaEEqJiWl1+gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:14:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB110C5D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32A733004F78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 07:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BDF2FE067;
	Mon,  9 Feb 2026 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGwgBvvF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLMUGF7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A182E3002A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770621254; cv=none; b=tJZe4DbVMn7S5N0kCsRH1YtDMzweMH94XoPe2Y5m3ur4SmZ3UeNnol7SWKfnV2A6/hKU7gQEO7Nk1zUXXiZ1qIOKcFiKQRJM/F5aIkZD9vN1X06Mvt0ToIMOQRHO1wa1aHoWzoEEPg4L5vMIrBK1T6kIS8eWV3Bz4OWNsbvnNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770621254; c=relaxed/simple;
	bh=JbP10Ll7jjO1BX4lS7SqsxzBWutkXxF4vlEKJmQwik4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhK1igFWkS4DSTr6NBxeKHSGdJpAuhxKevVS915qH3xsDD7quO6qj8MGp9jxSPHqAKUDUl5VPUSTHozyKf28t160vw3172HBidhDza3xUNvjJxOKGXVPgFsGAGT3JnWYhT8cKx0CsfcJ5w4r5ztcfQqVwUG+s6Tx6FukwVm5hy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGwgBvvF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLMUGF7W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195NcL83347583
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 07:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTrKUWGsHWKL4F+zsgbBdKHrJDXyVebCryhlKa0YcZA=; b=VGwgBvvFwf/gRjLu
	0VS90cNtGRJNOrcAYVTTpWrwqhSrc/s5lAZEH2QXgBw5aJ2gT6KaWSndhVGYGgUr
	And4D/NlwFTQRYkPxJZY6E8v5jH2qfwyay3IdNE6OP5eu14Jt32O9eUzHVvjRqv5
	9Or0Er8a421gd8hMAE3A3VXgXsJR+aemilA3kqEsec5ErNRrwAAXbNQLYckwcRSA
	eTZBKkdQx3dIuRVWbuFCzqRDHSDpwdHkSiVbVJSnUzKkmzbSmDvnSu0wQLucYFxl
	FBUEbEEB35OD1QmHdKD8g286LB1RQq+9cp89uHbsimM9MAwM2ZcnBvfU5u68KgmM
	p/ZaFA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79cy0c8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:14:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so2146850b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 23:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770621253; x=1771226053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTrKUWGsHWKL4F+zsgbBdKHrJDXyVebCryhlKa0YcZA=;
        b=GLMUGF7W+p+81+BafMl4s0e1sHCUGs8XLTKwBVC8D+rfq/U7rcYroxaQdwHJaq1lfV
         Je+s2v5uvoeRZPX4AT8+3zs4r3HL5ffMM3ctvqRXaKGQoP7vLzpfoNW6xVRbjbJ8vdat
         cKlHkqiINu8r/DI3DY6/M62OwMjXtGcaPM/tCJslwEEgRRQyU/So2OqXEzsanWI3adLc
         04WhIHNhdAww4zVlhaojFNrtxoADOAOGKWmHWYUBDtmd1ZQ3j3gYvjHBGoRxJOTX8ZOj
         kKGYMaxy3qPVbhsd4h1M6qav5JbK4yz83UlL89xluXOFm0jlvz3ngkV8qkLTdUCIMvsa
         GpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770621253; x=1771226053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTrKUWGsHWKL4F+zsgbBdKHrJDXyVebCryhlKa0YcZA=;
        b=X9/3dHu9EtL9To/SvyM9lBgSv110lx5VcOUiU/5Puo5ONKTlw2nyAdVwudAhZDZzLu
         EjoTSfsaXSW0kq+n9TXX+SJ/S20u7cOahgLznIgFFVdRMwi3FzQrh/v07GHQ48H5RBhy
         0iQ/w2E+9Nc3sSl0I41yg7Gfx4nDtsMAFKT4BpxUDkX/qP5buknQ4BCSYgF1r3EJxeO5
         U4CWVo7HcigrolELk7n+ANK6+KWPOBCPJJRKNORCAnURnMQb5XVhfq1Oc9OlB6zH95AJ
         XZAW1V9bT6WFaREBwrfU4hY/mbqTXdg77rmKFBuDSzSEo6n3NtdWr6juKNBRrnJcP7mQ
         25jw==
X-Forwarded-Encrypted: i=1; AJvYcCXhkgqnJzdfA2EaZwDKjoqx4K9AkfuTLbc7Pau80MN3taxkkmXReXW2Rzat+GyxqflwfgrCfo9N8l1vgDD4@vger.kernel.org
X-Gm-Message-State: AOJu0YxgZarYoAjQZLPaMbxPFfwx7ygjqtSaQhwx10Wk1FhjVw2+1wBR
	rRbMknm6/HQ5BKek0pgpgdmiOraPaHNEo2i8ndSTp+hVTpZdcOTbMvDmf81x8+7XhrkjZvBDG4H
	Qy8nhRAbUaVJ8NuzfRblyUa+3KJ/nQY506z9MuK+PiSj7SETLeJLwEzbeYhfOxAoWyaga
X-Gm-Gg: AZuq6aIguUhmlV1GqRr8MB0YTs9XpP44eFtCSdD10qN6jpkgJ6nfgUi/A99w2LP7rqr
	efiqFXRLynRtl2abVo+Ba+o0Fdl6VdKeIK0gmJAhoe2aefD/Jdy8rXVwbHKq/GWO6zwa62JzOLI
	RZ0ucxyNvg0t2C+DdesBDfzbjZn4UlKS76l2E5sig787B/8i+ssJnmd4i15MaHHL69wGrGGI8dW
	IriOqRxbyU2Bd4EUqiHe8TN9a6/VQ3iF/P+wVYp7NKfhC4jUDKeAaNkBwKAA+EjS/VSGFlt/ZXl
	mVaTSY2Yduj3FcXL1gj/Z4iFiuiLNJUz1KGL95/H2Ih6+6G6B4KMuzzi/g2bb0+0j7dLJ0u9u/2
	VkUs2/mUWu8Ym1YbS5J0W5GtrM9MO7DpZLp1v
X-Received: by 2002:a05:6a00:2296:b0:81f:4cf5:f252 with SMTP id d2e1a72fcca58-82441631fe5mr9348732b3a.24.1770621252548;
        Sun, 08 Feb 2026 23:14:12 -0800 (PST)
X-Received: by 2002:a05:6a00:2296:b0:81f:4cf5:f252 with SMTP id d2e1a72fcca58-82441631fe5mr9348708b3a.24.1770621252081;
        Sun, 08 Feb 2026 23:14:12 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418812c5sm8755769b3a.41.2026.02.08.23.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 23:14:11 -0800 (PST)
Message-ID: <ede196b3-7ca1-40f0-98ac-010a56928b6d@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 12:44:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: qualcomm: add
 bindings for QCC2072
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260209070356.187301-1-vivek.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <20260209070356.187301-1-vivek.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EsIwPgAMlOyPEgyJN9tm82Yj1aUjekr7
X-Proofpoint-GUID: EsIwPgAMlOyPEgyJN9tm82Yj1aUjekr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA1OCBTYWx0ZWRfXwQu+SgXWe/yY
 bnxnBOVemyQBqU2XP/giohrkh/96bSj/juRmnj62EK7UKvN3BSSepBcIkFB1ZiyyTKegYNLVcSj
 +6TQVIl/MJOOHWUpBeHT38biy1/U8uqHaQI2Pu9lxDcDaDjp1he4GNXs9goSRe+z/w06My5gJao
 lZKJI+ZjndO9w35l/yLcJKUJf4mdSt7RR7Msv3ZRbTic2/d8+HAmiREwTbh/jAySnepyaLaBT/X
 m9TurDb8eTAAgwejr9mzokhmDa6MrlvJaz4ERQje1wGsa4doBkHoh012c2jTBHyz87LDMcra5CD
 I0CmmTMc33zxiTYDvsECCr2pwp0Z9xFSQKjvOq3+jiyP+5ACT5AFtcATBjw5ahoc4pks+SLR1SF
 lEip0HdGv+R9tFaWRCex4BgW/5hCAZn1KUZ9B/5zq1zi2nPnEXqkXjHE3k+NLo6RhWT8v9YGpwY
 kM3WyjAGa2WVqU5g4Qg==
X-Authority-Analysis: v=2.4 cv=EtvfbCcA c=1 sm=1 tr=0 ts=69898945 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=X13vrDU6G3zPuaSVdoIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92208-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,kernel.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96EB110C5D6
X-Rspamd-Action: no action


On 2/9/2026 12:33 PM, Vivek Sahu wrote:
> QCC2072 is a WiFi/BT connectivity chip.
> It requires different firmware, so document it as a new compat string.
>
> Correct the sorting of other chipsets for better readability.
>
> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> index 6353a336f382..1f47ad36aa61 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
> @@ -18,13 +18,13 @@ properties:
>       enum:
>         - qcom,qca2066-bt
>         - qcom,qca6174-bt
> +      - qcom,qca6390-bt
>         - qcom,qca9377-bt
> -      - qcom,wcn3950-bt
> +      - qcom,qcc2072-bt
>         - qcom,wcn3988-bt
>         - qcom,wcn3990-bt
>         - qcom,wcn3991-bt
>         - qcom,wcn3998-bt
> -      - qcom,qca6390-bt
>         - qcom,wcn6750-bt
>         - qcom,wcn6855-bt
>         - qcom,wcn7850-bt
"qcom,wcn3950-bt" is deleted by mistake. Will correct it in next patch set.

