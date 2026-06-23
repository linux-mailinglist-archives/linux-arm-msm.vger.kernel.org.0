Return-Path: <linux-arm-msm+bounces-114146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gBlmLgZbOmq76wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:08:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC86B615B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:08:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ObLtrWxK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pwos8aYF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114146-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114146-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E67930B8C92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A1330D3F6;
	Tue, 23 Jun 2026 10:05:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B2B370D43
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209144; cv=none; b=OHi8n615oiZ3v8YO3mV9KIdWp0Uif/3qoV4QS3gDIIVdAzqEFpC6STWA8BhNuGPQ6okIcwkDr5LaNfH1RpgBit54wyMe23fI1vXUmIsJzurgs0IKoIJYRH3/gM+T7KK2LGzIo5Li/qIoX9h/GCSVw2o59hnP9Z5vWbBxNigv2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209144; c=relaxed/simple;
	bh=nXiAAawPLhLJRJm9YSj4W0wPzaTUh1FOFk1/klJrMyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fY54jZrUa96Vi0MGWQfELDHxFG7LxoPCzkoVPa6NAZSjNGFLyKqZ6xj0eV3OxrCPM3Bf7ZS5/GyyrHLM7Oukr5NBLUZIFv9k6FZwhYIE7h4/47yrGswqU9fZAx9YDDbdNYZDd/C6G4Pcqso2EoO4JpyR43FucKWV2fdzOKa0ufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObLtrWxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pwos8aYF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8UvD43243530
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xeHnULDfR0iY7GZfQIgnT5M4WB6qHmJdqawGsun4bM=; b=ObLtrWxKEDNxJmHy
	xckJcTUlCrVo3mV63uUk6fONTC+iDEpbOQOYOnWnZ3nHlPAAmIyUohu/Mfweif2t
	s/oFFashmlC9cL8JFnMtH++/33YbAwD6TiVAkptRxXFUOS1PSw2tz2uRL1jBPgL8
	lu0PmGU8ghZjwegbYzXOLfhCHkWJzH03UoHxIPLv5ckRtNemVYAMo2whhrB9nqiq
	c2TxI1/fqcNCSzGoD+jLWGlMD0cWD06s1zAtBHQu8GGjBQftzmIJ1oiK2WSyRQcv
	+Rd+ocneZi1M6uT1pBunByVOJzh502wsGeXpXxS6qV4QhrpmEwpuag4YEZ+GL3aV
	bYd+RQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyge6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30b877ee493so1023174eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209140; x=1782813940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xeHnULDfR0iY7GZfQIgnT5M4WB6qHmJdqawGsun4bM=;
        b=Pwos8aYFcU0dF+876dEspzQHzJiY83mEZu9Gp5eMQxRbePbEty0Kw0gBM2EUpDLltg
         shLGITWqhwMfquvnsqBHb7Zn9BNG+SFgO5XmLqQJlgOrTTa5iWWh843WnKBT16mwjBXA
         dDZW3hzlleoYyjkZtaSRUoerXPBHeP64S0TuwaAMreP8moNN7g4oPRa3UxOD03JQioOg
         YkoiNM+PfLQYtgvjzupbgsxPjCFcOg1l+XouhVkA3CR29x5/SEiMLisxjhcr4ROrsa+Y
         zFQjPBxFvSItjNOuaI/OJEE0m/rxMBuO+F05lP2HPUoKMayYZsdXH/MUCjfEbCiU6v1E
         4pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209140; x=1782813940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xeHnULDfR0iY7GZfQIgnT5M4WB6qHmJdqawGsun4bM=;
        b=LC6/gH2Yf8QNa83GYi5JYZVzdh7U7Rwj1G8wMbXL0In2h2Kh0ajAmA42RIw9FpiVgB
         +62tUdGoYfi2WW1kFr7PFWrPE4VD2mS4s9rwQfvyWeFDPGNjPETSAjKIq60TQvJcHPtS
         tmqDhpiR610QfenOFRmMj2yeE9v1hLmXn4089KSqQTWtR1xEWU/A1mCR/oFuWJJowDHT
         s3CRxgi2f+97pgBBk7NwHKQ9P0YERYDONi89fpmUMjR6sYNl0xZK8pW0/qI/Kmx6Qxk1
         U/lqQB9b47dyJS1eC1HEdH60UAEJ8vDm6ZKvvO1Zv1GR0ub0ezSbjlA+UG7jvZLl8FlF
         2HPw==
