Return-Path: <linux-arm-msm+bounces-92191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKfZIGI5iWmW4gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 02:33:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948210AD84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 02:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6E22300614B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 01:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DD52BE057;
	Mon,  9 Feb 2026 01:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sv39CkZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQNW7EfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976DB296BA5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 01:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770600761; cv=none; b=HziYtkuTRP7lS2j/SaZchH7BQMHUXdLsbDSM3T2cC3F1Ue1ZI0csci9c+GG5uiKY+5aRJahNbz3lxvqdC09kP5cTQFDO/kPyHTyhgTwL3UBid6+EqlPluU9z1laSO1y34WmucJ+9vZFYuIrhyDbkWE7Br+0K3la1jfTNpVDAOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770600761; c=relaxed/simple;
	bh=mp7znh5yUTXGIVAo3yop0t0MQrXUpW7C9vuYHOlkZ+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3WtzMjp7yH+zfPX8L7xP+exq7c9rDCQ5f1f+Dshqrp+kMP+ZOin73JOA0xaUb/4AG2qUaP6Wrvb7+UZALbyZkiI650C8dvLlzvKsunWug3StaDQTsgwtpmXhNfBoSBAoxtRZNMvTTiQYdBpqdi4ACb1RfxQ+EIlpmj0cZjSNLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sv39CkZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQNW7EfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618KnFud2307441
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 01:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLZC7NStGj9UHK+dN1GsxWqO1A6r1SVJAMjsxlitvPk=; b=Sv39CkZH3lvXKsSk
	OUj4hlTSGaMxV5UN92ZbLeadowgI/gkGaPvtBUnJMdb0OrTW6C226j4jXosbjCYy
	IxWdAyl4CeQx+l8HPxxeVU4tzvVFd6rWWJxX45ii4saJ8LxqBjC0y9fHnRHcRwQ2
	JIolkha8+OBohduHoa6v1UZjZcU+xxlawekWErX9vmAHPd+zITcYm22ymmyBgV72
	+i6di8IeYA1GFC/ndbE38I81l9dqjL0RSZRkConurzFXpJgRFV4HjDcjdKVGBW0J
	SC2P0JFUdNZd+i1SWbqSwn1nGTlX9ou46wU63Qns1aUNBUApuv6Dy8awTLcbXZGi
	vjwl2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xbfb8cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:32:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70d16d5a9so643596385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 17:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770600760; x=1771205560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLZC7NStGj9UHK+dN1GsxWqO1A6r1SVJAMjsxlitvPk=;
        b=NQNW7EfO6fW6n2DENZZ0cL5Dq6ZtEBB++R19pVKqNghAvpdNSNsTNsqAzS23xNkD8t
         1JGNv/6Yp/a2b6CktyryD+9yZlaLcWNMXblPngk/A8eEs6x9EO3FUrLd4OHwXgJ6uoTu
         uGwy+OEBnu1zE8hP9ob59af4R/fZzdJCLkS4SJK8HPBK7waSqeFjROs9eIhMuRcZZPki
         Epzmr9auVmCcvHzAGMDE61GJa4PrQA6fCR7e5KM1xYN7zVXp4NMIOhxtn/Uut2+nkfdl
         YtrNh5/HYTx8Wnsk8vVhM28nRHVGG5vIYjfmskSqIHgod+ARJ3fA3H+/3tOe7uvsUAt4
         K5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770600760; x=1771205560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OLZC7NStGj9UHK+dN1GsxWqO1A6r1SVJAMjsxlitvPk=;
        b=OflMRUPmYSJGS9RVf2tuXB51a65P9YiFSEfcvC2XJLY0ePTWF19AsxLoAbvd1YRbIB
         fgBhHBUxbRyOvOhV37zByIxbG+gzWh+SgPd2TOu22FXaYpZKqDIUuAxXJxoV69CkyujJ
         0i6kCPnGpK+0JUPQf98WR/3pFMNm8Zg3sti9ZzQBOsDXzgC08bwoRQjjuP4Jlh5UIyqx
         LodekU5oHjF6boYS3o9jhxiDq5A4Dr94yOOIYtJUw2LaMUHT4oWRuciab1Zf+0YCAQZf
         +6Kxo+9dSNa+HhyK6D1FgCJJG/j8GGTjkj1GoSiN3qQxXyFQ5CyCP15XWAPhaPx1OhCa
         9K5g==
X-Gm-Message-State: AOJu0YyGVsHuIwow9DGTOknv0w/NIyI+/IAOWyPnJcShOvAEqV0ms/6z
	ox69wDXjs+dRaa7w6tdpjrPRIpSEdP8dbQL+4/NNxmwidSHgJFSaP6ptvSSjub6vv0F02wg68ZR
	PuDf2drHOZI3G7y/WRLKofV49msfZ/icSj8uxddQowguYAud/em/VJx5wXAYbqFd65m1g
