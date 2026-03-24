Return-Path: <linux-arm-msm+bounces-99694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGHbLfmtwmkyggQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:30:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C43180BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE3E33069744
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AAB4035D8;
	Tue, 24 Mar 2026 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6dop87M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kE0ACAJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D94405AB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365151; cv=none; b=IYPTL3q+WnGeNDEMN8WQHJRM30okykJj+WkUWHxVdV/UBFQBib3xLVMaIr4dVH1wjRFRq5lDNGKAlCEpYebIZbTLy8+0Wc0wGDqHVner52Cd14iMcAMiioA9IzmAldKdOwKYBwsbrV95welSbeBrLDudf2QykpaZhQyIlK+9t7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365151; c=relaxed/simple;
	bh=eYQEb6YCnmhcyG1On8DU77NmU0ONkm+Q7bBZ6L5slqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZPXDdgp0xDPbvYVQeUYPbLdH63tZGoUl/1wM6IVd9uFRahmI/l/P7MMNGM4/f1R8A/TS/v8UHzkXF2nDIorMTDp7ELeqrNQe+r5by7WfeXswvGWY2LS8TNGQRzAsNQgcYb6ld/h7F1Lu4SXGmy3n0unAFV+JRLXW0vRngQIs+eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6dop87M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kE0ACAJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9Zk3a3903726
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SBwNzz8ZwWwaD64iiMufvm
	ZlZC6DB0cfqGGIlSCwwak=; b=o6dop87Mw06wZ/tjCcg8JGdNVHxFhPQZiwjCBe
	f0rMaxZp35EKOn8wTesQNvHaxvsAEjtmN5TfLVWsj2bLM09sQVG+ia2NScdlxVYH
	N5I2WoSc/g/3Uqp/y+/8+dhJRyP+YjHRxWXKIqWYnlsrsJTjNgunUWmpooBEevnC
	asNoTSozhoYZvPRtXdSP5B0IbXwCZwIwmG4tghxh6viZqB8B1Jwtag5Vp2RlWDa3
	ZinTb/AeU3mqIOwQOPLQ/62z2Ls+eMnSdv8fci8SYqUd1i+a8w935AGmVWwy4t07
	4og7hIC8CaZBkeeEenRMDk56DvpIhGpdD5sVd5Nsi8luB6KQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0jhmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:12:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffa63f874aso7175059137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774365148; x=1774969948; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBwNzz8ZwWwaD64iiMufvmZlZC6DB0cfqGGIlSCwwak=;
        b=kE0ACAJIADeVXPqD2+X1f4rkMYc/JpgJHU5dVPsgXsqD6vNqCRgsQSTd4Px9s/uKiS
         L9dBwiAu5//72QwPLqE23+GjL6bQEhwKjP3Ynhqb8DL1dqCfQx/UZjOZiqKlZksgFiIz
         YJYbxsRCN8EaXhfEyyJPqBt+Eaq5nNhiZT2T2ltJl74SjP61j/8wQFnhyZ42j4Fb07yP
         j1GYTH71v5z+k8xpJx9fDGP08a/XoJaMBmVyhlpCbQuCYVOtzFo/vHRBtvxMJXjChqu9
         n/TfnZUdTUpkDMKDS+OInJqKy5jf7Ox1BZ6jJE9mep6iWhGlT5ztRoUgi+1eqS73Rr86
         T+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365148; x=1774969948;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBwNzz8ZwWwaD64iiMufvmZlZC6DB0cfqGGIlSCwwak=;
        b=ZwWj8Eq1Pbtw5mayDTxwvuUi8+UU4F7hssVs4nqpZOnTPTH/Tuo0nTry2Db1dDkHDT
         h2kPpWe5dVsApFwCQ2KbBr4rKEHLbbJfHPQvbcAiDFWFnnjMM9/xirCL7AthXI5kQJCn
         nP8U9ZMsRyURNdcvJZQ8f6uhO2OQfR3VNpVL1fNH2N7Ro89wv7aNB4sjFvEPxqnMtfqd
         xqZl/Ea6I2ay/ok3lWE82d4jKdwhCha51t1TtZ+//XsA8nsSJicoTr82lUO6QZXbumIC
         uoU4SRTxCJfiH8gHKkfmPThU7aCuufQcvhN5Ex+qTaA3seCjEyEHRaYu1KyWeOv9k1qo
         sZvA==
