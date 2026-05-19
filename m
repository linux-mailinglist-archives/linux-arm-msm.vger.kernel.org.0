Return-Path: <linux-arm-msm+bounces-108472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCr7NvxIDGoMdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:26:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 812EA57D8F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A232A3046350
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9C5369D4E;
	Tue, 19 May 2026 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pimApMUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yp+HTXfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA735200A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189715; cv=none; b=IJxGBS5vCma6K+3KsYLLagWpqXSgY+nYMA66WWTOzeUoxKyMOKQlNfiNmVa1CKrAwbze22vVenMKQWpz5bDnXndGQe3gmaxJ1/xa7N+DNUEP/lxJnjZI2rM+vnxWmj9yF+mlW/8zGEAa2ELax72iZ0SnxOU5rudDPGKKaEc4qRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189715; c=relaxed/simple;
	bh=T1V0GrlgGYF8gvrEV0BxWo9dA8/lolTJnegeQBOvK0s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NeNuRBCHQBSKIBgQssMol1v4UJKLcZH9KC1ZzhsAmLE2IEjFBeFVN1f9YECdnClHxU8LC9LoDEyYAq/YErzDUblgBeXL/8Wxbtke1jqkczI5HwVqiD44iGXnfPH27m3uSzu5sFJcnxmSJPrQDUbbZVuVW/LNlTsvijE/FQU/4vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pimApMUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yp+HTXfp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vF061055038
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=urD0szRo1A4mVK5XcHbHte
	15hVPv7xEDpvyOq2IUbRU=; b=pimApMUdtWsY7f4I10n8/s5HIKu3wS7ZOmxGcW
	0PRX1aI+5m9YArywuQEwk0GrbLwE3Qco35BndiOt+Xh++02VQGFuXHw013c04dx7
	A8qnYyxx7Of9ULMoS17hRjJyVyKdGLoQ7eoF9kPr+/PN00Aa36ayVyCsPQ7zjQ5i
	CmzUXy9iMoLucm4syOtdojGMmEUCm0Hig05Vv/o88JZdT+Om99SmXkjfKEeqH9+n
	w266Z/wEsYpew4T5eo0G3mhkEZjcITcMpSNLjRYkcvUV9RuccyNf/jWWdYNMZfmV
	oi1ygaOBz2hGJCXhqtLUwJPv64iKjqlRpP9HKRR7f/VNgyJA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npara8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:21:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b7aba0af02so34379235ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779189711; x=1779794511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urD0szRo1A4mVK5XcHbHte15hVPv7xEDpvyOq2IUbRU=;
        b=Yp+HTXfpuYlraR2kF475X6OXkw3bJGQJCIZ0OOOUPXuxL1067DiwctK7BLzJSMP00E
         uAV2V7jOIAUXc2CBBPKMn+MNvtKd4PazMDLTbuy3zHKqBs2mleIjHimkBrIvEts22kXZ
         oh67bgzTa+ViZ+7arbqtfYLvClr+q0R7ELN9+0yY+4yxeWdGoh+Aj55TpT3ma/AqZZm6
         fVPQ5hqz+poHaz+U2Abb82Kv6LRMAQSwKWAavAyJwBo8RlMpERjsUnXIQFnxcbkQQT6r
         SoOrPVxvTyzkNd7l+70EaKu9GpLTePdydKe84KMFoYhR4UHshsJZId+BkvHygKxazEA9
         hU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189711; x=1779794511;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urD0szRo1A4mVK5XcHbHte15hVPv7xEDpvyOq2IUbRU=;
        b=pF3nfD8IXqgYsain99LT+CI3onXv6JHypmlhm63UlL5Lwh4qdua6acdUUgsXwah0YA
         DVnxkdrB0cKz+DnzHY/wVGa0d6SqOYNLNEFEVxiovQogXPe4TAKPab3xG8twpTwEkXAK
         Bpo8lEMhQoD0BPGpEdX/fYU9S7IMKdi08annKiBYy1gGXPZicMPzWxohSO5yytaKYPtt
         EAM9O9hhc8GfpQWwN3QzW0nj7s1+V8wTGL1u2UTqBeGwrdgNCz3YbOB8PBflx6SFClH3
         EBCdMPFicsp3HfZHQQrqBAwFpQ37oTFAbImjcLmyty4mRl/Y/7VSP49c6jpafgZGHMCv
         YirQ==
X-Gm-Message-State: AOJu0Yxj2hpFXakl19kBunTnqNYB8QjY5PgqvS0jZnVILhiRtwes2ij5
	za8NnHcheeNyTnes1NcUfgZKRNG2eVSuGHmrd2T99hYuUyUgP3UWSMBtC4qg0UclJGAqWtMOExU
	hSwfoLu6Awj+zUCSl6jrk3o+CPlycr/UIprZuaYKuCsOd+XYLPQ+zY+lBSxs1fRmLEOWP
