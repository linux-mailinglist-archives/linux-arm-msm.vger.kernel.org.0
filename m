Return-Path: <linux-arm-msm+bounces-116313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ytNyCW6vR2r+dQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:47:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755570280C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:47:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=op3LP88S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gVJT4RgA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116313-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116313-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B76183049163
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A20D3D7A16;
	Fri,  3 Jul 2026 12:38:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088BD3D4123
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:38:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082326; cv=none; b=nJKupu+kpun9XNESbJzuV/fMxDbQnGpC/8Q0fBgDAljbqdi47V0yvBBiLWwnNB5lKqzPTIotzkm13twwU6SMHMtS7zLv4JEdnW71+LJy6TSxSk6GdvIypB4+PxM5JwEKvCgJqi+Diqn9SFQlPdG0Knp9UR8PirFOR6XehgOKyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082326; c=relaxed/simple;
	bh=S8MYJ0Gty39K24ANe2kgww56Fg/Is+/uFYmYQKcyo1g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eR3SnMuUYBbUqWB14h2ZW5gEfdgSMWwSiMJH0b+E68XluhhitusZwxHhT6mlH6Tbb2q4DPUTvn4NiYLjXI5HARAuHZK9BxLfs9zWxuAEk97eikZ5HzURSvMbBueSZZcu+7Mf0CHHjl+c/5EGZxTGGpJzIF8pjygV7riuIH6BT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op3LP88S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVJT4RgA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663B2gSq3126390
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QklNaAE+SC0PdzUYHH/SaR
	KtSfulcJNOcVu4EBzPC5s=; b=op3LP88S5CT/HrkFoyk5BA3Sh+mRPWOl4vnAHt
	OSU8VKyFUulWLGC9g9/D26TNfqwNz9UC8dF2NRO/2uwz5Vh758yGzDMxLf/y2NiG
	aqHqYeaI/SJPmHBSiHG8OEBzknAYNNPJAtE+dWU4cZq3/JPOsBjsmDn2P2wrmtf7
	htPpeC5RBZQl7BiNNg04DgjqdSQbuyly9OTV4VC5aJRGFrIWJ+gXV6THEbxOU5y7
	Z3GHdUO4TCAK8rOxoNOJgEgteOk2lZwxIxJJi3RdU4eLzGVb5ZTPGivO67zVEC/S
	12K4FRoKvA6eilZ39xvdbjHPvEIk+QgSAZNZM+6kTL9uNayA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnmgv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:38:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eebafso1343522a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783082323; x=1783687123; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QklNaAE+SC0PdzUYHH/SaRKtSfulcJNOcVu4EBzPC5s=;
        b=gVJT4RgAHzAY3dPMQPIIuihgumkfmF8H46ChiJ+Rd7g0ZsGDWUppqxkKMyk3A1UJQ4
         WR99Gsksqj9yDbycYxkEA2p7fKVD2o16ogYEWlzMQdh87rtozV31arC/tfB0rKAg9zcJ
         e1KWuVEz9ucEqCpGCPEBt0n7OdfVfQREU2Trzx+hAn/7GdaM9uogkqdY0/juk1Sy+EU8
         /4RIC7nB7Adj4roCJOHAvRlyia5RJWICSXR5BKso0IfXjN/yy7x2Pc5WwOxDkVnUGiYj
         s4DQNBySJJZZEwZqKpLsXsCgjevvEKVUth9gStaLT/CS/XoEhD5RN5H89EtmVlOyWmGR
         mOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783082323; x=1783687123;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QklNaAE+SC0PdzUYHH/SaRKtSfulcJNOcVu4EBzPC5s=;
        b=B8sjIF2g/004uNRF3G92ORflUmYW0OCjgbOfFovpy2B3aN6Ej9JOiH8lTa9wCfgiex
         3llUeDkvf1eLGvcrI8Hx7cG3P4pEySKrci53sDU6j2YNkPdmblNRWFu+pFzy4vn+qDjJ
         ziFIkmor8vWUsD3YeAJ14MN4G7aBT2GW913FlVfg1BQGLA6X0Ik+ug4S3RfFk6u1OTZt
         vzPfyRf+JVqpk7twZ7WxQuOrOJ85cbcK1GaEyqExKjJFF2Kg0gY7acXvk98LI4BW6Ggv
         5urS0cFGEO/SlvldovBtZMUkFvxBbR6emTPhxHekJUcjrbctOw9NXahBEFOH3Te8PC0E
         EOsw==
X-Gm-Message-State: AOJu0YxOvIAQc0CRjKrimUjiiOHxODHM1oLOOzzApo9ZPkmx75swRVSU
	tDJ58u7okqShiXKPQXArSQo/S3p+KGwA4/Z+GGIgqvcBgB4ShpUHZmZ7Sd0f2NsbhvxGM0YyUAA
	qt5DKgDuWz1jsqclQQHy8r1ez6c47CT06XDdiB0/DkZC3qQ1OqfWLkfCB9OsQliCWGy0u
