Return-Path: <linux-arm-msm+bounces-113707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+7PBDi1M2o6FQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:07:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C034169EB44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:07:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZeCJXr+8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LAXlHDdt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113707-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113707-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8905E301573B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7813890EA;
	Thu, 18 Jun 2026 09:06:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D038735D
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:06:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773618; cv=none; b=er7NNknVjA7m/pd008Aqd6NVAE49kPdjI+TsWBagwMaSyefG7SjvYoFtIQoFOskIjh1JY801vId8t1A6qYCcuLSHj+fSH++eEDIkR02EtvC9j5GAiEiOvtp9vAMPPGY3bpJS52qOo5vS9JWOJzNkI20m3abDxVMIjuOR/nPn7AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773618; c=relaxed/simple;
	bh=gMNuC434sw4TKzykgftS1a7OahablvxcxKUTW9ITork=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WuBkLIx5pluCwCLncJ+aSuIg5qCHlNeU+WkWZJRRE5I6DnDCquSFvE9rQuCDnWMCrrj5+hDC26ZHcZk2An1dyvR9GZl4PCr5YrpSceBO8Q5OJC0NCwHfNrH6wpJ433dGFZ3kSI1SoIBHC/5XZk129IBvklA3ywHO3884TlQ8rmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeCJXr+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAXlHDdt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G1dI1157428
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ix8aZoWaom9SOXXSlu0otD
	Uo/c54wwMpLYm40+hRjqU=; b=ZeCJXr+8Ja40r5bX9mwi2tAogJhtqDUDziZo87
	4ZkDbXi1VtDQxX4AGc6LpWn85p8pUA81mVnzHrTNawzNmqltO2v8vZvP1BSzyWY4
	bAE19cYqJUV2F/NOPLBIBuKYRgBclOXTFv8q6NuXNCfFywuaON8wjb6LdZNKe27r
	cRaaitASF9NTZ5CtjDzLb1IX5XCj0bTZxnNAWIIlwjcyTzx4SdiboLjNuEHztHwl
	k7f9GwKzz3/I4g4d7VQ9TgcKLLcG3TZYs6omHlCqHqPFjg1DwqJI11RbpwSFrkT6
	jvGZxzOZVxqJhw2YIL7JwKBGClCPIuNl3J8yU6jSwlhd4TeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a2nwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:06:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37ca93a9253so490293a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773615; x=1782378415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix8aZoWaom9SOXXSlu0otDUo/c54wwMpLYm40+hRjqU=;
        b=LAXlHDdtFzY73pco4cr+DSSzwigWstGeFEiJ6kpwQ6ZsPThh4jF9EQs0S4wIORiw/3
         W8/JyZFhhhzRYf9877vwXMvagJM3NOeQnPbvYDlBpVc8lfvWeOQAFEe/Z+YmjHGQwniW
         /wokKqc5qiZvhPghjSbV4tYQfidkCXvMMtXObK8/fG5cSZnhjJ4adupr2ajT49sz0FI/
         ijOdRGNhYrvoEopkrq51icL2rruEeW4C9p+k0Ol3FI/GAO29igvEfCh9Gd+zXzzGCDrs
         4mA4aaP/PbgDmJXvvqS5Nh9zTzGRiDSBjU5+xk61G0y23pj6liN2gvLahsARdFKAfklH
         QuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773615; x=1782378415;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix8aZoWaom9SOXXSlu0otDUo/c54wwMpLYm40+hRjqU=;
        b=M51h30qKWxJgdBNbcU1mHEsFcYs8j3cBYlnkSxcLE3XebOauSY6ZEmJi2gp3/DmYY1
         BrxBIcS677bSpSQ3CT6go07FwE997/jZVuftYu9BahPukJohGOBM98Kv3HOdUQ1sfzAN
         cJV7jWazmMW2ApZi9HNjVzUm2fKjXtbsNEGldEkwQqEXADi3hQWNJzC98aX8nMIYBHmj
         lN2/w/3YHQb1shfE/TN3q2K6Bpa/HLfb52DjIy3qwXru1RlIOQiEfM7oVWw9E/8KuxaU
         9ZMUT+4DCJPQzQ+BoG6G07z30Z+XFmELh30UUnIUIYFINHm6BFM7fRIjkaIm4exEn4Ys
         OhrA==
