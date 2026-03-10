Return-Path: <linux-arm-msm+bounces-96488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OruBiyar2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:12:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 763DE245327
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EC81318DBFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4163D3D0C;
	Tue, 10 Mar 2026 04:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSuhjOcr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0Po3PHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C83CCA01
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115765; cv=none; b=QTFTWlS3NT2hdb3hHQqkZCC+EHlKCSiBDHzMRdtCgyDtfRLsUTDWfFUj9eC5oOfOjIYIaeyGyZmRB6JRXSJSQ3NfgUij61NduxhW0rpI2c771xeLapIvk6GYi8NW2JDnMR+bPBrkTtmEQInBbjRSzZ8NV8jvPNeKfoiSy9zepTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115765; c=relaxed/simple;
	bh=h2oKxNLijxlRhbdRVtX8BZAv0v6kEm7MVydl023ItP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UYMdPk/wo+N8qK+k23Q1BMY03kk+Ww852ScJ5BKdkUTq0xAsOvI0vQ9lQq1bQIekMzPgNponMPVEEfkFetvEiAajYlvKQ91z0N+EmjH2Ndcok8t2gjiMNuTXeDz4M+2Y9yi2HKMnHHejye9r0m4un1B4rwXxglFBmlR7MlM44fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSuhjOcr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0Po3PHO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EUWN2373284
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mpp/AuYmqB1cFf9TxqAzMz1PfHGCSXuKCzmcpuL4E/8=; b=NSuhjOcr50+VbsHu
	JWHP7wE3J8O365RvV6BpbliBbkvOeR7pqvR0XNa9w7erip70or0GK4eGYlPZ25DV
	CPosKxFdqCT95GcLR6810nLlWuH6SG/7pY8iX2e8l8EUp5eWOe03UxHSqKynSKQI
	JSESs0BR1QU+XY/LPBC29EZ2vkOq/M2jjFWpRZ+uRg6ziP+KgZI6y9QcBCssO8sM
	XFpglVTmp8Oi7LcO5hEXk3sZOI9iOA5PlUnjGc4x5Ej+PEWi9njhhloAkaY0ir/X
	o4Ija1BPT7qdTUdn4oslCBONIY+dQXT4O6feXq0YMC2nQb0dnk//BWzJaHxlO1Y/
	slTNGQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkjtvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:22 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-417393f319fso11368945fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115762; x=1773720562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mpp/AuYmqB1cFf9TxqAzMz1PfHGCSXuKCzmcpuL4E/8=;
        b=g0Po3PHOOZ9Gb8a+l/ESTynhjVzVOz4xYtqqBHBvF6CBWZjyT74spdcWvZvIYh2DzV
         /Iu0JwcuIE44F17isEevgiP6SeN3yCDMSIHV+NcGYmv4NOMGIrHxDCHlczc/RH5KLcso
         l1eSd3szOg/gR1/aohtOaiuDuKtWLsMyaowiOAdQXHasw0+dHrH5qsWO5P1aYSLwQfpf
         qcqJPNddXhxb5JAIV1+xoq696dZY85q3LA0pZoVUyS476pi0ZLSnMWKua083T4apTffB
         XkzYVA2/eYVhfVH+jNRflBHk3vuNKKcNT/TpfVAyZfWEqIBS1zjdkBC22aHXQWH9fLnY
         oXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115762; x=1773720562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mpp/AuYmqB1cFf9TxqAzMz1PfHGCSXuKCzmcpuL4E/8=;
        b=FT1u6yBzYrtRvCiChKt5X9bwTZIYlVBbv8fbeZa7dcMfkcD1p6CTcg0iJMEcpW2RPE
         K87hL07l58OFVlTBJI+HALNLikfS/B9NLnYP+yZ+sZevlZaAUQjam3K1J3YUXY1w1xbb
         yckVNHMjVr6aVjkfqzfVRPprBnmN7IVMWZKijjc1vS9YDz02I1IcxatRnazE+o5BM256
         Yz0k6newB3v4kMvfiDiI51IYYN2NxQW7D22zU9Lpcpswu2DxtY+J3vw8TxcFvhp+4fQ1
         ME53BQOG9d0P9URKummdabjHi7CeJtjIgb6DANNy1pVQP9TOH1sIaCapzRhkEtWRk2GG
         BdBQ==
