Return-Path: <linux-arm-msm+bounces-109716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDh3O0wsFWpITQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:14:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D45D0C7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 432503037DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065853BED5A;
	Tue, 26 May 2026 05:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRssZgm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nx7WF9x5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6514539AD33
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772424; cv=none; b=n0lSJmzHs/mhy3R+EfMR0hSSqK0jAngooEXtruOWsqfWjeP5KK3pvUx8MIPHUtWQeFLFsQllm24IdVzbKpH8/AmtgpG021uCzfpqpkARl6ST7bfLdTzKghOW36HJQwGWs9OMIkmIgWrQZ0zcumb5rN07715HFCFKRs7HXdn8exo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772424; c=relaxed/simple;
	bh=TaGuHrdQEmaPBnA/CUl1CYmu7x8Y8fKi02IHnxAa4Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6nxTbxGqyJgBw5zxmuJ3xZ43NKTAD+tqr+eXWydjqEthvIfSkPENDy9b0I0ovjCj7xxRw8Js/map69YOs3fplx59oM18TXfzkwUmw0PoPsHjOGUqHKjpCJ5umTaLpTxqvKlrGrgZ8N0jH1RE2l8pJNAU50EmxoWh91nXFeo+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRssZgm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nx7WF9x5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q531SU1802476
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=; b=QRssZgm1aCeEJDB+
	gghw1McaO2XxghAuYmS1adcDor9rVHOM/ulQUBClox059vd+YhzM8hbQ3c2oYfpb
	ccsjOt7rg8ueHcCd6wMpYfDagSZhk2qN5ypIEvIkCmXBIqWpcv9bYYNedBSwjyMz
	SUpHGX1qUQnXCWe5e6vdpnzOq82SuzywleixmotsUIfnp/jOPMlNgM1eUIPB5t2Q
	+AwO/nKDzSRzbygvmJ2wb2vpucCez0qUl6n2K7HWSFMH5W0YGY7tZM+llVxyVbka
	hbFg3oiLAufYyracHuTs2lh/IW23dkPORC35DyVF+khAXCFxtzck8YlIrySz/l+u
	btlVpQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqk29g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1361d52b3a0so7763321c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772421; x=1780377221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=;
        b=Nx7WF9x5pW8YMHMLUhVwG7HMeXwQZ6uSI4pt1h9D6gwnDv35NK3bF1cmmZSHS4OJtw
         Lm9WK9H3jTIdCRe2W0bWiunx5f0kjyjQiUa6b/v1Rmbwu00F1A/RlFImSoDrTaWtxCc3
         VuuXaChT+lOLo5vP12MaPMe+3tY5B1mDCHwc8iCUGczwB9JfuRbcC4txhzH/I2Y2jkSB
         LYwewxmLslKWk7Tq8h12BywUnFLAYAHiaJKJUazyqFWZvb2uePzLk1WRpm3oiB1agaTr
         Zo20GWWke1ulz3eNHmH1AJBGNq0xEBb2C4Qph8HDSEUKm4r/8ijUfzyGKj9/bXPKxMpa
         GGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772421; x=1780377221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=;
        b=PE/k3PQZkIAz4jeM6nsC2UzHaUavrncUrK7nvyndaa8lGKQV0vWZny1n/8XqYjsOEz
         ER/Z3nvHYa2EcqPUkhEBVxcpt4QkoBmneADFvWZryIw4jeYzy2MKq3BNDi2fWFuqI+F5
         iDESnohxlsIEMZ6EjJX9JmxMxQHd5GADbzJSYWzV3bx9OREuUDt28VX+FjKQz+sipMrC
         NfZRJjp1ULaIjpLVnOnJLyV9JwivIbz6wMUKcobzh/jk4j7iyVsnNuO2Y8FUXSxDjs5u
         8r/+IrXTnEbcB7XjDCblEtxyGuKjXfArH+DCZ8MFmk+fYiQsUElENVfYKudkVx2PNkXd
         wdHA==
