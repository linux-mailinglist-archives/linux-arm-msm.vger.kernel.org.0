Return-Path: <linux-arm-msm+bounces-98181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJmDOg9fuWnYAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:02:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 518172AB592
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49A35302BBF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA063E1232;
	Tue, 17 Mar 2026 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egUMiK6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSGdacko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B183E1225
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756164; cv=none; b=DiUo5FdGzU2oRTnVI8TesV9qbOlCfUYa+06dv5rF2MRSIcMetdrGwpTlX4U46rVwnW6Z4ENJZs5f0qfaGB49V5ZsVpqvIcPBmQoRxrV3IbIyEqLIOXufJPZsJ8yvEtSyudn3U11SgMuqUaFLkE9cnwyWj26Hm/JiZoi32FlWNC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756164; c=relaxed/simple;
	bh=V/kExSnp4gLekFUspVMuJp40Wa32cu/zESSu6vck61c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKsJzTM4URJrl+xCPXBcAH5mh2f/v9z3j/bMSVzrdT6v3K2KZJNEgtj2yy8JL9IX61Ux3FjftAWBjGyr9sin0Tg79GSgp1csn6iyp2rP5CWYtcw4DTAYM68BHGo1ishYCs6o9Mvvh9ee8OzYHZwAdua4aaVA+NJIBXZxyhTd9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egUMiK6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSGdacko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8GcOw1534110
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=; b=egUMiK6p95gLK7Ec
	5yzvhek1Xp4HHsGJLveD9OYZn9s+ZM88kQOuR8osYzh+E8bXlTALwGwdq1FRyBLN
	ib244BKpyu7pqR7j0/dR6+Et3+mE0LrObAgi28O3fkJv7s2CcgQ9gr/YpzBpqGy6
	d+hog4tSifnJv2iwJ124JwZ7ORfP9/56xQ1dWsKl9/g/Ttwmklh5lXgJvSPLe87d
	q4hxzdwBouGbBEaXe8rIcTf1B6QW59VKt3mPPoIQLyCxyZqKP8jdonofAeLDiBON
	+jx1IBxeMPrSbQCwgsXPyVfUMO2k24/FS001m6J98GPzLByiDmwaFetjymtDYtZk
	vE7nNQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k4bk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:41 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94eb4245732so9193550241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756161; x=1774360961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=;
        b=fSGdackodBuu+9cc/H9jATPN6YHAhjJNko9X5N/jJOOALxwsfm/dUi3s2gS1kFVsKb
         1+IuXnR4vkI8LWb9cGSyoc1klWYIy912DlC4Q8lEMoTIvVFtMvBR9mcvWOzYPaiEdCFn
         LdkLpCbVSy+IBi6G8i823DAfDv14F0E9PljAxGR9aEsYe/3tsxIu4nwnIfcLbUEP+0kJ
         VwTwYbilRfo/sJ9NstidkTf80icOMUqZXveFGCGuS6jlzIMMIPNKM5UIRX92iIVASTuv
         KbiU+A+dqWXQRErXXUDoh3LkZXuvOH0KLoPQHysFeG9pVTxr3Uos1aqNLpbfyKKaZIp7
         Ks5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756161; x=1774360961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=;
        b=cTgOZWycJiMpJQCyeuSBhigS1qcqJGoeQW4LPGa3CyNBSNJF6HWC9zJkgrkS48yN9X
         D8D/zbOn07nTRO/jp6oo1enhrhAHqm0PcfFlfrZmZ8yadSswM8ZRAM9df9eubUIblkg8
         To58ATpzuapwlDeAYiolD7Ez+tMhWBPWODKZVgKkjRyIuN1coLWt9jcl/bcZ7Hjt7POg
         wc/dzUBfRuUjMA8TA1cH+b/403LaRJvPO/7dAUkGVYF5CCswjnNDeHaA3HYcMK58E4RY
         KpST+aaKisFs2eYS2e20UzErCQpzI1ZzF+ZAilISD/N7T3h6JmFk7Zm89YyvWUdSKhGG
         bqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJXySLmLz7eCdvpoiEdCVW5xbXMgqbmD9ojOybmTdORugH9ij7HxY2Ot531MJlC4zK3ixCOWFPlLDR7BTs@vger.kernel.org
X-Gm-Message-State: AOJu0YzCsgWKjwjTMnRfqa3HhQFki1ocSPxdgamph6wWWyTmQr+9vRPG
	Z61PsgPUXyplAbkCv4FnjsZ+ZncFtEzAxOajP6tF2O8xAw/oHGobeeDfcAH1cUpbehTWlDYdNCx
	tjBxbxhuw6IGab+hP8N446c1C36pMcQFLk0f8GZRvL3Ht0dfu1S2fw0mC4I3ZmulCWDB9
