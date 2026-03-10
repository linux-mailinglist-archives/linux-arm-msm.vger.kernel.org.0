Return-Path: <linux-arm-msm+bounces-96723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNEpAu5DsGlLhgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:16:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D76D254729
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BC483125C07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1073A382C;
	Tue, 10 Mar 2026 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zz/dQiV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxBzXdCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B583A16B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157492; cv=none; b=pdzchowPWoNEFGglr2LiDrzJsIogFt71BhtBWX827o13lnwn34+KQP99A4zvWg/HSB29/iKEBQjmpoyZg4nMtGtQ91s949fiSTtZp+pCjUijEuheGRfxJZqpVHgFijBhizn5o0H2TxThHv8+X4GKkuDJS9yTzgEHkl2ewXEkfqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157492; c=relaxed/simple;
	bh=ZjTo93puqxgLaTUXkUuT1EliesGs2ukWThDJ46ZWj64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWNDjyKQLI7heVUi0WtR+q/ZPGFLoODsRwVIAO/deSSB3l2U++NLRVR9UdyEgmtVaR7qVHd2xeHS73vnKZG65kB3ruwOddopZh+fvGb/WECtkXWbWilWphsOJwQybtrMSRz1qVk/ni6n2WXJIYFw7J9asIFlEqMfP6wnuvwEScY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zz/dQiV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxBzXdCP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACbBYx3773193
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=; b=Zz/dQiV+ICIzss1l
	FW17+uI1b3bFMMU8aL18WAY0vY4sb27u7dQRJmCaAYJiFxEtESwqvN7OxAyI2078
	wZAW8YUUZzuKKOdVD8miGxJpFfvVcTu6Xpqcqa6OIfkBuUFH9n0mVQ8J6xzbcPZD
	2y99kHLUQpHYtQr0onv/9lNWFPbJHJkZQqOWJzjLEuyFT/eNWy1V4DyOv+27Ix9I
	IO0Fx8YfYsDyKWCYz7+sJ2PocMhowRz1SL3I30Y9UMbmWhcraHq617EtzNdpLhmX
	S2ic9alTwoIMXUkNxwuPQxAThrAjpRC12YEHnmcwpxFyDcsLB8BwW5JzetpEpWp+
	ycXD2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj1syu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd91c0262fso841086785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157490; x=1773762290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=;
        b=YxBzXdCPdvNf9kU+49yf9UVfacxuIGkNheHSPj6JDTitYlsPpHmMNA2pdY56CLPvAb
         bJvEXbJrIQqmFevImjXwRCcGXFbMBKiUvR1iqSkOrdx+K/XT0dx7vpF90lkBBXT8hXqy
         rb9Vv3zk95X3BQGn67z5MR0javaDeYWZZOZcAt6UHSUwQdVXf6sinuzPYBztIXuStCO9
         Tb9CqIy0P9pcJ348e+7KNT6KiPtjQMLHWLX6aF6Xlxyv5sSUTTHUlF+w5jTHej+EOQ2L
         l/9/fhq7JRFJy0PQSJvHDbHVK5cMHUox0Qh/+gcQTaG5P/9yINlfuE1MdKb0CJwE2JOJ
         7rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157490; x=1773762290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=;
        b=LGC0zE2gQ8YWrfgxTsvhkrqtWKVauk3ykzs2xWRS1KvfQlm3tStx9nHBbMTsfTG+Hk
         CQPXXyTr5ZprqomT8w3NM0tMj7esCUyK403RIJDx2OtEKSqLGdw4d/iWTBmnJHneCgQf
         flcyRpTfHIWXZSl4BrFOtqmWlt8Pd1ueiG9MPEwe/fuos6QbUYj1bPRU3aFOXbtV5kZs
         sNl5WC5nsS6fvwRDAofoFz8klUeN7IiIFT1EmUYh48P23eI9d5UnpMK5FrGUyekaLH0S
         nDbjbn4gTMUt+gksrdVIc0iZoVeqyGfsKjFyQKsC5OaYR4VH9Oyu5i/faGRcsP+Wlmty
         wg7g==
X-Forwarded-Encrypted: i=1; AJvYcCW+b28xH3afYGwmrW/nZUDV93eBC3fBmyBD2HId7H52Eremxnfb0sko17lyM2Ny1bFRjepbKUpYMkmEeMfa@vger.kernel.org
X-Gm-Message-State: AOJu0YxyfoBdJ83UaBzhms12JVEcao2dU0nfqZ7zOakh+KCun3fnrSbo
	p9ldfB1/ymmJgn87mBV6qLUFZaoFp79OLoc6Y/znoReR4BocDxjcbUjH8btE1ws4HbhrgTFG0cA
	jIhWJ9bGCJdBLjGlx1fT9MncZzafionEpoKx0RarNEMw+y+9FPKzwCY3/H+9Z4wis4RNw
