Return-Path: <linux-arm-msm+bounces-97936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJqNDUXyt2mfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:06:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF7D299221
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12708301490D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95F439526B;
	Mon, 16 Mar 2026 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4wv/95r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKLztWqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98B3394789
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662744; cv=none; b=cOxxDdCqtucEVhEW51HeZWXjNiTM53WxK/x+F/99XIa/5usIf7ySbTu6O/DD6DWEzo38khcEja3dzvC84YiG27g+sgKHI1dAmvO8UyhVaDd6oVACIjky6JnePQ0h8EVNJQRi/MNxoUKqFAXQsrZvrhLAfpSj/PHxG/54VQDFD9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662744; c=relaxed/simple;
	bh=fytWPLtdtjzkuEYgxEMp+BkUR1djTquvDROUJYOj9Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4zL4ccZRObfwEF2+DQt/8D+o/shiK4LZtD4swTxHjRi2qAhYrvlwzV+HNTRw/LhEDiMcQsC/F86FGwl1s04+nWMhb233OTwp4YA7izsTDZNZQdDSCnVlbPaTqHembscer05q+3jJjlbQ+SM0xJgc6CwAfC/04tl2bUeNZQ3xrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4wv/95r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKLztWqs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBYHoo538903
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=; b=H4wv/95rrUsxz06z
	XjZDabTjstrwrld8qqGBx7o9FhrFh9lLj64r9yIhp7SulFg0ah0OVK2lNdJo5BJb
	3VNvJyiwQrdfrrcduR3enqHHG5yyMJJ8UiBZQc/k+NoPVFQqkRlazRQgWfG4bhkI
	OrremG8TeJvjQdPx0MSGJerW1cljot/cuo8C9jKfG4IKtkHPNv+yLIgjvKlKD3+x
	K1ekrm1WWPsob2i8QxZn2cv4dbLG1kb/dn0PNgwqgymSuwp70bJimSH81kuMNCqd
	x3liWepGHSUprMSU4EFkhdow/DIh1HN2h8miO/oB9c+pztNVBKDEvrhRkTGv7rxH
	x3leDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5nkq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:05:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509159f57e0so390729021cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662741; x=1774267541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=;
        b=MKLztWqsReXalf5a3hOS6cfAWUrNJjUuja+4j43R3jSAWyk9/NvpV2FhyxFa0m5Yny
         HvN+7DsaTDXn/pXH/O19ui9bqjIsCBylkbwSaBirxvt7cMhS0aV5Fqes8f7izFcfEDNF
         EF+KrHHOTQOSplRE7UBNweT2uyPSCXd0QXtRoP1/pzdSEWmw9+HJNnIvkWNI72INotjU
         FDZzsvR6zyn+BTvlrzoVEamRUdHYyrUL8+q1dIU6/YovsV7Fr9j+oK+MH0dZX0+K3C1b
         mZnZJQe1uCmX8Ml19CTHshMRr6SNtl15hoHwY+TdgXlcYJbt4WOEgq9uHP5M+Oc9pmiu
         5RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662741; x=1774267541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=;
        b=aCGYxm51iHsmjxUbr1x5kOFog2bgxiUVJ7UWA5JRiW3F5dyKDAnw/UWBM8s/qBvY13
         dfvcFpp4NAtPd3UUk0ZebqcBpdophxMuKDSZbCSUasvc1G9lfHajPBYU750HQEeRS9p6
         HxosIlvkOGxHU1rm5LEbc2wMASuJglehO/7uCaZdXVXRrE+56wsEwot85LlQJuUNAqLy
         sbH8tstNKwjnSBk7EgYJ/cKek17ZKQ4yttBkpRQDZGZAf5qyG4uAV9ZfvyjoYDYNmcb5
         jCSjET3Xqk9F7ue7BWopuSlddGYP/mgXEurNwlO+U83EL2Ceiv1gV2mlQye8smJFhHu1
         4kXQ==
X-Gm-Message-State: AOJu0YyAb3Ihrsmy/IhehekaYlZF1D8sKYUCtL7cqIB3Qi4nPK3QfaH4
	svsFwiZGAtW2Cz5VRUTj6xTbv+23hZKzs2B9kGjsx+hI7HkXA2uQtIbAzAiIn812MI+A6hlAP1P
	my2JK9mLw0YK49agw7Kb6xIdalJsahmGcRtm5BYFy3FRYODB+hxV5b5T6cOPq/I0NQVIe
