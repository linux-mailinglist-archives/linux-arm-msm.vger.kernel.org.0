Return-Path: <linux-arm-msm+bounces-96662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HQvBHMksGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:02:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EDF25138A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D072132A708B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355C23C4542;
	Tue, 10 Mar 2026 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AO4/PwQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBq0LwOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF73C4547
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148148; cv=none; b=BTci9URV9Pw2lDKlzqm9/XZEd4X21YGh0h4gLvDKkGe9eYuADsclFrT98J9rHne8bflvXWXPGJeSqDMARSziw6bopGTQIcI/kmtTNmGqTOnF3RmXI9rmUsyzU0ksvK1PHzQu9YyeiOMq4t1u9q+7fU+yZkY/K5WhMfxR5weK1qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148148; c=relaxed/simple;
	bh=1zc3/SjNnHRL1TxmXWoaXASxPBtFnrzJpduOYNDZI0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grrwqWD/PfnW92pS8IqClAB1oHkw9dbjpYHDrGVCV7eJqad4iX0W6NsxFq3He35bADh6XOAAaMj2wlSymP6L/bcyj/MdnBOXd0w63VwwnkkzOD4I5Xu7I6uzl1CZN+KeeR2zYMy1f7lCOWdreuifacS1DPj5SnxblMim7DG60T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AO4/PwQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBq0LwOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaU232861882
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMvYZkKf+1EHkn+bX2rKPCg7+1honZq3JF2wJjFaANU=; b=AO4/PwQNq3Xnn1/s
	nkUQxdUfhSATWNOLn1pw7r0Pc6VlYmS6JHd7w6np2+gLt/8W+SOH17fs3wH9GWsK
	OkH6/yN/dORr9qx7FESynRvhm3w57XcNmFVml3znCxZKs2N/zPWBAzcQ6JOP2ukt
	dDBqjIsOWoO3w0Xa+khLjZyyZd+VrCzxbu7ZSSOPstyUTLLI0jnyVZSrvzxflvsb
	5o+taMKAqe10sButSnoCkdL+fusJOK4aRWlAZVIFNZR/BqB4CRPdOQN405Vx+PaV
	17DOacjp9R/bl6GINN9HLTsEYACmVgLE8yKu5nEFa8TITNqab+KWHTw8/r1c+xxx
	M78RtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w9eku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81c571a5so1259734685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148145; x=1773752945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMvYZkKf+1EHkn+bX2rKPCg7+1honZq3JF2wJjFaANU=;
        b=fBq0LwOd1nyeCkH/yVNFK9hMzcYH8o6z3Iq7Bkj+cf6YqgLmftk/dNF/DYYi6cydwm
         m0r9a+jYlIfSpoiNIfWNMBauqZintVNCUDmQmFccoRt9Vsw1EVFyRjouiYvDiYEI3T8m
         nKoyqoaQ7Rdavbtdd10h+znDRi9xADFhDu/Tijpyy/eONniLBF08ZcnX9Xyunuyhfaqj
         Wo9wRTi0oflcBW18UIyN1RhhK8B65+zZWmDVNeZ+MYO6tnXeZLPVMdc/V+GzK2QIHNQ4
         jWHhxleOJ0PSVtGIBXDprlk58yDrEFSpqmStNfpFvBlwAKS8kGUuo6AEBdj/xjqU/cM1
         4fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148145; x=1773752945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AMvYZkKf+1EHkn+bX2rKPCg7+1honZq3JF2wJjFaANU=;
        b=DFvP6EmKGU5HWPxg58cBOst63RIOl8a6XUiiz+GfbhVxBxbQNn1uwJ1eIER1djm7sq
         ddaCgJbJ2WOQP3VVM1YR3egYmYTe60khEawphM45QLweQ9zNnVXEsE9SD1fzQD4GhXle
         dJx1MymyL64sPmeeKFH3N9jfHoKIv1l0fSPzYoF+q3vuqnvICY3bYLK0c+ZJSnybTenG
         3NEKydanceGT6qSpTDPWetIjiec3bY4DNGeRx4N8sFdpp2Pfxwx1RJ9LCbRDKaMnnwOy
         pE5F//xahHx1jTnww9rlE22XbwbhFcoos8bBHrRYzzydSioKx8SUnhsFYKUD/iNJbB+j
         QS/Q==
X-Gm-Message-State: AOJu0YzgUQWha71pKaAr207/WK3BJmOFK3wosR8TEJ5RCnpqI/Iu3xZn
	aoWLrNbM7SMCCg0G7H0OEkg1SxWASNKxZ3riKv8z9BuMZtffcdy8JkxgeMg9TJHiJ0HC0AyuRFe
	8ApgUO64XiULeEeNxZeqylXnpMguEUOLePgmHW98gf1GpfvTNFmdcNc/TofvjvZ092wh+
X-Gm-Gg: ATEYQzxF9i7s1zE5rDT98mi94HFTveQR9U34w3RefvHB19pej58kc/Rrz0IprMRtKjB
	yc7gV+GoyVgvl+EHnSYUV4XBsIzNqwxBuQqp+KUw9rrbm/7T7UPzaFu0GQVWxEaj/+9GLs96/WP
	y5IQjJMEnHnZC6VoMY+cLuZwxZYXa60QEJDNmeAgseb031O0sedLGgxNaRpTn4ycl48NiosBPyI
	eXtPhXB3o81enYR3wu+TI1zPoFyKLJMpqwk1Ho+AWOILbZDUL3Jx4YebFK7j6jjdM8uAUmqEZr4
	LuEEpocyrQxLs/4xnbCa3bYxqGx8jsBfSxdO55hkX0KuaN2IcBxwraMndU5970HXCyD8IizmVKf
	FQSHMdllogSzqmYxQ/Z0IMMyKKKT7OeY3rabQHD2TjjvT
