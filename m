Return-Path: <linux-arm-msm+bounces-96860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEXZAE74sGkRpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:06:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB6B25C36D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B90EE31B4C65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7D2324B23;
	Wed, 11 Mar 2026 05:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cw8dgU/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoQcjfcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742219DF6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205518; cv=none; b=ChWnnE8LGJteXovRydPJ6gQ/VDbqJKJqoEgI4Se3uRH+DZMpUmucWQWYpORtGgdtjeUfTu3A2AafsMrdHkF/YaEKUi+/CG4aLS4aBXbamBr7fLE5ptWoho07aw9EHgzngan+NybUH/QsS2s/6w4YBaaq7ZofhBPF5sn0iYmMNF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205518; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1FPa84aodrETs+kPan3mn4cfInJz3i1Eno/Amjz/7CHI/GL+qPnxP6DCQpQ4bJEfW3Bld2HVfKBAtWi+YN/qwXrcZSf5DhKIoFpl1f3MFSomaDLKYNLs9a+qQIXFZr2ZgBVOuGwsuoYncpw5YppIj/66x0UWFF07XH0kUVr/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cw8dgU/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoQcjfcr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4jIAP3893001
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=Cw8dgU/8VqrGryvL
	ROfoAi7o0BtD9cPu/JxqMGzzvdEHV0E7+WzY+c1ATCkxmaN9Hm1IK0IUOTCWhg8T
	/9V1iZSa5aSZPxzfJHBRGYgG6516TYVbA1PxeOZ6R/Yj8XvnJHK4J3MrbeH5G/qR
	R5wrSuLtOFEqVOzo14awJcqm2MoDqRKK2WP14ZTedGBhHRNpFHMcpHTEG076pzu8
	9jQoEcGV4sNUDV6g9vp9k6yjHbaDU+3P30ab8dxsT30bgKXSq2kesRB54lNkvV+7
	MuxVp5l7cz+BjDAPjUa9FI/zqNNIOgr+MCgiWaa/gpKpftUHvKSBAfJtcplisPOb
	054Obg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyu5xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:05:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7f6ac239so2100896085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205515; x=1773810315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=IoQcjfcrg/KkRv96nsGYNd4Zn9Km83x6nYwcUNPySEJ3Txp29tzGMwOnK67/SWVCkw
         82SYYN9oEp2nOhpEmNrFM1/ZeZ6Ur6bHkLLJc5CgSsb2L4PHdcWvcKQgkc2Yhuc8Pqie
         qj7wCHzjQRufO0KoA/YbmctwylYL/On0XNDPHMteii6+I5JWuUtCCkA2mO2897QXiVYB
         Zp+U782BYg5vW+9Y+MMi7b1V4aUEjh6lEaJg3nBcHjbxVfTGRsL9jVt748x//aHV06fx
         ctxcDez7QiwBgM7WVlyRsgKJSXRen+e37SUnJOu/mS9Ggmuvn7+3fwv0uZ6eCyCgudfD
         Tk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205515; x=1773810315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=UTe0x7x0CsBeLy4HHyBrAJjd34uOj+vX09LcNFyupZVQNlt3D6lHTeRgagZHkc/3HE
         mvZXvmrBVh/ut7BlcCDq31S3X4i3nBDm0fhCbWpNv1YDyScxtfD9oweRimD68C325g+F
         lOfJmzxmAdzE2BO0AhoRbdfaMWrkPJ2cYPwuU/jrKw3yldTcQpUm0d9gckadiLsoYTX3
         pK7xZhjd4/cOO2RADFNEHfvvpkdNei4yGygQOFXkpDyePyPNib+9LTj8FPso+A4tob9o
         Sg2ikl48NKtanCUpGMvFdQPGK0CkethemJd09lqDVL3a8GT/pPHgssqNCX/74j9yEsPI
         PC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZEK4GD62oS5n7jrJXZKR9+fBBafspY9JQnAlteKQ1q88mRzyQ6pTInJLI4ftLXz3Znj33OfMO/yT/0fmZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxPSUH8jYgoRKrhlc7Od4Xq5M8SDvvGcHJBPvInPN9s6PXnQyGT
	h13Y+uffwbPTQArurGdhnyXegHJuNmlTT5XRd3jKmElps5UUB05xxGx9ATdgG3Gs9wcoxQOXu7c
	yoRWEaCYCAcuPy6C4jTPVfd0FMtUK5+1pzaG/lUymtrFEW9w2gPhBZbbSfQebn52TM9+M
