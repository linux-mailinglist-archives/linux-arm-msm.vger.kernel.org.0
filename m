Return-Path: <linux-arm-msm+bounces-104658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF/WFy0q72n98gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:19:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 608EA46FC39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B58703016B3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C813B3C1D;
	Mon, 27 Apr 2026 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAkSHaoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bn8HnrUf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8A63B0AE6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281376; cv=none; b=dx5Jd6UQDPuSEgPUJp8TWJdaKWJb8MKTFKygv39QHH5u5/23fkP+FDeEkLcG8apXLMjn7mIoSlneh7R9+7TE3oBtALaLgmJ1znGBnLVyj5gI7ISFhcjfeCZ/WTN1ErfrEaTcQqjC60p05a80Lkdq/kOKisw0pY9WDXGxdmJCXwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281376; c=relaxed/simple;
	bh=6dN4XjHr+6OQnOzxmGwMll0VZH7PW0q5aNlxk1E5+Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drdpv36Y0hup1xyRGB7zKdiVl/9iosb58RAkbiU+Krh/S1HM5GT/nQTAJdzatkdbNmqLELCBGKtjiDTexgLZKx1B7sm0/XYWs8/8pj0ULbiFDDaL42Lfhi255lvetBjhsSJSRjvwL1fsh5ispn2Pbaj88iEmGGHW037PCxBMTGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAkSHaoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bn8HnrUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAdF665643
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=hAkSHaoWWrtG42B4
	qbWi7IhY0L/EJi+aJJQEhBlOmJpuYrEFq2v7UgspCa3rKn2rRauf14RwP3HcXLgJ
	LPCWa7OSz9e3v93JswbXQYuPjyYsJujlCisQkfr05tByS+GwfD84idOzopF8Ygtg
	zA5euIYM5qEu0zEwAsr1h+NaBECldmfRF5+8b4fwkU5kPY98uy0eTUoO6urNBoM5
	YH3npYr8JdLdvDPKoSpPIAeLw9pYcJfBRLABnfEx0q1KoEHkhataUNr8n0oYf9V+
	Tvd7T4taaVDq31bKv80OXvXf7AM/2DTc4TYGjG1wWcEahQhly0+u/w/HyJYm97oC
	L3Mflg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0kwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so125715081cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281372; x=1777886172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=bn8HnrUf+aoyoQ2GgMx2a14WW3AjQt3jpYcrs/gySEfgl9wovCgXnEb3hWUhIZp1Dv
         5qtwo2sRkjRocir4Ucu5ioELUek62aBNAC/9bnEtcEa9WSqa13+Ndj4UdDhhq3vg8Pbu
         hdMASHM9BrV5FUKi5mw5e6m8Kfqd594kDv+qLLxr8CMbeAyel2rVM/jCFHtXPVxWig5u
         nuiAFvKuPKmFkwihCtmwYPkCJN8FR8aAebTlUA4VO1oUXctiuWLgrAQEUSvXcKRZvxJr
         XLqbLRhtSycEFk47zIqB2IEX6mFJn6LJUbWy5fUlqbxhirJHFfv0ZLk0aAYRY0lqtOLr
         i8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281372; x=1777886172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=D+lrDuvpqGKbilpPqfKM91iUgy38EJdeA+GLSrhBFSEyT1mK5AiJMjmc6EkEGpuoVs
         W8px5rwA2v39WnDcqGmXTOlEeb6tbWYCbleAhoDEAPknnuwt0w7s3Tg4URuBvu0ud97I
         44w1KCGORShFShpKpiQZIBqxF2teeH6wVq9QECqTaFlIYeO8VyGG2XnFSarIj4xO2JaD
         TiTJkc38abROiy2mhGNPld25wgLlLV+06pQ2RC/l03e5FCnOrUjKslxfoRnb8ouMt9j4
         qwjkMOi9cwYColI0bRdTre8JaYXO5Tj/oQdcdcMgYGMDMQCf0c4v4qvyTQoj5wSh+PbM
         UhIA==
X-Forwarded-Encrypted: i=1; AFNElJ90qT1EqBSzI2Mq2bf1VsgIJi22KUpiGtBNc+8dqMok5vMUFOrfNOXy84OAzPZGNqeRrVw/AUy5x01EMZ8i@vger.kernel.org
X-Gm-Message-State: AOJu0YyZQDGjP3RlTq5eK9qAvnmizSJhl6HcFuKnNcEVzJoYU0pijS7V
	RWYPki/QEibO+RkX/5FPezhRrwf1tmOOqNfhMXNusBrYJS+PBAIAQhwBzSx8kKZQHXCsAYqoDX4
	iJdWx5sjyUee1nFB0/Nlg1JaufEj/EVqNu9twr5zMeNvSoEKLnMMaWi8uQ4VSdoC5yiqJ
