Return-Path: <linux-arm-msm+bounces-107887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MZrFlYMB2porAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:06:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D0554F109
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BFF8305705F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E972480320;
	Fri, 15 May 2026 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atRImTyp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lud0rfCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA347F2F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846377; cv=none; b=PPePjvjUPlYLjVJh43x0mSK5EHMa9g5RFj1p7bbL4Z8AI3AXuYqidyxqo8VExCm7JFdm89xc3KrLYLrnmLrTUxlXr47fMEPue/iSLqdooSj13DpIZsXK0Rovq8hwirN6EhjhfT/Kwnjs6UxWB4vodBJXjw7M1Xf8hFz/Cx7DxpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846377; c=relaxed/simple;
	bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1VkWA0FOA9M0h7KIy31xEi8Ox5P4enHn42+9xQhEcVXTTWVMnwE5/8YLFZJ+29lzWh/ncDnsXnBaliV+DSO+7o7peY72Dfk0zmdpPHqfOwW3VRjUJInAAF1i0+kntZROHsbwxC91zDZY0pyRBDSEcpxLLAUZjZWknethU1OPnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atRImTyp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lud0rfCj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBV5ae3219662
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=; b=atRImTypaWq+vaUC
	aoowq9ZGzAZI1YmvBE8zaMxzwNDLQzNrt0i5FwgSh5jvRBFwTQdmu3eQiqDskwt0
	rCxOQ/Cjhaq4eaJmwifvMRZQci4+xTLG15hqNTYo6C4lXULkuvLeik71yxnvffFb
	3paoRvdT5MpcPn8PLuF5xiMamJXPzG26r+z6rQ1wklfjrQFmBTKUyHTm0bo3DgJZ
	/FoaNUGJZXRQiYV0Pamw6H2dCjHUFKaj2d3RfOnZzPp9QJoNPP8LfWhhqk2vMUHl
	S0A9NRUVS/76H/BOnOSuuxjAhqSWz5VEB3Q4hqVXDAe6UiKVSYlHNdJMN7iJh4Rm
	4Qu6aw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s33wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:59:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0e3ad6so21668061cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846372; x=1779451172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=Lud0rfCjlbxN5JNaluZucclWdIPgZGFqh0ILR6N8iUSGJGirPdA4VADV7f7aL2cXva
         IGQCnrFcwoZ11eppVoKKF6dd7iOPuNNTK1wo8HCgPehI8mu5fID75Qrn2IoWDXIdyoZS
         YLmVvnF1yZI3JlDWs1vTSj8Cv9OSonp4MNGPD+jT9r48ik29bhRkxjMtGok1CBnqkqcp
         dZO0mebmmjInJdlz0L2OB0rxnQptZ1t0419aKutccW4PjHjuDInPmKwc+crIhOE5eq6f
         ZQ0NmDNFhmzXjcrr2begg1wwnZvhYk/eCevK1AxXFAKplGxGj16j+UHcTsCk3kQY7NTv
         W81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846372; x=1779451172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=VMOo/ocCKa4yYTJnTaAtWJVsU8h++YbDHmDGfbYQEKlTRs02m92uSlzFuUethQ9BLo
         XVuhKGWMVqCCCe1sVmZOxbrE1BmciyRAY6z1ignALosKd5odOb3Z6V3kKA1cpId+6fVD
         ruIXvnmt53ZAeJnXDrliuIGV63vSlLMxFiXjUihWgwWVmgnKI7Mb+ORs6uR6LEYGRrYP
         WE/TFWLA0PaaabVwijJIsqerTCktpw97l6KUhNwu5AfcqBsZ33RQM0rKZzpf9ZuY/DHw
         dz440P2abBS2V6Re8TEcMXd9gFZnZ1YZHWv9Cvvv8WruhRtgA4XpWQhoeFX4DE41+Z8+
         Sz9g==
X-Gm-Message-State: AOJu0Yx3SOe/N4hbftxCb5SCVefnTW4qeD65zaRXu6c2ZW9xWyz8hhKT
	oyN7C3NcrNQmZQyBC4fU5NqkXCiiDujq09xBVNKJbnx3209F2qp/jFUp5GRn+A3uleLEewwA4yp
	vbFwC+R8E5Kt6E/85jWYyA9upUPqy8kLREP+SpECMlsDyi6TrpQcc1+07MIrHxmQIiCEUTw9aUg
	N8
