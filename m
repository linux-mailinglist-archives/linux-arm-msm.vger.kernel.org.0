Return-Path: <linux-arm-msm+bounces-117917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LOwXGZ1iT2qrfgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:58:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0034072E921
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:58:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M2eC1kdV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WLZR+Hjp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117917-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117917-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EBE0130690F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1506F400DF6;
	Thu,  9 Jul 2026 08:52:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290E3ECBC7
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:52:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587145; cv=none; b=pqqtsq5izJWTyhStM5GKqWQ5c/7Fv4z3PST/Psj0pqnx04n4HHlSVEjBfcvSedGS8s7PLKajzyFlgtrIqwH3OGt9uG0VqHWA4C6bkD14Ms7eJBvHHVHNjQBI2UROwHCVODjdOmmue72FnEsPPWzFraczM88vEHnZAsDjnETo0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587145; c=relaxed/simple;
	bh=CEzdu4hjCxN900cClvyfjf2+rQRO/dcw4HTOGkcHk/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RMIasGVEitL7105mnRJQCngpWPgP/D4Iv+pHveBDUcWDQknK/PomF2POnPqjkv3ch2gNhawGrsHMozEznnABlvqVbvh7DsIQjojyHII+brxPuWwKlF3o/V65BHh8R2/BZG0V8XmXmBTQdFGp819i21I0ZQL9mwAK2MeLIDWxGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2eC1kdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLZR+Hjp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960HEi887963
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/
	w0Xh3O18=; b=M2eC1kdVmHYcfwQrMy4CsHCN1RhDZ0ug0JVYn6JbknYNm1ViHON
	2JSh1aTN7990OtfdTuq7XBJT7AkOMyKQfmo06MPqIG4CGtsn+gC4I1J0ugHt9fgv
	5HeoANfsZ+Xrk3D3iwy5dSI6BuLuBU46TvBb32QxDBb24KBI9GItQWu6Pb0GJsX+
	KyC5CEu8Gq4IEcWk9V0l+5T0FxzFrAflrnmxtPOdxE0SmpzoCx9qtgDK1CofpGQY
	eQHFBaeQLAxBWBXbFkmJZIgoOGCRXsjAiFa7BizL0gjMIc8aZ3DIKjcdlKua4DSh
	AMARs2jY51Y/Qr53n8rPAt6OR6CNz49kVOA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33new-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:52:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso3021071b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587142; x=1784191942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/w0Xh3O18=;
        b=WLZR+HjpHDrl5ql6YjC7Bn+LHyp6qBAJqNJZGweX1IruTsH87og7qLSwGFll4RpuSP
         PiWJi6l6oo4yPK/BSJu8CToXr98Jw0KWVrGFpXAfsNYNUl6nAKXslUGa+lMClEAFYFuG
         C8V5LPXYriZoxxY/r+e2Bg0w3KgXg0q2o1GT/MGeRVar5UD5eosPcXjhyp7+Zijc2pR9
         wIyuszO9naxTkls1INg1/iCDEoknpQ+vM+10KzhN3dKseROCmNRAOUythgG86wLAGypz
         Isfvf50q7QXx7eBLp2mu9QTH97NDhOKJSQ6nMxdeBwt3tHrwXk8eVkDyg//oEiLR0MjC
         yXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587142; x=1784191942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVZrXg9KekARpSXHiVBpNmROGTY7fe3HqB/w0Xh3O18=;
        b=Z4DCKk/etgdo3tEJtsK6vPq/KlsNBDcCI301NjKPh3C2XM/g8u2UHTtoIoRtO2EnSK
         VAR3X7gnUHGo1zBcDkOUqssD2GGqOMgTs+PzpjpAulLfRF/DqfxsDT2/vLrppRbgPQlS
         HxUEDHf4jsT/QqryEjaTY9OoKGXxIkVpzgR/6czhOYdxNIvq5DJiB94L7YzK3PPCQ/rA
         y1ls5C8ZLHnsq0HXRqe71TflnN86oQ6nQgy0gwYc3EoyREBOABtSCKhSEWxh8Teum+aM
         Ej8SCLL/zirpw6KfI11z4SxbqKzk6XjlLrv/i86IN5Q3JEkOaig+K7DMHFCtW8zTfe15
         BE0A==
