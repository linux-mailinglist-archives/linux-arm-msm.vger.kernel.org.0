Return-Path: <linux-arm-msm+bounces-93979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD+1G/uVnWnKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:13:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F8186C76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95EBF302E7E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DA538E5C1;
	Tue, 24 Feb 2026 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BahMVJbt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOrgMgL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B138E12C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935222; cv=none; b=IM5z28chOYkVMgtqtLlZmzHicLzuySH09YziLWq2GwNS95nTAq5Kn/LRTZVdDb4K5jl5xlLhSMVii2e5cOxzRpOeSDQpUt7Or/TBeUvdja+swuUs/FXbmhudya2aNpfwa+yFnzNcPeO5ZLz2TR0doIvbVXW+sgNbc4BzSq4H+w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935222; c=relaxed/simple;
	bh=9tRw8ybuY+HmJKAbv3GjcPfZHybaXrl4c/ruMTiPmNo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bkF+nW2Hdeb+ScGfVOEzo8gHOUT1CdJ9hdwhtyWxWv3LRxEk+80WVx3H85QHgJTHewatWiOm/8IrZHrZki3tmY0Ix3c71CeW/tS3o15r2htvFkZxWigPi5fmhNc0U2+szFvCXCEOWn6DihvNTt+6Fyb5heB8xd17ts42Ww/Uyqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BahMVJbt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOrgMgL9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFTrq3570257
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e5E7OCGmsaFm8k8Rdql6Db
	2gqq+LCRJ9vtCK68v0DXE=; b=BahMVJbt1TBxiAOyLTa/TXRjCsUBxavPx30z2o
	QwJANyeQhfU/KnzSS7ENufjlACuCQAbau9H1PPvtZpn05u6JvWhfl3Sg5XepSoTU
	n3c0+iI6dtQbX/hW67+jIkdoWNmI13I3leYkIkFrSN/yePYOVlfDprJ0t0l5Nh/K
	aE6MmejFKvi35wc5bR7iFDM6XSqaS2C7w9lTTj0m1gLMVDd21iMQgeFnpiMIdGJm
	w6BQFpOcWkcMw2oaiREUjEmLitRk8TecafxSzjplDTjFX7XavpKKR8S6tScSmYJ9
	2DdkY+K7Gb3cSp2Z9sO8cgZRuIqqH2cVyksXTkD71kqiFctg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rc64b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 12:13:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so4002492885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771935219; x=1772540019; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5E7OCGmsaFm8k8Rdql6Db2gqq+LCRJ9vtCK68v0DXE=;
        b=DOrgMgL9XHAs2+lYN3gBLcHgyFW5m1GMR4SoYdvhQZHz/ZYodPxfTKOQwGxVKAZIkw
         qXXpk+BNVLnkoZ1S6866aqcUsLZ2n3JTCVchJsnyIKHG9ftNINXNvpHJQHD3BKnOQYP9
         SoZtYy8y9bUXj0f+5ArqnNdZYpEqJxSy1fs6SI0Zi9j4L0UtCqmJtayH+PmwuWWKQPbf
         rE11Cae/9BtM08kJs33ur6bJzFV7eE0RJEvd6nZOOtRF4xLfeLXfwBIv7T5OJPf1Gt6V
         ktRVFUX6SDeJ/lx5pGrP1azG8pCdN8gYzlTwp0tC8d4LzPfIHnKkheNUlboOGGByMpK4
         6fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935219; x=1772540019;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5E7OCGmsaFm8k8Rdql6Db2gqq+LCRJ9vtCK68v0DXE=;
        b=WxEFgCcF//xJnHLaZVroMw5BxQl7mfFixknRU4+/ULG0yCSNfNJqPig8yYXhXu7xoe
         7V5T2Kekgdy1My9MXw9LbeC3GRbAQ5REw/EfzxSW5OFRi50/9DMHU9BvoyWsv6xxA/F8
         79qs60ybL5s5xHfc+6wuQdU0E0DZhRBE5QLlIJjidPI/HEkV6ustj3A9xmKy6xPCKPXY
         1OYVLH3u+p1oggCmcxyomv/S/CIGnyZ8O/IqdOYcMWaeTEgrVEIoJgzbf9t3DVp2EdWK
         rXhqOvyqCzsooUZaI+Kjg5QK1eBtcyYM6lKeaJ2My2R+Lziq5WQXm8rea1+BrYezlBV0
         xZCw==
