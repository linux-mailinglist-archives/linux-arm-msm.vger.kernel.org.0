Return-Path: <linux-arm-msm+bounces-93614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAKHLvQanGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:16:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2A173AF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EA8630479D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745FC34EEE8;
	Mon, 23 Feb 2026 09:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItOQAL6U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5vREGTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978CB34E770
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837586; cv=none; b=IrYVABxAI+qxtvbc1IvwW7GVBbTp7J7YSR/kXT39mA+KjN9TKAzRaUj/RpBkeO7co9bt+tvNroLboravVV2rO4S+NgWqYGeO7RQX7rZL4lEZqe+5IW9uVFvt3m7iQA8YBvSuqQ7iR/ZoIFpQvDcREvoXWmvMuWlfi9ATwTv2A1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837586; c=relaxed/simple;
	bh=TC55XBmh7XavSMEvFloOiPWsoDIu8+74KUdcPMB2Bs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BU/U9BW+3PyTBhf3Hz02HOW5oP5MhH8ufqRidAkEaAcs5hkAv0srw31UKkGauCMRA/2f7g2xU/eX9TK7qhNq+rQda9/BResaUB1pXu2XQNgU/2z36m8pk4qd9pktpD/uZ3ycpqHTC810j9Vslto1eW1IezgnZ38JlO7A+XOzb/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItOQAL6U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5vREGTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLrAfE2121043
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=; b=ItOQAL6Un+1g7sCL
	BNrPifQpEh670GxN5RSQnLf9WxHoyMpBIJo4hdA1EsRYnHs4zbpuOAy2vveAavVE
	wbx32eKhGXoYfYPKvijjonrTNyr8Vz5/vYlAy8sSG1VylpgelYVHl4ndaLxM+ndp
	b4NvKVCpz0QF1+to94yt9a1aah80tKP8VqMGZUNxJ9Fcp9oFPScqS1Ia0HFG1hZi
	x0aN9TfBBXEXDCeGUYKQLaL6R7sa7KdjDE7FeEBxlGgxYvosmDwbe/sYMlq7q0Ii
	0cTACN5B5ooA9spPbUXdoEMAQRLhQMG0mEYR3DA7Bc67X61Ft42/advBcJCo9Hhu
	2lmn4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum0gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3a129cd2so5513013185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837582; x=1772442382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=;
        b=h5vREGTO2i9/RXoKxdh/kvH3n9JqHHOO4dRc0j7oh3WoAqbbrKoutX8cY5G95d9ROg
         PXwekzJx1eimN3WinKwRItVnwp1uagaj3CrJswUogms2gpEmdtUbRoAoXq8m62tqzVFU
         YB9+zgJ7xDqoOltk9LkpA9ev89HvBjSxxUVYxEIL/Ge8o9z6pzGc0g5L9AykWV43Nffn
         HRLHKtr44uTM1xeSuQP7MBQmJIkEVl766pvHXzipCUMmrLZ+nCTqV25g+rEp1GAjhy2X
         Pi5zmBRdC3+aitTPQlItFCChOA05jzmwlHNkIDEEDU3OHxwTgvnaqImgp0cBSF5X5gTq
         ts1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837582; x=1772442382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=;
        b=es6wYhIBzKVY+y27cR8GyfYRsEzmyVMCMA+n5eYfoBsaPI5aNG66wNP7prxF/9kcOn
         uzPLUkkIJGdLbzHLiwpLQzsFg6Ejdo95cvWn7P2gRModI4pRVmtn9nqfTsX26K7ByFdT
         mIbjzfq9UauoczJ9oJfO+5Vn6T1pqbVGM/aYzcavzsrB6RhsfOZ0ed+0PaE43WAJywsj
         GIyWQvEesLwixoOqPm3kH7/TO6hRTduslb5dicTBpx0G4uttXoP7mgQrhy0f5qhyaNVz
         4vqjXUKuXFcfckoAvELTOGnReZ/r1sXc97wlx9k5L92bGTQ8kkwPTRGCwr40Nm/g22Lt
         2gqA==
X-Forwarded-Encrypted: i=1; AJvYcCWaf5T+ygjH0nrp0vGDkSdmvSt77sZB8TDrTDHQMt3WiQzn3ALyEpugmLdzKFCJMHbNZ0+AjP+nKy/jzhH5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ss9IHLcjjGYxT+hBTpOsVfsWW5Gnqg80LbfxmyddleJDufNr
	sJUBKmWbENIQvTAPqlqkMcDKjDrFMop1cZKmasimIkGL25v1G5WeC7HGHXhAoG+txj69clbmZa1
	fYNZ5bhinc5NBcp+jIZW75mh6XWyj9i10YPB32l3F032TQf4uCXBSOtWkOq3DBKFqPEStIXzXT4
	jv
X-Gm-Gg: AZuq6aJpuX1kcJgMUO9lWTI26T6D6YUw7PNmKJgiE8FjZUSgrb8wm5Rly/WQOn2AH5i
	4UHGh6mMVKFe0hztg+85HC0T9xzV3FYeeFKxQBW7hXXvE107oRUR8ArLiE5nTHllx7vvx9ZvxqI
	boS+wu/Pri8cpyvODpPftnzUy0KefP29tWgQVOcgNlXYKFupoAfV27u+AjD0kG7MFI3/UuKuOVR
	O/69PQksSfNn0kyp/TgUnTOsQdmgWyxOZ62nDPf4+emMKSfviDqUimJBT8m91/7F/zs4vO1gmeD
	EkI2q2vo5ttVc4FMHPCPWUW3wuR+1fcetij9jyDWXNGXeS+dWRvFEql2yw8FLSOyFkfz9Zppg7J
	wwWjRXjKe1EGo73V2TiaRT1knGxp7ARFXIi7RLyxKRp+DpPqfZq5U