X-Gm-Gg: ATEYQzykwZYn1yDF71TVT6XjS3cVncdPxCcSfQpAxzVQbJy6fokjuemOVYx75Y+GSQr
	ii85uX+frQpQuHo8HssDHQvWm+eb7yds8l7YopXnLK3K+i0YLqyIiujagfvHz2/JS5NprBXBsx3
	kbc1bzIj7DIaWIj00nQuneSrDpffk/6jEKMnfXpjjpQ/trYx8e2dpE2qbq8iK/Gx/9POZrNmkYd
	JLs1nkjNHadTilB3tDwPgUyWin8DFUkDLeqL+N0Qruwhuv+AdKaNz+DCthQKhjTrcEKs8CY/Pia
	Vb/U+OsP1YrFgk8DOtSUi6QT2O0/eY0jfHf2q5tGEjGhn+XGGjMG+zF+EG5yt2bSxPaUKbla+sV
	EXNucCQkXwt5mIhKvuVTHEGRBT+Wfq9g3JPWpPlXkKo73pfr4gJ+DSz0y1s7L4g2HfPDjrdmN/E
	84wGt3LWGBnkiNkKYm1Rix9jL9i/nkx1DFJYE=
X-Received: by 2002:a05:620a:6cc5:b0:8cd:93b7:ebc7 with SMTP id af79cd13be357-8cda1a7cf07mr162642385a.74.1773205515360;
        Tue, 10 Mar 2026 22:05:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:8cd:93b7:ebc7 with SMTP id af79cd13be357-8cda1a7cf07mr162639185a.74.1773205514908;
        Tue, 10 Mar 2026 22:05:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635805bsm199240e87.65.2026.03.10.22.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:05:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 07:05:04 +0200
Subject: [PATCH v3 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-iris-platform-data-v3-3-f02258c4d4ed@oss.qualcomm.com>
References: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
In-Reply-To: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsPgA7umYwsrWqOOHUxQMNNVLL8r+ciaNCqOMM
 Fejqk0mQx+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabD4AAAKCRCLPIo+Aiko
 1bM+CACwuBYrlspEb+mUOghUAeE8Ns+bfgb+Z60SAmQoKek1etvwAf9Cl2VNg4Za8uen15mZQQc
 MuCbuDoRAF6ETWuYcitJp/jTcpBAdf1H9tjpEQQHnUTGlUtnrWQ76stpbax7kkhrc7EnmmiNOCC
 FZQCHlJGSuN37SzixqMfn8t/csHYO+SwoNOGm0Z37MSnRzmy2S13FYD4N25ollfgaGc+AsRln7w
 KAVwV/yDnTAzzYjb1eJkSuu/CoSxMbqXcJKbkRQ22EEpnJerCKl+7XwA0bm94VCY+0xMvtfcQX6
 21rTlO2zUyZhpjbeKsVgGgX30D8oeqsL/Vyzcd2zmFTDwAmG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0f80c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: K6WX5xq2bu9EcTLTNA1NQdwFEhjj9Zrd
X-Proofpoint-ORIG-GUID: K6WX5xq2bu9EcTLTNA1NQdwFEhjj9Zrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MCBTYWx0ZWRfX3CnENj8ztdyb
 thnaf7R+26l93xpY6/MXI3UPAUrE0O5lCaOyZlS1vAs15pc0uqhvUgXteyEaxpiY0pLqJDKV21+
 fnE+nCthRUf98IfbwO2YGGbRpmiljsuze0CHKwlTl0aH9jrVTrG/WZJAhfTX0PncJyhSGIFNxP/
 HBeLffnX3H0exmhTGl0EzZ8CAHLqnqntv6SShHtwuiQL8ewvIJSTRGaCTUc+Hhcg8SNL8PjzhB6
 314jpWZ5dwlNpmLKABZts3eBd29qb3O0AeF41BOJyCI8F8kFWmxOMQ9D5A5UdtE4iJQlH2u0PCx
 C8Z1mMhtKVRhk9L25xhlItln/HVitznomuxgpvu2uFKR/vcdyx6B6L71K3ACjtR3EtMzDYVL3nj
 kDOHWZO6u12kLJJ7xrj8CbOvIuAWFZ1HgwA1enEzXUxAzdP7wbqxG0MKMBHUgFxJN4zs+QjGoXa
 msE1VUDqSzsrY4NsX+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110040
X-Rspamd-Queue-Id: 8BB6B25C36D
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96860-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


