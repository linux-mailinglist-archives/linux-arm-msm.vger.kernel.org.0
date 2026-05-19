Return-Path: <linux-arm-msm+bounces-108521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CcKNTVlDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:27:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BD57F9E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED3D6311598B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F223A3ED3B8;
	Tue, 19 May 2026 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUnR4W0z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhXk+8F2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B47348C72
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196707; cv=none; b=Hz+kjK0rh3ZC+wo00XUnElTKAQLwve/X7IpWbT6M7v0OM485+YFIFc8CioI0K8It58vKhUopXy11OOGX20RPP7musKlkIKmYlNDJyRXMuNolzKtrqbWBcOjNkgg/QsFqM0L3zuma2dcbB/+ODXkzN07zjHXvRbl41mTHXmw1zDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196707; c=relaxed/simple;
	bh=5ItlPbuBhP65nUTpXCo9dRl8GJjRN3Zgl/exx3Ev5Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzqIEsYnyms/NqeOHqIRqrqGnkjgtMkyWk4rOfTTO2bsFB5IaMpWReAMJmBcQ6J5reUEwS1D+J10Fx/RDf+Vdmy/AFbrwJmpqox14b9S6Ybq5YZvr3aHXGdhiYbSFqw2e/XcEED6lYHLKTUbqN+0MpJTCTjKx8C5IQQdYHllbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUnR4W0z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhXk+8F2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9ll22254433
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25Y3YTCZIMOzZ+yX4mVdRMjdJrxXuFwJ3ZTHD7azqTY=; b=nUnR4W0zT4THAyDA
	BO5PEYk5i36DYPXVfbCQORPC2a1zrZ98GupBpJZPlAuucFGO1xwgnYBoENeGd23Z
	bJiXwvReW7Ka2T/bIJ3ci8V2vsf3a8Razr/6jV6H03Eupsz8ajwdjnIc6w3aW94E
	QEKoIyIoiTB+f20kRkx3cllmfRmPszNX0fuXnc5jKrts2VdJwHBn1RukFUZx2/h7
	lkmrnHKRSuUNvUTyCsFRJCu+8sjYBYr2jGXH0b1W4DqPPEvfWd/iMi9me9gOjy1j
	DRyX3uX99ztgFvqFhbnkjoYLE2T1DVZ0y+Kf1xicV9VtiRXTZsuOmfo+WsSfc2Uk
	KGeZng==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87t1gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:23 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95862466f3cso820067241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196703; x=1779801503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25Y3YTCZIMOzZ+yX4mVdRMjdJrxXuFwJ3ZTHD7azqTY=;
        b=HhXk+8F2xI+OmpXuHWtB5Sp5e3gV7xjsbWL1sqodI5G2up5QPaQQ8uwUotw/vH35R+
         IDq9lqIs9eSCpQhMdyWWCN6qgr5cuX/g8p10MeBERDe6Kgt11q/WqQa5IRqTLRK/d/Ta
         yiTmuLa6nf17vKNZWGseI51JrYiPn7T4j2XMDVDc5IVrJy2QqvSwd+ppOY3Gnd8/k+Q/
         6dX4DGT6P3MAS0PQO7LnkUy9SKfrLbmObNDvO2EwCk2lIRlZM+G/mTYVqYfq/nmVz5qQ
         mqP5QfE76HLuEf0EykYmV3gin/160YDkdxLt2PskxxN89TKTxtz+bqoQKqE5bGpx2LsS
         E8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196703; x=1779801503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25Y3YTCZIMOzZ+yX4mVdRMjdJrxXuFwJ3ZTHD7azqTY=;
        b=FwSvLco2KvSM7RvyPVlK1YAt2+v3R0niw8IiC7mfhhOR0jsDOrVVOXD3UZ/EiTquW3
         ICTLGoM2+ULX2XKuPM54LVPGluAQ1BMa/Mprc+kC19SQP7koq20cu9pwMfw8f/MDsf/r
         TrVSg8mSHuA+C50RfkU4HrTfvcVQ8rOmqNjaYJSDZgvkJhaUHSPmPgAPxMtEY89KkKp5
         l1RziDcvdw05vhqTh40AM+9kSO1x+rwt86A7Fu/v4bjQD1tqeKyn2cdXsqb1UlyGhACX
         g0Gp+KGS8vwGsccDd1X0+5ZYm5NefqFRS+/3cACQP/2GN+ooHBcAsJhP0GPQB1N6uWg7
         JpPA==
X-Forwarded-Encrypted: i=1; AFNElJ/xileC8TfPZ9ZPX3bHZthoWYyAZHOt2kDJQF2SkGoHTDgLlxANRcZy9nIC1wOMhw8kgqzRxiNSvvZaUxd6@vger.kernel.org
X-Gm-Message-State: AOJu0YxfYlUSmRC/HYRbR/2tLix2/73f8ckkEdyG5BpnNCYkTYLDTseB
	Q1LHT742nK17RsaSL+LJkElMUdkbsekm4O9M9C97WXokWe5er4BVsG50OPlvkr2E1Y5+wzc6tZx
	2Ua968XKsmwiNfdKeH7fp0KmZ9qRfAxb2iNzMUQNL9mAuajDPAOzhFaEAY8HyyZEiy6eW
