Return-Path: <linux-arm-msm+bounces-103935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGKFOnNY52kE7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:58:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3546439D7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B533B301E656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487A73BD654;
	Tue, 21 Apr 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PG7nuSL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajxoUWka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C043BD64B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769024; cv=none; b=fkI8dy22ayxdz/iNSjcSQiPBz1XwyOL/umxHMJcHMqkONKarcxAGLXYr2f4QGeM1eNEswluR0Q5SlTp9aq3GH+N+/VUXgrQXi5mOif0a/dYBwXv1AnQF4Gj/SOu+a01w/Ek5963T/qOoVypSKb4HcCaRDSS9CK9gLJsGnrtOots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769024; c=relaxed/simple;
	bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2t4rwX3y5LwPTgM1rU45u4HdxRRexxQsRGtgzeeDcpkrzEXhGziCkRjwpKx0QoCELjJ3BJ0AAAStYMQw+ctw+xjvQZTuTmWwK6EvVsZHdTZSnyj7FcY65WPgbGrLAcYYpZ0BTKSB3vP6ujH4wHzcp2HFymp41M8d0FsfIyxc/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PG7nuSL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajxoUWka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9f9fA4169095
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=; b=PG7nuSL1kmQwOD3q
	l2t7x3v/kpsHd8JZrLBF9oHReORPxEYr+xDImSgm7uEfBTSJrsrAOYP05J1Jctl0
	OwGDbGx6A6OcQY4W589D5xoYb2Ae4w4w7JMPlO4XKjVzUaND72XAwO+MobQNtal6
	S8+Ot+S4vNIkN2b8z2THsrEj5fO9Vhg77flBiCDvJXZTVtbkN0ojccCfNGjphMSM
	i+LKT1nB7mSrSjd+JjxRB/Q3K6+WeYKYGcIha6/Qu9zoTQZY92Dj+sE5MdpAhA+n
	/FcI11YneAkz1/gvaX5NgoJrYpqg9wW2+/wPkpa43MWWcwpo6L6mBnL5iRHBPloN
	PeOFsg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au1muc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:57:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82d40278103so2804596b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769020; x=1777373820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=ajxoUWkaQxTvO99y1QtMeqDJk8nG9f9wTWsiDpal9SaefzA7BaEr+9RcnSYVkMDmJE
         cMaXn2Ij+qH3bEYK25FyqldhomFrx9oC2t0oBxKaB2/nvMP+U2t9R5Qg2MToT2Raz753
         +DFou3cZwhpWy0wXZp7MpVmVeibJ30DYHTyGCQhkxltpmkJSqKRKdem2mqKjCPfp3reD
         Ll5XHh5haG0sx1EKiE/EpDENifceH9y+ZN2dt8MLQjT/CtyjEVyfEK90Voi4uHKelb1o
         j9UtjZmOFCR9O9A9kWK03t9msw88ZF7jLKH2dSlEzl2HwwGob2CecVSU75Atk+BqatEQ
         ceOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769020; x=1777373820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oT9Ij5h4fUVAikSz23Cjq4bChK5oWSJ3cw6Um53IjgQ=;
        b=Y9r8R0w8AwFxWRjseI+3De5EJlV1y9RHNtjx4YOUpl/HQRu/+fRUJe1FuHc2e33HVu
         I8/8zS0MD65pXATrY6LUmQykUFKqj2F3KM2e0/phgzlm7OvAM/R7W6t9qkXrP+qEgCi+
         HsFpZrB54GIyxm/HiOX9XDpv7zMCKrgMxCcWltcQ6RTZeNSRj4WjQWUWv56PK/WNTlWA
         8Rf3o8r0jix87D+lC4nbYNhdXyW5WtERaCje2Q7mFiDdMgMITePAFmdsKgs5vqALZBan
         HB+geSxNsjcv1xqYSBYaR8HblIPArFZ8ZszORGHgixtW5G2MLSjUWfWrH7mQB6yOzWC9
         CwrA==
