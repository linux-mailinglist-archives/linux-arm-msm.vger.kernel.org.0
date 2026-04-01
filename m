Return-Path: <linux-arm-msm+bounces-101216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBplBYeQzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:27:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EA374599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E1493071996
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C3137FF40;
	Wed,  1 Apr 2026 03:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgpKi5hj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7pYNvLA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ADF37CD4E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013774; cv=none; b=IzipIEIbjeQRXIMXBKT7BQ0IwblXRryKi3On0iiJfx8tOR9N61sQm9AfAvdhdCp3Ou2Yx+Rcy5L+2dDvbwF1Qut8+jGD+gaTthYVymdUUmSTO0oMQzfaaKk4sTk2Xj92RfMkRQDp/F3JUWOIuBbj/OuYbvcBeULnEzz7jnYm2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013774; c=relaxed/simple;
	bh=kbO2y45sZLvpmthZIJJ25uuZUuk4g1h1zkNH/OFxXNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sf5CPVH0smzNrMvQdue2Hromw4xvvhw4LWW7ceOMigsR93RgPJ9k//2fq2xibP8x17qvf3Ddmfg1hf/hcbejqwl2INxlsLtS2name6D81O1VSq2LVt3daJMucwgKOxWLEhx0Ql/Fpbc7IPH6CBOVkNQU/XbUKEpfn8gYw6uoFUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgpKi5hj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7pYNvLA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312ia6s718617
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 03:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHpnVx2Z9Jz5XG9zwKBPRDeKmDPN8MLUXTLxA+f8ELo=; b=UgpKi5hj5XnpTIwW
	09tN4NN9tBeRUYtN7psQp2SmQ2w3WbWryMo3KSXeHqc9tFEDmAIAkS5wC6f9KodA
	23/KoNCTvK1Bj/L9gV0Hgs8GGQraqVz8GhLP1sN1QaNwojcnLBHmRU0FTa24kE3l
	bkPUxiZN/qbdw7rh15lOH8+dAf/RF4W/PUiswKPNBnp6mFbdsjDZdvJ+BGUqcxwO
	NlLusYrwhPePa1AGcn7m19+sISz0bqnkNgX1ef9Ntmqc6tKfrmBQ6ZpWUa1EuoYs
	pzrU0V9y21ziqY/FmptbW0WQ8E/Dq5pBL/LAOwWPoQvoEWAc++LLmXJ0OESQOp3G
	XeBtgQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcssw8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:22:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d7df10ae0bso16692111a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013771; x=1775618571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHpnVx2Z9Jz5XG9zwKBPRDeKmDPN8MLUXTLxA+f8ELo=;
        b=P7pYNvLAtHft1LV3mPGqodqsfB5xnlsY44jqSKVI2l8MmL3qyokYdOuIjvZAlgrIzL
         EStqdENLVDsKBu9vQSnDXc7PXDBCg+ZMEoOweOyKcdJ/XxrKOIj8O+6S18AFrwUgXkPS
         ZSh6d+jWqUy3L9kuPeFYRL3AwPnwVe0IalhRReKSJpGkNd2stoh40FtjzYadGKe02y8f
         yxTuqJJuWn6GEX80ycGNETbWaXpFtTx/liNGrmNSf6ixQeLh9nmt7Y66zDTHVveihWhT
         oHFC6kRmRbBBcEaEewrIsweMQQGo/X56zLxa28C91lYOnrYTIihPjv1ns74jsK1DPizd
         K9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013771; x=1775618571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHpnVx2Z9Jz5XG9zwKBPRDeKmDPN8MLUXTLxA+f8ELo=;
        b=CBtpEXLJtH+V5d4T9ag7t7nrzNslGJirc4tWtqSVqNq+gfiQuPAowIRqGgg5/L+TKB
         Rz/jqHGD7vlj70sKTY9KA3QSO+rwU48koH8fCvtqOZQ91qiyPXbsIn8SSEvO8EnZ/nrl
         JNv9ZqZm4s3FazyaHxJ9AhPlZWzD1a3AQ7bD6mpKw62hF4evIEaK1b0P6+7t2cjMM+Kp
         rzn48QRY+1rZJMNi6tRrrdyXoGWe8MHSdQdD3lX4vZGeNRZQTkaLORJYKdZVIvkjVd7R
         wX1BkANJXK7q96KBvPt+VZPW/G20LFiX5hCAQSyrThDyYKCoOuvsm6d7C5QMSShAvxho
         FMlg==
X-Gm-Message-State: AOJu0YwtaQhZEyoCJaeZr1khMdyuz1UPQSgN4o4YlXWETcD23XYD/3kp
	Wg8gF/PgfOf4zWhwzq7OVWmhQ8OoiMybilMKA2jUrbQIAlUFk3Dh4kUNUnyk8Iedu+aIW0yI6AN
	36/8dEydxO6pbACbOtkbqw3SPkh6AKjk5KK6cAOa58Lbp02EKWJUbu2Ou+wbu+cCHErdq
X-Gm-Gg: ATEYQzze8c+L0329PynZLGNE1zCAUy2DNphWL+eJX3jXxTHzPVqTYg900Wy5tnGAHes
	youUcQ/TDsL98Dj9BmeQ0JetWTAdxEIzZg90u+Q8ebNYkPpfy8DUpu1LRZ88PMIINGoQQ94i6Yi
	XmcY/kRwVRKXsW84uJH1OWdTy6eIaJzNJ7jEkDB1viDSBtm/DpbBvWIQkcVpJNi/l5C1s+EV3QE
	EYu142AKFABE9S6QJNnbmCjJwh3xgs/rhrULxTc1zXtPX5GRIBeSqZoU94v82xUGeD8VFY0nKez
	+6y8ktrxlD4xkL1rKq7CmRsdKLwD66DwK/90kkoSrP53zma9DFRNtn5yH1tiYVJXmMUHQf1jtAA
	DttWg5b2yQxGoLuRt3yKIoSE1xE6RCqoPybFIZrfUcxc=
