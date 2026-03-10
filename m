Return-Path: <linux-arm-msm+bounces-96481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBSMKG+Zr2lbawIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:09:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5C24525F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC9623026A9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E004C3C6A58;
	Tue, 10 Mar 2026 04:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxuXTtRz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aufOQDiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A8279903
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115757; cv=none; b=qudUwGSMkGdAQD+WeDdZdbAP+FUQR9BUK5vbqnM5ElD337/EvtRzt2FFzV/LqdgPNBOdYScB/MswNF7Pu2lmQfu2vWZ90VFqMTfG+uSo/YoqkjIfMrebGsjYtAbGGGP1b/+vKrsJfdn8EJA4IvBJAgCTHeNqTwYWnwCrmADx1yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115757; c=relaxed/simple;
	bh=j0BNFKTy6YhD81KGaBZfVR4UgpqXpUIBSqeGb+WvIjw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DYV0P7NSiMu4+CpVoJHKdiWVAZLpzpMjYD1NGCB8OIK6Xn8ptCN9t2ldoYYMZ/azBn18g+Xt/dAlQwp8Fhjh4dwTvW6+e+9XL13WQ8bRyZl9mpGxK2tbYo3kCmvkHLUAOBuwzUdDj6l3LeFdf6p3hwPKogLx73yCo0ZvTkKItxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxuXTtRz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aufOQDiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EcMD3587427
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DNXiimRcU/ja8ktsL318nq
	SuUFiZZt63sxQ0hRN6KkQ=; b=cxuXTtRz+nA/G+pqN3wV4e/OLdSaf63RH2dZ9U
	44nKSgLlgKKnmEuzzWn9PwHYIE4DuH1iFphH8cdU5l1561GwtUGhwKzOjhSDmn0l
	h/xUTJz0lul+yXE3h2SwAkmNxhBDnLosVSmMWc/tDFI1HjtKkzO7lZBtrGTGi20L
	JQFG3uoJiS2MWqKRmonlfUPdnJq9DGu+En/nbn/Gi60ckpR1xpb4o4tYbY5JsbVM
	9JREnjcAXf6z5op8KI/Pi8MoEtk2lP9f3v2hD3RRKHGic6Jn2P0GiIQ5z1aYgdmL
	HByJY7T9IjF8+pYCCt2pnWXtcboA/gZCSttdOkzOV2CAXgWw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekt3nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:09:15 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-417323e3806so13847217fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773115755; x=1773720555; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNXiimRcU/ja8ktsL318nqSuUFiZZt63sxQ0hRN6KkQ=;
        b=aufOQDiT8TBPCA2Pz0/CPH/aG5tvGwciWUeF6W/2Txy2Kvemab+eOrFTnyEx5iXiaK
         KNoL98K4u6YtnmaQAo7HXkGnIR6jlUQF8LDgYp0yYi9bm68EToZDbDEz/xEIP7bi/WB7
         7QozVWNwpdP4pY5/NGbOoVfRE+OLMxKGuL8IJT2FEz9DEzsbQ4wcxQd7Ltwb1OWMRP1b
         gPRv7eqdzg4NjqbrilqSgmJonJM+fG3Q3re7huhMq28mXLVK0FvEvVYi3UAkKbv/FwRJ
         wWqXH80J8Yeh54YOZka9sykGOY9MD2ZsjZ1oZuh+/JtuCUYXgUbZBrj3V6JkZHt4RsCP
         eOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115755; x=1773720555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNXiimRcU/ja8ktsL318nqSuUFiZZt63sxQ0hRN6KkQ=;
        b=BF7gqGfq0amMEfxkExp7/TpQPrn89Uj5HxbFAqjRWhd+Gg7/vfdW/EmbK12+K7U+/F
         Af6Q0Tyo5eld11IOIADGwZ2sQOZt9oCnvcZl2/mfRbQxIkxTzwbIYKxaSSSplUjX/CHq
         0KVokaBzIkHxQ0/lGYJJdBHLOnY1B9pZp9ojPqcI4habDkTer4/o/7C4GChjwQpZELU9
         /CDfNgcbkom1c13koDwOjMIK/4tUt3rPARS39LiJTo9SJVPSvfi2KxBPqHOjZGSOZgaW
         ixxl2LtEM6dEAz4w8gdQw4EaUJ7cc2eCYjkZoTb6F/2UgMMqxzYc0Y6XWngp6v4kz1qM
         0oHg==
