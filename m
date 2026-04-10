Return-Path: <linux-arm-msm+bounces-102740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEUsA/dG2WlvoAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:52:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAAC3DBA70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BB09308BD1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7513E8C5D;
	Fri, 10 Apr 2026 18:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSBv1/Ks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxgLXxOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB923E8C69
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846629; cv=none; b=J/4RoHsBioUwy08PxXY+ZoreiPenH44GvxQhtnys4pZjLrTNS4oaeQ8GQHbDTRJ4Vm45iFZKIqQXcM9d5g/LOSGWcBaTsisSw7F2fbAisgIEoWv3JKByvsyKiU4qPZucheMDLfMZMuHWL9NUIviVsDgN4kwktvS6gJOoAh6HsVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846629; c=relaxed/simple;
	bh=J9OnPVi7AQGDlRKXt+MWoBDgIpt3jvnlZETPcjSB5i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcoLYEC0ubdW57vH7WNGBClv3JCq4BP8wXfpFhLsD0X3CsWfGu2Aa+OIiQh6SGDMHuoQiqZJyKODmax/F+4ghUeAM6ccpU4xr/p7/O5ECyA8ig3A8M8JDDWqLpE9dx8yO9jJgtcBt2aO1SeBfjiw3QTcTsPprcbHE6FCyIDumT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSBv1/Ks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxgLXxOa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AF5jaM3759244
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q+v2CHIXDWd
	ku8x8lWlY0aFDr5E3OCB8FcYtsok99e0=; b=cSBv1/Ksu3d53PO2w72z2rW1+vy
	/c/1yToQxAgnInKfNp+zvhW+UKw1GlEJEcW7nbZR3BMdkn6Usrt/5/41YmGqov9x
	Jh0AoZ6UokvC31YmmowPGSXD3r7T8jhFPu0/Wd5CgvtefIyKHlqiFWLdDBkjhEgB
	yAR8lCnr/y17PPdmOGl5CfW65H3VnpDWL4z74ddgu46YYs2L1bl+ce61LvMQQewS
	apwcx+egi5rRpu4DrfkEGtS584n90OVSikeIskkvF9D9UgRcX/Y5lDcvSOOYFcLO
	5RbHoF1QujZ3exw54rdO1sjgsxxIcYsB+q7HYYtDcGwW0LQOhbrS2ASfnwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3j1gnff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82ce1c395ccso2643826b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846626; x=1776451426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+v2CHIXDWdku8x8lWlY0aFDr5E3OCB8FcYtsok99e0=;
        b=OxgLXxOaM6BeQQGDut+uvXIlr3e9hRuqer228MCB7zb2cD5M9i9UG4YHvpu6H0ct7u
         FWICwvtk2L8zydZu/LBhEeB1q4Qch0dpqcR4BiRlPXggGEK6eBuT8OP0klQseJMdoBfX
         uiGMrzmYGTTkHum+zWy1NmU9sls1Bc8uGRtgBxVQkpg++hhdKl75cQnl00m6F5r2Xz/4
         JjMbDZVDRmTjCu2JxJHgs0PwSVfbB+5XZzRm2majPKkG3XXXvwe0E8vO7ZWmjjEceKm2
         dBV/OnMzbEnL5/n1Z67c2RhGzMj9dFs5AFoow8RamPK+VGnj9aqERGiodT1pe2chHKZe
         1RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846626; x=1776451426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q+v2CHIXDWdku8x8lWlY0aFDr5E3OCB8FcYtsok99e0=;
        b=ckHWE8gMK/UnZ98bKWfuh88gmBn6PPyid0s0zM3TxHza7Bozt5zhfARm80pU0GO1ED
         mfwF0lU96dao5NtfkKYiSYvqL23VdhRNHiNFSdmBR7N7BpBbBv3Axa2Po2pCAkZhVt/i
         OjT+LEham3i75LONzUbL5/7f3Df5fabrkFjI4qP+8rS+1v5Kaon+V1ZnveP7P/XEVx0Z
         67l4FvC9x8346uhI3LaHH6j+ZyCjmoml8YIStTjDa2Q+H8xSNYkukkcxG7XL0HVLSmxD
         Zq5I4yxETjRuPX08REZ/rq7EgGcJHc6jvoglxmIPiH1YhKlt7oaKBAimDYuAgtUxc+nq
         tskQ==
