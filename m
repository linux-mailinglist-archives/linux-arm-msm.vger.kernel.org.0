Return-Path: <linux-arm-msm+bounces-96941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN+hAohDsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:27:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CDE2621E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 662AE306242A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50053C345B;
	Wed, 11 Mar 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLwncwu/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZITOvwBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD143CBE88
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224818; cv=none; b=ZVwKjQiKHiwS820hKoCSPqT6Fo38LbFppIeo4gWj9Wwg8JDnNqiy5SwN7+LzMtNeHklIdtTqiJT22pJYmVAFZevNeMO0UgRNaeD9YYYDFV5hv6MAvf7JY54M790JK8siRH+8qtliIC9j/1Ne9Xgy3AsKgA3K4TwTpck+r000r2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224818; c=relaxed/simple;
	bh=0roWHWaq+9JIwfuEVTAKqaeo0DsMFH0UtaWQXi8DhmY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hvq/W9Lyn4JQkoFswh9ktIwuZy6d0e2I1X3jsTRdDD2f/v040GG3rdVWo1YKSBo9UbH3btYOOmWxTtx8Pb+zE1vyw0N+K4tFQjBCKxEhf0rYT8re4Cr6Us5N0BBxPPizLs3hzprkJMXxAciAyYGHvtItWNJWnsZlCDeFayebp34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLwncwu/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZITOvwBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5eDc294279
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AtSnr/pzwqYQ0YYWzGf34O
	7TLaFW7or12l2zSbgjEgQ=; b=OLwncwu/HAPwFhT3jI8C08s2NPbDwyWZgIDD+L
	DnoF14RK27L+sFtE74vZKXb8v/lIESP29fRP0bRtBGYyGLMKpXGeo531hUBN/HPK
	uZcup5BQv8OpZLc6U97+rx9iHE35MHhQ4Zh5XG6AAdQhIhr7HfjpidGC0IBMlGsw
	+cu3nA7pkw8hi1bO+GCpRVnfh9ca8KaxyZaIudmQNsNjFFecLdExMSVPiKHyKUa6
	FUeUbnU9iR0LsLy8EiVkRyeGqf5jq2R3f/45HfVcfQsVtJoqPpiZCGRBWnMOpjmy
	SCwGqr4faJZe9fW3vxxx6VIia3gQ4qj/Ha2stLFKX645FKnA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb82m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:26:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4e20a414so605967645ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224816; x=1773829616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AtSnr/pzwqYQ0YYWzGf34O7TLaFW7or12l2zSbgjEgQ=;
        b=ZITOvwBW5GD34P9FnKeoI8/F09kNmylADjpYiu4yX2FW7Qs0I99CXC/BghdA6zTg7N
         mKbIadYQRNdAlMWigv1884topHiictAprAtquKVN4M7/EfHbC6iXWA9B5OKe3y3hz9An
         OvoThD9lD161hD8iuFe7JVbFBA07w3U5YmS8ReTUfiDTSXteKuJuAp+OzN1eTcDCy7rU
         Cup2T4btYIcKCty+ULjSy+KinPNBLz1W82U126mYlMm1pH/Sis9KKN+k9RcSi7Fqgfut
         WuFCatcNMUAUF/gaJNua99312tnjPdJMAJIFPXeyDOMO+qBRyOaRQwX4J2UzhAbwm7jv
         w62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224816; x=1773829616;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtSnr/pzwqYQ0YYWzGf34O7TLaFW7or12l2zSbgjEgQ=;
        b=aHLzbLDeNqu53FJB47+5gR3xa9wcDq3Om6k3eG6zHX3gDt0b98rhLZx3nTAUUjdtYM
         YRHxC33u5ltornWWIv4sxqiuwgDdSj5IPHD8mU4ihPahaeqLKLgQplEIGodk0X6iWrXV
         43cRpUitFEfqBM08ysjb5+3LwYUoLbjOpdDTSSMIuhw3/erUxkekpbJLtFRdxF3p4Koa
         IFqBSZD/2joUlIfm4OW7wvPuf2U45QEJnlOg1F3Q3qCTngVlbkMygr4vj6tHv0BXowWW
         HJ7OO5HAw/Buq96zr+OIK9FUSDqAmyy4BPxlklIA5ocUSx0d+t6bV3KDZ01dcXExqV/+
         facA==
