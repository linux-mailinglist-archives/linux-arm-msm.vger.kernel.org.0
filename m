Return-Path: <linux-arm-msm+bounces-118787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +BSOO4PlVGrRggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:17:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447E74B724
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:17:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gwZFOz/R";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CZNqyfBK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118787-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118787-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B0683078603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF58F4189A9;
	Mon, 13 Jul 2026 13:08:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E60414DF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948125; cv=none; b=V8Kv4c6wFQJTJCwuXGJ1deSl/W5DFqwFofvqtRpMM/dQZ5CDWKX8cTfXOwUwyHvI8vLfwXos1GNO6z3Bccd3dN6lBwV4ssKu0c5k7mfWrOq6BILJB0TX3Sbm6KLxamYhYtSgi3gmfpazRQRDON3gsHO59d2vw7g7BclucoEVC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948125; c=relaxed/simple;
	bh=3WLtHMYOWWG6YJSbPwoPg6vHqdpiCE8i5VjgYuBraF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYz28++o4bJ11Vb5lwGpaxjB8PpRN6UyabdmyRkWLtHR20o2iHiWnDoYrF2kxBk4wtt4bZQKqYqehgbnDw/seA7IKWGf8vFARX+0FSPU/I7tkl+ZbEU3y2qHvOT9kT77rHQwJtJdjbA3Iqk6vVHbjE7gz+DyRLuBkgInvkeDys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwZFOz/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZNqyfBK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvhA1494374
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r57t4avPqTzhJ2J5sOt/oWIGHq+WEOhtA2WuO2ZZaEg=; b=gwZFOz/RpWmq45YI
	n002hxuwWBCp7DJ4Li0RyiQcPNE3xnW27pM+kCRMYbjRdk/IbPU8shO4YWEYJ/I6
	yfa47fsXh4GmouaIZzgBWd/Zicrs4xR+x/AKOvxGD6XfEp95PY7pTVXShMQOTUPT
	m7NWntl1eOBB2CdgezL7Q9X5dI5D4NDDiaJP0fV6v2u9mal+XViqFWsvXRKnhIjQ
	phuunprbAVpUWmsU0cV2hWqzpJlpUYNnnMOXSL2sldmTLY5T0zzuB//i6/4cu5li
	z+yiLrZMhLzDPHeVE9ErXo1kZ+HyT7PRZSKP65bmDSPauP24qJa10WXPbbCHi38/
	v4w70Q==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2nqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:43 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a3994599c4so1360496eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948123; x=1784552923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r57t4avPqTzhJ2J5sOt/oWIGHq+WEOhtA2WuO2ZZaEg=;
        b=CZNqyfBKbZAAJEevdkCTsP0q+PDaqeO7iAheoS5AlC8G4Wkqv+18dKvEr0H/APqxas
         p7ePlbJ6poA0b27JRTx7zCrsmnVdEwfuaPZnwRdwP7C5hFn9oiy9zevUIkJe9tPXHnwb
         0PhGAd+Q6kk5QA5USCknVaQMs/zw/gFrntp3HDAiC60FU1+nmy6q0GpYPJWrMNe5+2Fm
         B0gD1lIXOD/wGeDm9kAqX8zyqEyVDyeCXvL0oF6OTAxNJna9iO2vEjh1aqrkFX8Kckfa
         Ja+oBsHnwRGlXT8Om9JwqjIlG4LNtvkBozCv+/Lv3CK2O1G0b+5AG+xZXdme2e9KEKPZ
         rmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948123; x=1784552923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r57t4avPqTzhJ2J5sOt/oWIGHq+WEOhtA2WuO2ZZaEg=;
        b=H82qlXg+K46FF6u0FKKAJ6xj8v/fi+BemjNyrhLphl41w8uBBTPxE+V6KCIOQx+LDZ
         hjjfFy6Nv9LJVzbFHW2HWVVIgbAPfOpbUdP6KxcHe9QLRyyq1YdB4LyF/j93CbD+JNBo
         OhKE5H+H4aiXDsSCouTmLWx+qgiLzo0dIbHVElMq7lvtwpBr9RtcKEf5iRj6H1FSjKSJ
         KvX3dsN+10WkbGbhkWZ7SnH7xkCYVvMeBs0uM0lKQo9+FwV5KM/MQ8b+cIXW/bxGyt/x
         RVxf/CyPeo8jm3mOJ6uY+X8z56VamBBo2tbTqwfVHUiwsqkWdU0CBeO8xZFoYXBBdRlN
         0QuA==
