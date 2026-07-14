Return-Path: <linux-arm-msm+bounces-119040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WVASN142Vmom1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:15:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4A754F46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:15:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ra5QltlP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zv2+Mgmu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119040-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119040-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79BCB312275C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304FA47D929;
	Tue, 14 Jul 2026 13:06:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6847CC8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034390; cv=none; b=MprbW7uiGruanHTFGmHEJPAiaHPhnLCd+QQ98fWse18nnxd3YfiK4M3b96PwRzlEM6K/oSVolvB2tuwTICHfvT9PDIkc2jdcSxp44r0y9BBiw4OHYAFXHX1ZjKSY01phJ6VE2M1rQdt2kfMLZqJ7PnIrQ2ZHNur1w1NHKzHCptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034390; c=relaxed/simple;
	bh=OwDhqAA2uO/F093Pn+M2f/ZO6s9esDXCzLQX0HD+7AE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWCo5Dix18lwnBzJSXLwSaORtYIoEBGiSb77UgadAs2LAucUyFkp0tBDB1VTeyvlTBcJE/ukK1TPeJqv1hy/rtzLyg4otdh6MktQgJ7dENjRy0kQkZ2hNMYznym+3+XvhBV2Eht7/SZ34bdfSi90aXOKk4CGcy3rHpGFFWzlZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ra5QltlP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zv2+Mgmu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBOBJJ378780
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMfjv7N+IUr+8DUXpwWiIvW4QRhrIOegOkd5Kb/Jmdk=; b=Ra5QltlP/cSQ7bkE
	Zvugr8XMoFQ8G7cqhoV8OyX1QvMszA5sre41rZvz7RQC2X0Wkv3iN3M/jj+HI7My
	e94EQUMjkzYeDEKN5ERFIDzoXMJa6EmmH/aDd7kxtZ5UFNXjI4AlnF5UA4MAdFYr
	hqLWsQrEVPy+3KEj+uvQS5lvl3d//0PioLksw4ESJ3fz74mKAC2zoNp6vd6s6vJo
	vKcGg6cdiEyaJwirPsVUTuUv2EyUtceEMGk3v/dpOIfqav+jVFpq3JVH7Msa1rP1
	7gM5D3v0DCSruY81wLHyWH82gaOsUFlp5RrybXM+YfY5bdLVXwCvK4KgZbk4RXGY
	uKdj+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4acm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e606e8f3eso503866585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034387; x=1784639187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMfjv7N+IUr+8DUXpwWiIvW4QRhrIOegOkd5Kb/Jmdk=;
        b=Zv2+MgmuXLuT/0c+JSEYpz23wwnAHwzaP1z16vMzD5b2Yic1PWf0jiEZM+iZf4g9rg
         LzhvHu48Ml8fLTfb9DBvYsiuyXxsZ5ib1py3Yjs/cqxmePso3YFeAH3M2bDQmF232ddM
         NQDPzulisUbyTrQBCdYcD5sYh+zADl6V/173w9/myMeXDxhSZYzevqt8Q6BLd6BY4LHz
         cyDaELoNcPC/NQCegtieNaG3K+P1qF6tnm1aWntXtnPFdVoTOJCRtaNs6/TIDl7hB9QW
         5zHbHg/aAiL1yo88L8CR//c6cPbWQZR3xrefFOxNInzARtyyuPF/PVGheA2JWxQOOwFQ
         fNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034387; x=1784639187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMfjv7N+IUr+8DUXpwWiIvW4QRhrIOegOkd5Kb/Jmdk=;
        b=RUo3ps9jMTKXIXdHneaTO557tuX2pARGyPW0aDfujFCojVDqpYG3RmZBEEvWFbY6Ze
         T6/CS28ofwv6xVJa2NyuXZXbdmRePB0fse50O81JFT5+vHaJPmCJ1m0vIVhnrYt7ywdG
         RWV33VRmfxi+zfju161KFod5FwyTdmrUniCFj0Yfno/Drah0Cp6kyV+uMt2po/kByi2/
         IqKSVVVJ64e0T9i+3U34+5p2mCCfrD+lqBLsuqvoa09wjlDQ6DZdxEgVhq/jZkfowzhp
         a+wMr++xfbsclRfLLx4iahajQExUhrOHEEsa9Nb2mjTwtI7ehGkdf1ef1WfGc5i4pW62
         giVQ==
X-Gm-Message-State: AOJu0Yy8H5lGxkUNq3bOIqoI8HeS5sjjvQgwjwySF1u+kftl45QOh4Es
	vm99+adIy2zj1sAXSx9G7A3d+jhIlhsKQGG5UiC/RquLvk20Lx2yoQLnZFVt4VFOiGKsEcD6XOO
	5d+UdRI4DxG5JorSUtIJzRW3wI1XYpE54pEweSZvJOJdNXhHGaqOKfZkTtywbvGUcngHx