X-Forwarded-Encrypted: i=1; AJvYcCVeLlPfoJ0v53LE7Mn6mHkxmJJg+lXAEhkorT4/Mg80G3A2KcKMwI4Vq9zN6TlOJsbV3N22bIIxsst1DW3n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ll6eVOVAtdHJuS5kuZ2wEWSxJMVlZrikU64B0r4HiIPqiqvw
	HuCQA8Clrp9fySRpzLoarL6ksTwyR0YODzL0XfOa+CYOtrobVYGDE103lw236ZYV3e+7rV+T5sC
	aRLulvJaoLJg3g6IJTxCgZpT8WVapjRrNeLy696WF+6yo+5Kiq7bFXvVI5waw9HLeQE0V
X-Gm-Gg: ATEYQzzU1PuA+w41usP6HCF9CaeDtvArHfNzymY6up0bBjaWC/WM8Sdfq3P+JK1h2QE
	0XQlI/bk8+F47ZcRKcegcVD+P8pMoAcCxVMXw9QRZYFX2vViMvUapcJnqDg/fdLVdplvtvIk7yG
	wHFYrjC4UYVLR3C5eu30bxvUgJykpbZg/ENs9OknAoH8ChnmJKuRtNvMVP+RJJ2gB8hiPcFhQVp
	UqCkRg3DNZXFljuauzwD/apdflhwvj15tLn+QWaoafcps9GpEGp6DAVuyhlHWdKgC0Hr36qFvOT
	phQ+aOhwoW/Xsf06nmcLdGi+K+waCRFltRIVdS6QTHUmJpO+xkMlhsE0rnni5ZieMQCoTCpU2F9
	mBdDEx4Po+w/fJsVqrlPyBcsqkPk=
X-Received: by 2002:a05:6102:ccc:b0:602:b370:7814 with SMTP id ada2fe7eead31-6037903055emr127911137.7.1774365147697;
        Tue, 24 Mar 2026 08:12:27 -0700 (PDT)
X-Received: by 2002:a05:6102:ccc:b0:602:b370:7814 with SMTP id ada2fe7eead31-6037903055emr127884137.7.1774365147002;
        Tue, 24 Mar 2026 08:12:27 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6c0fa6sm25506855e9.1.2026.03.24.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:12:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:12:19 +0200
Subject: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and
 Bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANKpwmkC/42PzW7CMBCEXyXyuYv8k0DCqSceAPVWcfB6N2CUn
 2I7aRHKu9ekPEAvI81o9O3sQ0QOnqPYFw8RePbRj0M2+q0Q7mKHM4On7IWWeiuNbODc3fspAKU
 ILhDwYLFjwATfnR2AsJGuVCWjtSIzvgK3/mflf4rj4UOc/sI44ZVdepJftcC3KV9Pry7ayODGv
 vdpX1TK1LJWWJuaGs0KW0fkdrjT2GhVOWe3XJtWrvSLj2kM9/WjWa2wf46fFSgwaAmJqCpN8z7
 GuLlNtnsO2WQRp2VZfgFKCtEjNAEAAA==
