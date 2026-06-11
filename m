Return-Path: <linux-arm-msm+bounces-112590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mGDxEudDKmq3lQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:13:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A766E6FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:13:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dOPxlclV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LsEMeP7z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112590-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112590-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C255A337A2C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E4537B021;
	Thu, 11 Jun 2026 05:00:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A01376BDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154001; cv=none; b=Ep3LW7wttDIvZ/7fn100VpXZf2EedcDYO3+IoRgYbY8cdjuzjKEauVep8S8YQsr2ZKFMeldZJheEpYu9dRM7rZe03hPC0UlkfLw3uLw2q7Qxkh3r1g7ZTHSaezUUlF6ae72TKIfZMPoekuZhKrgtx9KSGrVTI9Ai1tkv9PDtWzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154001; c=relaxed/simple;
	bh=6Gmdmv7lAShyad7gH3r084z0fSBUtKnxVTK+fj/IZQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBb7kdd2tAQcZdC+idgWN2Wiu3Hmew16u3vmL+uT4Uk6vhLCEK5Ax8Zwpgy+HyOI/KZJpnEjbEbtA4GJvyTok+LtkEcO6AF7qEm+VdzngEmtUg0xIkPdyQ+5oo1A1qo0TozqEnJ9HzjecIIHtct5SHMThO5Xr1/AQjafyAyjcXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOPxlclV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsEMeP7z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0PVNF3085771
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=; b=dOPxlclVeahnQRFM
	J5VnfaeMn5n+oz29cj45O+S3TVfILT/ri9HTUzV2j27Y82kmolg9jBMTWxfiCWpH
	sohWtqhkNZNCZQHiniwqhIJ5vSYyuBCX/8UHLTFKD4Cx/gqdXIqKO8OWlrxWhw8R
	k8p/1InO5nNDrVs1oPQ/CVYD047k0GS3u5LyrlU0BEL5cw3+FYM8Uwk3yOeNR98t
	lSkhS4mTQIRIQGF+J1H0RHTppR6XqCDKrzL/AoM4ugXa7y+f51Esgr7WykQ2Epon
	SoFflKQ5z20dokl2zQ0B9UyMPaXwZ/xjRX7In7jMGEKqCDjxLOCMQQxLLCkSIoTZ
	kPfKjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2befec3fd8fso52609365ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153986; x=1781758786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=;
        b=LsEMeP7zyK9TncuOoPqBOvKsydLmd1bHlLVsC42XejxOun8m6hPuAFSMvRWIAI5Lx+
         nx2U+uyuuWw3JYuk5A+dGtVRZt6Elqz2IC2aq6DfEKJr1py1Eg0yAOzADcAiNtX27F81
         Z3iVfZTocfYTwcSTxvH+fc2WZ2HdA7AGrnRYrxZhoOXM9DlcibKqttdF8y+93JnSDHMP
         gPH/6Ob479fsZA3j7vDdEfVNP90sprZ2M5ycopIV/MUIQ6DX8JcANbdtjBYCXinFho2s
         vYBNNTk+m2mQ8FeQSl2J+QoJgS9s6L7cjWza6nkn2NwYYe1xXoFO4ZbhY1RnFdG4OZWs
         ZP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153986; x=1781758786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pjzMpKoao6HjiAoTyRYUjE9J9YMQAJD0aLcYZMVcq34=;
        b=JTIDd8XwHKrf7UsqFSTAFst7/HyqJCRwsS5KhRXIJi2pRMm2vQeTSAgxRKhs5btpM5
         +P66m1ChDCPt8bq3bMEDcAHMWmUDWpkSrC1Dj9jQjRA3aACTRufv74oIyyBsZ0t2Ne57
         g64ONuK+wX/W176Got5zDYcemTNastnOXmtoDEKQdexZ0DhLhYUChfeo84AEvAt8unl6
         pdqUp1dUUEiqb+YbBbGb2/A24tun1GOX3CPwSqKs8ZPz9jO7k67nTEOiyzl9bpidwosj
         dcpbkrfYetg/a7hPiHj6Et5UsaZspk/Cvi2KVNszIE8AxTOktCvPSwPkgkaXLOOKVpz0
         /z6A==
