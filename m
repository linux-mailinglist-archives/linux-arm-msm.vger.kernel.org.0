Return-Path: <linux-arm-msm+bounces-95878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FRtKTAFq2nDZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:47:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5E225616
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 852F630247DB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD54337268E;
	Fri,  6 Mar 2026 16:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bv5Fhilt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hl8xM8YQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B540FD80
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815644; cv=none; b=q4NjlC8ZyYHkwDtS9BXF0D69Sz8+zU1JNOBBDg4hVpSFrsrIPD3waK4fYWhu3uDMRTcS08lME4GkmXEoOeoY1m9M2IJEQvqigpvKsnDRafnP2jqSzFdtszyseOVuRhHtPr9t4HwjfcIbUmhcyjyz7P4VP4Y+zVUFJVarKKi5vTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815644; c=relaxed/simple;
	bh=gyfzpHMr9AFOWazAVx4QmamvMyFfTKzuDUatnY4dW/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7QrRCetUhChD3a60FkBokFk3HOxH8a+qnlipm2tQcy50AJy4/mIIbuMbAEXf1nPQce25nwQc7Oo3GwnATXVOaojk1QgFBWKhseemv41AcgHLeJkCJ1QiQKcaPDo7aWhcxcHUDXyvvU8SUQ0rgsiLYWaFOdy3vxiRh449sriiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bv5Fhilt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hl8xM8YQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr99C550299
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtUApVEJ/1Orhd8h1qyFB7XAj1MeiJ7Xj8cHRafwRsI=; b=bv5FhiltoMAIomZs
	Y+66hH20cOKirup9XszOx5Cd1xY+kllXCO4uo+V7iWdbuSfssB/8riEvk0UPqr4n
	c0UE4fPp1GcgYpiUrxRE1svfkk44OzbQpnTZLcLK7XFEd3IF0DXKGWZnBP8/7gup
	hcXjcUttWpHbIxrSOfN4myMXEIKozL8Fh6Yuh6QdvI9ntfQNylU4qEZmyFI5w0pm
	DV3bvHz8CuozIXQ9Cd7JJVDuBNWVy+Yid2fdIaaGmR9JefjyXz7gVH1DZbmtEMRg
	Qi4SY+wqGWypRyicd8n2xdMB+49fNuVoE3PnL/KxWp3TCVRF3x307oGC6lg/7kO/
	FsJUMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka669-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb413d0002so5927858785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815638; x=1773420438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtUApVEJ/1Orhd8h1qyFB7XAj1MeiJ7Xj8cHRafwRsI=;
        b=hl8xM8YQwC+1z2KHEYGQjk+Y9y2JIY0uBOfGTlCaGMU+v9FWL7+/FghPA3ZwX4uCWJ
         62i7NkLKE0P7uqeEPf9vG3UohIvVLm2zvc/dR6bKYI4QnCLAQgukDvhzhe3Qgq3Dkg7m
         xgHcr/7rR6ebrLfBQrbb2g7+drLmAlhz7DBYBY/OmNZtXYQMXhV5FvqMS06IaYEWDpCH
         IevJ+YhS5B3lr1lBtHpMODU6R6U+humiSpuSt8qFzlnguWsJ66M4WNn/+mzuGtzDyrdg
         UtcO7Fg9f+ePaJ5+LYlzbc7i+l3YkuoejpHyuMXm33w5b7iZGn29dT25j9jyBMg4IgKF
         KCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815638; x=1773420438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UtUApVEJ/1Orhd8h1qyFB7XAj1MeiJ7Xj8cHRafwRsI=;
        b=BQBI37YKogD1t0841P6CGMvYECkGfVazPmDYAEi+HFI/IlqD3FAYXy0j3+oppBpXjV
         x5wDBhBusfThCMLoEvv6e63YOgaxT4p+rWGvzD9GZEFRc55hHmAD8I9n2bSjh6cVSsN0
         lO9KwapFOIX5JSjVk8wlZC5qpcmAiZ9pW7zISSyj60F13FB7bsB496+ylLnHrhzZ60Hl
         8kke1NSqdx6C9w77QziVVf4Kl7m/N0v/IPBPPyXtMlHBRae56sXIFY1b6Dp7WHv5vPc+
         6bvxCQnHqAi//6Vc5fFC4sV4Bt83QQgmDVd6SyegDMkMnrYjU+zZE82NrqXmOPGrVE6c
         5Q0w==
X-Gm-Message-State: AOJu0YxNqylbTxmse9s7xkvh9c5u15SBRurbtS7S+TQgldX8zoonuIfx
	VIlZ30kw0zrPL1soEEOImICSYdt2nScsU8nu2iIoOxa6RrMhlODJRAodm/5/7WNhjYiITA/Xj1w
	2B8otITVb0kkoEWCKivAV49HGLF+Mucj8i7Fk1dAIxiB89M4pnH+ZZNFBd3d/bJJ4Bqou
