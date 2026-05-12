Return-Path: <linux-arm-msm+bounces-107027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJALAeanAmpSvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:09:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD0E5197AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29E34302D511
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 04:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2385630EF90;
	Tue, 12 May 2026 04:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLMvUSye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCTIqn63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B454D2D7814
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558918; cv=none; b=t910lrnflL4TjItfPNHe0ufrhZL+bFRClo4opFPBndXPINW7rDw5NZgHZK5a5CkG0tlImuQyqOoS9cXogU+DwQPcZdCfFNZvp8L+yVtCaiIhOB+DBMzV0/uoHfE3g/lPeL4obkkBpFCu977vKzN/XAMoad+A4y5MF7aDw3o0Dc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558918; c=relaxed/simple;
	bh=kqP7cS9MWJQk4SwABtNVCsRBxc/cDldsdq63dxndWoI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UIsLxeLM/qKIqJxYHzL93sm0EtGRMViZlzLe7Df2sSL7kh0xefcSbVtKhqOcfSxAA1YjapmNJX+rZwInKRk4dqWSa43OWNU/IPym06pQAbY8RKTqLEfKmfCb5+l9j/zCV0/HlO8qgejbi9NlDzjilSBaioCcOpMEvJX6WUd8F+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLMvUSye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCTIqn63; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6hdI2803760
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rd1E+u+bedvehaMv+PHJC4
	fcSrBbt21nM9G/UBz0nPw=; b=VLMvUSyeQ3rb9EXTPdeW9jyTM4fVJ9pZrJqssD
	nbJplBVBJ/LyHInMhhHZ34ioAcJwUrDLEXRm3b7Jo64YMHqDZ+8b5e3XUNCts1Yi
	a9bwC+qL0YZ6BYQywZvanjIlEqOpkUTo2xCm41LoYrq/AFBMbWi9QOKqTBOC7d8u
	CMIEN40FCURtd6L6KlMsDey/oHqNSiGoZ80IK6zYBUybQcUdvJtnDlEVu+SqDdqi
	6WqLiA/1CUgoUiOdit4c4cXXio9PBBtp3JzHx7t85RT0s7ikbB5Rusd4l6MjR+fo
	pQJ9MGZJOKd3DOe+SW6wRx9IHbgfrIf48P/zyVdCExh1c8OQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv39e1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba6fe41283so59226755ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 21:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778558913; x=1779163713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd1E+u+bedvehaMv+PHJC4fcSrBbt21nM9G/UBz0nPw=;
        b=TCTIqn63SduPuwSlm346fRRVi9pEcnvtiR/BL3Fl0+gs7GBPREsQC110cNaw9v7sJa
         IFTFq20kXMEF0dBG0I0Zvw+Pnyj3Ioaq6LKWJKt9DPuAVb8L9Y0jqsHUYGIrLEn8L8+t
         rqcuAC6zq/8HGdgFIuvLTUqFBQcjgRgUz4uRLtPeZklJsOygJIJGDYTw0fNUiNMsiItE
         4gD7o74tecwDgYWppSnLUtXiIm4hcdD6OAryuHzI3KFWVMjnnJOpkGFIj+ZcLxB5VrOQ
         zrVBWBrMDEzXe2tFkcfY1VGPoA9AXm3Y+gombqCh227Fx1s/rXEdNtBcWEB5HuqF7Wxz
         oX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778558913; x=1779163713;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd1E+u+bedvehaMv+PHJC4fcSrBbt21nM9G/UBz0nPw=;
        b=GImYeJrfLNR2S3rcOfDjYcIsw0RzbrpRf/pXRdccsfx8UQ1SHogB0utbzAPGGq3e3z
         Fq/DifkSMfKU/VmvZVLo4RjKqqnBlEIxArzZWYBxpc0qrehE22W4uWXF9PdeUXWbAj2V
         v0/EEWh3uCwF7WmhtdWp93E6RKAxAUIJWNaB2wyANlmgH7U6b81I8q7qNgIh4xT1ruY+
         s9WxM13nnT7hfJW0cmXIDm3HRGY+8yHtw8MOOLRXS55I8vcdDpIxMrgbSzWBURTLG2RS
         rq5OR3pzWWokeWN2zTauJxtb/1PRc99S6z/e/wjZLB8/OKPYz2W9p4I/nuJgw/z+hvoF
         AOzg==
