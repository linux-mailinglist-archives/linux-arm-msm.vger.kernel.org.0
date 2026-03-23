Return-Path: <linux-arm-msm+bounces-99374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEjTK/WNwWlxTwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:01:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F7B2FBC51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A9223004256
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A697E3B8BCB;
	Mon, 23 Mar 2026 18:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgNJqjkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fs26a6Hp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7A3BADA5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292253; cv=none; b=iR2L5QqU5FjoUv9iq0XZvG+4L+C+a7N0DZ2+EzPtRJH0CGZmDFFvzl5ViCCa5ALyujO1uL34E8EIbE0zcPlQQISnEnJHx/YfnKOJdsXr1dajmdFlPpiYTuqREr114H/POK8bCjHW4/ryjwh/VJ0Au54IannhKzeRSqPxJA9lPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292253; c=relaxed/simple;
	bh=YIoyIkVaoaUoV2FTkMeaWmXxqBmbuBRXVvsCH5NnV6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KGb7spU7LG0Bw7GlTq01FmmZ2h7TuoRyysA1l9PWmCvYS9/vMU8vuMdb7Ync9E4hZjw7NwXb3HmA4To21T7J2nXVtUM4OOlOamIRxuVs5pV70qoxNGXa4Mg394caHZxVN6hbMJvVqREk9jtjk7WClgafq9539Vw6hkQz7r3Ndm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgNJqjkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fs26a6Hp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWES943509
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ATZzeJBUYpquLoiAbjDKWU
	HjLxOItOb86qPNeKlW76Q=; b=RgNJqjkAme0A1/0xJtZPcm8NJf851qzALtGMf8
	kyLMTJlX2AduDswggXVxZZ2n2NxL3ton2EGZJ81MbSt2/SZvgZiKW0/g6rXvTBLL
	hSHleaWbcFtlP10V1yYcuxyKvyhvZRQUOD0VFGm3qxrknW8vtysLh+6KGCQN6wNv
	9obaec7Umdmh+dyE368X31D5z4STRdywuVZaDYY5ofF2as0vT128cqtLb0lFHVc+
	7a5vodXowGc6pQBoW+34dRMI+hsklhcbjqNcsrh2xOkLMCFHb1+dc/Q6YcDNdBt+
	6Z3YYMn7p2GR8rxmqf9K4PFm1O0RcVEmFYTucug/Y+onlq1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkshmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:57:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so74831951cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774292244; x=1774897044; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATZzeJBUYpquLoiAbjDKWUHjLxOItOb86qPNeKlW76Q=;
        b=fs26a6Hp2IDslCSFtudIrS4ZInSWG4Mch5/02n6CK1Tre6jnFJt1QeRKhyiB5CyK/4
         BA1skSL8mVZ9JYUObJdqDIP+tCDiz7yEFr29+Lfr2Iz3K4jxmCzpzCeCJleOPguy2TFN
         u0NxhwV+s5K0uMIOV0X+x1nekFru6SFo9yTGfxv6d6Am7SrnC6ublTj8xiemD2C0ExQx
         rdA9a88OajGR3TJoM7xSVZx/dbwJuZAb+zw9nCwQ3sPQ/PneO0awol1AzHilp6lxL0yY
         al0nVuD2lBg1yvM7I4jTupYkeuclU/o0eunudtktTi85DQe2D5x91t6UnkpjM7ms05CV
         +rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292244; x=1774897044;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATZzeJBUYpquLoiAbjDKWUHjLxOItOb86qPNeKlW76Q=;
        b=Fg5GVuB/3k8DzC8QZonIFm30p6LLwqpWRExLlFLlMUwPWXJMeL7gwMEBosrXI7DfTh
         i+ve93bUsQFHdaqtHtNZKi0+2HaQ97PedoAg9qpeUXtTcauRGZ1VCy4t4/3cty+dujNe
         tD1c2srPBL0k1kUuxhE8YqEcs7Gxzs11yvqryU53MMZnFpEjDeXYnji3Ur0g5SosIqKm
         FV2h9BtMVYV+aU9M+IJc4MLK49qaBEB7WxfTH5iSnh1N0JTaCEjj9mQIOVQdmUeOS7MA
         hC2pPg/Pn0jftBB8vtuGHjH6dTcMW4ZWHRn1Awfhyl9G4KKPaEe/6G6CzPJWj1AisjDk
         eb8w==
X-Gm-Message-State: AOJu0YwisVb8hWiJosNmQKnTEyhrFev03NXcbhOo3xtzD6VohOtSen81
	suOMPu/2A9G/OI/CpqSkhYFs7IqI5/5FvZ3bF+uEERNd5uTzwOVCj5qffm/p1/e1Y/vkXEFGtWl
	ei9GYUBcJP85N9vZN7DigYuhXT8eQBIS1nAIrPNl0biOsWIampaM74m1ykIay+7SyrjRp
X-Gm-Gg: ATEYQzyp00HrrvjlZHCjHHUKDa7IRrLzyGs3JnRjvkTJ/5E0prldD+Z5CwKqXFjDU3Q
	Yue0qwFvixF/vr6EgRUccj2Ev7Y21yEd2uM+aok2yU2+rreBlTGO4AjbPGImQ+CJE6rkl2ZNTjA
	oxxfhD3O7Z4fN5AJ9tDHzsuAPZlagZeq0eErYxumuUTz9z4rJmYmL3zzl66wTU93CRWy3VcYyV6
	RXuRc7bb0pcVJ8tjZ17HoZXQhfmMVgJHCwf8kjV84Ob00MR3EIIIXF+nE3B6L+5FCe0sbi86jPp
	6Vo7CgGPw2d5R9xTGJv25wwr5WmEDJsiVxjZo3ly1WVMVphIRy5gTxKl8tSgMtkKOmG9oiWgtDt
	hjqBTP1Q+sc2QRh83PUWYc1GzB78=
