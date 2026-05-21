Return-Path: <linux-arm-msm+bounces-108957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPluOHDHDmrsCAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:50:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF575A1788
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EB3431C1D80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08BD3D091B;
	Thu, 21 May 2026 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fw8QZ03A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bP6LEPs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C3C3C4B93
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352688; cv=none; b=uSrvCSHzeN4/mjnAwYt+7AbSHy88tsGdlR3YCLqFPYwmilp77j1jf+e0QHSiivDgDpMUwJAAmroMDSGgQYRMF2W4dahmilJLfyR4klfxpgDmNtVli5YGUPi4vip+6gd4ysmKhm8Cndjdlor+d6oP3oaSDJ58qIwOMH82rGHE408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352688; c=relaxed/simple;
	bh=WNjV02xlopOt/yCOR6c1PBVV+f9PcccL6Myit6QlqNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhf9cMtYJtZhvjVfMlWTVvR1tQNebTbtFlA1X0s8OshvFzECSOcgLhIt019c3LbRNBIox3aKyQc7goDg2uyAFFgZxZUA4ImRukZ5IMVDkP0pbJeMC3AREbBgQy9Haq7u2RjoA5ItcfZhZYz6mTMWiajq1QSuJ3Uo+qeT/Xa0paE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fw8QZ03A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bP6LEPs2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6AAuo1797936
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JM5WrS8FsL7s/NkKefUF2OuGPRtsF5B5mOOL733hTA0=; b=fw8QZ03AavUTjU4Q
	S3ZEST3b2vZi66clxpJ7YbdOzT1lEy0sb6r2I1Ck3VOlZOg4M2Mztk6W82f4Kvvs
	jZLIPlVuoO4nlh7Wqs+/c66Ab49g+3nB89mZqp1gAF8ahSngzWbMG+7on0fZ9YlP
	96r5mc8tTOfipeRDNZsYPXCC8PdK+rWZbnqbtYn/5kAO/MBO4CryrO30EAeszdvq
	4MNvuFSZwHrrLa7k/HvIZsKbSBTRGeglcQQwOd4iQ34Ehsq+6T3FuycqAhEzco02
	gXt4uUtg8e4RrxkRcrjBU9zhs3CpOqq7eZvJiw0NZKgu57dsDcb83OskcsFqwSkK
	FOUi9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu423c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51009190feeso182889911cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352675; x=1779957475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JM5WrS8FsL7s/NkKefUF2OuGPRtsF5B5mOOL733hTA0=;
        b=bP6LEPs2cDIGtqG+FemFkQMBJm/9AG7Vu4ly6PbFxB8HlFhZPJG0fUcQQsFv7wJrqV
         VczONhrbLdc48UaJ2V//XurPxAIBGDmeWrvPvut6S3Pxt8c20F6/Km3y/gBPWLe6RGBl
         rt84ryhVklL/eb2pcTV08DpNIOAQyp+BZhruYdLSSJFZoj0qbso309o3Z7d2RCm0Di/G
         U7nY9jUMaqYz0tcYTzPzz77BBRy8qHWSK4m/2W2G9LqbBAprHM7UnyVI0a3HSbK4rGGY
         oOFiNul5q2L1vDyeacC0Tq9cXdIbwviumoyHfk1j8yt4oUxZpB/iqMVgU7BSkPk1QD7B
         lzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352675; x=1779957475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JM5WrS8FsL7s/NkKefUF2OuGPRtsF5B5mOOL733hTA0=;
        b=P3RUhvXpcYSM1hqZAkTKrkfQn4uWOTQZl8akaWZflr23bxwv9GdtFf+FstZWKKkdux
         At40HqeZv4S7953AvY2UVgENv0y8cgwS+tuSNEB6m40cepK2o2ezI1i+uwQnmPPXuqEO
         GU4a3sFst6Q3SUh7O9y3SiJXGdSZYrm/3Ll29cmYzZtvLon2tJHgTx6a0vtIoEDwG6pZ
         e1UcyhEgRKRpGHekSnm+LIVgFAsheYTaPzH6BmXTr07e0DIxK5Ph6hRb+xdI7OYRkmQX
         5gyl0urv3gTttnBY+uSi5mbzyg7VzFYvRe8bZOc7zCnDavNal4nPc8ND8Cj0gxw32LWi
         Dtug==
X-Forwarded-Encrypted: i=1; AFNElJ9XTIuFw43PNydL0HO4Swfd+F06GFVBSQpT8QUjXsZsQ/ViN4w8lw2yMUFfMlWKu3Pj4odgTFQHNiUwIt6M@vger.kernel.org
X-Gm-Message-State: AOJu0YxdCP7ilSfr6MtS/wnogRCimkq3U+hvrFR3qLXizj1XOiUKufZZ
	cnHIxu5cBATfTLkZz/+kjB6elTvDvhez4EqUV2rXcIwyKuFNam0zjW1e3PJFh7/0O9NIiW2iuTs
	AN39GleOvEbfcBIjW11pzaxWai6BXufSjoss949ygn3tdy4Ssg+R8XjCFWrQPMqAIlfuK