X-Received: by 2002:a05:620a:170c:b0:8cd:92c2:5125 with SMTP id af79cd13be357-8cd92c253damr521805585a.13.1773148144935;
        Tue, 10 Mar 2026 06:09:04 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:8cd:92c2:5125 with SMTP id af79cd13be357-8cd92c253damr521798385a.13.1773148144342;
        Tue, 10 Mar 2026 06:09:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm99472385e9.9.2026.03.10.06.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:09:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:08:48 +0100
Subject: [PATCH RESEND 5/5] arm64: dts: qcom: qrb5165-rb5: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-dts-supplies-v1-5-5071a7052ea9@oss.qualcomm.com>
References: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1zc3/SjNnHRL1TxmXWoaXASxPBtFnrzJpduOYNDZI0k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBfiDfaqMK4KNa5nQFVmn1arl2119epUsHO5D
 ldQwcXA/1+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAX4gAKCRDBN2bmhouD
 1zJ3D/9Pu0yNRbo0zG/JWHRFDxgxRAz6DtYojyMDSN/5qaTHTiTwJ0FnydVwkAAwFNRpDbf/xtC
 fY5JdLt35+/++JCL/wFMu/fm/Ru69o+IkbFcgd+J/9pLV/BupkMHbblABgY+gJ6FRyxyDjf1oQO
 Hq/OrQV1Si3MmoEAZ/WFEfm0v0fpk3II+n84fLmp6Yf9usfKzydBIw1txnLK9XdXURIfaxICwva
 Q306TbTNW60TozAR8bfLntjt6XxXzFKxF3+DhD/82AG5eG8MeUIED7ROb7cB9Nz0I/Ps1qZmiRl
 llFnrSY1llsJdezfqiu2mSUmPT4+1OMwL+ldFqo86kEPFXMUNfrw/7Jk2a3C56Xa5EIXZP+e3qm
 iZM7MOu6jeSN8YjfwBnoPnfvxEXmfDRy7aKAHAIwXZ8HcWJcBKBCzxH/bKkejnPUElzUG8kn8NN
 89rqN+rcjecNwU4bAivsfYkk5KfpV8mGMQMpdC/qiznqKGfX/o3vNkhUrCAhA7toS8jCuHhEzvY
 i+ddjt9PLDGWm8KCJp2snXTo87HlMCycJ2R1rq+ZqsJ8A6tokIKkoyRK2yX9TuiH7Lbt+mUzvJh
 aAo3TLqx+/39ySuODAB0OucJtsomg+IoyTnzSW6yPtaeq8AIcSng1v2vGoXd7TznPSGktwQmb3+
 QAR4bnpBmXr0vFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX5uJl6/Ffk36B
 Ke5ZjBIr7tPqrx5rp0zKMGRbZvfzrcaxNzPsT9F5hRKaHevIkyuGc20nQ/qscKc+eeaHovOQbox
 8rCZ+51pdNVRg6qwB/BdsG4xurPvRxAZqMrphCwPRjvrdbBjtCCj15pCPPUSINUoxkzBwlJdVTy
 0shSn+FY/cYbNy5te2Y9/vHJnyEaw5NUQi2+s0iA5FHOUsJop/ftujGaAD3xJIMqK3Oic1FviXr
 XQvshqLb/nSF/8zzl1Pgx5o0N1bdHoS9GWOTZfbjm5zS5AWPpIb4R8HXdS3Gtb4uJgg4GO56TRC
 BVfHn0d3mF1JhsUx2GKkuYXjAemb3iVnnDZ/e/0gfO0Cf3fuUhsRC3m41lBDy6WlNrjVw1TzNBP
 s4C8l/WTsMoxaF3VyV4zsGR3WSzVHQPP++XNIY+JT8z+Vd14mkgNHRX3f6YDKXCyNNJX/Fia9ju
 oAMs/nXeUsWsFeTENAg==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b017f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_9iiUgdG0rMA4LjK8P8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xoewO6eac2lTbbVLeMvefy1Sg8C8lIj1
X-Proofpoint-GUID: xoewO6eac2lTbbVLeMvefy1Sg8C8lIj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: C4EDF25138A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96662-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

For the few regulators being actively used and supplied by removed
dummies, change the supply to match the actual final source without
these dummy intermediaries.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 39 ++------------------------------
 1 file changed, 2 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 71b42e76f03d..54da0d759a67 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -38,14 +38,6 @@ clk40m: can-clock {
 		clock-frequency = <40000000>;
 	};
 
-	dc12v: dc12v-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "DC12V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-always-on;
-	};
-
 	hdmi-out {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -92,7 +84,7 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
 
-		vin-supply = <&vdc_3v3>;
+		vin-supply = <&vreg_l11c_3p3>;
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
 	};
@@ -101,7 +93,7 @@ lt9611_3v3: lt9611-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_3V3";
 
-		vin-supply = <&vdc_3v3>;
+		vin-supply = <&vreg_l11c_3p3>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
@@ -231,33 +223,6 @@ active-config0 {
 		};
 	};
 
-	vbat: vbat-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VBAT";
-		vin-supply = <&vreg_l11c_3p3>;
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-		regulator-always-on;
-	};
-
-	vbat_som: vbat-som-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VBAT_SOM";
-		vin-supply = <&dc12v>;
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-		regulator-always-on;
-	};
-
-	vdc_3v3: vdc-3v3-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_3V3";
-		vin-supply = <&vreg_l11c_3p3>;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
 	vdc_5v: vdc-5v-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VDC_5V";

-- 
2.51.0


