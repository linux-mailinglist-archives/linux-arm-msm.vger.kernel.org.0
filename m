Return-Path: <linux-arm-msm+bounces-107838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFuZAzIIB2qcqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:49:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197754EC33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D07D430E77AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF3D478851;
	Fri, 15 May 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nD5V6xuA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEUfbfzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038C137F00D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844122; cv=none; b=Xrp2WnxSf4j7R9qeWe2bw+B+HeQfVJL2Yt0UAPUw2f9SboiNoJmVk5elcObToXUOan6/7ptCe4hr3hHwDzLJGG/wPhSka4ajpPFVzE7DhEGbiZYWigUwmgTsubhXbegruErCp3lPrFtFIPqwk3/VD7695nCte9DaWnkdDryhAwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844122; c=relaxed/simple;
	bh=Y+GxNHM4ORU46gp5uqhmSXX/Iw8YgfAryTP+Wi/6B2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BnWmY0EvoKJXJ8PmSDpke4X3TW8vTtUQYWTG89qjxzjihI4zZZaxLMv07lWXOqpkN15v47sShkqF43j3l1RtoeALxgC9RQxGGF1WCxoM1b+nMPGvn3eZFWeiIDaRosHi/+EMzjv/IYWNfFJag6jguW6/FkjEf317rmK/6wm5cKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nD5V6xuA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEUfbfzC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB4U6q3512721
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/O/TUJtmfV+6o22+WX7HCV
	eaNQAlUTBh5SkWD2pkDGk=; b=nD5V6xuALr5HA/jBRiLs0sw7IkWO0KtyYoqPv/
	eZwl8lDcf9hIOOdkxkRftk8N0bAEx6pSva2bKO1rKqHdYAUqNSv/5ZCQgC8Hlkbw
	eQDNVlsTQP+B5/1nrAL+mOpL/jhWCZH3tGLKbsmJpqP02hxjxO7ylFm9LVaWL1I+
	stAVzRqYXVIDkAARnvO1YV0eskepM+v2eiJI5DNG0YzL7ThtpBJuucZIjw21Agpi
	JmMNs/ffwsrkAqexUqNLX+AIwW13iygt2S3Ks8FXQUlTUvgii9ksw1H5lLBjoL8k
	eFgOtPS8jVvOutsXC9C12adVQueonH+Am6gtuchcu70HG+zw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb13k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:21:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso81538871cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844119; x=1779448919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/O/TUJtmfV+6o22+WX7HCVeaNQAlUTBh5SkWD2pkDGk=;
        b=OEUfbfzCuNZ27251IzHW1gU6+DoOzyyre991YT+NfH2jbXvfNw6l3adrTJiOV0rK6M
         PJ+vB1zoQhzZiYnYofH677bdHEmBh9XDCuEd4fQCNazIWMNHX51sQ061UJtHeFoVYN6D
         7FL0iQ/Rq/cZkZqNIHiGBJtL+7F1uiS1o3Ghmev2oxMX4LvLdiExy2huDHO2JBcfYrEC
         3cVJ3OVBReWAuaSLfw2mnLqq3rnp1QQ/FUgwKSRBXmTcVYBers5aATKX7vHHvMTwfFmi
         UC7mIx4IpecQoPgTJS7rqj3bqJwl4IaFoXVoK9xGlnkJkbt+Uf8KmYzL3o821Pk6Gb6C
         j0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844119; x=1779448919;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O/TUJtmfV+6o22+WX7HCVeaNQAlUTBh5SkWD2pkDGk=;
        b=Yh6bqRsJl2OGY00NT/ABXwR14rFfbekjlIjNja21ob7SkO7QtfPnNEAud1sJBRk9lu
         CL0xXhBYlok47Pq6nQC6PFzL35fx3TWgwRXWL6vsW+QYNLfP6Np/OzvWbjyCdjp+EG23
         h/+nB1hHIEJwG+LuAQxFYPDO0wDT9tCpDgZ12XcT+qPrbE7b62iMX6VCrpT0w21I7CYG
         /KbpFI/WVq2ycFvxb2aLjSBEUbHhi+C/KY6RpCcjU3Fmp3OluRxFFMmICrotS6pOjsZG
         MD91gyv6dFemV6I0oGMrVow7YW6yzE012IKNpEbOvwoY/iFlR8Ek5dDTaxNeybAVsTeo
         OUpg==
