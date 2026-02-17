Return-Path: <linux-arm-msm+bounces-93171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI/wNlBnlGlFDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:04:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950614C520
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCAF1302BB96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A2D352FB7;
	Tue, 17 Feb 2026 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBIHd0AU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVSzHPp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4926F2B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333248; cv=none; b=iwmRC4tlaKiSdEZ16yW8dSTbBiScDBfNH4ehqeWh44BimdM7uPhTcWzQjOIkWWqKAfbq7lY+f1tIr8UunpKCc3ESeXwfZ5g9X7pwKx9BQQHHnrD9jCK2/7jzZj3szheNT9f2FY7czfWangWeoL57ZqXo4GEmMMo07bV3sWK0pWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333248; c=relaxed/simple;
	bh=uHfBWLqN8X1WgnAF9WwBF4Xru1wOFFbx2aCGVEi/DdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HAMLiiqoaiFFH8KMtj0N+4fOqRFSaT2dm5wqe6amA8XT74Md1chVsWkiKluImf6mwDNnQ/CBSWulGI8Khx0nUCJXB7naMCQb8F7sR9fSDUd5AJjUwoIlfGreLJuGxcPmAvWuV04CgnWyTiNb1VCi2mR/7Umi73HZ7wB/RO80biY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBIHd0AU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVSzHPp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8ihFL288959
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ur5RSTe4fLLt+HWcvPskwk/5C9GivWUoPg4
	Y8NGCusY=; b=OBIHd0AUhwxPGK70atGMQiIaEA3x/9SRmtQmGPtu6hv0xkHtAec
	YQYY8u0XaJV8oIr9S6Jn6TqrQFoOy9F6eIPRIvhp8l8KKHA0qiTwy1Kov8zg327B
	RlI0hLdb/QdHqNozaSBtbmyRbyKVmpx1VRtvCU3flV5U2fMKJbq/G/S1Y2O+SA07
	jiAvoIwpDlN7Z7qRwIfW6V687Uj2ms5+/fXhuKxbXpQC6I9n6W8KJdMRZeN+yDgI
	YmmBC6xjQn65MG0b8VkLAEYTRANP5EDapmZqNVZCwFos49EN6IT11FSlplWigjuQ
	ZO94HykPBECGS2WT/DblPmsar26QM18+YVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrtctq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 13:00:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5033c483b74so346540181cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333245; x=1771938045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ur5RSTe4fLLt+HWcvPskwk/5C9GivWUoPg4Y8NGCusY=;
        b=JVSzHPp5kpz1oVaEiLLvks4ytwmfEZZiITZw9McloLO93K3BuvGhetCQadc5tJUmMr
         iVuUDREpY4V8zdhC+NaAOkpuu8V/3iwr3SXa9bBhTG/boDGbjqR9ZEXqMuojPMgeE4k9
         qG5IGv+FUyP0KbZX6AMSkV6rqaN5yKZjbGDohT5uoTXLOWWTdsbrquGdulUuPJUZFFED
         964OkRy0GIXPaHmL7vxkGj9ZB4OmPm5abnDL1UwmTuX9vMqvjkox1HfQFqZtQjh4YI0D
         6FI9exNf20pm8NHl852ivIGDXQeUnseYGBywzMgdo/r7CKeGY4kVlNvFSZiebC9FNtX9
         tbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333245; x=1771938045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur5RSTe4fLLt+HWcvPskwk/5C9GivWUoPg4Y8NGCusY=;
        b=XLytrg8sz+8zzI66CpDAmbHxEPLO6T5f4zn+504PJ+oEN2ZH2wa+Ntyz/yKhxRYEUW
         DMzQ8mTqYuSrY1fr4gHz2QWlHgH1u3GMSBINgfQxvn8fdm62gWFD+jfQen7kkbHz/EHx
         +uYmO5eVrW+Wr5eaKQJN11ovzMUgjF8ZFERyHWnLBJYzVkgiHpYYe70gcOxDlhY1L6xG
         MzyzTXZnsnjXZDgtcPuY/lNkWZzfUIeMOl5+zZh2geaBVh2rf0tuImi1GX34FLBO3AvA
         0KKi4jv55IaA0dM/XuCIpwWHa2aXzNBF4cuzaPd0K8jEC16ulgVdcWFmQu3PBxevv0Us
         +7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIVFn0zvWsxQ5K1aCz0U9pXuXq+hraDlaDG/ysnUi9VQyhd/9c6o1cJi79gonFMFXYvF8DXhlYH+2WIhNw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1R0MJ5zegHDmqbJ/OgYI4YABV3irDT152MYUPVEHTN1h12vMV
	K6Ym/+2mQcKNy4/EuHnug8csSoZinhUOAWUKTVDz/iOMGOQ0JhYrSd+fUrMGg1nAFz8P1Or0unf
	zsS8ZkIHo7n9H2zy7g5V1+pZYp1sBioBsc5EbCG4I7WW+SFxJbH842vuRLbCfn1NEiogFBynWY7
	Jv
