Return-Path: <linux-arm-msm+bounces-101220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V62VBjKQzGk7UAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:25:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9921374526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05B6B30EA2A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2063806BE;
	Wed,  1 Apr 2026 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntHbCXBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PADReSqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DC63806AC
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013778; cv=none; b=EsNVEsFhzi93+qXSRAecHq5Gfg87o6/rlgcBfp0+lEE82mcAUocJcJ8ZOsoxUirukbfQRuURshXpCFmxEmKoTRfahse6o10ek0W3oi8JDdBLdCgl8cyZiVRlKb2fFM3KuaTIUiyc0UBVqgNXs3PjlsqBTFATwf9KYznhV6lYJq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013778; c=relaxed/simple;
	bh=AgZTO6aRHtXsJJ51b58atkaG86Hg2Z74yGqzC8W+3Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MCPQ7rrijHtCQe9Yr+CbBbxUtuOFdtSIDmrEkeSWbn15T9vvyL5Ustea6whi8ArJTq3VO3iubPOsoMdG0zZSmbEHpJDdv4FRXpkOFj8hlWb3RVGRryqewEMTspyTo3j1M1izG6N5FZm3BOpoTUXxXP4t90KzjVuv28/3tWV0QOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntHbCXBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PADReSqG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VMnKxC639248
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWTWwYM0qBbQia5ARwsWFJuxCekBwDllIQfGmysiKb8=; b=ntHbCXBRicJ/yuzy
	h+BYAzKqPwC5vyQiJfVedgazbaOIkDll83ey1zj5rahoWJ2KNmiWL9jD+SnXpOiW
	OFRaHR7B57YZfuNcv3WZHERws9i44sk5ZooI9dTNURci+7+albZSFjkgVgcE0rEL
	vRD/OJFXSyeq8b8DNb0Zgx13Z2tSiFWoXNoglypS9q2LJUKEhvsyIAArYCzensx0
	pOH8/Ew5xOkdjNpQRP9B4FgLI/QcOt/5oLQPvI1uiagB2q0aNcLBLAUGi8lKeyjz
	EWm1KzteaHRHxQTA8PiaFiq50URyLgcRGH7efBs3ftqJSw5flYKTFqiUmXOu1Z/U
	Nt8Nsg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2au1ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:22:54 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d7f23bd25bso2995244a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013774; x=1775618574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWTWwYM0qBbQia5ARwsWFJuxCekBwDllIQfGmysiKb8=;
        b=PADReSqGzJiAqKwhCQUHyLkVaB2fJRUns+/vzcxRdPZxvJWdYoi7JSO/4gRhJ1jxLL
         L/wAgXrm0NG19Dj/JnjTsyvaoAGSlgoGKNg8UrKjZc/I1fISnZ0blwRetMG1Ic1TnKxO
         isDBinpgyNwTWFFxSlUlzJs+3iMHRAIrlm+jc1oIgBYuKprlTNsh8stWiUT57fkYhyo1
         s0QUTF1uxqkBPzxkLK62jJN44Umn9TSyTf6smR6Uj1r5MgE6Q+WQ929dUIVEd7sLbME9
         GfpXl6gzP6QUuxEiKpJ9ORFMjrAqCiGmld9MTTS3Wz5PTPAelMVX/B3w+tJDnvtg9qMb
         zZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013774; x=1775618574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWTWwYM0qBbQia5ARwsWFJuxCekBwDllIQfGmysiKb8=;
        b=HFYkhm1qucRHhOdrvHWB9+8oj311p4ZpVr72L1c/U0tDmtyo9O1QZR/uyTrdR3lMZ6
         sRItUkLc4KjjC4/oQ8GQLyEOAg8izWz9eLc3b4Ln1c9E73uxmT8DObyjXnRzPCgfxyxa
         WPtDjD7Bx5Z7+9f4Z6tEbFdO55JZPLhtjnmGzRURHEomglz0A8hZprK4GupE0ThJc67i
         zUddkGE3Gqm/o1LNod/c6Bi77xh829tbg6FGp6xi1s8jz7q0tzCs7GlGYeVJYMJBEJ/0
         UawTqlxu831oGtUmrGFIRKDZGpFLKl+QXk90oIvAdw3/x3KBOZmVmSVi8mIucTrv+I8w
         KC2w==
X-Gm-Message-State: AOJu0Ywpi7fBjBfbLhqQ3jeofL3esJzxxMMJF9jR0qeYr9X4S46c0v6K
	ozd7NuflQUi/C48WpJF+nv0I054RzW5A1JEoKFg+FbN0aTXyAVe+EApDx+8XlExWD1o2aKoaGNF
	YkgFe8/ZVZ2zDAUHGTxJJVEBKFdQB7MqdwegLaYy4c5pCti1TTpLoSJohg3T3SXBlue88
