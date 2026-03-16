Return-Path: <linux-arm-msm+bounces-98018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCmzJ+FSuGmKcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:58:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB6B29F661
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7472307D7FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945263E9F93;
	Mon, 16 Mar 2026 18:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb7VeBTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfvLSEqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA13E9F86
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687299; cv=none; b=eK7zE/YEI+iux4nRmPoDl67jOtO2R549iN51B9Qyqe2oND8cTLulN0Vla7p5vPd64iU1jpF10mwEZtMzFiEvZDFaX62Dxoq0EueVadGBPthuG+/bsp+woy81OXQeduywY/lbT147vYVcE4oFHQ3OUfsSB6mNUr5yJ5lLmsGVc/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687299; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyXQCn6qW34rzwbMG4JY6e/JddgPGedkz3VBmdft6up6iEy/xBsFsVwb7d2qoeeZa6FB2znHAoTSyc3WFQGUeVDZlBXrYjto9NIzDNL3lug5gVUGappAMvzYjM2j7WjugCAW6QkZy+TcyEbDcBwA9PmtFZ1hBYZvmMW2S/6RwRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb7VeBTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfvLSEqH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GCX9l01621677
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=bb7VeBTtbvdYiwQG
	y0P8ywxEMOyyx3JeYxcy5RRhF5bmWA1K1J4izRmBS117uBEiXUobx9CuzB9sLbys
	QZK5/WEvtpahNK12phHchngWyAnjOsv/74xpJEmnqFbNEj/e5wVmVepIhbO92Dde
	ecnJVCitFotLsTSPehF/wyoIpmFHx94dgGV+g/DR/QYbvC0UDX4/DmMPaqHXZCKU
	tECHjINEWH52gjwRmhKhA0YXvOFyQR7PbYqFK2hDDSvfsSRt5P5qmnwsrhNXLVx3
	c7IYTxcqOx9c8RyQg2xrnWYCCT9zSdKmD5t32KTQtsbIlCLW/Z2spyst+UQwJdYK
	U/qdyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyehdne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:54:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84943c76so18579285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687293; x=1774292093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=jfvLSEqHKwYTcoL5Da24FiFg+SmYWI4gk7mArz6qzfv0p4Oa6g1lOGl72QEBZn9u3W
         qOmFfkTe4O4bDpmqflf56B5KR4gek2GDSq1x1wHHQDed/sw08omOj/cTmrlYywOJH53b
         43smUARPN6JS53vspETdS8IDjiyvWKMUMcbDD31wklIWagVPRXb2Fwox5WmkEu2oN8kP
         76GGw2EfviPL+erWOCT75/qAf5YT63DVpUW0S4l+VamwZd8D2WUZZuFh1ClzGEQg4Sjf
         GCAzJuUiyeXkGTMmUa0tIG03CmTZiG6WlK/9wIxNxGIHV2XfznMe11trCKRrvI55bm3q
         s04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687293; x=1774292093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=UglvL17KtPMVsjXjlGoai6VxObv0F1G8LxoHyObXsg39SHnc+z1vXqb6xIvcdEGinM
         Fw4IMtgeBBSzBYVDLLtSkRDnyvfGA8aeJTN1mxdzBs5gCB3r+/NeGkQ18++MwThtpoim
         nD8a6XUY2QFBPkG493m8tnb50EvLKjnPegiAqv4cjYLYZddFjF+cXrPNzox7ZCSIKh0s
         /Px4khxqfsKvoz76ZqUCTHQJKZAa0krtKGlIrcB6pwesarMZQnnPmmVFJ3Un3HOlrH4A
         yQ9Yl9GURUlJmFHXSUytD/svGALlEc/ry4pFQPeBNy+XEcLE6R9L56gr6p8DlQnwFN7v
         WyWw==
X-Forwarded-Encrypted: i=1; AJvYcCWYZkj+QOr4ytofB/FG28h+zi+rkOY30s67SoK4+wAPgSPM9kRLkPy42TxlYYtJhrwcP97TvKOvrMrnV1cS@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZwJpBh1HIjVJMEYesuBJaOppBVW7ZVg0UXARKL7j2RZyMyoc
	ZjvZUVdZ9TNjWDcdWisu/IxNAo9pd9B1UjIhgjif+qYcuu8t/AgvFkw6jkA80gJX9wUjG8gjkch
	ImA7H/i2mOgvtm9P0n71ea5cQky+xWtqREDg79l7liHvkGhj6AYMVYlLyz4qhPW69Vfom
