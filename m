Return-Path: <linux-arm-msm+bounces-105685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHSSEvVv+GkYuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:07:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D804BB6D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 402A2301410C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A153921C3;
	Mon,  4 May 2026 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiPsu5J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yk6xVz68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E1F391517
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889263; cv=none; b=ofZHd+6v9zCDUVptEo+gC/lp0VD6FXMPQ0DGlwiZmun5Krsdd4FutG63j/SP9ghymx0hgGCigvPkUx6Nap4nQNkv7zvpSTnST536BMCSJdKKf9E+pwd1ILVjgxKs72/8j6hMiKqgETOLQwNWMIxUnJUiVswsW8GJNWqrvvbr6gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889263; c=relaxed/simple;
	bh=Hva+7Cg1fc/998zfCEeQlMLQ4HwKhWH7TQGTfhprwB0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sKRisln4Sa7zDnVsD7YYkQOemFPtzS4OMeEK3gg5VbKGerL6fipTfGjaCbLFUuEMEzNc1H0ZD17Yc0rLtOIUwIEhkuxskMyEFb8AzLB3z3Tu37qo6mNV42nnWpDcXgf4OPFVyRuG91OHc0nYzA+JLmukm8kr6kWzmKkUUif7CoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiPsu5J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yk6xVz68; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fQ7s3894126
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/UmldWu0FiqL/mzzoJDrah
	2WxwzYgTU4xVfslGD01Mw=; b=GiPsu5J/NEbJ1oJSKYoH3+jxVbtdmcmiE/XnoF
	ArQ7CeYH7pCfBGIOdZnJQBAEAn/OMyTPdRBYCQoDgzBS5jOOvpYK10kfz/ZyRraT
	yeSn8L/VQp8d3sVEh7MwFSZ/FjR+ZSHCgXxqXiPNlvFn3PScMAd8Bl8eQAdHQ8M+
	DY2HJnMJgtMoZIMG+W52rn5IkwUqbLnoeXizEAg7GocqsmBDXm+wic7xCPdqnGiP
	NN0y6FL+dNH035g5Eur+8suPtHAyxRazcepdWkl8qWm6/IymsIPxq3VELMb3kDr2
	Ixajtz4xGSeSjgbuQhqI0S+lEHVclwpNjXG1xgg2eLvoE/iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpdfx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:07:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb007bc36so100162211cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889258; x=1778494058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UmldWu0FiqL/mzzoJDrah2WxwzYgTU4xVfslGD01Mw=;
        b=Yk6xVz683D5P85Ry4/xR0bjtiO4l80zW0Flqm55mH1F47micf7Laa5CcIv9hNIIOHO
         5gf5AY4+oCDFjcQ65VnfYMZZtiITWzZTuLoegijxsv4qAOz7Qg3KDr0vqre2n2VKKrJP
         kcqcr5fSuj8g8uMlMpd3JQ0WlXmxkQtVAElhr4+QZtG/1V1Mwqr2rNlqYc6C3wc2Stmc
         gCAqYeF/D44i2+cPjUfD+X9nMWEbXc/J6wlG45BUpllM69lYEPbXp8y9K2RVxOhsbtf9
         YrnKPU40GeN6P+8o4iRrZFlQJftsPvvOZyrcuisDc5Y/WCWkK/1RnKkyEfYTY4vQW2gN
         3atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889258; x=1778494058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UmldWu0FiqL/mzzoJDrah2WxwzYgTU4xVfslGD01Mw=;
        b=VyZ3iYZzZLofxleXDhJukJULPFVhlabF9uwdJ6K1NI/kZXTdkYn13LuSXC4eT7uad0
         cYk7q0CwkMsS4jooHqc9BCz9uexoPoPMhnNyaUiqw1RAVkSLegTrM0nbjXLcvVjl//at
         2vmIR7pkfTJDA/Src+15oMQ6xZ/4AGOzSXGvOR1QC8ejUqOPeD8qoL0g8wRRAz7qfkMY
         hGTjpMAt9pe47TPHNLPPkoDHt9nnmCuBFb0tfSlI/c4NRk4hNpmSfD2il4htTL8l/O1d
         1EHfD++tv1uRSFlRYgci02kQ+BpR7vC4x/YzAYMcBtjlceNjcS2JEsa5qljNL/2aQov5
         rHWQ==
