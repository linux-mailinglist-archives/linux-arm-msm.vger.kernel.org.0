Return-Path: <linux-arm-msm+bounces-90353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FyMGOR5c2kfwAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:38:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12176625
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 14:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29C62303D3B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEDB32C934;
	Fri, 23 Jan 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXFdAm77";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABdmMn94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62080324B1A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175457; cv=none; b=KJjG6AMxFvAz5h9m9jxOgIp65HSzae1MdnSOC1rUdSkPi+1xF1BCeUhqaxvn2DK4oxqMeem9X42DsMsG9GtQE8KCYNrMN8qpZ921jDo2Q2m3BwtTwEnuCejccaXGC2ebXmgi+6P15+PQml+WWU/IcGevVS9f2NYLfVJKWlcge10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175457; c=relaxed/simple;
	bh=TXhrdFbeddVzdxJSPpc0JsHd7W0RNI6taFa1JQtw2Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsRIbKHUuhqzhoVzve7siBT07/GJjxV0KLV7Mdaibvlj1eGhIrQHsLOswueuXQtfmAwHRLyMC18FZ+UokwPfV+MyRfQypI0+BmE/jT+IgUQ/9o8vTNHDAPjm1SbYTDBs3n5IucPKxWtQdy15bDhK2ZD/L+VocN6hrpaEdBncKoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXFdAm77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABdmMn94; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ND0vRc1329340
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=; b=hXFdAm777E1hsU/L
	8oYdj3WHVRQ6m3iUEQUJwoTKiX+/A3GDVf4AETSNeSV4fduBUkNm8eFi6LIkOtuK
	IRs2G4GAFbOed7kuPVqx4r8hQ/IyPDTb+/qNWxB5FODgFL/hiEIiCh+ysUUT2LT+
	KO72KFaf1oGNEAL2UDqHbMg4mzNIlFJSXCZ+QFZG/TsJ3pD716h+eLTQSfBfmWSr
	KzRtZ5Q3qeeDBDu8OKx3IMCPp6xvWnQJAZbMICEP2AYBB8B/ElYgBzswbad3ASWG
	W0udjasaZgrdDTqQIi9CTvE1I+SC1Cj4iNM42a6Mvyv2nIuwJlH8COjaBpCfpwmE
	/vTLjw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv44c9fae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 13:37:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a4c50fe5so770009885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 05:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769175454; x=1769780254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=;
        b=ABdmMn94gidjzvnyuFgzRH+yBlsGwrsnQYo5JLYhDITVLpemc0J5cDbFmdpPXM8lp3
         QzRkdasZYFA3gIM+rqGJT5JSodS0y3pkjiAzOVgFdMr2rCCnh+V/cheNic3WcGcarAz7
         uz0RC5XehrJZUmxB5yqf0dyUwHpnHD73pUX05FdbXXggFG7hTrE1+CoQvGdYYU+FCXd2
         Gwk+x2hyV5Xw0Im79/RCSGFW0vctpXpCImtBKwg+/keUmQXoVLUqSs6XoSddU8ZcQJ80
         pG8FcoXY7CGlM2k+V5QB+7f0jp3sBeNcKblnpRwoWVuwNJpKTQBR07+moHAasjD0Q0/C
         tQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175454; x=1769780254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2iv5v7qMHW5GfC/WnNxMH1dhiF2D/1Y3QmH5tjUTyJo=;
        b=aXv/pnwYtloSnptsVzTIS40dv07tzNPhTj9sGrWWi9hw9VVQ4iXm4VSsecrUy2ykRI
         hl/5wdGb9Fb8seJgJUvTSuuSVZvrsfX5uuWnJY/uUFAQzUlgCFW/7R16rKOT5AqObRc1
         Fp9YIU/LzGsSbjtVWOU9vp5YX1/GTTDAZIglaVfNRrPoiIReEBq1DbNp0DLwnJGAjWOP
         sP8ecqs1ireUARyW8NS0sYgK2q0sdGb6Mm3zMeKlhcIiC+tYw54fUsWZO/uhoNEACpBo
         y2uSJnvwTKhqN2NwdgCvVJ547kYOEAkhaxWCKKOF8J3Zb0LDnixwotUamVoMp24fyDNJ
         uiIQ==
X-Gm-Message-State: AOJu0Yz14GwYMv+xQRsuiMaiiE9JRMT9YlYASVQ/FkoS0kl5NFtULrcf
	QJgxFEb0aITa1klamFEqr6muUqXgQWudR1guttdRROU5ReNbXo+YU9ZTR5TeffT+uCez8Hoshnz
	GqP2X5vsPKPRk2Gfb8ZAgyI3NkKuJnBhQEn9afRLWB1sdwcEl+kKK+LHTDBrWrGgUomYc
