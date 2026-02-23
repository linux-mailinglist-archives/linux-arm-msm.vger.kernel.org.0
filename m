Return-Path: <linux-arm-msm+bounces-93613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNjVIqUZnGmq/gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:11:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D787173924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 154FB306C7E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D29934E75C;
	Mon, 23 Feb 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTPVxryj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsUddBPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8576349B1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837583; cv=none; b=Wnj9fIuRAa5EX9ROjUdV31vKi/egamffl+u++bsPzEXOzIWxoFCuj3auplt+iQsgSFBA05YWqs3C7g7oCIldY0O5o+dwI90jngSrepCB2hChcDwAh+S4ZOwXcltSRRpl+RG1biumMQIv9jihfkTvbFfgD7whgGyWh5FbA8GxjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837583; c=relaxed/simple;
	bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jegOgH3QQE4jSZd7rz6iCRGVf357THfHiwtAWwK3lf/vUy6azMPm1BSYnNPtBSRokefJMlaHr2r5Z+fvqiC2+nwjpB8cNZCzB+IEMTmXlIlHenvZqvkR9iL/JWIbllKCbV86C5iG+4XPwZs5pJWmZ18aiumcRp0Vd1s2y7fntWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTPVxryj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsUddBPM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKHfhM3300426
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=YTPVxryj6fttLgGH
	RWiNJnaVeeo8IXYi2a3nlPBXYzOJFg0kJ4HXHffcmY6mZdjVYU2wXAdIsyyQT7tZ
	8WYSYv2AhIedEBKlTyxZkZx9AMvqxdYsCOm/bnt4EeQJAVzW04YL6yvEERQYgjje
	5sP1WZMCbioyRMX1UsmgWRwqmqh2/9alRdwP6EgHoLgWEN7mA8VGIA+Jrh6Ey8fd
	DT9P4qG6PX1QDnvA1EikNyIVJsC6mwmSukurC88Wvv70LsLT//e8TSKTXw3ft+B2
	ilwT1WABBYuJz9NErBcdW9CXPk0vvmJFxJ0UzbnW6o2nnczCoFvlYX2DhECHr4oj
	S7lMlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8m252-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a2eb984so1170982585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837580; x=1772442380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=LsUddBPM6mGisO7gE/oVDdUgo25LLxyKziWwMQw2zVVQRso+JNECJjnZHJn28mTtNK
         LzenD5NZ/Bl4CMo8F5shHxHD++myBYHyxmRMpvGo9yId8w21j+zr7YDJWeVG7dpwYPvA
         DmT9Rj2+a9/hVIzyaoYzYA7eTfUaU24uOZnUblvRzE2ke6BqsPK/xBtmmgE+2RBUhfzz
         uvmmZHL7b2uYNALP7SmwMO4LNYe1MO3XQVRElZpSzsHJdiPzIqJvioWltdjLDUuES6Ud
         kt1dDXSTeBh7D8pOXCwqv3wAJoyF3zXlh8KISN3f4jfvH3Wozz0C2+UwBRl/Jwfb+yIZ
         fYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837580; x=1772442380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=tXZ10t0uRi9Yr8aZdcbMsE1M641ZFE+6wg1mHlSKL7THBwXZDtSWd5n64qjYfE9ybd
         YdlXlo67WI+e+eX5lPH6nFYdkaYjZCrBB11V0gR6X2P3mXSR0wkZTnj/82O2OvsQfmKg
         XMvA4+Zzzw5sIk1i9mVoTLXkdjv2FiDulDBY86Vc1ixw+Frtay/b2TqXddSZT71pXr4Z
         u0HjQh7BEjb8ln+UBth0x4JFuXssPJk8N1KoX/BNUJc2PYNZ+FkYibAGgngKnzWedsxi
         oO2Ihu/vLWxXUpCCG2AvyWCHoA4phke5SEPLSZfcfXPeKnXxmZpGef0QWnWgp3uRy7mj
         gzXw==
X-Forwarded-Encrypted: i=1; AJvYcCX7TZdwV9l/V5niukCyNrSqivNxa/jwFn2MkhxpUARMxIoKMJZBN01FyOlaYUPS5BWoNNVOrx3qVGFyyR68@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ITkk9PamfF3sJOgONDjgK5lY2qFhVD3Vl9UHAog66Tdgf5OO
	QTXm+x3W/9ZQh+bUFF5336CpFFFw5/74kE63e4EozkkCFIfx+EADjJ67qtKdfq3IyWX96jpeC9F
	iq9Jo7TmYU3LpiABNo3DFLQojU7NlS/pqtSIH827a/4hNhcyE7ZIxRSkqCjniYMGR6lzc
