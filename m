Return-Path: <linux-arm-msm+bounces-93620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EMyMksanGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:13:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2A7173A21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FD213110CAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16BF350A0F;
	Mon, 23 Feb 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OF24CyJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx3xBQtC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223923563F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837598; cv=none; b=uTs0KLXgT1NgzVwj0c+ueQwekvVueN/z+QYbBkeeDU5wtxAFjHQOalEqpnB8V+BW2pElgpivtcr282dmMkQ/SFx9QFJ9OBV8rHmH51iwXO+NgH0IqfrzWdS/pyD5IsSDq0ftit9Hyp6JoAbYGGkwAjI19k4OToVT8ak749OoZnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837598; c=relaxed/simple;
	bh=GNCZSO1tofFVimQlfEXcivvHDvpWa5BaBkjqLZZcroE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uvSg/HrirU8jU537IkFj3DsV7SZ6UmNEOfl6Y/jgg7Kh/Cy5OJFR/7tg9xoGkkEqcVldcaRwxXxb6aeFzgqOdnSQD5mjIYp4NQkiAPs7zW2qhstA86DN0JDCspYxhBJaNZpyKfLgSyhb0bjLNOPJ/qM6Uu9y0xquM2Y5OMK4iXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OF24CyJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3xBQtC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJiM7I2926616
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=; b=OF24CyJJeT8R58iH
	w8BMKHU7AVuj7IBfWA7+aF1MLDSW1w93K637as1xCBWheutodXGU2WvKF5f3Uf+Q
	J0X2Wtdj/ne6oU5oWhseU6ympGKihcmkjbUPlPBZniAIxSX5qHINcnoIAu5gqDcR
	+VFtM+iWAHeQzI8KjnMsLQUDkHIAqbiEtERrX+NbkHlFg/d53LLloCT7zMfjsmAZ
	DAxnspg460MiCk0GUxIzjL1XptcPRal+l3M7Xb8cHOIHu8bdSM+L1rTwDg8ynmxg
	R23GCEjSa69xofpCD4b7SlwlG9t03+EKAGSbzeUpCyV+cizLsBH5M1sOqhF3Q5qf
	heqZsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk415m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so3439505085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837593; x=1772442393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=;
        b=hx3xBQtCEngVyzOj8u8NnFEeYcKcZuEF8FwF0Uk6+b0nOAI0f8d15O02aUrDYf+S7f
         zoScNRjkhgJDfi2H7uqEeZUHcQilJi3CmYZh6Hc5cFLwEG2NbARheY1mLJA4G9tYDPBH
         3YYGnTsswJFIRqomM/OkLty7SDpVjAl4UHhjiND+KPZGMfNhPZNU+g2ll4ZRVlQW9XuB
         Q/AzJ489wKh8jRCcdcqliq4O5zUF9jFFQlF1PmTWKAzGzBmR6FlpNrGkzY9Aq9pr7tuh
         qvW011i2t8saIFChLs1OxBmiEqE7btdUcZ/SYcXNDmjHiAImOPtHYEeFy7AcjBFUM529
         Rw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837593; x=1772442393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=;
        b=CuTcBSrHtsyjTJH844BWXrMna2QW8bsiTMNEifPIgLeOdNhlzv+lKGuNVyB5oEpqb0
         HimK3hUrN4oysAQaJu7qI46V2rHA1yi4iKS3/4vYCgBJZhlBPz4wHgTyXHyxTiQH8hQt
         Sfguuw9hMh641eoO2dHzY/uZJkeE/7068N8ugDP6fG2Ln3NKoMOcRrP4JTQ9rnC1TIxO
         E6Olfx5u2nA2ElNNpfSJ5SjFJxXlI5dgVQpViQC9o55O4YWS/rhsLZgQ4gxYtWBhFlyr
         odBtpi3hPK22rrQDlFrS+bNjwOYPjEbmeItWG79DzplcER5QO/TI589K52gglZ5xH84L
         mT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX88LEdY1ZA7MjUi6VwHkpDAiv1mmPT63wml7iv8dsBONGnGaG/NZjO435TddHQc9E5/hkXGtbQUwMvoHq8@vger.kernel.org
X-Gm-Message-State: AOJu0YwPAj2PncRooBnpvCJdVqRTy4zgAaokXu3j1OiIZcMSONvgHtms
	bXWAVsDIP1XhRDmuBj2eLcdu8a89hQLSZ0lSerGqWr6vw9xbNfRcG29T2n6+m2N4X5XffxTMktT
	t4aJiUHo/2XCEsIj4MSIcXStY64uOiP1a9jM4tmZM8znqJnjgmlVsjOA8SOSAmyRr9kvW
