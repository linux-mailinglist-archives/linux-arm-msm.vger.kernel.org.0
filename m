Return-Path: <linux-arm-msm+bounces-117511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DnhzD4XrTWpwAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:17:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 189317221FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CM/SyB5L";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fmn2EeJP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117511-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117511-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 682E43007A46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009613B9D9D;
	Wed,  8 Jul 2026 06:17:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81E3126BF
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:17:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491451; cv=none; b=GN2vD0HRoGUXBNPI0QVpZvIIif0HFTq/t0j2rfEjPqYh60UMUtnN7QM8xG/4AjAXQkeLShIC8R9Mpll0SjIBx4wGu/WeI3GEKFomt1mgPi0kVKpOsA/sh4xX45YXNSpN5ZnS8wyJKkUy2jtNO6gg2VoJzK5yk9HH//E507hWCAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491451; c=relaxed/simple;
	bh=Zohy3CZoCN1/nHkUVNpwSuSIgHeegT4Kt43f2cRqiQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hG3+593o9fcKXbpIAuK8T8mSMFH/3lyFfj/lwl2qlrV4yCD1K4uSkJtm5+cOcqgH/6+EkZorHL2yPuBWifAsKu6wBSuSy2LY4ogm39UzHE6pIh1HhUoZfuf2SQFU80NreX82EJlh8RX9UK3L+vxj/gv/85otrCCTXsiD/NS607w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CM/SyB5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fmn2EeJP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842lrG1668603
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PuuKoCf05X2ogdbUrP958b
	gw+5RgexsiWyGIOVrjGbY=; b=CM/SyB5Lgh1yNMKuGaEIuKO3nro1VkSJBg8F6m
	OfQxIH+Oh4pG496bmI+3seFeTeOVnvGK6y+N+xeF6GzthkIMD5ROhGZn15x6RSnB
	UiM4v3wV03cEMT72mWwuEa+CBkrJtFEotQQH5bXrQnvksLMxHrEsQhB+ZOV7DO1f
	dYqixsaTfpVXtsUjmER/0RmfTUz3ogdXmY3E0/9vd1+oahOe1rp8kT2TzC/VaNep
	16NNOSXngOueyiepMgA1WQTeKM7XsXgFFB44PPM2uPyJOqXCcZUQ3Zbl5p8A5KaN
	Gu3f3CA5QdZzKpOGEXNBDlwAdwKf0dwCasmf+aRitB38dyRw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tyqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:17:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88fc985a65so539085a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491448; x=1784096248; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PuuKoCf05X2ogdbUrP958bgw+5RgexsiWyGIOVrjGbY=;
        b=Fmn2EeJPz1W9ykhqKST7GuMGkYCpfaON94c/0B1PyskCbHD9y960/CsIWIJzyCxKCz
         G2hayBOVr9OXQDstdpwujWqLsTUTWZx9URoKZUmqbmDwhl8Dpsw3icPHtC9Bomt7n8wz
         E/tbMyshys9Fukx+C4HF9on4aKUGHUf9F5SIvXgMmPHdX8XCKARGVtZlzhFHRgAhrtFP
         WOhYjPCJpkZRoVmkdymmOU6Y/KAlVlyd6mwCQLLpQL5UzHj5deVOgr7W5RtILokwiXIK
         54mX6krH1W7knjpKOc4lkVK/DRprDwFzmxZmYhKx3wGeE7mYUV87yf+EyzkNv67slxFr
         KQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491448; x=1784096248;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PuuKoCf05X2ogdbUrP958bgw+5RgexsiWyGIOVrjGbY=;
        b=UCVECQQ7Gn1EW8MH5GjexsG+sg9Iu8+ZNpfcmYuFPTAADn9u5k7W506QPWNWW/7cIY
         WRCaYgCGXkPMQHx4frwBuZYbcKsGo8e+1GalnCYtrRLdaYXDfuoNly7+FxAn/HA0ee9H
         mqB9fI6jH1beWN49VvCAi+r6NZOnvIQesUoIJEU0+jwhB7VmK7+qpxLYtesziUhTzizk
         L/a3YYwKF9cDVLWlTinmTBHo+NlKUrHpz3ZWh/o82omoSl907+SrL3aRs1rt7+Aev2Z9
         p+CzcpQ5tqIRwiHKp1tOOoGH1bp2hbJriKKPQuGrmpMLXLtqLRoALJbBUFhfmCEu/6Af
         X1Pg==