X-Gm-Gg: AZuq6aJD/QsdLxp+i2CpnzB6gevEAwW+9NXIvxTXykK3+zU4GObVJxOIbn8TIf/QMrP
	r4CNBDCpprtk4dOgfxkq/ltJR7+o1V2rDeHfgU8+yD7jNPle1/vpY4mwE5gI6S22SgbzFA3pGG/
	65hzTOQPlZ+rU07uoDGw5m/qggx9inQkJQm8NDVqYMNL1yCWvY1ljUsTpzf8k9QbaahF7JDZ5QJ
	cQQExrI5GF0D7v4/DdtYf+g7emQe5cOLlrzFkbxrkutu/i6rbIwrChd/Io8EWvi1Us9AYuM4/Mx
	L+Qdb4FbKr/Lr/Ny2iJnOm3X+IagawWuMp+h98RkbGm+SdGPK3pjFyqzLfmQAhMXALw54V+4F4k
	Jd+MajNyzotTWpVdXellse1tdpnVLZuyaY5ldbPgFNlLyPdugBEQO
X-Received: by 2002:a05:620a:25ca:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cb8c9ce53amr927487885a.9.1771837580223;
        Mon, 23 Feb 2026 01:06:20 -0800 (PST)
X-Received: by 2002:a05:620a:25ca:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cb8c9ce53amr927486185a.9.1771837579749;
        Mon, 23 Feb 2026 01:06:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:50 +0100
Subject: [PATCH v2 04/12] i2c: keba: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-4-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhz+YdThvO4PybZoN12qLIFqH/25wCqSXQIl
 /V5UhW8hg6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcwAKCRAFnS7L/zaE
 w8dJD/0YvmWe+eKNQUwmdkOprYBJLDEghD/tlQF1HC9Xv+6macIkxtbWrcEVLcC1YJ243xE/5C+
 UIpmp60AWCZqWo+w8Sg8lYN5pAOQQcZm65CMDJpvWozdbA1EytRdrcBoInb8e5uTEavrrf29+Wf
 BVX9PajisY4sE5+0sNKu7exBqfC4HULGo41AauatIP0a+ri/I1Kd0apW/jZP8/2VNPB8v2TfyC+
 JKuYxaUJugMLl4OrdX0hqQz9FoJkmdkpvi+eFS6gitLpS4w4XgKAAt85A/zHy8yK4XW1+DfRusJ
 kAjfugD3rNjo9fL/VdbN5pIUwa0HuVuoAFa17emaUlWCoLXUjNs4FG8iimzHGSx07JZE6EKHYxr
 Sqo+fOHjBA/qRv5lJ93uO+uOpIOynNJj7UtaXzx6D1HtPbDeurHQZSQpbPDXbXjsRvfIln6LS0Q
 RmvC1uIZzDMq+Q60D2DATom3xFU5Eg3dtsF65sjpNoyjKr8LEO6s0KwDRniw76k3jrC9logTkXw
 UORxDy39plvEF6KofdTY5fmgKRZX7hIuQiEeDDI9bJ0TsF8t4Ht3KTcOIL3ZEl8otBABbO0qwRu
 aT9bzvxSM+EpZFt03OTbjKBxsEydh0rM2oV/4dJsfK1LN1m+UXvg7XcHdFmLZrABlXLvqlSi/9B
 2/ZzzTWFpvRviOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: rv2mjezd5Du2gUvsEU3Q6cIIUSF6ioCx
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c188c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=op3mqaDViYxnCTu1ZhYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rv2mjezd5Du2gUvsEU3Q6cIIUSF6ioCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX6dEDM2kGnZdu
 zrx0FZyEPYBABTQGXwT0axgbgYcoL4kJNuNzrs+X9kF9UfbiVKAET2sKqMq1c80xwHYHgYQkFx0
 VAOpjX3ErJwBm4Axj+4DjCFi4svcTK/jc7yfDCCQIq+h/20+/c574KvCowEt/c8joXMVOZ1Pae4
 Jo1UhkdJErih8h2QTf+1+/CfTIBQoGEojNIgwzPwuKqbQbF23/nyn8UPXnaJP0UtXP4KBvkcN+Y
 A/ERxoTmavKaRZHwzQ7mkjqxfni4RbXex5ngaDtxbvVwrIKAIBP/Eyo42IESLIxgkcI2Am0NJZc
 9DwxANjncoDN4XireSZ9Ird1K+JcyksmAB7Q52bUIp8Y7Y/YGeOS33sdbWfJe555jSY6bCBRRoH
 VxvcGhgP2zR6QA7dZIfVOIrL1YbC3KUd7fqtxMBrDRy/rwXft/uQf9jfQlnoppEfsJdEI1hL0Ur
 8bOuPUmuf18fW02CVwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081
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
	TAGGED_FROM(0.00)[bounces-93613-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 4D787173924
X-Rspamd-Action: no action

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-keba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
index 9420c8b342b573da435eeef5a05efde35d61434d..01aa5dd9638dac38dd92500cc8890feb8020754c 100644
--- a/drivers/i2c/busses/i2c-keba.c
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -532,7 +532,7 @@ static int ki2c_probe(struct auxiliary_device *auxdev,
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
 	adap->algo = &ki2c_algo;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 
 	i2c_set_adapdata(adap, ki2c);
 

-- 
2.47.3


