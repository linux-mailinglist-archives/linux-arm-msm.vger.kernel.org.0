Return-Path: <linux-arm-msm+bounces-108437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p+tNHX81DGo9aAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:03:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1C757BD3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4D6F3094394
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05DA47DD40;
	Tue, 19 May 2026 10:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcvR1Zh4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPqoEDtU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5339DBFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184832; cv=none; b=HDpp1csSwrPmel9z/R7FczzNHNlM9x3qGljB7qhXXdqUYHf6s3vem2Jt3EQ/bbZv2kWy9dl0Qu2qckXKGm7+FcywyL3bWMiBPQqeVfFxblpsDillv605E5Ohj4EScF8ljt79WSpJbTuggECMVIiL8z+bC6oGL4RUrr8KfglQtsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184832; c=relaxed/simple;
	bh=qgd9pHMpqkPpGWPSEXYLm9BAONMX8FUagLGazl698bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0TXrPV9EOtNPwi+pP8gYHBOrtqRGvnAH1kDuR7oz+H0rbk3FKoHIYFgzHaKrjD9Zi18qzQm2VBzFF+AyxrJYKH1vNWYiCMa9Willvp2gsmLiFhbo693Y1Jw/vLXKZ9kvH9EWmUo9ojNJGo+aSxSuau4aMluMLSTI13vBSEotfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcvR1Zh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPqoEDtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9kqog1256987
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vGmP9BAIl9VO5gld7b1lGPmQppeFMWd0e8k
	A8wrfrCg=; b=HcvR1Zh4bssS4ZgKNgCahaH/XNwm7Vss3Wa520pLN3gQxJLwKxk
	bWZuzjnZW5rI+EzBBXbgzGtm+I1VopaWiw6sRl7rJHzlYxeI8NLFyZ2eBW0+Rsd0
	u0s16kos7pTAwBkoxXmUUxJii6p4YEIsJhgzSXxutrGUTHKGaBvO6jd1DodghcHS
	/FlDobjKBDk2gYYUQK973Z+dULMGDq519t0I+XsxF1NuFfiPlKY11p6Mgzrt+fJT
	TlAGudExQZxX0CVPimKxZkFQCV7xJyzFxntNjIdNKtEEqLwUopv6G6O020tHiJA3
	402PM+eWt4aQYRpu8OhJwcif5gD7iHLr39A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj81h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:00:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc70cfbdso102947641cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779184829; x=1779789629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGmP9BAIl9VO5gld7b1lGPmQppeFMWd0e8kA8wrfrCg=;
        b=PPqoEDtUdfelU8yb9AKSWBsC+XRZxsCDQx0/QalVEQuemlYiXUQI26poL1ko7M3Uwh
         kDJSrSSLUfU8l6oxoLhycAysRECS3MY7zwE06oOo3iyz7blp1lzjzFUIn7iKX15JdZMg
         R3EObd6R22Y8nG/RPP3jNoqqy9paid4TAONUzjTORCKAi9CeYR8ZJgD/CaI+QEXdObbL
         6I9SneZ6MbmdlFuLCbQsc7aXZHqRyGRGPP/xtv/c86Us58298oLpgcrj2WpTlKZZFiDx
         KAVhRt61IPEnix8LTV2lNCGXmGZUrx1v1VAthyFCU0W/fkEIbqHExHqvfacrFQkgleF5
         dREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184829; x=1779789629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGmP9BAIl9VO5gld7b1lGPmQppeFMWd0e8kA8wrfrCg=;
        b=Cury2RfNryKmsa9w0oJgFqBqQVoAJc/ln9UrmOe9npzRkDGtzfht8qGDohh3ulwM3v
         vRYb7w9bifvEJo5FGXmT7FltMJQQJ1+js/nj+8E7O3gk+qSeNZ9D3QG6Kumo92ivjL9D
         HavcIHoIPZ3KoioXIQP2e2ZykaJRv0hfxG5Bzr/xv6TdGQ5Ej0iJRb7oBPLEsZAazY90
         dS2s07KfHdZa5PthEEFOjpJr4ooTsb4wkhchccdsNkBc5y3jkWjY8hdVVNVDosl0bR7N
         S9k6YYq3ykot4iaD6oOulRTuCJc2nGiHjxx5i8lZfWTc9SxF2fGm8VycZOgy9+2yHDVR
         E5tA==
X-Forwarded-Encrypted: i=1; AFNElJ8whVqyOMTfEaVqaFPPUHGU2/PX9EauwH2fURj3BL07D6zG9hmCdkCsQ4VBuksK3V5ORtwggMjjsj1fighw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywni/gaezUQcjjxKQNQwiHfXyQi9ANAgitD/QByE+0PySy8Vdzr
	/eLKyeuhPXvRGSfNZ4unqB9IMhvZZajHSFxI15JIPRCyAC/CyaYP1A5/b/fGA3+4IhNGgLaoaN+
	mXc2JLzxEogRWZvR5siS55Jm9P1k2DjH+iyjOJpCKURujerM2LXfqh9VvreKcLDNyqCGH
