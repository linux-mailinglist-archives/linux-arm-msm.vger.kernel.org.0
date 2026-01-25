Return-Path: <linux-arm-msm+bounces-90447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJQoMbUZdmnXLgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:25:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC380B2F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D0E6304F36C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA21A31D759;
	Sun, 25 Jan 2026 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9/uxyd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gs9iLP1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1133A31D36B
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347242; cv=none; b=h8BfiUmfd1t7dTRtuHMYW/C9385OBeEZkagwmel8RVGmJqiScHzqN1wQnHoRxc8MWEcycG/cQyhBv4RfK2CjinBYX8wmE/qkvhJRZnFfmYaFS1nN4l2620TM0a1azqabBVdIlgHOy5Y+RGrqz4Tv7/lfZcD1ey/ZyS6hdg3A5uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347242; c=relaxed/simple;
	bh=dIO5YayCmsnxyES+C8CIdExF900jm6HWgkVRfQodJ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUoJjpjsx/wbufR3gGGp80Nc0tKXCXJWDfu09f8hiIhxkA6G04jxNAhMQsQ9Z+k+BWNs0xYyTEVISjFTsUF30sPZDlyruMHYL/Q824MrGMf8vT9bhvY0THV7aFhyuyhUL/jfnv/+OxVRptiRdGYxj+C0/rrKR8N+fTC5tzkKWKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9/uxyd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gs9iLP1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P8oHU03692731
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=; b=l9/uxyd3r79U5lHV
	useGRrp/PHZJLBxFSqv2e2WpAs48u0iYzmQKFthgTdQisg01EKGsJZvRHddPG0Oe
	9hrWLv4kFj67dRmKRxWEyW/YKQ85cVCyP0tin/g6JI10FHmqrsIuw9goYaS5GfvZ
	1Zmt/U5iOyq8Vbs25TFy8GemcpN5Ax113K2k5YpN6CyB8gyWk1hOC3F7P0clClwH
	g7EjwSvo3ZkC5lMqTaD6Mc5by0V/T0rqG/M22BhyzZI2RVUAEJjut1rPjubKgzVA
	/AXg4np8iiGTB4ZsfLZB4zGxJperZvFa6Vy4I4rxueY3ESLB0kDCMn3dV9snDnPQ
	oGpY6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwty9m5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52bb3ac7bso836961385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347237; x=1769952037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=gs9iLP1B2NU5lsq+KW9rlMCWKfIgkUTPdCK7jYw4ezM/wbr//Mj9kbpxA/7ZKZ4YFP
         aqJFgyvZh/LWeHwCunXE1q7XM4/NYyoo0HDfzpyWw7CLmgiOfYv4X4i2DCo0M5pthD/r
         XbRUXuofzdav0dXmGQEHgRcMnd8UKzjnC9vAnm4oFSFCOtxWEttj0kbndxwTqEfkiaii
         apnKG1ccSuxMYmJSLJnhE6DpLPp7F2k57EDeI+tKfv+7Zg3g0wK06Hu8PFoRX8VTA0fZ
         4ltWxi8Ry/tvmjvtcD0LsE8iltcvUBawoNhXbzE0J2jnTSskG7K2i/NgHneh+VimE+hy
         Ft8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347237; x=1769952037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=POJVlhDSpj+r2w8ivCBGkHb9OX15/Y3OM80nl7YS+BQ01cuNqRT1q9iEt2NPUTVnAL
         mhEUV9BVopsR195irTzPMIGk3/fPsAhtlrnvDB/4I8I5DmyVtldsnvNJN/VnaVw3Zsut
         pC8TWJUvZ2VQ/29ientO/hzKHV0KZtwJmJ3DgTBmNP4qDJc3NJTgtyf/bb5ZK9HE46RA
         /c0pBCxgq5BX74nMyXeM0ZuHA6HW0ktF5Cv0ko8PusyYkeXp8QRr13bWPOvl7Fa4fmwr
         ArhT/cDdnLYyiwiDsV2N9gbo0LmeJQkzYHuXe5rTFZHFhYto98ZDsEw7CLXO4Hd7ZA4t
         J2Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVi6qqKZKdM8JPhjfXLIIMWeFUYPJ35u+dKgmGRfCHnS3Xae04+spsSUTPJx5tofTPd+Ia1+zvD1dxG7Ufz@vger.kernel.org
