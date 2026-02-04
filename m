Return-Path: <linux-arm-msm+bounces-91838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKDiKTCGg2llowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:47:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2184CEB20F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8755C30966FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CD234B69C;
	Wed,  4 Feb 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe75XLG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cz+WMRf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6773E34B1A6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770226977; cv=none; b=qXlFq6AGduPYrzPwD81Y6rsAtEgihSXM6YOiQH8lzPjwuYb02rUvI+cQ+uDpIK1Ryjcr3j6HtH85VltdJLCvG2vXeTArIDlZGpz9ysPVWykbZzKZ26in0U0cUnlLbbbv3CxpGn9rnvW0rItnjLveFPVchDObIs0iYPKWBK1ju8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770226977; c=relaxed/simple;
	bh=rb9BQvsUgWnWi7NopoqFStPBl6AI4hwBSvA2JEwcNRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFRMQSZQWiRdLyggL5bryL28K82WY8dGhy9RccgQLPPakVafE0Gs6tpVwLLV+EkW4cFKOyTwCOZKnr1fB4znxpFFu5adQfCwkBQFyXDz0cCFoc6S4LNYOJae3+vS8bGSDMzZ3gaJU4ggzUQXvvkmGQCKdS2B9mbV5YdOd0RaWvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pe75XLG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cz+WMRf/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIMrF111000
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 17:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XqNr53atLXa
	WJ6+VAAAHezxKZyJzO3XsCkWLFOW5Q/E=; b=Pe75XLG76TdFkS+VcQ+I/JpgGU8
	9B4KmyPIXVZUZVuTgXhryfY9GzeFjF/2SbsrsefJdnWA6Ac5pvWj7YaG8e+d4RFW
	EIrtENsffJSZ7LjEEzwioffMlXFbQyaDx7W3fzvpVVEFIygs7w5nHNo4EWHNjvZD
	o/6ri1gjAiOdI9taafAyq7Uj/9dYd+wm55G7nghJY12vOyVBB5IZL/flk7Km+Rel
	5UmzUKMbXsntprIMefJ9n0iQwiYo7gB9CvagTv9dORMq+mGmkQfERN9aD6Pgu1XR
	x30TIe7AO3J0O0VeZvlTsYqiRGhmg0q8ktVQCEoCTT8o+0xhNsw8Juun2Fw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjh8fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 17:42:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50620483ff6so3727331cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770226976; x=1770831776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqNr53atLXaWJ6+VAAAHezxKZyJzO3XsCkWLFOW5Q/E=;
        b=Cz+WMRf/afLcBB8JBXKfiJ19l8mC+1B/ah24y55/zco0rZJzfcb1X1+9A3iPzlSaQb
         h9dF8ftdzU1jtimsIsQ1WFbK+FZGdlk4FKYmJ4CFOBj96Syc0+YRbAr9g5IptGycl6eo
         SObFMvZDejJO7/bRpEiGHxdlMN8NXr+Rde4aDm4eU00m5QRmnbSErrpn82AgvG1Sz92s
         kq47qcNwuH03o/cHDs0zHbB5HZakqclZvoB/sgGW5kIsniShNnjf52DdNm1hjxG7SjrR
         +ZYCHhgkjWn6O6dD+du7O9lU4oQHVnvVveAdgJgrTeeEK0WNfEKrm6q4ZLCXUlOiiSIS
         AMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226976; x=1770831776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqNr53atLXaWJ6+VAAAHezxKZyJzO3XsCkWLFOW5Q/E=;
        b=uApJ4ImPi+iWXiVAx+qGgZLp+3Ql4F1ZYRrhAw218GCD2YH1yf5ihs25bh6eyVfvrK
         4be1xsAdo6vY9k0CNdAO3U/2DK3xaxpsR21j7TSFyvLo5a4BUYFgvP6VCDTHz/+S9QJV
         Igjpl6vg1wuVJMwaFYeETdMgGdGFJ3Cx0YXRSlSxkr21G00oTpABiBnKXVO8GD1SKKzJ
         CPsP/ggQYF25+jKoLWzOnJVhfjvHZNrG4n0TgE8vjT6CrvsV46lO+Ialu4nXi3jAmKve
         rXeJhX27bsSXgwemjIWWLBW/Qe3A2096iAyQtXl6CmU1iYz1gGedjS/TM/e2Xm3bX2i0
         kTTA==