X-Gm-Message-State: AOJu0Yz9Xw3zeVzpuOj9N49vUpAbKexz0aB/1NcIdHdTvC+eiqBsEzUL
	8NpGtbNzyteOBheBPyMaFOVWkVVAeJuxTZ1dhnmzZ1CjVJ26lR7D/KyESK8JR/kUouv1jMwdXPS
	ladNKJ61TdbkSF0M8gR6OFnNFILdae8nsP/LpV4Xe4X1MufVxdLTiqSQeNFh3I4CvAi3w4o8/hL
	SG
X-Gm-Gg: AeBDieuvV7AtmtC9qFD10Eww8VjzUM/qbg4c4OnGjhptIPqOFu75nmQf/6OdIZ8uJYz
	kW+pX03FS+ezyE3uyZUhEe4Nd0l6lT+ENoh0hzPIeeubOHCtYWi5zdZVu5n2veOMXHIgEHnRySK
	FTebWcVtQxJeZSwnyyoZuJ3N1SwxWOEoChEFIus2JNoFeDG93Gu54x8h0caRhdewQCC+SwmbkYj
	/w/ViBH04e46ZFetHeW3cqkSMpRw9vg/D7ad7WloO70JdNzxUIyA4b/t3W+MHpPBi/E3Ldvhbkg
	XMUj2PLjnpYxPH1fWdQ5Ip5qY7+4AQ9D/HJGXvS9vw6hDh5pN+FW4KDxAqIByWMO6tBt2xMdhTF
	PStodNITheWPMVtptSF/R/ysaouv0rdpFP0DOp8JdfTmedM5G4XhoMF/9mL8V2w==
X-Received: by 2002:ac8:58cc:0:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-5104bfec394mr136038311cf.43.1777889258189;
        Mon, 04 May 2026 03:07:38 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-5104bfec394mr136037901cf.43.1777889257768;
        Mon, 04 May 2026 03:07:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:56cb:50e1:b507:63d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm23400860f8f.31.2026.05.04.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:07:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] pinctrl: qcom: add support for the TLMM controller
 on Nord platforms
Date: Mon, 04 May 2026 12:07:24 +0200
Message-Id: <20260504-nord-tlmm-v4-0-ccaa731ee8b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANxv+GkC/3XMTQ7CIBCG4as0rKWZAlJ05T2Mi8qPJSlFoRJN0
 7tLu2JRN5O8ky/PjKIOVkd0rmYUdLLR+jEHO1RI9t340Niq3IgA4cCA4tEHhafBOXw/ilacOEg
 tOcr7Z9DGfjbresvd2zj58N3o1KzfPSU1GDATnBkGIFuAi4+xfr27QXrn6nzQiiVSAKQtAZKBT
 mmhwVAlgP4BaAmIEqAZMA03IBQIJuUOsCzLD7uORE8rAQAA