X-Gm-Message-State: AOJu0YxIzoZr2k48p4hSAu1C5TWr/kjDszZhjStbXU/Gql873pp+RQfj
	xaAXqfusfx+YpXE0hJgc8Mmt9Y9FaOvuboKHZ4v64j06JxMsG7xLmz4DI8J3hngzox89ICR01LQ
	UUCCCxyck+NQfSzQET/raUTLWX5XyTsuk6wwxOZOHBSDsyygH+SQUYsPZPULn8oRLveop
X-Gm-Gg: ATEYQzxGxxwOs1peJDukIc7Xo8Gst4pIKULaB7NHSbFktT44ZAMd3q3CNlXdiDyEBZz
	3Xv8sWRbKzcJ8kQPseWZsGZvZrpBd6gXnmh0y1fQyEzrab95LUxcAIIvOd+dDHnW2dJjh4qASZ9
	rEM/NKi9+Gyw6Im8byL14UK6XJ6OjkD30l/bvPpEOeJqTeRugRwgVydVSxRFqlAM01bc5t1S7ti
	ZiNHOXnPBZyqEuT8SMLGVBF6sQN6qNXEJab0LsAHegCbD6llkLw5XkaujERsScc5w0bkOL4q0HN
	BbnAhCRAIdr5PUmqdabIBy5Am9GO1+SdB83eL24mun9bo9wkTWGWirKA472mtpmaFhdW7TMcfiY
	Jti4xM49RIOXUY23JLWNfXYS+m5mRcfY1jAjO59zpdfk=
X-Received: by 2002:a05:6870:4e89:b0:417:1534:3c86 with SMTP id 586e51a60fabf-417153495bbmr5126142fac.15.1773115762342;
        Mon, 09 Mar 2026 21:09:22 -0700 (PDT)
X-Received: by 2002:a05:6870:4e89:b0:417:1534:3c86 with SMTP id 586e51a60fabf-417153495bbmr5126126fac.15.1773115761869;
        Mon, 09 Mar 2026 21:09:21 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 23:09:08 -0500
