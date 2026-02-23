Return-Path: <linux-arm-msm+bounces-93616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI6FNOcZnGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:12:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52522173985
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70E44307BB67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935113502BA;
	Mon, 23 Feb 2026 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VohCfQdI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ix/ySmlD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368534F275
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837590; cv=none; b=MbQVka8tyauRgDMHb68RLv5q3dBrc5njlev8Ez2K/efWT73UAeFw9PNb7nwS3aeIV+V3UggYJfHkCOsyOIIN6kD9AFCLjnVcT06ytp9KCjyWgB917GUm6EGmYmFp65jiJTfg37iqQ/ksld+6ZG41UWjfIySrCLyyVKDXiSCMOjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837590; c=relaxed/simple;
	bh=rx2dtWdEbZEet4K2jCNLxIpDHbio19pJqqBXzjxrlr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwOzEiT9HvWwi7WAVWU+CJrVT5P4irswusfHcYNOg3Tng9NWkGrMxatpLwGyE5jh6rIYcMqcALcY2OcuyYD55/rjpKbZvrvqPlaEP+k+v+OidYhl5QCBfDCyPUu/7X/iDI8UNj+krHG7H4V2A05cSWjiztk1cMYhsV5WPyaDMnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VohCfQdI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ix/ySmlD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMMtvV3234263
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=; b=VohCfQdIzABLDJmb
	Fw038ZU0I0zohd5ZrlgbtoUHT0ieW1PFZXc8rioSQuz7MeTDwfTB8XscACuRc/Jd
	nUaOZ1g6xn1krs6hx3IM0wp/eoG9ZHT6JBAMYLidRoP8ogNZ4Ur4cdUvm3vABeex
	pTlCGPUjnNdVbxz/D0uiBmYgDN5vRVENYXBOsPjyUdHCLW9bNPLCywWZlhPxogmV
	Sc/qCB7kBRTt187PfITDacTUfcuzXjy/1e9A36D3lhB2joKKWdOkQhCUEWwlxQpg
	+31mliVns/XJIeAz4EjcCJYUyxRRVKgBNEJ+GOwRRkVWxgzmgJEJuZ0nCqcO78Rs
	jtFvEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk414q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4817f3c8so3650778885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837586; x=1772442386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=;
        b=Ix/ySmlDqmkfh7DkiNWWJXqoLEgprGZBCux1nrF3L1Z22u8v5lSULD2EN//vavinmC
         K3OKjg40n0FNjzBT6y86d2osDvBBe3/Pyj9xwX6KoIeNmhYXnSBCggnItXS4t7utT56w
         duB3Cu9kXb/XKyTUp2qrL6mlHE717TROCdxW/Wq07T36m6fIP5h+0q0T48LEadEuUgaj
         Z6r+Zg6Rjpjobdff1RaAAsDcqWwitNtJfgtDRuWjpCVr4wufZAvyQHkBy4jQBp/tMRaf
         mrtfHydNKKw78qXNboXGMYp53BCRgGC3GggKcYqTA4rFNfP6pCtXZtcZD4tPAKWNQvml
         6QtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837586; x=1772442386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=;
        b=uR88tAK+QQQZXG4kF15ozXKGGsOkAclnEyEESOy8qzEI+sPt47b4VuUXS/Nrx7/MEC
         qFtWNxzC1Fqbe/yzifHGhb5jzlCzg+6R48laOWYoPfLOVQR25xltz+ZRdK+NmudqdbVs
         g3XeN8BnIUunReF7I/YzI0WuBzQcfp0MYt5U+uQWa3cAJWo2VZ7TeDk9DK+hCgCCdYCW
         iZrYmlDlUlWOLRnPSVF9m/fG0NHU61CIYwc8gJfezjF5knt6vc3FnE68+cYChT2RNrJ/
         pHpDn5SzO7Mqt8juYO0maJAWJKETwNub7vft2M2A4OkJo4GT3Qp55Us3OhzgctabvHmM
         29zw==
X-Forwarded-Encrypted: i=1; AJvYcCXWHRZq/xsj7Gi37KS6OtLg7rU60kjoDFx0DB29EOjt2Pb/hAa1kY9zjnb0m+wg70ZMqcBPWRUeCCxKnH+s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0cneujLkeEhjiol1eREhtWmIKt2dQc0sPjss1QCV8fv6JcIHW
	Q5hfXDCe7tXYmOtDyuP6pNVS/HQFDB+Koac41ZWS5zAu4IYw1EVzM0P+2vpVoRnn6K+Z/8QOb4i
	355H2K7/Q9RPotG6Th6KZo+JvJdCrXB4MsWOUvZimfzP9Ej3lzAotsha6MNZkzwNsnHff