X-Gm-Message-State: AOJu0YxHRiU9JYVxuCJl3Qd6fR8ewmKjvJQvAlTFImumRCpd1cvoUZj2
	UtshCV5CC4gYJcGOJki+N+a751qMkWxSrBYBH0pZC9OqpcSbkGm1o1wOqdCj+aaxB6RcmwSpTlO
	al8f06WcH8v/v9nOeCNL1EoMk5LEx1gdGxugDiwWtvR4Szs2xGDCD+Nfl9+yHe0QwPINF
X-Gm-Gg: AfdE7cmYva9GWTmO3Gq9X1uZ9VujhQB07lh+ePAkLtq5NbHRR1hiCuRU2Es070Qsnp+
	7J69Rq/UDftjNX+pB0NvRdi0Y0EjNXXBmhsO15NFJM4okecKjmuhtHV3fusqAIgEUvzQMo1enC9
	I6gCuhoJwv1q9dZZxmg2C+A2rl/8cARIcbJynVQH9OdBuYIntA/7lGpdFlqpaW4vlc03e+xuUH4
	r8m1CFDer8Xqxpzo7ho+Pksv4V49hYlKKwYInqHo7G5zgtmmQMZbbS/hCSDeTPbQKk4mfcq3WaT
	mE8toFlPMxV5OEALeGIWeyMgYprgmvC3fR+TpZGIpvpTpu2v9ulnK407qmS2EjMyb+r4JrsOT0l
	CxD/LWzYv1cBvNG3ATj7TNjP7AE1+5H2EYyNuxj2U5Pdf7r88iBFYFETklWCjnKPkHsqF0BO/5v
	/3myRZ
X-Received: by 2002:a05:6820:c81:b0:6a3:8023:af0a with SMTP id 006d021491bc7-6a39a630e13mr5348710eaf.31.1783948123146;
        Mon, 13 Jul 2026 06:08:43 -0700 (PDT)
X-Received: by 2002:a05:6820:c81:b0:6a3:8023:af0a with SMTP id 006d021491bc7-6a39a630e13mr5348685eaf.31.1783948122655;
        Mon, 13 Jul 2026 06:08:42 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e16c7d8sm6415913eaf.9.2026.07.13.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:08:42 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:38:28 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili-usb-phy-v1-1-3285da11f148@oss.qualcomm.com>
References: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
In-Reply-To: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783948113; l=982;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=3WLtHMYOWWG6YJSbPwoPg6vHqdpiCE8i5VjgYuBraF4=;
 b=TnPiNtyvARISbs9UcMFxGz78vo1eN613ZxZL+NYqdlHqEpXjNnL8Fzw6roTJ16R6a4KJTpIfi
 a69noB7eTmgAMFb0u6JlFiz1hPunaTg8cetE+vTI75h+V1RVos+WX2/
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: DncczgP6KOOdbDm-1CpaZ_LXlrU3-6Rw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX6urkwqP8LzdR
 BoRf3Xx4Uhcp++uA0wkXuCGs61h5Q5DQA/zowMxw0WyauTnjrLVQRNzUkyy+VIzb9cWB3ed0xQe
 MfekX1DoiqdKi/a4HDFA7gC6TA8nqeH6acapYKf+GOXnBvC1/14hNi8QFKwLAVkzgBX/0FLCjzg
 BPoYb3OhbNxRnYKkQTTdk34TJuZd2PdpSZXpNjgi7h/yfkWrSCgQnRBMCmSBd6ItODJL6tI4Q+n
 DNZ2lSFR09yhHz2xE2DARHXBdfZ2KuenRF2S3ULjhTt5UM+DOCX7WcfjvEiKBU79Q1ZWQY4T5bg
 j6w8Gn/Wtyvq6+PBAgpJCAt9HqxHvYH7bcgPQ+FMBcdw3a+pHTlajJRo4bVBd1iLFdEk+n6eGfS
 Z9CV1/4fLOniHr0/1IdECDe8ld5Ul9YqWtnlQUEjVdqGEpiezAOltVhvkqwHrgesdIxKo2wjJHY
 ohOVbvUuFzR8mDgazGA==
X-Proofpoint-GUID: DncczgP6KOOdbDm-1CpaZ_LXlrU3-6Rw
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54e35b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LtwHUEFrW3c5eyPZFKUA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX4eC+uvVW44vp
 ZX2Er2Zq/wbPrNMerBbO/nleAkSsvK7BEvH9NOOjPGkizntLz/484ncMxiS1QEQ60NfuNlPTnB9
 +Kbx290v6f1S7O54xZDqGDDcIO4Zef0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118787-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4447E74B724

Document the M31 eUSB2 PHY for Maili which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on Maili
with that on the SM8750.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c0e7e2963ce6..613fa5cfe9a7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-m31-eusb2-phy
               - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
+              - qcom,maili-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
 

-- 
2.34.1