X-Gm-Gg: Acq92OE9mOPrvqw8wl1Mp+wzhFL5+V21MpijYobM9/4vUpBOJxeCjesR/B5sO73w6v7
	A6qCxFcNBb8rlt3CY7uMrL5g5FMHrl0ttnZGQduklMpKuhNlp/n3N9W5gWxqymTcbssr+PHYn6O
	NS47tsMxP5mcUNWWRHn0BQorY9pnQ90kcnkQ5nfcts4QbkU3eExE5G3rjo2c+bL48MfEWmvNgZn
	8HsGKVfFl3//vwBXxHsDdl85mh/gy/Ap/6dBWmNIwg21YrPqN85VJfBRsAv4f7uk8QabqA/Qxwv
	bdppzg/J1ZrQeA49Bv76oao6Wk6f5BywVRPldMObi18Cq9zzFcuL8UyG5no52ZzCea0Yx/xqOOU
	xlUdsEfV92HkJll3L83vjdlVNxl6KL6dUu9lo
X-Received: by 2002:a17:902:aa81:b0:2b2:4697:4370 with SMTP id d9443c01a7336-2bd7e861f62mr131432125ad.3.1779189711218;
        Tue, 19 May 2026 04:21:51 -0700 (PDT)
X-Received: by 2002:a17:902:aa81:b0:2b2:4697:4370 with SMTP id d9443c01a7336-2bd7e861f62mr131431655ad.3.1779189710692;
        Tue, 19 May 2026 04:21:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe78b9sm192743605ad.43.2026.05.19.04.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:21:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
Date: Tue, 19 May 2026 16:51:20 +0530
Message-Id: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVHDGoC/42U227bMAyGX6Xw9WRI1MnO1d5jKALqlAjxKZKdd
 Sjy7lPaJA2weu2NAMn6fv40Kb5W2afoc7V5eq2SP8Ucx6Fs4MdTZfc47DyJruwroKCoZIzkfTw
 kJG4mTkvXaiGFEqoq96fkQ3x50/r1/L5P/rgUyfn98EOxBLjoCWhvelMc7Jw6EpxmaJS3ToXNS
 VSPPq4UB3qlttFaYliwPgjJANzmxD8jLnHQue3UN0zSbfK7pcN5TJkg1zxI7o1oSjj2PzhN/eS
 2V7tB6kZzAwG13Zxgjbve3hWbBS+r7Q6ZAG2FdyEEbugazO859hg7M75scXjzsH2/WlSc18E3v
 lUiXPPufc74KCOpYJoq2dbQgORAGDmkmPcD1ocl4YRz/DnmXB8X7OzY93VZVoWE1IzWIDWUNvi
 m0HpeJPf9QkwcXBx2RBsfvJDeBsC1Onygsff9HUVtTOsgMOVgBZX03rfZPpIhyIDG0fANcrY53
 dFSPKaa1gva6q/R327c3VHOS+c4G7Bh4Wv0GKY0fli2oErPsVJziiutIync4K67vI/bL244GBA
 +aHGL+0mZG0aZFKLWXHGmS5n7cSh1ru1+GTDhp0U2mD25HMR589RQ50AotNb6ImE5NB4Fh9Lys
 jwYA+UzIofqMiL2MZdn+Odt+hRLlxlxHTTwMGhOjFCimRK84bzI039dPJ/P579LuwwczAQAAA=
 =
X-Change-ID: 20260511-shikra-dt-d75d97454646
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779189702; l=5167;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=T1V0GrlgGYF8gvrEV0BxWo9dA8/lolTJnegeQBOvK0s=;
 b=CFi5oyaVyYQtMpUoOmwfV/GUWd+sbXD0m8v84k16Zr5dJwfooaVIHs7MkNvUZQyob/16tBPoN
 8Amxv/6H5VXAKW+avP5izDdhG89HwILIhEgQNwl/DjUbaz7QR6RfEuP
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMiBTYWx0ZWRfXztXu/zy7mvSx
 m3NRrYoAT7Bid5cI4D/rbsqvNwYgJQvOlCIIMrBYmtckrpaNKhnsMn4HSq5b5FjqGJL3bzJQx9U
 CQkqpg5xCiZSJnWBxNTGyGXR5WILwQyrsLufeS4YoDfjCTaxb1JpgpCcu6CpvH6RqcVfBkI/qIA
 gWdMwZkK/CdKtkalX7itWPfbu/QCaot8yoOcPu9vydRz7zWmNDyKXQocDJ5KKuqHcXmSwDNhwbX
 2Sfn+PutmbFCqBDlDI6iy6aj3Sz0/2nRmj3ScvxvQH0PdUj7r5Sr2iVfRmqSPIv2UhzZkLmcRaj
 2cpTtmmeRAc9XHE884AWsgjZ3XVnOp4E97OKI7Ax4yDL35WZ60c1cYnfTak20UnojsgCLIyFPkx
 E5jzh5lSqeQir/ApqjRIz6U4Fv7TAS2i9u+nt6GAgPsAUJi8KPS0sztTjknNylfsLq09FnKBK1O
 3wf+ERDylp9WZ9lbgKA==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c47d0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j-BhbVR-bgdRnPYsS8kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: FXEUOX_et0AFkQvuVzTqRrXHkP8Qfa7f
