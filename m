Return-Path: <linux-arm-msm+bounces-101091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CINUAor0y2lwMwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:21:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265E36C82F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 059DB307910D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78070421EEF;
	Tue, 31 Mar 2026 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anS9yjmU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ib8uqUBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B33E8C5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973201; cv=none; b=NJ46Tn/i++8Z9Db3ug5/ZZWoPa8OdoxKOdmIe6f8jw1I+2i7MWOAzLz5BqGgY0mF570FID5CyQSxLpKI3a/2unoJ9JWVRR8NJvOX5T6NDbX8sQgdLESdGyy04vpvr07dBLLU3u+VaAxcziihgd0O3Um8XgzYvwWZRzMsWIT+fB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973201; c=relaxed/simple;
	bh=pi0dDbHJXEJVbZJ6ZG5ypkoytcd3rnY23wb7RUCjHYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uj5lErk/2YOGl0xPOWicHZwNguSwshRr0iEYRrmFwY/b1d2ps6uR6V/DEuvBaZJ+/fat6y8A73f5I0A4KU5UuyCyq5ctXws2jKLhwpRb9qY1DqD8FH6wJgY4z0y5/VKzxJ7DZoBcW1M8nH1l/S4hGCbV8tRS2LU0lO4cygPxYVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anS9yjmU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ib8uqUBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VDUB0x2465174
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=; b=anS9yjmUXJ5FvfR4
	6JeklTNPPU5LPXvy3e3FMSrPqN9si7uIUzTuBAMNeK40EZSeR/Z/0ajVMn+ioIWE
	PjSAePKV5018ajkbs+LMRLuudMch+v7uWIFchBf74zrymrStIqCRqc+wj/F7VH0V
	5j3yVgKltiFxio1cxRX0iifjFEdZ7ZOnZdlkSb7j7XJg3W/4Ns9dNcQ8T/xf45PM
	3/JhFFKV2dU3qr60NR5wgzuvtgGq5aOaI8zlD6+DN9HoXDl/x4ajnlgugx0AHS/l
	EJdEw0ZkSbL3cdJ7UBBzYrTbleWZbDE6n7Tl6U033LpsIXxQlTR9l9cBL5SvmXBY
	iaWmhQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89uta9as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 16:06:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso3704477a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774973198; x=1775577998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=;
        b=Ib8uqUBaQ2+k/XEHrunDHa/hYfkGcHLYTZVblVy5UHc0muJLIDaBivFjzlhM5ZheX8
         GcMqyvaHKiUI+C2lbHmExRju9EvuuDwUm7ArmmmV/RY7hq59S8SmxSCRY6ZmwoVG1qYj
         lngS/N9tSl8lae8B7M1JEZKlerJtlODf47ldt1MDnQPX7XHxS5usGsNQa66dDeWEKrwI
         JQKeN9vRQR+jnMSurYrF9u1n5Jaeh1dAFZnGQovWe+OcMxzFE1dMf4j1l5afsYDvgY3L
         /07sKshHi3rU5dvzyp4snwP3vJgte9NQzg0p8OscK39CRXqorZmErAQF4FoM+F1ROttc
         ZefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973198; x=1775577998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSWb3pTaeY95vdPxjX7UY7rGaPSlAV+QyyhLsGlJC9U=;
        b=iqZNFow9SQj0WZkYq/f5YU3aybp6/17LME2eMaoCfKI/OvN2UkWfULgw7SfHN2AJxB
         WoGcTOueZ3AostBGy5Mp1bynqo14h//cDRD0gBgtbAAzfKJ43XYR4FZCeJ/CY//yIAqL
         n6u1I2N/kltu/V6H7Cb6USWL0vN1g02HHWXy6TjPh86pe6t+evJVwzrPiCT1khVOz7l2
         9rRxqtSk/omk8zkV1MgrBjAfWdURWHcXAqzt9z+TSIpgZQDbKN/t/5fRhWMgUVK8irXn
         pA9Kbg1ddcyvUbvx7+H+nysXUFb5CT70SdpVPSazkZfb6SXG6eivkwIkhzPGMFCKD4f0
         ilxA==
