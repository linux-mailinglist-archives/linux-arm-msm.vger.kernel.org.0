Return-Path: <linux-arm-msm+bounces-108947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHBFJsbIDmoACQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:56:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1C5A19C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0367B3082FA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6103539FCC8;
	Thu, 21 May 2026 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGSv8YHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+Iq35jx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F593A6B70
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352652; cv=none; b=awP/5ZRgEK2XjjtnAD5HVhmp4p+MexmTFPUuLH22VSIRe7lIpdA6EHRzNgBJB52XSg4dQ4EMY65C4VT0u4yVV0iXNA9M87cPKCxHL9c7R+o06zn5s0neQvJLB83nYuji44L8vKAd5NObDgNhSiuDwCUACci/IGB8IOdKBskRZlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352652; c=relaxed/simple;
	bh=wZzo4F+iEv+cqnjZacAyiOQUCIfz9BeD5LEdTUENfEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seYzPgKXUoG+m5lyNypencR+F+8hnwmqAz1KxgxwAAUNrx6+t1Z0MlP6cvAiP/dFxXknh6GQCx+vRobXznpn2WHImv81ur192+QBtXvfo7g9QHS70uCaBB3a16R7oRMpJjAxHYSwSIrUk5qAxYzmN0AI1CP84GDKWj17X8RroKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGSv8YHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+Iq35jx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2TCwO3816873
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0PJY/EBXaS+NGqlIlXtzUywSQPQ33CG8O0mf5HsOtc=; b=TGSv8YHH2HHm9gce
	LO05rZSE6dZib/XINNl6hu/QvmGJtgVvta9prqDrYEhZLuap803BPNi5UJ6pclC5
	8u54UuNFHHifWzorPhqhoAujRKyfX2pOVUtZwN4/RWtZiEIMKIKCbjA78t55rW4j
	NeAm+13eASkdx3gOsHfhlBsFIp25sLXiXlSJKlr4hMmSH+3icRb13RT2tf2A6xfl
	Khpg0wQCdp2jMuElLBz/vJ1F4RrRglBsQ+G+9NE6yUo2soHkDy+sOzVG0O6oTes+
	tevab/rwt7fnTEpBxDXzs7qe82eYsaXRep86pEQUxvQmJYEi3ALTpInszxXfFbG+
	FnGD5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa19kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3403e99so50212671cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352646; x=1779957446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0PJY/EBXaS+NGqlIlXtzUywSQPQ33CG8O0mf5HsOtc=;
        b=Q+Iq35jx1DZpTNiLVHzM5216k3jFIYQ/vOsMtjVb3H+PfqXodMSglLhjZB2LTwBfNz
         +FnIagPxerOItHadvkpZ/tctBt1PH8bIFkTk4t22XgYAWXofCZ3Hz0PyYoNZcxcLY9L7
         1Uws/SjmHoLVozsoOqTeOyl/1O8URb26f/lUI3xdao1L1vEtUiW/iNxitmQZFnXPsu7B
         KbfBDP91zlPPVD9EJ5FKVrS1yPtnDfi6N2RR7lYZShcuZ99rUDgKV0OIlH2QxIEcy6na
         7kCi6um6UeYweTesC/5nw1Zlb4LX3G0tt9OKrGe0hyg+K+OHn5nUm7zFIolL+UCWYHN+
         BNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352646; x=1779957446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m0PJY/EBXaS+NGqlIlXtzUywSQPQ33CG8O0mf5HsOtc=;
        b=SHUVeSxMRUdxiBRwMOk9pS5xBkm7TPDhHG8g27XDARnUkPDj8wxLj18l11FU9YZia7
         JrePq0fjpldGQiztYrXd0ewdaX1yD8fcMPBxN/anqEvu+maflj0WyMpwWAeKlCc2UDCk
         QEM0tYQyji9C2rTaCnCqWxM3fozo+AEz/mH6tT3qN3uDUruJR01r4v5NyW01Twhf2oy+
         UzCuLyPhqIGhBozX99j+c1N1y604Z7DcC2aUZNKViRF8Gs6F8rOjNS5gOdurHNHKWwXr
         Ne6qouBOFOM/DiXplVKeLr+60ogTOAV/P+kiUaEw4/sdDYuD7pGynsO4jSTV9Z5rVs7f
         x8Fg==