X-Forwarded-Encrypted: i=1; AFNElJ9EWEiTWc0+30zIFj1RsMmimI5CjPyf2Er2tFtwmsjJwqwqQNW7odYHvJjOb8l5/BxLbsWbbADjA9deUfLL@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNz9SDgnXRz63W+DdmufR77vxO2vAc1PzVuShSC+nkOjPTuLM
	4gFej/vaRjToo73newVDCYLONJgBof7V8oF1Vf7ge6QTLh/4IRD9KuHdGuJLBuSJ3DvEQBOf+u1
	E5MJ7uQkYZTfDQcwamjYyJlKhjcRE8g+jQ2ruWO0rzNVBpZMQkOKzw5/Sl65wR2pMS9Mv
X-Gm-Gg: Acq92OGRxROzL0+7uqBZPY2RDwhGELd6JErskcrhupKdcLTjqG/CQJXMZGYGOXmpmf9
	pqOdGNXoq0XWox/ONHF61eGLULhTWMGL5OvzStUQNlPzvpF/hzZ3yBSycVoGYRv8b7a5tpaDFmh
	I3fzwZV248EMLefnmS0kggW5tVf8mTv0ja/uiL/HcYdpb/4Zml4KTUxTpZFYec98TkNBPqjYlge
	sr2nISa5rzNN8pbJcl1SO990BGkR4F51rHZ0VO69kFLF+0wFSUW37+ritATC0nxc3RVakATAVX7
	O23SUr+c7wBxG/y/9EuhV70zpSEoMfEViVBurbXfj3X3uxpvq25cuSTN9mjD6SC5mE9UzJgNQpi
	zh3Qj3qi4Vy/M5196GOb4f1YNG8sjVNWzH72W4ptcYU17SF3xxWFigDt9cN4PiZkpnzvJRruD6Q
	Y1yD1YRQ==
X-Received: by 2002:a05:7022:671f:b0:12d:ca31:f1b4 with SMTP id a92af1059eb24-1365fa442c9mr6107837c88.24.1779772421111;
        Mon, 25 May 2026 22:13:41 -0700 (PDT)
X-Received: by 2002:a05:7022:671f:b0:12d:ca31:f1b4 with SMTP id a92af1059eb24-1365fa442c9mr6107822c88.24.1779772420559;
        Mon, 25 May 2026 22:13:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm5423053c88.13.2026.05.25.22.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:13:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 4/5] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Tue, 26 May 2026 13:12:59 +0800
Message-ID: <20260526051300.1669201-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a152c06 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dQQo7YwDhi1l8iBccy0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: sEn-ryl6mcBodpU3Q0kGMZBKxIWgsi4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MiBTYWx0ZWRfX9ujdCVNWV8NW
 xQ6yid+xyYown8Y6Q8oyuyFyQMpRNGpUJ84uU3tfr6ShpRjdeysCE++CH6huACLT9mXHouTOKPJ
 MvRR6ZUNV3LeMP6H2QKOJ2DViW0Ry6czFtPWI/Y7GQnYr1T77qujGL5ytekvMWrVjG9mdNmtWaB
 z2jAxBughCYAl+kNEp46ybPSCTewzbnAbBajvXxKA372ZP28hybfl24ALQj4OLeGep5llqZ4DWr
 0qVw2vKbhoTJ+/xufHiY0xuZO5bj1X1lMJAxS9y+VY/aRwh8N5SzOFw/EhNlMbpdnZD1kzL+W1d
 Mr+sNq2lO7jzGy5SdjWij0PcmwM81pL6aw/2/Vf9pwgxwZAqgGwOSyAgmIuZK8IFK1aOG5XyE5C
 OHKGQXIvJxa/HyY44coeirQPTd2rNiHTlHAZZDLSkCOWO+HIqLm77aYfVm56dAd/w7tLlsD/V1t
 Rj469adFrciOB/jXlXg==
X-Proofpoint-GUID: sEn-ryl6mcBodpU3Q0kGMZBKxIWgsi4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260042
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109716-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 959D45D0C7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on SA8797P and Nord compatible. The SA8797P model compatible is added for
distinction from IQ10 model (Nord IoT variant) which will be supported
later.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..b10383ddb899 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -303,6 +303,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.43.0


