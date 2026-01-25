Return-Path: <linux-arm-msm+bounces-90455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB6tMc0hdmndMAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:59:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B86180E52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25BA2302802C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE926322A3E;
	Sun, 25 Jan 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqMm/KrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIkbhsMZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC69322527
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349463; cv=none; b=dsk5gCAAH6IEMnFzZBCekSFYzaBRINiEqsLgdvmbv/vLbtzSroukIgv+YRyZMQgEb1hpfKdZo951S2U0IwZhlC/46PGF3AXfYnglRi8uWjvBbr/kX0e3FiUpr1wFnMOp9+y3kiwDR0MQiRNIZ/6zxdWcmfEkcG43xdHJ+HzswIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349463; c=relaxed/simple;
	bh=tlqsbZH3GVSIvVRdmUychoa8E6W2HNGx8SV90Y2uqks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7jOa3Hg/Fbjd/hhMRCXGpnu5SwhlgYaRa5J0QBlrMkER033/iHMdp0i+AxtZateqJQzlxRtnNHYILJrZDfDylpXAzvn/Nm0WkiPiErTFTKncMELPoJohCu2AckOo7P5+hWl0L1jC9n3RRFHVGhjeoasVuPY73e/UvYnOhXVcZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqMm/KrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIkbhsMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCh6Ln049765
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=; b=iqMm/KrKlcXRMqX1
	qEWGjivNzCILRKGNU1uVICmBYYnq8cpnDBOXoS+p3OdFaecsGRsOF3oqIdsLeGfp
	7vZta2YVmtjCqFkBtL99G8tKvpTePqWMSkHNH5ZyG97oqu0oBOvH+EjuXvyas3Zz
	x7avW4Sq/8+rO1LL8dtrwLWegUeqzqrBId2WT89dYZLej6HSjnbyF7ufAWBI7hi1
	L249rxdv49J6NZMy8gZcvS6J8ZSahkEA1tY+GchsrEQX9e2Pn+5cNBFPNlY84vwk
	MLQtIE/58lsmjcyZhcJ+0GJpjsnsxU5Ao3PG3NET/5fnSMjuHTEoAyOQn9WS+x1e
	Ldb87w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3ha791-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:57:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6deddd7f7so784560285a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 05:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349460; x=1769954260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=;
        b=aIkbhsMZdaqBMM2rK+bB5sodVIsQxPYoDJLy8YjfFhmz6PKJqBFzhKxAU+Fju0RWMt
         PsGHXPdr/KVJLPFoyF2FqY7VLiQWoutvAwJe6DKllGcl4V0eCcs3dDQWxl9nqGrqlq+F
         bvcEawRqWVD7sBl9v+MbNXneRZdxlmoXjovOGF/g9toRRiDpm0jaZQnXhf0/5IlHv8GZ
         jmVnUAZvP9HIePgHykE5sJrilechk47oSp7p4keJjeqo6/w6yLjuQbPF1pT8mu4nO9Rw
         NeTINYY+ABVNIrx4caCFCq3m05cGzTdSzjnHsWD1TYffqIxFR3iy6xsxaTNpB8+d3Adj
         f56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349460; x=1769954260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=;
        b=k6n8UKkxBC/g/YBC4JRXDhZJns+eKGY7/VReyxMpZ0wrw4Z/Engm04m14MBBCUikqW
         dwJxL15tDP/P+ObWtX3nHJru8UOhPxLh2jMELIHDEOlL96lnA58WMb1l4MuwRl2IoERO
         HkpYp3LLm7KZijPthA+SR7Ig8LnTY5SgCB3DFpBV03EFRU+tXRekrc97ridKfZ15+72d
         WdmtLSFfTHCtVB19Qy6rjKzVl5xBSS7QQavdCsmi8OCkoN7hYL7HfTgEC+14OCRWoe2P
         7gA9uul3oanzt0wo3UUdSXOAeBRdyn7l3tD1lJhA+SgpT8pecgZl3K111HzB4Ghl8VtI
         0syg==
X-Forwarded-Encrypted: i=1; AJvYcCVPhYQwWzxcPqXAFdA0qIfTrK97Ne+p4nm6wnbcFM+d0l5L87Z1hhfBGBGXdSJX0YGTydEqMHIC6lzXjMSO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz55pYUjwIlkMUP/KRpreLiO/YgsZCCzF3KpzgcVBAA8rmIspeo
	2KmoLEio+MW5Dba1hylWTRLA6wqgg5Uy7/aEJ+sLXPXhyKWRMkbShrBsJ1+AB3QIOTckRK7ps4q
	JlYJD540CrBC/4gre4Rg/fCflPfOn1HMGawjDfU13TYg37r6MkmPqoSKBc2cUFaxJtkvk