X-Gm-Gg: ATEYQzxjqjoWt3vdz03s1/n+vBEm0GxG9Gojv8ViOVInVdkpe3yFe/Z/b7a3J+yMPjl
	yCGEzVpaRaO9FLEiOmBshb5fyKBqGno/imUPr8CzpjiMV/BnpZcOOvYGV3KO42mLnNPPtktLD/2
	CzBhOxpSXTbsNXk9zEbyOb35kdBbHY4ahBdpPiUkm0D1+5av5Q0GQSMtMkt1fZARLewylTn+GZp
	Oe7p1agr90x7ZP4tCbhwY6vXRJp8z6Ji3/DmL4QjfnWYzOsJex2nvXCH/J6RDV7VfbUdXKdTF+P
	rG7bEoCy2hDz+0SpZP9pfnUlK9GKQUZBzyXzO+YRX3DQp7YMS/IDN90r2+NKZlZ/Fj7/kuMJxPh
	GtHP7Rm3ON5EYcwUJHY0SSD35n0nxVY+DRtM2a7XA5PqobPMRkTX14yGIBK2V8xZTXlyXQgVUHQ
	vGX4s5Bz86+AaqLfUgLgxkTS0AQD+pGUll3zU=
X-Received: by 2002:a05:620a:46a9:b0:8c8:82cd:1a85 with SMTP id af79cd13be357-8cd634bc781mr792069585a.21.1772815637629;
        Fri, 06 Mar 2026 08:47:17 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:8c8:82cd:1a85 with SMTP id af79cd13be357-8cd634bc781mr792064785a.21.1772815637077;
        Fri, 06 Mar 2026 08:47:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:08 +0200
Subject: [PATCH 02/24] soc: qcom: ubwc: define UBWC 3.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-2-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gyfzpHMr9AFOWazAVx4QmamvMyFfTKzuDUatnY4dW/c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUMU+f4UG0tqZApANYtH8Mt0fedt/MOSLCtl
 Iwy5CVmI3OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDAAKCRCLPIo+Aiko
 1W9AB/9KADo3tGsl2w9+dxT/ofcURJ1iki7kUElQUZx/WuZXjH70ZNU5UC9q9JLLUJQ3/Sw4ThL
 v5QQpfXj6MzIj1C25LcSdfkuiNKwBQbbU/vjWU8INyROJyqK8nTonYR8qMva2dCTb8+l477Vipv
 5K5eJ00VGEPVFtnvV50Cn3nf+kl5bwGNL2HP3Ew3Eq1uqpOzyrlJjAoDexx5DI8JMP/oXvlvmug
 bSRWRWTvkUPgEdD8Pvvg5khu4G48LtbJt5po4zhbPYVIvl3RYxJDVRhNAiVM01ooVKCU0uhtGNX
 MDoR4OXYtLUbLJclvMY4tp+CYYQFpFVQCPXzFUTTUuM5Nc6Y
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX0xiXg+FgnWFZ
 8jIAB7+B4Bzwyrm1ulipOdlHK7E9UiNizr07INTADbAOilicDiJOsARKZ/eOtJhKr8Nm38Z319N
 0mkd+gNb9yMS6U4bon8l2lqY6Sl2cVt4hKtYxPop/BgFTGCIcQqLIurxIRKIqC/kDyqXOJV372l
 Xp3sMtOCIEYjRtvGQsh9OQAbJLgeJlPxTcUXnsZws7iT6/65fmUVXnnt7nrOXlDWd9zRl6IIfX4
 B/4S9M0cLh/n/l5W4gcOCOBSFINijIz38KqbLpLqE+rOgJlO9urpigGUH19l31Lhwm35OQ9wpmj
 IEcEDiJ6WtIKJiAkgvTl2GHNJ+EF+HC96vUd0DhhWSvCUrz4kbfwceqE/usoz5OxMX5o1VK8y84
 P5hNiX/QPyFOTe6cdClh2eMzoxF1Z014gPRP9q+zezX9hnAj2X0CkOPcrMSTYNLRGD4Ul+GMRPb
 tTwV+xcdHgNpJYY/CNA==
X-Proofpoint-ORIG-GUID: 6CHKYGqcXM79jBzdiGImWFRincnW1Lux
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0516 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=o8D1m1ilSIXDguKSM1sA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6CHKYGqcXM79jBzdiGImWFRincnW1Lux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 06F5E225616
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95878-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.933];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Follow the comment for the macrotile_mode and introduce separate
revision for UBWC 3.0 + 8-channel macrotiling mode. It is not used by
the database (since the drivers are not yet changed to handle it yet).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f5d0e2341261..319caed88775 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -50,6 +50,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_1_0 0x10000000
 #define UBWC_2_0 0x20000000
 #define UBWC_3_0 0x30000000
+#define UBWC_3_1 0x30010000 /* UBWC 3.0 + Macrotile mode */
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000

-- 
2.47.3