X-Forwarded-Encrypted: i=1; AFNElJ/6spmptxcksdnCWPBOcFnzZKtot8kbFYHYK06cYTm/oPkOGjd7m5YRo6Z4qbmYETjdKBKxNZ21Y3F6wUC4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv463w52V1YIX4VkBijWiXYR7EpLoov5Fr1/8b1DIMBHiwjOWF
	OwP7mScD/phlAMObqBGUEC7rWoWld7cpoa0G57dP0BO2oFa/GUWxVYxt6jGprgBg3WgPF+mlUSC
	lyMCnYfE+6MQ1cgZee0C2mtUB1eYkZDkXzx5N7E2jYb0G/6atx8W50wQ0o/SgZID6R+xp
X-Gm-Gg: Acq92OFPBUI6hwuK+U6q0TbN2zitihKeE3BsNqRJLtmMuomag4rKk+EJtiQmFqKLExS
	74w4XPGy03aAi34UX4JDeWJf5Pcpm+HK9QZ4BN2obYLEbulsKaS26JoDzq/UOw3EJl8Yjm1vDlE
	tWoYB5YAv6zWSYkRFt5CY/JNUFVClkAgeJBtZsWdOscEOIOCio1NpaPUKX3QgrIwSK+36i+S2YI
	JJ32+s2SSdXaQAV/sPfSC5NnVWK12m6ZLgoqq8hjteXygQOpYE9tGjLCSk3H6WxzAL2U9CffeZS
	kKK72B6IC+bzXhZutHkYeOPhEIVdpRUiKJUO1KJTyzCj802+qy4xjAOkZyzPp7RO+CgWhgtgHog
	gZlo2j3kKAh7DQcMKM/YwaOY45pU5
X-Received: by 2002:a05:622a:1b90:b0:50d:83a4:2995 with SMTP id d75a77b69052e-5165a05f733mr45220621cf.21.1778844119097;
        Fri, 15 May 2026 04:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50d:83a4:2995 with SMTP id d75a77b69052e-5165a05f733mr45219921cf.21.1778844118474;
        Fri, 15 May 2026 04:21:58 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm14059726f8f.20.2026.05.15.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:21:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: eliza: Merge QUP1_SE4 lane functions
Date: Fri, 15 May 2026 14:21:50 +0300
Message-Id: <20260515-eliza-tlmm-group-qup1-se4-lanes-v2-0-ebb630de0dcf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4BB2oC/42OQQ6CMBREr2K69hNapSmuvIdhUeoXagqFfkpUw
 t0teAE3M3nJZGYWRhgsErscFhZwtmR9n0AcD8y0um8Q7D0xE7mQecFPgM5+NEyu66AJPg4wxoE
 D4Rmc7pFAKMlRlslUwVLLEPBhX/vCrfoxxfqJZtpqt0RrafLhvV+Y+Zb7f23mkAOvdW0k50qJ8
 uqJsjFqZ3zXZUlYta7rF/8h2OznAAAA
