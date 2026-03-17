Return-Path: <linux-arm-msm+bounces-98185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBQVFSRguWmrCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:07:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B15342AB75C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B4633155DF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DFA3E276D;
	Tue, 17 Mar 2026 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J37dUWlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eo5XXe/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206803E1225
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756176; cv=none; b=pPHgkRXnd9s4hnB1yJD8lQvWAAYVxVY6botcXRyFUIUe2UwQLdyc675WXjkjVmVzLoi1linzs8GoJAOXJSeNedOW+8Pg9KK0NBR2f5bcjsnhoXXozBdxQ+7yrTKSHypoLmSwdftK6TFZvQWDij94jQbEGhui7+jcuzBLb3jLAWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756176; c=relaxed/simple;
	bh=D/DbbvsYNV6WfJJN+Y3qtsfzsdueJP3Q7cdgK44aCk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeLSedkSVjTk6In2fp0HHLRjIiLxBFgxqHzarGY1W6Plbxc2hsHkXa+PPiqDmmOSUmanNmzmMNqIIMjbWIwhPfVlcjdW4ox3YIY9xc+CPP7QzYOx9bxS7PJk9UAKu4T78xtjjZTgfOfM9tviOj0gcmQ/kznlQE2IF81eDhOVpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J37dUWlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo5XXe/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8A2ap2315163
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=J37dUWlTLsOBHZNw
	6VWyQj6ki0vlQA2P3S0na4xyWdhNPs9TDNzuJJSFoQjH5fBV/QAWAfxiy2E1HFnb
	nZCg51GLiYXD6kHA/6H7g91aXCBDusODHpczTtOz5LgVs2l9UrJo6CGFnAdTM/tG
	gLCPkDyjPQ1NErUhdpw5td/7TX3+ph3DBVdoeRI1tFvVovQFatQGBM92690KJQRW
	hUt4eq4SL8o5318WBT3o75smfaeZ1Obbh+NFSqm120ZJVwCEF4b2KnpV8apFn565
	u/bYwBcOlBCadZk+bmmdQzTuk0D4McN2Akv30CKisYxHRyrz58sa0B6RvvzoT2b6
	R4fjqw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2c57c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:02:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948b41f95deso72315225241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756172; x=1774360972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=Eo5XXe/vi6x5mu0H5msxVvxUNa5flaq7ScWGaqBzitwGTWOICBUMiYuzhM5u79Nf54
         53AAYhRyzhTa4L2VC1v/3ZbV9YO1fxSHwNSiGpodF7L8nw1J03V4DqJF53uEJ5PhJYFa
         AyKs47tI8kcrx+oX0eGvHD7K+UKWWP02U38L0anQUOcV9kNwz3Ef1KXl6lp9fFu+fa3w
         pluxYapaqG+Gd/dDxaaUWHlH1EMfZn2uQY1uWbgEyib7IRJ8dOGQVsH0ghhq8XpPx6T2
         krG9c7Jx3MBh4eIIaCFUeg3B3kKGxekul6iXMe5L9+6TCfhk2JINMSoHGbCNmnChxZcO
         KvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756172; x=1774360972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=U30Hgi6PzeKG76wGcf0kjql3suuZhtvysW0kzldqTDhJBYIRp7kYF0w3LsDhX/tlem
         q3tPx4mTGtGNBanMX04zDzCRegPjOStYM3k718uimHlUyg+WLWufl+2AKSNfPp3CU9rE
         mxfqWEa5+lQ2+d0qIf1EnhtUYBD9HDuEFtQ/i51ahVTX2Qo7hfY9QovOmfeHr0Ygh8YJ
         xObbUuTvsk85P8wZpo3oQkqNexBugEFROwct++fbBLeulpCl+30kQXUl//6CGcol2lj0
         wTR7sBXOQksW1aoM5nzy2sCSCTBJ+JULDN2BqYiGE40LZOAARemWD8wxJ+QVhFL9U+ah
         Qxig==
X-Forwarded-Encrypted: i=1; AJvYcCVuuHygyuIVJ6ngbNEbZUP1/zh2kHjRG1FCk+pLkGFw+9m/emeRcJ8k0/hSORJZkPU/LX2peau6kZib9JgS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlsof7gXqvc4SD4wuGy0WeYGvKktNJO518eUVHFAyTf9C0E6Gx
	xG6hEjKdpEgodESdCgbiPYvw1TLVwCGqnJxwOyFQBH7gcDhVybCQh+Oyyff62NMAMxuRGB9B4Uu
	aI7BkVfTxM39r/dkpFxbmCJlYzyE58BTTmMuzqAlktI9xVSMvM7b/vDX85+p5QI/pUHtM