X-Forwarded-Encrypted: i=1; AJvYcCW4X/mlMPzFj2IUMBr6Z1r17SGN9dbd21XNTn05/UPzMwoufHVFqNRwosT2XAdKzjEk7g/Z7VCTkVUvIXsh@vger.kernel.org
X-Gm-Message-State: AOJu0YyufqmgnOcKl110tqVZVjOASTNzN9BZJD6oy7OkbRepy7d2Wvqb
	7Ca8TIjqDAn5j4jOwlAeHF43W/o3dvG3tpzUyCZ3TYGWLKGgjtchcDaJaSZzQWeuSW7kcc35XtO
	TGhdvT+3uHuzfG195xSf1oVVhDvhsRgYnFpBIC6KOreJr7bnsqMuOCmobdDCxe2NzgzZdBKQAJn
	TU
X-Gm-Gg: ATEYQzwXDu34L9Uhw/47QDfdCTo3cndnKqV9HfpRHfv7SMCHb99rBTfK60API9qh/dv
	AjYc6ABOJEs4ebC0bhyoLr0h0IorAkCsX9Aned99TuEK30ejBf2CEP1nXU9vw8WVnQv3CdNPcWJ
	GEKWB8F4x2pBlmIQ7+mb3Q8xm2GxjGavUXuIOZ/jZhdg0ynbC+opGgj1GEba9kfCL+QUX1J6DL1
	r5gyTzGa/nZZATz+hO7cLV7sbdCYGNCZpL8fy1A3wNHD4WkvJlkxQULB/fLTI5DfmzIZNimXrTq
	4zIIVcjLx6mOZFXuguR6MIMJthmowlVBxDnL7wY4Yzj/d8LDR0MwL/snTfDiTI+1fiylt3J8z0F
	v6RUfQ5GF7n8WuNwANAakNz+whXWZk8W1A2zdqejXcpYeyjZG3u3OGkEr
X-Received: by 2002:a17:903:b48:b0:2ae:5b64:12e6 with SMTP id d9443c01a7336-2aeae888648mr22132945ad.38.1773224815800;
        Wed, 11 Mar 2026 03:26:55 -0700 (PDT)
X-Received: by 2002:a17:903:b48:b0:2ae:5b64:12e6 with SMTP id d9443c01a7336-2aeae888648mr22132685ad.38.1773224815269;
        Wed, 11 Mar 2026 03:26:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:26:54 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/5] PCI: qcom: Add D3cold support
Date: Wed, 11 Mar 2026 15:56:45 +0530
Message-Id: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGVDsWkC/22MzQrCMBAGX6Xs2ZRkU2viyfcQD82fDbRGEw1K6
 bubFtSLl4VZvpkJko3eJthXE0SbffLhUoBvKtB9dzlb4k1hQIpbhiiJ4ToMhignpUQmW6oUlPE
 1Wuefa+h4Ktz7dA/xtXYzW75LoqUMxSeRGaHEGOG4o9oKbA4hpfr26AYdxrEuB5ZSxp+NbPe1s
 dhCKo4o2oY2/I89z/MbQhO+3+EAAAA=
X-Change-ID: 20251229-d3cold-bf99921960bb
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=3914;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0roWHWaq+9JIwfuEVTAKqaeo0DsMFH0UtaWQXi8DhmY=;
 b=BiHYt3kkPvBXICm/9in+VC/Njx2c911zUi7hE5MRbt74rQVdRgwjYJ/mDOC26hMb/bIpr/DtC
 xVWBvMzRsb5Aic3UIwVcUbtGRRibwRJsCZEKJkngMLWt+8S8j50hAZG
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: w79utT7d05uLMoKykLIg3QiRHWso21Fh
X-Proofpoint-GUID: w79utT7d05uLMoKykLIg3QiRHWso21Fh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX9HLoGPhNrLfo
 6UVGoct1SlRfwvTP0gPIFAKXZIJlYybNUU1NIEykzJqN6MOKEsC1rEvhPUAWjVsW8F6yyWnABDO
 XI5iLS3/aAAw0UsSbX7XzbPJ1Sgyb40TcgLULlb1NvsOH/yTSMh19aJqG81uaZkhbUnhrJezHHR
 BbUh5GEnsqUZLRYQKO2tpoBw8wKqg4berqBrPTak0t13FtyE9VME1sg9M8y/U09eH1M1aAzrR3I
 /75h37yoBNz9kLw3f96+7J3EM0HVxKridavJH/Q8M+zGIdyV0Aj4hgwCcWPU1I1OkhPKLqNkN5e
 eQ+QIWY9h61TL5BDv/qb3nwC2Fl+VCzr1/rFE8s+oRipyl57oShLvRuRr+hUwTzAAk8zYeEXEZ4
 wkUruNsWknfuY8UkgcxRCHqPyp3HKOeAI2Pq3SyApAi21sONuRXvLMlAvliOqXKVhbwwfG7LLNo
 rMxmDNNxk4SbIkjUtBQ==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b14370 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e1WyCQ9WWvu24y8kmCgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-Rspamd-Queue-Id: 71CDE2621E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96941-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds support for putting Qualcomm PCIe host bridges into D3cold
