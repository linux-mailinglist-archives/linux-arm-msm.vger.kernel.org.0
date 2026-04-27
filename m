Return-Path: <linux-arm-msm+bounces-104611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKNVMeUF72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:44:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 720D946DC5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA49F302D500
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178C037B02A;
	Mon, 27 Apr 2026 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSHs70Vd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbO8VZ+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A413793A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271965; cv=none; b=mOuctLndmybQPWCs+Xwy5MkavJA9Y5Tn5hwtc++SOTaNaiFswdahtNISRiVDF2d3wpB9C/E/2EG5/rNq3SPDPii9+4kXq0a07lIO/4JZaiyT62SOHESjGVFjtEZ30xBfx0Z2K1NBxeQrKX956h1cCr7T+2DPAbemMCeRp/PLCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271965; c=relaxed/simple;
	bh=R4QRkVHAwQ9KrtjujN9XD83vLhDAkEyM/SDEmmoV3Sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZouGuZN79CHEoE+zfFzSRMZUbKeSU7l2aJmXTiv4xaEB1T2yrJVhyIiYHuyjPe2JpcTBjuAsUSby1wz3DjwqETjF7f3nqr5g/0h+UXJYJLsV8cg48sEn30+isofmByzJHk6Uz1jepBVtCAbUxGiR/z1H7KTvpl2p69eFXUBzQME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSHs70Vd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbO8VZ+m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R1xRPQ047771
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9t2Skqy5JANgUESsWXa9v41qvVlWGnC0rrJSF/Em/Q=; b=hSHs70Vd+yUPJWyd
	gHC8XZXPfCL8oSQ/os1j7z1/ZUPcFBHGA/T7FnY0wCbXJ0PJhW+luAhrHwlZJ3k1
	t7fAS46HGGPaVCWs1vAZRKJH7KKGUTNQvSMB1ND540pEAuVtzQlv+Fstelt4ah/7
	0z4SCZpX//EP6aDBp4uuX/FxjaCRv3VIFuyIpQkigihekvxT+aWn/+Unl0ZWbi21
	XRgJ9BsvFuarm+0ZBTAf3liFbamz5tPXwhcZb/XCaVuqBwO+QJX/ew5MMmpdcqtI
	Hn1/Tsg8q6OdWhu6/aisW54TrbnWVnzhe9a+EIYjRAZZviateIXXwosiqAMSFkFn
	ErPJyg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxcrqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 06:39:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so21939136a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777271962; x=1777876762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9t2Skqy5JANgUESsWXa9v41qvVlWGnC0rrJSF/Em/Q=;
        b=EbO8VZ+msehD9Vy7LCxLsUMX3kRX27XVPKyXzBqfX6MWmOPIlY8RiaydPsRF5QKkjU
         QLSJEbDGc/eKhuFOe3LA1mCU5EdPWBU9O4Eu08Js78tHdgFjbi/V9+WofzR12+nbhu/x
         Xlw5SAk5pR+qa1IegGgUb7ehRn7OqFc5hLQbTpBsEx/bGnstGpFFIdb7mUiUEyVeyjW8
         kmStrFJ9vGedUhg7YPDN3+mNNarQ6+ukgK972PCwp6hriyiFTvjDo+SKl72KoF90H+S4
         yzK+vEdMs6Tlp3eY/NMvMY3JyJJiYtshU33bSs7TdbhmJMaYVEhkV0ec0q/LWzAjCRs4
         HTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271962; x=1777876762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k9t2Skqy5JANgUESsWXa9v41qvVlWGnC0rrJSF/Em/Q=;
        b=BFHMQB3yCPgTPz/cXgkoGfwK/he5qwhnEAHz/nDEUjyMtVADCOoInzsOfwbGLnfJPe
         zp5jW6O9WAB3lWhm0euri3EfwVw0nmOSp+1qAK5umSFYPRi6LJyyHBncJ652xhq7jyJk
         DXUdqOWL3xUS/jwfjwqjH4SIyf5oO25QLW+yPYJJyOkKaNOxrirmVIkYAc7jxZqhz+Ah
         X+HsTJ8s2MnSaifzxV8k9Sfd2fmXdyaAshXzVy9+z1b6AM/+sbFDax8aqIhHFmJwatzh
         lNhxxQ0K5g8Tniou6y+T1XrTGqh3BWWmmWg8AodXtVFFKqViZdvO8ey4ryIqwTXsGqXk
         Zb4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/8WJUVpthZ6w5rUs7A0eiECK5JpLsBskQrBGUiNrsrAPd3L6TOlSYt2m8iKpHcoxIlR/w3V3IkIt/9Y27m@vger.kernel.org
X-Gm-Message-State: AOJu0YwfYQqMcw3D8/h+wHBwMNVJ+2z25iH2S4n0UIP4kSAxULpGpgrj
	ofpdvElONok1Gw5xKlOWdjB+ASWYdlNzCdVLRdFZazTiwwVa6aB0Ku4u9PHNeed8RXX03iSNUXX
	mim3q3y+pSYQSApMnqrKzylD8vQnS/t+kMVm5NlXu7j7rBQ417Hi/A3KjYxqcfBHZr8FH
