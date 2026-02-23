Return-Path: <linux-arm-msm+bounces-93619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDLBDDsanGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:13:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CE173A02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8A72304276B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A0535295C;
	Mon, 23 Feb 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACBMi7vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ca39an6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413F5350A0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837597; cv=none; b=uBMFevZmh+KDR5ri2pzo2/zUN7LKvKyxe6Lhp3PhVL8pPltuyHz+UFtDR6WinlhJ+EEq+oeR/yaOLCH7NsdFsUveBZDORbILbMRhsQmfN/NAtv3t2Nu9kDiyvP6fluZ/11l3lq3D5b9PEUR+WuBjBYDYZG0G1zFq0TmuK5TPeqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837597; c=relaxed/simple;
	bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZnGyA4N8pTclZfFQZ1uQklFIbVNouB82lbFqYEhRztyPx7QqonAbTTCkVS1IXZAnZga6spnk0p7zPSpOLNdT5Azml/kZ/LE9nDyEB9D5LFIK3vngVLctMG6+1NeSxvwRYqWgvK2wWLPKcLDRtUpe9eYRq4x00QaTMjzr2PSzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACBMi7vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ca39an6S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLEchj2079023
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=ACBMi7vxntgULb5J
	Sm4Of+obwXTOgWEcFFHqcz7jBmTUkJDiJTEQFCDvLXA/xcEcfsWZIKkvpJx3ELvl
	M+erOMeO8dpd1F/M2lVedCmuT3cVHAdwG8QZZmS2AcVRcWyv6/4Yl/7kFgACiv3r
	M0KpB869Eqi5c0s0iM3GUF1eXjREy+S0P0H3Htf/nB3cUKlS+f9qvT/6jhR/OkHr
	fsgMbYD5aCnZ1yAy4IlZZDMAdcUhxMPZaHwE5V51cb8QV7WwcHHyMm+mNocI1oRC
	CCH86WbjuY3aVhL069J7Cb8lMrvMgNoGowS5OLxF1pedVxz9qHGw78HJEkTgYL9F
	EKUucw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v1v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so6382676285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837591; x=1772442391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=Ca39an6Szh7AEIDzqKIQCbm0KMSPDB4Ot9iQa6pdLAxbZ44yEU8z3QctsucWOKDFlP
         sFdcDMz1Y/VS+EiftERvKFyVsLVAhov3W2DAbNds6UZTDEPQgo6LWlXinWNU2YiRHy9Q
         jx9w/wgdy7qSXy2d5nMHh3dgxKAuenpX/4ehXlw3LG3zK+7wR5l6SgeR7HAxMedh4yB+
         j89W6t6+8zKIFL/3iFbWidilfYIwzmBHsThsSjfpFbL9huoC/P06T9hhNu27BzAq6mJM
         6P9MfsudNCub52zp0YrWe8FZO1lC+H3LTDEBSof4N7ystydZSQWkXaqLIV1AFDblZxCO
         CQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837591; x=1772442391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=XYGNGIKLzkcop5aaRYhRBP4OqIE8q7Qtyq3MZnut6tdqaNf8XXZdy9U8YzF7EzFS1c
         L+feEqwTXCjgZ/iz7R0WFbmMvVrGpjQjvOJspfknxSXycjTrnhFZWsMiygzVPH5PNFWg
         F8UQ9HEtohxM87k8OAQoY8yMvsbXWmJ8vSWLmPPvQXBoZZuBj0M+z7NfTwHjv8swsBgm
         35186hwjI/9XslirmtvISjH4Vcwl/zw9ooiibfeSKZXoLrk/kJI7cvt59RTw73kqwXXS
         r6RJ6NPWTzdhB1Eb+pdXyIpHDPkPV7zr4VeahhA68bUfFSLbuHnqoe1G/JAVkheW/EZN
         /Ecg==
X-Forwarded-Encrypted: i=1; AJvYcCX8E3WOK6fTnscUYqfg7o83CNA7Z3ebwtfJlBOydb5Dhsm7gMbR0VjI+viOqpLqUqQrtuP/wht1Xt1MFWwC@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHiC7Yo9rUIXDHgDK0VXrN2IW9UZQTgIfrDCfC+QrMPZqfojg
	sihx1KvT2FPy7Xey+NF5wNtyRey7bmg/PjCRUKHyUlTkzw3jjexOI/Y+xuUCPfnLm+Wdvz7P1Si
	f746cJB7nGKVjDUpL7a96S47Tfw+rDmhiwzy6WWZEfpB8t1c3gg0yCJ2RO+pXsFlWdRmD