Subject: [PATCH 7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on
 tx_lock/ctrl->lock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-slim-ngd-dev-v1-7-5843e3ed62a3@oss.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
In-Reply-To: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2713;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=h2oKxNLijxlRhbdRVtX8BZAv0v6kEm7MVydl023ItP8=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5lpNWX7vFLIrpfa6+l2c2eP0Ku9eWvHQge+Z
 FG1Wu67ZPqJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWjbxAAlaO0beJsT+uPbh5rqq3vZrOVofupsj6DRP8uD8Z
 XCZKje3vXw6NgoQG4a0DLhNLazfOyacrHarVcvdrvsGZvX/ZJGVTabNZ5QYVkXWrR5eOGRvOGM9
 Avw0oQ6oXo6hdhD/A7WupVSl6EItLRsM6wJ0k6YnmXsjz3qibNcH5Xl6otQOK7sHEEnmljCDM5Z
 mApKUEhD/QqVnZNcAqfPEfcm5zdCeEwNtjkGXm3xae9kHyfRzOl+pmgWyU4pfo8Mic6udemF+ku
 KSL0kmP/TBNCXInYYIkyUk3qYl2jIymHyY2gEQsjRqiHlvNC6X2iTkLZ8/jbU9N44c8TJPj+yfm
 69o4tvekxQcVWe2ZepykzV1j+r94hnxefzeJeUUIJbowt27lka2u2J9SX/Yzi/GajJudKlgWzZ9
 Ufp/6lRANogpjkl9NpKG8YiWa+CCHKR91gym2ksCItPs5SBVGUHBm0Aq6ZTZHy5I6SECct6oCD6
 dW4BhgH6Vbb5nKeO3SeAT+ty4igkMjrdHS8ohc702PhWdNC7bVIk0BR3EDBm08vMpC6MPQemb2a
 BbAD3k/aV/NSiLhpBY1iTb/1Menkha/GUQaTjmnDj5ejlqXUmpBaUTHh87hKkhgZXsB+rr9CT5v
 5d7fFRJ0F3gu3HXeJ4DJgmOekv8wMYNQJ3yTBjxIXFwE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af9973 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YEP7kvCIQ0LacLc3HpEA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: ppaTnUfHl-IDtsTdz666Iir9wx79Bcy0
X-Proofpoint-GUID: ppaTnUfHl-IDtsTdz666Iir9wx79Bcy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX1UDbLWOwXnaN
 pE0yCzHURwvpK3tTEZhN5tdM8a40/FPCLyfeyXWg5WbW6fDrhNuzxn4OVvTsgNQv/tFAR9k8Svd
 rMKK6W5eClqmOPH/RoYZi1LGuJEc2cUqqOgKs89UXzp0PyLgLa93DjxSudXh4tV9EETfhlnBvVO
 dieDtzCyHEfKMFmh5FMsJu6m6gW+sey0RBSEsEHoAo7dB5Ne2nPMuJtZOz3NmEqoCa3Ow5xQgAx
 oBZ5bFZfQD9VMhqzw5756wd/XjsZ7WsO641JIPl4JTHfK32zo36kLvyG3PJrhYoWUlfAJuY4kg7
 cdbcJoMCPXIEWvlk3oi5wSUTs3zdikmNZdOLE9MVOwt27dHpH1dIncG47czDgycixrgPnlZoNfg
 tCH7rNr+z5322Dg7WeGgYY9+q22K4TEMSkfZkbsl/5Mdpyb/kraCk29ELVlQuT+EF5cMwdVIT5I
 4vEB3AgU0VtDB7wM6PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: 763DE245327
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96488-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

During the SSR/PDR down notification the tx_lock is taken with the
intent to provide synchronization with active DMA transfers.

But during this period qcom_slim_ngd_down() is invoked, which ends up in
slim_report_absent(), which takes the slim_controller lock. In multiple
other codepaths these two locks are taken in the opposite order (i.e.
slim_controller then tx_lock).

The result is a lockdep splat, and a possible deadlock:

  rprocctl/449 is trying to acquire lock:
  ffff00009793e620 (&ctrl->lock){+.+.}-{4:4}, at: slim_report_absent (drivers/slimbus/core.c:322) slimbus

  but task is already holding lock:
  ffff00009793fb50 (&ctrl->tx_lock){+.+.}-{4:4}, at: qcom_slim_ngd_ssr_pdr_notify (drivers/slimbus/qcom-ngd-ctrl.c:1475) slim_qcom_ngd_ctrl

  which lock already depends on the new lock.

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&ctrl->tx_lock);
                                lock(&ctrl->lock);
                                lock(&ctrl->tx_lock);
   lock(&ctrl->lock);

The assumption is that the comment refers to the desire to not call
qcom_slim_ngd_exit_dma() while we have an ongoing DMA TX transaction.
But any such transaction is initiated and completed within a single
qcom_slim_ngd_xfer_msg().

Prior to calling qcom_slim_ngd_exit_dma() the slim_controller is torn
down, all child devices are notified that the slimbus is gone and the
child devices are removed.

Stop taking the tx_lock in qcom_slim_ngd_ssr_pdr_notify() to avoid the
deadlock.

Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 54a4c6ee1e71fe55794f09575979826d9aa5be9f..75d70de0909a8d17e2410d30f7811f32d5eebea3 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1471,15 +1471,12 @@ static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
 	switch (action) {
 	case QCOM_SSR_BEFORE_SHUTDOWN:
 	case SERVREG_SERVICE_STATE_DOWN:
-		/* Make sure the last dma xfer is finished */
-		mutex_lock(&ctrl->tx_lock);
 		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
 			pm_runtime_get_noresume(ctrl->ctrl.dev);
 			ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
 			qcom_slim_ngd_down(ctrl);
 			qcom_slim_ngd_exit_dma(ctrl);
 		}
-		mutex_unlock(&ctrl->tx_lock);
 		break;
 	case QCOM_SSR_AFTER_POWERUP:
 	case SERVREG_SERVICE_STATE_UP:

-- 
2.51.0


