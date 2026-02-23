Return-Path: <linux-arm-msm+bounces-93618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIIRFSUanGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:13:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A16F1739EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A9DA30A35FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D8534F275;
	Mon, 23 Feb 2026 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+hQ3JvF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iut01gO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243A4350A35
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837595; cv=none; b=NwdkMj8ANxQrXHpV77M+m+bsCseJR+EKYpYnydct+dRljHS1pEAUZk3NtiOfvpPapY5beO57by0rZZIOniZjCkMLuunQYdAiDEZ4OAIWLdhlGQd9zGj4EfdyZ/VQDkcQRGBK6RktwHScc/DYUUzrrYBiidNfKp5DuqCU2yjwufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837595; c=relaxed/simple;
	bh=hWDFhQnaic3O9OJ+7xBky9bkVsKM8N71b8pq8QsprJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pExbgxb9K+QxvLe6tBxDljq5qImJ9IoBfVWLqfXDaIqWKMd0l5GsMegaRnXFccExnC9Vg/t9AJKmNn4iqB9F9kOtu0p1Ali2caCCbasci6Iy908bbx61QBgYaX5tNpC31ljp6T55NbftgzJg4nfySVL7WCj1h1BHnriQr7ZNpuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+hQ3JvF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iut01gO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLJVbA2608680
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=; b=E+hQ3JvFEHwHYKbc
	pv5mrS5M6p9RS7DuB8+Ae3lhQBzAQA2xl8sj+Jg3Z8qaprzl5tXAAxm4piJP/4vN
	WGTJU1PJcxEvqetqd6bAnr0VbEcxLVYgSK4mpXEe9xfzOe909+YGm813DObXoHFR
	4A8b7MAzT6NtW/cfU/2vNGkw4S8HExav65vsSs8BVRgQOUd5PY383UBEqB8KWIjM
	K/3jv9c1NCCk0H2NFXA1DTZv9yZ19b6eecTXghp+zACUfp8zmSLAzgF/zNJA1C6W
	+9TnGj7FdUY9foDDk6ZdWebb/xrnuwop89pVpxNx2VPyHcQ8s9/9oj/GKrjZqn2o
	mFYEWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv3h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 09:06:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so3869946085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837589; x=1772442389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=;
        b=iut01gO8YGnO9ZOovxTMQHxRLAgETAPnTrhgx316tnjLgBwKl5Yv+9FnY9shyWvrtv
         kleeHqVHV9krBe6jzlY7lBQ1Y1Tk+n+fBKeNxXEF4Ja3WpFpc+K824KNqDs1b1Pqe76V
         QlDS66r6wdK7bqJQ0ro6Ydvfqfm4/kPkDLNaq2/eE4MYU9poMJdVJxchV7kmVdLkAmLM
         /XOg7jaQM0NY2wcMd5QyoXpW5MG+7uFbu0gZuW1hbUm13LXksDdI6QxuFOI283eGf9S4
         9qxEkpA3X3mUvVyoZGAnFvJRV+VNcsDnm4C5c/y1hocQgfjCde1H9uzSMcI/szVp6OaK
         /pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837589; x=1772442389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=;
        b=o5Ix24wdrgAVQ7NlD7dsq+mt1cY78zCezaJGI5ZPEwaWkqPyBJiFLThaaibhrp4BhS
         BzszFmrzqXNfFiLdWuEmyCcQT6qNaet6+k5HYaKG94NWHqYU+Uh3KdP3QpEPiF7gttYZ
         JJJf1Bu4+wNMROaS47VXR5tw1d34qCd22WarshKaa41+tBVRAOvFacDaTdJCmivr42jL
         FOFyqHvR/AeB8CJm8wdRDEpohHImYHyb7pMm8HNy8TD8VxkqR0F38aXnm8mFISstVlNw
         Q1lQhe0uHLWTNxwr1BDkcXffYE6m+uMjFruE1s3DGELhXaOfh0MDxBMWo6NM8DE5iYfv
         W/8A==
X-Forwarded-Encrypted: i=1; AJvYcCUfQVyzic0tGRyae24IbOP8ppGunEnDfGnT8+X6o829bpzu017cST/FlJcD4ySgJf6AxFoNFruxrRUPjHGI@vger.kernel.org
X-Gm-Message-State: AOJu0YwBBUxfUuuCYW6NyBYw/Yl0CmBW2hECxc4EODORym+m4gsZZzrn
	xCmFAdiOGxE2lQwxso3lG8dG6Nxr7NzwwkmO+EjFgEKM+mN6cVyHirkqKoD+BkAb4F5NNCqdID9
	mS7IwyWCTDlZe2DkupPP/OpZuCZawGssC/8fY82ONkE/LPVe+rwMCdfAq1ms3BQHF5VSD