X-Gm-Gg: Acq92OFQVuH56XbT4KCZvsPjY4XZGY7kCiUZLotVJnXcsoTOA3kaUtpWSzHJxB4QmPR
	A97wAUFsA0Q3W0gFyV7UDTIzDgy5UAdynjsqZ7XYm9IlbfQjUbD4A8L4DKHelEtic4VZ/M5ofKO
	RtTwDxhUe5z9wTMp3sFrQh2SUhSQRRZa4YJvHC7oGuybdIAnIXxKG61KrsRqWoW5yZypAeJCUdV
	PanY6Bh+hm6vaFZmd/VmRzCQeepMg3MaRbVy2JzKo8gabEJdpLF8wr+7SonugpWgSqGZMdMOnkC
	cnHY3i/HOpvbmlMj5dmU2xBarE2TqsG7wGYjX2sVxGaaZRUZaaSHqAK5nfJ77uJUPo3stc+ABil
	HTVRRwkT/kDCzikjXjHoApWJFlcBFl3LUxK+2
X-Received: by 2002:ac8:584d:0:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5165a051e3cmr241222691cf.20.1779184828747;
        Tue, 19 May 2026 03:00:28 -0700 (PDT)
X-Received: by 2002:ac8:584d:0:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5165a051e3cmr241221521cf.20.1779184828006;
        Tue, 19 May 2026 03:00:28 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm44266388f8f.37.2026.05.19.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant port
Date: Tue, 19 May 2026 12:00:15 +0200
Message-ID: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=qgd9pHMpqkPpGWPSEXYLm9BAONMX8FUagLGazl698bc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDDSu6d0Y8bBgdjbVe++S3liC2PxuLdegD4dW9
 DLpZXpJbMuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagw0rgAKCRDBN2bmhouD
 175yD/kBamyb48fsgxVc93K73eYzIMVHGlzrWB+VHPgxpuuYOyN/QY1t4ZXjYSYtJK9xzT9ErdS
 /UkFggw0QsEs9SPqT7moGzS6E8V73WRqjFpUSd9eSavtiENnskarSPrJcnVFLwyfLfDGy0v0MJQ
 2ZBQ1ZPke+PKd/YrEhiGzuf9PH5iZbjqoVv1WZJbx1xqRE+O9w0SCQ1WBJ4/pJ35xIDa1Isb1lB
 1qfrxO+NkSBZo+SozJlKaRW85jK2m0PHFi7sBpgMWlPVpYVIXaPPP1Jdk5i3dRhX/KW3j+WJ+rU
 a+zKHz04YTN6feDZ4RA1UlnO3dY41I4bIZN2eDhiKLwmb2Gf4en85hgHwT+t4gnBuIobFb/ZdKd
 tjdBz+BUaOr50Q5xddBAfeM2jUiAMImSTmpBIvmINvrIEkoviU69+nM/raQx+TlBiH3g0H3qNkr
 NIbKRs4PRsS2jIK8kYkz/Jf5UhrLbflung7R/pYQOPP1YF+9OmZUk35fBtMI6XI4Kq4Q5qzU6m0
 zIE05C3OVfkeuy35sQIKarJbRXebeaGeq1Ds+ay3v08ePQT4pcwlNoPoMO4l/OuKgaxbKjdOhyD
 SyXCwt4d6gYOjBn991wdXNQyryDiMXKs87Kh3u0rEEkbjG/Ew1Ld6WAwG0OaqDa03h9VjU4GN8m Y/KhIHpbakcQZOQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZZwq-kQArcKgZ7nDekakvvzC6e3nnbEI
X-Proofpoint-ORIG-GUID: ZZwq-kQArcKgZ7nDekakvvzC6e3nnbEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA5OCBTYWx0ZWRfX06CRxdLX1XXd
 I4vOMDmxXuHLEwhHO51ldIUWTXrJ2HIxAvshMm7F7CV1s7Cizjt0VZCc+wi4PhHn7T59vDxDD2v
 +DrdweougwB/Hw+zw1vkA5yv8krL/+jtBNCmXa188OGnt7Ek+Cu7sku3rqbLFHsU1iixvBkJccV
 Ytf6jH2twIQNCCe0qFUnKqIW67xZqghOoW7+/cPUTobW9DipS1DbrkhxoBMIn2A+bEchnpGeg5u
 z6Zbza22wJ8CY/zqzv3317twf79kY58bSXEsDRd2xd6w2aaCj98X+wdRzMAuS0jA3BvBZKjNh5L
 zviz/MpOR8Nf1Mn1N4vjoPde3M4MNwlnPDPaimOjkvZicpb0bMJwWWag2IrIsFxCD2buKjouDW6
 TjG+dY1O64ouMt+nKqGhzCBfUjkgTtgy3TeECwpwrvmX+S1IY0ylKMPjzhK9PCC6pz5eFyXVDTd
 nSZ7tM7N8zAcLwG/f1A==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c34bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BTa4seIaVWWYZd3midQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190098
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108437-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE1C757BD3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The binding defines both "port" and "connector" properties, where the
"port" is claimed to be for "data-role switching messages".  There is no
such dedicated data port for this device and role switching is part of
connector ports - the port going to the USB controller.

The driver does not use the "port" property and there is no upstream DTS
which would have it.  It looks like it's left-over of early versions of
this patchset and is completely redundant now, so let's drop it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6d3fa2bc9cee..975032ba6004 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -84,11 +84,6 @@ properties:
   vdd-pdphy-supply:
     description: VDD regulator supply to the PDPHY.
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description:
-      Contains a port which produces data-role switching messages.
-
 required:
   - compatible
   - reg
-- 
2.51.0