X-Gm-Gg: ATEYQzxw36u91Tfj4SclIypkeqYtK7+o8saL3WawywcQpPbLDZYoM8LoitOzxN0I0rA
	esqK5LcYqSa7PoIg7FIczcEPsR8r7bd9uVJUfWfCgwyePSZ2EKa7sQVXMOVfRkGHK4Ao9LVer72
	Zo6UpgZocjhpHu7y9A6v/BRL2khSeAppUteAK58ABnJ/8v6IQ6MA2k7hHDQRJfAtmzxZXQcpi60
	eVOZ1dlnurSvVoBIOpvxMWUX5J4HK35LIVXP6y1qdMEjJyLGGLw/9iS9Wjahk5rEnVZ8QulHUv7
	fv0Y8PTJg1uALwHKA3zmI5uNIA038aVZ4jB6r6yPxKJPGtfqV/mVZdE+E1JY98bqwQf4SYteePE
	3SFDX6V7KZUtfbU/sMsQnzBs0gFz1h+A/xr3dBV2yP/xH/F7Heeub
X-Received: by 2002:a05:620a:4089:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cd6d40d280mr1882570885a.17.1773157489558;
        Tue, 10 Mar 2026 08:44:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4089:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cd6d40d280mr1882566885a.17.1773157489042;
        Tue, 10 Mar 2026 08:44:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:16 +0100
Subject: [PATCH v12 02/12] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-2-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4367;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZjTo93puqxgLaTUXkUuT1EliesGs2ukWThDJ46ZWj64=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxg3vLRv4Cb5EFc9ZrgxnkqHCgnRCrb06RB8
 jAQPx2EncaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8YAAKCRAFnS7L/zaE
 w2WsEACzlbvZsqHI05T9FMT/nknigqs92ad3jGRwPGVD/VshV312hnaSfUsov7+a1X7dgXn2f0A
 exh4/NUI5d44CHBFspXvpAY43uTy7J8EF66Q9Hs2GJYdC92S/yTkWujdhwoelWWfpXvCyL5apWG
 XhW0AHmED5m/0InJni1bZ/Z1h+k6cEfZEfPz2yUd0wChIyIpqCw4SyQamdbqnjDglXA+t95RhtM
 x3jI2wEGzND9Rv4ln8OD5AFxZwYblABAFk1xWol5+2PUeJbYP+2UTfV2Ef5jIyvJdaQli/8AFB7
 v61RJifx0GHsBTyvzkbjLcNbPjCj/6DUgB+5KgpXAD3D8gsJHNPVi7+65eFrkAoQff0Co8ROeyp
 kED0BMAKnVW2wAlrYcm1mly1X6HWRDrDg7EspfFmc9EsJV8JsY1jjYH7LrZiIYa5AX01pNf9UT6
 I57T6CFj6EjcC37DCKza6WG8XjfYC3iHbLKcP1gpklnZ3JSI9J0mEESdV6vGHEnC6KXN7P0fUPa
 BKZuonBLBnZSv1Qly6sfTAE7gsabuWkF/03K4Nm9dgvK8l6xwdH5bksyrAE6kGZRlr4vgrc0oVy
 UZJ0K4+Pfze++ekR7yVfMZCFDQHLi1ePQ2lFctz373eH/WPXpqXCNiKuVjLrATBPPJlT/96wLnA
 Ez627dzznZ89zNA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b03c72 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8NSFRjenugile3Oqi2zfH8hogieHDNyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfXzHEzCCRkJ0lH
 g1iCNz0LEXBV/12bFagZ6cCG0nB72hYOSpDwXftJBk/jodnGxVfHj3K9fSQ/0m+aaO4Z72mX76p
 4CrvntIX9TLO+4ipdfYyFG2ToAJuGNgx1auz6jHnRoazCqVeKWYvtBAu14zaSDJ4ZaHGYpuVFBv
 nrnjZT5OFmdGNmeN6kzhetZ4a9yBHj4xA7ClOXTLRSXkRior4EEM2Nfx3qJU+BPRLVD/a1j8Goi
 sbeggxyLO7V927/JGHKAX0E+ut+PgtBw0b4EzeeOymnK6b4f2iSFcxjt63iN8TmXGAOL8u7olhS
 oTSWgO98EjZB6xEWpTmHzfL26vD5pkx1YWMK879DkYjIj5am25+GTTyWrpyj+WF+OAbzMmYshpu
 PEyS1Js8OjPMx45xfK+1np1ww639hywRZvbeQrhpvFJqKCF88X3Nm6reZDAGXbf5fecn9RZi152
 6wf+tqImn0d/yXkAUZA==
X-Proofpoint-ORIG-GUID: 8NSFRjenugile3Oqi2zfH8hogieHDNyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-Rspamd-Queue-Id: 7D76D254729
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
	TAGGED_FROM(0.00)[bounces-96723-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Action: no action

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..c8601bac555edf1bb4384fd39cb3449ec6e86334 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -397,8 +398,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -863,7 +864,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -893,9 +894,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1091,14 +1092,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1111,14 +1112,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1286,14 +1286,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1358,8 +1358,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1393,7 +1393,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