X-Gm-Message-State: AOJu0YwdKfjSDLGTPU2pzykKFSuQYKkH7WPWGsEKLbAfcFXqzvyI1Cfg
	oc0A9OOyUln8DUc+pCTsY15h8dc1+RUcRDXphz+Q+b/XpjSAzDegtNKtKX3iNrypurwHf9Fy/2e
	/HaExcMUNE7+Vm6TSRcYKKz1VPdSyhugRa28q2vdjsxSwENfZDBOjMiNXPWay7cCYPiZ5
X-Gm-Gg: AfdE7cnOMpgwN8Ca0T0Ucx4Gb4DCE3zINz9LjUMbpUwWjOFflKmfjMy4s2CU7ErRYuK
	fO3JFdqXAWC5hbdw9uHmiTXQHNKYF6Jz5znyvWBsniA8b8Q5iLmaZJnYIG0uql1lUHljeIVcZ2F
	4pHSy1K24OvmKpcZWzHknIL+y4PYstAPx046D4tHwhTzn2eR2BiChodqEzftkpBchOm4QqkOUV1
	RuweTVxvB+xig62iJiwZkXIXUV9Sy4HY6MGDcHmCKTS9SNYM4ZpDlXHDFDxn+0Dk897ZPXjvy6J
	+zMJYXFAwcW1OUAtDgojCe9JGg8NoLBS5tOQMIUqfCbbuPd1H648CnAPAtxk+SwQ8uFUVM1MpyV
	q2d2JOiE0DN5tDnAz5jbnIENXb5eblsdvJ/Ljm44fBjIV
X-Received: by 2002:a17:90b:4fd0:b0:369:c5f4:9681 with SMTP id 98e67ed59e1d1-37ce86f50a9mr2018933a91.22.1781773614884;
        Thu, 18 Jun 2026 02:06:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd0:b0:369:c5f4:9681 with SMTP id 98e67ed59e1d1-37ce86f50a9mr2018883a91.22.1781773614344;
        Thu, 18 Jun 2026 02:06:54 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac794sm192112835ad.46.2026.06.18.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:06:54 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Enable SPI on SA8255p Qualcomm platforms
Date: Thu, 18 Jun 2026 14:36:38 +0530
Message-Id: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB61M2oC/3WPy4rDMAxFf6V4PQq2EruP1fzH0IWSqo2HxM5YS
 ZhS8u91OgNdlG4EB6Rzr25KOHkWddjcVOLZi48hQ/WxUU1L4cLgT5kVanTa4h44UN0xyOAhBhD
 aobUD7IxzTITomlrl2yHx2f8+vF/HP5ap/uZmXGXrxjnFHsY2MT39xqDZa1NWhbHoXOXAwJBoZ
 g7FSB0l/xlFip+Juib2fZHHqmq9jDFdHz/MuEb+1y31m7ozggaztdsqh9YnV756j8uy3AEgzhz
 WHgEAAA==
X-Change-ID: 20260529-enable-spi-on-sa8255p-8166eaa226cb
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773609; l=3945;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=gMNuC434sw4TKzykgftS1a7OahablvxcxKUTW9ITork=;
 b=zkFAEEa1kiZ7dHdF13gsj3SSU54BVQqkjsCJblAgD6EwJi3DHOszxlc3JP/ypJZnlNKgzWkdI
 UPfBbG/zW/SAOvezYNHaI6qVxS9XTaip9jqEnolkwFE0tcmcrlDxCod
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33b52f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=WbIzMIUDzaoW2bUmmBIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX98yhDHSe9BM1
 Y3y13nPo9ecJjYLNNgA7SeRXs1KPSfmrlxotqHTuobe4Yzc4tEO4YwSjNkpMuyidRGKM01rbrx8
 4XCqW817djkE+LYEanGM3/kGW6N5ivk=