X-Gm-Gg: AeBDieswdFYHKLiVXI3MfdhNaygs+jR4jYOaLHUkpRvIhMQf5r91ks+3GZnZOvaZPCS
	J7GOeQOc141Qqd+WhPns/vaTjtrqOth53qERI2yxW/GmxlE4UcYZPlvfjdq/RtAxmzjqvqJZVgP
	OhJxtwnKS8cH0CW8Nk0j3ROqtIshE/sx+NHJq7r62BE1bnJChSf41/vBgOCBSDArO7GIBC6KlDk
	/2ae7T4OyKbBQW5BWHnILpSdWRnU2WvGqNUsAC4zlZoDELULuLMoKHmET+sKQeopwxVtXploSHT
	6cnijemwjNDMbLuY8K2UgJ3RHbFwppZ92n9dPcUyzZBf7ptR3Rvxq/mPnucO/WX0bgEMDxBr+5q
	vApw1aEwPbDrWDx6mrevvvXY/WQKyge3RQ2q0SPg7p2FjK822q2JTjvAownI8Yg==
X-Received: by 2002:a05:622a:d14:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50e367b52c5mr443363291cf.37.1777281372474;
        Mon, 27 Apr 2026 02:16:12 -0700 (PDT)
X-Received: by 2002:a05:622a:d14:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50e367b52c5mr443363031cf.37.1777281372055;
        Mon, 27 Apr 2026 02:16:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:40 +0200
Subject: [PATCH v16 07/12] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-7-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylD7u2M2axLouF1vpw9+ltR0S7tpnfX/9Xf+
 +0QcBWiRtaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pQwAKCRAFnS7L/zaE
 w6g+D/0SY9i0K2JU5To3f1gUmDIN2vAiSXf7FHzH5Su/kfdOHiflT8xHNWcRk3kh6l2yplYk1In
 vVrQGhhM5rJNpQlEr0XXq24SW2v18VB0vYp7UGe7tV2fPFon4FQsE5eLGXmbIi5TeeyqilnIAiH
 AaetOOeZW/jQsnwNlLXmBQRD9dNgzi5k+u98QO/ZOes9obW+wYfH7NrIfyBrl0lhE3fbyefQsOZ
 DJg3QteyKYLgaJsFkaLP31wXLtY9j7iX8cwMxHvnY006k4qCo2PP4WCgE1iM2hejLkEpKC0WYuA
 xqhJyI11uFCjoMSyXeO7LtEGMHUHbv11DVVUMsPYelwVBtmwYvjjVAd5t2UgYIS/Ijaujxu0qCq
 MXB8cRR452xACMNZerlKkuvPB7GYj9pZyEj6Nzo84M1Xa6gf94VhNofXnY/eZN0tCmn4WZD6F63
 L0m3B3iQjlxP0cDNuV5CDeDWifbfqHjLIxw5uopNiQ2omBw6WILc988JbPiRNHgRXSmmDSgcMMo
 Xt984kq8d+EBEJLg5oR8YiVIor19i95HmO+ROhLJ6YuiAbj05DaZpscSLZdYUk5xcT4FcPATm9m
 wtf7IV8Zkxnl9XEVd95t+yGterS6ZiW7rpW9FGPnsg1QWzZVFfK3PB6DOCz0pJqMZgRXoM0TgoN
 1i+6K0sCgxTH/zg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfXzzajZcKrUY+O
 /nPdHBegw8JezSv/05cjTm20NS8M0nG1GuYKFBHSwCcit53PdbTWm+DhEZ38J3jx0BzjvOuMDE3
 g+0aTJqH/q3dNvZl3EKu85dCZQ1G876D99KjPlJ/d/k68XRJTAd4uXJbCVJ1vRUpn9BHzk53ED+
 l1CwkzZu9FP/dgLNUpo65Q6ngTvkaqL3S69eUj0ozE6Cq4Y7w/pnfO1+qUvEYV8hdXJl5nHoXA4
 /Sp1SFzRl1agH0XjVrSiFb0er0Zsj/ysjbHQBtHxn45A3UpAnaVYZGJcS9/kwPX+BYCI0QePS5V
 9RGU6j3suZjqWOy0IMcmFPtCYBnFpaCB9jddSMNuA5WuChOUVMrmLjcNFnMU7vfX4MUhTt2+Tpp
 6oRtY8PCj7GvCpCOfhiQqXK8RJiv4ikC7E4EbdZkMgfdgqD1s39hEIfE3MJ5gFf9boRHwbfoXf3
 8SMv1sX4lwgPwfyuxnA==
X-Proofpoint-GUID: aRtK7-5AlOe-o_qX4GilJGodJH0ygkKj
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef295d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aRtK7-5AlOe-o_qX4GilJGodJH0ygkKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098
X-Rspamd-Queue-Id: 608EA46FC39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104658-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
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