X-Gm-Message-State: AOJu0YylPszm1q32hVueZBQBMfK2JY4L6RwLVkygqQtuQI91m3XZf79T
	4lZse3csbyKdOa0TuahFGOXLd+Un39tBBr+mJD55K1JFZvxcAAV+cnIUd+w8BATTemwPNPCm/n8
	/LPSkksiwhy8oNmuVrnTxKQ9t1Imdk/LKqJ8taBVLHEo3imKJwljcAhPPPh8TS5/mkemt
X-Gm-Gg: ATEYQzwYbfkT7m+LBWbOZBvjqncTiXrXVzDpb6IwoWD5fFy+NbX13KO3G1GgrBfwsFC
	aGL3cuSiWq6ipsd6ScuPqMNjRTT3bXu0PMkpbA7jYrhpmtJfWOo+x4CvJ3O489esGEyOXKUPcz8
	JBoi/k5+F9+UgHzitgTMOrRZIm9YkJiry6PZcUpFtOoIe1dfA5Szp2fW8k80aaUz/GDJa0PvAiE
	Aop9hAXivSG2Wp3XzudY0qz5MfXB20MQ3JGqB3nMStGWlbnJkpA0fCEdQeabAjDnKTijWHHelHS
	XGdbvTH4CL1YfvQAxAGi6ISOMf9KgLWSI11SVJcmKqiksDC1tJFYWiTrscFh0VmBMEusZ5hrS/I
	FTxO4dGSmD+JrN/5rzwN12n4/EAcn5OJS6zXz1qaCX10=
X-Received: by 2002:a05:6870:a919:b0:3ff:4ab4:774c with SMTP id 586e51a60fabf-416e4448983mr8187453fac.43.1773115754881;
        Mon, 09 Mar 2026 21:09:14 -0700 (PDT)
X-Received: by 2002:a05:6870:a919:b0:3ff:4ab4:774c with SMTP id 586e51a60fabf-416e4448983mr8187440fac.43.1773115754466;
        Mon, 09 Mar 2026 21:09:14 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e24c39sm1595685fac.20.2026.03.09.21.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:09:13 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/7] slimbus: qcom-ngd-ctrl: Fix some race conditions and
 deadlocks
Date: Mon, 09 Mar 2026 23:09:01 -0500
Message-Id: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2Zr2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ND3eKczFzdvPQU3ZTUMl1zE0MzszQjyzQDY1MloJaCotS0zAqwcdG
 xtbUAiaawhl4AAAA=