X-Forwarded-Encrypted: i=1; AFNElJ9at61swq0psinYghlKn/enOKxSGD3pKflhPa1l0SpyZxbsGofy1/tEHNyMsckmKjA77OzfM5lSYk2XH3lj@vger.kernel.org
X-Gm-Message-State: AOJu0YzB986NmadESt3xNRXiRyZ3Sn///BKB41Unr/O4RlAQljuds5X5
	6IhjRVzyZHAro/GFG77VWqJeI/PrAkWaibYqS016Mp072YhsmEhszMakFJIdNzFwzs3YFBCU09o
	gbqD3cJiVv+6y6qS7uu06fg7p3PqhYmtN+0O8ubjeqbLX+Yr1OoKET14MePYqE4i0Gumf
X-Gm-Gg: Acq92OExOhskCTZ4t8zB/bWWR8dLHDnhEB/fkDAoj962B9LBtAqNYCoHgGI5zSWimXm
	2TbymIF5tfzlwEdU/duE8Dgbtq+CaEtI3vXhq7/u+zRMicfungcmBEhxcfZ4uOsXW+VcmJkj+EB
	Pba10/pmc5mWIiOiOYwwIsbFBWc247wbLGYWInxnGC4IZnblyr/H98K5OjLGrkfcJYS22iGrPSh
	dT1bZszpBLNEsRElzDCeG57mxzZJlP4Jy9G0mDuxabt/jr+aswxpt3CMGY6TKLBP5qvmCK1RHoI
	Qd03OgIjxjmwg0xUroH4iEnsXx6mhpCVrYA3UKhgACe97fMaAIEZGrpwI0yPZk5EfnyuPX8E6nv
	XbxcATFMO9No7niDaSI5iDzMT3m1M2PjHg0kmaMZNrXvZ+U95mNc=
X-Received: by 2002:a05:622a:5588:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-516c53d8aaemr28109491cf.2.1779352646036;
        Thu, 21 May 2026 01:37:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5588:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-516c53d8aaemr28108511cf.2.1779352645294;
        Thu, 21 May 2026 01:37:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:29 +0200
