Return-Path: <linux-arm-msm+bounces-90458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHp2HpEidmlFMQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:02:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7680EA0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9804730048D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2F331DDAB;
	Sun, 25 Jan 2026 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJIIjGCI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezxCtycj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860573203AB
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349488; cv=none; b=f+CZvf4+VXFtU6xKI3g0DFBGDdzU83LtNpXssgA1sniYvQ50nbMnhVOEQiXdG/rIx5iZ6GYZM5DJxtX2hZieQ9ety3Z7DHARPADmipFhPOQVDTN3YgGU3vOaYf1bHeYarOmrcA/PYeY4/mi3LpA7DGvSpPCdfH0wps3WoqLkGDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349488; c=relaxed/simple;
	bh=dIO5YayCmsnxyES+C8CIdExF900jm6HWgkVRfQodJ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+w7KF9PghLpmjg3jghsJ4ObH4odxMtQ09aVQaeuvbNkrL6o2dpkT1Y+kVBMg0zYrP5homsI9nyO5vWy9e2GNRlpU9+Ghs/DYGuS3Pu0BsPbRHow8qOWJrdiQ/FbsChe5c7ltMIj/wtdo0LIDrXe7UbcLtn85wblamzyezDVNYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJIIjGCI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezxCtycj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCsMqC3588854
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=; b=mJIIjGCIDMZaBOCL
	bfp09Z2IFXIq8nh2iBtYuTiouqqJug7r1NIGlpfMijSnqYHToyxSdDuNFuTB9odx
	cbxzflrp1v5sYwvYF33dFZp7ZFqD21bFZqSxnV6F+hMpYDnLMtcQ3nYRCIQ9Ds6O
	021gIyrDkNXsp8NtYPuICiAr0daE0DPhSjGWRRqiKtx1JH7MfuJ2j0jiKEVzpHsE
	xltyFfbjd44hH4o3xcblYlfLDCQOCbUJvjExgudZ8L1oMZ/2XflZqTf5xVMtYFaE
	Yv5Jz45hNSPirWWoRsDJLhCFjeL381TBqc8OfUqQvBeS/VydNxkM0aPhhCRU+vXj
	wznvNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tt618-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a7fb4421so982143585a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349467; x=1769954267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=ezxCtycjORjOqMKTWcTyz+9rIhcOY53PdnHnLGQIM3G/imLpLVDrGFycL2rlNbRw+O
         RpQcb4+uxbQoeqnaekApy4siY2yFJwIkfgrBTSz3v3iTmnDSJSPwm0/8HvZ5azNakgjk
         5oHv9mHwWedMgGugDDFYD/ryYs5c3HI11k2VVxXLsG+eQoTNlq7dF49iHjivQH9kMu+Z
         mbyzw7a07Fcq/X7B0l+u6FsA+dMacpuaGWWo9VL1t+s6d1uLH44Q2ZgD2/Z7IaUEsdA6
         UDfjWWANqv2UtyMsrfq0PbTGHu2saJzfZorGCyMcQuAjLNR0OsPuiYqs9oB1CjodAlkR
         Di/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349467; x=1769954267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=A0WZil1CZagx1TMEc98Jhis+fR79ZTiiRpkek6a2Hdj3vjz2v5XdWu8a8aCnHq5dbe
         OlZhDP6ndBKTF634cKiTm2jem8KFDmwSJyCcdhGrJrpSaEutWOAjp37FTHy9vJMzQGSc
         wA6P83TviKK6tYLmOkCsi81F6KU8CViycnXWE/6YRY3cuZcRAXOAUdjIztTFJt3uMWPZ
         +ktX98toRYJk6ICDjwKPyTGJTRDly16ckQxNsLUF6ba+4g8DGYtJnIjnuA/z9H7pPGAv
         dHCNnnESD9DRMSs4GO9dOxQXkO/kl7UNiZ8JyIPboqm8q3jyVfJNledyVPI+kyJRobjW
         5tdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVzO9rFS23nVuWWFipEUK6GhUT0zcjmCmhHpRClAjVavcN6yo48jbTkZPBkDU5HPFJkM8wVCF8qDufvES+@vger.kernel.org
X-Gm-Message-State: AOJu0YzaaVt+tfZLBPwr455qYElvJiKRUGw3PaMGXu6LsTfzNld2JXWC
	1gyanEvWGH/Nrog7QUq1GGXOCMXBkRvBYZLv9FFXAwKkQB8ZNa/itwK91d7gEqDo6ER4uNG2dK4
	NafxARa5ruFdVIV6R2hVzyzB/6LrhxevioLsUdVMmbUgJeHQ/gxamyJGW90TX58kzIbgc
