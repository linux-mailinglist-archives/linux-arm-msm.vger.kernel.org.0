Return-Path: <linux-arm-msm+bounces-100814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMuPKzeJymn09gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:31:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3F35CE1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A18633008A6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916A43DBD4D;
	Mon, 30 Mar 2026 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIvxBKza";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnBZb/FX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F8A3D8910
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880660; cv=none; b=tOA55wiGgp5kiTRfUM7pZmGNe+kGHT3yflYUIfCdqbkF9hgqzjyFRYKDBqvTkSD9D734um4qH3gINdy1QajGUk2BsEpuR2hYMH23LNtdWvRDXTqv2B+nJiGAsProkCwzbzhi5sTmsBhsmL9+Cc0Ju6fA9B9f/+3g3HAFxK8mAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880660; c=relaxed/simple;
	bh=SHZztl6q6V3BTfnTgfz0l+XnOXq3Ovg34Q8d3e7j3ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Uap2r9ak9WMEFV2pW75SNB56lZDA6GlZIp/iyBzSJN3bV4Bfsqzd+gN+ZtotM1fhrcMzpNS5q5f+EIhSCL/DcMqbi9PgIiq10s6xOmwYb0Vs+tW9b9B0W7rMVQnTzXKY2VF2Wivt40aEsVexTUfkTmyYfSLslvF9JRdY0cwRvOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIvxBKza; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnBZb/FX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UBZYBG4013480
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+zSmgHmd/82fbIrbbko/92
	pEEhtM4soEb4zCkM+hYEw=; b=SIvxBKza33YZnRDXBliH5mpAG7cqoH2cBJpzKY
	ffBgJ3GKdHCsc8y48xS5se7Jl2awVO2AmIwX/B3rXmkv8HcY8sJs6vXyvB1RPh/A
	3vIQVORgIymcqqeDFOSb3tvPtjupx1aYby4aVpuuStrC+pBQ5s8kZVJBBxS7TQ+K
	D3zmVC01iEM6T3A0wvTBVHB0cZKq+Vzz2lytEuzDYGIMeeeznyI5Me65Qkh9ZGhh
	wIxYwkRA9FuemDCaQMxA/6jgH+msICF1Tx2UA5pLUENMlkp6nodhXUN356r1tcYT
	Rq53CGvP5gLBk0VCbZeU92bvbUyDFfiGtyoPVIDQZ4L1N1AA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regrnyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:24:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so145688001cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774880656; x=1775485456; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zSmgHmd/82fbIrbbko/92pEEhtM4soEb4zCkM+hYEw=;
        b=RnBZb/FX6oLQa13+Ep271Ei+sux9yrksOxSKRGac5ClvEG9EULz1GKk/vgxsOcfIrW
         8xPrOdVGVESlDjiPhXpBE1qjhprIIxY/SpPUHJ+Q9Qtzw3A/Fry4wu39o56V0avWbOj7
         WR+W95AusNgZjIfRZUiryZ2etqGGh+QfEFRh+ua0jFwQyuw7CGQTGc58GEE4tIOUbZZo
         R2GxaUYwFoQvz+FfN97gYXGNDEj5stdFt5D0tRbwABspZLXDUk7ZcgBbTYcS27fqSWEa
         yMYgRvnbUDPwW2mRTrgvBhr8g+Pgq3/IpVF7ZxYc1IZHMNnmVsBdFS2cVPBC2nG3vtmH
         QC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880656; x=1775485456;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zSmgHmd/82fbIrbbko/92pEEhtM4soEb4zCkM+hYEw=;
        b=Y5/9CY3H6MYptQXEa6RztsHpCi3yObin5BE09XVc/MLrn12niBMU/tViC4GgDXD/D+
         E7i55F73DZFnZ/UZXkFNpe4Em0LohFyhzp2ttKqksNf7k3gEjZ2rhbd6uz5W2/DpuWIH
         uwcfbn1YLcZpTbwK2OzpcOxeMOVulKgq15c2jr6zg8hYJz+Ov4lxC02hnoIrgnLQA9Wh
         8YJGuXmsDk/zGuLSSf19LOZ7E0Jr9axRQgQoY48x1iYGbWCsUOfD/Yz/neWgV1TiRa8t
         tuG65/2Q42IcDyNjfvj6bYe25uN5QJ4dv3wYJGZ0a73PANMKriZQTCjWAACZvvaIJIN7
         znCg==
X-Gm-Message-State: AOJu0YwKSFpKIPD4LjrbJBTzr+iiRaUpgMlpIyQIK/FzneNcs3PKI78k
	jBTqlW2SYV5OcuVLAhfKUo20te/VtUEm1twsR0ajFHPm2pfjwxrEt1q9lh/PeFwgjzx4UWfohaD
	gZhki+3McfcPx6QVQFUAuGSHnWlbgPhjRcfmpZWuLmwy8rdPw4HI1yGDn36kYRhn0uiIp