X-Gm-Gg: AZuq6aKjLYI/wI4jcixrZHCV0++oXn106OgfMowDcFsDKDpE9vTGbPRyOpoC5WT1l5a
	pFD6yNR/Uw+qRbuQdlAYH0bd5mU9g1yzoLiEFG3XNW/dEu0v8btOFSQFPeoaYzD42Ii4IcZXVXT
	13UlnAFJ7aqTHqzFbUjFQpdzlot8ipbdtPpYgNxbQGVB34Z7WM9QrFZ4z9UdLujGeitpcGIuP1a
	ptnIrnuqm87ddgoU+MYRVQ1U0Ewl/jBUofT3gZHwfVzWa9njAhUgHO8rsw4rh5WJcP0RR7eBLZK
	1tIF6S0TzN3peLxvYgWN4Lv8IH4KhJt+mySYPWTGZaDRFVwCatWJ/1E1fQtMkZzaXl6xV45ZN4z
	14xgJKewI9sdOrX819JH0aLnViciIdtp/aCX7Tw==
X-Received: by 2002:a05:620a:254b:b0:8c7:f62:21c7 with SMTP id af79cd13be357-8cb42281159mr1621039485a.20.1771333244377;
        Tue, 17 Feb 2026 05:00:44 -0800 (PST)
X-Received: by 2002:a05:620a:254b:b0:8c7:f62:21c7 with SMTP id af79cd13be357-8cb42281159mr1621015085a.20.1771333242270;
        Tue, 17 Feb 2026 05:00:42 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a44ae0sm100240045e9.29.2026.02.17.05.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:00:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom,glymur-rpmh: De-acronymize SoC name
Date: Tue, 17 Feb 2026 14:00:36 +0100
Message-ID: <20260217130035.281752-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=uHfBWLqN8X1WgnAF9WwBF4Xru1wOFFbx2aCGVEi/DdY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGZzUyE1UJhO9c3rw39SaxLBP+mJ+RGNxZo79
 KulHrFapG+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRmcwAKCRDBN2bmhouD
 1+wtD/9Kfd0Lh4iBIzMyoUfjQk9dgiBH3qMH9ShJMaYLtpFqTf82rE++FpKngmnlMhrqO2bec++
 HeHEzksNkskmop/WyKfWGT/5E6Qi4LTptJxmVTKEYJid3XVL5ZfDghQw+IZbCaiBeEgBjl/ToC6
 lPm0j8NVJhmUkfCDWF+cGg4cK13GVbZlrVW63hdewideLLi1E5ffLsi1ZNTNH7qxzdAP5xf1C1a
 41dhmsIB6Uk/HTC/KUWqlbED6/Zn/aIDT3z1/uA7QoJ6DlFVkvFDRYcg0wA2MaRjc19JIZ2oIqG
 xu4GCqaRb0MEJuFkNj0jmeuolIRReo09sGZOJ1pYKpMKB+HqGB8pBdfJYBP7J4Sqj7X5s+ehjGB
 DPHeVSnBg3wOzSygauf3YKVA/Is9o4QY6jxxqJNydpI+/l6TE1YFzca97fZwJMpnBYywX0TNH0Z
 JR7CSg+FZPk/sr9k8T338wC9Jbgjcs1uAKcNt5l+v2J0JHMmgFoOxbtVxpfotqR4fSYqKoohCJg
 l2ZFgy4Cz8K4KBgfY8tYwP+0HYwqKMYmnSYxBQ7TmWFim/bf4TUBrKHmzfpoBfDM05DQm9XGArW
 /47KNAe1rZIPOjNRL5WIgQJeV/Hej9KV5YJ1VizGGKt5mpJzzg4oP/+YufKaVj6osVAOplrknJ2 BRpkWf2B5570fig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994667d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=XOZzOcVMVPqQqVsGDssA:9 a=a_PwQJl-kcHnX1M80qC6:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX/76rpdMDFEB4
 RJaPcWeyV+4yj7ecdYt6niwG/QfmqR2t6Ng+NysFj7HNkdsKCV5KFDR53zS08/zDgQjIgon539F
 F6ovvNRFHaGXUXEpAIr1jOZXannoxAPWJv5cbqorLTpQCISeaE4hJnrBkF/2sm+dH0hSYKBeb05
 RDliK7z+S09gswzIBE2Wvj3DK69QNazQBdncGIaz5poc/stn9eE3TDyovogbmPfk+3myeHCwPwF
 RhaIpVDk69Sz2ioZVh5ja2ad1gjJcaAievOA6F37Ga+WKJWL8VzY2RC+liMKKG5wQ6YpHwpJkyd
 BzaSlVCBShGrZxEA3aeDmKXwCWtbd6MEJP8h/Iq+LBuEWEGqeDEpKxOOX58zoAalqcI1CAZmgOf
 rYsdfoUnURQbCe2n+ZiLn22LjmWzFfkyAPUex9YuQgPqzJkTtuC0oBrG/uAT+LSTJIQjIYUpbqB
 7hpOs/K2taJwxPwfhZA==
X-Proofpoint-ORIG-GUID: eTnDudWunsKbTb-TdatVTWWoaHujy2uH
X-Proofpoint-GUID: eTnDudWunsKbTb-TdatVTWWoaHujy2uH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93171-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4950614C520
X-Rspamd-Action: no action

Glymur is a codename of Qualcomm SoC, not an acronym.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
Split from previous patchset, because I messed up commands and combined
wrong patches together.
---
 .../devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
index d55a7bcf5591..65b0ff2b2c85 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm RPMh Network-On-Chip Interconnect on GLYMUR
+title: Qualcomm RPMh Network-On-Chip Interconnect on Glymur SoC
 
 maintainers:
   - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
-- 
2.51.0


