Return-Path: <linux-arm-msm+bounces-119039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kILmEj43Vmpl1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:18:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A0754FD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:18:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eQ/61Ug4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Edl0874Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119039-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119039-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79A0D32C6742
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C8A47A0B6;
	Tue, 14 Jul 2026 13:06:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76886478874
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034389; cv=none; b=TB82y1JZZYrjVFdH3dGWLbrjNGxNXBzGMDsMmh+nuNVgAmqUe2RFg8SHUnSD2vCFzeffLxc8EWdAZVvmDMKjgojQFS0Vm3FvTalHgP/SJlwSMiX4aMOkOpepmlcv6FWr7Q+jkahNvUnuSrFYb6S04ANLtSd1PMl47oWhtxFxPBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034389; c=relaxed/simple;
	bh=oEE8sFPW/1T2tMiecJxKDfC7Q02Il+kF/WVCoVI1/Hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4G5mVNcJUPPGFQJkqUrn/vxVJNE7YlQOEwls1qaLtVo8UQ9WNpO5TCvtpdYuOnxO7gVd6Q9eDMTZp4+MtwT/cXQFRvRBehgV7s/iTyImlHxpqSTbqr3ohH7K2grZ1svD96B6+uTloKqrVpzhNv/ayWpUdWI0OZu4JEMuEf81N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ/61Ug4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Edl0874Z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED3tXx721302
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfy3nN0dnVywluoYGzFtZcsViBAgd0YR4FWExMJKe7c=; b=eQ/61Ug48jGoni9g
	A1xxWOMck6Q20ykjrYsrN1kpVlBdr6IC44ogIKPnbW7lOgCekq/PX6kRWoA2mLnW
	s75BGCBBm0Tua1Wj5r2RHVUTWxtJ9c37q6vwZEqKswi6yfMc8ZZ8h2hyQ6il6tiH
	4h2S+FxqhlXLLE3aKaGiYIm9A7ahCQNz8u5MO/vovT+WeQoFbZ01FUtALT98+MPe
	1TIyO61PYY/HtApC+U8U341m3Cq0fCFPRJ1uF7mna9LjUjYkV2JoRR2ODlYCvDET
	dcf2CufuUIGjHzfKE2jBNMdN7PiVhKEIPlazgemHKdWh/V32OawUc7iZyVhs1vow
	CSEwcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnur0ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so55769981cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034387; x=1784639187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfy3nN0dnVywluoYGzFtZcsViBAgd0YR4FWExMJKe7c=;
        b=Edl0874ZIxYB+i+CbRJIptUqKu/JGUlBqq32ahjY1UHz8k57BCNeG0XPGGGgSBEiyJ
         5CHBx/jnrqtf9CSoEEVjKS1DanZUEAUx89bWffpgXJ9aKBGBQ3/cELzJxTlfQi6hdPAO
         Oq8m/4g2jOgzRVCN1gHZvl1pD7CaATVcoDbMcgyK/Chm0oA/nYouF6cIfCrlQ6a17tni
         aFwxZpNLG2MFJRpmsudVjKkF1W6ZnuGe0UNLLQWIgDEu1dpRiy5ufK73ADMr8qxB4t1w
         WTP8aLO9UVZWLDMuwFuyRhYZDV0/ekVxujMdWfoY0Bqk6yEbNetMEc9bf8tiCXy7IC1N
         xpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034387; x=1784639187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfy3nN0dnVywluoYGzFtZcsViBAgd0YR4FWExMJKe7c=;
        b=diwHToXGK18LCauQCX7DRzKh4sfEiUTZf0nUeoPs/gbcPAbRLuW6J520aA58DyEPMq
         Qq/vQ8lhNt86Or86/ovKmIzSlIuXUmzuc1Jctnvu+A5RkDibKG4N43TMAEzguDhLgBr8
         +N+WP5tbsUi5Pa6QDtNC11N9Z/e9RF/NityOST1PzS2mNzTauamuSkLy0/wEI/gtBrOb
         pB/52QyDwuiH2CJITYof2x6qIoUocbEoVopCmG9vcyzrCalwBMnKe5UbhNr2XX1ZhiTA
         FPhPjXi2RSw6ksBZn7ENfD2SHjzLRLI9ZAQcKdIoQH0oEeaU0tT1myPxSOyBzRFlkCXc
         iDIQ==
X-Gm-Message-State: AOJu0YyJYB//+132HxS83p+LvPTOLRtmYDo5RpnWc8PVl4CEMAPZdnsz
	Jfd5a/bcCieyXvZzbtHjvDdfXpE9k4qwTXmyrAokAVoHU0rz1WAHLb2GOXAv8g3h1g4C1VMfYTb
	Zwp4yvGLyeSQzEuirjSnga2QB2VlTU5EIkm3QzMayyySBxhVZExPPeos4ru0vpXlZ95ge