X-Change-ID: 20260513-eliza-tlmm-group-qup1-se4-lanes-2861e6928685
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y+GxNHM4ORU46gp5uqhmSXX/Iw8YgfAryTP+Wi/6B2c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBwHR8yQPGtTG9sRcdUSw9d7DwQ6nHZjTegv1W
 VvwSyztLNyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagcB0QAKCRAbX0TJAJUV
 VrbQD/9KJkFIhb1R4Cv4ZbN0+/KY9EXXVlYK/ldSHj2SZ0XsSrjwATFGf+p3wMNXBSocOVn6B1r
 JRuDGa/2w7u19BG5lbvbvyQGJsT5sTiTOxs1upQVioXEmLefz9//cvLZWuKQelXxfNped05uD8Y
 V4TG5hVAA5Ank+h466MwrHTKXp98P1Khzw/MxJtIKZjrM3L0hgcWvg/eVO4a/YwnRYrC8QlC53J
 sukVpSgqBHocSDNWKBKpF6mVXgjzmJ99Uf/qCVSjxfD08TwwIKwgxUW1s7hBjtXejBH7GYGI5Y9
 PJVaZVkywB38t+t9avkUF+ouw/cWjAYOb2Fcgleppk9ZKL1XoZfkrDGMygebF+aalsFcV0Bk+0O
 ON547ZkZM+T2v0sLDVqtpPWTxkCXGa5pv7UCLq8zK8EG24MbwxJifm9kL1WX+l5CtUzpIONUn3F
 5KNNH4wDDviCxgGgcv3Dr9Msn6/tVA3OqMH5f7PZfSt7/bfU+3+r17XYJOPXrUOiWrHGYTQ95mA
 kSCDkF4C+qasc9/Ep60t4sW+7dvILz0IzKFQH8Sfc2ysercdscs4EJ7MrPraFMgJu82WpN7aGGf
 whlM5x8HOypFtv85bJ0uo28nQU44MQKv71rRWJpIheItgCHBs1ENf4NPU1iuNJB1OLErmc8uJcq
 pMrsm6XLoOW0CQQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX/hOhAd0W10tJ
 nnU/eG7AuKdo4ECwjT4k7CNCEvOrohvHke7a1SiB/znFeyqJF2/SHzphjOR7kIOlZMy8v0PDwLD
 vcKW5KESQzNaltcjPhxBJOkYEZKn6k7oMYKvokAHhdeHEm4kffpY/iIMZF2JJCdE/XYdln47FPj
 IWM7OY+JM0or0isv92Uu2Vs6Dg2yHBCfOorPUqUCcGGozde2TZjQLxY9bikhnv7CA4gODv+o+Sh
 CetCMouzjxg/VOlx7v+b3YyaQalKgqoUBLT+hOtqk5ci14WCwhSE9dn4b5oF1gGeuOCIQ8D+a5n
 seV7Dc3T9eA91bXosiUe8+fa/hoDyiiTdmcn3Yl82tRjRb0lhfLYIb1yYVL725vdy/L1d3VWupw
 2Qu+dnvdOOJBQEWOAzo6AlFLfaEQNZNsMq3N3g1loGQgdVlaAHBdn8LgcDZdiBh8XodAW8RTvDh
 4H99aFRc4CWVURQZKSg==
X-Proofpoint-GUID: 9aO4tvtRZKENi889G0w8a11NFbUEcrd7
X-Proofpoint-ORIG-GUID: 9aO4tvtRZKENi889G0w8a11NFbUEcrd7
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a0701d7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dcaIaZEKivGm10Cz5W0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 7197754EC33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107838-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

QUP1_SE4 uses GPIO36 and GPIO37 for two selectable lane pairs.
Splitting into function per lane works, but it forces the devicetree to
describe a state per pin while these are usually configured in pairs.

Follow the pair-wise scheme used on Qualcomm Hawi platform and expose
the two selectable pairs as qup1_se4_01 and qup1_se4_23 in both the
binding and the driver.

This has been proposed here:
https://lore.kernel.org/all/agIZOAa6nYSb5PWX@baldur/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Explicitly mentioned "per-lane qup1_se4_l[0-3] names" in the
  bindings commit message, as Krzysztof suggested.
- Picked up Krzysztof's A-b tag for the bindings patch.
- Link to v1: https://patch.msgid.link/20260513-eliza-tlmm-group-qup1-se4-lanes-v1-0-1babc6118829@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: pinctrl: qcom,eliza-tlmm: Merge QUP1_SE4 lane functions
      pinctrl: qcom: eliza: Merge QUP1_SE4 lanes in groups

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  4 +--
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 32 +++++++---------------
 2 files changed, 12 insertions(+), 24 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-eliza-tlmm-group-qup1-se4-lanes-2861e6928685

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