X-Gm-Gg: AZuq6aKz8ASlbXP0H+D4yTHCMQXzS3I4ghmLzSmP7q4b6U4FJOPpaajsZAhzIa6dh8g
	joakwwzOKZULE1vIP2g0GujPRwpaOpjh6c4Ygzk2LT1pjoAxUaRMazvimKJqE2T9pxJZlkvm+NZ
	1UYtmN1KfguZ4goeuVFCX56+0GvDlelc9tPZWuuKH2rbSeMWXXaO8BFk2KhTFdQulIFURAXAkXv
	7dK+2HcfUtvqfxvikjssoPD+LBftlWJi5LWLy6AjtTe2uMDxnzVP6bjtzAMgtPjYpnq03fqU87h
	n94U6dNrqYgfi+8cLnBSvC5FTdOKOAglEOC0hPuWpDgKEtJXBSuElJ2G/rb0tT2AZL5uv/5v3gm
	ZWZ6bL7eOGSNpLIdHohLimOi28CnvYBSJ/AHn+YY9/eq2uBztO5Ul0yqZfTI9+/qkLzm6N0YyV6
	K243a1XFMAmSL0FHUamEWKkms=
X-Received: by 2002:a05:620a:d84:b0:8c9:737e:384f with SMTP id af79cd13be357-8caf16ec50bmr1247852385a.76.1770600760121;
        Sun, 08 Feb 2026 17:32:40 -0800 (PST)
X-Received: by 2002:a05:620a:d84:b0:8c9:737e:384f with SMTP id af79cd13be357-8caf16ec50bmr1247849685a.76.1770600759693;
        Sun, 08 Feb 2026 17:32:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm21688601fa.3.2026.02.08.17.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 17:32:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 03:32:19 +0200
Subject: [PATCH v5 4/5] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v5-4-0a22365d3585@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mp7znh5yUTXGIVAo3yop0t0MQrXUpW7C9vuYHOlkZ+4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpiTkmrrMdMhMEbVQIM2UwZj92DyXcxp10jHwj6
 jLWEQRZZzKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYk5JgAKCRCLPIo+Aiko
 1RiAB/4qIi1i7I+vVAzoVhTQFOz0gVhc0D+EnKHisbvFDn3vTLE93OCIyy1sT+R3jpJT/I5FGyR
 aILzOSwDk7bmNV9iqh8Q046Yi1z5FwxGcE1PYC6ZclVsqzUkMjoP/PS5V/ZGPmA0M5e/To11NQ0
 iGrVdZ1Dx9B8vl0jVOL2MuGtNsblUbXKpwhpbDAx5b0Ia0jdOOUPWhJngOTxnsKEeRX+6XcBgXX
 fuHvmZ5ayuvKHqlSj/jC4SS7YYdPZMKzYqlSOmv5BXrK8rhzvFb/XKgKByn+55bRZOiKCYAXp6a
 Ucvx5TukvxnlZ0OimOI+itVCJgQ85l2t35XIHTDESkmypKLZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: GnNRHZHGOLQ32mJeFIRcPFogk8khO97O
X-Proofpoint-GUID: GnNRHZHGOLQ32mJeFIRcPFogk8khO97O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMSBTYWx0ZWRfX/nNXIldQpd+C
 kOHYUFon/+jPPJUCusuURpO/X+LVByxwoi6+SN5h+RKbSOXB5tmpzPF026SuTlVYg6+xHKue6Sq
 NyXe8bruIaLzmRNXIXS6trDLYjU6zBtTsvGuxh3jvGc5YODgH/R4swB2IV0agfzIDm8YfZP5RmK
 LLMcNrKlCjRyNiek14VCjS6MckQG4FxqiNxFXE/2hh7cDJ2AqEtmQx/ab6Vu5x+G0iXaq3itAke
 eBnhBvMOQaI50mXuShVuaEOZc+wD4LkWZ7FHJdPBnCptIwcJNCv8rQhA+WqbGxs5I2A6Y5ovk0f
 87BfFiOgpsxPlrP24FWTV+bptG0PxWlTQWgmAYelwuQyXSJXtLkUPq6ahHuB/f2pxz9CLmlnU3y
 GdCwfyhZUJFbF4WypATQ+mAeiD31shV94I/9x7ioWl2moJLVrJ9hM/NrwpA9yJJei8s6wD6bqeF
 moWzZPqnGmyf4SYjz6g==
X-Authority-Analysis: v=2.4 cv=aIb9aL9m c=1 sm=1 tr=0 ts=69893938 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=tBOqMctlXquWO7Kigf0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090011
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92191-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1948210AD84
X-Rspamd-Action: no action

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but,
strangely enough, using MMCX voltage levels.

Add MMCX domain together with the (more correct) MX OPP levels.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c7dffa440074..a1ab8c3c27e6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


