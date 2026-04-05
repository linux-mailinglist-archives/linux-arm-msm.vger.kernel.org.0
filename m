Return-Path: <linux-arm-msm+bounces-101868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APNoHAF00mkVYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:38:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDD139EB97
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A269D30428B9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9889D16A956;
	Sun,  5 Apr 2026 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVEIFMpM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQ7rw277"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5C2C0F84
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399673; cv=none; b=p6FQCKGx+UD8X5BZM9DBY8tdxb9uE0ZsucuHtMNN1fpZU1WIFesl88jTjuK72ua3KfHbLPpKCr2QuyP+nBni5HdX6shSnGnfZog4UdwCuxaFcEG9bc5dAEi5B2qnTz8ZfXtJtax5Xhra5lP8I7f9XMXKjY+6aNjGaxa0Tyx+L8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399673; c=relaxed/simple;
	bh=Hl0zlaD4IFKg1NjUgP4F3RZL1deVCm5fZzxtJLP6NuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWIF+Lj8GyVOKk6w2Y+ZvrU27JBLLZ5PWm+IpZ0GdhhTbDLgyd1ll62uM4DbhJi0eI6XX+yVBZmnmavvZ8xVS7Ny4cbOeSYeSWYkZX1FN8tC4Vx8E7F5XEwntAN7P2bDfvrR9qMMmCii0v1hQEbcN4fq/i+Ara2PQ6b3XI6WYek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVEIFMpM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQ7rw277; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63570Fd11391850
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=; b=RVEIFMpMKMSXfIoa
	ZPo3e86ZUVDI61Vmy8nadkvLlBqE/qMSGUYQhrHpp7qJWOroh03+1/6Tsbea1+XN
	F3ECjGHZ8d9+qDR5zxdzDKkaUCCXy7s++7o2h/yCnTTOwHQIY4etS7mLxLl9ehCw
	jyA5tUZTXQU+3HPXe62U71R3uDMC/+hCOB41mbD8igOHZzzHXwGOwQi8ChHGqd8s
	en36wRemjuXTsPKON/bRKa23o2jZKJYcAIpmJ4La9jNFAk3WI3bDj+5FGytIHj3F
	6dUg5t7j0I7lgzyTpH1KTPApDp3kIrvGC4y5kFXQvW7rSs2rX5awBSlwmdqykSrc
	0fkNEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7uap0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b323c43fdso71457011cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399667; x=1776004467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=;
        b=XQ7rw2771GniNjdHwC61LYFJzxsmQe2R1LYbepFEuvSVMUgBjE1ZcCsOsqLdiU8zw9
         cOIv5ZQApd4G7d6imq0+JRFC7wi42VU2PKKdrqrr59/L+U3bX5YWoX0AH93qzoRELufC
         Ojv7MHR6EHPtZZGc2HIGWiXeNsmqHkBtNR3FVAIazhvgG0f0r0zJrWy9e9IIob9dx3YN
         D1oGf7BsV3BD33PjAGRaCFVnoL9FfXrcp5RAyFwIMkrAk/hlasPH6keXkxGYn7+oblJk
         G1SOSGeGgfi2SzFaYNFGen54Ig7FuzKL8rsfehAPrUTXTkTNCMWAcQTv4UL820isfu2/
         nKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399667; x=1776004467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=;
        b=NoWE3EHre5+zFqRwyD9hWNn+S7hqlIn8NOaRwDsJ/nuLkTGfZ0tyMKG47XWexOopeQ
         +TTzqpgDhuNn4CmGXZdwR1lNsGw2MglVgsFSjX6xRx4buLfrh9UcPnOyN1jc2cctv+b8
         VQpma45RTx1Oeb0pnWtoFr6KUmnCAUW8KVy3QBC31NslJiYIQvelTswfROIczOt+LiGr
         mA1vopNKjZWn09sUGa92xyahanBHbeI51sQbRAdlNEW6YGu9/sC7n0F5/rDDKhwYt4w+
         KCmIkr80XRiJfacJknNHMB+4PUs5/OtFwdRcUHMd7TfE9hEbLXdiap2ICHN3HuEtzV/u
         bzJg==
X-Gm-Message-State: AOJu0YwRDppamCFREkdNRkVOI4djRInYoI8LU35878QfewjnrC47F2J1
	aMrkkP5yNPRAqR+EtPiblgEpngy3ecPjCn9Wbn75s1GyNZqstWPFI5iKlFPi7eA3kp69cdnNYt5
	gnqKtg0QmsbW1qgQ9cJ9Weeq978A2szxyTWtps7XEuIkYEnr5Y+VhxGpng3rHSV1bq4qL