X-Gm-Gg: AfdE7clvLllrsPoHJmA8/AupP8P6/Nfm8vL4EwzbshYWkWyRClXlcdg7w4inLE+3jWV
	FD9PZ0SHOls2ExhTaJ7+p6N3nCbGQdCoJhmEJdbRgFkGV3teUbwjTTbvyuze0VnnvOVDFyj8LPh
	iiTqV1dGs87VuRVxm4mp46v/jmV6dQxMESGHhQmzllrw7bbAYXUQUCqfURbuqXEphcj1dS48v7R
	j2aRR6rP0KVDixtZVVSC0xQMx4KDrmJmxqUVF6dGi+wFfKzOnB+/G7T+Da3GrivAo656Wdgo8L5
	rbh586LceWT+3DZPsDCdqnYqr/17ZWBgUDoqijFbC+C9ZH0jLCY/CP3u6LN+cqnru21jW1DPlcg
	DavumVlyuNlBrgf0a3R2IpDjTWYfZoPAmcnvhGduLZZSO0A==
X-Received: by 2002:a05:6a20:5484:b0:3bf:6c08:2842 with SMTP id adf61e73a8af0-3bff42c92cdmr11762192637.49.1783082322869;
        Fri, 03 Jul 2026 05:38:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:5484:b0:3bf:6c08:2842 with SMTP id adf61e73a8af0-3bff42c92cdmr11762156637.49.1783082322433;
        Fri, 03 Jul 2026 05:38:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm24356993c88.12.2026.07.03.05.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:38:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: eliza-evk: Enable PCIe0 and PCIe1
 with M.2 and TC9563 switch
Date: Fri, 03 Jul 2026 18:08:29 +0530
Message-Id: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEatR2oC/3WQ20oDMRiEX6Xk2pRkc9oUEd9DiiT/wa52e9hsi
 1j67qa7vVH0JjBhZj7mv4hCQ0dFrBYXMdC5K91+V4V+WAjYpN0byQ6rFo1qvPJNlLTtvtIrnT+
 kZ6N867P2mkX1Hwbi7nPqelnPupzyO8F4K7g7BjqeKmScbaKnUtIEWS0eZ4ZWdwaO8qylliHn0
 OTgGFx+3peyPJ7SFvZ9v6zP09SbRthMHZG0Qs5kvIpWAyZQRqmUWHujbQzORddw5J8pJgBSOij
 jdE6sFGRq2WejGtRIbDHGnBl+sQKgh2yjY0QdawApVLZ1xKYhm7xpCeKU+mOnURLHIo91xDxY9
 uNB3g6bEOWh76DM+9nWOsUB2vaf/TkVkrefblwtEFwky5QitmJ9vX4DM5AhYuMBAAA=
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082317; l=2586;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=S8MYJ0Gty39K24ANe2kgww56Fg/Is+/uFYmYQKcyo1g=;
 b=eCnlEQQS/VPL+DBFFcnPgXI1ANDDRlsdaedBLxzYzGkRRCOvQ9Dh8rNik+0bkwNwbholgkcqO
 t4Q6+2fXqWVAo+j5d7BQK15YusyNeHniPLgw90lI9ICt6SYyWbaW/AJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: AZnp3RywxVWJaJaXIlDGW4fw_ggkSsyj
X-Proofpoint-ORIG-GUID: AZnp3RywxVWJaJaXIlDGW4fw_ggkSsyj
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a47ad53 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fm6EAR0vVewXWd2bb8wA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX0AxR40cXu5O2
 u2y6Jra41dXL2AuGoPO1QiWNeNjg8wqHHkJB8Kq2ycf73cnI3kDztz51X5fUZ94scCHE4ojBevB
 ndoTtQe/Ot1v9pRr9Bwzy/ur0cl/TgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfXyzGlqsEcfiGV
 B8vJVjdjAa4Vi6A3VSlzDknaVRh2D9CY0DsihDF5p/tPoYzuZFRA3rKFeGfW1xxpmoO1/PtA2gz
 3sUzPoXHYbg5sOfFKET9x5QYCELxCcx1PICii0IHPT5XBzRqg04dOi63WZpjBC82Jnul+4QPh94
 je0q+ckXDzFPwgQo9r3G9D+QABTIGUujszPfF2mQ1VobTQ5AXIClHeNZ5gwGV17fBKNQ/lpvU7B
 h+X21y8llPM9LAdviSqJo8has4Y/uLjFj3T9mghhl59Lq7pHtpQRCkUynlsV2eTolN9gz8CFkf+
 RAH0vu9K/S08gfqdNnaCyfEIY9aTBDAdFMlf0ZD1Udve53qpg0cltyh2S3F1I5ZVuQDkiPRxHa1
 xbwDoQjp+Yc1aZeuEVpvfn7G0YzHTrWm1Du6d1r99zYckvPppxE34dnwBgDbpPrS9kRzzXNI1oa
 fKStcuJyq3Db2H5T02Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116313-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8755570280C

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
Krishna Chaitanya Chundru (3):
      arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
      arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch
      power: sequencing: pwrseq-pcie-m2: Add QCC2072 BT PCI device ID

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi   | 283 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi       |   1 +
 drivers/power/sequencing/pwrseq-pcie-m2.c |   2 +
 3 files changed, 286 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-eliza_evk-6f30686b161f
prerequisite-message-id: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
prerequisite-patch-id: b6c6123bc2cb3a5e6c309c1cfcca80f7f950d390
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


