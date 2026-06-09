Return-Path: <linux-arm-msm+bounces-112086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R9QCMX3dJ2p93gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:31:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0265E5B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:31:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RO0tuAye;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HY649jom;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112086-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112086-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 717213036EDD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B8D3ED5AC;
	Tue,  9 Jun 2026 09:22:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC583F2118
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:22:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996959; cv=none; b=fJWdZioxxcFt8okfG3MC2FFoJXyy+XPbkW7OM68F04sjgP49f16qC8TdRJpmBPE4n4Kd0P81DbyTbbiwclEHtx3TrrynndUGdrUODH8ZgSwTSSxW/CnFZmRVBFn7je36SAdVOj2I9ot+RU3PUJCH8kXxUHTNMC1G0o7+xctqVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996959; c=relaxed/simple;
	bh=xG08a9MtrfF7704OGVxEoz1UjpEo2LGi9XCFiUL2SuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulA91ImUZeYwJr1LFeEYvnegVS9i422DzMlMoQsa123qZ9jaIQLIf9ZxDNfzk5Pb8lk9mqp/III8hOuJNCNv/4ObrGvRnIuLGmghJUQcou9P+tZWw38X7zqKg3/hIBdhfzkyvKOvekdiuSFjaPz6cLbeVGNpxJoQ+3HXxBxcwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO0tuAye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HY649jom; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599J93n1815823
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jHu4UiP5358WASpNh0RxH8TEEZkSYnlkqWXIR0Ttzk=; b=RO0tuAyeNfT+2VBw
	vurr0qT4/5zljSNiQNKRBT0dBxYt0nEWUSFAFtHpuZyEBcq9ej6rbrGiEMifiGSd
	ghaIz6g3BPK+qXFAX38hKFqVF40cPDnG3LwdaSdCR1og3mqKfR5uWtOKJ7U8o0fI
	dBoIRca5+c1Kcq7UipJtt9zQUAa/h9u0MqsvFIBuQzkFav6hQWZ4HsJBy17Sxdi6
	Ad2xzMr9Lwadw2kiCefptADIseChHKrpARnujwiWKbQCZjVeO5LXG4x37gA0d9mL
	jUGKW2ISqawda4XugiWPB/x6jjSg2CsTRrcLuqw9UMlqBIVYZWQ/fY6jxyR9U3vp
	XFhbxg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jr1f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:22:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842278a630dso6883400b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996956; x=1781601756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jHu4UiP5358WASpNh0RxH8TEEZkSYnlkqWXIR0Ttzk=;
        b=HY649jom/DFBNHRPsNnHK7xmo6xiGe3CcANnnPJkxxTa4DzauRKEHlncJjeKb0kyes
         QF/xjm7KYzVwVrGBb95u6uN10jXz9N1PfMUBDkF+OS+Dx1R8tyZ7xP39xN3Wy6xCwDqu
         KR9nocl93dkL0WayuEgC4tXVJlSTn/6nYCSJgt6QOjaBiVN4Q1sOdlGgXsx9iVuFNpCY
         QDE65LZNu8HReyEQaK86tUKRydccS6Khn6Wo5boQjmzUgqSEYRUeFMoBxsxgZgTTI+nI
         jvdOMTNqeN7YLkzfpum48QgqWXBFXFQLWw/r+gSRSo3uIDGLD3OpVqqE+rf3xuKRotb/
         Q/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996956; x=1781601756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jHu4UiP5358WASpNh0RxH8TEEZkSYnlkqWXIR0Ttzk=;
        b=r8xPQulEGu689NHK49MF4FOhfx7ikAKeg3Ok0tFAzDaNyIAj/qOrE4+8mUjSJ15SGn
         hHLBNjqJHWmsjib0e/PsjrhjDhGx9AXMB6+NXo31OIOjFWDOSi5L/3vOIPNVO8F56Smd
         68m8DZ647bbxGobjP2gtRCioeN+24v5p0oTdh20cq3GCuTUbv8IU//mblvkA+KMwajC5
         LLGsRFl6B3TT2dNof/QKf2j7ItDYblsQ69GJrF1KZKIJCo1gChz9Pg6l1zVaGW5sHqwb
         9MRBE5aZYTZhVk8zEe2EcNz2lmkkjGpXsOcw6ernWI+vugO8Y6cFmt2dAGm1tNLcLrls
         8RAw==
