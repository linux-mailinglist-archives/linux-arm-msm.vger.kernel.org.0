Return-Path: <linux-arm-msm+bounces-106113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHiXAYg1+2nfXgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:35:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC34DA43F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7E2F30970FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 12:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942C644BCA5;
	Wed,  6 May 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyN46s9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgfxE680"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3788944CAD7
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070648; cv=none; b=gYXiQGHyb/+lrNr9Ps+FZ/GkiFlkDhAT7g6R2Wvg3HCS+UQlClIct6bB1lLUUaiC9FydV0CwPFxLFnk4iDHiLnRlTa6twhCtCocXslaClcyLfIZL0SN7Jmw2RzJzRvNhEtNJS5Z0PHM0bLTqsdXpr/5I2/d0urtkTeWtfCqQydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070648; c=relaxed/simple;
	bh=pMD+qtq0eSt1F5BVDv2O5eMKZDQLYY3B7GXUiSmpVF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJc22wHeiEvV8/khmrP3xsA/rlUaO1OKSa67KyCqB6uxPNzi32u57kkcxBVncVW9T9PrhFanFcrL0yMsBa9uPlBmytJV5etsbqpw+Sjy0ltNcxb/jeINK7abKgeAvjcjPBcH8aqtvoeB7PjQ2ZVmAsEW9H34/AVU+iwks99FFK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyN46s9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgfxE680; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A3VEx1953123
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 12:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuJzY1eI/8oPfBeCGjJdm53R6qQTKbxATapWq3XNg+w=; b=DyN46s9dhJ3cBgci
	PtMjLznL+15aDHCCr/Qn9pqGy9fJupL+7SMQ9jHAW5bDtCwbKuRZmfj7hkaWm1Ai
	nJVx6s5UhkcYuyxEdYAyhLs9791MBj1/XVot1Q6FNvuPNHKUHMddmE3rAw39p/6j
	2WxHoh1xp24MEjrGAxBQkawRv8FQaffT/KbRN1zuB8occ84aZg2RdfbZLrAgwJF1
	dweg9N5bn1ErlY2lAw6a2b/lc/I05yRqyMWCznt6mPHmzke6eJ+9EaAY7j0iZHY6
	nKaxuj/bu7ZMaH+HtUzNReubrT8Q85Y77V4ZG7U6kKz48wdLcIP5UVGBlxa4tLcn
	ALDGRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc0eq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 12:30:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50da31af14cso158804311cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778070646; x=1778675446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuJzY1eI/8oPfBeCGjJdm53R6qQTKbxATapWq3XNg+w=;
        b=bgfxE680dzfcpTBG8zhCzkfwCYkhK1yLSSq/PLPqdXL61Z47IbqMSDDfhVF5pvzFAL
         1jDS4VsgG0uLP+p/Zm4dwrLwtSyezEkC1KxR0jTTO2unF4DxR7hAfOcmDqlFlhHffgkk
         T3d3KMq+zhTAJEqHh1ZtnKiF9d0PgetSoUhP4yA4mWjDU5jhtAmWHb6S6C1yDvDoDus3
         Ske13RmAtyMjx066qcsITARoPvJGG411IPQMQyJgvsIEiUsIc1hupUIo4bDomj6uoIqP
         QpvPDSlQ+ntaZrzB3xMHZKqEik1Y41NtgseTE+jupZqoJiH/Z+22oBRd27i65GL4zKbu
         biPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070646; x=1778675446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuJzY1eI/8oPfBeCGjJdm53R6qQTKbxATapWq3XNg+w=;
        b=CgJCDB7VdsOOL16ihXOgQddEDE4inFOX+BG2ANP3x43Alnpk/WrXiXX4MeZyNo8ZhO
         yJtZe9M2XSqYu5C7gb1yr7bav5LYLPR6Pk/hszK0Y4NdubcAJjv1dOvBI+YSH8CspN0L
         3ZjDPV4m25F11HcWnqD5m8PMnTou2I9ZOfacGZPkofEelJ6t13nsLxr0ElAUAAtuZj2Y
         6VsFXu0gBAHQ3bJ7ZrMpeu/SBT0kYudj7q/ykCgOOZv/GsW3upKYBaPriw7emnhf7DKW
         dqrniJe6AFq+qSIs9Qu7zkazjY+jjV2cSwrgF7Hkye4npi++0AaNri6i8tFXy8xqpL4c
         VBlA==
X-Gm-Message-State: AOJu0YzpkoJsU/StOP7XDoETQXdsnrOK/+hGUtLfh4r8BidckS4SbvyF
	8BaybMjE1MT52EMy6kqzT9D+UggD4LkoJF+r9hrdWYEIEo47qEbJDhVjXC4/3rVWgZWkdS+zW3p
	TPV7K2yGJdaCJ3hbijvToJMQMHIxoxDOQXoKn68wOEhgLeyr+yvuqp4EXpGuU1cInrykU