X-Gm-Gg: Acq92OHSFgYHlDPkA5MIQhcTJoRp8cksNUNhAURSwNSpK1aY0grtdc4R2IkT7kvrw6z
	5667aOdOEHFjIPWK/H2z8oCLRu1LZL4An/hzRMnP/eRI6zNoq6nG/V/twGsfwHQ8mHkb+bV2Gep
	kEKnOIiM/fwFSrHlbGc0+5HQurgHPAn3BitZ28DfBf6HYonrQTy22iN9FPj3VFD1OXzNOaXLStT
	3IzFf6G8XDv2qRPtmtacoGvEGVKtoLdHGFjqzh4T6ZPG+uqMSeyf3xCc7Q5NNmEBFUzTOesm7t/
	JIRqx+ou7jc881I4SbEQpFKgafo/JLX38WTemznK9am9UhCz3N1kUX51u01C32hhS2pUYxJGUk9
	Xclto36IfOSFRZ0W9wfJ7XcdlyYeNnzGD3+d+9LLfIL2NB25KxZdiHsvgOZFeAYKwPM8kk+ZVjk
	XyAVgvOdvm+D+wuPcIZLt6XK53G1BV2Yh2LteSU31LbEt8zA==
X-Received: by 2002:a05:622a:254:b0:50f:39f4:3a2b with SMTP id d75a77b69052e-51641967867mr97238071cf.41.1778846372549;
        Fri, 15 May 2026 04:59:32 -0700 (PDT)
X-Received: by 2002:a05:622a:254:b0:50f:39f4:3a2b with SMTP id d75a77b69052e-51641967867mr97237671cf.41.1778846372086;
        Fri, 15 May 2026 04:59:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:24 +0300
Subject: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=712;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgPduWkAngFc0G01Tesp7cCgfjcVKboQxbt
 YT21p7aWzCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1cM/B/443v2lMaVWPHvJrTYc1RFnRzV5ivedKaUcEWKFICvi64tyMvfY2S6isJjVmCVGX7b44/u
 l6rbKs6/esUkMEf6BToi3ya3P6EZsmyoGDmD55JIgE0yyHsuc8DrihOKipB/H5lWYAQUmZCDFuy
 X3uIJ9hC0/ifpQJvYsykiN+U8IH4izBvspB/SqoLF8INoQxSqb6xMHbpOZwtmidsgcoItSVtqwk
 94BGZq6tpfCdggzDjGXHaQwQO86zxHJ4BUSN+ix647dZdd+1Sq4P4nCKLf8AZXqq7IUIuYP9WeO
 pYsmv/gCtOHZa4Fi0sr5CtUmPgd1Sfj/oi7vvMpmpuUTqNqA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfXzj24z78PWg8Q
 FyqgQROkQxl0lzXk428yaB9/Y7jvsnRm5AKkXJq74rLS0+Yb5LTvgudAEH24GTf6+QDJG7zaTca
 u/Vv+g1fc4nqqdMmzu24YrGYxwd0JY4XzGl0uL2eUThFnPyolywSxxmXa0CNB7/BmFQl1YB6z2l
 JUJm64zptoD8EBeqHI2XZOWTRKoqCmxuGEPnjCiJXkyy9OZuM2lYvk4lIVST/yN3MIPOvT92CHU
 78RP74kxp/15oJ03jcsfVcBsLt/6bq09k0OZVvFR0YbU8S1IevCl30FKgRwGUY5TN0mbmd/458U
 lOSR9p34+vbwl8xXCnwMzrWu75tlhipGKQJDMwzgt/6Vw6RGk3FUff1ilF4nQPGfT/iaxkn6s0r
 i4z+UyyYkt75PZRJMbg7fkroGLKUZpQRd+Qd4dcQLpSXKPaRoKl4a6eY3cN8Bstfvrfqtda1WpK
 3NFUTJK/vHYT1cg2/oA==
X-Proofpoint-GUID: ChZLfQTOlswF1cZKb0YmluDrWx1moCsl
X-Proofpoint-ORIG-GUID: ChZLfQTOlswF1cZKb0YmluDrWx1moCsl
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a070aa7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KOvF56qbc03BBMn0VcwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150120
X-Rspamd-Queue-Id: 33D0554F109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107887-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
the video GDSC to HW and SW control modes at runtime. This requires domain
to have the HW_CTRL_TRIGGER flag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6115.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 4c3804701e24..c5251aff9886 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
 	.pd = {
 		.name = "gcc_vcodec0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.47.3