X-Forwarded-Encrypted: i=1; AJvYcCV5stwA9OZg/sJsraYjruOeI/vFJD8p3hdBKmW2X3wSD4g4YrDDwOnPx+1rdOhnDVUD3DB3IFTrrJR2uBna@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7XMvkPAyDgj0+pAvQEjnNjpYJNZ6O2WgAps/5aqyWdYMhzeuH
	5MamdEMnSufxmni4TmKqcTJ8366QpWYGRBXYy4xruAe+MrKqMvUqxNDLB331BX6cLC4AL1ftulA
	AxWEp0QiGTzmdQEpFzf01xrH8y9bO97qBi5XribYY1rr5LOqNayzYy0bgpDbA9RV2FICe
X-Gm-Gg: ATEYQzypQ0Hqh/1LCorK0O7cUateiFgB/bb1ReJwY31H8ydnbNp3J2FAB8hGF6zgBzP
	nreIto11QoGGxrLL1nMMITJo+yxtKrMvxr2CCdfoBl/T2tHXFj5UiLR1Lhs1YqR/96cI6Y03ZSj
	I0ZpZ+ZSMLzknmA6OZ2W8K3TO2J50RDD6yxXok849eq2nnN9EWYWz90g5brDvP/VK5LdyaKJVaA
	2cDZ32o0YSY2v3u1k9XRcRR+3+VlZQ86MP+2i/yJTyOhav1h8RO2eP5cYKylqpxX4s/wm27vQSU
	YE/aF9Hh2dGmPChOZ073xtB8oINRV3lUAxzkaZWuUi2/Qn7LOoHBn5Rm9gmLz97ZnHPw/r8Q23w
	JgYw2BLQPpKCe72nKzL6wfanoyu0IWzWotH0CHhKHWnJBHitgRLPli+XZ6T6MVQ3k/JmvZQ5V
X-Received: by 2002:a17:90a:d404:b0:35d:9d6b:9d8a with SMTP id 98e67ed59e1d1-35d9d6b9fbemr9871489a91.15.1774973197869;
        Tue, 31 Mar 2026 09:06:37 -0700 (PDT)
X-Received: by 2002:a17:90a:d404:b0:35d:9d6b:9d8a with SMTP id 98e67ed59e1d1-35d9d6b9fbemr9871430a91.15.1774973197319;
        Tue, 31 Mar 2026 09:06:37 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.193.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe66f7b7sm2094541a91.10.2026.03.31.09.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:06:36 -0700 (PDT)
Message-ID: <1dc85067-df11-4236-bfdc-e2117da493c9@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 21:36:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9sWm5Cbj6P4X812A3D8nMIWf0TqlasHl
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cbf10e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fHzH9zTiDFanLkNeTzv53w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9sWm5Cbj6P4X812A3D8nMIWf0TqlasHl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1NCBTYWx0ZWRfX2/n7u5dd8mgY
 FneQDhbes8UPEVb6QWDa2K+f/MW4IAMftS8E0pXBmpsaSb6YRepqKM2wmN+KI+epfo6yDpvNIj7
 xoZXSdAhHt61J/wucswRxjnMwwosW4nkdrx0sAHeVFYAeYIp1WI13ET4E6h4+Zzwrvx1UpCv/y2
 FdM7wi1Iajh996nxe2Q6K2Hqgw0VJTKoBN3PfdLhpFZMpm8qrVtihflfOFoKwXEgG2DFoC61I5D
 IuXUOnpyulEq+6rsVGqGgjood3a84Yfya7a+bI8POd4G3viHfTF7poP/AS2N/Q/nA6fRYGmuGb4
 lnxx3IBQ9JN9qd8gRsvonB+3dXW0PZhZ0GK/lRYqL9ax5lGGP9M60zV/f0LHByg8+rClvOj+/Ff
 UjCNIov/KiJ5RZoiCIJCujIP532VubaYJb8xJGXn0Yfk8zzAxTKcgSzxsuOMl0mqPxo/EFZJl6v
 aMWZx1akP55syAZg47g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310154
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101091-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,ixit.cz:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vasanthakumar.thiagarajan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0265E36C82F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 11:27 PM, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.
> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

