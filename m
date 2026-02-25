Return-Path: <linux-arm-msm+bounces-94029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLq9INeanmkZWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:46:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CE1927D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2641030F36D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022E13002BB;
	Wed, 25 Feb 2026 06:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUJ2V+9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KARcSlRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1757261C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001826; cv=none; b=VGng7YTedctQ9pjrGA3uCTs3DFUpnKI2g3mtaTHsDjEs+01FDbsewWl76QGv3O1kQlth2BZEZeH2PjUmzuyKyjvaNvVHwF8Nobt6eX4N4AfTXD5Z00ezuzVm1dg6aw+3fFjovov3GzG3zG/GKKrlnT4IGw3RVTne/6aELdK0b1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001826; c=relaxed/simple;
	bh=UPljPnwGN02FV4whxe153HvivXYHL2hbqv3xEdBMCks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiMFDsYQd/BSG137JjabxCR1kc2+8yzuJtrBHNzovB8HAHbwxSJsBe807cv0Xiih7KRApUBcpv9GuF5jXc5H7jCCBtqnRUJUs/vSXRjwmi6Wt22HOET7ouF8Sw2/Bay+iBhmohLXPKNDFIEs5t9fnpOaso1pejXMAWQaqmkJeB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUJ2V+9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KARcSlRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P1o62I3660155
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJigwPyGJ8dCjHF+mFF/TMsitlZdF2vQIcs9383ED/U=; b=XUJ2V+9JWJCaXutu
	RD7C70c8ALztZJxV1QzuHe4Bv5j58MtMvRd8J6gbGCzAJxF3xxHuVZ5o4JBXFcRd
	nvjI4LrK13P9yYRamR65+RJAO3WKmNqjKRBHMkQQ1IqpLv5DIsRc9HkL01wuYqI/
	3zsnvDgXliE6vHFxVjYM3l3xMmmOyx+36DPZ0LCMXXPMBDdp0hQz9Ev/LRtjIulS
	21jLazIH1LNmL6l5amb/t9MKwjDgXsZgjNSZQXqIQJ17wcfMYnS7QQxI8f08fCff
	OvLd8Gpfa5wdcwbWWF0yYqy0RzEq4e3ssXEcb7DlyhKSdre4MjjE+yU4hqBwdlbB
	fvQ7yw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sa7ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e1dab2235so3818923a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 22:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772001824; x=1772606624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJigwPyGJ8dCjHF+mFF/TMsitlZdF2vQIcs9383ED/U=;
        b=KARcSlRfhD7anwIlXtyPgZn+uDNOw+hbukPqhrsPPE+bGYvP9lY92znlDqLx05qq0Y
         ZrKqAU2CcnfEYDx8Px07R37NVGYCDbLUv9k3/p/OFAvyxPY7LoVkvYnxUUFoMXBLPZzP
         0RB1NOLOWhBW7aXHAZ1OQ4ZutTI7vRg/mztqUqy4TwtipC+610n3FSsvpQG+Ad4mgX6W
         OCC/ACu0aYGYiQ/9KrW/lELt1cfS4E+so3JH+fBRP0W3E6j2PKFR3XaSjOH0oKQVarez
         7rKH0mD8cbRmHYbiZp4cKO96FE5nCyayKVa6z6Ox0lcPb8fbrCNOE6XotjypuIGF6bZb
         6WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001824; x=1772606624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OJigwPyGJ8dCjHF+mFF/TMsitlZdF2vQIcs9383ED/U=;
        b=nv6l5vCVtw//uniOaktTP6ejpEsTJdNjM6VxKJiPTJUH0LGpKW8XaYVpCSsytbLOaF
         8Sm4cRY1o/jnv6+HEtA5eLIDSp8X/2X966hTfnWVdi9RKaFyUtEuxZ9qlGnAJ3FMGNHK
         qB48epv0YjI/I/bmy2GckI8Adu0NKPCPjt31u8ip+ma22kxRFobu091xJYpujQqp3STI
         qIIvT/EcX6YyZYv0eIdP0hOEoFS7o5VjN6NnoLEs+GFHncZIUS/5YhehmI7EGifqLBc2
         7cVBaP6GdQPBknYwNgIdJTr6vxW2ItXt2UyXMy4dpbEctNcYmb/pS0vQOQUFgDb7N5o8
         ERVw==
X-Gm-Message-State: AOJu0YwabAo3VTV39fqkcW0zDm2CzVBOKwJoM1V+DFMjNXeteqJuDNZW
	gM5GWbqTgTXGJtvMwLyTGvoF8pvYIR60Yfl+4XND6srZjFn9BibJVIStv9qPjW/tqfJqitiUhuf
	GmDG61MONgDdMShmKDKLdeKAU5uSAXsSTRhHgXeQtkW4hgebotVaJgLQcfctT0u7q6KRDXxypAE
	hn
