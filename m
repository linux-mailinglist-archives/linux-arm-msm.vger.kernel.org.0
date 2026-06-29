Return-Path: <linux-arm-msm+bounces-114954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJfvAdtCQmrc2wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:03:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A26386D899A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:03:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FpkTkdW9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ip0OE1Gl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114954-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114954-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E152302000D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCF03FFFAB;
	Mon, 29 Jun 2026 10:01:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F543FFF80
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727310; cv=none; b=q4YWYMhttnUbYMBCb3XFXjkPy+NHp/4rwtbf828vbv5vr6UL9d+oXqbp6/jVfmgv0/ZIDoLadrO+Y+QpPvl5+oejj2t8s23LNAep16TzX4n9Z3AMivGVcxhOTc1eYx2W40ifJqH3UYheYA9SyazDYIotjzmyDj++iNjoPt4jmPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727310; c=relaxed/simple;
	bh=k97Y8ImiDOSEM/i3DdCydkceZy4j+DJOA/cqgxZHohk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvH/BGZXNKFhSGmQRdfsoQpHM7vOm5ecNDPfv1RKe4qGsoPZpCUDc6dut5WqCS1wL4pxXT+LtvMLRhaolAW+qTDnaran1uN6ResxOoU1ghAJpSzuhZhh7nObHtsoWIzFH1NQyzx2JmIzHwkvYHMuT+iJTAHP6YV+bRiDf3TRjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpkTkdW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ip0OE1Gl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T9n8tk2529411
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dak13vsaTB1dmsrIHeCt+zMpkHOZXt2RO0KMkS+FxIk=; b=FpkTkdW94q5lBN3g
	dkdN4jE77PcLbI4Qf53nV3+FAUoXtJE6R79k1lnsg0zWmc5sHC6uDAwk4ykMGyax
	pmCEmOKnHieLa+kvngcD9R2fRnAVSel6Q0y8bX/f1WsrWIgulXVJy6n0BSaNkD3/
	xPkFfwoj20VBVPdzgc6lSivn828PnQ73hvMncO6qjVO3gK+yhvaJcxfBDFAL2P5P
	vUCXPP+Txt2gzygMvb2UOw6pQL/jhC5RwJrZYqokcEKhvoAf4/o3WsU3qA3oDC7c
	9rQj1jMs1tfrgrJaLGqdKM9yokDBN5SU9oh/vpXOJUI50MovpOxOOq2rxJw/Zv7/
	qSWApw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr1m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:47 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48f680bda84so5044027b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727307; x=1783332107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dak13vsaTB1dmsrIHeCt+zMpkHOZXt2RO0KMkS+FxIk=;
        b=ip0OE1Gl4T1G9joh6fefa7FBbU0VQjCIABH3DaItCZ9of2Vh7xEFBF8nfWFu6ou+JP
         1JvAruRN/7ITJbdr0hDyBSIrVNwhsEIhPGi2Khk3npWIbRM5DZAfq2M06GF5/GjpNUWW
         nYCcrGUYuxAcGUuYTknYy2Tn5VEL4DobORF2dqFsUokRU+Gt7K9VsgCyLFvSpp0Uiw+a
         p7AbAQYi4XORA6tzm7uiiXO+gufGwhEiLUWNbfRF40nMVvmrg8f0vH9LQR/ET0/m2CXg
         Opg9IedxwmGtSzEZYNXME3K3TrbG3mdMhKt0CPN+jrgAhgVH5+Lm1V3CRJ5tjPfHQ33R
         WfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727307; x=1783332107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dak13vsaTB1dmsrIHeCt+zMpkHOZXt2RO0KMkS+FxIk=;
        b=aP9yuG8hN8V9WmcxO0P21rzrIvIXE15xSafOQ/NJqWzr15nTO8X7LvamIVEroS8ENm
         Og9apI5gPJ9TDavXfT/Wr3ohfHN2cqfdPbkZcf9XBL2rTzng38C3jBwQVh2FvX1oCL1Z
         uIcxL/havsToXMyA8Bw+UU6vkiVmGVD+eWzSEO+zTh944NM8sHahy2xN9MARrLk38LOS
         uYGuUYaZap5eNGCFa6sEz41ADAwS6Fm2NPUdAkd5B89vuFZPvI0OMs/3V3MDdAMJvWlv
         krvbYXcTvQySDXFTyA+6uAduY6ZX0FqgSnTBtOs3c5Qw4oly7PJqvtwTaZSv8oZesNZI
         YLHg==
X-Forwarded-Encrypted: i=1; AFNElJ/OqxX5TrF6bdh3CZv1+9dalACjkH/Ny//k48af2tDqW6TI4+HZ7poU4MAM12rAbE5VesvXqzKEnNCjfjxt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy13aNeXcYFaeDtVomgydvgg0e34b1VZxt49jxYTOxeCWnuslRJ
	vkVY8qMkNCFq2kZFTG/v0rHmTTN6bQbk5xurzQK6RmIDKc6IaFzU1JGVCkt2FeC/WskW19nBfEb
	hV2sTZEE49JD07PYu6B/c5z8QxxCClG9A8d36KyC4DN3CGukhVqa6nEAEWBxkv+uF59p0
