Return-Path: <linux-arm-msm+bounces-116665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iqbdC6xZS2psPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:30:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C770D8F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:30:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DXySjDGa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NZ8TCyUW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116665-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116665-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4D3B30A6750
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87277318EF4;
	Mon,  6 Jul 2026 07:03:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEE930DD2F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:03:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321437; cv=none; b=QIPCHaKuGekAf5O+qTEUh90Y6I2/pxJctd8A9sI238R/t6uNIwfnnkUmapqX5lLmq2/V0luMDXE82QL8/sPK5NiIE6X0P5jzorWSbZnYXxOSJCXEy8pH6z2cuJTjWunEHKkG8A7Fs8MCntEy6ZE0qufC+kP06dDPSoBs65vE0mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321437; c=relaxed/simple;
	bh=F6eglyNuwi6Em9lroj9ZIakLYJ37cORrqMFHW96g/e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ecl45igRRT+sDZ7JUmVUOWhVhsNGgnR36/ZcaI9spaE+prey0zUlczfBcBK9Ot7MqUE+J4zQ3vBYWiMRoBc1/ZphSSgIJsXOLi5F0oJokBczdrNkQxTZ1STGxI+HuvsFOG04Vn38RghNazYwzJvM27s78sYoMsxNgDhcMzifpMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXySjDGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZ8TCyUW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641VEw3615509
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4h9cznq9VFPrX/DbkSwD0kOjoHyPxTCKUx/cPPfItso=; b=DXySjDGaUcpmgSmh
	7dJCoZ1LBtZi8qYqEKY2/flStTwRfFBJ3+9EbkJwGiiVnQ5Qx+VWm3jquJN+77+i
	AB+hE+IJQdaqN9VUT9bEoKMJ9/Wt7R35f0c3T8Hj1NgzIf5AiJhHWOavsT7exvEk
	1Uf9eRmaKPt6o50t5FCJpflfp5ewiTvmUjzbSS7Rp6HXg1J7R0p1V/2fhA5ZytwS
	TLdTVRn5oGQJDm8R+JLU0LUbvahVoIm40ydW43WTFPbkacyBAASqFpTMhmnaF7UL
	Qf+fgsorkzVoYJazAm/hekppD5ZmE2Qm/3sRBwkkbH7MhxhTrEBFfXYLYMPXgJ4/
	VTJ48w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3cx56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:03:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92158791d14so251515285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321421; x=1783926221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4h9cznq9VFPrX/DbkSwD0kOjoHyPxTCKUx/cPPfItso=;
        b=NZ8TCyUWUkDBzzqxr6zsMgyioK4qEgyg4JsE3NZt1dTRuJZnEhiDkhlnJkW1ZRjE2v
         uAfNf7InEnPJ5UxstWcyIf1/Lfn5eyUk2JGX//jiCuw93uDSgytWBlgTUQ4W8GMkVJjm
         B01ieACD1pr4ChtLp7NtkK2GkfksG3RCThlGAi9Z0IDc4fRT9ew0hlxITT572/petcn0
         lSKvFHcz25niZ7/vu7xw8vpiqIJUuHdxMo+Z5fuvtaupm9/cNfT1YpcDQi6bvyGSd1Lo
         iYyYdEEsSGFDXgHm7iiwIRQXX5yh/k0967bO39U2VZyatBhngdimYBgWCbRVk0ayKkIS
         Q6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321421; x=1783926221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4h9cznq9VFPrX/DbkSwD0kOjoHyPxTCKUx/cPPfItso=;
        b=Wq8uSIg8hbTKNuIMci6nYk/bH4vZPpwUz9ngOmCLh+zWkfuFZG84NeqRWFtkFG/ZAv
         nZfbDoTTNFOVZjTlrAVV1HtNAQHoQSUy+C8OFi5MndMrhn6DPPvgV1uDThj7cH6/RN3w
         NeBYY+U85Z3NlapzhVRlFGPa/oRcNemjMBNUOSKvhl1wUiNLRijSkqw49KOHtMCSwp3T
         vfMGxSGpk7rd1ieHSZz2xn658mSnFzoohXHsaztcuFhMXzdSEMye5JnqQunSAKRcvQ8I
         ruFUpDk8lLJb+fNX8dZm2EhURkY2UnK40nWSRyzPwuQ4JD20CSlMcJFcQnWVAvUsWgaE
         NgkA==
X-Gm-Message-State: AOJu0YxEChb3wgWWXQeye3YeYpNSX3deMwaBa5lG+fIVfvyhmCe+R4BC
	RcC2VdMBzJFEgvl6B5Z7VJokjbhQH5ej66goeWubpiXjIDzBj089ywCvCWHNbjoh+089eeiF2v1
	8dI1OpmlZUrWXlxQIlxWGm3K+kqwieEO7s7sSLVnjwVDeDYggn60zUAgPMCH029Gf/tAF