X-Gm-Message-State: AOJu0YyEFA6WVrC5s6G99XY80VqscFImY5U0Wsh8l/N1UOae5mkT2zY1
	F/iFH12zFoTmoKTjaURq8vTlXu5u/Q4cJwvs23q7NQmzC3PHBmC2dPcd47KhBiuPYM9K30AK/9U
	h+ScAo3V28MRe/pna1dIdYmbnclW41NCXPNvNsBzci3pVjXorps48pwfcyxnCVQNDfmQQ
X-Gm-Gg: AZuq6aIRSDDHVDv1WPv09PpZBtmkq8dI2Fbf9muKkssWMyRIRkbIELcI1DHx+il28tg
	OnnpiOyrg4l0WxyD/tMMSM3uVgzgiT9N+iTaYzfYg00dOjWhXF840pHXucdV+FH7zBWBatCe3O7
	TXbooD87oHnkdDHRSiYQQTSqRQb3tcEWyqv8Vz5KAFd9tF7wqiXv8Zdxh3y7+exd2+E4h9xluPT
	IgMxCgXVF3wfm2vOMQU0zk6eRT06a6cOSKGxfe1oDIX4lpbZCCwaBv/vWof+tXkOVzalzeKLdIL
	CBkjpJbFJtj2W1or4bKor7M8cT2ACxjlJpwqBoGKGqYkeHs1ouKTUHw/BuTzsUJJ7Jq38/lgf5A
	oExR6+dIbIVYrz64UQujKVf1ZPUdb1A==
X-Received: by 2002:a05:620a:29c9:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb8c9cde15mr1515492885a.3.1771935218688;
        Tue, 24 Feb 2026 04:13:38 -0800 (PST)
X-Received: by 2002:a05:620a:29c9:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb8c9cde15mr1515487485a.3.1771935218063;
        Tue, 24 Feb 2026 04:13:38 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb4bb3sm262741255e9.14.2026.02.24.04.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:13:37 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Add base support for Eliza SoC and
 its MTP board
Date: Tue, 24 Feb 2026 14:13:24 +0200
Message-Id: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWVnWkC/52UTW7cMAyFrzLwugr0L3tWuUeRBU1RiVpLdix70
 CTI3aOxJ4sCRZF4I4AC9ZF8j9BbU2iOVJrz6a2Z6RJLHHMNxI9Tg0+QH4lFX+NGcmm5FB2jIb4
 C66EQ8wvrZMeh08GrzjT1zTRTiH823s+HPS5r/4twuUJuGTM9r7XQsqc1iUqBrdD5tJeR6lZm8
 sguggkWsBdOWx2I5P1Yyt3zCgOOKd3V44r9D6SP2cf8WNj09MLWUNhFVaLsOfLAeY+9/SpR34g
 xLzTjmHOdi1004wy8M60x3nDRfrc/HEb8XbsyleMRrfXBCYXq8JwwJ1ZSWnfpHCgDzkouwBxG4
 rSGattO1FKElgTJlpvvSjclPyaI+WoCZ5aE8grAcRCHeyuY9r6wba1WQkjv9fFJ55dpGVlE+tw
 8Z7FKBx7pMPSvhaGpFDaoGx5a1TnuLYfj+G2pNwU0N53prFIufJEm7KczMeMyD7sx4Hre2sqy5
 t/GbB/A9SIu55P1JFVoq0rEm4f39w+r3MCRVgQAAA==