X-Gm-Gg: AeBDietARivyecFpUf+I6ZK9bxyrmxwGjYi8yQ+mTFDrKgfhWaoc7txvFkc5M/oUrM9
	2bQxrFc4i6a6Uj1usbMa42PF0q7AGpG+wfp7rMu2zKOK0eQMdJEKqJgt15u4aasbSJUfblFbBL1
	YWEPX79M3WtcBhzs+eahdYd/che/M0ICuBh804UqfSLDSUo78mzIyxCasoYOztV3TEXEiSCLLYj
	wm1l78weaqEXCrZl3/1+YcuE4epJD66WBFj1ywluyhaCMRqLdiAdgzNSu4XQS1IKbb4KeEN90Lq
	iuOGGJMNwVDi2iHIOho35D4ZAdfNn+M41lFUqGdLTZKCxFQZQ2A8jLjyCc1G1f8Abh4NvdGtkw6
	ygXMMxcsHoWq1qYy4/j7yw0YTqEdWtCLWzrAq2oeTXNRISMzwEmOknBvL
X-Received: by 2002:a17:90a:d50:b0:362:eaa6:a3a2 with SMTP id 98e67ed59e1d1-362eaa6a580mr8394448a91.19.1777271961601;
        Sun, 26 Apr 2026 23:39:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d50:b0:362:eaa6:a3a2 with SMTP id 98e67ed59e1d1-362eaa6a580mr8394436a91.19.1777271961165;
        Sun, 26 Apr 2026 23:39:21 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7ab7sm38628234a91.10.2026.04.26.23.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:39:20 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:08:56 +0530
Subject: [PATCH v2 2/6] clk: qcom: gxclkctl: Use custom disable callback
 for gx_gdsc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gfx-clk-fixes-v2-2-797e54b3d464@oss.qualcomm.com>
References: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
In-Reply-To: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: FaIWZygeWENlXuTqSVcrhNHO2NkvNyj_
X-Proofpoint-ORIG-GUID: FaIWZygeWENlXuTqSVcrhNHO2NkvNyj_
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef049a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r9sBLZ6K9uwiCka_ugMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX2BriIUeDWgRU
 bDVCMtlmtJDiPUjwTC4DQ+kN+aJYA+xSJ+O4VwttyOEYBKda85pxNeXPTtFV9ReLz22p8xIzP+i
 H7i5cYB1hCItpdryb+BrCK6NUay/Uk5ikhw7qtGTQyEoS0luawHyIiLUeYgUtkYJ84CghKStHXp
 Tz1yNh7+d34pXXt+s0JlNZqzWuWjSXl394oSA1DWwsxAoE6glvh5txItgkW4glKwYUFpQlen4Nm
 ZWBYsKEIuKeCZSlVemp3vlGlcpopOMvEbVcNiePQ4y6DeT8kL34mLYa9Z3BNKe4029ibNsZxTFr
 Hh4O95RDYebVT9+4KusB5ZsXI2e89kNFK1ok0PURfo93RuGw3IpePHOGVCHkn7f7P2udGYi/vsm
 jqSGtnw3OEX98V4ysZPmkgGu2ZkM33NPWOojYQOwZUOUdAcTnkpBKGtHUBdpnX8MnYmKcmaNfqk
 QBacYxOXQP1jzV83aGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270068
X-Rspamd-Queue-Id: 720D946DC5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,gmail.com,pm.me];
	TAGGED_FROM(0.00)[bounces-104611-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The GX GDSC represents a special GPU power domain that must not be
disabled during normal runtime PM flows. As per the GMU architecture,
GX GDSC should only be force-disabled during GMU/GPU recovery, where the
OS explicitly resets the GX power domain.

However, when managed by the generic GDSC runtime PM path, GX GDSC may be
disabled during GMU runtime suspend, resulting in warnings such as:

  gx_clkctl_gx_gdsc status stuck at 'on'

and failures in gdsc_toggle_logic() during rpm suspend.

Use the newly added custom disable callback for gx_gdsc to ensure the
GDSC is toggled only in recovery scenarios, while preventing unintended
disable attempts during normal GMU runtime PM operations.

Reported-by: Pengyu Luo <mitltlatltl@gmail.com>
Closes: https://lore.kernel.org/all/CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com/
Reported-by: Alexander Koskovich <akoskovich@pm.me>
Closes: https://lore.kernel.org/all/gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me/
Fixes: 5af11acae660 ("clk: qcom: Add a driver for SM8750 GPU clocks")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74aeb706c2f4a7a17a2c5602042af2..d7cf6834dd77c2a5320ffb8548cdb515be237bdc 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -26,6 +26,7 @@ static struct gdsc gx_clkctl_gx_gdsc = {
 	.pd = {
 		.name = "gx_clkctl_gx_gdsc",
 		.power_on = gdsc_gx_do_nothing_enable,
+		.power_off = gdsc_gx_disable,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

-- 
2.34.1