X-Gm-Gg: ATEYQzw0kojEhQ+v5GN1GKEs+WQp9xDqA9+1nVaR5zdhot+aH7VDHhDIdZx9wVb18nt
	V+0mopyOTM5VRYqBjiEQvl4CQlZe1rFr9b5yV2E5ET5/cbHRK0iKJkux9bN+PYR92T88WNlW4Nr
	UrwkH55V6/hj81zYNAkc10Ofn6doYfdAS0XNvVcOVY+50zBslyO19jZx+ItKN3OWyx1/qjCjT4P
	Sul8z5MLUNA40Lrk5uy1mKyPGWL1z2F997BqjfLhYIu0d8Cgw8VXIB+Yu9tYJC/TNvu93jJyLmJ
	f8XOtWgiCg0cmqoRWi7yh3wbNcoTrUKzGe5KA6JRgjY0MFMm5mdZEQbTFe3YS6T+zddn08zqmRX
	k4xpPf1Lp2uKrfTKKxT7R65tp6jW16zgQSkMP2F9lsu8yqviiQSD1lLp/9oAzzb92szZFrZvqjy
	7AYtRfsv+cjEe6R1IGUitjaOvWvdw840qV8Os=
X-Received: by 2002:a05:620a:2806:b0:8cd:911e:2c2f with SMTP id af79cd13be357-8cde1512c13mr90739285a.30.1773687293360;
        Mon, 16 Mar 2026 11:54:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:8cd:911e:2c2f with SMTP id af79cd13be357-8cde1512c13mr90736085a.30.1773687292886;
        Mon, 16 Mar 2026 11:54:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm34108041fa.33.2026.03.16.11.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:54:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 20:54:41 +0200
Subject: [PATCH v7 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-iris-platform-data-v7-3-fc79f003f51c@oss.qualcomm.com>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpuFH0hE8FuvPwz6kFHButCXjUmHUg/mEtu0nAM
 dT8SqMWycyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabhR9AAKCRCLPIo+Aiko
 1fljCACnZ9Sk2vmfjDzxTbXWy8y6bOII63ImmkPL4xhB9UP1/yRD7xlFLEGW2wCFPq6qelDiMUn
 li6wqAY9BwGTPfGbIOI8ljjsXcLNlFBFA+LMokLtNTt7j2XxyUrzDM57Fq/XnS4bqqWPJ6334Ao
 +E7ps7OYi3UO8+BXQ+Q70wxK+sESJdK8t8rO3Ey+HsKBU/+QJcnUsGkm55GY8nl4PpiAx7SE6Uu
 zYhvDy24uC4xJzaM64b67TiSWYUFEtPUTtKBNk8F2AlDSxBO51vPuX09RghR9V8jCCQd90pfE7I
 /bHcn47EZdBUBSUh/YVs0Tmfa1w3mk7+DA7i/OXOFsISIZxN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: YrDiVFww2g7uI-wdXuFswB10CS8FcyXn
X-Proofpoint-ORIG-GUID: YrDiVFww2g7uI-wdXuFswB10CS8FcyXn
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b851fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MCBTYWx0ZWRfXws4ignbrLyvt
 gWZUvPJb92NIAvggL7mGzT0uQpnpzydd7s4AvsRAKmc276HHPnO0qUNOiz9TK2CEO/L5HmIEMoc
 Ut+X1Bl8LW0waGprz+l+pid3cU0tvVHZYyqmc/LCrnsMhPKA5NrM9scY1FP11LJcD286oNQVljl
 r6F3Zr5KNCXoLn+FhU7nY/3BxOhQvJJ+uC4zFXKFQN9gon7IMisr/vCZ3vQtaxJOmH8dVrCHaqy
 QzNRZAgg4Z3Z8c/MXsSkHX8+hNX9c1uuZNdu1q/ye/3qo+MeqC3RGGh6/TjQf2CzPIvVAOgyQE8
 c8MB32vdPfWq1/YyRdnztzi6cpfkKkbW1qljFL2gPuoCPqGN2kYPfoPEitfoDY33IXyYFpy9sU7
 wvrrBIcnX3jVu8lvK9vuJOIUiR6PVnIdO1lEoCfwk4rDc7OxW8Pr87D0S7FrEpbo2b9/EHWZzNh
 fBORwQoJBACLGynQMCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160150
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98018-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3FB6B29F661
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..e4f25b7f5d04 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1205,7 +1205,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1220,12 +1220,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
 				NUM_COMV_AV1 : caps->num_comv;
 
-	return core->hfi_ops->session_set_property(inst,
-						   HFI_PROP_COMV_BUFFER_COUNT,
-						   HFI_HOST_FLAGS_NONE,
-						   HFI_PORT_BITSTREAM,
-						   HFI_PAYLOAD_U32,
-						   &num_comv, sizeof(u32));
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_COMV_BUFFER_COUNT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &num_comv, sizeof(u32));
 }
 
 static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
@@ -1257,7 +1257,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