X-Gm-Gg: AZuq6aILP8oTm/tFgEvkXBdHMlSjtZIaFyGu+fRxEECgcXZZwKpCPXV8s+rZSeOSz1+
	S/clQqFT/4TICROGwQp+UnxAsPZiJqbXLhj0LfGpdVCnzKmlLRvjszGjJPVlj0lsCYH/u5ploDZ
	1/Tvssy3cXqHerTnqqvlkKiDXRpt0x1UIve4wsH9LVpMQAcHIEvd5XWn3/kIb4DPNKYs1t2WHOJ
	SF82GbOmKGMBYYsPPXV7bDY3o9EitX1eKpYLVlc02IS94l7vqb/8aw/b3F6kxcObXdHN+CbNnPW
	xdh7jgvpkS53iHqdYfY8lhtJwUKfWf0OqOad15oDp09WRKM8FAKWOUjf9sxy94aNusvPnePx54g
	z/6eYTOGl+d3hP15hYKogExEuJQajHalK0PM15grPsKcVELXLjx7m
X-Received: by 2002:a05:620a:4482:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cb8ca65b4dmr912583185a.41.1771837589409;
        Mon, 23 Feb 2026 01:06:29 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cb8ca65b4dmr912581385a.41.1771837588893;
        Mon, 23 Feb 2026 01:06:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:55 +0100
Subject: [PATCH v2 09/12] i2c: highlander: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-9-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWDFhQnaic3O9OJ+7xBky9bkVsKM8N71b8pq8QsprJ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh48z3BkboibmH1Wm5hR9cELzIQeY9gBcPhA
 XDQCpZC/W+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeAAKCRAFnS7L/zaE
 w5AqEACIw7psY67E89Lspf3feMBKtg+xFiREP0W0czKsXM3vtcIITAdfDI0jRpTu+aSyUewPp8e
 KJjez4TUVKV4nNiXmDwJi6M0UCUA2V0QahL6WJcw8/BPQ4QAtZ5ir3HMD+4CJcjluUY4097hDSW
 9Fjpdee8Oicueou0j8qlVeYbmqHNCb+/aku3i5mGfJFeSHX3Sh60fbMYmi5uaAcbhn0OEMjtCGK
 iYfm5S3PwpM7an8haNt8+gCbEPClUjHACQI0RK7bNA0opZKywpaqgqa5OvgQrItTa3Gd85FeVOC
 U+O7MFzkqK6DkA15t2vFJe0hZTFHqa74NaCp0MPtS/URE21WVkveFwKET2v7dqSBnqEqIEpTW0v
 WgpJAKSmWavJKBTxjzWJ2hXl6I2IgRFPIMMlmRdaMeE9Cp0KbCRiRyu1UEG9kVDAw5OcXXT1s2U
 DL3/nMpneTmDfrA2HNG2/oHfwCJF7ENgimO7iaKhQswzkOhHIbTn76bOAAdIFqzi7XbUH5Ktbaf
 tB4cMeyLTOEejdtwROxxpdHvybDHpn8kh2/7AWTTmE7AclO1UdFmJEyUuNbfXNkOLhiYZaorNLq
 9mCbs7DTVeOoyTV5D1ciWuVlGFqIb/K3gk9dpvSy/IJQeq2uiO+zUBj5PvrTfNYk6LU0agk5YME
 Pcp5SAOWlKAS3FQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX+isaB5lSBvfP
 LhYFvVEaSAbwYbsCWkCyWl681uwQxQ9oz1mtiMr3SNgXiEg2150o/R3fJvT1S2kRkABwpSAuh3I
 WE97oGUfUvr+CzF7vjeIyWngPDYfyG+Op/ShFIlXd+kgJcINLQ0QNc7yS9RvRDmx4Y1xbVf3+MC
 53Nxv5tRiK+y7FEVwNwt8eL+TqyBog1oW3NlzuqBA4Qy5TnoV/wt8Y3Jn2pmls9fDA2d1sk8Aup
 4ctp0VImKqUkvp8nqMBQ6ydNzBB802k1AeVBPvDm6ozRSMv7Ug0s+/LjrS6Exu7CrEW9ZEk+N9m
 fRJvFSmtOODW0S6K+qo7EOh+VnOFP0pIg2I5Xic99ATImRX53ScvevPELMRgnZZB8bEkgjDSu20
 eppMlxXl3lHHOl0F9kXaooq9ScRj5PsMJI1hdPBaVSEYB/7q1own7W3OKr1REkeJq22UOj0VjCG
 UEqqfcCrdPXCtyN4+zA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1896 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: UUWSydLo8Zeoy6RA4nqs6yoSqzsyLAl1
X-Proofpoint-ORIG-GUID: UUWSydLo8Zeoy6RA4nqs6yoSqzsyLAl1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93618-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 0A16F1739EB
X-Rspamd-Action: no action

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index a53b4bb7c3c0487ea028453cca6d09f6e4a993a3..ff30286efaf8df2895cd772fc554aabb85c5a998 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -404,7 +404,7 @@ static int highlander_i2c_probe(struct platform_device *pdev)
 	adap->class = I2C_CLASS_HWMON;
 	strscpy(adap->name, "HL FPGA I2C adapter", sizeof(adap->name));
 	adap->algo = &highlander_i2c_algo;
-	adap->dev.parent = &pdev->dev;
+	adap->parent = &pdev->dev;
 	adap->nr = pdev->id;
 
 	/*

-- 
2.47.3