X-Gm-Gg: AeBDiesVHMtxHBEuCZ3Mln1zgk3Sh/FvrlcHIU7VNcH2EHg4M88vK+JLJBXYfBu9+uN
	ZuFJ0Xzj2iZvfHeTI3dKBtD6S3KRPQGnmSX5Sihop4MKLK/7lmEUSpVmp0SwWMpFCJe4QnjYYZ/
	hSzX8LgGR+ADvQ13MbYbvqgK1yPcVZVe0JOyc9lo0tOuEeuhRI6OHhJwW6z43+yO5j6s45tCH8o
	fGqKIKzZTP8StOSPe8Fm9+dseDPpO/eWcBTMq6OZnHyPwLaSw+ArZNZ8B5pEmEMYYhKLWBtiF7Y
	2V+h+RXEAw2hJwSU1sIx1cWPHTtfZO8Mr/CGFTXzCb4YxulJwsBGIJyoeZyXDycxwUqGoEOUUdu
	ram689sLrmr4cj0BSM/iGisDQbruj1ux2pCgiRfUi3M99
X-Received: by 2002:ac8:7f48:0:b0:50d:855a:8909 with SMTP id d75a77b69052e-50d855a8cb9mr46714871cf.32.1775399666629;
        Sun, 05 Apr 2026 07:34:26 -0700 (PDT)
X-Received: by 2002:ac8:7f48:0:b0:50d:855a:8909 with SMTP id d75a77b69052e-50d855a8cb9mr46714401cf.32.1775399666125;
        Sun, 05 Apr 2026 07:34:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:04 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8750: Correct DPU VBIF address
 space size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-8-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hl0zlaD4IFKg1NjUgP4F3RZL1deVCm5fZzxtJLP6NuI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLeYiVcsI8vu787g1/XyQ9q0dbh9TdjeqRqI
 rrMFSpeRL2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy3gAKCRDBN2bmhouD
 157JD/9is11lENJgRuFgQ9Yth9GAtompFKYbTWij+WSzhIj0ch7c2fycWLChVDDGZSL2BJw3dT5
 jhYIU3JROcDUMvbOjNgcw7W68rqWjBk0Hltm0QFnGUiwUXGlkmULuSKPjA2kRlSmdqJI32ewiOF
 UKF44+/5BSY01Hc15/Nj1oxNSRjh9kbPzyg90iHXJ59QwPcp0oaccz1as04khsYKv4OuI8Ye1J0
 x2cLK1PnCsb5B95adaaAtFB/l0fMo6V6V0Tm/+9rJezcvURfDRBcHgQUz0mSMMfSlyqoyPRERBc
 mrlSzfBme4speAWuCSFh1thHbFbc0h8mDgVQ7l/DkTg4PK/5coVBHjqvRDwh/NFlwhQhFpLZBwy
 iqY3+BX4mEwmfFDmFUwDjpLbEaXf71rrvqfTy/9gE6fONgz+YUHPqLCuSLSi4qmdrvh3WKw4+M6
 Z5FzP19pktGnQ+VOdM9UUEMlpFYM3tAAneZQSCRK5UV8sB46AdMj5N/Hjao588jNqsDoGk7Eq0c
 +JjXpE8nE8ulKxN3JVmr4ObKKJRciTTpgmZ+t+MVTQMxvxGicOoDp/dWXewlY8ylsraI+MohEGy
 WdJBAF1hwYPZf2incCt+2S3C9qazhWKpPgAeLmVRGghQmPlYD5z9sB6+4/iA3oktncZ1GPun5yw
 DXIseaB5aVuK9wg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX0SSPRWnrsxnH
 p0VDJeKooBTUHCDmV3+p6bL7QXrfKq0EDmqnJW0S3AaTntDZDlOyHxdFe7nAjOYpIsg2M4K9+Yz
 JqidMRKJ2RKNE1EW6iI77xgaI1lmaM/C1HrinUPcThS37uHqp4Qca0UotnMlb8jZ98HW0j6V5oV
 aIYyZUyuZ3Erw0TXXgPWZn5rSMd1UtExPdzkLyfiLDm5zsJ8Dk5qUFVBZCHnHw7S52u+Nh1lag7
 eaHSYbXiWXe0wV/nfr5fHPMqYBxYvHzzn1/3jHeqqrYUchE3OUdPeTV/ggPr2Ptv+mPcslJS0xx
 ogncyltCujiYfuG+nVz0aZAm746ADj/SQvqgtmrTAT3RoXh0MMtpC1M+QxiVRUJ94EfW0MraD5g
 nnbsC21K3/MgtbPugAnQbAIq3zuuh1P4ecR5VOShLElP/iKlcGlkBgEquj8kezVAWl1LD1wj3bS
 x63sBXva6/wBwbpDDBg==
X-Proofpoint-GUID: _lE-jxeJoRhMwMcIp6hiJC019Hd915nF
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d272f3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WYllmNudUJmrw8VR-PoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _lE-jxeJoRhMwMcIp6hiJC019Hd915nF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101868-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ae01000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFDD139EB97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VBIF register range is 0x3000 long, so correct the code even though
missing part seems without practical impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index aefe517e0669..f4b8703ef856 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3041,7 +3041,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8750-dpu";
 				reg = <0x0 0x0ae01000 0x0 0x93000>,
-				      <0x0 0x0aeb0000 0x0 0x2008>;
+				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.51.0