X-Received: by 2002:a05:6830:7007:b0:7d9:c69e:ea27 with SMTP id 46e09a7af769-7db99410b8cmr1603157a34.32.1775013770997;
        Tue, 31 Mar 2026 20:22:50 -0700 (PDT)
X-Received: by 2002:a05:6830:7007:b0:7d9:c69e:ea27 with SMTP id 46e09a7af769-7db99410b8cmr1603147a34.32.1775013770650;
        Tue, 31 Mar 2026 20:22:50 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:50 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 22:22:44 -0500
Subject: [PATCH v2 2/7] slimbus: qcom-ngd-ctrl: Fix probe error path
 ordering
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-slim-ngd-dev-v2-2-9441e9c8420e@oss.qualcomm.com>
References: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
In-Reply-To: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=kbO2y45sZLvpmthZIJJ25uuZUuk4g1h1zkNH/OFxXNI=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HXQ17eY/AysPOZgJT0P1HYQKYt0DlWxLJF
 OVWJFMx3dWJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUs+A//TvwvmBOkN51ZzQcz1KmKpKI7R2PMtPeD8TcF1yK
 svc7GZTWr9qMoEtwHY+24dxJwBiAW/WQ3UYDnVbgF27vDT9GRAMaokU2dtbHcWcpY7So00PmaeN
 3q61YNXYk0CuDz9OjWmmVrWeP4gJRxW/+YAe06xjXYIExfAG7gCZ0y0XySyIQ3MCPL2RFm85pK+
 TXHT1lDQ3kUSCfkTkx/z6RFhThRBCEQ5n1DoJL0hVddEXucZcRCxGMx2Do7y3/RUU5DqfkEijWm
 9LBacsd+VDQ040VfpIvZJbYGlU7gpjYi7u92WdeQ6dpjyb17FwYcXYSLVTI0eedhjRaq0qCFlyP
 SMpC6DBAzBfXiIwpYg7sHhaCO6o/ekGrCqVoz8/U8B9ihq3z8otjdEXBhQTssyAK0UJsNildjqq
 3qegM8z6HdldAq4PmI2k/MtJRehEY8I1iUjFsFJA8hbp3fUoX0qYBvMp6dGbwAfkr5zhdXUGY/h
 nsXoJ11lqDwv5yDfFUStj04TlwT8IumK1dGw0L3aJpJeNkTfeQDNd1pR9dhZEX1X0pJ9EMHZjWN
 Mf8DNok4zikczGd2RvqIpfAhSN/uBq2Vw7004ez9Fgu5Xx0uMCCsGn+HIVZt97lPRB610XBMz9J
 Allu+ItNT1hBe6JLGmMII+r/JZ/pVNTsfJBQ+HvHEQK4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX9z0TUfJmV/Na
 SWlHnSvslB0WfP9LEcVOIDQOIcd9Q/hNspgkmLh3BExuyK9yAIu2uj6L96z9rzh+Li/mFepumOJ
 JyDpKSZ8ADI4W6oSLpMDRlmU8GloZRxNy3C1XhYlqEoH/buPlSoRwmz1syAQvtrqhrje4qM/mXK
 ZHIaZHHaVxCFAwP8LKWRZCXE+Log9nxna5Rt7xLNGXowD0zfNmbaXBUH8OXBuV9pztfzHsKsels
 Ez1OyXqX2nLmhTNXj76hg7xDV5dkEwSHCqXEX1o5RRqPgrE6V/46wUtI2LS5Lk+Pc/YKEnHEtBb
 fKsty58yzs11+yjWrMFT+igajWCo4IT4iGEfXKPdbUaeBfdk0r1HhNRI0ynxIWbdGRC3G2h/esE
 gy+gHjheqofh0DOJokYVwQ0/GIgXcLNX+izqEc3IY7t1QHBPj//9kZBlV1k0d6dGraEl93jCGLD
 hRYtnbYx3xeco871uyg==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cc8f8b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gyDl647GgXGSOFt2m_oA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: dvY4FLuvn06kpNyiMd4O0WUAvAmDEdDo
X-Proofpoint-GUID: dvY4FLuvn06kpNyiMd4O0WUAvAmDEdDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010024
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101216-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A38EA374599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qcom_slim_ngd_ctrl_probe() first registers the SSR callback then
allocates the PDR context, as such the error path needs to come in
opposite order to allow us to unroll each step.

Fixes: 16f14551d0df ("slimbus: qcom-ngd: cleanup in probe error path")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index b603b9337905438b6c9f5dbe800e560c864d946d..f26fe54b2ffb4bbfe6da6b717257313536abf60f 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1660,22 +1660,21 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->pdr)) {
 		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
 				    "Failed to init PDR handle\n");
-		goto err_pdr_alloc;
+		goto err_unregister_ssr;
 	}
 
 	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
 	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
-		goto err_pdr_lookup;
+		goto err_pdr_release;
 	}
 
 	return of_qcom_slim_ngd_register(dev, ctrl);
 
-err_pdr_alloc:
-	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
-
-err_pdr_lookup:
+err_pdr_release:
 	pdr_handle_release(ctrl->pdr);
+err_unregister_ssr:
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 
 	return ret;
 }

-- 
2.51.0


