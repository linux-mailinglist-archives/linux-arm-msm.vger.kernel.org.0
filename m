Return-Path: <linux-arm-msm+bounces-112738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id li6EBemdKmrhtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:37:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E867167D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:37:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IsHlbCAL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TBbkdorV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112738-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112738-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1022300D9C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D04B3B9DB6;
	Thu, 11 Jun 2026 11:35:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051FE357A25
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:35:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177742; cv=none; b=swtnwIU/CYiz2KQ1Bbzy4fbGy+9xB2eiMxVyhfGt7PxzIWW6CybgyZ/SpryPbgKD5Q2A1G3L0pyyHFiUrYtFirjB7tzwZbR9XQefeFH5kStOT4Wc9B8w11pCGUOaHAU4ciYp+QGt7swRKWJjB9ynoHRLA+VE7+BAPhIEumO9lEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177742; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8+02iK5vdHrxX7EpcavdG3QErwzO3z/SBfLrQVvwR/NLa0l5ePuw4ceYXiwQDn23cd3GVS3Lt21+Pyp+7Kg7Av7YtC4L3GqVfGlFuKdiMY8JY2q/MSbrAaa0UtFMX/JBcW9cNZBXWir6Tvg0n6hUeCb64ZD3CK/A3YLfJtZ3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsHlbCAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBbkdorV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA05rq318987
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=IsHlbCALB5FXKPTl
	QjCSL7oURk4b9YIEDStygHDFYRQAtubmAaYO/U7Bo1kBfsRsVm6p+xeNbUlm6hTW
	sGXiH8p0tVWwIeVcggJ3V4kukXz0hRt7w/IadBzDvuQRHR/ANKDTclbVrqpLcEOb
	0yqO81ftQt1R/7UAHxZ05uIotR/l7Y32yqd0MBzipVrlz6uKF+qRh/T9LOaY+t4d
	v0ChiQ8CZ7DgE73tOMpmAnHff21n+D4Q5UjfOmkl9GJL+tLku8im16jD91GSNnWg
	9+ZmPD/e8EB8PQQspZucwQy599xxZnyizeKDFtaLxnJ6+w5H85TTgGzFxvCHXWUZ
	F0eW8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk7c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:35:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517796be724so16378571cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177739; x=1781782539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=TBbkdorV3Iv4oygyPlU3yOmT+ng8Tu+Y9utUPimBTBcBWhbu0i5k38c/WET2C1uKwP
         zDIvj4yKzfjmyCeeu7swMlFtcor9DFxNBtRCokJEpV9VlZWzeFNhllJAVVYnsfr95Grn
         DCQN7hbK9YE5xnkdRge/hwj7mYVbow+Gh3sH06wIIB12P03CNVEESU4AmlBZea92ASt4
         lqHJfXGIPz1f2GgOplcSIFtk9z/Uilm2tO+J8HwsyLn9Vq15mjaVBhs8/iBgSW75Urax
         OxhmhQkEEtG8eiXU3HfQLwIb3gWVZO3Fq+vzrqni3zSTbeqDFbFMbvLXUp44ot7fGo5m
         jygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177739; x=1781782539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=FcxEBLKg7mBTT7xq/kUqs29pXDhn5i56J0Ast2JFTJ2qmCEpKYWoXHKPkbXAUn9Bx2
         XHPuXCX/KdklOgoueLyZl2oXSvUURcDwe2B1dfN+01L3JSHqSDQmm8gmqg2FE6x7DHBF
         ynJA/6HYVsuJm/9NCKJCO8UK5JNo0G9K1enLx1+/EOXpebHQIwXSQv5fmXnRZhI4phda
         oBFirBetK1S6oXe9Ceh5bz09nxSOEGqIcywhEUsm7n1LtF4HerBLOg3TiSAEAUIPbY49
         yY74XQiBaZc2DCfFNGX+oygH2zPE/jSx8HJjFVgOJ+xNPAqKF9ovzPguT3M+UHaWFVr3
         DtSg==