X-Forwarded-Encrypted: i=1; AFNElJ9b/ZjcMXfDJTzEqF52JR3vhlJbnTHPsbdefJNL2ibK3hDLJ/3AYsQmnFzlVzHLlWM4FbBhBxAwjY84MVli@vger.kernel.org
X-Gm-Message-State: AOJu0YyrVBIrFsbC2GxAamUmJElqZYJ9IwnA/B4u95SkQVXMrVx5lmO5
	gZTA8oQENl9SlCHUQNfTzhjuPTsvzE2cwEIjJ0eV544Epx24t99sW2NkbU93OvnZsWiyjJvHP9I
	oy4Zf0o3QC0/Fleu0sgXBGeWolJOBK7pSiMaQSC1lxvfx43cgH06tGMK4qtgXCEg7qg/A
X-Gm-Gg: AfdE7cmVoy4n2I7EOyO90hG1ffDmjn1Oa0HH5xZKXYbUzhAPxIWqyX8vVQsakc30h5x
	+FYAsbejrUwcOOTjtYYKyHbSYgWASXoW3y139gkLUELcPpTPizBH5Uz7JjsIQ6Hlf5Wy3wVDFUo
	X2Fvu5s3GZsffr8H7qwAJgnamjkzdB6uIfalsVGMAO0JwPOGVzWtWO5Q0KcURNqaV5BeCY/Ckgu
	RRptkJMDvDmBEJBIgCBw3g6xItwLsPou3nxd6G09jBvgJ6xTSrgdrQDTuqwxBkntVIe6Y1/rCpq
	FBVPcRU7CH4Dyc7F5PNerbVgK/TgLlp355F6Jp+kt2fICKQiCTDUpuAmiOx1PqC2vdoEs1NcXey
	3BSGAJSDQ67suBwaKvKJB3AAaJoE8jX1DVkRx4rs9YBI9LL40JTGEz+vlIoIABg==
X-Received: by 2002:a05:7022:410:b0:132:133f:63a7 with SMTP id a92af1059eb24-139c3c4c40dmr1889575c88.8.1782209139819;
        Tue, 23 Jun 2026 03:05:39 -0700 (PDT)
X-Received: by 2002:a05:7022:410:b0:132:133f:63a7 with SMTP id a92af1059eb24-139c3c4c40dmr1889532c88.8.1782209139182;
        Tue, 23 Jun 2026 03:05:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:19 -0700