X-Received: by 2002:a05:620a:198f:b0:8c6:a587:377f with SMTP id af79cd13be357-8cb7bffe749mr1695556585a.36.1771837581993;
        Mon, 23 Feb 2026 01:06:21 -0800 (PST)
X-Received: by 2002:a05:620a:198f:b0:8c6:a587:377f with SMTP id af79cd13be357-8cb7bffe749mr1695553785a.36.1771837581510;
        Mon, 23 Feb 2026 01:06:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:51 +0100
Subject: [PATCH v2 05/12] i2c: omap: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-5-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TC55XBmh7XavSMEvFloOiPWsoDIu8+74KUdcPMB2Bs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh1cgZ8t5g6Eu+YoXhXwpQTHi3u0PDANGTOZ
 Ae0vjnO/5yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdQAKCRAFnS7L/zaE
 wwgCD/9apGwYLbKP/+X8XV0CrL2TpbVD/yQ1v+mwXTXzC2F0pORGRN35JjluieguYXFndYxaKdR
 tFZGjy50KQb/wtE7KYKXDQ2vWD6HJKH7FLizL1sVHQ7zo2GDBMUrZfw46kio+YiG6Is+Y1LYS7x
 +WX0RKZmhXLvUyNifbPFoZi2cCSTnAlzLHtIb+UJKfzgib+aVNaVB/OH+/srM5mpP4oDifAlwgx
 Ikc9+u0lITu1cL1gkDyoDKnj2lI/aWKhrc7mKp8fiSL+tBfUMKVYrKGus5GOIlEgoVa+iUhARC0
 zjrJVesZJEPf6zXrnmLcNt9AVMPczA7pz70Q2tp65CsbqZnkc/30/gYsr8AENPhTQLteN5BMo02
 086YUnhbe7k0pExpN7GQxKZosadOo7IUnEmhL90snzNzrE1Et39/xYOE2UJq6ii4a/qtmW2uegk
 52VogvSFCULCBjU1Yjr0c6FvBcFABmtCKBqsa7dawmKHWBtVF3vFskxY2lu0/bROCQFZTv+7w/k
 IxINEGTeEsbhCnd7d/eAywrwe3khM9Pf1mA72OKQwXI0ez9mYSar2yrKKTrBe4GKH/5lFWB2+/2
 Y9/ssBYQd5bBfBM8TxNtTpP/pY6suqrCVQXH8nBZw5nsL2f3q2BHphXOV1+Aha8pNOS9Vw/1Uae
 suI+G4XhCD+wAIA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c188e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=50gAi1W1AAAA:8
 a=EUspDBNiAAAA:8 a=H-w5s1-Ky7DYDkcl1QcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=bIAsa0K8HJLRn3BBPJ--:22
X-Proofpoint-GUID: 0xJphZAGCgmMO1HttKo-KH3xC2C9dsem
X-Proofpoint-ORIG-GUID: 0xJphZAGCgmMO1HttKo-KH3xC2C9dsem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX2OVpzeQGl0+1
 HAWPBFNP6HW3cQCef9wJu2tdzzH81PZg9qhWwNcZRTOXQ/kEiDvGA6tspjwypOr9At9+V7RIRpW
 9RQVAktGGWmt0qVVj1Cu3Fu6sE/uaa5sanZe7mD7KD5L4DHDKC/Q12LpoyqLVNHLS0BEZ2lT8c3
 AEyR7hAxMU0NmGcnAxJIKu4x33GS1QAb2FiDlEw3gJ+T572n/tHZeeyhcKA2oPmFs7I9CsLtKSe
 6N5i/hxCb80egJah7QJIJJi2j0bwpyfc0XzKAfXi+D04XdfvHUpoVyqTs4i5QPr7GH1MWGnKjnG
 ynLriwWTr5ofuXLhoM1dZHQBx4mu5yCslksPJ8RlppmXPUXjn8LN4RwIFTwH78wahRVuGK9XOGO
 Mw/jKHV7vhtnl69DYro7/6NehS9jGKqhPDyLATFHhX4wN+TLQ70oa4f2bOmFAKbD2jFp2cGnm1x
 1IH5jhekt1a6zD9jRvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93614-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,kemnade.info:email];
	FREEMAIL_TO(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 28D2A173AF6
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384340dd31308bdf9ed0cb1a1a2ba8b..f95f31c521314e1d67f3d5b34bb44fcef557624f 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1496,8 +1496,8 @@ omap_i2c_probe(struct platform_device *pdev)
 	strscpy(adap->name, "OMAP I2C adapter", sizeof(adap->name));
 	adap->algo = &omap_i2c_algo;
 	adap->quirks = &omap_i2c_quirks;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->bus_recovery_info = &omap_i2c_bus_recovery_info;
 
 	/* i2c device drivers may be active on return from add_adapter() */

-- 
2.47.3