X-Gm-Gg: AeBDiesek7RGlTx8vSONZiSvb7RNHhXV4+iJKJpuaaNefKYlhvN/gXAlNzcrx8x5n9/
	Yad+dPW1T7OLVRLzKn64sVcNJuEcpCIhzDdsCUvNFwUtNwaRnl0KNA3Zj+6u63QWCQfI5E9dljb
	AO5jJvCYfrAzN4D3L+/IjR/2nsVNad7UTZwNWexPTfwMxRmWlUP6Un2IDROgbpXiwUNBDJW/hwF
	tWBZg1EPGg7awDj2e+3cjZAqxLVwtoBfArm9nsckEqiN9yFGA3yKPFrJitaWMhcZY2tsVvLwkTA
	HT1kPQOkJkMpEuM0LJYpHlE15er4E40ehFYw6z8YtxpOHBm9dQYJ8Ui4KXzDju7LQpBgAcstwk1
	MKKgpDDJ1MntEsZKxgmEU5xl91Kcl3i0jlql3CgLKeH6pwDn0K1e82C0=
X-Received: by 2002:a05:622a:598a:b0:50f:783d:8cb2 with SMTP id d75a77b69052e-51461e27337mr41354161cf.26.1778070645583;
        Wed, 06 May 2026 05:30:45 -0700 (PDT)
X-Received: by 2002:a05:622a:598a:b0:50f:783d:8cb2 with SMTP id d75a77b69052e-51461e27337mr41353221cf.26.1778070644681;
        Wed, 06 May 2026 05:30:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02f76sm11855464f8f.23.2026.05.06.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:30:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 06 May 2026 14:30:28 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable DisplayPort on
 USB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-dts-qcom-eliza-display-v3-3-9e46401f467a@oss.qualcomm.com>
References: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
In-Reply-To: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pMD+qtq0eSt1F5BVDv2O5eMKZDQLYY3B7GXUiSmpVF8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+zRquJFhY3yl90HqWbvzEFm4I0j6rzmmxIBRT
 rq/5VxWgcuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafs0agAKCRDBN2bmhouD
 1zBiD/9mfgwfJzl/oiY+NT17Ybi7EHhJj9boqzHw7UkMVeApT18NPuiY4E0w+PQ5LKYaS7O7S3w
 qMsHXWCgoFwOO1XXtjCxSMGOi7n0sDMOLaQ49SL14tBGLriVgli1JkluKK1I1ZMA98Fb6ONEEWM
 W5P13YPX9ZygdTJyDk+CVXph76PSQMAIYIuva8kCqaur97g8H5g/SQHf0vuHXHZzddbplS21egk
 hBgcdvKH0S3nv8xT2rk53Y2TbwiHoab5zEEV/SL6q3928/T4btHRZPLekYe38g3kr2QbIRkVb1K
 2MvWR12h3C1+vUHtNwZB8WEaCINyb/yIr9MvsU7k+09SH02umASjetkXnk1+YTobAHr3katwwjL
 aNLTIOEtStq6NDgpB65wjQaz9nnL33fYjqTokgKgF0TtaWfq9i8/do6u2jXt44fVbDathQ1DZ46
 qAV7J5mwheIJX4o1u+63Tx9pRoTYwfUINoxPvBwmruNN495fs/+LRYc3OT9+zI8pZMBKGXd77nA
 K00xq9su2+IHIvRSbnjVIdi8I7A8TjMGcXbNIxoJQ58AxGqlO/QQOa3q3nWdkWLa72iGLL3Wo5u
 d674IN11T7YHCHdIHZXCY30lhMzxAFLzYDM+X+99v9jhKbE0HStvEb1cbQPVo8dQzDO/cEYzql4
 0tnLsrAKdkKugYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEyMyBTYWx0ZWRfX5CfpsDJAwnQE
 cwbFLnwshL6RlKY4lZUt14PJ8vKKBw0UtkQK821gM736A8uykQnkH3G30fzy/Ij2yD5HBQG9UZs
 VTSDP9XSrnTgGMTwlidMUodkZbCeKyv8DeYG8ywKNAG1JQ2mWio85C/iF8+Y3y6ichNYlqi6rkr
 zRS3ryNogNYzIvGHdKry6v/w5W2zFmBkmjTqvsJTM++vRBGEMGFvT954UgmgqYuGA2C+XxuWzO4
 NickpS8o+1AyPnPzOuAEKdra1ZbwQ6Fjnl/aHw4FX6RlwpOaHnQKI8ZA/12U6XOmeBi5rVy4ml0
 T/MKVTuxK0X43ICzKpWRfWz+A3ZfsnD93oMlvRk2sj6LRMiYi8cAwB6qV6+Tew7SMHFnm+SNTx7
 hEWN49dj5YUve2sxyfBgXP4XobpbajcpqI0JMZjCbgVRxqyE24PSJTIKn0kQRjrkLws8wSUY2or
 a/pL8CCtrvayweFNo7g==
X-Proofpoint-ORIG-GUID: Lx4AZuCo6zSC-1nkn20ab_ACYLywQFRg
X-Proofpoint-GUID: Lx4AZuCo6zSC-1nkn20ab_ACYLywQFRg
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb3476 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=O309HYtxkqMLGareKSQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060123
X-Rspamd-Queue-Id: 37AC34DA43F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-106113-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,88e8000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Enable display on USB DisplayPort on MTP board with Eliza SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index f0a390107d5d..912cfbee552e 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -421,6 +421,14 @@ &mdss {
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
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l4b>;
 
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index f22a8090ddec..0fb153da4dc5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1010,6 +1010,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";

-- 
2.51.0