X-Proofpoint-GUID: hWilmDgib9vwtVAIEkRZbQG6QG4oJlEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX05MwQhyfH+uj
 jc8b6veWffn9JhtMCfK4sUyixWmbezodE3ihezTC4E7NP48oHfjLJRQYzbWphCSyRrs8JNNXZh0
 UIsK8mo6QxhG2yHz9R4wkcy78A3ORYZgp1HweURTy2A+QZ0fBEsVOMd+iVaRqjKZx8GqvKNeH0E
 C39N6/8n+BDFbP7vQimsbABohn87R0zPZuzQx7+KGlebSuUDjbFoy6zVfVf5WSXO/5q6GKNrbs/
 zkQSTecQbup+1+qpj7ItAy7idcEP2MJHt1DsTCGnzU/VnSdRtpDQqVKMxyrth0Hz61tWGZEoYFE
 w6XjfeHAHHxe9XZ278A+v8VDxqivdoH9M0nenebsXe8yaQr5TjdoBLxfW7T7EuOz+kyjhWdICI+
 6cpHnHtCgPg2+CV6NAEZyFYB46uGIVJQxX/bjC38Vi8KYHWvJsTZ6P182w+vd0CsyYh7MTM0rRa
 8qZaZ1s29XXRKHn3ndQ==
X-Proofpoint-ORIG-GUID: hWilmDgib9vwtVAIEkRZbQG6QG4oJlEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113707-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C034169EB44

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Praveen Talari (4):
  spi: dt-bindings: describe SA8255p
  spi: qcom-geni: Use geni_se_resources_init() for resource
    initialization
  spi: qcom-geni: Use resources helper APIs in runtime PM functions
  spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

.../bindings/spi/qcom,sa8255p-geni-spi.yaml   | 63 ++++++++++++++
 drivers/spi/spi-geni-qcom.c                   | 83 ++++++++-----------
 2 files changed, 97 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml

---
Changes in v4:
- Added Reviewed-by tags.
- Added return check for dev_data variable.
- Link to v3: https://lore.kernel.org/all/20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com

Changes in v3:
- Added the OPP rate restoration in resume callback.
- Added missed dma-names in example node.
- Link to v2: https://patch.msgid.link/20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com

Changes in v2:
- Rebased patches on latest linux-next.
- Link to v1: https://lore.kernel.org/all/20260112190134.1526646-1-praveen.talari@oss.qualcomm.com/

To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: bjorn.andersson@oss.qualcomm.com
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com
Cc: aniket.randive@oss.qualcomm.com
Cc: chandana.chiluveru@oss.qualcomm.com
Cc: jyothi.seerapu@oss.qualcomm.com
Cc: chiluka.harish@oss.qualcomm.com

---
Praveen Talari (4):
      spi: dt-bindings: describe SA8255p
      spi: qcom-geni: Use geni_se_resources_init() for resource initialization
      spi: qcom-geni: Use resources helper APIs in runtime PM functions
      spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 64 ++++++++++++++++
 drivers/spi/spi-geni-qcom.c                        | 86 ++++++++++------------
 2 files changed, 104 insertions(+), 46 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260529-enable-spi-on-sa8255p-8166eaa226cb

Best regards,
--
Praveen Talari <praveen.talari@oss.qualcomm.com>

---
Praveen Talari (4):
      spi: dt-bindings: describe SA8255p
      spi: qcom-geni: Use geni_se_resources_init() for resource initialization
      spi: qcom-geni: Use resources helper APIs in runtime PM functions
      spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 64 ++++++++++++++++
 drivers/spi/spi-geni-qcom.c                        | 88 +++++++++++-----------
 2 files changed, 106 insertions(+), 46 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260529-enable-spi-on-sa8255p-8166eaa226cb

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