X-Gm-Gg: AfdE7cnjRvNoNBUGrzCC/TEB1orP13yGsiBrP3qflefy8CbeZ/wTvhwmoqoe6hAcHpn
	RUs5AozlW/CiN/5SCLMqOV7IfbzvzBK3yNlj22uGTSOaXH5Bpn3/E1QA3BIjohp6xEkkHLBvu8l
	MlJ7N9v+L4u4dECM4u7nRg5nRAF1pcHRxIVPZNKhNyE1bntMXkef7pqp2Qtp9j2sqGPigk/Cq55
	ec/ZoGWKu2/7KE1Zm9E/bGX50lgwATgAaoziQVwNjmai0aJEdEW9A1XxDlLwD8T6MRQJwuOajk/
	K9jdUitu9QxCO/r1ImDdvxQzBuhTR3lae1S9Jd4ggTsC/VSJY7BmlvtHu6WisgRma/Vb/BOnsed
	v+/jZd+8avmyzOr26H99Ltixmt1IHddtrv5g=
X-Received: by 2002:a05:620a:2915:b0:92e:6a8d:38aa with SMTP id af79cd13be357-92e9a51a68fmr1291562185a.63.1783321421015;
        Mon, 06 Jul 2026 00:03:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:92e:6a8d:38aa with SMTP id af79cd13be357-92e9a51a68fmr1291558785a.63.1783321420382;
        Mon, 06 Jul 2026 00:03:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 09:03:26 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6143;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6eglyNuwi6Em9lroj9ZIakLYJ37cORrqMFHW96g/e8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NEiRpgCcz9sD8jpITxKGCulSMB+7+hC0PHr
 wVNj4Luv1uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTRAAKCRDBN2bmhouD
 1/Z0EACFZbOJkSOhRxw5aGYcUEdZZFib1gLF3igI7muuNygrWppZp0yWCtx36hXP6ZiWwrCu/e5
 EYjMyshWCLOG0rRkzQqF9EWmQqQKM2u0RgLrazqgLbmDerFqdECRHd40R4azaZxVt9wxIsWY7Yk
 ikmvK/iHZtTGEbIP/TiIOlqVzA3uGTBr9IXah7daPPdv71BWhSxiKZcA3oqz1/mHVFYhehe8xrl
 IwWAX+sWUOa1FV7QKjbcke0wGn8I0D/uGVIvyU19Ev8ZljhBtWh5EQMqlCF0KP3XcVXXVTMMYD9
 ZdyQmnfn0I19XctcvLEM5BQ0odZr9FyV9Kg20hZKPhoe915lJpty+MNQ1zGe0JPQT/hsEhlcdbS
 LjSzS3fVBShvN3RKN+NQsjxslZoYPo/5ebB1BkKue43PFSIQgv8jh0TMjb8xOVFdtlhMA+8mIws
 SgZeBwF/F8AQym+rGLXGBcXiPhMZKjqwSplRMicDl/4UaJ4mqz/IhBGjZS+YOGjY6lGUWj2C7dY
 NVUdppggIdGzXXgo50eblJ/FUX7jkSgHqcPyoqaeoTjIwPk63cvHXJZ/xPBo/8U5Yc27Jxp8oRE
 8iQiWQspwGJm04V1nlhLPALW9iYlhSVSM44wtmuWA2OczGVAJZOboP1G4NVZI1JcfUeyympIAoQ
 mta97eBC80Hc/OA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfXwco88NTcSMGI
 mMyHvLdZbPAZm43dQVeQdVwCp4dgQn66PvSF52JsfkyegDBgtUd/wNqV3eZAxzALc6SLa0wUz1m
 YqsBv+SxmVpYyqfmSbs6yVx3Zjr3G3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfXxXXPGialvrr7
 1TMrrckckzmC8c7gsxBVGDQwmt24ncvPbOfTvIm/ZmuZD+tdSvLXTV2zFwfrIwzC12pWgtHaJc0
 +Wy/aN3T4vGQzUeowICyxhvTKbCR3twgMD9gUhv9MeQOO64613SXOivdXyp5knCBTCg+YWxohNf
 x6Iaq/zgt2gFpU+NudB7AsfY8GPq4xdfNfZMFym3x57KPGq/E09RP6F7rhppZiwXN2Tolp4/GiF
 W4PRngRSHgsf5nkIpBYyhYZ34Js/gZBQ/zmPKOVq5mfcyAkRNQGsM6PWJ4Ilmwma0uqZiBo86FF
 Ic8k1bjTipmicjnr8why0vX682CYV7Fo8P9qu1+wyaiMAB4TfrxK1Na91jWsl8Sg92pIuImeToI
 Un38saZKm1fqW3+0OuTwJzoDPPlgX2flodeeSVMFOcNCIPBqkdAS7vFlFmfU/nOr91SESR2HRiC
 8JOc67sBgTHLwJk7W4Q==