X-Gm-Message-State: AOJu0YzgEVoOekzm2nfzBMd0xpXOEDDr9DOQhMlj2uAHyD++g+KBsNll
	JkGzU6jjJka5BthhS6cElrN+ebLIGstf30hCF2xValeN3WKAAH19DFQhT5cWSxvbEKsGqeTQrMm
	mZMdARFbM1BMKYVNdLayW4uJ+ijVjuB7jPw5dStyfQrrAMvhCnjziLsA26FwDpm8s3cI0
X-Gm-Gg: Acq92OGpR7AchNYVmzPKcpxaK1hffoCulEEeDucluN9TppmlSQ3KJMEO6VdzRU5orBs
	bepIJrEa55ZFV1XVFcvEcU4+iicakfwfo32/HaDXtPl6eCtNsDijNvYRVlEuQdkcek96HuJKo2/
	Azqstu0SFuJdp9NrNhyfXAhsJgsrawhzGQxEDVoeASVUXjan8Vz0XkErNw2yLQsBxqe8zpkPoow
	Dce3UgrpOZhytKAN4A/dYlN00oQrFEZAzH6k87rLaBTWo2V2cdipyXbf9l7cMHP13EVBG0qUX4B
	v9ZTWJIimKrdLragfSavOPQNo1GZdOYsvaeTdp3r5j7LkzOhs52Z1HmZNYldWXsHt/DoWhyIvf0
	ur2BBX637XaX9LAvYjN1EiJjm1D/fn0G8ZdAdX0cJ+6Spqz/6BGuIBS2/pc/2VOaq8xmmotqzEc
	TwgYujgJHXP2uCwGdZwFl5X6HWTDc2XvRAfX07vVXw1UMMBevpjiRfR9RAOxczGw==
X-Received: by 2002:a05:6a00:1302:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-842b0f9c4abmr20018133b3a.34.1780996956038;
        Tue, 09 Jun 2026 02:22:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1302:b0:82c:9897:70e6 with SMTP id d2e1a72fcca58-842b0f9c4abmr20018101b3a.34.1780996955623;
        Tue, 09 Jun 2026 02:22:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm22861582b3a.30.2026.06.09.02.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:22:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 14:52:12 +0530
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-pcie-phy-v2-1-83bc80e79fa6@oss.qualcomm.com>
References: <20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com>
In-Reply-To: <20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ltpoVrSxhDWtfd6VkZcqfECV6FTaDseJ
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27db5c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NiBTYWx0ZWRfXy2pdPvcqUPzk
 nfdhQSpUQPhAQsSNR7f4aG00Y+QK2ZzFyLl9Vh5DbVHrFLF1Cjd42ThpOtMVSHE1sBqTHm8/6Pv
 j4iTEC/NZ+eHwsXGw80CU9V3Q59sFu5Ov9eUGJ3CawEml28m8nWmWne+Hw+/fEb+wvQrv4P5/pO
 F6ZDXmp7muobRO3zgvHF7K3dUaI6QwxxJ4zjPJMjO7e6UO0yUpFJPHVi1qxtbx10hav31ieTccR
 Wq01mH3sfpF6cGhVYJD/24/dRVD5kGbj0gIN4L3kNuq6jTi5fXqaRZ992ce+zG9kXeeuXlR8Dy1
 lxxCZyRwaYCLyd3NxwhT4vJM1F2UebmGR3esmdx3Pcz5HJfB+gHdSUPd2gsZppnDYT2R+UcHvad
 28YbwI0MeLbue45vr+70eUcnpYTq2Es6uyWs99KD46/ugkZT1CaCViq41QHUZyPpQbEyBKenpCb
 L/iaQWtyhRw2IpUzibQ==
X-Proofpoint-ORIG-GUID: ltpoVrSxhDWtfd6VkZcqfECV6FTaDseJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112086-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EB0265E5B0

Document the PCIe phys on the ipq5210 platform. The 2 lane phy uses the
ipq9574 as fallback. The single lane phy is documented separately.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..fc155ad5fa6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -28,6 +29,7 @@ properties:
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1