X-Proofpoint-ORIG-GUID: FXEUOX_et0AFkQvuVzTqRrXHkP8Qfa7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108472-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 812EA57D8F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Qualcomm Shikra SoC.
Shikra ships in a SoM form factor; this series covers the CQ7790M,
CQ2390S and IQ2390S SoM variants and their EVK boards.
The series adds:
- dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
- SoC base DTSI
- CQ2390M SoM DTSI with PM4125 PMIC regulator definitions
- IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
- EVK DTS files enabling UART, USB, and eMMC on the carrier board

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

---
Changes in v2:
- Update SoM/EVK combination bindings (Krzysztof)
- Add per-CPU-type PMU nodes with PPI partitions for the heterogeneous
  cluster (Cortex-A55 + Cortex-A78C) (Konrad)
- Use full product names CQ2390M/CQ2390S in commit messages (Krzysztof)
- Update RPM interconnect tags and power-domain to RPMPD for sdhc (sashiko-bot)
- Update to use MPM for ss_phy_irq instead of direct GIC for usb (sashiko-bot)
- Add IQ2390S SoM (PM8150 PMIC) and IQS EVK board support
- Link to v1: https://lore.kernel.org/r/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQ7790M SoM platform
      arm64: dts: qcom: Add Shikra IQ2390S SoM platform
      arm64: dts: qcom: Add Shikra EVK boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  18 +
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts     |  61 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi    | 112 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts     |  61 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi        |  14 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts     |  61 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi    | 127 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi            | 981 ++++++++++++++++++++++++
 9 files changed, 1438 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260511-shikra-dt-d75d97454646
prerequisite-change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f:v4
prerequisite-patch-id: d84e0b4c2788ab6cfcefc9806e7a6011eef8f91d
prerequisite-patch-id: c92359b721d8c28f4a62887052d0fbb2cb64480a
prerequisite-change-id: 20260320-shikra_icc-b1fcef45122d:v3
prerequisite-patch-id: d36ec191324b7992a56c463a15ff09bacd8d7ba1
prerequisite-patch-id: c6edf2e05d1409667c9674b765dbd0917401a903
prerequisite-change-id: 20260429-add_pm8150_regulators-a373f53eb48f:v1
prerequisite-patch-id: b312905695c635bf1e3deab87b718c92adf07f54
prerequisite-patch-id: 390dee07914f18c7df08c57b3c59c25d1588b62f
prerequisite-change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c:v2
prerequisite-patch-id: 2aab0b42cafb535b31c5154002c12f381a52be9a
prerequisite-patch-id: 599ed97f57ef0783f69d4c22384e91e66a2888f6
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3
prerequisite-change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f:v3
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 2526e0507d3b5c065eafd75a657d7f903af8488f
prerequisite-patch-id: c3b7e18cd60d1f779b88ace2fae1227d3d37d83e
prerequisite-message-id: 20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com
prerequisite-patch-id: 0cbcb69abbbf83da785619c266c96af624c38a87
prerequisite-patch-id: 047b2e1c1db0a5928b951a3f0bc9b0416032cb2b
prerequisite-patch-id: 6126fcda921fe53b86b3a18c649fd8ff2e1f43d8
prerequisite-patch-id: 8d1bc1ee4b4c1009a953bda66e849198d9e16352
prerequisite-message-id: 20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com
prerequisite-patch-id: 2d2cba33f2dfbb05b620484e9c46eb31306fa72d
prerequisite-change-id: 20260430-shikra-smmu-binding-7befe45ecf2a:v1
prerequisite-patch-id: 657d2fa91247aa0c222b595c41328087f04f01a2
prerequisite-change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2:v1
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2:v1
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-change-id: 20260501-shikra-tcsr-binding-fff1689e4097:v1
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2
prerequisite-change-id: 20260501-shikra-wdog-binding-33873dcfa81f:v1
prerequisite-patch-id: de5184831054bcb48889fca16b2f4b5e95da9935
prerequisite-change-id: 20260501-shikra-qfprom-binding-c262fa19640a:v2
prerequisite-patch-id: f284f0dc01674ea0a78c8cf40ada72a7a1636463
prerequisite-change-id: 20260502-shikra-llcc-binding-7832b24ef74f:v1
prerequisite-patch-id: b9e53d2b5b494d4a957a691340fb2563f3dd681c
prerequisite-message-id: 20260508101544.736317-1-monish.chunara@oss.qualcomm.com
prerequisite-patch-id: 2a9d88175f19bfdb9495a704681ff0093da5566c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