X-Gm-Message-State: AOJu0Yw+9M/1sfpvZJ+SAeyCPJ+5shi4d6KoKkoW77318AY6m9+iN1Um
	o+EhiGi17RGXBUU98zLbHJbCUNb6mthnAQBcOy+ohRb2cBZQJs/wfZ4Qyb0YvBrw6bLeIqwPJsY
	p296A07tHcFhDKuJyLy2Kw55DoqJY1uWFbknTPiTxhgo+HXEqEGgyvRzHId6QeNlGhDmO
X-Gm-Gg: Acq92OFu3BdnmL0mpwdIJZ2H11+dxCi/KbBy67Z96rdEVEKYl1ulKMAYFiRSD4SS2Id
	B6VGGssX9X+QZDj55d198I8Rp2A3YW+NFyrnNsQ0fYv1Q95K/4NI0Uo+YxiNliNM5ywG3+cF0th
	8Dkk9l2/XMXj5YMleHrGHKmsh6fdz900UCTVU1U+HKtIqf/ayT9B2Xfste17IjRZgqbMMyjNk2+
	YG+JRoCeJDdLku40tgMRWtpND5qk9tGELuYaxTW2IvuanvUCAW+dzEqRpeP2enI876WG+KnY1Xv
	1F/R9hXijDlMf9G5sMUIYu1gDIKRGjdrnufMXhh9w6rr8M2l4s1uHGY2Kwql52+dnBOPpJgy8FR
	3JuXkujBr3FMyA7uNKRwKdAficOA3jKRqeoO2
X-Received: by 2002:a17:903:289:b0:2bc:7eee:200d with SMTP id d9443c01a7336-2bc7eee20c3mr130044375ad.33.1778558913279;
        Mon, 11 May 2026 21:08:33 -0700 (PDT)
X-Received: by 2002:a17:903:289:b0:2bc:7eee:200d with SMTP id d9443c01a7336-2bc7eee20c3mr130043915ad.33.1778558912667;
        Mon, 11 May 2026 21:08:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm122646725ad.28.2026.05.11.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:08:32 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add initial device tree support for
 Shikra
Date: Tue, 12 May 2026 09:38:03 +0530
Message-Id: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSnAmoC/42T22rjMBCGXyX4emV0lp2rfY+lGJ0mEbFsR7Kzh
 dJ3XzVn2LrtjWDEfP+M5h+9Vdmn4HO13bxVyZ9CDuNQAvJrU9m9HnYeBVfiimIqsSAE5X04JI3
 cjJwSrlVccMllVfKn5CG8nrX+vFzi5I9LkZwvlw/F7easx2l705vCYOfUI3CKaCO9dRK2J1Y99
 3GlGMVXqgvWIkPAeuCCUOpWiI862rluig0RuEt+t/R6HlNGmikGgnnDm1KOfAWnKU6uu7YLQjW
 KGQpa2S+4a/autFnwctr+kBHFLfcOAJjB2xP9FGb3N0YdejO+dno499BdUouK8wp841vJb5OKP
 mf9LCMwJwpL0da0oYJRRNAhhbwfdH1Ykp70HH6POdfHRfd2jLEux6oQF4rgmgpFyxr8UGj9XSj
 HuCATBheGHVLGg+fCW6B6bZ4PNEQf76hWxrSOApGOrqAC3/c222cSQIA2DsMPyNnmdEeLeUQ2r
 ee4Vd+jf924u6OMlc1xFnRD4Hv0CFMaHy1bKsvOkeI51iurIzC9wX3/8T9uI24YNZR7UPxW9xO
 bG4KJ4LxWTDKiis1xHIrPtd0vg076f5Nf3t//AQSo1x5FBAAA
