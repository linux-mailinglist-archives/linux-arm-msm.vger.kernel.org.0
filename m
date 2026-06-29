Return-Path: <linux-arm-msm+bounces-114953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qGB6B9VCQmra2wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7D6D8994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:03:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LEg703f5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F7eq1ldm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114953-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114953-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B19503017474
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31003FD126;
	Mon, 29 Jun 2026 10:01:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A863FC5CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727309; cv=none; b=sO1wcvBpEp36gxCj/lPnhuUmhjd/NOj4GPIbe2OHYudo/bowPA+XXZetelB3oZmKpq6+nt7NDjBFrDizgvPMGe9ujlc18XXF6feMwlwan+/oGWPmbC3WW8lFHF62Pu1X82xjiM1LFnXFysbWOn3rrmtMQY73SkXLuUEzTXi7DUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727309; c=relaxed/simple;
	bh=vpDVf/b6zHPEUgtVCAl2sRJELM4MLJc6gtP24/up104=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1wINcPqnGm2JA4tCt2T0BLGITYs8VsUUmGMREcnY2ibXa5nWEsSFhO10XNJqvTwxvrA0UxLvNwVTw5n43j7EevHSF4kxhFIrlVSfuh6HrQQnM0XIqG+/UAdXFAlw2Nt/iZqHsA63upNKsINDNBOHWi9oz+2AX4hdbmksLPTOag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEg703f5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7eq1ldm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sKAq2143092
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=LEg703f5oAUmJAal
	+gHU7nu0RU7bBn2r1xrDChXJ+FR4599Fai3eHgqxavOc0YxvdUfypUPymZG6KFQu
	fMqH/TDOTpyeMBTEQfuXW9GQHgQLsFdA4+v9nIgClCgdoOf0Qlfh9kUohbLTk6y1
	s2YGV5/SG7YNkVhNd5RuO5ZMziR/TKfUZPB6sJu68rxvB9JMi6+atAKgsVuYIwiW
	W5BuaRSCYmNdQmrelbUvRQZr8ncslfrcAdgNzLVki8k2h2XHcrBYpQKL8k336sCE
	46RZZkiz/qmDeNp/bD+wn1TIovRJYmLiHTKOFHo+xyDb6gEB6IVQE0sLXNxS1H15
	GIxexQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nxgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738d9935e23so144507137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727306; x=1783332106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=F7eq1ldmnYkz53SUv7HJ64/ow9eHXpV/0JVY9ucdBmvYgiQOc3TxhtwUWndXTaNY61
         sXjPSKTPO1UN7w0Rxnj1zUPaaSO+jVuDOX7ReeUTfYUXe9fMLWomUs7AeYLTVmN824W9
         JmtcxadcQQYa7MZLS5mEMm7f490nmVkaI9Q/CQjrWcq1enT2Q6WD/2MwzP60XlzJSB5m
         gnWKrRUO29fEdpXM+1OVHA/SC5vK87RZeeMsNFLZvIzuQb91KLOGMQ/DSyAzgjqRA+ao
         zHK4ulpdOXtY7QotPkrwZVa7mM+hjL4iQLjvP2qeS/oKfPASov3d2mtiC7Fk+32QKPc9
         laaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727306; x=1783332106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=bwQ60VOpPAfcGyJcfZY1r+NxXACHU/UczgPIvRCbPS40CUHBzAC+Cwjg6Cy0SroQ1J
         vwkBltRzExfyNcBxAV7uHqCSql3sYRyFCN0N9vlk9PcpGDYukjJxmiXKOUK3kNf66uZH
         xXwNmR6qqr7os09O3g4WoH9cbnYaCB+cmbivWO4j853ypbpfoBUSJt6OJbJmtdPtravc
         m2sgYUOSA+NvjfH3vf8N23OfAVKctUiR+NiDk7nF7gWwS4tQtivkYIrZZYnl5kzNUIYS
         hKGGQG4pMXRCS/qFyltZnepk399Qu/Cw3o7aIebp1eTBOYZBJtBdvZgp4sUKVVsmL57h
         UyfA==
X-Forwarded-Encrypted: i=1; AHgh+RpJAgN+ETgBxmhKS/SF6MZTrNWm6rCcATNsEzmfacuajJ3Wz6+oaJlPRK8BLmIyBphcHA1RZ7hr+dqzUsvT@vger.kernel.org
X-Gm-Message-State: AOJu0YyhE+ChelNEfZQM9ZLhxixjZAiOyPhgYlSyx3R4OUJM0G4FHE0u
	OBijkmzLlFx8QfQ04arFPtkVQ8UTgZ9VuROsKfMf5KFL3PAgotdMz4E20TWtLakMkaHNcyCDY70
	6sQfwNioI7lJ+wW17oX2rr229nIOt1PXrnf3+wA6VZoUEqh7eL1rBUpjBnoQOYjBpxVpC