X-Gm-Gg: ATEYQzwJyHh/5v76X61HKjs0W9XV7YV45GpL+EPDmaFaUMm7C+5REvCLeecxKbkf3vQ
	7kGxM289Z6uAfQjjULQO73U9P6EqE4HcaMqh6xUw7W2rSlYMhUR5nZSBWW4NFEp97aPSxMLZdSw
	C3E80a7QOXg2kMs2hnY3+rzSwxSPjrTU4Z+7Vby/OqYbcShu4yFl/2eGI3Er5QVWxelSn95WFHP
	reFK7DZlJsDOR9grM2Z0GKoOz1k5Mpd6bPdkktP15yw7syAaGhc1wEPPQk6h654k0ZJEONEyVpM
	iHkc3kqDfbBE860T8oY+1NGVT+j1Ai87BeI5LEpajZktasiy43YJ17Nc1pt0Bfq0PbpTllZ96Ue
	rBsxqyt/o1Texb29CaiKspBP3dr2Hv85Y2IxyXl2BhMk=
X-Received: by 2002:a05:6830:1dba:b0:7d7:cc54:7792 with SMTP id 46e09a7af769-7da37502951mr2400267a34.8.1775013774135;
        Tue, 31 Mar 2026 20:22:54 -0700 (PDT)
X-Received: by 2002:a05:6830:1dba:b0:7d7:cc54:7792 with SMTP id 46e09a7af769-7da37502951mr2400256a34.8.1775013773739;
        Tue, 31 Mar 2026 20:22:53 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:53 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:48 -0500
Subject: [PATCH v2 6/7] slimbus: qcom-ngd-ctrl: Balance pm_runtime
 enablement for NGD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-6-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=AgZTO6aRHtXsJJ51b58atkaG86Hg2Z74yGqzC8W+3Jg=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HnIvfopxK1sVdpIf6pktTc98fDuKYqe472
 mwdkDFj4eGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWrxQ/+J5oBrt0GAHEY+UjOAjVosP5R+jeQH94U0b5BBvI
 XoDvTouPhKNkvSXnCkGV+KDkiWdflE6Nayy70/2D6/V1XxeAQaDCIflu+jwEUwA6DMpqKP/3/nD
 Zo/FEtKjYiDh0kaSHQzi/uI8F9xC9TDGMihTMu24LsCzeOFoIFDZWZ63OBIlGBzmgS1D0HwKaPH
 tVi+7vOFCRvYrxj+5JkVyNsrqzj+uo3ai8choSmqwrEVEoPkXPKfZ4nHfxsfFwJpgftdK4MrQq/
 kqazxv7Mkp2AYf7KzeTHbrAeQ7VL4RpXJXnKa3XU43SRVNgEf4AJPiZcwgS3dnzWpAtfds3kP1v
 ayuo+dzos8C37/2DRMTeSuxTLiqhCRlqm33huCP0Vs01Tz7Kly2CwtFbfh4BHT6kbEyXt/xuU7P
 nyqpLYTAadVjVYyb8rubfQs1BPw1MRyvmarnlQjMLuP9H838MwuKV44yH+fNfUi0y1O7vqoJw3o
 zq0PXbvY5rjRqGairqwyB5dAGiRyDs3rS2Iu4otaQ6jgKxhb0tLx44M0VzhXjLwC5dzDEp1Qj7Y
 PGQAQK4sQwxBmep0q5BNFONoLm//1OdtalmtJthHwzVo1nSvkJ4qEARLwg9ELcGigWDBxLlnZqJ
 gJAmbyYueat0Ly3SAByJhdA0fGHP6uXmHE6so00VD+WE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX0ff1vthgsjz0
 ZefbnI+E6eroNfeYLL5JwzPGkEIgiZjRq3WPYOc/+5frk+Y3XqZxQvuNY7dVlPGYv679AzlnBH9
 aNB+qFULJgftReUIbDBS7S6Dz/CkrK+ANOO6/KFUrT9KQey6adOUHdpTts4Jxm5K3nmnf8v89o+
 8iszOijMqrGtJetaYdAPlIOEyIsgKF68Ob0wbK++F/bvjNqc0n0RfyLO61PXaUHCwb2b15slpVX
 ILiLoJAbxewGCWwJYeu6G0OmX59CkQsW+U9wHjuv19pqXvbNiTkCkV68hj8sUemrWvKQjqf8+ok
 +Sg2vxJ7aDJOlUMdIqizA58l7pybQaJHAkyiK+KbdopHg6qTF/kpcIR2FxcHlo9SJD3EynKs4mq
 Zz2xJHdulke4dVAwJ3mlsgkIAU9mdkgWi5aVhn+dHzCelLCv4nKIKzrF5YBMD2VkerzX4YM2liG
 txEXzH82OuLNccMPMOg==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69cc8f8e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v7zRpcr-n2crOtZbBgkA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: xU_Qy_0wjDV4EF6BN105hmZHFPPhxj43
X-Proofpoint-ORIG-GUID: xU_Qy_0wjDV4EF6BN105hmZHFPPhxj43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101220-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9921374526
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pm_runtime_enable() and pm_runtime_use_autosuspend() calls are
supposed to be balanced on exit, add these calls.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index ca5c1c00fad163c69672db3b37bf225490e7fb96..afd2171d3be2c4c19994e9ebedc63dedfba899e0 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1582,8 +1582,11 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_noresume(dev);
 	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
+		pm_runtime_dont_use_autosuspend(dev);
+		pm_runtime_disable(dev);
+	}
 
 	return ret;
 }
@@ -1696,6 +1699,7 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);

-- 
2.51.0