X-Change-ID: 20260511-shikra-dt-d75d97454646
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778558905; l=4319;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=kqP7cS9MWJQk4SwABtNVCsRBxc/cDldsdq63dxndWoI=;
 b=xnYAwPQZNvI8hno1y4enJ0vASb+aefg/M4t4rAphz3RULxjOkXgFmX7yYO+EcW/3mWeiSJkLx
 +0jCaB7tZuTA9U5snyHskrQvnoZZzcmBPNAKGxJT8FwE4iAnLWCUEVr
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzNSBTYWx0ZWRfX/DQL0mq78f8R
 OaO8aEz4cD4rcL0MydD5LK/O0OB5D3YAHskniKv/3z2OAysZAt0OeAz/3RTJdnlPjzB5/DWrbrp
 MbL1W/mxkIFnbShm9HUsOIWpKmpZYiiLWpJZOJOM8h+s28ZnonyDoqznLqrfLLlVvwoxyE3zXDa
 fTNHkFDX4COgQ/bO6aTaasCct4YPQQwzQhfHNW9QRaZ99Gy2Yx8r7sRPaFklgd4/EsYpqN0bciw
 3YTcZDjLu1XxR6hnuenrn92SqMO38F7uZHGYQh5C6glo9EOxto2Venx4xUhb6sM8qOvEz+9sYBS
 H3BKI7IhXsqTs5YvCs3h1OqTmzQTFLi+LG4apUewD4hcZtIBoy1+G8on18VRaxC3PXdL4feLeEk
 c0WQfs1S1UAenRVAXOe+FUeU8w7myjRdbcMTOanFQFaMk55bNwdvaHEyJ0Qnhg61C2e4A5f5mRr
 FaIyTVqflRwYhWaIIOQ==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a02a7c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uX85a7QtwIfg7uBTYAUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: d5Qxmxi--AnkzOGYUQ6thD5RUULWVZik
X-Proofpoint-GUID: d5Qxmxi--AnkzOGYUQ6thD5RUULWVZik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120035
X-Rspamd-Queue-Id: 9CD0E5197AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107027-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add initial device tree support for the Qualcomm Shikra SoC.
Shikra ships in a SoM form factor; this series covers the CQM variant
and its two EVK boards.
The series adds:
- dt-bindings for the CQM SoM variant and its two EVK boards
- SoC base DTSI
- CQM SoM DTSI with PM4125 PMIC regulator definitions
- EVK DTS files enabling UART, USB, and eMMC on the carrier board

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

---
Komal Bajaj (4):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQM SoM platform
      arm64: dts: qcom: Add Shikra CQM and CQS EVK boards

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts     |  61 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi    | 112 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts     |  61 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi        |  13 +
 arch/arm64/boot/dts/qcom/shikra.dtsi            | 966 ++++++++++++++++++++++++
 7 files changed, 1222 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-shikra-dt-d75d97454646
prerequisite-change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f:v3
prerequisite-patch-id: d84e0b4c2788ab6cfcefc9806e7a6011eef8f91d
prerequisite-patch-id: b173720338ac515e3c89ab2c96d7b1b9ff99540a
prerequisite-change-id: 20260320-shikra_icc-b1fcef45122d:v3
prerequisite-patch-id: d36ec191324b7992a56c463a15ff09bacd8d7ba1
prerequisite-patch-id: c6edf2e05d1409667c9674b765dbd0917401a903
prerequisite-change-id: 20260429-add_pm8150_regulators-a373f53eb48f:v1
prerequisite-patch-id: b312905695c635bf1e3deab87b718c92adf07f54
prerequisite-patch-id: 390dee07914f18c7df08c57b3c59c25d1588b62f
prerequisite-change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c:v1
prerequisite-patch-id: 2aab0b42cafb535b31c5154002c12f381a52be9a
prerequisite-patch-id: 491f7ab91ee90ebe98d78f7a9d706208ad74be5c
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


