Return-Path: <linux-arm-msm+bounces-99443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC/vJMjHwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:07:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3222FEC1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5596302493C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F92D373BE0;
	Mon, 23 Mar 2026 23:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXX+ujsf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kf7bNDqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F85D38425C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307267; cv=none; b=RFs6SyVSukx/R/SU3uOeDP2RWdVM4CxpNtabCHhxc2jgM+nuXM0+2xvSoFkZfCVQwWVpT9kgDv02BzP95+wLxcy3HycGZoHr0kWRSWgbuXgHFMV8pMYS3d5vDg5Qc4gcMyR3UsqiRbIPhyIYvywDHaCEo/a5Gdsn5+YFCFtdy6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307267; c=relaxed/simple;
	bh=IRc+afU1kt1BdKgFl9NQ3qsq7b7OUxpvAFVhqjkpLOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=at1rpXmmbaWX6QrcbUaTGfBGBqTF369tITQe/F60MQoMy8qMGYJ2tuq4UjIOy5S5dqefbxotkYa34nk3hFLP/zfTTP9clHO561b85OlULhbhNzYi2JNbyMOLptykn+E+2frxVzfTQCkLlWbwgkxIFYm/bx5QWNhwwSOC4NaNauI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXX+ujsf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf7bNDqt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqgx73170992
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wMz0gtfCN8+aZXHhXC2oYwjBCZGOnrCFD8RoJnS9l8=; b=XXX+ujsfynrHA7bu
	IT7wSrlXE/j0X8jK7Qq+z8zlaDG38TRQX0ZzYLBdHvUXiLcK6LhFPFEJCs6PaHKY
	u00G3qTJLia7TpV4QREXvnRqtGjW8njgnAUEDmuhWYMgBknHrovAWGEExgST6W/9
	6Rz38TIpg2D/7Fb5TJilEerqxI1sB9yiCFuEhj6xyzrEpBS6MalfXeG8fbKe5iy8
	fzfV98paAXOMTAArqxP0hbI/KzuKxKeuUjTikghKc3zvW7AFTC3+fEf8hG0cRBiE
	1FYPA8h6mJxWTrtMq+V9qrQodMBkqAJJAP8lF46IBoUG9is3Itlv9WWkeOHUx9t3
	Nw6Q0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r221j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b44f7b7bbso240705421cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307264; x=1774912064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wMz0gtfCN8+aZXHhXC2oYwjBCZGOnrCFD8RoJnS9l8=;
        b=kf7bNDqtllHiC8Meo0XKBnc5bKmU1ocn9MgFZS1ZFJBT808nQwxkghjzXY4jnDa61e
         Ay24ekQ8SWEfvxm9Zj8hEc0vfJoFf/xfwxlr1AsISLHq7zUhe0fkR77N+GfPOntONa13
         +b72+WFFhl7WS68eT2+p9p4QLLRKZuV3FIFMfmQqepMbu8srd0VDu4vQFMd1nnMdECwd
         qyOeaLgur2wpKUkO8xLtht037kMKH53Hd6Fv9mKwNTfdmTLGpoPbRoGkWjd94SzmteGC
         puCrWOSxH5SZwcH0Ep47IulesFK651F2GXSPz0Dd85XArBBH3yXSrpz3e3A+XHF8LgKG
         pMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307264; x=1774912064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/wMz0gtfCN8+aZXHhXC2oYwjBCZGOnrCFD8RoJnS9l8=;
        b=WZ1aLJ95IyioivmJR/1lathkkN8VjcAVH8z1TVoVj85KZ22q8gM+4sRWnRFd2IsYRo
         tECjvM+SC6wsZizxabF7/cMMFI6zb4DELBHGH00zMp3n/o58Svs5G/YA1s5kJZEV6hxI
         BpkK4dM7pU02na6cM50MtmNFCyScW4MrUNygaqqdW4AZSiP2wlkzLsAfwTWDo2cyMCZw
         bHPWJ98Ee2CoC25WT38eWlO9yx1hzzWNQd/QGafen+IEPoRXtvKbUfGbdakSXvwrmW27
         iPNyqSSDFTyMpkcCG0Ii6Sgpx6hu5/zhkOJzqmRDGF7GXibJ5SZkdsME+kVKF0UnuQVR
         1mqQ==
X-Gm-Message-State: AOJu0Ywz5eaYcruhaZadrOyR+ofO18ey8VQxhnv4KmZKm0tWcNu2m5Cq
	I1/CaYNUQwxAKor5Mre3BbL/gDiIlMlfJeLQBHFZxQS3e2+/ps3k01jO6kUhwR189L7LZDxR6MH
	pQ1CbZAAlsiWpA/z68DyCzZdLbZfSZO8421u4tOdp++MDirNegz/7dvCaJxv+IM9s35aC