X-Change-ID: 20260219-eliza-base-dt-9290a94fd395
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=9tRw8ybuY+HmJKAbv3GjcPfZHybaXrl4c/ruMTiPmNo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnZXs8NMM1YHxtwVvC8/7MrE69iL9HA6vfFKTB
 PCC3JxQONqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZ2V7AAKCRAbX0TJAJUV
 VuIeD/4r/5/BhR+XRWkJHRPCvrE+GzpyI223ssZS1dYLPxDy29sFoFxc2ZmaAUxpZrA/7LWmFgx
 /81EPBmlWqqrtdSs+2hHJIzbFb/COVAq/VVFC6MANusUSs4RPZhSzLKJLMMR3n+I+WoGpbO9uJT
 3cLU+X9pkdl50GzCt6E433C7aZ3kGAcveHhsWNQtxzK/IFezT5cnAAp53ns4hxo/duIjkraQcjN
 dGEI5gT3IOzH7WL1fZt1VNCu5WcUOUnObsE++vPyD26GBJTBUouwVSZMi2rBG8KT7IAGlOraCk9
 ZimQqELBJgfO3csZOsleeUaGMUHBme5iQSMGcG0hTn+Zuws5jRzwbxYtxxfYF5kTilybWm5EfaX
 pE6682/n2cALxyK8Y5kItltx91/07/Z3RcVR+DMGw2Q/kyDO6DsjkvsjQcjNT6m8mQNvNIWtsIY
 hmUbmQOF+wwucIdyGyEbCpkmzdgcFgXecVmK89HWnvB8bkar5T1w958y7m5mjfsBBnCO8Z3Pn7M
 bk1/LUeevkb9F5fQ385CPPm7PflUY4W9HWumBGSV+w5huIcUKHDWabXI3GRfVT8gQwZDrdTI2Hy
 B4DtPvL+RVmMK24H5UW9TdTXShfj85L2LNiuchexqzBeQjwELgVEdGWT2xmYMZc7qVCj54xKawU
 aFctEeVsUzL0byg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: PrxKOlolhRWU16YKfxl9741P4gDrmAIs
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d95f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mjoqc8cEMnAhSjs4rzQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5OCBTYWx0ZWRfX4kmGmmC5/sLk
 PsTnoYmn2LGIYLHaXmQguoJUFKlxFzNND0/ihsJ8hh+GPUdqp0uvX3AuLSZogTE25bRiy0+JhVG
 T6w5NTLVSi7j8jXo3S1WZJLhWU1zvQxJ308C63RGJEeh31TbQ34XYSLDgGHQJkydVag30IK2XWA
 OcE9mOYiLRyH2FkcLKjBh67gzMAACVoh9V/L1+HvJEoPYMQRjSRWjqBRaMRtTugg06yS15va3zf
 OpdMZKd+k2cOMopNqyetmnJRgMy389EIZv2gc8kjsRdE2rahpAUnFdypQhSpjD49/tObIPs0QF0
 eLc/6t56n9xFYRowL5/OdqgUziToXD/QUhqFYIRjixoZw6FOrKhb8VXXp+ePzFs2DesQSJisVnv
 tshj0d9ye/EKETQxqi5NEeWIssGfY7Ri+MXLKoYziS3Va4uY/2Glg6U6+wM4rTSrvXM9PvK7bYU
 LgHONqa8knfYBgf+X7Q==
X-Proofpoint-GUID: PrxKOlolhRWU16YKfxl9741P4gDrmAIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:url,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93979-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D4F8186C76
X-Rspamd-Action: no action

Qualcomm Eliza SoC is also known as Snapdragon 7 Gen 4.
It is a high-tier SoC designed for mobile phones.

Full SoC spec sheet here:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/Snapdragon-7-Gen-4-Mobile-Platform-Product-Brief.pdf