X-Change-ID: 20260211-slim-ngd-dev-74166f29f035
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=j0BNFKTy6YhD81KGaBZfVR4UgpqXpUIBSqeGb+WvIjw=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5lo/sm0Oc/SNYaBVYkBX9corkkNtHKlrnJ7G
 33ol92WVd2JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+ZaBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcX26BAAxYhAAgDtmIR4dpqW+cOKTpmOCnBn859XYM+y+yq
 5tvkpSWjhgFBfpAcY2IwtEPvf7G3JVHdxkBZNZT9E5c39/RfY25ivjVXBQoutkZNa6RzgoISnjH
 PBOTja8kFKbnFlX/o1L3KJeor2KAxjhaFKXT5tzjhpnARdWZ45dmxdpPQ8QMPZw46ueLmfJH5dA
 uRO8CU2hWAGotrYZqwJKCecSFrHNTsp1dvoMihjBj3UYX2unvZ7QNOGKvmGEuj034M8ngo1opQW
 4Ulv7tVih38/sDOgGkpKt4EbIwt5hWAHC4O43WlBfnwzkzOJTQ+J2Xi4hJaFKEB3gcRfXM6GziH
 uhceCPWvEun8xJCO/Kpl7pJbmVKTY3QzwFa8bJayOQIQAXjJkSKLEz2pIDK4Yq45vO7ujzhX6pK
 cbMmtTrimblqZcnoW9HGfhhvV6kM6gs5uU27Z2MPDnaMyyoAXcgwqsA4cZG+HllmUEtuKgwm8v5
 Uv0oIxPeQv2Jtian6T7JFEBm/hhUC5VruOWhJbF615fFFs5B8qcRDmIctedaavrKvgDA10UInlc
 PvjY9n1E0XGw5+G9Sf+snp2yIgwR7nt2vonyqCmwS7VxiZ7bdaWhu3BoC1mRgEo5c8yedOeyV+T
 0CniPghvvexKeT53UNVy+hFGUXzsenQvyVeSBsb9QC/Q=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: r3KBOt7TGOUZTzpFWznq2B9zM3BwaulV
X-Proofpoint-ORIG-GUID: r3KBOt7TGOUZTzpFWznq2B9zM3BwaulV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzMSBTYWx0ZWRfX5T1t2j2gaFOv
 4wmMwkWSSEqgCKaZLc2AZg4ChKdcfjPhzttn2vdABXiOdxq0Uw+oWCVj/1AyY/aIUCA4gmr7YBz
 AW/fUln1kbAXDZtGv0CXitNDLkKGuuQgJcUEqrD/2AVs2z7euu5ADmoLYHeIAGAqpV3q43OsruP
 YN4m/zyEyIWN9+8+nT+hmWFSaK26GiAaTINnMSwi4gcyTakp3ez99CtRrUw1sA/O5ZbWB4otBK8
 t8nee5dEKA1ibn3fhuSQloxgfhtSJ9CDlJ2GSjJqmRDdxJc9/DedLxqSRheieT46bCI471eKksE
 1b0JnsJ9qupLdp4ogT1PgxSk+xOmyazdnGbr+v9gmTgvJE/nxb5d8tPkQkIQAv46NnuklbWBE1J
 V/hU28mRjBDTjjM+YtrB7Wz5Qc4/9BJVpo9GZdOOCp+U7yfLOkRRh2hsYXj5zcZ7xI11PQ5Cpv3
 YhHddYGzM8GmFzqZjCA==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af996b cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=N-1BD95YXHRArY_OaYMA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100031
X-Rspamd-Queue-Id: 5EF5C24525F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96481-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

When the qcom-ngd-ctrl driver is probed after the ADSP remoteproc, the
SSR notifier will fire immediately, which results in
qcom_slim_ngd_ssr_pdr_notify() attempting to schedule_work() on an
unitialized work_struct.

The concrete result of this is that my db845c/RB3 now fails to boot 100%
of the time.

In reviewing the problematic code, a few other problems where
discovered, such that platform_driver_unregister() is used to unregister
the child device.

Lastly, with the db845c booting, it was determined that attempting to
stop the ADSP remoteproc causes the slimbus driver to deadlock.

Note that while this solves the problems described above, and unblock
boot as well as restart of the remoteproc, this stack needs more love.

Upon tearing down the slimbus controller (when the ADSP goes down), the
slimbus devices attempts to access their slimbus devices - which is
prevented by the controller being runtime suspended. This results in a
wall of errors in the log, about failing transactions.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (7):
      slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
      slimbus: qcom-ngd-ctrl: Fix probe error path ordering
      slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
      slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
      slimbus: qcom-ngd-ctrl: Initialize controller resources in controller
      slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
      slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock

 drivers/slimbus/qcom-ngd-ctrl.c | 127 +++++++++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 47 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260211-slim-ngd-dev-74166f29f035

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