X-Gm-Gg: AZuq6aJ+G/wY8+F3xlURo6J+AIaxY1HAJFHB65ociTo3/gYk+l44I8VzzsLwMpSe/an
	F0dvI/iZaa77gxciz6hTsxeg80OpTSHC6lLOFvpf1nHq5AKikTTU22fAk+PDmSC6QWmfDGEawzH
	lmo1LOi7AZw9XaZn92kYSjAfWdr7yfE60A6fbAntwdNgQBuyObQM3IupX6rhRNwm4wo1c7PfyoM
	NUyGXUXauCF6SOHQJdmValsJvGwUfEcbDshXiTag3KAdG+SulfNyP6px+yE1GLoDHnnqn4s1luR
	XU5oGOteANMYEJAnif4Ow99+neexqLTx5DbxeW5kN4//6wTXqJaDnK/wSUJueJfuzmzd+L/D6xg
	ANayo34QC9BwZlvqlZQ==
X-Received: by 2002:a05:620a:7106:b0:8b6:164e:e0c with SMTP id af79cd13be357-8c6e2d91b4amr385865485a.25.1769175453966;
        Fri, 23 Jan 2026 05:37:33 -0800 (PST)
X-Received: by 2002:a05:620a:7106:b0:8b6:164e:e0c with SMTP id af79cd13be357-8c6e2d91b4amr385862185a.25.1769175453398;
        Fri, 23 Jan 2026 05:37:33 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm6649882f8f.20.2026.01.23.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:37:32 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 15:37:15 +0200
Subject: [PATCH 3/4] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-eliza-clocks-v1-3-664f1931f8c7@oss.qualcomm.com>
References: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
In-Reply-To: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bCIXMNVOJjQxQPQTzx/P3Zuxeig/F3AxRLL0jD2jhYU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpc3mUT5+R1DWT9zSYDO4dz9cfdNyjJVE55QowH
 90hpJF77JeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXN5lAAKCRAbX0TJAJUV
 VjmrEAC1j14lVS0EFz1H9gp2NIXjM2/by1tuUuszEYngrDRiNNTby1EGFEU+fcUjiIhOeDvfVZE
 QNuNZLDm9aBLDoQN6NW2ff+80DF2YPVS2qFJ6y/jdREJYzR1JLWzxpLLFrqNBUUHF6EX7FKD6iw
 XjsFCwKukyMDclG3xpg1j3kNjAVseKkdlJRVxWxTDB7Rfv8d+/ma8AYZYoLQTVpDXztZnbeMf7X
 t0K9AMTbYBb03D2lmGASw5g0DW5Fgi3Uk184dUPQEDBxa2w0NK1rc2ntKJAyILeqGMGstnZdqRd
 2S63hLJkGOn3uWkzQbNmKJN/HFQX7y5/rldszv/lINPod9mh+w6KrbzDx77yzOx9+tWiUxjdTGN
 B0NJToYD5EPbrYVd9joH1Hj1EqVgOikNPv1RkCt9rrQJ/Y/jJmDYMR4vX8D0UtBuTDEevCFgfvj
 uCqjJKgD7da1edeGmDS88yloxt/QBDROn+5eXfu8qB6lMbUCSQDhJ/lCmB8xNMoQpc5uEU771o3
 bdTaJmRP0nj2FA+VtrrvyRR8eVgGaqlghR1pbjt4nQiBwsbJgRjPLN7XVQEpM8feL+9BmSAzGG+
 npZ5CRhbQGQF+38Y3Pe/3v39DHSGSVYS/2+EM1vNIHmJGoFcAH8+xxyR+l1ub97/mIpCy02yw8O
 yx5easrp6sdgmDg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=6973799f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uHQk9wAgLkD7mZS6nPMwIpDJ5UxNV-xB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMiBTYWx0ZWRfXz7X898zjQP7q
 2bgAgRgs71LlYqI7dOspwwvqlVxgnfT9VErP0ceE3hyWfW/X1V01Q3iYW7o5TPxSoNpGzz1cS9A
 HnIDEenTMf5Fcs6UtPqei1QN3g1UgU3S/qroGntG8BuQms980W06av6RZmTOtZDdNmLgD58UD7W
 UPCWwG7vCgVNw8F2VZNO35txVbyzJXV01u44p95XsGC3guvRWEm3d5GAUTdDzw5swmO0ZDrX8CM
 7pQAInRq+kUVmBOfqOUWhvN8emw0TCh1FSOpY7URyVcoZJC6sg6hfKuPOMKHVXmDltOmgE0I1Nu
 KlgC0Ql6Kin9io7E9lJbO98r0KMvrXSoZ8qpTbvvT0o4gqNSt4nCj5BBi0Uiqys/fX6Y/2ODx2Y
 EEZJDWdQ1nHA09mFtz6auYkzKj7gpRGxUptMvlSHv1LBr9XSCLZwCvoaO9y8h76moUD0PHhxet5
 IRV3KIk5hhGK5meHnuw==
X-Proofpoint-ORIG-GUID: uHQk9wAgLkD7mZS6nPMwIpDJ5UxNV-xB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90353-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD12176625
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1