X-Forwarded-Encrypted: i=1; AJvYcCUecrBbJGOrHVrPc5/xvF3Olinbsg0Go1KcgyUlECF5zh1DvBcBaysYGLxcUQ1+K5PwUP3v3m0A+g3jdEJB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywan2jURXp9/soo4QVdDSqip3XFV18A8n4ALeTEFrBKeA7uPAhi
	8/FE1pXmLiHLbr4VXsc6yXa5n+zhFVuJbc8rUrL2flzZe5P4kUKvW+j+7RRQr0CDplpjHgXGg8L
	9+BEsdKlGLX8j9+JkB6yIfRvJdifLOpEI9rWEbYwHOjbbklW9e00P7fRZm/9ZCn2f7M9U
X-Gm-Gg: AeBDietWWfDaRnIbJLtAR6uMAC3I0EbvmS30HzqyPw5+gth7kwlqYO1aW1Bf2g4/d9V
	Hie1QpaUThh4k5IJ2W6nMYCckFPUb16ZxZjcswLjjNQhmFtCvlI8rHo2DMSswsP7Q8lEo82ybg6
	wn9ZG6N9icEL201qTdH26Hrrwefs1nle2nWYM41v90ryWC0cNG2rWwm84FZ/cyu3j6mTm6U02tc
	bYT7+8MMV5fue0iZRMSuw3VtTNTMOEBh1d3kv92I+aFFoZunJP64SYqrnZZF5yqT6acCB5OR814
	N4UgzzRpQt1kCx3vRxHHD1OxBOKfWrIocmPOKmqZ6jBqWcxYpZRHDm+0vdivc6FDbkhtun1MlHU
	5VGQGVrY3xE8k1LYPKubRqGFFFnBWz3U8DVQ2zzwrK8u+9Nz/
X-Received: by 2002:a05:6a00:1748:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82f0c2efb76mr5019903b3a.47.1775846626185;
        Fri, 10 Apr 2026 11:43:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:1748:b0:82a:786f:e39c with SMTP id d2e1a72fcca58-82f0c2efb76mr5019859b3a.47.1775846625556;
        Fri, 10 Apr 2026 11:43:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 26/35] arm64: dts: qcom: sdx75: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:03 +0530
Message-ID: <20260410184124.1068210-27-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXxLtDIRDpz3WW
 uG5BQHr8zkkp1Fa8bEdW7w8abkaRV4W5rcWeVs+sD+eZClXlAFmcUvXf5ieCROVOxNQCpgvdU+x
 N4V2fCYxebPQ00MI6Gg6ddCrIE+ofFiSSPQrmp+eSdXR68kpV3JJlFbU9nrqEEBOZdfK23m2IWI
 BlpNiu50ur4tUQJVOtSooUHruRD3lMgGL/qYxkm1QnM7rD5L7wn3GjmIr7DvDtWcUkr9nMPHI1z
 la9UkufXmVsIqsfFFiewerl2h7y4/9X0GK+FJLsTZToUoIpmTf8x/ebFgU90KwbSOi/46OCCDSm
 g6gVhQGLMAtmvs9qPE3cs629WE+U2zTiIXxntjakZkVLxkLM3uWfuGMW9tGqmH0SIBqDkclvIO+
 QU7yFU4vbzSzQDnIvB94sK7Cjt7N+lidvZtyNqelSdUzjSeqNhpf1JQ8fxRMTsNIyusJnAn96+H
 5Bm1NV3pY7kVaENJAFQ==
X-Proofpoint-ORIG-GUID: Ri8X-wei82x1_VzWaUaUoiAV44cFfAUo
X-Authority-Analysis: v=2.4 cv=AbKB2XXG c=1 sm=1 tr=0 ts=69d944e3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Ri8X-wei82x1_VzWaUaUoiAV44cFfAUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102740-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DAAC3DBA70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index eff4c9055d66..82a8107f2f1c 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1100,7 +1100,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdx75-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>,
+			reg = <0x0 0xb220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 147 52>,
 					  <52 266 32>,
-- 
2.53.0