Subject: [PATCH 06/23] driver core: platform: provide
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-6-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wZzo4F+iEv+cqnjZacAyiOQUCIfz9BeD5LEdTUENfEM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQjLvHgEkgDUYcyQqS+YI0tDoWCf94BkOfk6
 vDphiey46iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIwAKCRAFnS7L/zaE
 w10mEACuBjw1mRfWGN/zZYles7aGCy04DbiAjWjYefDvcAqjwNHVbQPGTfR9vvDt9Vt3opZlUfJ
 1ytnUuq6dFumO5reYJ78tEy9o+PkI8VY7UoUHI9DX2cKKEeA6fkKzjp3sYJvTgqJELasQOkPH8y
 PlZgKzt0c0z6CLrSP/lqxiiyL6Roc+RIVEg6THFxHR5OoOrX4+KXE7TpYW/+9R6Q2BP2a5mjGKI
 I8sHIVxHMgpemPUcVLU4/uTLyuQeLaADPratIxqvFuTx0AW6AOYaFvaamCkQMd//4qESASqVPxq
 Iqc2iJqP6r0b+IvjJO1nHSUPlB1yTjcDLn+baiOlmwj1skALP2IMeucYdve6oLVmXSGYq6qAYq4
 gC7R+np/sgYQ3f5xLBo/KtwsaKQb6TSf+ZaoZnYHVqW+A9akzduAnNlWFKW0UODQ9PcBDZadov/
 3mRLrzwuMo293FdKXtsUcYpBMNIX1XEo5vV2REkvT+e4lLq2oAkW+Y6KmtTYYkzZs+myeRmoTWk
 ebeqMSKJ7NApWk3IX+x4SN84ESMRkBiuAhe1JJ+h0WQ/IOtxcd82UQCshyJxQ8qXTzoFMc2kEEB
 3KNvxUJHXaBt2BDRHwinv0uRBTS3Qwt835TjvmqeqIrB1g5DU3xqpgR0Yja7mcdp35huKbkn9rN
 lHge5prVxo4DdaA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX0oVpFQQBdeVL
 YRZP4fj9mLp6Qt8u11VfWSPhNXc8cMEDrAcDYc+52nBXOUP9EJMPocFtxZJItY1IkY44Gvpsilo
 oLeGxsOizDW2WOQRE+w+O10BhbeHOnBv+lsprbbY+lNuNi/2zWmVxWegoerEQWYkxe+Rso8bjC5
 NPflFXZRzczssfiPp1/TWspg53EFcaFNnpdqmDU8MqjQ5FF3sS8OV4kxXVVz5djzy1M3W6yb9Xl
 l7wksfoRfaZcyv+1UACvNMsq5rS6IN8pPMLL4fxajBgzSPHx1GqKuinkQPVITUu3nQ1OQs/fRUU
 VECeDdrWFPUZFOlvzhgIlEjKSs3ITUzazLazIecSM67QknAr1bz599+tQS7nTfh4+E3CZMxHOuI
 Vv5Ysr8uT/LFP8OyiSIlSamCkyrWPW1cyy/4p6zm3yYayKqYjTwTrOVWYd4Yw2QklaoUNTK60Fw
 1L8oMqudNxxS3Y+O9YA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec447 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Q8RKEeUEMY9O-VPP2I0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Pzng9RRTa9GT9sgxH-lbHxoCsaxUL7-x
X-Proofpoint-GUID: Pzng9RRTa9GT9sgxH-lbHxoCsaxUL7-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083
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
	TAGGED_FROM(0.00)[bounces-108947-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 4BB1C5A19C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Encapsulate the reference counting logic for OF nodes assigned to
platform devices created with platform_device_alloc() in a helper
function. Make the kerneldoc state that this is the proper interface for
assigning OF nodes to dynamically allocated platform devices. This will
allow us to switch to counting the references of the device's firmware
nodes, not only the OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 18 ++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4824d9a2edbe9ff86cc9893cd74688e9cbb6483e..ec53383fa17ac29ea3b15b61f97ae65ae8ca22ac 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -693,6 +693,24 @@ int platform_device_add_data(struct platform_device *pdev, const void *data,
 }
 EXPORT_SYMBOL_GPL(platform_device_add_data);
 
+/**
+ * platform_device_set_of_node - assign an OF node to device
+ * @pdev: platform device to add the node for
+ * @np: new device node
+ *
+ * Assign an OF node to this platform device. Internally keep track of the
+ * reference count. Devices created with platform_device_alloc() must use this
+ * function instead of assigning the node manually.
+ */
+void platform_device_set_of_node(struct platform_device *pdev,
+				 struct device_node *np)
+{
+	of_node_put(pdev->dev.of_node);
+	pdev->dev.of_node = of_node_get(np);
+	pdev->dev.fwnode = of_fwnode_handle(np);
+}
+EXPORT_SYMBOL_GPL(platform_device_set_of_node);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 975400a472e30e2f98cc8f13bc36a63129bd4fcf..21f7d8a7f4b5c9a47d56d80a69802b3f84457ef7 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -19,6 +19,7 @@ struct irq_affinity;
 struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
+struct device_node;
 
 struct platform_device {
 	const char	*name;
@@ -262,6 +263,8 @@ extern int platform_device_add_resources(struct platform_device *pdev,
 					 unsigned int num);
 extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
+void platform_device_set_of_node(struct platform_device *pdev,
+				 struct device_node *np);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3