Subject: [PATCH v7 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-3-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=16906;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=nXiAAawPLhLJRJm9YSj4W0wPzaTUh1FOFk1/klJrMyI=;
 b=BeTaDy/5mQ0UDAQ4GOU2Gd3nX9Mcksx9QeDR0RV0D4y78O0r4Py5381x0VyuEgPK9qxzC2bXQ
 GoCzFYfGRZYDmvlJ9YwOmkbKkQi+akCc0kR3//1wd3LdkZIvkTOEedB
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX5ZLiiJyx3YMB
 PXckigje2Ix3gJN1b4DYz0yfhCKM+eoTCei7tjOSxUkjUbAFSE6B5+MBLpEi0TZo1yzZk/JcwQy
 FZUm+zhjNP5TEOtGfoSzUUS5us+M3DBROyzNuCNFNWH8jzaQubAKDFeM2a66Z3fISvm1Knfs2ge
 1RXFgnwE8csldd9sJMCa1UBjSNf+wDriR5t0c7DLwBGGw4eSWMrruzkcZOkQ4EP3j0StlFe/Mzq
 3G8GwGaIOu2zQ4VtPOgIpgcD99Yg/EtplPTyoY8sRD+/Sol0PxubznlporskpredespA9YF7V/d
 CpxMUfBFxQ/BwdijpI9SnFJi79eTJJnzmYR+IqU01WYZ9Eigyaii+1lIMz0+Wff3hlPDXuVdJ+A
 +MAkDa0+T2NWbIf2jx4Vu1Gb91BHv8aUNrMDi7LExEWasEqbvDs2j5trnrk+DBSurKhknHCqMb+
 xznPGrFlVP2/0rL4HRg==
X-Proofpoint-GUID: PR1F43CisYvXe5jM-ysog--WeduKxlUj
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a5a74 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HRkYIiX3aUEsQExlndAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXweOSQ6W49NqY
 27Y2Tt8MB5W2USM9wVjsSaW9iW7YBV7gy3mg7pduDVPEn+2jMR6/fNpWjElOaYflZykahyjb7+6
 Rx72PB1YSlyh4QgaI/SST8V2Q8+cgH0=
X-Proofpoint-ORIG-GUID: PR1F43CisYvXe5jM-ysog--WeduKxlUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230081
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
	TAGGED_FROM(0.00)[bounces-114146-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BCC86B615B

Document the component used to boot SoCCP on Kaanapali SoC and add
compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
and add maxItems constraints for SMEM properties in the documents
that reference to pas-common.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   8 ++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |   8 ++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  12 +-
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   8 ++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   8 ++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |   8 ++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   8 ++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   8 ++
 15 files changed, 269 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16c35e15ee1b..7e8ecae8e6cb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -73,6 +73,14 @@ properties:
       - const: handover
       - const: stop-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - memory-region
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
new file mode 100644
index 000000000000..ce18460a949f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,kaanapali-soccp-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali SoCCP Peripheral Authentication Service
+
+maintainers:
+  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
+
+description:
+  The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls USB
+  Type-C, battery charging and various other functions on Qualcomm SoCs, somewhat
+  analogous to traditional PC Embedded Controllers. This document describes
+  the Peripheral Authentication Service that loads and boots firmware for SoCCP.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-soccp-pas
+          - const: qcom,kaanapali-soccp-pas
+      - enum:
+          - qcom,kaanapali-soccp-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  firmware-name:
+    items:
+      - description: Firmware name of the SoC Control Processor
+      - description: Firmware name of the SoCCP Devicetree
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal the SoC Control Processor
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - memory-region
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #define IPCC_MPROC_SOCCP
+
+    remoteproc@d00000 {
+        compatible = "qcom,kaanapali-soccp-pas";
+        reg = <0x00d00000 0x200000>;
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack",
+                          "pong";
+
+        memory-region = <&soccp_mem>,
+                        <&soccp_dtb_mem_mem>;
+
+        firmware-name = "qcom/kaanapali/soccp.mbn",
+                        "qcom/kaanapali/soccp_dtb.mbn";
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx",
+                             "mx";
+
+        qcom,smem-states = <&soccp_smp2p_out 0>,
+                           <&soccp_smp2p_out 8>;
+        qcom,smem-state-names = "stop",
+                                "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_MPROC_SOCCP
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "soccp";
+            qcom,remote-pid = <19>;
+
+            /* ... */
+        };
+    };
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index d22d50c1e1ea..99d7337e58ec 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -69,6 +69,14 @@ properties:
       - description: Memory region for core Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 3847aadfa980..11faf655f530 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -46,8 +46,16 @@ properties:
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
+    minItems: 1
     items:
-      - description: Stop the modem
+      - description: Stop the remoteproc
+        items:
+          - description: Phandle to the Shared Memory Point 2 Point device
+              handling the communication with a remote processor
+          - description: Single bit index to toggle in the value sent to
+              the remote processor
+            maximum: 32
+      - description: Ping the remoteproc
         items:
           - description: Phandle to the Shared Memory Point 2 Point device
               handling the communication with a remote processor
@@ -57,8 +65,10 @@ properties:
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
+    minItems: 1
     items:
       - const: stop
+      - const: ping
 
   smd-edge:
     $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index 5854b3d2041d..bf9bf1af9ff1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -59,6 +59,14 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 7f287e55896e..dda2d144b720 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -74,6 +74,14 @@ properties:
       - const: handover
       - const: stop-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index cb0a61fc301d..b20780e5e26b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -68,6 +68,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index fef9d7c39f3c..4bbe4a986c7c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -65,6 +65,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 2bbd427c6ea4..8c16b01c53e4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -71,6 +71,14 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 987fac433fae..454ba82bd6f1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -71,6 +71,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 53ffb1ccd199..42e02c64347a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -65,6 +65,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 6823a2a8d74e..274f87880e2e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -61,6 +61,14 @@ properties:
 
   smd-edge: false
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 8a1fae095a3b..5a7c5f8c92d1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -81,6 +81,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 4ea7518db537..72d0db5698c5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -75,6 +75,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 4721c04ce09b..faf7b2890de8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -95,6 +95,14 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  qcom,smem-states:
+    maxItems: 1
+    description: States used by the AP to signal the Hexagon core
+
+  qcom,smem-state-names:
+    maxItems: 1
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg

-- 
2.34.1