X-Change-ID: 20260403-nord-tlmm-b5878960cec6
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hva+7Cg1fc/998zfCEeQlMLQ4HwKhWH7TQGTfhprwB0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+G/gp9GuuiSkMj/n2UMJ00YT4MifB7kY1xScH
 t6SF4VZPGOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafhv4AAKCRAFnS7L/zaE
 wzfhD/9tiL37VxGV8H3lfIisluikeoBtugNjYT+Q9QI5gxlHBk9QXS4mBLayiHYaeeCckncpkIK
 G7Qtw4SSWPG3fpUBTYZ3bS97aanY4I/0pu/ylNluGX4Wr/bu1XRDY2GmmB7GIcz3hz5q5HvJ6en
 DuHzlHqEiNEeFNztVROIkaBJ0sPXAR1+E8GSvwrCZED/f2iKD6glp0/T5pFx2Ujs7A8LJa1Jcry
 ysa4/aTa6OdweGiZHUHmtITn5X7ZrrsMglaIUMp4X028NhC1y1X825leqXO6FVTUuA9hqB7y93c
 /BrOWCxyb2NBLqWvj5x17TvK7UU+K4kLzlGIriPFk5CPxipkELLl+QYEqqVZAF9GI6RPdV9tRjC
 APGRab7wGnHtH1hdYkICUBgPvgFnFQsEk7RbWOnF35E5XArbQvJ3AF57gIcqMFohkrI+n+8psHM
 3sobhedXKSvvcr1iHHy5n17X938T2ooegmZJiskxWNurFU2/KmzfwHfnkcyaIFkeugglAbQjbyn
 oQSFeMu1m6ZJhymTaZyPGQBrVQGR0OMWN35qua3elj5zlRgzN3EqwEKjobfuRvpJjayFRqXvFCu
 e+kcSE2R3qR307aD7uwZcaJJ2OuZLOTeBspYMbteeMWfUYc6PwSlAQq9aYaITBzk7rQM5zHVRQS
 o0HDMaAIONhRaYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f86fea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=zAXgdMWITY6MfEXZmzYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNyBTYWx0ZWRfX0LL6CmaKZtTF
 /6Lyo9A8hcA0yYCcUgauo9t/y02aUgfcVQd7naulAbwBSV9JtaO94Uwc0SEj8LjEwjB2pkbH/4t
 rRYDUp0OvfAhbkLrfpQQ9ycFVxSRJWXGLfEv48JBT0w6czV902R3GZPnltiA4DrKjPrXNRCdJgd
 owK3SdAP+uArlfilhKhFRN6L38liEy1QOsMDAQdcQAbqsZE6O8exVhqsDo29jVHnjJvPrwcg7yV
 /QFglohkcS5lCq3BvxamkrlWyrllCIqFt+C9BYSqeV5CN4D1v+pKwY7sdDVbzyjMXsbUd3Q5RvI
 x24H92p+XzI6Gwdo3shLOhztxBEEyluo2xh65P12bgwqemRjhFhNwfsOQUFZ1rkZtK/qeeP5shW
 UvPC4TlsP92l782bjhkc8zWdzPUhCXLjkkeCJ4Uo9kJcd1yOPc2kD9HJkoaQ1pbGqrWk00k/21b
 Wrdf5xPCTYnDQJsvFtg==
X-Proofpoint-GUID: 6N2irbhgKkW7arl0IJXa-L-pOKzi33Xh
X-Proofpoint-ORIG-GUID: 6N2irbhgKkW7arl0IJXa-L-pOKzi33Xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040107
X-Rspamd-Queue-Id: A8D804BB6D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105685-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This adds DT bindings describing the TLMM controller on Qualcomm Nord
platforms and implements the pinctrl driver.

More info on the platform here:
    https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Move MODULE_DEVICE_TABLE() to the bottom of the file for consistency
  with the rest of the Qualcomm drivers
- Make the module description uniform with other Qualcomm drivers
- Collected tags
- Link to v3: https://patch.msgid.link/20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com

Changes in v3:
- Unify even more fine-grained pin functions into larger groups
- Fix the UFS_RESET() implementation and use correct offset for the IO
  register
- Don't use uppercase hex numbers
- Make usage of the vendor name consistent with recent changes
- Make the driver default to ARCH_QCOM
- Link to v2: https://patch.msgid.link/20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com

Changes in v2:
- Order Kconfig entries alphabetically
- Fix the regex for the pin state pattern
- Fix maxItems for gpio-line-names
- Drop unneeded line break from bindings
- Rework the pin function naming to make resulting state entries in
  devicetree more concise (drop the line number suffix)
- drop .intr_target_reg from PINGROUP()
- fix values for interrupt entries in PINGROUP()
- drop unused SDC_QDSD_PINGROUP() and QUP_I3C()
- drop the arm64 defconfig updates from series
- rebased on top of v7.1-rc1
- Link to v1: https://patch.msgid.link/20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      dt-bindings: pinctrl: describe the Qualcomm nord-tlmm
      pinctrl: qcom: add the TLMM driver for the Nord platforms

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  141 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 1771 ++++++++++++++++++++
 4 files changed, 1921 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260403-nord-tlmm-b5878960cec6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


