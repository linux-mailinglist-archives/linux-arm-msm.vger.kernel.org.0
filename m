Return-Path: <linux-arm-msm+bounces-118717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B2clOkK9VGqUqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:26:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF82749C64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:26:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EpFc6CcB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iy9iilsS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118717-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118717-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68D8A301A535
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1BB3E7BA8;
	Mon, 13 Jul 2026 10:26:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD53DDDBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938366; cv=none; b=qbbGm9NBHFsQXaYVyH+POum18uZQu590zATcAQ6e8ckxTaO8Mgx2maqpB92ncF+u053sJoOuKLdQujbNKDrF7aZ+/lO/p+6VUaSvbjl2L+LNEmsQrBBghxuyMYIl7YRw2kYTVLHUMfvUz/BqlqA8jyYZLVnH7i0m4UPox19JLXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938366; c=relaxed/simple;
	bh=WvCg1zYylDOwQ0hqrWZk3Fnkj74lOE1ILJ1fp/Cq0Fk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lxmUZoAS8wSW9VM4TAL4REtCM91h8GioQxSywrDzdtgYAWJpq/5G0rS6W3b20p51dQcVor5mr2jdWf5nuVKSsfNMqGmE0TpD4IP5NMw+AhHluwOfjMdcNhyQZ+i36SDtJJz6VGJcvXYi8WysUy9dNY/+zVMhjhpdrjMiXes13BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpFc6CcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iy9iilsS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9MHdL1090768
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dvxFWpBIUKl297MMvlXgvj
	gG2qnWL6hrJmi3MQ7wPJA=; b=EpFc6CcBgSP9T3Zgrli4pbhUqfUk1Zrv/J4XiV
	oBJWJclpDAVVFojxPCkcGY4ULWi8/XbbEETfCP96qyAgrC/lFNqbq75DX8RUAfXR
	BzCGZNOFpuPtWmDT0KhWKqyMdfQEeYZ4YeRJd6S4g87EOM0YxnNclNMQBLGPwORi
	qTY5q5AoKE6Dzt6Dxg79/2A5CGHjQKbhr6zX/93Qeaa0ZIjykckRNEC9JCLgblCn
	DRTG1Vc7swuZ9l7J6lGNpbyBpiA6bsXjCR5iOnJbPXEZcP+F6L89Gp7YvIvXKb2I
	k9a+H1BfMje0EtbSI8p7P1LMsQ73L79+o17NZmCnK3dZ1w3A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavr7qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so4265620a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938364; x=1784543164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dvxFWpBIUKl297MMvlXgvjgG2qnWL6hrJmi3MQ7wPJA=;
        b=iy9iilsSc+P0tGEyn30W3dHdVUfnMagagrAq0ITsLqzIPekDgNhmMSdgH+q+Ee8Zvi
         WtVJHZ/C60eQWj3EwNZkEG9MpYV5ww8KIajR+v6z3lO12u9wxBnSiOOixZn31pO2Miti
         6o8UGYQgPaMGrgMQI0rsrCdDf+hFr/CNiY+vPXfLwGr9/5bnf32TiBzTuNaFoT8IJGUc
         q6+0okude3tZ2g2Mi3iIShRRnBSZITdR5tQDDS/WL7tL59xZ9XrVIRNMUppTdwPQC2zo
         RkVGMvTEH5HbgKLdoVd+fpJlTrX2H4YI4lLKfujShGqbG4X8YT+qoFlwumMs8K4JFYXT
         5syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938364; x=1784543164;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dvxFWpBIUKl297MMvlXgvjgG2qnWL6hrJmi3MQ7wPJA=;
        b=VV4jzsVj/5E8CvTWYywYu3Kfnsb2/k9ge9Xv471wr9SZjCTuxJ70NRpmx/2M7f0Isy
         wmHzceYWMYCF0rp23Cg+VP4uz4q31N5LiwBd6BePtFPVb0XYIcC5Vr070FAGLP4yZ3uh
         DSn12SeT8+jqhr+IJj5K9gI10wEQCKmyF5u+xlR4F3KMlpckIf1Qj9Lwyk8iHnAqcupx
         yKm9n+lZX7kVGnwwv8+mGAw2/6kU+Gz2u7nDTsxDECYtZsIS/0q1IJLGZRYcEuUwPd26
         Em3eC2Fz00pMtPwU3xyWJtDA+GEp8S//mB8FkTLokZS+e/WbSs9kDOrUC2RJy8FsmA4X
         GYzw==