X-Received: by 2002:a05:622a:188c:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50b41b7df83mr164021931cf.47.1774292244319;
        Mon, 23 Mar 2026 11:57:24 -0700 (PDT)
X-Received: by 2002:a05:622a:188c:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50b41b7df83mr164021501cf.47.1774292243701;
        Mon, 23 Mar 2026 11:57:23 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff118bb4sm142767345e9.2.2026.03.23.11.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:57:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 20:57:12 +0200
Subject: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS AXI
 PHY clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAeNwWkC/yXNQQ6CMBBG4auQWTtJLcaIVzEuavkLY6QlHTAo4
 e5WXX6b91ZSZIHSuVop4ykqKRbsdxX53sUOLG0xWWOPprY14yFvx533rJh4DspuER77V0jZgwc
 M7FMGp8gWoWlOB7TGWirBMSPI8ptdrn/rfLvDT98DbdsHnv60d44AAAA=
X-Change-ID: 20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-2ef9984ed022
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YIoyIkVaoaUoV2FTkMeaWmXxqBmbuBRXVvsCH5NnV6k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwY0Laop/FSLcoOTziLro+quD73QHP6E7ClKXK
 xKsF69K+m+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacGNCwAKCRAbX0TJAJUV
 VlqjD/96Ha77YWtd3fWkQMMFypaN/vAL3o0hMNEfipvG9vpbX5xnEOGY1jU2srdE8j8yrGmNrpj
 O2vh3Sq3QN0e3JpVDdicTw5hjO8st5yFzC/HEDU0HEsDkEZQe+LZSyp1LQf9m0gazWyLATE2lW/
 AV/FZsQCOO5rL9PkauwijGcY9ZfhJs2v33RDVDeR6/kaidrOmThwDJvuC88jxylC3Zb6VY4neYB
 VpllF5SK+1kC5BSad3D/dEhrzhamSgIM5S3TmZwdvKPNQ8UMhwRLJ6Gz6jULVP9351WVKJrouEX
 MWkWP9uR4ND0apx1LNFH48ytgoN6GXKVIzxtOIyZuc4rQ8NMs5uu9Zf/PT70SQJ1oaTt5sQmoaQ
 ERW3NkMFsvuv68KGen6khTjBb0hfvSaE5d0gfSh6tAcurGHnGeL5/bRGjMjwZI1Qw0TAQ2CMp99
 Z1bOvol6Hg676TFJ10ckKE5PcHobvHn7XKeXi1Rq58eEbR82V/KM8PgrT00+1QbXb+Zh4W95Rcq
 gfkmZKmbhGZT7wuGqUrPtQQUVbkWeROOad7EF0/RdBrP8hiPHVJt51if5ZDYHBmhslnlx5TAJmQ
 e2hRyb17rNyuId3CS1WEhnGmXWndKA/vlcSXz6jeXcV7qo6RAQnHCTujxolfvCNgRlXJX1iSFnV
 7Ws1lEy6hzr7vfQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MCBTYWx0ZWRfX57vd6LP24lEG
 l1wSuM9fN+3yTMw9uHWVPBW/xXDQE5Sx1pDU7WRGbcCukvYxWYuK0sTiBNQ2S8nqhjIAU6LfDsK
 jH4NtN1Ki935oMDpGPGsaXG4XJ3UD5GX/LT6Nn/Hzo1tpyeNG/mzfJjUom54xa62MgH1JQnIAUY
 bMdO45+x3ZrvmlBT6dIa5gR2MXhXY8A/VAeXqHj3b0S/EnzuvHpEz4TeDENNixuoeQblH8K6fmB
 rBjkdYEXVAuUB+kaMyFUyndhuWl/o29rTabGhFo2asozEcBU2YoCoE9sSqWP9Mri2i+/ShozKXd
 3DpykK7Uyuqf4Js5H8aoYkUi4GRR1t1GSjek/3/eUBPWMarVa8KG+GXYPmr5QBq1RSwJSA04mht
 PAlykdCKBvVrYyn4C/Gq6TcFhqr6Tluu8oKOD/NZdvKLKem6dr1PbdUgLf1yp45GFtTxqDnipVZ
 CsZEGzm7sH1Yz5oJjMA==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c18d15 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1x43R7CGnGBew8IKhpYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VHiGchCXvN93ve_UMdx5UqguOIrfvoB9
X-Proofpoint-ORIG-GUID: VHiGchCXvN93ve_UMdx5UqguOIrfvoB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230140
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
	TAGGED_FROM(0.00)[bounces-99374-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06F7B2FBC51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to internal documentation, the UFS AXI PHY clock requires
FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
the UFS controller fails when operating in MCQ mode, which is already
enabled in the device tree.

The UFS PHY ICE core clock already has this bit set, so apply the same
configuration to the UFS PHY AXI clock.

Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 06ee1469badd..338494385752 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3046,8 +3046,9 @@ static const struct regmap_config gcc_eliza_regmap_config = {
 
 static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
 {
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
 }
 
 static struct qcom_cc_driver_data gcc_eliza_driver_data = {

---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-2ef9984ed022

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