X-Gm-Gg: AZuq6aK8GAQOtaAycDSkKtgfX1GMOr+CQfoGv/J/7Me5CgR83oNGGQCRwk+DUaE8HE8
	IHG8SMIxkrErx+oA+LTqfbsHVUaYvCThm0hv9xSlJGBugRM2mkrStC/YSaX+3cg5B1f8vSRUdNw
	YTcSSQP/U/Jd5maXS915w9H04L4/7XlEGNZ3URplJYIRQqEOeMVgrxqDM6T+ia3L4m1wpUGQpXL
	n92F9OyM0W2YWLS6SH1A+BlNWt4RtuXLU8DclUpcOa1ivSUQ1eTWzHZ4SXHusU/5FIsX46TIb0i
	RCgXWHl0EwkHTGHPgPhGxp4HKWc5lgIsvXcxJAXB0pPX1Nr7g2X3wWEs/YCuy0BiZHsxELwZyv/
	0hFAzOFoih0fzWB5LxHIlmf8zftxBtzOnKcKWUkTrV1VIn6Ol/UgG
X-Received: by 2002:a05:620a:25c6:b0:8c9:f996:81f7 with SMTP id af79cd13be357-8cb8ca92ba2mr819917885a.81.1771837585709;
        Mon, 23 Feb 2026 01:06:25 -0800 (PST)
X-Received: by 2002:a05:620a:25c6:b0:8c9:f996:81f7 with SMTP id af79cd13be357-8cb8ca92ba2mr819914785a.81.1771837585240;
        Mon, 23 Feb 2026 01:06:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:53 +0100
Subject: [PATCH v2 07/12] i2c: st: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-7-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rx2dtWdEbZEet4K2jCNLxIpDHbio19pJqqBXzjxrlr8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh352YX7S+FxODzw031A6NZFNXTTScBQL802
 bH0eQGAhDqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdwAKCRAFnS7L/zaE
 wwkxD/93SJI2I03XT8QYkmz2qqEK1l9t+/u3zcfCHXOkN4VxZpbr3NNH79eKM4Izeho/f9oZSlt
 hpXtbZ1986gfzwMjem3xOh4LrMM5uwhAkYvTyq4h94Z1kR0U4CdqMyz2dFTrYQofwtaEaq0QYtW
 2UsClAH3A6oAmGMw84nzOkOWezWyuWVxKZu6RV7ZQsu2HqHBrksHdxpzAj07PC1rIUIKlIzWeMd
 Gu4R+nGnEsYBsqvU9UahVeDs/ElVSq+sMVG04A+OpeDoih7meDq8ZksVqmkY8aS6MbPgErpJ14r
 rfdmmPGJ3mPF/Mh4pi+uFB3sHnbzbQFg/O8iIZLC0uwQt+5BH8WIDZ0NT3m8EVRfT1Rbmn/Dpk/
 O9Jr2qQugx4m+eo3nFBu/ofAUZ6ode1AkJY10UDo9PneFzFVwYZYyIXmGK/AjWCe73SSYxRjqHp
 7iJNoHcpQ4MRGF0MpGRK5bRPzXF1YQOJtZfABHxUlTVVeBrYthBuFfzXcSV9riTNnNnMATVbp6Z
 IUghQTpX+9+gwWg7mnnANmCyfmulcIHi28C4mPCjS8U4rx45Sl3FDmuowjI+94bcn+XCPmgKlhx
 SFf6HkYKbnTMk7XUh1wNeWm1TMpJhvYhbhvaZ5Lkq3PUnPnLuKmuGtFdtewCOPT+JqzC8AkG8SB
 Wm+qW7Ou23eA11w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c1892 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8b9GpE9nAAAA:8
 a=EUspDBNiAAAA:8 a=5jvZOilLG3lo3iFWl1UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX4by7d4dSN/U0
 2g1Tao/hodKSTzN6KPHjYOjMssI65ZdEMrut5x0snBNCgPQ3/M5hR+uGNwe2qwTflvLgT1rzWP4
 KeEQkTnWsWI4rVVJu1nh5ytXiGlGrqalIHEOxuyAq8YGrPePcaGHKBTB5vCBvNRriq7qMLP92n3
 y8X7ynJm4JOSkQlreEv1XBqm2sJvu+MFlXUKNJEyctzl2IUSh0/pBB6fQ7fPLBsvtwJyXhXZc94
 4A7nGBTtIJ55ypPAyjew3bDbjHBzKKxlgYphrthDnQtkC09Nf5lHO0c1cF3OhEbTBxDzdhzuNro
 8vbhUyoHWIsWkcCxfhjMaUpYgVtKW1+DMo4f2bsrzQrQMtyPtnlWd+3+artlYrCQ8LQRKy9V1Mt
 QBTyIg4XIO6HvS5eM9HDV8EHI/jsOpOXuoCHMG4Yk8P/S+LPNoz/6kZR8XntgrABqBG87R+P+7Y
 qlCSf45zO0/yE2zjUnQ==
X-Proofpoint-ORIG-GUID: LbbVL1BWpZNMKzFbQyM9Y4JV5Ad0yisH
X-Proofpoint-GUID: LbbVL1BWpZNMKzFbQyM9Y4JV5Ad0yisH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
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
	TAGGED_FROM(0.00)[bounces-93616-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52522173985
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 751ea421caaf388bc2337026e0860707823546d7..88ee5dfb55e469b64537694224a0fe39008a80c2 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -850,8 +850,8 @@ static int st_i2c_probe(struct platform_device *pdev)
 	adap->retries = 0;
 	adap->algo = &st_i2c_algo;
 	adap->bus_recovery_info = &st_i2c_recovery_info;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	init_completion(&i2c_dev->complete);
 

-- 
2.47.3