X-Gm-Message-State: AOJu0YxdTLR97/w6rOPggYrDSzjHCljPpo+3v0QLMONAPuVqJV8h4eKp
	rvLVq1K9MnSD/M7cKed/SZ0noS/+RuYBmJx52RwytVxQifKdhe3wPxWePydcxJsmsES9pB1e3Ls
	B7UOl3AlntASR2trT126J6VbgVogZ2ZyTJ+W9aw6edOrUCDqimRgYOqyJEvdpWEDhhNXu
X-Gm-Gg: AfdE7cn4MYluTkLIzkzAZ9TfF1TX8ziCyjurgGGP0hUoa43/M7SzSpf+ib4PXSPhn6Z
	Rkk2MkyujLiVL4WYCnWiFVmDLmoGXjVwTmAtGFvsrVlwAMwmEmoreOOf7Q9rTOYsNS9+DOf+cAD
	cReBlwQH7+ooZpC7+3AIdlEvx2Cij2MMjf/KiYKYLqFaDqNC5pm0l4gSm0LP0yUAkVZBrqbk4xf
	7AtWZmbRM7JWA1xmOARPqbJV9Vj6OIrfY7O5GwtwkQu8Gqus6euXJ3rB0a4TJfiYKFUnocnBuND
	l+Kl3gCvWqR5BfSDndZJTDdmMPgTd9jjt+YJ8uFQoBLt7dYI6Y4k9QW4gymycuaK82Ax6ZWHSbR
	NTlRRZgelrQ46TIdIeTO4p/EvyucI4IpVFVK89UWtIR6NkQ==
X-Received: by 2002:a05:6a21:7018:b0:3b4:8818:fd20 with SMTP id adf61e73a8af0-3c0bcf50032mr1235348637.8.1783491448408;
        Tue, 07 Jul 2026 23:17:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:7018:b0:3b4:8818:fd20 with SMTP id adf61e73a8af0-3c0bcf50032mr1235311637.8.1783491447994;
        Tue, 07 Jul 2026 23:17:27 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm17028221eec.7.2026.07.07.23.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:17:27 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: eliza-evk: Enable PCIe0 and PCIe1
 with M.2 and TC9563 switch
Date: Wed, 08 Jul 2026 11:47:15 +0530
Message-Id: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzrTWoC/22R3U7rMBCEX6XyNUbrnzh2hRDvgRCyvbvUQGgbp
 xE/6rvjpr04B7ixNNbufJqdL1FpLFTFevUlRppLLdu3JvTVSuRNfHsiWbBpoUE7cDpIei2f8ZH
 mF+nYgPMuKadYtPndSFzeF6/7h7Ouh/RMeToZXCZG2h8aZDqPiYFqjQtkvbpZGD34CwMnOWupJ
 DntFUbtLPi7ba3X+0N8zdthuG7P7eIbp7xZPAIpQE5kHASrMsYMBiBGVs4oG/quC53mwP9vMeV
 MoHownUqRAXIizy4Z0KiQ2GIIKXH+weozupxs6BhRhbaA1De27YiNJhud8ZTDsvU7pzMgcapy3
 0KcA8th2snTYSOi3A0lVzmrlp9tswPus/fp7/wpVpKnnzKtV5i7QJYpBvTi1MOm1Gk7fiwVz2o
 5++XS5p82Gwpk77S1FhL2Dn+hxMPxePwG6/W4rjECAAA=