X-Change-ID: 20260309-glymur-dts-crd-enable-bt-wlan-db90c414ebaa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5581;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=eYQEb6YCnmhcyG1On8DU77NmU0ONkm+Q7bBZ6L5slqQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwqnYx5Ls+SiEgM5h/ZdkCoDCbX6alV5CJon3j
 yIdKzVo7heJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacKp2AAKCRAbX0TJAJUV
 VjDaD/0WnYwPYjxe1rlTqM9fbIZO0gpgMoOloQTgmyfe3zssSBsj1bPACBcpVdPV0U47PMlgrGC
 1rcSIxCZdRnWMWBLvLbD/+UgDUim2FH19X5nlWt8/Mez9zHij3ex0sjvwzGuq3NipdXcbbk0KpL
 UtQouoIoOVqTO1IIbF7qycT+cGQpg7vdE8LqVTUA2u+BlJ/AymP7ejbT3VYEY5rM2ZmPCrBwNW/
 weAz7b7ttFxecYCIVWZtoixIf/UPrysUr2r44Yk3MjisiGOcwBi7kYMaNSwKrR196piYfbPD3Jh
 ormZ12cRFL/RWnv1e5+fknjW3Lp3gD/vl6RQgujUouEJN5ONCWau50dD0bdWJ+9e+lRn/Nknu+O
 EpDEd8L5kVRhnAgcsPk7pLhji+QWLWTkLG/IqLKxTjuwsTZL+ctBR+mo7l/Hq0nwBxN5RXciFQH
 XKgb2tlGG9jB2omB1kIBYZtTlqQWU+w2iDzBikmhEWtoPuq/Z9+cvV/9jjP7B/zm/X2hLfwpjdu
 fYUO1LVLSGOI6Q7WcWgRn0b30o0NosofBr0p6Fgw9o3IDe9BiqUKycyttLBTBy/rxgbWCmxay2L
 SysuOeFQ7el1wLZCGljf8nj3aEyQZFFownnC6bHlzTp26HnNdN510WZxsRVj3tk1NPPV30CpKf1
 kG7BNzOV3uvSsuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: VsMTdzwjFQJkeLQtJ49Ck76fmPLGvZgZ
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2a9dc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BeTJHSNCMgFxTTzwUYoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: VsMTdzwjFQJkeLQtJ49Ck76fmPLGvZgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExOSBTYWx0ZWRfX/47QvR+oEsXs
 Qjkbjc2BaM8UeYcVmLUm42ipC3Di2fFUxvcFgQvmJgjiqfN2RKzhk7RAc6efG68SXYogBwaojA2
 Yz5qrDOEZWEqdgz35T/kkQewIsB+Tay/YI+t9vhPaEqSUsfSuhmhLZ4+AucBEvx3DNU+ja9rEiP
 WqOC6qLoXGU3XYoZMyNFjCxi/3ystM5Wmep5thczu3+xLehE00iLNssl62IvqgcD5JqeXKqTbOp
 vBt5kXPJtgJVa/BwKmODEpb2oruDci1LEbpKmXk647YmEUjcfLYxObckVwprlRm17LnlGo/eEvy
 SY1Ti9jRMoTgSTmYJ95yUFV/qXPbLLG8T7O0oNfCq6OmQw5T2CIw6DvSTIzcxo1d1gXJMhVGxl1
 Ml8xdWrxTpmcJxI8ALhmtqtWiK+CMcJf/IRxDavlh/Cay+QUteST+pCvKOY0UNqdqehjP3qlH3T
 i5tnKtnYT/nGJyCKwNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99694-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B88C43180BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
combo card.

So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
the PCIe WLAN and the UART Bluetooth nodes.

Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
benefit from it towards enabling WLAN and Bluetooth functionality.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Sending as RFT since I only tested this on Glymur CRD.
As far as I know, Mahua CRD uses the same WCN7850 board, but I do
not have (yet) access to a Mahua CRD to test on.
---
Changes in v2:
- Rebased on next-20260323.
- Address commit message issue reported by Zijun
- Dropped the vddio1p2-supply as Zijun suggested.
- Did not rework with the M.2 connector since the E Key is still
  under review on the list.
- Re-worked so that it is done in the generic CRD dtsi in order
  to add the same support for Mahua CRD.
- Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 118 +++++++++++++++++++++++++++++--
 1 file changed, 112 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index abc6cc8bb0a8..2852d257ac8c 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -89,17 +89,27 @@ vreg_nvmesec: regulator-nvmesec {
 		regulator-boot-on;
 	};
 
-	vreg_wlan: regulator-wlan {
+	vreg_wcn_0p95: regulator-wcn-0p95 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "VREG_WLAN_3P3";
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
 		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
-		pinctrl-0 = <&wlan_reg_en>;
+		pinctrl-0 = <&wcn_sw_en>;
 		pinctrl-names = "default";
 
 		regulator-boot-on;
@@ -118,6 +128,65 @@ vreg_wwan: regulator-wwan {
 		pinctrl-0 = <&wwan_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_e0_1p8>;
+		vddaon-supply = <&vreg_l15b_e0_1p8>;
+		vdddig-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -382,8 +451,6 @@ &pcie3b_port0 {
 };
 
 &pcie4 {
-	vddpe-3v3-supply = <&vreg_wlan>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -400,6 +467,21 @@ &pcie4_phy {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie5 {
@@ -575,7 +657,14 @@ wake-n-pins {
 		};
 	};
 
-	wlan_reg_en: wlan-reg-en-state {
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
 		pins = "gpio94";
 		function = "gpio";
 		drive-strength = <2>;
@@ -589,3 +678,20 @@ wwan_reg_en: wwan-reg-en-state {
 		bias-disable;
 	};
 };
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};

---
base-commit: 5138081b838d92e1bfcddc7b72b9215cca6e83f0
change-id: 20260309-glymur-dts-crd-enable-bt-wlan-db90c414ebaa

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