X-Gm-Gg: AfdE7cmu/0Tvw4rY6nRgbEiEU0rtRsJG5OBXN9MVM091pGgfTgleaUsEhy8qLdQ4S28
	OYfmwwixzqBdzhRK+T8j+r12OOOWxnHiAMGPkVgqJwgU7KwvVvPjztxK8pJZFlUC0+/Fgz6qnbr
	1cKl5WFXbpo/AEN2CGyrCFpW+CoZxnMf4wW319d83HOS8ei/1WI2XsHJJMGrde800bH+lSkqOmE
	PDjsWvwqf8b+0QSakWHFTCH9yQ1oAWSqSpn0sklBuOCeMfP2VP5KbppfN6vCH/LkwEsbLPf5KVJ
	+65SBd1aQ6ccOHgv4mBJt/MWLBPxmCsSZIl3aSwe0uymDOIggvNFeK1nkuKjO9edTqmdMYZjKDq
	01DwZjPHpgw55AZ0=
X-Received: by 2002:a05:622a:98b:b0:51c:1a4c:3c91 with SMTP id d75a77b69052e-51e3c1577acmr33456321cf.1.1784034386541;
        Tue, 14 Jul 2026 06:06:26 -0700 (PDT)
X-Received: by 2002:a05:622a:98b:b0:51c:1a4c:3c91 with SMTP id d75a77b69052e-51e3c1577acmr33454211cf.1.1784034384128;
        Tue, 14 Jul 2026 06:06:24 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6323742f8f.21.2026.07.14.06.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:06:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:06:09 +0300
Subject: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=804;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oEE8sFPW/1T2tMiecJxKDfC7Q02Il+kF/WVCoVI1/Hk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVjRIvusTMk0XyZ3dvP2uWvpEDDpsjksXyDNbk
 lS+jj3ym+yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalY0SAAKCRAbX0TJAJUV
 Vr4zD/43/XPBu4H9Vc8sVvjo3KI4uD1kZ/v2Wd0dcpxC9OUW7+uUZGM0WfVZZ5PA+pfB3N90pLw
 YK92BdzOCeA4R8hGCii9z5cTegW+RZnVf8p1PwtcerZQYB8L4tQWFmoZwsAZBq3QP21sckH/Ge1
 zN/zBbAt/PNH3EfHIY3upM2bf1RNLYqsMviDpfqz+u53SHl5On03ok5kkdV510EOxO0453gQ2aa
 Lw5Dg1TmMHQwppMEtw1rnU5gfKUKiQKLZs/01QNQr85q0Dw558EcVJURuiNJmOAE144kXwYhu11
 w87JE6E1VWdWWds65f3QSHwptd1kfcIO9I2WSXPKJ/v1UG1w/teKtQZ5N08jQh8PP1qFTARH5SH
 PLMDJTz7CrmMWAiuZbd2PLlOJ3G0DNzlCPLHNtT7DRST4Yy5cT90ylIwahvpvoGPIM7oqkK0Pzz
 RdrB/mgUZj06c1CS67ByMxh8aiWtyfG6UQLmhMvkU+0UrTEI4+rWDtGZ1y6wFmWXx0fhlAARpBA
 VoOrAFpk+oJgAl7jKTnyXbZPBf5wL4uQg5eBbdX4HZnOOxxi1RYtBEjJbMk96bsrXepWFdHhVjX
 z83/8jZ2DuSLitl56KEIiF5ILHvkHY283KPxWTcI/4QT0M2P0q6C4kH0z/Ay9xO4ZKPMkfhMVwG
 SgrFMWgIHW9F0Sw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 3rOsE3mepf4SoP-Iz8ZmySCqAFtM1cfV
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a563453 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX7TX+Bc+lwGAy
 B6/U21oI8K9PeRptaRkQct4TgwI0GLXlAe3oHtcPl7aJjvgDMjqzhBTkl5maR1WYojJ8Hp94Ibq
 NURaD3uTnI0tBlQcRW3DOeolw84tTf4edXXCuDbmFc0+wUlUKpZdeN7f2bVthsgu4P96JcnJYR/
 fafKzpCN1CKyw4ECkJPn2tXT4MN4bDP3FycDJLWm7kdXzblN6aCuHuo+M8Pz0VZBaZD8pYoLd31
 /yGFA1b7Nl9Kw95iQVDLatyyTshSMRpP++P6Lr+JUr8RTFz280OxBwNh98Rm4ThYc4Jf84dDTYZ
 eZ4/r7kzQDZKwvRBu113jGLV6Zt7+61FwbgX9aUFo4x60wryJQRWVriLrX66fQRgWg4Gk+4NzeN
 Jsk+Ct0ur9xwsbBn6a1S8lReikYz/NAAlz9I2vRV7u3f7OAmb4d3DiNgH29XTok7Uyr/o8S8QPf
 xN0nTaUFlGHdNvwwZ3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX3TEaT5YDlyIe
 EcvuZIuLu0896iCCseqRmwj+uOdMqyL3eEMGxLR+rY1QRZQwrcqMIB04UbewCWHt3704HMuxxmt
 6bJQWRIb4jgxcsf4NOaKIh+sakV9+8U=
X-Proofpoint-GUID: 3rOsE3mepf4SoP-Iz8ZmySCqAFtM1cfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119039-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 867A0754FD8

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index a7d6f9d52ef3..7de4ee3935e6 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -484,6 +484,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */

-- 
2.54.0