X-Proofpoint-GUID: aMMC6Cjmg-1mzAnxdD4GIpUvX4Mg7y_7
X-Proofpoint-ORIG-GUID: aMMC6Cjmg-1mzAnxdD4GIpUvX4Mg7y_7
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b534e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PFZe3mRHLNvTyYGQIl0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116665-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 283C770D8F2

DTS coding style prefers hyphens instead of underscores in the node
names.  Change should be safe, because node names are not considered an
ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi             | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi                  | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso           | 2 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts      | 2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi                      | 2 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 8 ++++----
 9 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
index e53de709e9d1..e95da761234b 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
@@ -87,7 +87,7 @@ gsbi7_uart_2pins: gsbi7-uart-2pins-state {
 		function = "gsbi7";
 	};
 
-	gsbi7_uart_4pins: gsbi7_uart_4pins-state {
+	gsbi7_uart_4pins: gsbi7-uart-4pins-state {
 		pins = "gpio82", "gpio83", "gpio84", "gpio85";
 		function = "gsbi7";
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 95be1d2e214f..06c0af0aa317 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1866,7 +1866,7 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
 				};
 			};
 
-			spi8_default: spi8_default-state {
+			spi8_default: spi8-default-state {
 				mosi-pins {
 					pins = "gpio45";
 					function = "blsp_spi8";
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
index 07c10c84eefa..2c0590617ac4 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
@@ -55,7 +55,7 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
-	vreg_bob_3p3: pmx65_bob {
+	vreg_bob_3p3: pmx65-bob-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_bob_3p3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
index 4600d5441cce..a4c6d39cf777 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
@@ -14,7 +14,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 &{/} {
-	vreg_cam1_1p8: vreg_cam1_1p8 {
+	vreg_cam1_1p8: cam1-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_cam1_1p8";
 		startup-delay-us = <10000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 40f88498999b..cefb8ff00806 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -63,7 +63,7 @@ vreg_3p3: vreg-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vreg_conn_1p8: vreg_conn_1p8 {
+	vreg_conn_1p8: vreg-conn-1p8-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
 		startup-delay-us = <4000>;
@@ -71,7 +71,7 @@ vreg_conn_1p8: vreg_conn_1p8 {
 		gpio = <&pmm8654au_1_gpios 4 GPIO_ACTIVE_HIGH>;
 	};
 
-	vreg_conn_pa: vreg_conn_pa {
+	vreg_conn_pa: vreg-conn-pa-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_pa";
 		startup-delay-us = <4000>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..e5a57a340cd8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1041,7 +1041,7 @@ qfprom: efuse@784000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			gpu_speed_bin: gpu_speed_bin@240c {
+			gpu_speed_bin: gpu-speed-bin@240c {
 				reg = <0x240c 0x1>;
 				bits = <0 8>;
 			};
diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
index 7393978926e4..0796d9dbe158 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -136,7 +136,7 @@ ramoops@81f20000 {
 		 * ABL is powering down display and controller if this node is
 		 * not named exactly "splash_region".
 		 */
-		splash_region@e3940000 {
+		splash@e3940000 {
 			reg = <0x0 0xe3940000 0x0 0x2b00000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a350a8ba48fa..c50ce1843703 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2927,7 +2927,7 @@ ws-pins {
 				};
 			};
 
-			lpi_i2s4_active: lpi_i2s4-active-state {
+			lpi_i2s4_active: lpi-i2s4-active-state {
 				data0-pins {
 					pins = "gpio17";
 					function = "i2s4_data";
diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..70c130c5426c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -46,22 +46,22 @@ framebuffer {
 	};
 
 	reserved-memory {
-		adsp_pil_mem: adsp_pil_mem@55300000 {
+		adsp_pil_mem: adsp-pil-mem@55300000 {
 			reg = <0x0 0x55300000 0x0 0x2200000>;
 			no-map;
 		};
 
-		ipa_fw_mem: ipa_fw_mem@57500000 {
+		ipa_fw_mem: ipa-fw-mem@57500000 {
 			reg = <0x0 0x57500000 0x0 0x10000>;
 			no-map;
 		};
 
-		ipa_gsi_mem: ipa_gsi_mem@57510000 {
+		ipa_gsi_mem: ipa-gsi-mem@57510000 {
 			reg = <0x0 0x57510000 0x0 0x5000>;
 			no-map;
 		};
 
-		gpu_mem: gpu_mem@57515000 {
+		gpu_mem: gpu-mem@57515000 {
 			reg = <0x0 0x57515000 0x0 0x2000>;
 			no-map;
 		};

-- 
2.53.0


