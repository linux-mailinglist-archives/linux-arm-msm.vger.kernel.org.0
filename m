Return-Path: <linux-arm-msm+bounces-93231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BKpI9DblGmkIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 22:21:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 191A3150AFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 22:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C55C300382C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 21:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE122DAFDA;
	Tue, 17 Feb 2026 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQhuSNh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1I/VqPL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F502F5308
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 21:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771363278; cv=none; b=ufVHtpOADJt8oFTyUzrjsHkyhzex+orOV03QitWNui+A8nCrmiQfIvy9BCwlK4dz7vK23GzWRJ/zeXy3rC3lFWpLqBt/6QPOs3mgrXrJVGLAzy+fKGn4eyc5zMt8NJkR/A+WUmbG1zgCMiKbNBKjn2cXLYBKh5ALpj5kenFNhaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771363278; c=relaxed/simple;
	bh=uPEllq7cMVmmmCw5tbN1RWML31cynjFUJFUCxzJ7RnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Efa+7L+sQ1LSdSV/HQ02K3abZ13UHgOcfCsaSmoUDh3ZE6SKF8+ZWMn1bqf918Dl8GmokbWx7DJr+ljAiD4W4AxRMmQYPwV/4kIGIq7Isyh+vH1ioHo8fvsfVVcbH+DDrzixVMvTa8rPf77UlOMDRzHZ9Kp+ux3IS41yYqNHUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQhuSNh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1I/VqPL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HHAuGq1544917
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 21:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpmqckZgEKJGk8NKQIsVxUre0hdZGqgxR0agHpg+ug0=; b=DQhuSNh/z5I1OEws
	UqWAQCVSHDeM1XG4NA+60Vu9SyeGqc25MnHph4/bYejeEE4BYRxghKvWfIXMtUm8
	sPMy00cHivrqVaexpj7aKCk8GLG7DNIPWfWDDfoOKRQ+pMPT+riNtX5wjLgmxuR+
	UXelnf4Tvg/hlR6y42qeVT59jDmJ0qjcR/6Q7g1YqZjhZ1JnQTqquLxCmzeqbUZL
	YaRD2cUqISBcXtWTds2EzN3Safg0fnPSREdfWyriKGDTsxWHzSRK2vAPQoHFiJtU
	XU/OeDgHxeMtSc84M5Oowuksqx4Vh1tovuzSMyOSxb5B1b+IVgdE1TZIiK/6d17j
	ryevog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajuvwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 21:21:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b0d938dso3111644685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771363271; x=1771968071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpmqckZgEKJGk8NKQIsVxUre0hdZGqgxR0agHpg+ug0=;
        b=C1I/VqPLK5qe+mm+KO3O6wuYjSSpnDZVGjs5TuioHj1xAyTgu8XUQZwKwtuhZFYMvY
         DTl4T1vefwmIYaHRyx/ORfNJGPx8hb6Xhjm1oX/HxeXGOVXRypJkolcJcTZVNXpSCoTx
         jLR5Go6y52RSjLkg6O4ILs37ydyIbJRSCjtMKsTsnexuxvuGczd7FjsPYjLmLsxrZo2y
         3B4LPqNeQ/ZALpyVr4nmtiK/BRUxeTjSNvx7OAtOmdhLBi7MG/qVl3WRilAvxFB+Sef3
         aK7AV0btVRQF5otG61JFVSCggq2FHOcyS987csvmKy1SRx6nSXydSDqvPtPa7QuCMM3n
         9ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771363271; x=1771968071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpmqckZgEKJGk8NKQIsVxUre0hdZGqgxR0agHpg+ug0=;
        b=TJ1R9Lixp6CbhYls2g/XKdbc9dPjm2VMZkEX+6Zo2UD8VvzXoeFrq9kCATAvdKqIbP
         QaZ9Hz2MXEcvVhXo6dHrwkp/vgqMW8odzVcKjLfdz6nHcveRAjxU7IustSc+YfK0h6+M
         5j+fown8Qs1fp6vjXkFccWOhdjJdpGcjUv6DPfFqM9hbD02VpY3ko5wEUBQyAJPOz+Fk
         HVaCwi6ug4BZAJM6Kd+TZNO38ZnXnX2y14IPa9DbAyqHahAq1K5gVyLKnVutZLECauRs
         d4ze8ncrsM5dHvHHYtT6Dz8NnWZG4c8LvSXxqaGqceesEbfHa+Stxy5nkw1xyZtNIG3y
         PqRA==
X-Gm-Message-State: AOJu0YyFwIqJDgQ3X8kfwXkQ4Z0ErMUUr9Ns10pv/xxDWOPl016ZuWgr
	ytSb+sOqoH7w/4k6FPvICScXbdMnt0InUtc08chDK/6t0dve3ugY+FJVdQYKHczluGu0Pg4G3yN
	fXe3epEf2C0SestCtAsd/xz1J/KDkk4q4DAE7DjX5NdhqVBs/dnY9ASK/d3PHxGA0ycTgJIUkaH
	vN