X-Gm-Gg: ATEYQzxgyHgFR/lc2Z3O5MP3gZtAFt0fuGvv+AaKdFZR2dd5A/OwRON0nBQTNZTQS+S
	DL89rqTTFlZxAXNLY0ktz7tMuN5zFskS2Wro9uuGcKqduY6hPH5jZQiynS5O9Rmc4wyzOMHihNm
	vs5yXJrV8iuVvvahW2MtzcjJvukHpvVkClK+yO0MH5GEeAD72HTvQXluQKPYYrNR1dRcBxXJkug
	DQlkUwNyuwoYFlI8k2tAK+n2WOlFuc6rLADUpvQZvr/vLQMNT04pHfxR4tcIgRXnGodWGM5NV/P
	y9msBs3yjtvdc/nQrJrmXW4YfjXCjQ80yOY/Es9oJbv5PjhXk44nlqWM2FPZn34+wQzdPuhau80
	56pk4Ej8MjUoozJL3L2mAkJvOSTcavPjU92EojoLm6W6cOsNLyw4=
X-Received: by 2002:a05:622a:2d3:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50957e4fc81mr163339041cf.51.1773662740830;
        Mon, 16 Mar 2026 05:05:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2d3:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50957e4fc81mr163338181cf.51.1773662740311;
        Mon, 16 Mar 2026 05:05:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:07 +0100
Subject: [PATCH net-next v9 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-qcom-sa8255p-emac-v9-2-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Z1ERLj9DtpkY3L9fjZNwikcGQ6rrwgdETD/VN6J+aQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IFzbQYI6vHh10CWsGJxMAjU0/ZVzCDhmnBV
 hivu5A91MCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBQAKCRAFnS7L/zaE
 w+vkD/9pL4X60sTfNeueDAukikraft0MIkL45kt3+a5pxve09qNywhg0oeLh4dAFFxzl/3y3ygo
 OV5VLkaq4s+pu2o3D5FlAa5wo7IoNsIeq4G3e/Y+q6EtUxNr2S9cW4q07a6CIHrtsGfZ49CwCHb
 nWRa3QH26koOR6cJF79Pv03TAaFkwJ2WErO6PewlTlOms5WE0JribiYsa4Df+SiNuiYk+MkSEmg
 3PlwJimIrLg+aH1c/QXxgJTyLQaFQaXrS4FTN/whate7IH1V3xgu89R4cBJlZEe+jy/UrWTzRLI
 2S/VS+3k775MJSVm7J+ZK++RN2RrRNM16Hfx960Ad7TH4oWAb4jgN6AwddKq+Dv0DULyxNww0Av
 deZ+XLCsbuRPo35wWbWQXrXqcXTfKf+fVyfrxazAWSzDItD+koyKBbV8GDisw6CLh3mblz0CtMC
 tzljCNXp88Z47y4Dn2EqKYDi3vEN7paUWrQwgjasVdBQ+GGt+6LgK9vNgTTQfdQI0tMY1bB9++Y
 Ts/PtMbAzkoD33fmhFu2YWOqYwr2hUje2ZMka7iD12jnWDnw0etKgiudbhCmD9Ja9Z3ZLbQ0RXq
 BV2qJjOUElCAYNYsZdEk5pWDtDVr2bp0fEZJolbUok4gFTto+dlAK4iV5NI6GepT7xqDLZNQl0/
 oGeX7UmdRX824bA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: J57LPyIhoXJ6oyAt9aqJSp_8XraXlSyp
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7f215 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: J57LPyIhoXJ6oyAt9aqJSp_8XraXlSyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX5gtAdoJDVk8A
 43yJGKpUtSMwOto5go6gRtTGdkQfCRIN4O0l0bVWtGdONJ1e5kwqsLJY2RPWs8uYTQl7dOd8GYd
 D8Be7TqCEwwu9lsTAS4faLC+Fxw6gTHrEIyzTBs5pFYAlQuq227L/SkO/v0szNxxYRFLmg8h6sC
 eqjkLduaY1619xq24awnLpqjkDYMHg13VzEGua4UMV7h+JcBWW25muHz/KMBM15/S6PInqeiwb5
 G4/itv4QVSr+1sFCHx5tAprQhuWqtifx15c4u+R1iW2/fnNC56xG8JC2BUTJ02xuhHggIbdh6wv
 /3Kqs5sUXMY8TWBUaa4iOGDB2Co2TsyiSgWqyvCxRI1igFLgmi7jU0FKtfOwJyEMwh5oAzoM7tG
 5WVTagiVvsimokRY5UNI9CvBxGQQDuEjxttt9FsbMCanPGxi3FgLz1AWN91p+lUTU68BGtNcwS7
 +eyKmh7co1GSjeYWahA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97936-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BF7D299221
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab5bd1abf66e9460613b839c1d565e..e2af4fdd654340d618477ed87d3889dbb9aab456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3ccf20fdf52a8ec4649b43ade8ee7b85d613e1c5..66fd2ed2c2c8428694c07d89220d0e1608546791 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -728,7 +728,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -778,7 +777,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->rgmii_por = data->rgmii_por;
 	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -818,9 +817,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3