X-Gm-Message-State: AOJu0YxO1fGLndUKLNJO9MR1AQRm7bwDzXm3oLjgvRvb9qrMiDDVyYfQ
	u+74nxCp57jmZ0S5AI+gfrJeoqiLFuF9fK5T3xfgNg42QCeJ+SQak3/7HdXJGo82s3UnPx0AuTd
	Yj/zDRSmac+w9AEXSz4SYHPD0zfAfJqRCgkfOL2ARHYH1eAPPLqwZ5PIkpLpNNbz2e8kQXQBXDY
	U6
X-Gm-Gg: AfdE7clYGgMg0NX71WgPo2qCBCrjCWNy5oKXN3N06fIsR4hb8N+KUKWP+9Jiv/aPBsN
	9mes1WLpskprmtVOCtGPzwG9AoxltW/Fhm8kF0e1WA8vqCEVCZcEQzI8e8wNH8NdK+p4mVefpCA
	IhTlPOjzLOvoHR/9O5Qem0w8am37F/bWNXpqSX99bjvPoSxttsb/8qNsxGAq3WK/DP4cyL4IIrZ
	uWOODjA0I3gzgAbd+x+lu4Hx8mjTtbM6VJtJ9cJv3wlvr/EgzZUGsYjNfH/YBl/BFxVSWlFXXS/
	NJJ6Yo5QrAkFJ8FGzElI6HJNYWy4q0rzDcuXl8f7K3AnRgifxeIJk8QgnEUlhQE922YF8xw9yHV
	z8/o3S11PQBaGZMXg84QkvnMlcXUx9isEQVZTUX2g
X-Received: by 2002:a05:6a21:9f17:b0:3bf:e2f1:1b14 with SMTP id adf61e73a8af0-3c110a619c2mr10200338637.16.1783938363745;
        Mon, 13 Jul 2026 03:26:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f17:b0:3bf:e2f1:1b14 with SMTP id adf61e73a8af0-3c110a619c2mr10200308637.16.1783938363337;
        Mon, 13 Jul 2026 03:26:03 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:02 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH 0/7] Register MPM under CPU cluster power domain to manage
 RPM notification
Date: Mon, 13 Jul 2026 15:55:40 +0530
Message-Id: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACS9VGoC/x3MywqAIBBA0V+JWSeUhD1+JSJGnWroiUYE4r8nL
 e/i3ACeHJOHLgvg6GHP55GizDMwCx4zCbapQRZSFaqsha6EX3h1OG7XPqK1fCciKmy1aaTGiQg
 SvhxN/P7jfojxA273/XNoAAAA
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=4971;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=WvCg1zYylDOwQ0hqrWZk3Fnkj74lOE1ILJ1fp/Cq0Fk=;
 b=Zh+KYJtqq22v5gJg4D9UBcr+AoShv/hjkNuuX0iIBaLMDLasPPNxyDg54DZX+b+8o6IP6Z8Ij
 9CmencsD3tSD+AGGm1TPBpQCZOqW/x393OYcj+/anOdSd4k9NxgnGZg
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: yAOONTTxgc-GEyS-V7wdnjWNW-rKg2mL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXzsEmdIAyzZ5f
 4W0womJd+ClBxJePrvPoqvLq3ShTaVQ3hgUvtGce+Ux+pDGxeFKtzIsCzA5HyIe/XRQyrfrWGev
 OKOeXYjAcYMfbBa1k+nQfsc7zI7SIXn/rjJxjLjepPwocUSm02XCXyJQ1wF3ge0q0NSAIOKmDHq
 RKGPIjL+RTpsxaylD37iRGDz4JaPMrz5jl2CrlDTSQP2Q8yPUybwnkaAILTogSRg2pzf65FOPNb
 PVQIfdbpDPFCFRTRUJABFmkXazGzcRb1DjjNtSU1bAo+ZZTVi5Ba5WirJqmVCKowyOkycG98++7
 fiFWqPjFl2+zfl91yTx4f614l7kIEZVdNXvZ4lOijyGLVHg+JZcJFCNNW023uSssz5OOnz7aZIR
 a33Vh5r83B5nmWjdd/eBODxYTmCFrP9qOl7AuKpn8kBa5p1iehFVUnqIeiZ8sEsbOGCTyzBxC3R
 cSTJTVm37vnmxfgzFUA==