X-Gm-Gg: ATEYQzw4QzdfXwMggS8HMkU0J7JHgGcOlZmj1ibdyVZB93GEbZaz6Jvv24r4Ddvm97W
	ArLarCWvRS0h5rq5XxCNhocQs3pU4fjg6Unf44X4vr/3hEhvdaOduXJKBoTycdeQcSBbv+wvBYu
	Bl+rjY+LpQjQ1LD7/7FDoWQ7E4CO8P7/I3xMknXPYMkWRBXUalcEpFuvnVHwVd22kchBUqKz/uZ
	zts40nqjReaGmYjd0OXbaQ8iBgNWB3Ors8zdFoLdh/rZg1mDLcL+aJ5bnc48CwuyXOTjDI+K36L
	jCwDBCoaF3m4tL2qQ6+oKkOoIidF4qN0+M89TiUtO08S2dH4RDnkdTB8WoLXmf34obVrLzG4N0q
	y4XDSsdJ1fQzB2Im26bzuSgWAfGbVmw==
X-Received: by 2002:ac8:5f13:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-50ba37d30bamr166992581cf.10.1774880656127;
        Mon, 30 Mar 2026 07:24:16 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-50ba37d30bamr166991801cf.10.1774880655416;
        Mon, 30 Mar 2026 07:24:15 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f173dsm22264839f8f.15.2026.03.30.07.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:24:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:24:08 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Enable DisplayPort support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIeHymkC/yXMQQ6CMBBA0auQWTtJpULQqxgWLYw4ppZmBoyEc
 HcLLt/i/xWUhEnhVqwg9GHlMWacTwV0TxcHQu6zoTRlbaw1OITlPQtSdD4Q9qwpuCWNMmFD17q
 pLs5W5CH3SejB3+N9b//W2b+om/YhbNsPjqHZ7H0AAAA=
X-Change-ID: 20260330-glymur-enable-displayport-8e96854a35eb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SHZztl6q6V3BTfnTgfz0l+XnOXq3Ovg34Q8d3e7j3ZE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpyoeJsl0XHz7ltv0++Rqq+YaQWBN+hRgxw8Kfh
 hFhYHklbSiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacqHiQAKCRAbX0TJAJUV
 VgjMD/9wpVn3glA3Z4tOeevT89nFK8p0ESXPJkEeHgzWo2a+IK3VoDuJlX46w2sjP4+CnvurcM8
 erhLZoZabcxlUjsHXEWdWUlOtD1GzSXrbqdh3/VX6D3ihF30vQ94X7sw5trVBj8nJeZ/mrJ05Oe
 USPnuD2uYmd+9A33kR/vD9R34PKkuJZwHO/+HeDxJUgC4IDFTMkqEUGRluF7e0x8UD8QvpElpb2
 L6iIPgliziwWMLpuI9KMH5AExqBaGQ76ixfWbSGg0QR0eQz1K5Aj5EztyXvM5U9zyR/TR/nd/tE
 Who9jMUtFbJVW7ZFy2HjaycqAyPUYZBVTcZ3CC1bE3eK6OqenYB1WayyfdOJImQkYQA4oaYo7hF
 Y18YVQaGvp4DaeMZ0X1nXYmOjkt/cBR3LQAv9PoalEZxjcvqtMJpNq2fwdLTkgu9wyscdkGh8fp
 pKadmlENTzvUOhjbM9j6KdWb6rxCT/Wqgmjek5KkU/6aAM+E6bcHPKaK9skE4Szy3velaK9ghJb
 abV9DvGEeIWAe+N+kdRgPvj3e8QAFw5vw+jXqDtSP65lIQK/71TS8HTC8Poay+FE+Zoj4gcW3qp
 3P2oSRoP1KZz+A/Oq9okSFl6+JQSscjfHI+rhcEPqgR/aUarqUAjAf1lcKbY9us9Kcn8lW9rYHq
 YaKPA53/NPM9Shw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69ca8791 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yjLBevxW9JIp8IFUU5MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMiBTYWx0ZWRfX08obyOuKMVK+
 xQ2tIK+lWQUVHz2+D/x7B9i26ckwsLeiYQFiXnPKHiejzu1QotAUPGZuXzO/4EZqQg7E4KzgAG3
 rTud96uGuvULeUaWDlEGBosLQ580q9CFE8pKKyJ9Ceoc8GlsxLVxeqEef9CBHSgJ8WnWhMyKWsc
 hruV5VUyCJCkZ3uYv2f5fC9X0yIbw9RGJVjPEJ2Ne9C9SWvjavfTV/32w8dF2L979WdoJBppn3t
 5Z5uqhr7pzbVnU806RdfbrDKRa9YPLG0oeLjlPDQpPxFNZC+qX5Y459TtU9On0Xht37WwhtnDQt
 CwodgNwuTIBQla0On26GyFblxxUFwqrlKQsHew3Z9sn283CFtMA/zMt2/+yFNobytQgKbhgTR9V
 TabY4MBPDlm/z+drqgdanwzcPG+LVbsjOURqNlVebHevLLRT9l6j8zBjIbCHQYB9rjjylE9Yz18
 U5IoLaZaTvAps1Lv2Tg==
X-Proofpoint-ORIG-GUID: FFQ_oPDK40oi0RZAMkdcqfpJE5OGkNJu
X-Proofpoint-GUID: FFQ_oPDK40oi0RZAMkdcqfpJE5OGkNJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100814-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AA3F35CE1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The two Type-C ports found on Glymur CRD are DisplayPort alternate mode
capable. Everything is in place already for the USB, but for DisplayPort
the controllers need to be enabled.

So enable the related DisplayPort controller for each of these two
ports. Also define the supported link frequencies for each output.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
SoCCP support is still missing, so DP altmode won't work until SoCCP
support is added.
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e..35aaf09e4e2b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -202,6 +202,22 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-glymur-enable-displayport-8e96854a35eb

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