X-Forwarded-Encrypted: i=1; AJvYcCXAxZuCqgY8JnKZ9PPj4+1Xu71ExU05JPK1QKQUfdqStm6BKftQbTlFEInSfKGZEucWt8H6NuF7mbsn5Fiv@vger.kernel.org
X-Gm-Message-State: AOJu0YxHmztwPe/2LCTjDLqmiS4cQ/W4nePxJgE4eyhhretoplHCGs7u
	s8CtkB+AjqDLamfVx2UsLfRm53dbAChz1PxqVJS6kWkatpbNAPJPePgegvuZ3/J3LwHUhw3o+p3
	JCP/ViJy5pmTyYpZGt0FOfEtiricpf62NBGiqE6+mRpCCpcNU8OkLSO3jo0tWClGEjTDm
X-Gm-Gg: AZuq6aKGpIuHfEwEOfvBA06JtVfjkedr44+/jmEvx8esiKHWMtiCIaZdp1ZxT+WTloW
	2DI0qf7sG8uVb+WmV/+st/xzJ7/OgktgNZPm7G/EuBUBPytpyDWCav/zeV1KVHIzI4Cw9qYzdn5
	zPpUgU2R2BjgMmWrWtBwFHUrXeYCe16lfRKG3j2+4Sx6Yv55SgIOPqDsAV+6u6JTkicozJ/c6Zy
	vvtDTwrtUu8GZx0y3UmbZuwJAtAvm+8Cv0i5vdKvGVw+mdn4GByjxahZHyolsaQHJcpl2hUKFRt
	wikroATmd3gyK63E4dWeqpobycC0kuAMyoDwsGGiimlZSintpTi9YrNZFApzwKM5SjM2s/M+JVo
	qjFckYmfFUFH2bePZPbk0uhjO8MMwNd3nJRG07COlerg=
X-Received: by 2002:a05:620a:2984:b0:8c7:d2b:b5b5 with SMTP id af79cd13be357-8ca2f9c067cmr507824385a.48.1770226975574;
        Wed, 04 Feb 2026 09:42:55 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:8c7:d2b:b5b5 with SMTP id af79cd13be357-8ca2f9c067cmr507822185a.48.1770226975126;
        Wed, 04 Feb 2026 09:42:55 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm959985e9.0.2026.02.04.09.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:42:54 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: monaco: add dt entry for lpass lpi pinctrl
Date: Wed,  4 Feb 2026 12:42:37 -0500
Message-ID: <20260204174237.2906-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=69838520 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UxGNenrRC82WP0KDhzIA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: QkhflrfJ2OJhUZWmqRzM5rulax5BBmfJ
X-Proofpoint-ORIG-GUID: QkhflrfJ2OJhUZWmqRzM5rulax5BBmfJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfXyg+xmTaVBi2j
 h88ui5vwCLlHT8Adq+0nrV0Wvs+Umu/xc1GXLKfZ6bPswyyARFbOp0fg4qQtVc9fk8zK2O3dssl
 jFPkXvDhdhhnL/Vf1TiIQNevApjbyi85mOgAa1Hko1X4zFMZDDksb6R18OzE5C9ggmb226GNFP3
 R7k0aZGSIPsx7wQ0/n1j7xYMjeKwjUqKkT5IA7ynN4wBSkk6bLABnBdvFATx0xRPXo4M0Z7pia2
 Ees79sUNfa/slamj83bMKnPluXqUYnzFjwG3+sfoZRGLbRrnM1WkG/UwDA7ypv87iOibyDszxHx
 /p2U9u0VVsYDPxCjJRZI2Gl86eYBjUhym8k32VoviYwdmeq4IS4YHrZoXVSOAAx4qYtCv9Z1jLl
 hPZpc0nK1Mht3GFnpYmnkjiAXy5bDDH1C48jT2DrBHWej/DGwQNXESZwzCliaLUO5iPpORXgMMs
 HI38UECgLdllbgAk5qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91838-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.52.125.128:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,3c40000:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2184CEB20F
X-Rspamd-Action: no action

Add LPASS LPI pinctrl node used for setting MI2S and soundwire pin
configs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..e1ea94d2f0f3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2866,6 +2867,21 @@ q6prmcc: clock-controller {
 			};
 		};
 
+		lpass_tlmm: pinctrl@3440000 {
+			compatible = "qcom,qcs8300-lpass-lpi-pinctrl",
+					"qcom,sm8450-lpass-lpi-pinctrl";
+			reg = <0x0 0x03440000 0x0 0x20000>,
+			      <0x0 0x034D0000 0x0 0x10000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+		};
+
 		lpass_ag_noc: interconnect@3c40000 {
 			compatible = "qcom,qcs8300-lpass-ag-noc";
 			reg = <0x0 0x03c40000 0x0 0x17200>;
-- 
2.47.3