X-Gm-Gg: Acq92OHhjCpv7ixMrDGiVr90tKiLKi6ac6rIf0A2gDCwA15H0Yiij6HF6r3e8fppWSp
	+SUwcKF0xwwOWrSVXCT4olL+fuhrQy2TISS47Cqs0ZSflg/WJyFaGUtxqq8njnys7PgTgZ9W99L
	mMihdhuTLXjqn7Zv/ur9nIlQb/YzQruNwOO04/FHIGBEbSiEEqKccPnqD4bK6+MPGbpge4v6Ie8
	Ii9w0Z3v6p4xtQDMhZ3bULOwjsLef50/sSx1gUOSwTVB6gwFglo5plpmeCIjp4GHdzjQxcM86DO
	jsAxrK+numvHVAyNG567KY4jn4VV3RZCVnHyjenQbCnjrTtbe0dsilU8k1GR/Obz1K7dQ90Jtzq
	XgX57CaZ0INyCw6A9aWJfZCn6kzKLC/Z2irbQPC8uZEITrx0Q7Tk=
X-Received: by 2002:a05:622a:8418:10b0:516:c92e:68a0 with SMTP id d75a77b69052e-516c92e6b34mr7156301cf.60.1779352675129;
        Thu, 21 May 2026 01:37:55 -0700 (PDT)
X-Received: by 2002:a05:622a:8418:10b0:516:c92e:68a0 with SMTP id d75a77b69052e-516c92e6b34mr7155691cf.60.1779352674619;
        Thu, 21 May 2026 01:37:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:39 +0200
Subject: [PATCH 16/23] slimbus: qcom-ngd-ctrl: use
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-16-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WNjV02xlopOt/yCOR6c1PBVV+f9PcccL6Myit6QlqNg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQraq494NpNjsZdM6B5yhOMPpc0+cpQHRIzk
 BziCgGQMEmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKwAKCRAFnS7L/zaE
 w4jTD/4l8BoivhRf297UcPlBF2FNgHn3SoPDZT2tcoCJ4pwYH2iOy+vtLErAAScTa0i+1UqBq12
 r/vnG58789VM/bZsVlX58HBBULss6RrXsI0b1xw8EkCBAbZgWviONlZkPl0INnnV/NQary8Ou61
 HS+Z9Bx2tUipQMxu1TR8k81/EnWgFAvXN2yn6rGm6KlEZGdPPoy+xyAPIudQCSPKNiItdIQy4UW
 L69otnhA4ShEQ1sNMuTK8FbfYGh60eKt7KSdIYr0joMsQqIDzR9lXGYSWsm6AkMFlZSeSDfPzec
 cbKOHBaPD/LZwggKavKmoyvpCN4R/mhifGK8vPPc+GHXXtl4NtFIzFPGDF+P09BUDdBTekpHXKF
 QdwNV1cr2r5NDEAGEz3fzJwU8AlGjoP67Fs3SG1KKOHS6JGuLDV5XEoMu2ujeF9D0wftPdbBnXE
 0XaON/q+Bo68CpJTJ/AKWzJGEasq8K8q/cZQtsbgg5p4M4Mc+Lh2mtvDp4O5yiWshRKBIKs5vvC
 P1+9Sr7JULlC9oNSLKd3qQazCwSqYr8qkLS4hpmeKs22LIastCqlnU5Icf8DpLIDThbnJftTd8D
 mlxLqdCStPGfHY0hJWWilamRC/5mefu2XlUg8HkNToEyOLkmMsb2VNO04VxVf3nl2joirLMPZcg
 tH1KDuWnTXUMHCQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX2IV8rQDR2Sqv
 voW7QaNcYJ13ExNimjcKTI+8phq2Vf0LlpFXEiJD1NqDhzaC3yKt4J5ggkYIIcGtQrAd2UR92We
 IfQNtwZYa05/3wmWz+1ogqmxckDQbUz+r0aBMKXL+dfJQ2DJpzS6iSeqASd0yWsRuWowPZGmFTE
 HTiV20HlixW85TaGoDJgMgCV1b3FKBXKIR5Jys79Hn74erbs7UPOeP3R6h+da7TIQgKdknwTE+3
 8e9qQ9mGhpzRarHQPY/Sopfgdg+Gf+SjFnc5FE1SW1oQBBwHZD7m11VV2i7h6B9EXv8/BSiA7r5
 2Epbd8iMUvR0RkcL4LLlUN92AMSzKy9slSgM1DCdyzIQvC+4/PrCFv/bhK5/TAI9YBrkueC1qHU
 fk/DYLM6X9NAcxuh+G8wfo3XK/hJdJoqt7Fu0bxKgsawHCGKBmGjZpr5YnbxJv41gordN+gKS8R
 N4e4qLlMjHoEqHAFDzw==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec464 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zjndn8kAT0tTeq3eajEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: x6te4Ek48aW0CcXg3whLH121suimOXJP
X-Proofpoint-ORIG-GUID: x6te4Ek48aW0CcXg3whLH121suimOXJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108957-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DF575A1788
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 428266949fdd07ac13c5553bded891225c6e1a16..70f06981533237cb5de47a855462220050f6d82b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1542,7 +1542,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		ngd->pdev->dev.of_node = of_node_get(node);
+		platform_device_set_of_node(ngd->pdev, node);
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3


