Return-Path: <linux-arm-msm+bounces-115916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V05TErRARmpnMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:43:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E66F615A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:42:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gkCkccv2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gCiSFA/X";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115916-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115916-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3F2733E1C16
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC61F4DD6DD;
	Thu,  2 Jul 2026 09:51:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF84C9565
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:51:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985901; cv=none; b=bybbpIX1q/Jz5YzeDh9iTMLjgCylDtt/iIczOUBu2T2gnNeSeiXTOd5RECg/1or1SLhSSyA/HUjoe+rNif3y+Jc/p9P4l2MV9X8f0B3YaqiIZRLTEwz7CPFpNRd7+pzsZMFexgu3CGfdtcEerkm5rHeDQUHnLENPLGkW5UDPfuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985901; c=relaxed/simple;
	bh=DTChb5IJt941YLuPwOvT9s6H6kmZ9UZ3rgh//PZhp6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNwegRUWt3CP3ak0A82hqaqJXOW/nCh7cvv4KB0Ovgfnx7GfJS7L36ezYMoHVbyeWAdL1kebGeyUFBU4aptn+iHnShWfH3tJ2L/keXNRqyrHlmyoqRfsKIOcEkeSBlmnd1/7QOyS73qsRBnFofhx/Sn18ugG/fvhWYk0O383QkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkCkccv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCiSFA/X; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KpjR4116931
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=; b=gkCkccv2PA6afvSY
	OrMxaxCA+fDtqWxIVXmrFxAH+t1yZzD99eyXU3uaFZxOnUc+dqoE7fxjngnocehN
	08CLd332k2GZGI3QI1rvxYqftpLfj+zZXlC4vxB0wVt821Mn28i5a8+TzGVVjSSo
	4cCfEYXdul2LpRtNOzBl28gsQmkNlqO4oH27NbOWeAvym7seZdBeKltn3kDdMIEZ
	J+LlUSTIRizgu+GTbL7guPmNE0dKMuALzj+N+R6OFeiNbdD0nv1PEZmER8W1x17D
	08VvFxoKk3jcZFPCjC2co3Dk7SAQnHaOpIeeOS85NmukC8lhinfVbIQk6zLgRDY4
	hZcGDg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bg436-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:51:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845bc2e658aso1824713b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985899; x=1783590699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=;
        b=gCiSFA/XH52X+/IHVDiKXkmgqUPnBgvNJd/QVnAt26UrZPT49Wq3QpqdTu9oTu2AaO
         XRmaHT0dx9G0sBSggwcECxbb+w0zqKkhYVd2fjmdNXRRvDJTWwxoVwvX8W1wZCrNWD0v
         HUKswknZmhes98FsOK5BCaupjS3IMXk2BdaW8sFrGncn5aFJm1KIMUd8eeSeQRhL7Xfj
         CwypAQxN5ZR+/r6gF5d/qaScgcZh8FYKE4u0are7keBXi4cLwoCuL1CYA2b3RXaq2HD+
         jS81ud2/nwilzT2lPV0mlLt3IuGkGalOpRu372bKIU8v6tUUxBFq/WQB1hgGrdYSmAex
         R+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985899; x=1783590699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=;
        b=pJ3yr+jONanW5EbtszzTuz77zZRpFk5RL5dRH7Rxeb4e5u3PjZ0YoXLeJKYrfjF2sW
         tBhkDHQlZSg53mj34iHPAXacZIjYrdlLuD3lpBoFt+hEKlLe8YZ9zRr1P9dSRhazON00
         2T6380bDX2IufTMVDEe1GTbzeSC0dNOH1XPoZWUxErQYojk4srzw2tnBDOLdwpwuhYff
         cKnJDY/kUOCrf47VDYo1WPejUxAMHBB/zraBbjAUkIisPbz+a0vrlItECVIHKsBp+O9B
         If7tN/XMn5njH2SqUaGO9yzFIa4XxvkjKq77bioZ3t5iKFzyORgBWe3P8XDqmafDPr+M
         dTOg==
X-Gm-Message-State: AOJu0YxCfi+561/mjpkQa7oEi0JekAlGVG7Kvmo/3UsWUIU6YIMWF5zB
	Ayr92+lxAQ2mbv7TqsrZFyVkMO24COQy0+ekvC2CPJvHFyLnUaZAq4EHDrCkwByZN57NE1aoyiO
	vyjyx9c4pAc/i9oJlPsDMA3HomlJ9kcohauJDc85rJ3mrI0yHQbhz1kuSp23dcooo/QZ9