X-Forwarded-Encrypted: i=1; AHgh+RoiR0suHzGQiJ+sRuM/5l2YZszxbpj3WNoQYki6g9cDOGeRqiZsUlBUQqQ7Nr/7EclhxvGxuKOz89Q92io6@vger.kernel.org
X-Gm-Message-State: AOJu0YwP4MW0oF5osds6ciEFLGBUGWogSp3LohjDPbyy1aKB4fqTV1YA
	kg821gVUJMi2+etoPD64o/J/s1wg1Sp5Nvx/J/B/ExHUXTMEAT6TGgFUuS/iRtsqCYYJyusFgYq
	lc4/x8MWKSzYj80QDiA0hlGJv19L2bXRBNcKmxyGJKWIE3xihp+fUmsl1IbpVBmNCKwDF
X-Gm-Gg: AfdE7ckvkBZHsQUOYUICg30T+GNKyzpqg27boJFtqq2eoOaqryK9PBakN7yUZYT5zmH
	VeGt2M+3XRZgQsO3hPdh5JmVeksBzMO3Cu9bsM7K5ZSqwTnIwM78rc0Te8ee7TUc+0GfwTklv1k
	Rq7HF2YfaguV+cNAtAvewpXjMJ5zRC6o4K31CB5iavYGN/PrzhFDc5V3VQ0ALYI+Ico6bD0Tgi4
	nSBGEceL2GWXyYbEr5rT0S0TurIN6o0iV4y8hDV7viRuW2K3aXyNIPTYJJEol+xkQNtHrmLUghM
	jU6MrfsIWiLBb0o7jEUGkKAfERzt3ahgCnQ9NO64xegJyV/poreF190EnJNf6UnhQX8fv8S4IyV
	qdSb8nipbm9g7AvMUjrSdpHJdgkRTsRHqSEcAwCg+wZP//b9wIIFwhUfAEZPpSaVzjGFE+uM=
X-Received: by 2002:a05:6a00:170c:b0:847:83bb:9b94 with SMTP id d2e1a72fcca58-84843424973mr5718339b3a.48.1783587141619;
        Thu, 09 Jul 2026 01:52:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:170c:b0:847:83bb:9b94 with SMTP id d2e1a72fcca58-84843424973mr5718311b3a.48.1783587141169;
        Thu, 09 Jul 2026 01:52:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] Add ADSP support for Nord SoC
Date: Thu,  9 Jul 2026 16:51:46 +0800
Message-ID: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BYuO6qNJN7r7NGu7lGf2O5NnM5ptpKI4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX0pT4XmVbHSz0
 RJe1rZwVMQe1URPbflVZVT1zoCVJqPjjVUYanOJzU/AxQQpNhtKdcb636qNs879VF11IcJaX7l8
 TV5zQ+xl5O1KPWqdjBqK8pnUAnGukcSujl9jnGBa+k/Lh3KOqc1hRqcNhUfDvuWeO2W5ulftke7
 QR7g7OQ9eBgrWmcscjjEEYv3ncLA3nFKXT39pmsh56ZvL72T3twGU0ONsEb3C/ljSVAQwbAi9wV
 7TOBUO+EEOylgF0TP13+K5pHke4JyHEPAfLmXAFwjevTStahUpFSPRl2go2JRc41fdz6YzTO9Qo
 zw/w19sBUfj+Nhm7QgDTjOp+ofdUuEscDdTRcDLXowZNfcsNhVa7IbQfzlj/ARipYlfiEOtwell
 hKZRZePz9NzZRgn8P7NbD8UVlik/axRGQD3Cgez6tzvvnCccL4rYW6QQLDdlY/BFDere/uP/7T8
 QqWAXxTn/+5qwZjHmNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXwQxn3Rudsuh5
 yEcXHbfOzgY9pahmEJjqQMLJ/vNUwjoqFiRmZ9XEHP6YnBKKU+21nayi0FGDqYbGeEo9VUldOLd
 KDF64i4DJth28Jo/n/6w0Tg3kOhdZoM=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f6146 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=H-xtdE_VxQG5-1k7KcYA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: BYuO6qNJN7r7NGu7lGf2O5NnM5ptpKI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0034072E921

The series documents AOSS side channel and adds ADSP (HPASS DSP)
remoteproc support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,sm8550-pas: Document Nord ADSP
  remoteproc: qcom: pas: Add Nord ADSP support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 19 ++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 22 +++++++++++++++++++
 3 files changed, 42 insertions(+)

-- 
2.43.0