X-Change-ID: 20260629-eliza_evk-6f30686b161f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783491443; l=3188;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Zohy3CZoCN1/nHkUVNpwSuSIgHeegT4Kt43f2cRqiQs=;
 b=7te/FsCW21EKCkeDRRyy+yu9bx7vQa7WB1AlbFXL7pgPFtU+VNv3M9LatZbGfoc2qOknIjvy3
 RDHtP30HUmFDjyByJt8AbdNe3Qy+KhfS/cItf5nFkHQwTQi+0KBu/UE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: pNyTKV8fNaykd4KQZIdsMrj8-q2og_eb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfX75bl3JIIfx5n
 kZR2Alrbf9hIm2eLFnYSUSK6sbb2wpt34IzWOfSZb4toGBtbkTFtM/eq64/TPsAMENAFFiBfD0l
 //Xg5U4ZVuF+bnQXPeQC/4ThXbXI+18=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4deb79 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KH93JrovTcJc50lypuwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: pNyTKV8fNaykd4KQZIdsMrj8-q2og_eb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfX7xkIPzxtH1kF
 Xrz4P8oe9X4G9EpNb4n9uWzTREbVKCrqnFdolbjYQzKHh33Mi27LGzvy3Qsg2eY7tBRXNZIhp36
 gBV+j3se8cpuNbqG3DtklNNbf1c5kNTS9iUBU+4SESHTHYjmj/bCzZ9pFxu2J69544FN5lRFsLe
 E+7amoJXoosfOrkEM3u+xDe3vpJ2rZ9jqrI4NkUSlfPtDgZLuQsyrnE0HCjxS622MqeaWU0qrYh
 77q+UDGaJ2YqQ44cfe7rl65Y+Q6psfHPn6XTkC0f6/zjSBtrJMVcxClzhUgaagl1vPyzOBqSBnL
 3/TC/9H6Qht/G51bl5e4xowlwxBgwgs4Gnr9A3qrZfQg1v3jcRLGj66Hom7twBJd4aZzuEfzxb0
 JDtqp+yAdFc0zNVYXDScKER+m3RH0SN0VX4L5O3ooj7ot+OPKBBTkVEKZJfYskQriZ0hk7UKeCc
 XaFM+0Co7Vdnfc0pGBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117511-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 189317221FD

This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).

The Eliza EVK exposes two PCIe ports:

- PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
  via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
  (connected over PCIe) and a Bluetooth device (connected over UART5),
  modelled with the pcie-m2-e-connector binding.

- PCIe1 (8GT/s x2) connects to a Toshiba TC9563 PCIe switch, whose
  management interface sits on I2C4 (address 0x77). The TC9563 RESX# and
  PERST# lines are OR-ed internally; reset is driven via a TLMM GPIO on
  the RESX# pin. The iommu-map covers all downstream switch ports
  (SID range 0x1400-0x1408).

The M.2 WLAN module carries a Qualcomm QCC2072 Bluetooth chip. A device-ID
entry is added to the M.2 power sequencer so the serdev node for the BT
UART interface is created on PCI enumeration.

Bluetooth is enabled with this patch https://lore.kernel.org/all/20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com/

This seris Depends-on:
  https://lore.kernel.org/all/20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com/
  https://lore.kernel.org/all/20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com/
  https://lore.kernel.org/all/20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Drop patch 3, as this is already applied
- Rebase on top of https://lore.kernel.org/all/20260708055017.A90C91F000E9@smtp.kernel.org/
  and remove pincntrl as pincntrl is added in the eliza.dtsi patch and also remove
  pinctrl for resx as this is covered in pcie1_default_state as perst gpio.
- Link to v1: https://patch.msgid.link/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Krishna Chaitanya Chundru (2):
      arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
      arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 228 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     |   2 +
 2 files changed, 230 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-eliza_evk-6f30686b161f
prerequisite-message-id: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
prerequisite-patch-id: 7654ff4f899ac0094a2e791e7f208998fcc7d5fa
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