X-Gm-Gg: ATEYQzyjsdztvXElzgFzvkZskFynP62W6/uRoXj4ERmWqjwSAtoqfTN5hpHOP6h4JzY
	J7Wj9NxxGCkHYQjWBtCKvcO1VSJePStgxEKp/af7gAgl9T++a621oIrogf8sZ/GoQ/aRKG8iSNv
	ZxBPr7eC0WcMn84PKJ0lMbzYwDV7tc6gKGkGd4fLUk/dGLZtscwvMWwMknHdTtK3DVTHQqhjZnO
	lT1LkiHnkmMKruDQXFYB7U2h5d1OC5lHH8QniueOnlRTYy38sdnmFL98zhEfggRjIeqa8MEa7gU
	6dOxHfASaVfluQYRWvp/80nrfQhQ3fB8pw1sSPe6HhLa7/4JTk6KXctcXRLW5ke3/5EFZC80ODG
	5E/nS/3lRhqJOGLjTlQdPgbYfJ21gBX0N5B9yhkrA1YLjv1NLzecaU/VmcaftwskXrujP9os8uF
	g2Bx2EDtsYklM5zkOkFqg9cTuO+NCtG+D5ovA=
X-Received: by 2002:a05:622a:1b29:b0:50b:2900:6644 with SMTP id d75a77b69052e-50b37552ea3mr225203801cf.51.1774307264099;
        Mon, 23 Mar 2026 16:07:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1b29:b0:50b:2900:6644 with SMTP id d75a77b69052e-50b37552ea3mr225203361cf.51.1774307263647;
        Mon, 23 Mar 2026 16:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae39dsm2777970e87.36.2026.03.23.16.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:07:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:07:36 +0200
Subject: [PATCH v2 1/3] soc: qcom: ocmem: make the core clock optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ocmem-v2-1-a9daf5bce036@oss.qualcomm.com>
References: <20260324-ocmem-v2-0-a9daf5bce036@oss.qualcomm.com>
In-Reply-To: <20260324-ocmem-v2-0-a9daf5bce036@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IRc+afU1kt1BdKgFl9NQ3qsq7b7OUxpvAFVhqjkpLOI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwce5VWa9Wxvof7IlM2dM9K394zqubihJnOSIu
 8eVR01w2lyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHHuQAKCRCLPIo+Aiko
 1QIRB/0cLF2aSUecn+N+TQPRaaVzl9IkGTxzsYzvGMAfNO/FaDZjonGsWLsIs1q8ww1DulWIJWB
 VMCvQsKOZaMGhgvLlWf8yYZcQwQXR1JP1AeQ9hZvGs9QLb4ECi9Ho9HEWAsroBF/IVzIgikdAB6
 /fUWs+fdiQVUK5zAEK8WTJVSswD/9JEanwvQxWVJUTtAHB+5R7QuBHvQpy+xrOyS+ykvUzFz9+J
 iFPxkmd3baqUpfATyBA3tR94Xoo0SotKOXP13IQyUwLp47aAuWWHJGrmd3RSF5vVI5Rnjrpa4n0
 +7iQixkV7VkW10DQT/Y8Ao3VUDTtswDMuVWe/Iy7c4Dba90E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1c7c0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=xyGvnGGLPPhhD2GXcrEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: HvuEgsv7PKlRTFtONWrnRX73vxc9Ejct
X-Proofpoint-ORIG-GUID: HvuEgsv7PKlRTFtONWrnRX73vxc9Ejct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MSBTYWx0ZWRfX6hp849CqOOdx
 +1ble2vlt+RWaIoTqKC94jYHA90DQ6Sits6iHoCjq+s6A+6rwhmDOcyCmDun0bqXXCtcAMxygG6
 BlSkYF8fc+FNOF3EK2T/ffLoIBGCTfJEh+WuasOHDkwLqROxJdAE5D2GjYmSiLK3c/u+Tw8VNN2
 A4BuYwyit7hJCL6xcYNPUTvb6iwfc3GXDxqhURbRgyz0dUw8iC8f7CPOUuTa9zqAn+rdTo7GKQa
 2v8cZ4j9LLPrVTXeQIiFVt5ePmi5opMnysAUui8FFzm6NGBE4e2t6CTSPOG4rHU8AxpvB3VzOqG
 /tVKjmWsAMl4k4vjebipBFYFfpZK0BTqHryh8F1GFDDrKcnQ18CS+Ua5Ue2TgNScDzP/YV1wK23
 iQf2zNNEUtf+PKfFv0YDqcYXEdyUoar9bPy1PeORh37ASujTGNEKCbLmrZ036AJ65sCGAVV/dHm
 HlqNpGJ1PQSDBe5zqqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230171
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99443-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A3222FEC1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OCMEM's core clock (aka RPM bus 2 clock) is being handled internally by
the interconnect driver. Corresponding clock has been dropped from the
SMD RPM clock driver. The users of the ocmem will vote on the ocmemnoc
interconnect paths, making sure that ocmem is on. Make the clock
optional, keeping it for compatibility with older DT.

Fixes: d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus clocks")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ocmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index 6a23f18b0281..dd46bb14b7be 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -308,7 +308,7 @@ static int ocmem_dev_probe(struct platform_device *pdev)
 	ocmem->dev = dev;
 	ocmem->config = device_get_match_data(dev);
 
-	ocmem->core_clk = devm_clk_get(dev, "core");
+	ocmem->core_clk = devm_clk_get_optional(dev, "core");
 	if (IS_ERR(ocmem->core_clk))
 		return dev_err_probe(dev, PTR_ERR(ocmem->core_clk),
 				     "Unable to get core clock\n");

-- 
2.47.3