X-Gm-Gg: ATEYQzz+HqXMcqmmJCpHR3h5QqRJ3KA0kXSkn+4hn0tjHe601L10dFawuoEhvCY4CKt
	xlXmubh3Hk7fg+DfBsciB713BMqjbsdVqKPycn8otQ7pa/FWkNKZ/ehv4QK7SuiSCHzp2P8DieY
	kWzNKXK+U2A6nmxJIFzKKwnTPBBMqCFMLj5CZ+6g/YZCn03Vd2qmvojZNsE1y2PbYfl+28kX4tH
	nE3g7PVgnvrEFF8CR0O8rXEGEwP/sLAVx49XL4pPiNKh51ccZnhB1oOtmp2UGGACESM9lfSfwWB
	0FJIMs4sPTWmjeMj4nQHJQx6uM4UDz1YxlmPoHnEzJ/Xq3UhbBz8ON13oZ71POR13HE7Ua1HHKw
	FaujCvjJ+8/rlJlPVWvaFKkGskfuhKncN5AyuPqZSXFwUDP2WcM9Qrp4Xd0mcbmM53ITpmkbgqH
	SLXm1foGgxX7QmrxTFqQCk37hFBAfmklfcQ/aeJHkkaQ6g9h3Fj2k22AXq
X-Received: by 2002:a05:6a00:6d5a:10b0:827:28db:7a78 with SMTP id d2e1a72fcca58-82728db7ea0mr560393b3a.17.1772001824282;
        Tue, 24 Feb 2026 22:43:44 -0800 (PST)
X-Received: by 2002:a05:6a00:6d5a:10b0:827:28db:7a78 with SMTP id d2e1a72fcca58-82728db7ea0mr560374b3a.17.1772001823766;
        Tue, 24 Feb 2026 22:43:43 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm12856570b3a.24.2026.02.24.22.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:43 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:13:12 +0530
Subject: [PATCH v7 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-wdt_reset_reason-v7-3-65d5b7e3e1eb@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772001806; l=1538;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=UPljPnwGN02FV4whxe153HvivXYHL2hbqv3xEdBMCks=;
 b=ZzhsYL4PV10DnVy/EvE4tum4Z897c5DcHgfmu6cWmuAzRpoiWnKg3+FEkkcMDYPmMcF90b0r2
 ZZR4Qtn4KKEDnHpVlD9SZTuBj2cElCwkvWMyQwOGN2nSsxYxlnLg4E1
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699e9a21 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bt_IPO6jKyPzq02bTywA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: YHxVqMvOfZsRSGERTGVuZ2cQXQHCxpwE
X-Proofpoint-ORIG-GUID: YHxVqMvOfZsRSGERTGVuZ2cQXQHCxpwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MiBTYWx0ZWRfXyJlz0T6Rj1HC
 2fJO2qx2jft2DwlH86hu4hu/AVr55A7JouZLzTMlqHr6n+yM0UIL3oesdZqaZ9LI8CVOjx05ktV
 7VGoDjITfd/c70JNDkG8iAt4nJbK25H8lkr9mv5W1Oiyfbj2CzIufE7rtsqp5qeyj5QtBsWxDIj
 sCOJc4VVB5KlArvzJ8TPeyReYHuJBMTPfol/YZIiUdfgZIWI+jwE/E0IcjBLIjlgfx7xu1M0sw0
 jD9z8yMF2RLEOvCM/HeIii1yLpiNt8k3VVFZl3tuQVKhmalaCTv28gMigb7STrn4SHhEJ9VMB0e
 1VBW+dAafJIUBeJxPNzxgbo6RVyBX6r9xWRmPOjKYV+1vtphZa8We6hCTJ+3vbDvGq2oxccLIuf
 v68XO9oSZstDbObq8ILvBPGKDaogjMYYKsARcfb+yQD72IUK9DZ9PiOhXerakxV0llOFPkMkYWq
 ewI5eKVh+l2vEC40boQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250062
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94029-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE0CE1927D3
X-Rspamd-Action: no action

Document the "sram" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v7:
	- Picked up the R-b tag
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e8316ae88f8078a86043a6d04def8..3ead00da3cd6ffa0f6102179565723d4ab6c2929 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -84,6 +84,12 @@ properties:
     minItems: 1
     maxItems: 5
 
+  sram:
+    maxItems: 1
+    description:
+      A reference to an region residing in IMEM(on-chip SRAM), which contains
+      the system restart reason value populated by the bootloader.
+
 required:
   - compatible
   - reg

-- 
2.34.1


