Return-Path: <linux-arm-msm+bounces-116662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TOxJKvJVS2qJPgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:14:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C670D68D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:14:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bYdUER0p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N+DlTrt7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116662-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116662-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA2C130073D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1EC2C027B;
	Mon,  6 Jul 2026 07:03:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26030677D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:03:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321430; cv=none; b=c5WrMFy9XHfZ/1Dod2DbPTtVvQrOnHSa+dWhMW6RUHYGL4hbqkHUCdW9JgfpYzuO1ZnZ2Q9Z4p4y4VxIiefYIGLr1Wol+XskAJlSoiT3cZkA+u5C0LOEV8VMz0NpdWCxYymirec+zhRY7B8xhYDsus5p3zQ8mHTn4uEgFo9sxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321430; c=relaxed/simple;
	bh=miD4Mgr6Yf5dkHoOBZw7YCpXIMq5bx2jRM7ayeGZN0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BaqpJIiNV4EEtI60IBLnaHISmGbQGLHI2uv/cGF+wAxhZEqZPNvT0U/gIzuyeONlTFkHt4evC1Eiwm6Nx/c/f64Tn4sf1s2uk8hACPeB/VKPVvDZhlKrSIuZpXiJMI3ZGnM0sk+++YcK6uEuolfbXEQBQpNx55ZdPc66w7iQAvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYdUER0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+DlTrt7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641lZC3594903
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kCIYPUxXkQWyMhDQQt60df
	6gXpnYv03MUiZGcW84po4=; b=bYdUER0pSunzdM8uyq+rJVt/br6Z1S6ZC8gapN
	RzIAOgZrwvVGqzON5mMSzD5kRdfrCIqwLs6qkKS3q+Ol6cnJ7E/UKGcZTjhkQJ3i
	8kNvH1V9ecQrBXUJcH8rK4UUE8M/sUnYMdJwtfylhuCG0gm6Qk0BYiwT9d1Im0FZ
	U9AhBMFFpQrG5jI6hh2mw0pZYWmdccrdNRvk4qaGCRhUb0ZWSDYRDx76upZZbVei
	lmE0De8VbgX0fy2xeE8niw4I9vJaJY8JXcTgqzOM7c8GHFheTTyhEESmaiRLcUPY
	PF5izXpt8V0yDUkBOXRoQJFbd/ElGgBoCL2lNOsdbLdqokLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgw8yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:03:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e68cb7a3eso506076485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321419; x=1783926219; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCIYPUxXkQWyMhDQQt60df6gXpnYv03MUiZGcW84po4=;
        b=N+DlTrt7MFAz3s87X3TxIGB7UgFF8/qDWwgLh2/otGUyoeliOgExTysTrDx8y+NZqC
         pPGXO6Bqh1hzjoTxL7rhXn/icIs0/+LKkSqPYG63b9+uPkNQrn1ggrFGyp6Ok8HRylIf
         TcdcoRRc0EAkA0zY4RckBWCVsG/bqIPpq+UQha7Vz8GgVjeo1ZUp4UKX7wfGIY4Pu9c3
         wDYiqjW+b5rAeLQpHrbR75dOw76mOQ1Q5ftCQcdyZMbcVEjPYAz7j7g4XBfF/JntNRNO
         Z+NU8mvpA4vQ/6qaDvuFiYeMto0snOHmAXohCmGXx6TeVEHe6uUxX2s3h2LBXv8EivID
         Yw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321419; x=1783926219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCIYPUxXkQWyMhDQQt60df6gXpnYv03MUiZGcW84po4=;
        b=DtXH02ewNMg0bUlIEcczSgj+Eyrf3PVrsosgaqUmJbrS4L+Q38GdYw9dtA+SeKvmUm
         3uv/YDACz2InjDiZlg738WkmHDW01q1Y4wsHiNrNEYbAHxJ66FWg7eIFG8I2ydhHBUtk
         mDVRPItiJUh3IVuT8jaAylHZZDe0pN8Y9Y36rSCoCK89iXLLdJs74Es886GDNUPHgN4k
         VPjzrzX+J0xTOEcqWQTvuErOftQTR61lBHO3WzXRDo0X+wuUQ4QzLoXJl3LBY24eAlr7
         KD6hjzIXuwX6nijqdY3a33tB/jLCep99LEg1Q6xfr0qTZNG5mNPqy8fKSNKGXUX1D7Pk
         MAlw==
X-Gm-Message-State: AOJu0YygY0HWRvcZEcNkEtnwoP/vvgI12kEkcg6NygWp0fbU8cNrXeea
	P99G2YLgapRCmYyqyl5EAxYX8xyqUyQw9/6jppnbmBAgkl/kn0u3KZIboUI39jn9jqoAiyAkpj0
	Q3C1TmIz9WHqYIq7SFiIyJrAcnF8yKJeVx7brCeKVFJdIs90tYdwDQzu4IJNbu8mvmVw0
X-Gm-Gg: AfdE7clmXs4wXn+ggLJy+q5ioGrxJI0BYDRo36VCqllYyTBCSl52NoR5z3dmCy8oqOA
	OoGvF/BIIyqptripJ4xNsyIBpfJNcH3gNEoeIdgAZrwEOV1CD+6SI/tDSlq4drUsXkSk/MBTBBU
	hQujvZX1R3qX+zXyOYN9s4K0oHqplfPsnQ16aQdkbJxtWr6f1y5S1V628diKZbN0B4/bx+yeXg2
	7oA8RIVzlQ/oIRPrJb4l2fsB1cLM1xyp1R81mqzSsGdz7wlqZDSg9M9/765RwYU5wpEDWlLEr7E
	5DMLprfEFJXxhBSTqd4137hpVfzn3kW4waFypxhdC0COa1Z/+LMx0e7FbeZiMTDS2/OlDlXJ5zZ
	4dwpQyB1hFWKBipy+ZKU/jPuM6oU4PU61V1A=