X-Gm-Gg: ATEYQzwm9oC78UVONUeeTpm9k62qnlmdYlOFvuXvgnTsF2LgRk0F8ZTmEvPvWgSrUh0
	ysIWiA/G6K8P/BGYNgCOYQSGjjJcCZc1E1OcLry7o1m+BbTVMw/6DLgQrd8WnBRKmo/lyDgA+jQ
	r/a8Ew2Vccau9G1mR6YKwdMW+TLFGXDjv9nn/ppZVQYOpaUQYlC9mpXbdQjJHTEtmz5W2Yvg4yG
	XFJXHz7CdA01J5o1xyq6JcJpOZUtVuljXeK6O5L3qEj5zqimjlc2+2E1S3igWYINutxuHwMkVyg
	Lm3qAzm5kqcd0W5HtRYRH7Bu+4ySE9w0+Q+W7NKljmM58p0wLDpK9q6lxmRlwSabjNmta7QZJlw
	NUzLoOHD4nLJNk7TBArap+mycUBQ3nau5el6SO8orerfkavYlrVmn
X-Received: by 2002:a67:c994:0:b0:602:6e95:bc82 with SMTP id ada2fe7eead31-6026e95d27dmr566468137.33.1773756161181;
        Tue, 17 Mar 2026 07:02:41 -0700 (PDT)
X-Received: by 2002:a67:c994:0:b0:602:6e95:bc82 with SMTP id ada2fe7eead31-6026e95d27dmr566403137.33.1773756160622;
        Tue, 17 Mar 2026 07:02:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:08 +0100
Subject: [PATCH v13 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-1-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/kExSnp4gLekFUspVMuJp40Wa32cu/zESSu6vck61c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV7wh7HuGH5/DCVeb0SkWUTqB0AF86dPpu7g/
 72XbdlMm+yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable8AAKCRAFnS7L/zaE
 w9XrD/9DdkZCvQqumSRBF+lrFXBsxZxYUgEXfN+mreAzhSLJYbs41bwA6vMJqx2u/xa74pIHcRI
 E6X2kn+0sMgaqUZUFnbGghcb8lvX6u0/D3PPxuDpMbrRK41KGkpWrVqK66I2pMLSGbGAGqrb3Jm
 riFP3OW34JDf85ETjMlsvsSkhvH1vQlbhjrb5zKwExnzF3ZhyFsp/Z6ykcJfudt7pgsz1e3Qnrs
 CxaJXHaW8VVAg700d6BOQcZJLJwiz8WZvl19u6ls+uZpp80IbSC0N+b9W3KzYGGpPJ7oC/UQeGj
 Rm3VYVFcUVta9/EolEJKIDs+GKNzfWUYN6/Xh6bRzLzhIWcU/QvdjfzCY73ViQd3x62jGrfst98
 SiHa74zHS1wdck0v9ZVzg3z5qbhjH53km5ewIJS9LWxG/h4ttLL1HKFpunJMxnSa2p94VfYrwVc
 IloeSDr51fePrw3ldchplm+0St42EqZzB05sgomDRO+jcnCc3IqYuffFALsoFTEbOztegE1k8Bd
 KNWHtxAyws1j8ykk0purkFy/LdSOKOUiBw1G+wcFznNp4NrFZF7GhGcUYYfsjcuIpBsDc+aDk5W
 3SAKF385mi9hge5rDMti7WMIqSN3jU/WMTo/z3CDmfJRSFJ8fRaNxrTssIqdHVODlc22dJWP9/N
 UtxRbRqtQMgBn9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b95f01 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfXybZm1/Uy/saW
 DNIQGk2agMkfHiQ4x9LQATkPCnaCCZ/C4FgCm6lc+FAJmeRlB63K1Fs5FXN/ro2imY92bvk9sBZ
 VwU3EhqGmGZ7d07xcgkw1N0J211EQjjPuc1RNj3XGtyf7jOtp+e1mkWndDzVGZz1h3XjPfEDT83
 2IIKXMgTHyQ1TgIcAlFiywdSAytywfvIrvmn2JlQngKbgsSjnAtt0igWcdZ2KT+cL0wgKUHM+Hi
 9JVPGUVXpP909gTJRo2wCqpqwTTaMb9BQ9uckbG60IAU0VgSnfkeYGwV63ogqaM1o6mKOgTnByI
 gsZhLl/pKUd1aozn35bjwkmY0td95l52Z7v/4nHCbQqzieym6jngRzHqUKIcD2o3DUFGVPssjqz
 OfyuK5I/Qv0npUoD3mCrYl4aZnf3JJjsPcFHMcIAfB7iTB1TsTnG1EQEmJ3k3bUFzpKFmLTd4qj
 gb0neSa7rnARCUTMR9g==
X-Proofpoint-GUID: PW3hqt1Vqn5ETsoMWCc4U_FMJPFWp2rw
X-Proofpoint-ORIG-GUID: PW3hqt1Vqn5ETsoMWCc4U_FMJPFWp2rw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	TAGGED_FROM(0.00)[bounces-98181-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[qualcomm.com:server fail,oss.qualcomm.com:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 518172AB592
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index b53292e02448fe528f1ae9ba33b4bcf408f89fd6..97b934ca54101ea699e3ab28d419bed1b45dee4a 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..92566c4c100e98f48750de21249ae3b5de06c763 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3