X-Forwarded-Encrypted: i=1; AFNElJ/oJ8kHu5hass3iL8D+w/rE2d3WRbyvG4ODk6TUYSEtEggqjEQR7jt8W5bBrNy/OxCaL90FP4/YQkf9/t0m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmig7P3WTZb4NCkHHk5kQyGkQZSWTEPvuD6fMGMfqfQie8J1v3
	SoQkkQynm/3bI9y4IKriGYI61x0q4rRxvRNInYtnc8t6RGSi2W4uW1mg35FfOrmV7o96Z962hw4
	DHH63BlCLYmHmzpJV5BqbpJcsUnrcnJQ350arj4Cw3mNE01WKiBRNME/p+63DbO63c9xy
X-Gm-Gg: Acq92OEvsctcPH0ZocPam+MaBLt54WzzVdsRLxw7Mlgvau34wppLpuewSAX0GVasR/Y
	5h/XJdXhgSXVgDqFI00vUB3Xijtj8gp3mdlqhslqZOW3k53zbqxoOOWYoWg8KzA8bES7FzPM+Ye
	8bBbZ4j2LGkN+ZIwzHiGY9lKPCsrv7tiozTvwXc/bP9H8X0uH7nRReaQ8lN8QAQjbZ50YYX1n9E
	M2U/VY43UDUgb8pxV3bYjmd629RQjY+tdhShVVbsfgs3wWe58FN/juMRXLupv98WnGcizTv3otV
	nn+/3bYbL+OjPdxsbfMUJPyar0HRpWcpXN6i6+WbxfWK4PU6jbauJQv2U3gdURoLRnQ8hncF4Fl
	igwejGpln3O1sK3oyX2v8rjOyL9EPPIgs3lFGisEIz7HOn4dfN+4B8Rv4
X-Received: by 2002:a05:622a:c16:b0:510:144a:636 with SMTP id d75a77b69052e-517ee281cf9mr23529661cf.8.1781177739374;
        Thu, 11 Jun 2026 04:35:39 -0700 (PDT)
X-Received: by 2002:a05:622a:c16:b0:510:144a:636 with SMTP id d75a77b69052e-517ee281cf9mr23529401cf.8.1781177738938;
        Thu, 11 Jun 2026 04:35:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65027662sm11020827a12.11.2026.06.11.04.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:35:38 -0700 (PDT)
Message-ID: <2f72036d-2f88-434b-99e7-cca93de47e56@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:35:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/18] arm64: dts: qcom: sm6375: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-17-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-17-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EgzDuFDxGsSJzCaawPPhbZHZqNyW3_fs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX9TJXd/WWOUJ+
 nQIqo+ZM9r5QBjK2lQfVnTlHDv/UOeI2zOHuhO8Lo9ogjhsPktSNdivyiTJxJFwk9/YLm/oFKHq
 oj3AKDQ3la43E9e5ZVsGY4PJZCBJRxk=
X-Proofpoint-ORIG-GUID: EgzDuFDxGsSJzCaawPPhbZHZqNyW3_fs
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a9d8b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXx5o/yAC/kR4X
 WLoja8ZNA2KCvea1H4Qimqdm5pw7kcNj1qKMGqQ4uZ5UlMO18d9EX/4SpdHlNp+1JhVkozOnbG2
 AmNgHQSn706J7eAw+sbah6ovu2QIUMcEiJZ85WxuvJz3w9GpSMLRTO51J0RCzRX4X+36d7l6i83
 LmBkHjiaHbGxVjNt80ttj8+JilJhPUpRki+68Zs9K7Ck8h96HWFXMmwgJuz2otrVaMwwHuAWZJi
 YhWrza1VPKUUKTcgV42tlHWpbyVl+NmIvdKZAYodx8qmBEW2gX0kdPBOQCQz0m/Hlhy5N53r7H6
 fddmJCvCb4pqoH9vW3WbMZsx91BnSbCb9nbHXTvy+QBr1xyV4aR72PQiUoN2S7672BG2a6B9RPg
 koct6GlWjWSEdO5bUQO2z13s94tRe0TQ0gy+fV07FpMOrCWJeab2oN584A4NQeRtDR95bivhqp1
 4QkoCQ+/ReDVmG/zCRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112738-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A5E867167D

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

