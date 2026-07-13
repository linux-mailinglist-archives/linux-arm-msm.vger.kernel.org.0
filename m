Return-Path: <linux-arm-msm+bounces-118698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oFJ3BIyrVGqnpAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:10:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D674924D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:10:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TtL5+IoD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L0aVbJ8Z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118698-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118698-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5471130BD612
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CF93DDDBB;
	Mon, 13 Jul 2026 09:04:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9873DD531
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933491; cv=none; b=P+oEpd5Esd7szS0MeDS9YjfTQUNOoCRkGI3l24bcEw6pDgYRTL9WZ4UHCEUROiKloFbYc38BhTCc8V/Jdl5Rw3ovEYP9l3nckp7DUztRvUv2JbNFW21wTX+0VnnvblSBDiynTsagIDVw4wLBxpQDECKrZH08BfbPqRMv431VQQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933491; c=relaxed/simple;
	bh=fvzDiZ67AMugJfYnW8hKFy6ptEIPS5tGSZjlOp7y0GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtP9m1iDF2lBkFH67TN2XSI3pmUH081rMAA51wo8bUkoRY5BZJeH0CT+2tkBBNp0vSCz2NQ0Tz4G3XXdDZSrwIYXvtaas52DtlrvIHAtv0AdzOjMXsdM3RjLynNipRlcw4HI3ZoiTWtEl6PGlwbnyn2jlo1YW5ADnbe0qP9FYuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtL5+IoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0aVbJ8Z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YmdD794265
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=; b=TtL5+IoDiaQq3q1J
	dOJvBcjoXyZJyTPVt/1FHGGRUxwkG/L/y2Zd1OeP7jaMPI8ESCu1dpVZe6q/aNrD
	+mkPA88cDx8dWOU2hW8Wq5jt17WpaqsfMmN5SJgjTqCF/hWDmeKai0iJvvZrIhWj
	O3JeGcYNLiihHjLHMLtbzUqg3SLCbpb0Eoi3uU1nRy9kUWsDxQLAs03zguliiOE4
	K5SGkuVBjmiU8MsY57IJv2qi7XtqAhJdSFRttvytgk7us5+vZDHypkIcHAau3La9
	GoxitdVjWzKo6o7HjRxXe6FGet3aKoyTqy1VsdAY0+q4Fvx1UjTyz0AGd3FOAc3i
	vH3X8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0ape-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8952346bb9so2191285a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933487; x=1784538287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=L0aVbJ8Z20JIpgSH2PukZZNAoRSz/vuDvy+DVGZPJcSE0ndleNQsgLconif4zKFq3/
         o2j+/uCc3VZCsOyjrGnxgxzPK+qUN/c5DqICTCFXYmr+szejH+IR2NL+u8lgf/iOHtJ/
         xrBmfWpOTAWQOShfa5zDzmqj15WnoWdsqZdXqCRXnL4hZVbEZ0NulX+DrSTCCUXce5h0
         JK61y/anA3hn7bEnP8LgoPkYXx7Pa3nnLcvJCbu+9c/rEIWz7QSnReyJiPPjmYzqrhWZ
         WphFQqqUdYkBede6pVgcD1L8lvCGj4VvfayPk4n1jVa9sn2cdKQvU1haPin7RPzfuzVj
         ruew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933487; x=1784538287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=jeCLPzstQzR3BLggjHP0RefZmqQYvuqGftaV8ejcjhyFTFs0PE22KIgQcBhjoZFocg
         4W2HCVsUVmF5ZdE0h+cnKYuPfM0+io7bj3cgi6T2/QHFNYn/pc5y9h2nWTOEgctulTbz
         7PmK5IJK/r6FDYkwJ4R3kdT2OfcUTbwDaDZmi7uJ9EJkqlh5DX9D2Nmxx6ICbNVXR+9c
         NYWh2om8Bmc/+3u8xA+ehCxsfpgEgtjHzZzjky9UcNbsSLgQjPVnyo7H5jMXp520bKSK
         /OR7xh6xx1T8jJ36PM9lwBOWsZjiOjVJWsMJr0q6mrxVzMfWAL4dT1yDYd/uY/WKOnFX
         9POA==