X-Gm-Gg: AZuq6aKKySZTlf2GfucGRCTMdeaWXCOGvO84J0nAfN5Xxk29mCe8nMyOM3qA0xeX6SK
	XIN+kHdiVmZhab6Xioi9clp+YHMCqk8+kb9nGJW1zU3qmjYcH7tytOTGqv65FPpcmrUQAMQbpBG
	rY1W15+24DQ6DPDvl0bL3r/hrmqIMK0jZVKlrD/iSGTkFOy1HFyQw7xVIp5lRxBqnKgxgZDniuy
	0ClC0SF0D64KOZSZWvPzXRlztbyxW8I77EAtzIa/nCUR3/sIJ3/Dbj6ZR2yAadQ98tad4XJK6US
	rsf58aUSBSIejIOI2j0vJY+yJkhHmadtlXjq4AY61tNx+syl6eYUr4bz3Anq05h6WEaLu+SUlw/
	ub7kPCDd88HrFYow5duBeXFUc/tkx6Y3Iaq0h5MLZh/PFvEyvwThG
X-Received: by 2002:a05:620a:468c:b0:8cb:55d3:2a4 with SMTP id af79cd13be357-8cb8ca08308mr922169785a.35.1771837593221;
        Mon, 23 Feb 2026 01:06:33 -0800 (PST)
X-Received: by 2002:a05:620a:468c:b0:8cb:55d3:2a4 with SMTP id af79cd13be357-8cb8ca08308mr922166085a.35.1771837592722;
        Mon, 23 Feb 2026 01:06:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:57 +0100
Subject: [PATCH v2 11/12] i2c: nomadik: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-11-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GNCZSO1tofFVimQlfEXcivvHDvpWa5BaBkjqLZZcroE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh66xd7+MQZXKYUp1lof2Wde5NsKOrQrt95U
 eR8Ce2ipBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYegAKCRAFnS7L/zaE
 w04VEACsdT4VCfUT8Out0yUzqZzfml7dMxtbxcoCnGY8tQLapaBzscsfnI+5Bu5NVsBjRWz2YfK
 GKz1PyQVjNRu6C8ehswM/RGsSkjYRUxZSTdjV631sUHy16gbpFobawG+M6magVodquPAsrG2efp
 fw078QxbHLsGtHgQUf3QlBUOhMk22ArZLQ7UVI4eWPuitiP6f64SssRo7tqJ//BaGhTLtlxLgt1
 jvZJM6D+hpoylJBTdwdFh3LNOWlNngiDMmXlJ+TYP7vEyQAHqGifdZcZ2gOjEZvuuGtO/lEw4zo
 SozwKRkeYXSwgcaSyFO1dD01Yswbq2jYdHSqqQ/U6ptyeOxHXTthssXS7L2LPdlo+WWnkUba/Bf
 4oG7Kg6fqOGDNbJAGQFzXbP88fe9GJvo21ZhNEA96KsQPTOoYosm2cONZstWSuGzQHRYlbRNoD0
 o41lI5eyWu16TVPGP0JRYBMjXMYTYSlhuH3hkyYXocF/XU6tyGdnIhI9kAYh5ZTFmS7uDBVKtYs
 9Tyx0EIpX5yv7J38BgWtyTxoLDGrIrU5OAym2Uw4iiru7lO0Rf+h4+zA/T/ASHlw7uHwH0ZBqTF
 evk49M+ClOODknfwmlUK6g5DkzMRRmmnMtP8HudXzwpA2Gyo6WgvZHRgm23knlsypDaTyhOz3PZ
 EC6ZWixHAae92HQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c189a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXwZtJt+O6JCD8
 i8cFQaBF3uJDPwU2sN55N5cGw83byxluA7DlQ49rdVaUv642H0POVIasEuEHEC4F3F6LvTFoQCB
 KnlXtAj7t66lG61rev8HNMO6QYcDpG9XBxn2U94z7EBEaTt39FCnTc4NKNzCRXuIhwBXc/VIiib
 xrEiU4rEQltRIHeHr2DRBjSpKmj9+5RIpHr7E473pQDbgQ4fxEKUBKo/uqkzyMFESiIFSxnFeNw
 FkO11+6OmzXi+VM6ZsQJzBVFsn0wNqi1uJSVC5xBn+9zYU5IZ1M99jY/7N9gIG6lULxcOlZn18A
 Qg1Up2yTXxlrQGEWEi+i5qZZNITJUsxrxPXEFpPQabOzri1a/U2RBOSQO6iwuSMlEbzm9az4FvK
 8zniyNnQON+eICz7kL/C+Qd2zIp9ALHyqTfLwrZ9cksLsDkLLq1k0eS7Ulydvo9ycZv/rKZHcog
 eOgiVtLK2DVZPFDjXcw==
X-Proofpoint-ORIG-GUID: t9YmNb00iMi5lWtrLmDg5pIwYOM4VO8u
X-Proofpoint-GUID: t9YmNb00iMi5lWtrLmDg5pIwYOM4VO8u
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
	TAGGED_FROM(0.00)[bounces-93620-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 8A2A7173A21
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Acked-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b63ee51c1652080e414f4302bee16905914c1288..12b4f8750886d7f6f5b6027b00691240952a3694 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1148,8 +1148,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3