X-Gm-Message-State: AOJu0YwIDWYmtv6EVoGER4ZgM70OacNDLRiAPvU8NXOAPSb8PSRd9b+8
	Aibj30fj8LCM3iLSfeTO9FODfVitkBPVf2JjCQyCy2bluuOhG7hZH8YmhqGr7//XYtVvcSe2NNt
	VT7nE7cVO0f2lXUkHV8jCVOMw9PfTcOcoQlgtNsB9Uq5PzUJsx7sOwxs2yXlYoH0g/iY/mUdP5F
	0U
X-Gm-Gg: Acq92OEgOJud89dNp3kBBtG1oEipG2wcJOSMF87qL12q9Oqv9yAHpKnq8kvKrJ7h0OR
	kROvPyNbDezxEslnjjZn1htTsacTac4dehAfbUJJdbdkc7sryux69s1Q8luVXeMyeLvuAzRvHic
	f/Vv16Ww+r9ya76avPTzu6NZ6DtyB7gSKaqRst8aVK0lf0kS8QgyIvG5rW3ylogZ5S+ODuWVWZV
	1FeaNLYfPqlIL4A6fU7XStCtJTBongfQp2Oftnrq5k55WF1BGfCqNMUH56AFymCPGsDWPHdqliV
	DuWnbqccS02CsLOqKyRQHLxvWFyonQu8SQZcJCt8HkWXMKrakwKGzgO51il5Qq+LcGnIeUb129b
	+4dNXdCpIAc3WXdRdSr8AjAsbg13R5DYEChlp/NCloLpmyh7rYaGQJo7Uuu69h8BEUxY=
X-Received: by 2002:a17:903:3886:b0:2c1:6715:a4ea with SMTP id d9443c01a7336-2c2f3254f81mr13109285ad.30.1781153986481;
        Wed, 10 Jun 2026 21:59:46 -0700 (PDT)
X-Received: by 2002:a17:903:3886:b0:2c1:6715:a4ea with SMTP id d9443c01a7336-2c2f3254f81mr13108955ad.30.1781153986035;
        Wed, 10 Jun 2026 21:59:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:49 +0530
Subject: [PATCH v2 13/37] arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-13-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=6Gmdmv7lAShyad7gH3r084z0fSBUtKnxVTK+fj/IZQ4=;
 b=WoOBM7JzfJ45jhY2guFeAacxFof0MF6KzE1BEY9dl9cbLBtrcDA/rluvpIM0bLDZtC1ZCjUUV
 HngJZnKy6iJAGMemezUuiwj4iRwlU7ucXxrw+iwRNh/rVx2wWE8uIkA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX/20hDcdu2BNF
 zMxvdJ1nE3avBKM/5XgwfwWcEbK1hKYJA2n/I/Qg1fV8lo7YknIzt75O1PWkL481iod56Ybz5R6
 K2wH2d5bQg9sSu7hPycUreWZRjpqmS0=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a40c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9RNfx8CuvkvW
 vn1xKV1SUZ56L3J7A7iWp4Tpm20lrEftpxHgomtYsNSVdl1nV8WEQn67ONuXafT0QUK8KD8yQf5
 oS9CNUe5k9sVavw7092crEnUdPiGb9qfqzD9XVWiRknxN588Xzlb1LQ93/0AwBqbgzQeIKPwLrN
 8XbseWSMQkMvWez3qisJhbk61qMCBQ2pl/ORjS2yGytYqy+Qg5LYyYoWFzrep57emQvimZTVVFn
 0Wq0kz5N65gRZcF6lzBQMi1sCD+WvMm9sQOIa+iRkVeR76P5jDOSYwnmSRhh1wte8raipb7tj1v
 2HLAbrV3sz+M4CC0vqBwcsBqrZx9SzRq8KO1PGMziEl8mLSEw4a5gofVYoaxPRbCyWUval25Z81
 3e1oPyoNPUU8ptEZzD0w3ZuGK2NpxNgkURbGlSTEi6e7PT3dM0hcgpkMZAVTeT3c13EC9JW+Tl9
 xLh7JNVMc2JquiEe79g==
X-Proofpoint-GUID: wjRAtBIc0saaJlccuDDOZ-RnrmaV086I
X-Proofpoint-ORIG-GUID: wjRAtBIc0saaJlccuDDOZ-RnrmaV086I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112590-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F8A766E6FF

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 74778a5b19ba..71a09e76b359 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -358,7 +358,7 @@ &i2c10 {
 
 &pcie0 {
 	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1