X-Gm-Gg: AfdE7cl7QN2Mo/LvVUuPcZFfyEnjGbRsL9Q/4NDDS43J/eAEhtTd3RLvYNLpaBd3H87
	ITCf6FB5yX6v4H2rYp+rdsfvI2X6awxNigx78Fs146ldcKGj3PDHhEdfdbPAAH+XqaFVl8Vuq+m
	A/i39tzMqnWFOd1EpePHoBp72ED1OAzvBPg+KQP0xlVEIKAEibVwAAufAq+MHHSsREccvmoBuH/
	tzDsGxOIgBqe0o2ro33DLnnDhOJBo74Utz3TtUdot/eJ2XEal+QM4oFvVbgWZPuROy5ww+HseiZ
	/v2Kwzj+W0PA7RlQPQSW4lzMt4y9b66a+J2nT7spQ7souH8ImpM7ewPra76rfUs1qIYB+rY1Fl7
	lH5yeJ/PBx4ehaf//Tfqu8ug1dw==
X-Received: by 2002:a05:6a00:b486:b0:845:d729:4477 with SMTP id d2e1a72fcca58-847c5081d3dmr4314677b3a.27.1782985899039;
        Thu, 02 Jul 2026 02:51:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:b486:b0:845:d729:4477 with SMTP id d2e1a72fcca58-847c5081d3dmr4314630b3a.27.1782985898342;
        Thu, 02 Jul 2026 02:51:38 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:38 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:50 +0530
Subject: [PATCH v5 08/11] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-shikra-dt-m1-v5-8-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=6381;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=c7IkaekY6O5VmCRVXe8bHxUYf8Y4vnUM7egoEzFTAkY=;
 b=DuRUX1TXnEZI0l8cF0EmB+JiRPD9vQ3GR7/56gWyj7DcGMFRuCmevqkOk14wJn1a6MNtCGzFr
 MMTEycwJ1V2CuxOtzF8Ze80sg5cHFUV0D1nae2fKWqA1kEAudiNVMH2
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: D0wG99ctS7O8hiNk49TMSyV1d6Hot7yg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfXyOKnl+q9Gw9g
 OGMNHWRsRkHlzOh7DG8gZwamgk61eteNggVpPsWTt3BrmGBP6rUI37lQaNMRuFbEyQlx6H0l6Td
 bmQd+tn/bnyGNBPSizNqsVwGk8+nyE0=
X-Proofpoint-GUID: D0wG99ctS7O8hiNk49TMSyV1d6Hot7yg
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a4634ab cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dm7ITHKX8Gmtf3-juREA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX27XJzC0u8Lyd
 JJ9Foblt1epzmzfomCVDBP3wKTgR84pxsAbkPjIXXFhffME0yfCDT2OnjLQ9sD8OheY++6OExUu
 ZXKCpq/vB7Ypdo4wpdIwdozkF++fjJUmJoFG3fHls81d1pWiqdYE0dcIzwg8ADIoH1bW5ouWkvE
 0DUD9xj+EaH2473HhK1TaDvY2PqwBmRkcn155ifGeEgB52LmanrLkbrgMg9tsp2nPAfGnm4Fqfc
 QhrYSskd4SEPdt5Ig2e+WHRRB/2VnTs/KvHEx7Ro7EuadNioYPUxwPuDfwL1LEsxa8pkS6dEsPT
 OVIlt5WYkHhctW6V7Gkji5QIQOxvgN/Ctx6jN8XIZV9G1L6D2br1GcYfNHk1J9PlN+GC6hYnwzA
 hEj/i0HQSG7UXPwNrClHl69yR2ii5tq0xJMjtq4P120Nr8DZ1Ij3VvRzqQ8jOIvngJkofjZeXYe
 Y0QS+ZiI6/RzQ3tvjAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115916-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA4E66F615A

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

The shikra includes one TSENS instance, with a total of 14 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 120°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 110°C and critical trip at 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 267 +++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 12e4281f7b35..3abd0a686d0e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -998,6 +999,18 @@ spmi_bus: spmi@1c40000 {
 			qcom,ee = <0>;
 		};
 
+		tsens0: thermal-sensor@4411000 {
+			compatible = "qcom,shikra-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x04411000 0x0 0x1000>,
+			      <0x0 0x04410000 0x0 0x1000>;
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <14>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -2195,6 +2208,260 @@ cpufreq_hw: cpufreq@fd91000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu00-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu01-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu10-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu11-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsp-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss0-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss1-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu02-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.34.1