X-Gm-Gg: AZuq6aK3c1Vooi4JUfwr5eO6k5keEIYKwg0eYJFhpe9l7J5BgR9xWUE6aknsRDRyFUZ
	Mjlk1+M8DftK906DmdFp8pUEaq2vImjmgATf+E1UdJMjCc74aOTRN613IrQvq36rcvCpwSS5m5Y
	oA3fUhR2Nc7eKopgVGGsLHo3iwmFypeNgmDExQbdX8PJ7wlD93kJIEC5htXyTNgy4UocaUZ7c0l
	gob6t+ZnuztZ6QAHarZdZ0WF8ryh/2psv/njhjwq8iCydk5HgAOV1RzOAp34P/dGSkQmMVCgO3V
	jj2djcsayj5pU3avrg338T5Jn+ZjMSH1u+cwHyMWHB+/bT0/UGePUHeXOGilOlMtG+Oqc/Y8D8q
	HGvTwxlZ/N2fcAbwl8obt3RtEptRWB38vcd3cbmlSuAxDPsBXpKsrmNcNZPQhbbxiZlprcrnel+
	QIeE76e5ul9jTfzvHIk/14+KQ=
X-Received: by 2002:a05:620a:1914:b0:8c6:a723:415a with SMTP id af79cd13be357-8c6f95649b5mr184389185a.11.1769349459956;
        Sun, 25 Jan 2026 05:57:39 -0800 (PST)
X-Received: by 2002:a05:620a:1914:b0:8c6:a723:415a with SMTP id af79cd13be357-8c6f95649b5mr184387685a.11.1769349459542;
        Sun, 25 Jan 2026 05:57:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:27 +0200
Subject: [PATCH v2 4/7] arm64: dts: qcom: sc8280xp: Add Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-4-552cdc3ea691@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uwzGdj/l2lleZsXaaz7tMKvHRtkCMWu9yBtOm4qdOx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdiFGIgqwnDVZiYYo0AUCcgQ9o8obcBBwY8G8t
 pxrmqXgKu6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYhRgAKCRCLPIo+Aiko
 1fybCACMsctSmGtY51VPtgAGOM3feMdyrsLy5Q13LQMOTLEfqLsc0YhHBjrcxbWT/qjMyCm8UbO
 tXknmoro7hvJsIfr4Ni/KLFLK6s09xkxfPH9TjKLCCFRXjDMvFMb4sR0XswASE02gmVe9Zudjq8
 wUIKz/pOnZwmxFb/pwRPC1PWmkKwZ3H2l5MpwXU0HGdPK3awXAGAcLmo4Jq3OIe3KTVNQDk52af
 nLyBWrkLpxjTKh3qiQkxKR/ii1nosU9tmrrGq6NYVLkWIgcgLkbUeFgwn95jcr3UX93mzSG/XZt
 CMmT8ecMUIWMJ4ij71b17uARZP6dCoXhf93KsHmx/CBn2P8P
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNyBTYWx0ZWRfX6mSr6zqXztov
 wvw7e/av8hxsbLKDIv2ot6PqQH+EpPj1uXfLyj+zcPXgBaHFA91BeFlmr21Bk/HyPHLa9BdkvrE
 liYR9+Kwue4WsUcXm3ki9bz2fGkBBlSWEbneFGaMbNIEs5GVDkrgESxUKJV4KgqXX1HB5Kweznx
 TKJCMPPNlcu0KLg53CenCg2/T6xC82zuMBN6/J4CC7hU8TXtl27bvZ5GS8vCy74ngIpgEVJ8urG
 qjVNrM0hBFRsQerVFR1+pVkXUURB26TbukdULmRlKhTT2kWk1OFd5vTzETyO4pDZJZIypArIYMh
 qSlXOTbdn2AbbvvHExUkK5ggXd+AY7rl8+PVmJxfWFaTwuEy0rJYAjg+bQsBuuvdM5O8XQoRXPv
 bSDug4uZIoMae4iaD3VgD3lkTHGRCRYeBnoqzJ9fvrgVrsHtjqP3UCml3bYgfZus/8+7ihiwIpW
 rpVgEij10BWK+fmzn2A==
X-Proofpoint-ORIG-GUID: gfuwEW676-wqEqbWYgNtqLVAdNnuiWYY
X-Proofpoint-GUID: gfuwEW676-wqEqbWYgNtqLVAdNnuiWYY
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=69762154 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GiR9guPQU3y8euSElqAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90455-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[85b00000:email,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aa00000:email,abf0000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,86c00000:email,5.42.239.224:email,ac4a000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B86180E52
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Venus on sc8280xp.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, added more freqs ]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 89 ++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 41c57e7dc433..66a65ae50f00 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -10,7 +10,9 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -691,6 +693,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4181,6 +4188,88 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-venus";
+			reg = <0 0x0aa00000 0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&venus_opp_table>;
+			iommus = <&apps_smmu 0x2e00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-720000000 {
+					opp-hz = /bits/ 64 <720000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-1014000000 {
+					opp-hz = /bits/ 64 <1014000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-1098000000 {
+					opp-hz = /bits/ 64 <1098000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-1332000000 {
+					opp-hz = /bits/ 64 <1332000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-1599000000 {
+					opp-hz = /bits/ 64 <1599000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+
+				opp-1680000000 {
+					opp-hz = /bits/ 64 <1680000000>;
+					required-opps = <&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3