X-Gm-Gg: AZuq6aIw9Bjoqc8CDGnur9rDUPGKRcmVqp/qkHGmQCOTk8Es0e7+PfT/LkR37RrM16m
	8MgkkU4RZ+pLQQAJcCBo2lqGjOB9UTKXw2AymVq88M0a+ELK3TRVeNYtQxySaQ0L1sOBwMVFmRI
	gEmuqvdpjR1ukJ25/ccC5suFqOleR9A4wTlaxn/B9TFtomaPCxeN2F02yE8JPhLYF8XtGn50Sou
	/kE9RnOmuWjamfZqU1sc/Ms0CZAbbrO9gwOk1NgBCT6gkdHqyKq264a4iieWn0araSUn2aGGV/E
	6k8b6OottF5MBXTT/C0tpaLQYzrySzLGgilCjaAZ7mG93J18gi6uaX3QSkebgZElul+IFGbwldZ
	z2Tc+EiXW3YG/N+W+3C0wAo++yPTG47B0bfmHDc6wwihbdyb39IG42V/HCoJJl4VSKma2ViJ/Te
	qFFTR4HCcS1dxU841d34k9XWxKi9LCsQMk6+k=
X-Received: by 2002:a05:620a:4554:b0:8cb:3f4c:eeb3 with SMTP id af79cd13be357-8cb42434f62mr1930153085a.41.1771363270899;
        Tue, 17 Feb 2026 13:21:10 -0800 (PST)
X-Received: by 2002:a05:620a:4554:b0:8cb:3f4c:eeb3 with SMTP id af79cd13be357-8cb42434f62mr1930149285a.41.1771363270407;
        Tue, 17 Feb 2026 13:21:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068923c3sm39293311fa.5.2026.02.17.13.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 13:21:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 23:20:44 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
In-Reply-To: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ftnh9MeC4gznLwDWHiWfXehLT1Bovg2FOqb//TUh/mw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBplNu6yvjN3Wh611iI8DgWA00A3KwkbaVYEIQuO
 HZeSxUw3c+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaZTbugAKCRCLPIo+Aiko
 1W+iB/44VezUbrXNMeJOWYyuFy8FsjZU10PkjRgYkdyZcRhnttXfMkqoChm1+ZWQHMcCDIGxGGH
 nEkHcqAmOFqnE2EdjRHsSZ2++Z9i81eQyAIUZ1l6jUTuoNUEipbkhk0HEEE4pyMwWtEZaDhQZeR
 h19hLYtqlVzKohBD+tFB5/t3s5NeX2XYwBfox+Anm1ITsOkcxPOPhhmuO3paD6vr0EmGg0PJiL2
 iM0OgbkcMhjbJdgpNliduYciuqtFRumht8Gx6CXw6Bya/A9zlCYTMU9N3m4amwN0MOExIBn9ClS
 uILeOVO1lGSUT2EQxJ2aqWowtg+d+3sArUBEQLQaBTtawAC6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE3NSBTYWx0ZWRfX2ygJa6GQqaFn
 UhWUL4F/PL5oFDqfI6vfpJaSnL1csyMIfXPjJBjJU7X7Znkt+FOHLRKsBg0fOjDcGn+6wxcR5Hj
 B6TdBTdbRhuNgGxUw/rfncIrB1oL8DbJ2X1+axedmh6WVylIRAQxa0zxD82MoNPVkUDKuATzyoT
 EcjpoxAfiIAolcEZ8qPc+FZq9oTpWRd52Fj61SZpdSECCemWR7k6O+2FZCEffJx3LYWQ/ONYguU
 DCd83RoCw0MgLvxNk1jf7dpuDydd7Iw69BthMxDU0uZzOh7V3HhRFA1dkAzmE6YUD33dLi1ZfE+
 NsquhT6CbuawBDxCwdTl572EAkIBjjjUaBFyBIsl3bYugYp/PzJWS1+AvsEiSClt/ax27cso0d+
 0Hd0IVNssgAoJDisVt1u4JlEj5P5T+MylGyZENQoD1bIHezRjNEg0AMc9w+kNEe1chFxyJjsjl8
 ynUAt6kBvxK/w4mx5KQ==
X-Proofpoint-ORIG-GUID: _X5pDHujDG7G-d68mh_7pxck2XG4CzEX
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=6994dbc8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=aYr_IzhGWo5ApOnmw6YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _X5pDHujDG7G-d68mh_7pxck2XG4CzEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93231-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ixit.cz:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 191A3150AFD
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

If the OS does not support recovering the state left by the
bootloader it needs a way to reset display hardware, so that it can
start from a clean state. Add a reference to the relevant reset.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba..75c192eddc57 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4550,6 +4550,7 @@ mdss: display-subsystem@ae00000 {
 			reg-names = "mdss";
 
 			power-domains = <&dispcc MDSS_GDSC>;
+			resets = <&dispcc DISP_CC_MDSS_RSCC_BCR>;
 
 			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;

-- 
2.47.3