X-Gm-Gg: AfdE7cmDSNzhD6ZaV1xWVTriD6dt+8zggkLnNIMPlcn/hYd2xC6ak1BJoe8dPypGMq2
	k4BNvVGsOXTmX4/98B2mxiv5L+zgz7r9i0hzG+cnB5Ng2CheTikhR7hvqyRNWZLVj5vsCpzzk3G
	htqyCHDNUSTSpJFHNgFXDZ6eVgmeQ8EaS040F21b5tr4aIrQfRcWf1JWLRIVsoJe2LSN7IpTGAT
	PBr9G3vAhJDLFq/hLbJlriGhUk/doZrBXAG+1U7yIiEpwn5aseL4aqEjf038MxUcfd/Rg0seW3R
	aTMrNZRfbBPLbGoYkRXKDGQU6EqzQxmqZsM5SkbKgldYXlolzvMDAbXc3BYHD29olFKEN0Cm7cx
	Kc4vMsXtJs5yd5QZpbaDgemCQ41Mk8RMsA8cxEJSg
X-Received: by 2002:a05:6808:c2a8:b0:486:560d:aa8b with SMTP id 5614622812f47-49217721151mr14163800b6e.26.1782727306936;
        Mon, 29 Jun 2026 03:01:46 -0700 (PDT)
X-Received: by 2002:a05:6808:c2a8:b0:486:560d:aa8b with SMTP id 5614622812f47-49217721151mr14163591b6e.26.1782727301644;
        Mon, 29 Jun 2026 03:01:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:09 +0200
Subject: [PATCH v20 07/14] crypto: qce - Cancel work on device detach
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-7-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k97Y8ImiDOSEM/i3DdCydkceZy4j+DJOA/cqgxZHohk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJu2j4B5iGt3lgZNmZCIOqxBYKHlpUlmdmNK
 obLr78GakmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCbgAKCRAFnS7L/zaE
 w879D/wIIjeWzgU6Mgj8NFmmou09FD8ZwLrlnpBMuNQ6T93B9MmEWJzLggmXvFhz0tK79qStVi7
 RlFA1/40f9ZOVCiE4h5hJTh/8nVw5M1LhbO/ExjeCCtYg1IMpaVWawKSCQX+SuL5b8bqn2A7ZOL
 /fADVqxxeaHHQMnfAE2QYylq7jrwZqoeKnnIEsjJrbn3mvSj7vZrYKX1qLySAQSSvBgycHbVyVC
 jiLWDuToa6BMjh1zxM7/JKiEL+1pWA/EPLbPeiTtQGv6dHAEjov+aZFsldpbMyhM+c4HAZi8yeg
 yebcr1xdDCo2ybpZHTCm30+H2vRIgxJ3lp2/wXk0JCBBel++LtHIJnIZwPqCGa65BCAQC97SvOy
 txKcOpBdCc42/+MaF6qKbiTHoThSsNRRePD91nWsukHoi+NknUEbCJIW5Xmsnyd4otJwucURvW1
 umW9ZwlW6fm1cmhOiqXOeqZ005MhbIlulCbWFYW+dO8m8Fk6KroqlsrNm60g3CfOxNkcJqdCCpN
 P9AIBooZmPNVl8+D3tJLbkKQyxQI8zlwmP1g8sO89KmtQ1j8NPJ9fflrN6ZEeNQYvg6iSK3XD7V
 ldjRIfvRjQrMootA/aeUjlzwf2unZp7y4cLvtO4rQ8M6x8f8JQFfk+Zh6XZ2ayoxqePAMWGWGBJ
 l8GySfJl5GhypWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a42428b cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: y-d1Q6jzIXoCWbj4t-ylSIW4KpKxMhKg
X-Proofpoint-ORIG-GUID: y-d1Q6jzIXoCWbj4t-ylSIW4KpKxMhKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXxhDiTGJRhIiE
 qqLP5xit3MIygVfA8gFB01jTlCaQQrXOq+CzTqHpHQzTynoqZCBsqAPLHIIgqyWRwNcUM5OR9k8
 8Ur+cYl7lVUdYDAiJR7Y6CuAxOOdaBrg8PiQcM2dIotzp9aHUJIp9IMKBwto89MgmW6yjvH4i4q
 Vvncnx7kKWoawcFwzWFXJZtzy/mJiZNxbdFIElFA3zMuUBQraOFL8hSfHOSCiINxw+Udnfc5noB
 2TPi6LRqXrof+Rg+WZMWWze+GPiJueFLkOVxvX5ORpxa6bF+9mCOCYDmJvvCG+sCbbCPLQzax3A
 Lb/ffsEAmZ5j5S48beJ/CPL9nq0a7CgKAKcUfqkRyIg8UHdNUn8ZXsSZ3SHFYw+fyzKGUO8+QwS
 CTJ3ffxQaMF5N2gkUst74MpGlbV8oq8WYHeCVDWFkbzkcX8s7U6T6Ch8H/KPrsw+K7Re3j0xJGy
 HocEcE9ZfZq6N4YwIqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXx0LKwtWdRQBJ
 xUoC1/5UdDgTBt6X1hUAYfblZVVDjJOeiKMX+OlXdWdxLZADp3ZEOsjgrpwfvxr/CzGWZn5wLor
 5A8L4dXv/dxDpzVBpOqDJ74lgN+k+NQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-114954-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: A26386D899A

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated. Make sure we do terminate all
transfers in qce_dma_release() devres action.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 drivers/crypto/qce/dma.c  |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..f671946cf7351cd5f0c319909bafd87e3af701c7 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -186,6 +186,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -227,6 +234,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&qce->done_work, qce_req_done_work);
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	ret = devm_qce_dma_request(qce->dev, &qce->dma);
 	if (ret)
 		return ret;
@@ -239,7 +251,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -13,6 +13,8 @@ static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
 
+	dmaengine_terminate_sync(dma->txchan);
+	dmaengine_terminate_sync(dma->rxchan);
 	dma_release_channel(dma->txchan);
 	dma_release_channel(dma->rxchan);
 	kfree(dma->result_buf);

-- 
2.47.3