X-Gm-Gg: Acq92OHv6g113DObb4+iEKMY268fHa0sAq4VY1Ire6U8Ryi3XpuhsdMfYDjjzYhA3v9
	BWkj/Wt4sHxrJfNM+I64IEo8TdtpzeIBs5JQIc1uMiExpBLV/PUimMOVHSXb+YOdQ9EtaPNY26z
	VRJ01Pcjf1QvJctwD40H64SsHdM7sAfCoLzDTFLIf2Rps3wEkLAV5+rbPaml3gE9T06/28+DCUO
	Jg/vDU0X2PZIau5KVbjU7N+bXL9lc4WbBgNt2iKsYz23CrrMU2BJ27t8wQTAA/C4BbPQKMrkDJO
	6dMoEH6Tp0U4FlJuh5M5lbo6Q6Mw34UQt7qcChf/ggdEh2YqK6WZx1N3xSkeC/1MmPqYuEaHPv8
	nMEpdKSXdydYQi1P8Y+fQjmxhF0c06NwgtBmqNpAcN2dKcbCna68=
X-Received: by 2002:a05:6122:e247:b0:56c:ce0b:fecd with SMTP id 71dfb90a1353d-5760c09441bmr9346591e0c.12.1779196703128;
        Tue, 19 May 2026 06:18:23 -0700 (PDT)
X-Received: by 2002:a05:6122:e247:b0:56c:ce0b:fecd with SMTP id 71dfb90a1353d-5760c09441bmr9346525e0c.12.1779196702531;
        Tue, 19 May 2026 06:18:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:49 +0200
Subject: [PATCH v17 07/14] crypto: qce - Cancel work on device detach
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-7-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5ItlPbuBhP65nUTpXCo9dRl8GJjRN3Zgl/exx3Ev5Lc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMI2QVh4QfndgsCdNJD5n4VcvO8wt8Q5d+K/
 ZH44cIVyrCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCAAKCRAFnS7L/zaE
 w7SCD/4naK6qeLv2LqSaYlys+AC2IFPuiySUYpicSD14elbykLxS88aNE36/HjJDfx2KdgTGz2E
 6lDBGA02ogSf8A4sS02QdH39yDnTbC2VmgGbksHM7AysDFjO+oeKyayaE5ouP6zqjLUqYgD27Py
 x+c6BVd7KOsHWvLXGFWqBw3uz76d769SzY71UOkdLG349OLlqXANFldeuBs+YHoNao8cFvu4rCM
 4QOwsctgpNtl2mBSL2dP6TQasIBVn35viGQgC1JR6GuDo6nV/1gasDUumnZT6gy/dA/vPbcTkPq
 RtltJxBhOWYX51fF5oHbJDQ1HDHGyq4eMzKbEACEPx3JvJIvo1HJ3xhfa21JFKemU0EqhKW92pX
 ao2iuSFx84uqCIHUAjYBsg++6WdkxeMmnsqL15nxvFhm/esX+gC9zo32q7MhweFuE5LkAZlSdfz
 OSw8pLIsXi4SBvnU05aOt9TogVAKm/1LO+GSH4PNvyrWNjb7jpGpslYy/Y29bK/mls72DZY1HPo
 Ct+K2s9AFrKoX4hwE+SJDRt2ypAWlx4mkEwauNq4/8I4ikevdgQSvT6vXb259DAQMSjM/GAuVI+
 R1m68oimVXXb9U9tkbJC445i/80bOCPcc69OGI/4yc6wcjQwyQYz8JP9t5cQjraEqr1lIaMiS1C
 C5UV0W5yxOvAVBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: O8ZeuFLnoWLvA3Sb6AYwXRdRLQwdSXMQ
X-Proofpoint-ORIG-GUID: O8ZeuFLnoWLvA3Sb6AYwXRdRLQwdSXMQ
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c631f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=Jr3KVaxKR4ukTOMpvgYA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXwwFmuUsS9ufO
 MWUZ+S6mMQpXheayREl9jT2el2ZT00TOu8RGwmy01pOJVoq45mgMUASN1mjjZBGCkbN5QrQE4DI
 eOiZUjd49lzMgP7nMfkoT+Wj9SxqsHGhXN2boCqziLucgLbWGne6kPBaXigkgQRTohMCBLt9pLJ
 YP/2dR8C0FrFFtT5rcGgf4dMkaNgsdelioS+LoFysEZ3NMy230hWeEI5/iY98gH+48T3fWmUtcL
 frMboYg6peZmz5dOW4+qdPyY72W0qIE2jXPQoZdqU3SvC+5mVUD+c75yCru9LftOsaq4r3jkoYp
 g5pC4fRnahjAUKolUAvJPiRa6ikW6cJrT1N0r1gXLt9e75Dm+74Ow68KqLblWe1jX8kux9ukOdm
 amDb1j2uzDZo824X14lDh1FgrVdshOgGgQeaKNewUwFsYz+IEukCciVm7a8oNrvNLYEo9OOXu+G
 ZQZpwYSp4ZcsMf0Gm+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108521-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C0BD57F9E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..e82fc862c74b20c34ea5abd6c0b98b71089a3fee 100644
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
@@ -240,6 +247,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 		return ret;
 
 	INIT_WORK(&qce->done_work, qce_req_done_work);
+
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;

-- 
2.47.3