X-Gm-Gg: AfdE7cmUJ378Cx35GgmD3GmAn2jPRxWdMf3DizVY4UUWMcJ7VC2py9jaX369p2zVaS8
	7gJKX/HIFgTvzT8Lp6FvT4qNlvGxu329DAH/q3tb8BEgJct2CzcEyU7reU4j0wo5SYcmgkYJ3pz
	UH9FSKTor3fhg/e6GJvn73sWPL9HAj9f7uoTFKQtK618SpBnk2VVEkkzDjobesJTkZKcWhdG3Zb
	fAaDmvpUAgyLJ47VVocyzI+hKfqb6H8RZeB3Srun2RGlPOeE3U4wXPRN455PKhvuCMBTU+/NTMN
	mM5nsCI/ydoo9KpJNtpaoR2gjhdJz/Jfnz48sqxbVndNwBvsRdLSgzFTKuMfLehuOn8oQJX8JOc
	lAUuAkpAkArIPhGs=
X-Received: by 2002:a05:622a:106:b0:51c:7b13:6302 with SMTP id d75a77b69052e-51e3c39d1f9mr35236881cf.88.1784034386753;
        Tue, 14 Jul 2026 06:06:26 -0700 (PDT)
X-Received: by 2002:a05:622a:106:b0:51c:7b13:6302 with SMTP id d75a77b69052e-51e3c39d1f9mr35236291cf.88.1784034386052;
        Tue, 14 Jul 2026 06:06:26 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6323742f8f.21.2026.07.14.06.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:06:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:06:10 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dts-qcom-eliza-add-cdsp-v1-3-525e757a23b0@oss.qualcomm.com>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=809;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OwDhqAA2uO/F093Pn+M2f/ZO6s9esDXCzLQX0HD+7AE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVjRJWlT3wWMMTl2E+Fe02SKahP0gjByNv6Mkp
 MLpalF48EGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalY0SQAKCRAbX0TJAJUV
 VodgD/9aSNNbPoM0IObILwEFLP7lTKvcmHUS114NMstb5YqCiiJFcqrWZgGvG3HRnELxb40bW+M
 RkQSZ1tS2KIjVjvO6VTAM58p6SGvdBWuCMGJhKGxrvBpSHozrBl3NHUjRub9bv4TJOZAGcEjT1J
 4Hlp5CfpwXJ73nuxPUU9h0OUPMWQu2o4NSPdgCeeZa/m+8wA8P+nLm3utNCZBuAbiy0hQOxh3Ax
 FA8pplbABIHlCd1jNKyUbHhTz+/SY+sx+D+6JEbiANX9pxmbNyC+BxkZwVf9a+sScEHkrWRorDz
 W2kaXfa/OSs/TuyR0jInNLkmyeRXWrEyNWVL5J1P2bXyxneO2/+UbgViPOXyzjNe6DqpLi5WKaF
 xV3RSZpvm2EUYAWj+TNTLQ0BRWclT9B88q/bdlpZ0FvxzaPDitlBN+3+mkF1v773Ka5BbVBSX6S
 MSqND1vYCi+u7vS6gjKc5e/WuQz5zdXQp4E2sDs2FuEihj3X43P0YnUL8p/2eTYR8q/z2h5viN4
 PMbmXBAz1479mg3wgsj+bNUegxaYW12p4VWKU3NS0T78KZtrN7NTeicHZcUfwIV4+4zhr6M4UwQ
 nvJ5zjfkt4nySRlWwLvqPhaacgVRSf88Q40rU/hhZ97OKQu/7RnRwZybTW4Rck7moEpi45gu9k9
 05yAN3hMDK1G7OQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: NUQsPCU1IPF6Xvhh4XD9dy9zfVftaMLo
X-Proofpoint-ORIG-GUID: NUQsPCU1IPF6Xvhh4XD9dy9zfVftaMLo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfXx+zeXhOweqno
 wyQQEj3FLgUvW9diavYdr8/wjtuCJjC6JIIDkSIox2xZ1wPCtXdgHH6FXHvUmkxV7pr99E2SAPb
 MjFCAJRq8vrQaVl4kXj2dboRLV3zngbdRY+i1pjpe+noJ3+Vt4CIIQ6n8vej7vU+dMwGWfOohO0
 w40FxNG8CGKB1XY+HaudFA5HP6eGPe6i7vMQAavYJ6+anlZLe4lVKa5frHjUWIPZlT939CMcd1b
 wsqihc9X4qQNMWqO8iKo1a6v6hHcvAQ70iwntU7Qe4FMfan+nkOVx5+ZFSgr5tqYHES5VPObyvO
 CfbgZmXQocUZ0o+CZ64VopG6zivCvOpjHI09jSkNycQYdtnlMKMVkRGq2j/9cGvXZMosSWkrvZ8
 cfmajs+6zqhB6gXEVN+TwwMpdLJCOuSmF63oneUbxM21sOcFeOC6OUxfU4ebxi2x8IEIKtno8hl
 Y1vCq+T3WCIpnIV5c9w==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a563453 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=27Bx3adQT_mWtQqGTPIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX3IuYHzzc0/bX
 cpxglQL4KjZOkrA+NhVQNA4VHCkPl/XEaIgggQPoSDilRhII8Bm0EoxMlJsg4Niofv9jOCSQ7xw
 CZ2ACMIbt7ghhj+WXSgQ7mTlKIOyFL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119040-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FB4A754F46

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 318ae3c22351..d31267968cad 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -376,6 +376,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0