X-Proofpoint-ORIG-GUID: yAOONTTxgc-GEyS-V7wdnjWNW-rKg2mL
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54bd3c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qNkiBxRVe5u3VoiZqJoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX5ZWlVhVPtJ6A
 SDfCDKdPLiMZGu5fAD1qmqN8oMHGod4Zbb/mekW2WWrZfCGZhvVEp6apAvbpv2Y3aZT82uVAOwO
 p5nDJ6Tedv465+MdZ/mZYZURgPxP6vA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118717-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CF82749C64

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation introduces a hard probe dependency between MPM irqchip
and CPU cluster power domains. That is MPM irqchip needs to finish probe
before PSCI power domains are probed. MPM irqchip can be build as module
and can get later inserted where as PSCI power domains is not a module.

For in-built driver cases too PSCI domain gets probed first and later MPM
irqchip leading to failure of CPUidle states.

Detailed flow of the non-working scenario:

psci-cpuidle-domain.c probe
--> dt_idle_pd_init_topology()
    --> of_genpd_add_subdomain()
        --> genpd_get_from_provider()
            --> fails to find parent MPM genPD provider
                --> returns -EPROBE_DEFER.

irq-qcom-mpm.c probe
--> of_genpd_add_provider_simple()
    --> genpd_add_provider()
        --> MPM added as a genPD provider.

Now when psci_cpuidle_probe() is called to probe the CPU idle states, it
tries to map the states to the mentioned power-domains.

But since power domains probe has been deferred, psci_cpuidle_probe() too
will return -EPROBE_DEFER.

commit af5376a77e87 ("cpuidle: psci: Transition to the faux device
interface") transitioned cpuidle-psci to a faux device interface.

faux_device_create() calls faux_device_create_with_groups(), which ignores
the probe return value, and destroys the device if dev->driver is not set.

This will lead to psci_cpuidle_probe() not being called again, resulting in
all idle-state devices failing to init in SoCs setting MPM as a parent
power domain to CPU cluster.

cpuidle-psci.c init
--> faux_device_create()
        ...
        --> psci_cpuidle_probe()
            --> psci_idle_init_cpu()
                ...
                --> psci_dt_cpu_init_topology()
                ...
                -> dev_pm_domain_attach_by_name()
                   --> __genpd_dev_pm_attach()
                       --> genpd_get_from_provider()
                           --> fails to find CPU genPD provider
                               --> returns -EPROBE_DEFER
                                   --> return value ignored and device
                                       destroyed
psci-cpuidle-domain.c probe
--> dt_idle_pd_init_topology()
    --> of_genpd_add_subdomain()
        --> genpd_get_from_provider()
            --> finds MPM power domain
                --> power-domains topology init successful

Below are the logs from shikra SoC:

[    1.035164] CPUidle PSCI: failed to create CPU PM domains ret=-517

[    3.651715] PM: Added domain provider from
               /remoteproc/interrupt-controller

[    4.129563] CPUidle PSCI: CPU 0 failed to PSCI idle
[    4.149294] CPUidle PSCI: Failed to create psci-cpuidle device

[    4.743389] CPUidle PSCI: Initialized CPU PM domain topology using OSI
               mode

Currently only 2 SoCs follow this method - Agatti and sm6375. Agatti has
CPU cluster power domain disabled, which is why idle-states are allowed to
function there.

Move the RPM notification handling to the GENPD_NOTIFY_PRE_OFF callback and
register MPM under the CPU cluster power domain.  Use runtime PM to report
the default RPM_SUSPENDED state to genPD so that the CPU cluster power
domain can enter low power mode.

This will remove the dependency on probe ordering and allow individual CPU
idle states, CPU cluster idle states and RPM notification to function
properly.

Also enable CPU and CPU cluster LPMs for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Sneh Mankad (7):
      dt-bindings: interrupt-controller: mpm: Document power-domains property
      irqchip/irq-qcom-mpm: Register MPM under CPU cluster power domain
      irqchip/irq-qcom-mpm: Prepare common access path for timer and pin regs
      irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to LPM
      arm64: dts: qcom: sm6375: Make MPM device as part of CPU cluster domain
      arm64: dts: qcom: agatti: Do not mark MPM as power domain
      arm64: dts: qcom: shikra: Add CPU idle states

 .../bindings/interrupt-controller/qcom,mpm.yaml    |   6 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  94 ++++++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   3 +-
 drivers/irqchip/irq-qcom-mpm.c                     | 185 ++++++++++++++++-----
 5 files changed, 243 insertions(+), 47 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