X-Gm-Gg: AZuq6aKPAhYJHpp0KfydgkIBRkTL4nzgVtxOyaPnh8+IpQU5z+RD3eN8K9cR8SgS7lb
	0oV3JmvCibmrQeUYkEqWx9zb62HJBVL9U9EyPwtNr24ye11sp0OlDokik1zr9k8//xO3ylKHoLx
	/iiJ3D2QUPMarJG4mU5fOGs3VtxLFXdbM/SpLsHazTJu4E/vKgJKS4MOmQHHLwDaD6tj57BbC0x
	HlFz8/h6DXTg7l8oIp54bkLJB26VEgMJySaUQRoeL8Eymdl7Xghrv9ir0rIQh92jjOqVLGXOp/Z
	ZTfB6xh3XI9rO924ULmxeRn36ILPyPXFCSXbWZA1TCwwNnh0lSMiUyjgcRn2Kf4/gZM6Jp77pcR
	qlrZxK7wKhQjDOdwf7YmuuEHNeeLWCTAKxozTMXkOgFiE+RmOS8uMzQUemjywIgtCB6l58Rrd7m
	YvAJ4a07sb+0AcWtFhNYw3m6M=
X-Received: by 2002:a05:620a:4620:b0:8c6:ae63:dbbe with SMTP id af79cd13be357-8c6f9693b6emr173213885a.79.1769349466712;
        Sun, 25 Jan 2026 05:57:46 -0800 (PST)
X-Received: by 2002:a05:620a:4620:b0:8c6:ae63:dbbe with SMTP id af79cd13be357-8c6f9693b6emr173212185a.79.1769349466186;
        Sun, 25 Jan 2026 05:57:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:30 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8350-hdk: enable Venus core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-7-552cdc3ea691@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dIO5YayCmsnxyES+C8CIdExF900jm6HWgkVRfQodJ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdiFGMlmbbXYuiwT9bw/VLrqqu9Y4L0m626IE5
 Q/3bGAJg3aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYhRgAKCRCLPIo+Aiko
 1aw7CACJLvV90JUstbr0QcoZJiIQkKsvDAaMysmbdiXvqEa97jGxUf5h/vGmWKI0q4F+2L4XfGe
 /F2p6/Vj7k8TGFaq/ma6cQLFxsj/z52pC4JFukr5nld8JmUfg738RP2U3nOWIkMHBfekwZQQvak
 u4tntOYsFyBoABVy9susQXzYOsoqHfWS5cJX0jEsAsCrGM1en1BIuIH7Poy4Zv8MuYmY3jiIpWZ
 0xd04YQbBmczgNsXDC2qs822nGnYFEaJgIwgKoCNAnZ78977TO7PhjvaRmvfn6vtu2H3DbGWH83
 Grd/dauZ2l7JAejjvo2vlawDxEKSwPdPw8a1W3aR0kU6/kPF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNyBTYWx0ZWRfX9/ekOvQO65yG
 3O6kBziWrDXZhHv4kHHYQ0BcBU3t7AAQ1xzdL/+hxb0zrBSpIK55WvTXJWZH05t+LAIG2y+Pkz4
 B+3F8SFjmt8o2Kbwn9zVtxmgaJrxm8MjxWaUkkdy71bYhEomESeqGBjBxFr7wemc0/sxh9ltBAQ
 qczB/vB27bWf0H6Dm41VS2f7jdB8/bX89s+aX4ikQ9AxT2QTPliIzbbQ2mQBQNmwkbLTsFZFhBR
 PJzBPQoEpWEIZm1y2hFLxHa81pTmAh0cRPL5ysFSQMlxxlsv3DVJ3zGU+0DuV/phsrHivU3ZB8q
 7jN/on0XQmb2AVWHUBYCY0zAJeIGJSxEaiQHWMTKQAL0+Ll/RBfkye4XPS7L3lvjs0OLamc/6+D
 YdB0yk6VB+v5zzXkePMwDNxDWjrcVPHXBsYjS6CH5qpj6b1omT3uMeu+WcEINwL9N0KDlP9/o2J
 PyzZg45ujUVMeI2tRkw==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=6976215b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sbAN9nOpwR4X-TBSHOkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aNdZLev7UQcjadUWu_gN9K13rwzq21xz
X-Proofpoint-ORIG-GUID: aNdZLev7UQcjadUWu_gN9K13rwzq21xz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90458-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5E7680EA0
X-Rspamd-Action: no action

Enable video en/decoder on the SM8350 HDK board. There is no need to
specify the firmware as the driver will use the default one, provided by
the linux-firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..79f024fd47f9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -894,6 +894,10 @@ &usb_2_qmpphy {
 	vdda-pll-supply = <&vreg_l5b_0p88>;
 };
 
+&venus {
+	status = "okay";
+};
+
 /* PINCTRL - additions to nodes defined in sm8350.dtsi */
 
 &tlmm {

-- 
2.47.3