X-Gm-Gg: AZuq6aJgPwfX/1untucwcCRZPd1YT/U0yADrxHsRTHaElfMIwp4wDF87MiHL+tg4wq0
	DDba6mcfgp6jPXc7gEvUT/BGlSgr5Ovk9kB9edyjc4/4PKbZgvq0flYIym5X0hUDoempi9tyJqq
	8yA2YfInNvTp76M5V5havElEAMzXlKJHI/jICmG67bolHbJrognopTrXyuKtnfK4UGmEEpEuSnD
	DHyAL3PJy5yHsf1vJA/P+z1LpM87rjsZ5+8Kqp6f+e4W+h7LGOtifvaM4yW39uqntLAkPCz1R4d
	RRedcF6wS/z9zcl0dwq/DSr/UbTyLrWEAnPxZWeMW1/b4EDL4sdIEm20+Al57b+h+zgHqnYMLu8
	SFy/lqzE3QqjeXZUfKYL/3XCa+nwme/ewSsdC8zexE5TfrKlYitkq
X-Received: by 2002:a05:620a:450e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb8ca6e6c6mr944319385a.46.1771837591258;
        Mon, 23 Feb 2026 01:06:31 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb8ca6e6c6mr944315985a.46.1771837590759;
        Mon, 23 Feb 2026 01:06:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:56 +0100
Subject: [PATCH v2 10/12] i2c: gpio: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-10-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh5L9W4QURdlXv0MMYDy3Wx+w14PFc5E2/TU
 a0C5IUrGYyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeQAKCRAFnS7L/zaE
 w1AvEACvwcgSdpL3LU2XuYTrJqc2aiozZlmvj3/1Ie0jMcJEH2AK45frU0bCSRvr2gqCa3Ii60X
 6WLZVGY6RlNRcdxRXLRSZBvSE0Eoce6hkv6Q5YC3L1/cw8bbzrNV5usBKi4oO3Zm99AILawCmwd
 zJ+97Zpcy7O2/PN26x+KI5d5VP1+tngkzEvNqH3Nla9aCUt9PpyjL1f0AVJJb6QVS+Lknv/Ci1W
 GHiSaZ6FFGvYN0mE6bz2csmla16RJ5R2WSSWG3wGVcWhwECiQgsRSByzTQO/NEgkl6ppgN7lCU4
 8vXuo0q0t/6Z5pjWzh+HsqehjDvdQzAhjip0VqM4lr7bjbhfjxeHbYytbLQbTwk8nQU9WeTFJza
 B0agd251nKKlp3X2vDs/zC3adAlD6rqXJG0Rekke0GvHOmXCHDoGI9G0FHspKYH1R6IQESj/atf
 RFAxptAGIlRdEyhIssjv5tEk8tNpkgV+aOdxx5Ww6XJXcURDTdiVmts5AfQFkdMd0GVo9xAeXih
 xNbmcFwpHrWa5hjOt896Lld2Iw2ooAPt60qFvm/35aEkwP/nPU/SgLJGtHB9Hevf1KvleecWkwg
 odc4uoBYOug8l9+6L6rue9mcvWyrA+2VwZWcYKw5+CK210buMCsqUZJkbIZDwejQ88avb1U84yT
 HJ5aTEt7TNzEmWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c1897 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HqJh3svR7y95n2m6mOc53A5QKzkYFkn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX0EGMfSQlZXJX
 5DMhhc6ssYOgV36maW8BY3IWCJzMHCRlq3zrYCVex1/oyHsSUbnye48pHEABdwRk9bMkBSOZjCL
 OOn4kwWC6AcZr0I0iG6E+0aklOvdHFhe13ZK9yHOXzf5NIl0bYvP4rNIA6nlwaxXLijN9+eT3WV
 w/cCT42DKA2MyLjpK6MHU5pSD9e70teVgxntA4SAHW3PDeGofHfa1Sl+VCy0uzJYx695rvmtc58
 wXNN/4UeFusvHhUDao7TkRM6CylsUJz6dK1kNSTH6fxHHw/5BP/CgzXrMwNvfhfNeUmdntD1z9T
 txrMybIg8FGoX+kwfR3SKNcbzOrlhKmY0LyeDYPdjI2jWoqOQbLxBRSl0J4Ghsv2n8OEjXzHljJ
 7eCxNFLuY6qkdwhf9GXqPwM8dOLJOWzvjzofWT8M2CM3tCFQE82YhMeu8p0G7bLowNYscsHw8A9
 rjuLugjbiMHHt/zebGQ==
X-Proofpoint-GUID: HqJh3svR7y95n2m6mOc53A5QKzkYFkn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-93619-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: A02CE173A02
X-Rspamd-Action: no action

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..78f8bc2525be6d1fd9a7907df4c253f33bbec9f0 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -425,7 +425,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	device_set_node(&adap->dev, fwnode);
 
 	adap->nr = pdev->id;

-- 
2.47.3