X-Gm-Message-State: AOJu0YwIBfMC0jy7F1zEqUVovahQBcKZpXyO9XuUqisrFirqLhPVLFS5
	ijI2/bCoYZEJ3zWuvTK0dpdE2Voeez9lKnohwigLgiHkXf8arp6Bg9TOU+m1nJq7jwXbFrzhYdI
	M0VCOJJhBjeJMEYvqsuyeClmj0kmKHGnMsJNu28imEGobAWIlUXhdYjRtarXl8Z+YrvIN
X-Gm-Gg: AZuq6aKZlMhRzO3ZIxIe1htXdg3ZVZYkXK0xZYdtU98y5DNu/QZ4VfPKPSfQSFIFEwS
	W9E59tyqPgArkbuy53tniI5SCr+6msNuJsPRrS1t/bhhhebG4yg+B50jxd8WlIk97PP5On/aa5Y
	XsBd1ZZryzvgSm3kzPUxnoKnVSj/h5Gfq8rljh9ZJnnWZ0O92kjdVhw/09oixEyQrfFbhy0CGDG
	JXqA2WTR8i0sgpb4QMkUPKEonLYkC43nbPiFCHgdtRJra0Do/pbp+IUb+AQq0seCzRE70uMqe36
	9AlOgVlzftN+YkLRh2I8de7gVXkzkCbGldGtYLL2snQE/mGWkqPCoefp48oN602VOfhJXovVZVY
	OaC9a/xz7KL2pACy4RInmyO1zkQnJgTHpfURH3yiq2CVLjMlzLkrNSMnLYS3HTxhUXDFpUEyyWV
	EeVBPELAxK1PmJEqJHCNhsBw4=
X-Received: by 2002:a05:620a:1906:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c6f95e7250mr167674085a.5.1769347237009;
        Sun, 25 Jan 2026 05:20:37 -0800 (PST)
X-Received: by 2002:a05:620a:1906:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c6f95e7250mr167671485a.5.1769347236622;
        Sun, 25 Jan 2026 05:20:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:24 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: enable Venus core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-7-2c5e69fae76b@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdhiUienrcTdA6Os40FthnDFiLH2Vjqi5R8VQM
 99YJkO/ZvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYYlAAKCRCLPIo+Aiko
 1VFkB/9fRfbFvEBSRuJnQY/BN7PzVlpWFe0Jr2F5smb9Al018yLKuxnAbHgTJ4vFb9ydB0VPv6Q
 91UlwxyCu5ZQ6EwroPm27CVarrECrcl6oSqxNjbZuAUlECnQf/vWtETX1T4BnLZFsuITVcMNzC3
 nU7VtckMNACtVTiGzY1EUa05+c9RNJKVbp07WDeL2vBgL9q9WNH2dB/FYNEYYhtDoQj9QX6usVB
 58I4ykMclaaXlw5rNGrUzsvtNDNNVFWwQnQylL/ri42qalOnxCCKzmdjLzMS8TjUmHND6x4Usvo
 mhYzi5P4X5hsXmhtPaty3BkP/Mnr62TkjCDDub8lPZGXTemK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _4EX7hglqes220lIYi-WbWaSajS6gk32
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=697618a5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sbAN9nOpwR4X-TBSHOkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: _4EX7hglqes220lIYi-WbWaSajS6gk32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfXxu2wkYgeLSo/
 KQZ6usALWRJLu/kN0ceOmHMWMkRy7uf4QxkVAayRAjZL142+MExHm822H4JKyofn9eXJLDb7omR
 KWRosXVR8mLye91zv5EIup4XqabKRwe4DqxuxJodYNSU3eQEYsxPA5LvgqWWgVuQmaxV/nnzxe5
 wNIPBeIz8aDleY/0wE4PE3Gw6HpJ1bs5epwesNRI6C6Ehc86orNlAfCzrXMbVyckYGWuTJ5FQiD
 MTEV2aRH16dcF7AMANieBfzHs9XWi06+49k4cD9USBGnIlam7ahL0ouBndky3lpQxwXxkv2rgmz
 SwCJdrLmRE7TIzKeGUFlFfohKKNl0pSLv99MM7xVBKuacW0xfBIMyfoVaRMktxldFaacD3JnNn2
 Vigln1+8sNWUtADO2Uqy2aLkBE9d6IkqjPf5qbZff/5t6DHoI0Vp+Sym0dEI7u/e6qf5N/zKfP8
 tuP45v1H7NrfmJGyP6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250111
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
	TAGGED_FROM(0.00)[bounces-90447-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 72FC380B2F
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