X-Forwarded-Encrypted: i=1; AHgh+Rovdnh6YKvhwmux4NsOajnv8em1NuNCWmn4z3S25dLk7hZleDZWRetV0P8qQPkUzZkVavK9URY22FB8aBm6@vger.kernel.org
X-Gm-Message-State: AOJu0YwhO/a4qR0OBwuUsghjgRmqqD7ceeKEs9bJv86e/Xwc2Ydiep+v
	+IuzbTX9eKXRT+vAEybR3nMcySRXPhFaKTUaA0Fat2Pll/EsI/WI1YRXVNuQUz1YWP+NcYqY4bp
	eAagj8ceeQOuY60Tk1sEpK+5UOs7jjymcb0+ljcGkUdh9CFVJMY/vspUqVUJI3ADtLYaG
X-Gm-Gg: AfdE7ck4CUYvoCOLTtZa93WLQL22PS5aFKtRjffSaJFj/GYI0wQS6XD8jQBt5JyAxIf
	sbhmkTair8ns87OVy4MS12gTWXjxVtTvhKYv1wIvqXBbLNbTh/SIzt9vgEGKnUnzAwCntBSUsfU
	0GvhohuIs4KAYH1m/ZeEvPEKs1TQZjKIGF4IvxX6ZnVL8NkIplqny0VZ+k6pBln4t/XDMSqxeDS
	nqFRzA3EsUp576GEazdEd2HYswlxQvwJYye5cyQXWh1qEUTBvX9nzeZ2cD5ojlZAsEvlzIBAOY8
	bpBbyAEby7xq2ucHfHNwhFMUdwj/nKoYmPsFdvENW1KkfuLvFQKTvX0k8MV61e2R6Q17Ix5zH7R
	u61eODAqbaQWe2ZN9yTqE7PduAFQDxNXnORI=
X-Received: by 2002:a17:90b:2247:b0:380:ced0:ecf9 with SMTP id 98e67ed59e1d1-38dc7822590mr8390944a91.4.1783933487298;
        Mon, 13 Jul 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:380:ced0:ecf9 with SMTP id 98e67ed59e1d1-38dc7822590mr8390911a91.4.1783933486867;
        Mon, 13 Jul 2026 02:04:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:46 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:11 +0530
Subject: [PATCH v2 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-5-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 2mAm-g8xTdb9iw6ZYVRYcSltfe3AdkNP
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54aa30 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX6HTLIBoXCA71
 scTHh3pNliZNknmbOyrAyMnrqG4dZfv0psVsJf25oGYCOTHvVM/zx6UmUTmqr5ZsdkT6b3icHHX
 GNrwKr0daT2NOO97pRItEZ9Ah2B6nLs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX0xSGNKVFb2Ok
 EYscQz+57Ycq9ibRiRGwtUtDhZN8NFnVQEyJs7Bdleyv8qGSPkQRn+7odWsnu1kURFubx0+KwZh
 9wB9PajRIU8PviiSqzenV2vA/hysz4rWbbkLL/4m4Iq04YZkkTwUTvS/Nde0cKfp35l61N3jnn+
 8YrhtdQL/nWKMSX10Quiz25appv9hObG1j2Ucz4kWTwBcouWRpdX6fyJuyOKtikqykyFuy1tXOp
 A/+n1vuf55VusEpZOosCC4Txrt1Fyt0SdUJo54xQqyVw0JJbot1j4l3RVZlUV/wV+t6nAzT2E0r
 ziokrjJvTmr82mNm2N40075lq/lgIXCgX/T7PVmeJIJsYRckt/pfmplOTtCZoxC8qqxAbI3e+K6
 uaPh3FVMnq/r+I8hWFGVkEhFSMnOJRvmz66NLEL360/MPgNHNJQRBtcOGjcMTyUagz7q5RmyOK1
 L38WfWQ3gzRoQbBhCtw==
X-Proofpoint-GUID: 2mAm-g8xTdb9iw6ZYVRYcSltfe3AdkNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118698-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 529D674924D

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

-- 
2.34.1