X-Gm-Gg: AfdE7cnY3ErfvGtkQ+6oH8H3ic4aOB9BUNtwp4ehxqYUvQrI54Uxam7d7/DXtTSc6Vv
	mdm04ar/KPEBReQdOcJ4VBzv0vu85Aprj2qTiTY78xjIaRiZwvaWxsqHDHjVBRMq1Waz5x4cETU
	U6iddmZjtGPqz4EXA0s74pRKTXTfocqAxUXPOC6Rj090yrypEXXy4Xmm+DpwzUHhHOoBA2d9njy
	oH0WN7NoxpximPkO4eetZrNaU3kl1ykGyv+fqrPsoeiE20C76UteP3eFoZw5X+gdsw6FJcVqfV+
	FXF9sio6PJG1vmn52DBcNoPJ56kL+mYAENv79f7F6/wqfPiW6LweEEwZoB6QjmP0DruKpfrNZ+1
	odcr6QT8jRpEkfBMLO1Ofzi12/wfVmaowEgsz+Dad
X-Received: by 2002:a05:6102:95:b0:737:e354:4092 with SMTP id ada2fe7eead31-737e3545ad3mr1196589137.11.1782727305968;
        Mon, 29 Jun 2026 03:01:45 -0700 (PDT)
X-Received: by 2002:a05:6102:95:b0:737:e354:4092 with SMTP id ada2fe7eead31-737e3545ad3mr1196526137.11.1782727305442;
        Mon, 29 Jun 2026 03:01:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:11 +0200
Subject: [PATCH v20 09/14] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-9-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJwPS7oWMhegzDGpn6W+WADbxymK6guX1y8I
 RaJU6CKoUqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcAAKCRAFnS7L/zaE
 w7l4D/oDvOndI1JjwtBTY+Eg/bVcbRTNwsf0yYfaPDEt0LlPqKKKDJYkylNF8Ipu3XluJurf9yt
 gpAQVPC5wJsdY5ACa49GVUxlFR4tvj2/bvgLXhNCZJ+5qeWvnFU10wwIioy1ZZx+KnA2CgmWX3a
 EjYzP8n8WU8ob08iLjXkF5QCFJV9qt7Q3uKwZte9gMm6inrvXliFICfFtcnqxahFSrjexSZnvWA
 K9N5xBr4Hoi2nXUGELVaGOLJN5rCeZvuPeJ0HMdSKUQMq19297Dl/+DabLPQ8TM60NFLouknc6U
 6S97ZdznObH6VPHfqfYkAwRQsLMZd0nUpcRULDvXPKlutq+vUTePngIC4RBiUHKT2a9EDPFB0hA
 +ZY54bSMoAloFzrIiIjLIAvI3WxbuFaS817bSk3r0GOvsbiCuena4hqXzN4ozWZfX43O7paBc0B
 heLR/M4QLCGLcdKOFyCVu5Lw2YBIPNizbdx+HJLm7p8i6nSts5VBxcqEQNjOphoy9QrdaPm56Pg
 PiT2np59HB86JEk9KQ93C+mfdeJZyfsDcNFtUWdiI7b5I1YmG4fLbYbIKE746zHsQMXcpaT1Jnb
 +8OmA3oc+ikQqsN4blAe6LAwPIbjRwy0cJBUic3PzhK2DiOEaabhV1Z3oLKEDNDSy3iwAY4whb5
 yx6/YbbrfsT7ydg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX74Hj3L0p08Ys
 0WBYQjzllHxpypiR98E1KENcXndHJsk8/VHkyh7GOwOKrrkE7A1+cNen8zueqGmCEwTKLlcJt39
 xquE+Cs1Pi0uUHJjGYB8sB8ENPLJkvU=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a42428a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WD83TqgJtHvWFT4wh8GalH-zP9vzyTjg
X-Proofpoint-ORIG-GUID: WD83TqgJtHvWFT4wh8GalH-zP9vzyTjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXw2+PVkfB+38y
 PEyM+StJDjHQh1BVO9sN3qhTiB2V4G7W5w7jiad/P9OnG3eOBeBC8TJ6kijmbxZIyBnizOFqi0e
 QeJMALr2aFaMKFH+eV0jKlFhjhRy0QZZY/lyygE5Jj9NaGWtw7hIoZsEtExv/xyWRxCQbi/ltzu
 wotm6t9J2mi+QBNaMaUkzKEnBjYDYru0aqw9zndoGxCtTVWGi8RUHbpcRMkWjJejbha5FqGJ9QW
 mKXiyIpWR7vjwxAJULvGBHhscpO91GPSScEwHFGojiSlKnSbyzCc5CVgvviBctDcLoq0blm7ryS
 z3CbVO+tGO6tuAIzAIfshTMJc6AqBkk00zeqvg/iz+NvTGasFW7t4sWegcgcSG/msx4qlGOVfmY
 pJLX1TPIqB9rteM1Te1vDHhXOa5MQUght28VDSj/q9SoWmWlALzMqc/krx1V6HTfsJ7jb5WVj38
 lUQWqgGSUD0Pr/5Sqvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114953-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8A7D6D8994

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