X-Forwarded-Encrypted: i=1; AFNElJ+N1pt/Oosy/SL/nu0LEYnTYhY/fN8/1ypPi2cepZ86cHtRHz8cMol5IWY65+uqWSzeohAxkFxIqAKNNkRt@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkKzHqcdw4m82u4TNUvo1aaQvw36CB9lfBdrmzXYrfdoPCZms
	FgJNv3BEK14adFUcDXdI6q0fEsdigWGrpJv49c9ck2u8OL9dfbLwu9HrWK8/E4BiFSNdp9a4vOf
	teEr3ZOjR/mLX+WIv2LKOIqhYL5xpsPdALMJPf5ZpnVNJkxThvp3rgqso23ABDYKiA/2c
X-Gm-Gg: AeBDiesgPvELTfTui4Fs3vB9eo2zlPfLpImlUp8h/cAlWau4fqDwmr6/1dXH+KsbMed
	mhjKPaWdBoeRFtMTobWOu6WxKYE7MbjGTuzYTiBeAC9uh6IKYbHfjxONiW1gBLZornJ0+eV0Om/
	2g9WInxX6OYU7T7XxOycxA+W+JITKfDIy41k7+UWAjmRD+I/5l0lTXgo5ajbD70jnWhe1HEr9xN
	JQzEkhKV1SrltuOrgvmvDeLuav0coz/D9e8xRdTQ47eZlKPg2BvlU9rYyQgtWOjbKE1MlNk5KbL
	1Y6szBG0XnGZfzQD3xWewNmA38mMq47/lCzVxnphI+IIVHnXzNNYIXiromiRCWL1yl5wf0k1Hv+
	Zlzag6ZXz++vqX8cXvF4Hi7AKr4VmXaHGYFfYuDH2OcZ3GYLC+L0rhIDDzfwpyi41MbHqbzZ4Do
	go1KVLbF76AuvrveegECs=
X-Received: by 2002:a05:6a00:3397:b0:82f:24e:6a50 with SMTP id d2e1a72fcca58-82f8c830359mr18924272b3a.10.1776769019644;
        Tue, 21 Apr 2026 03:56:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:3397:b0:82f:24e:6a50 with SMTP id d2e1a72fcca58-82f8c830359mr18924227b3a.10.1776769019138;
        Tue, 21 Apr 2026 03:56:59 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:56 +0800
Subject: [PATCH v17 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-7-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=T3K0UqY6Cu5YfSXiRIl7BiaaPevFsxba0x8aWptwzq8=;
 b=b2T5tvM7Z5dlcLvy0cV59xPMvqbTJFaBuQUUugkQICA9axzELwlpam1IcT7YKgFOLanJbdpiB
 BXYSo6uOlOHD07DlzveYRvN9Vd65yQfFfTQ0/1FxkUKmazkoBNJ0/oc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX053DnMx/fl0s
 wexT25M60AvauHYBQGl5V2xZvjG5LtW2So6RDvzAydL4Pt659eY831v1Pefmd7rVPd7iiuVlUhA
 OeEO4H4a6kdv5YQLX5J8x4ivuzXCpo+tLX9wudffjChQpuz8Oi4AQH740puOIwN7so7zoiOQpxj
 VeQ+XEJ0BoBCy2ZLZdr/EWwb/1sd41vi+OQ8/LwmjR//Z5HivcT8O5PWgqOjp77NA5+ihQ281sp
 gHJjuIgS4n2bbODRkkILYTIpwf79r6Md1Te5F4vkRq7tDJcmoKYYmypJYO5YGJD4ZlIhSMrG4rN
 BYD52yT3CZfXceakwyVRQ2yNqjDKs/9ul/dh3rpWHjdt2QH5cIge1v0trDf19T6gTfCja8fCsNR
 4O5ObrYYtp3WBQU9KSJW6N2lXS9l9bfskFE7VhOdl3fSqHvFQZkpr7zUlSVE7J7+mULd7QyyqdZ
 3+XKUzECEtlWTdXFqHA==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e757fd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: xSezarwFDPymV5m8qt6l8KlP72yOJtaw
X-Proofpoint-ORIG-GUID: xSezarwFDPymV5m8qt6l8KlP72yOJtaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103935-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.61.12.232:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3546439D7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..2cc855ec9759 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


