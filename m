Return-Path: <linux-arm-msm+bounces-93615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDLzKQoanGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:12:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926C1739C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C96A3308CE47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D4934FF47;
	Mon, 23 Feb 2026 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCyqVScc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/8lBfrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B734EF19
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837588; cv=none; b=B6VwjLn/h5YklSdCYkDcpKQWHwo49a6ixpJvi2ApeSM3Ky0aZEdqxhmkxuNUN6J03xIo52FHg0WYYWKYS6cA7qpzizd/Jq7hng2WrNv/6G0sGIn+HCaO/iWjLpvyibfq3P9Y/NGttbkUoi5Cib+g7CUa4+8ytXWHo+R1yDCrtlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837588; c=relaxed/simple;
	bh=deCpsbgsyzGz52UYVrUFu+GK4rDUeaxHx5qfsuJiwbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1S+S4p3M5yBcrASWQDu9ha+OdMrRgusWm3FlzacsMhqZHd5vCpoUTJ0elnluUwLO/X5Ab/375pKlnTkLkfoO6o5f7TOVJBhaoaNUgNWTWQLRLoZmIOHZU4747s7LgaK5JNxnhuNOgwG1g3Ct7G7D89CZEcTM+xLhN080P4b+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCyqVScc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/8lBfrM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7evkh1745021
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=; b=lCyqVSccFm2MNmzq
	d/VWC0//Ou8hzdNf1sUs01NwCFgGtI6gp+comyP9bcJ9wz6wYtMv5SRADSyOfPbu
	cLPxr969xyh0DoSsTvzjlM3bEa0UhRAkhzvogOqv36RscKZxZ/8i+qLP2OioAIlf
	9oK5GMyIKP9vbCVc3H7Jttk/nm9/yn4S+uZ5pVDmSgDrzjOrPNYulSAC1RYUf2D+
	ga8pXgO3vsN2sNLe/0Ec1jRr95T2Hg/59NsYfamSMPQcqYe9X2uOMFmykvZ9NXbG
	vTgNjDnB1ZLS8Y5T/zI0+EFroavgpPfxpJlzPwJdJumiaTnCdGTyI0HqILFH6FGN
	1pAGSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv3gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b6b37d8so3776897285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837584; x=1772442384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=;
        b=D/8lBfrMi61WjmRqueRxhSDhXeFXytFgAR2s97PescPe1Q89AkQr4coWMNiWud1yeA
         r1apKFWv/r8zUvtE+X3XYQ1UTDIbqOdzw6IfasqyLTKBU8c3winEc/zd53e7UxCl3jha
         7G9WVdrGa5ineJP0iCI6eKDg0g+eiIQy/XNhWp+X82fel6Fs0C79VZ5/tfEq96NTjja8
         qhroSSPg/CnATRi21QG1Zq7HocjHnCon4aoHQLHO+pd1sdF+oYZ7GtWd7ZfzTwBYzGi9
         lJ3DPRpZYI4dyCcXhJQTQ5CAqIW10x79OAuRRjFswLN3UrlaMAJ3lnOu86hO3l4aDio1
         rO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837584; x=1772442384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4IEVe23JvosF/ljVHhtNPHgumeDGeBSyPmBAPyvh5HY=;
        b=ehpRmO44yIaDCHmBh2400WEkv0vqdV2p287uiHkcpFGuoRUtsxQ63qlTqM+bKpcjVM
         ad7O3OErKpAKkmQ3KrzFfa7P+1gINVHdzlAqfpOwgBq6KBLm+3U4EJPcOAbGVyvWdF+v
         26QRE43FER9pv7v1XZ0T0+amM6a+OvfLRpddW0y/ys+rZNUaaJLBBlzZ6gDVmC7piUxt
         pCRp24QEXR9RoW20RKBk6NVprTRGUIlVCM+NQwIb4XaW60AWniAWtRdJ+UalsVdtLXAG
         SG/buoPrPbM+xX06sHtSDQBdkruoBXvS4BaHb838XX3wF+Wj0+QGEEX9IA5sIaESa+IT
         2irg==
X-Forwarded-Encrypted: i=1; AJvYcCW48DkQcB/L2eQBdu1C8m9Pn41pKmR5m2uq8/LrErvB3htqG9owudMn20Hv0PZbQYxMVqanggc+1otOzE0n@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQFMKs/oQKm94PsR7peWawvkK/TbXorF3H7ZRtD8FrcGXEZl2
	WrSfZ6yn5pvg7G1/EgJ6hr8HTV7XnpdRE+gdJ8KEwHvipNGgFyIfCiG3/20LG6xtugvthyjz4KG
	nTvF3BfxemH5g2xFaB99rvRhM30Z8IRt5C6p+SS7Ry5ZEx6jyGtcXrk/jfBLPjlfyZnyz
X-Gm-Gg: AZuq6aLTzdzrAEFqkt/NSPiBRYxPXhZ4rAKGRD1lPZQ1aatsGKZQXiSoIxKT/7ICRyE
	zeRr0utuTCI3qrX4F13Cy9+6nr3H/WMcDgiXPu9zgpnmpMCm+HT6kC8LBSG0SSBh/lbpVr6b+DS
	RXSxEJMG+YS5gsMPR8VbFndq2wxU9C8YOSLbGXa5Wvh9R4B4PcizYjdClkuhzSaIiqnQiVpBGTr
	QOwm61gvgA9aH2T6gXEWaFfBTJeIAWm50hgduIQi46tFh7mgxxFJRt+MQkouvxXCCKRKp/StPvT
	RjHzcAaMW27wO8a+zUSV9JDO/rW43CnTgv8Utb+gTM2XPBKUXWeUfXSslX4y84Cg7nTl1e7/3+H
	S99gCVKLUS5Aa0CzA0MFR6YtRt09kM97DatcHnA5D5gnpghde57Jd