X-Gm-Gg: ATEYQzxt+GBoNEqILQ0cNWwTLe5gYUARup54z0b+dxg8w53t33+TKsgj98+AZwUFu6n
	5ui1K9WRrzWwdPXziHkUIM8mARhE84XqK/erOYpkKLO2BZo9FtV7V4q/wuRBbSDfDKB+Lt5gdz/
	qNzdJ37/UuSqXLqCv8C2y05G7K9EFgnkUdZjK0ygFwkC7IfFdqw+vziJjaUDuXFNfZh+aD/LO9g
	RnxSzEk8vtcH82DKHsxXFZ0jg3VFfJPWxsuNTRPk3q/Po+hRGiY8yHTkClJU1nZHdqBXUN+ixIo
	AgyevmRUi9UJY4ztHjO4TVSRv2izz1Tws/EgQ5SOtNNndKuKSJWn+a4F7Za2GeujmWow0GQJtm3
	St39JZF6v0ClJ9O5ela0s3jxviF/pJb71sAtLS6lWQFs9Wno7vgAl
X-Received: by 2002:a05:6102:c8e:b0:5ee:a494:1747 with SMTP id ada2fe7eead31-6020e5694e3mr8012694137.36.1773756172435;
        Tue, 17 Mar 2026 07:02:52 -0700 (PDT)
X-Received: by 2002:a05:6102:c8e:b0:5ee:a494:1747 with SMTP id ada2fe7eead31-6020e5694e3mr8012635137.36.1773756171962;
        Tue, 17 Mar 2026 07:02:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:13 +0100
Subject: [PATCH v13 06/12] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-6-0968eb4f8c40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV72seWPix5C5UOqBs0Dp63n1k65CTcZe5fCY
 yykFpDMoe2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable9gAKCRAFnS7L/zaE
 w1sGD/9CfCSpmvX3BBs39L75twLMua/5LB7A1lDSNRSXgMm2cNZmPwLevSoCxGK9J0luJJjmDxb
 1LIQrNrz1Ct7+GrAmR1pdB0DJtPJbOCUsbj5SPE9fH2KY5g8RgpUqJcoOtLHfegLaeE+lhQb5Tf
 T3sEonHjE4xiYMumBoq5KuuHSFZaQiGmUs8OL1lbbhikfsQrFPfej61pf3QlIyfsG2JdhPzfCa1
 4RFS2bmN0836Hup8dj7ixmv7zz/XZtumaqlhKnxO77YdfDwW4Qlwd9KY+DMaaf0rMd0xyrWSdO9
 wYfppuy9Tp/Lk4G2lhCNL8hAmHndDBNJZk14YiZemTB5iQ55aMQ5HmopEj10+eWrgSbXOOV3usN
 QMkBvIU+Bt00I/vdhbrBwVllQBFGy6bMd83nvjnqr56XeCkab4Kalfz6F5WGiEZ2uzsb9Ze/+85
 KUMMRbBAnqaZW+ZHcGUakvUXrDgmF666nFEObqVslKjkAAHhOHr2CbgB1PqpztwsdmzUsWI8a/J
 ncm7bElz4hpt0H2h4N/olme/2OpC72Lsigb+eq/On95ZlxQ8Tp3L+dYYgJXIHLBNCHodD4HWxXf
 j4EyMjgLuliwK2o/VcxyxTrTcc7hCtY+JTkikwyuBzYR7EY3w+nq6Lw23Vpog+LaxmiAooXUJ5h
 PbIDsCpOPR1R7YQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: AHkagNsizSXRe5gtuueZ1g2afN3B601M
X-Proofpoint-GUID: AHkagNsizSXRe5gtuueZ1g2afN3B601M
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b95f0d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX6RYempxumaQ9
 CYujClEn5LoRskkadp/0WZEgxoOEqs3r9uKvRk/0Uoor1iqzVEfrr5l4sX1U8HPQ0EMOnytP4Hz
 v87iWzxhi2IrOlKU4Pf4DpL7bxjFnNeCbt5wgNT7CFKvLqipNgT7P5yLMAhYc+57oFopFlqJ1Lm
 ustYWCx/CGy3DIlEo1tjeWLOec3BjXaxiiLRMO+vzOqhpFrasyqGasLvVGxnHqMJ9FdnmSustI+
 9owlRqW4Tc9/xCfZOGIltzdXcWUWq6lfJJ2shtPy9GaaDh+o6gqVj8Fhg6hYwbauHNBS7aBvfkC
 czASEBJSt9dQmEtrEiWdEcwMxo0V2XIuKkRSY2BhfFyYQZFwDaY5MUzrlk30EZlS1jn6twbHUEu
 QIU0yde7JpCAX3dvsnA2NvBywic89+KGCwjfnWfcRbcGCaBzVXRw7If/lOvu7hkWXULYII+x/VH
 IOhO1hnH7h7uW6S0b/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98185-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B15342AB75C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3