X-Received: by 2002:a05:620a:4550:b0:92e:5e38:8ca3 with SMTP id af79cd13be357-92e9a4190d2mr1240009585a.35.1783321418559;
        Mon, 06 Jul 2026 00:03:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:92e:5e38:8ca3 with SMTP id af79cd13be357-92e9a4190d2mr1240007085a.35.1783321418056;
        Mon, 06 Jul 2026 00:03:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Few style cleanups
Date: Mon, 06 Jul 2026 09:03:25 +0200
Message-Id: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CQAxG4VchXdukkIjEVzEuhs6v1AvodDQaw
 rs76vJbnDOTIxmcttVMCU9zm8aCelWRDmE8gi0WUyNNKxtpOWbnu05X9vy+gHWAnpG4li506wg
 VCVTiW8LBXr/xbv+3P/oTNH9vtCwfjIv8tXoAAAA=
X-Change-ID: 20260706-dts-qcom-style-checker-108a85dec00a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=miD4Mgr6Yf5dkHoOBZw7YCpXIMq5bx2jRM7ayeGZN0A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NAe+bBeSd4SbLMVT1R25d6OVs0h34Yn3a1/
 WLKie7zadyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTQAAKCRDBN2bmhouD
 1xhGEACWT+rqFgBvYTMEMf0s3TIxeLV8TbeV3ML7oLLWzuNIe78ykbQ2y3PmC7E0tHYi3ATqsft
 k9WF9jnY9RfV8bZP8xemeXq+i0IsH0NJeMyn8a5C8DWWxi5QhqVilhDkyYknDlVZwsyY4NmMyNJ
 KfSkdZUcdaKdHzDjEiitOMGTRwGZcjv4DtlAjjlgt5sv2eY7QUPISt+8hfZRvYfQGaFxteq549o
 +Q3kHdKxEeRjExXdmI7KVtuDXHE3uE2bYihDMaz4QbcBOQM23mxBcGTEtSncICwMrhwYhKuYits
 jyZRJsHvirafR/+V1NHZg7Q9oGq3E4b5LuXR1LkqxWcOQHz1/uXspoJufKX2ZR6ofQObouBN/wa
 Wl0TkeRYEung+Mt1UR81FBfiMbGs1V9vEXZuroxwNNvkIpse1+seGzzYQ5tdkrUfti9WAYSHlW2
 SWbUPfxxvusidkt3/BWWZENgX+n87hUBvQABFYq1LmQ2/9Zkg9edlpUTyQkG/+l7GgXzbHJaEac
 tdiOvwuUk58zWHexQMrR9HmoCKx51SiAjUFEieYaD6GW3KTJ1CrZQs/05nV9I04UMW8yQSPyl1z
 9/z3Zn7I6ypPV/46q8l5boW/997Tjt3tji+b+BluabPMLIR3MVH+YPZ23nvgUaUS+vJJvO06Qob
 J1A0OGkDmtJaReQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b534b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KJvvn_RG4jDztkv-m-IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0dhJMhhwiL2jnEas7ybr36NLr9sJFsDy
X-Proofpoint-GUID: 0dhJMhhwiL2jnEas7ybr36NLr9sJFsDy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX/fE9Tz2gyiRN
 hNjQPFqf/yyTrWcNpeGx5rpsYA8bieYZoq1EVcBTOZIbbTv/q2MzAaqA/fZDBrkFu6rkQsAJHVk
 mrMYBHk4esRjEYQm91Sqpv5i60nHyXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfXxCh32C9ojXDC
 feqhvoXzmJpyolWWdZGkymRKWLHx7q61I6ddGW2a6hWKVfBVNz1NKeZaRKQAQMsUVa2LpcG5kLN
 cNsDlZObdA8H2uIFXHPtofRZEjwXWwqaobaotpXMMl63GsI5AQM7if8fg5f0fTVJbzmBWa8Wv7i
 tRIVWo55C/BH+hCXklukKqftJtCyMo2RuIDIyFZO5/75eYdjWsHAQtUnRZlwDXuYAANUPr/fJbW
 5H75s5qJ5J6nz85anqfzUsqL10bZRFpy481uCQktdo9Nq0hbre5jywIdpBpnQtXAkiG0LUWZaTS
 3ZJ1DpY0rQaDSoqoEsmpvk6gw9YtkL1xULNdoJuI2JCe30gDhe/9XZQ0xV9m6//a7Irjrq73+76
 e0gG7r0dtrnBq12uPjC24wRp2i6GhlyLsG1kqQ3QT1PaRvR5AHVjd/BXk/SW0g7eGaq9/9dmTsG
 6qRbamJvSCrjx1isLCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116662-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 190C670D68D

Few style cleanups from my scripts and one thing pointed out by checker,
which we will roll out gradually.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: Use hyphen in node names
      arm64: dts: qcom: Use tab for indentation
      arm64: dts: qcom: Use lowercase hex for unit addresses and values
      arm64: dts: qcom: Correct whitespace around '='

 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi      |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  4 +-
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts          |  2 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso |  2 +-
 arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso    |  2 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  4 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   | 20 +++----
 .../boot/dts/qcom/milos-nothing-asteroids.dts      |  2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |  8 +--
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  8 +--
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 14 ++---
 arch/arm64/boot/dts/qcom/talos.dtsi                | 64 +++++++++++-----------
 16 files changed, 70 insertions(+), 70 deletions(-)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260706-dts-qcom-style-checker-108a85dec00a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