The initial support is basic boot-to-shell with UFS and
debug UART, while describing cpu cores and clusters, with
cpufreq and cpuidle support, and all necessary basic resources
providers. More support will follow.

It includes support for the reference development platform
MTP (Mobile Test Platform).

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      dt-bindings: arm: qcom: Document Eliza and its MTP board
      arm64: dts: qcom: Introduce Eliza Soc base dtsi
      arm64: dts: qcom: eliza: Enable Eliza MTP board support

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts          |  409 +++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi             | 1304 +++++++++++++++++++++++
 4 files changed, 1719 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260219-eliza-base-dt-9290a94fd395
prerequisite-message-id: 20260223-eliza-pdc-v1-1-fcb17464fee2@oss.qualcomm.com
prerequisite-patch-id: 902f3aa0ec7e0c8042a5e86d946dcb923b88eb32
prerequisite-message-id: 20260223-eliza-bindings-phy-ufs-v3-1-2b0c0f00bcb6@oss.qualcomm.com
prerequisite-patch-id: c420f3c7a6335136a1faa5fb8f127ee058b365f3
prerequisite-message-id: 20260224-eliza-interconnect-v4-0-ad75855d5018@oss.qualcomm.com
prerequisite-patch-id: 96d2e301972dd7861a836b9a9183c7ed99a56ac1
prerequisite-patch-id: da335a27d1cef405d8d2e4a61ce643fd72c5d236
prerequisite-message-id: 20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com
prerequisite-patch-id: 0ee49a1348a7a9549b16352d04be2bb767239551
prerequisite-patch-id: c86d643ce88fe8b85eeab614d1c74ecb17b4de24
prerequisite-patch-id: 4aee51343dfe4b85cc8179d102335142a89dfc4c
prerequisite-patch-id: ad363ca863c96004b91d55ab33e6d3a323556043
prerequisite-patch-id: 747b4bef32c8c1592aee96112e78633325d2aeb6
prerequisite-patch-id: fc60c5b509905ae482c95daa4af2c654b015b298
prerequisite-message-id: 20260223-eliza-bindings-arm-smmu-v1-1-7a35a76201a5@oss.qualcomm.com
prerequisite-patch-id: 8c34f07d3453ec6329616ff14cea4cda79a7243c
prerequisite-message-id: 20260223-eliza-bindings-cpufreq-v1-1-421f8e1e2805@oss.qualcomm.com
prerequisite-patch-id: eea3bd7914a7522245f785e39fa9d718fde4c1cf
prerequisite-message-id: 20260224-eliza-pmdomain-v3-0-6e13d3aa70a1@oss.qualcomm.com
prerequisite-patch-id: 75306851b715591f788c380a1a57ee0cd5a1ccb9
prerequisite-patch-id: 7c8df43dc618ceb70f059326d1ea985842b132f3
prerequisite-message-id: 20260223-eliza-bindings-scm-v1-1-c88643112dd4@oss.qualcomm.com
prerequisite-patch-id: 8c291ebf156ec065671957a12a005b7fe8eaf2b5
prerequisite-message-id: 20260223-eliza-bindings-crypto-ice-v1-1-fc76c1a5adce@oss.qualcomm.com
prerequisite-patch-id: bc260b285e82d870c7fcd33295b5640ad10f3cad
prerequisite-message-id: 20260223-eliza-bindings-interconnect-epss-l3-v1-1-fa83970d60ae@oss.qualcomm.com
prerequisite-patch-id: 869a3bcde6d4e187bb24dcf5e4f2e2a51bf68273
prerequisite-message-id: 20260223-eliza-bindings-ufs-v1-1-c4059596337f@oss.qualcomm.com
prerequisite-patch-id: a936477b06c1456feba36ee3085607920e2fb2f3
prerequisite-message-id: 20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com
prerequisite-patch-id: cab7c1825cf9d725f295396f954fd25e053732dc
prerequisite-patch-id: e85e9d83f3bc4d4bb6952aa7b916dc4c434e0cf2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