when downstream conditions allow it, and introduces a small common helper
to determine D3cold eligibility based on endpoint state.

On Qualcomm platforms, PCIe host controllers are currently kept powered
even when there are no active endpoints (i.e. all endpoints are already in
PCI_D3hot). This prevents the SoC from entering deeper low‑power states
such as CXPC.

While PCIe D3cold support exists in the PCI core, host controller drivers
lack a common mechanism to determine whether it is safe to power off the
host bridge without breaking active devices or wakeup functionality.
As a result, controllers either avoid entering D3cold or depend on rough,
driver‑specific workarounds.

This series addresses that gap.

1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
   whether a host bridge may enter D3cold based on downstream PCIe endpoint
   state. The helper permits D3cold only when all *active* endpoints are
   already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
   from D3cold.

2. Updates the Designware PCIe host driver to use this helper in the
   suspend_noirq() path, replacing the existing heuristic that blocked
   D3cold whenever L1 ASPM was enabled.

3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
   the DesignWare common suspend/resume flow and explicitly powering down
   controller resources when all endpoints are in D3hot.

The immediate outcome of this series is that Qualcomm PCIe host bridges can
enter D3cold when all endpoints are in D3hot.

This is a necessary but not sufficient step toward unblocking CXPC. With
this series applied, CXPC can be achieved on systems with no attached NVMe
devices. Support for NVMe‑attached systems requires additional changes
in NVMe driver, which are being worked on separately.

Tested on:
  - Qualcomm Lemans EVK, Monaco & sc7280 platforms.

Validation steps:
  - Boot without NVMe attach:
      * PCIe host enters D3cold during suspend
      * SoC is able to reach CXPC provided other drivers also remove
	their votes as part of suspend.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Changed the function name from pci_host_common_can_enter_d3cold() to
  pci_host_common_d3cold_possible() (Mani).
- Couple of nits for commit text, newlines etc(Mani).
- Removed -ETIMEDOUT check and added -ENODEV & -EIO(Mani).
- Link to v2: https://lore.kernel.org/r/20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com

Changes in v2:
- Updated the cover letter (Bjorn Andersson)
- Add get_ltssm helper function to read LTSSM state from parf.
- Allow D3cold if there is no driver enabled for a endpoint.
- Added a seperate patch to make phy down in deinit part to avoid power
  leakage.
- Revert icc bw voting if resume fails(Bjorn Andersson).
- Link to v1: https://lore.kernel.org/r/20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com

---
Krishna Chaitanya Chundru (5):
      PCI: host-common: Add helper to determine host bridge D3cold eligibility
      PCI: dwc: Use common D3cold eligibility helper in suspend path
      PCI: qcom: Add .get_ltssm() helper
      PCI: qcom: Power down PHY via PARF_PHY_CTRL before disabling rails/clocks
      PCI: qcom: Add D3cold support

 drivers/pci/controller/dwc/pcie-designware-host.c |   9 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 165 +++++++++++++++-------
 drivers/pci/controller/pci-host-common.c          |  47 ++++++
 drivers/pci/controller/pci-host-common.h          |   2 +
 4 files changed, 167 insertions(+), 56 deletions(-)
---
base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
change-id: 20251229-d3cold-bf99921960bb

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