X-Received: by 2002:a05:620a:1904:b0:8c7:10dc:9055 with SMTP id af79cd13be357-8cb8ca0b5e4mr941450585a.23.1771837583974;
        Mon, 23 Feb 2026 01:06:23 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8c7:10dc:9055 with SMTP id af79cd13be357-8cb8ca0b5e4mr941446385a.23.1771837583455;
        Mon, 23 Feb 2026 01:06:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:52 +0100
Subject: [PATCH v2 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-6-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=deCpsbgsyzGz52UYVrUFu+GK4rDUeaxHx5qfsuJiwbw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh2nfK3wWYF2E/xl2FdbyYiySDaGr7DmWU7Y
 gVOwe1z2tCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdgAKCRAFnS7L/zaE
 wx/KEACU1EBIcNW47+QMfddH+tXvVKOd2tvwk6pL6qS63YjG7EoaUpXM31XW4EJi7MqCRLRCDlg
 gC81tNRb+Zid1pqEiPYtS/Kqvfp1ycij7mS5/LnnC17ugukqtbneKVtXQRVg9nny9MfzCxP5UUl
 xgHzIFWCwq98ELAqzaSg4rrdG8ofefA0PJEcuq5f2fPmsQyAHcF62k6bfZWOV1+vcJkgyU9GZxR
 NOjBebuqmXgJP5NisCzQ6Nu80KBwZT53MEQ0heWoc/EiSuxxgogMYrBCBsL/WFj49zhR4+4/EJV
 adnwNMA9579jlTWF3Szxb+vG5W/MKZTyeqxSA9BZ2NhPsBlNReYLHjJ429tUvSg2rnt6q+qFftT
 Xlmh42TrNDLpPpdXFvJ9KRX0enYLbt9JXs9AkIGQKiLYrAAwZrwodaptbHtC+XYX4uPiKwbKd+0
 2bIJgfeim7TcZL+Ruh1mfmXHgPwUG3AWFArAHg1sBe047KuWqd6PbBFFkQlH+K56BRq0lU8Ch2y
 7sJawmyu6+SbRyP8DE7EpDWu5EYph29HOzk9f/NoQSC3ARHNUayWALyELpMufM2EORXiNq5M3YL
 S6yzQDKetgiK3wkpUAxzJKwZBzmE7clZ7sXnbfXLcJXmNjOQlikQbZ0dWNcmnuq9OvqeVNqfqPQ
 boJzOV2Zd4srHmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX1QV+K/y+W9/c
 v2IlOke22mxv719aVPDMvCn3brZYDYcyYr5yiewF8HFi+H+rfMo8lG2QhUcvYK8vlhsHcLCoxBY
 RxKQF/spJ96yo9aRCdKDOx9V/nubFG+SJnPz+51OnO/Ia08NE/gGKJqVp3zbSEd6gyZ3eZF05A8
 zBbymvPXOUIF8HyUp17luzpyQfLV3neQjH9AcHXLV1z/Ow1OAw2Zvajeo8PSDaFsmbVnBoc4xlf
 wJRhF+OyyuO3iI8CbSOdbhnvGFkS9AjusFXn4+vMorHRv6fYRsj897cPiCBAnWODxQZKGHeeQbf
 hiGpl42TvcBTd1q8Uk/7rEMS5bM1INk/E4aKodtG1iKo5gqWHgN2zpuXw/reXCX6ssYgCTRE80I
 TRJNWC/MhRnidptQUUmQyt+5e8F/T5hRIXE4jbNuGbayYCShVKLqG+HGgqGN/Wi9VsVJzG2woMT
 fYLkZfgws+84ccPyTEw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1891 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Cv5rWQh4W07jABGdPz4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: F1y086ytolGuFXACFV72e8JwrHjiNAkG
X-Proofpoint-ORIG-GUID: F1y086ytolGuFXACFV72e8JwrHjiNAkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93615-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 2926C1739C0
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5ce8f8e4856fb2bb21c9cd731ddbbd8f3622ca26..af96892718fe04c5c428c82d3a47ad23aa08ee9c 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -171,7 +171,7 @@ struct rcar_i2c_priv {
 	u8 slave_flags;
 };
 
-#define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
+#define rcar_i2c_priv_to_dev(p)		((p)->adap.parent)
 #define rcar_i2c_is_recv(p)		((p)->msg->flags & I2C_M_RD)
 
 static void rcar_i2c_write(struct rcar_i2c_priv *priv, int reg, u32 val)
@@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	adap->algo = &rcar_i2c_algo;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->retries = 3;
-	adap->dev.parent = dev;
-	adap->dev.of_node = dev->of_node;
+	adap->parent = dev;
+	adap->of_node = dev->of_node;
 	adap->bus_recovery_info = &rcar_i2c_bri;
 	adap->quirks = &rcar_i2c_quirks;
 	i2c_set_adapdata(adap, priv);

-- 
2.47.3


